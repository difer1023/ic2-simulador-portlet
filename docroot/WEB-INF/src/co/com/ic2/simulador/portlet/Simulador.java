package co.com.ic2.simulador.portlet;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import co.com.ic2.colciencias.gruplac.ClasificacionGrupo;
import co.com.ic2.colciencias.object.Usuario;
import co.com.ic2.colciencias.utilidades.properties.ParametrosProperties;
import co.com.ic2.facade.GrupoInvestigacionFacade;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

/**
 * Portlet implementation class Simulador
 */
public class Simulador extends GenericPortlet {

    public void init() {
        viewTemplate = getInitParameter("view-template");
    }

    public void doView(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

    	ParametrosProperties.getInstance().limpiarParametros();
    	
    	GrupoInvestigacionFacade facade = new GrupoInvestigacionFacade();
    	
    	
    	
    	PortletSession portletSession = renderRequest.getPortletSession();
    	Usuario usuario=(Usuario) portletSession.getAttribute("usuario",PortletSession.APPLICATION_SCOPE);
    	System.out.println(usuario.getClasificacionGrupo().getProductos());
    	ClasificacionGrupo clasificacionGrupo=usuario.getClasificacionGrupo();
    	String tiposProductos=facade.consultarTiposProductosInvestigacion();
    	_log.info(tiposProductos);
    	
    	renderRequest.setAttribute("tiposProductos", tiposProductos);
    	renderRequest.setAttribute("clasificacionGrupo", clasificacionGrupo);
//    	renderRequest.setAttribute("productosGrupo", productosGrupo);
    	
        include(viewTemplate, renderRequest, renderResponse);
    }

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            _log.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }
 
    protected String viewTemplate;

    private static Log _log = LogFactoryUtil.getLog(Simulador.class);

}
