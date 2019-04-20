package co.com.ic2.simulador.portlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import co.com.ic2.colciencias.gruplac.ClasificacionGrupo;
import co.com.ic2.colciencias.utilidades.properties.ParametrosProperties;
import co.com.ic2.facade.GrupoInvestigacionFacade;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;

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
    	User user = null;
		try {
			user = PortalUtil.getUser(renderRequest);
    	ParametrosProperties.getInstance().limpiarParametros();
    	
    	GrupoInvestigacionFacade facade = new GrupoInvestigacionFacade();
    	PortletSession portletSession = renderRequest.getPortletSession();
    	ClasificacionGrupo clasificacionGrupo=(ClasificacionGrupo) portletSession.getAttribute("clasificacionGrupoInvestigacion",PortletSession.APPLICATION_SCOPE);
    	LOGGER.info(clasificacionGrupo.getProductos());
    	String tiposProductos=facade.consultarTiposProductosInvestigacion();
    	LOGGER.info(tiposProductos);
    	
    	renderRequest.setAttribute("tiposProductos", tiposProductos);
    	renderRequest.setAttribute("clasificacionGrupo", clasificacionGrupo);
    	renderRequest.setAttribute("recomendacion", user.getExpandoBridge().getAttribute("recomendacion"));
		} catch (PortalException | SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        include(viewTemplate, renderRequest, renderResponse);
    }
    
    @Override
    public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
    		throws PortletException, IOException {
    	if(ParamUtil.getString(resourceRequest,"operacion").equals("simular")){
	    	String productosGrupo=ParamUtil.getString(resourceRequest,"productos");
	    	String perfilesColaboracion=ParamUtil.getString(resourceRequest,"colaboracion");
	    	LOGGER.info(ParamUtil.getString(resourceRequest,"productos"));
	    	LOGGER.info(ParamUtil.getString(resourceRequest,"colaboracion"));
	    	GrupoInvestigacionFacade facade = new GrupoInvestigacionFacade();
	    	
	    	PortletSession portletSession = resourceRequest.getPortletSession();
	    	ClasificacionGrupo clasificacionGrupoSesion=(ClasificacionGrupo) portletSession.getAttribute("clasificacionGrupoInvestigacion",PortletSession.APPLICATION_SCOPE);
	    	
	    	ClasificacionGrupo clasificacionGrupo=facade.clasificarGrupoInvestigacion(productosGrupo, perfilesColaboracion, String.valueOf(clasificacionGrupoSesion.getAnoCreacion()));
	//    	clasificacionGrupo.setProductos("2");
	    	String jsonClasificacion=JSONFactoryUtil.serialize(clasificacionGrupo);
	    	LOGGER.info(jsonClasificacion);
	    	PrintWriter writer = resourceResponse.getWriter();
	    	writer.write(jsonClasificacion);
    	}
    	if(ParamUtil.getString(resourceRequest,"operacion").equals("guardarRecomendacion")){
    		User user = null;
    		try {
    			user = PortalUtil.getUser(resourceRequest);
	    		LOGGER.info(ParamUtil.getString(resourceRequest,"meta"));
	    		user.getExpandoBridge().setAttribute("Meta", ParamUtil.getString(resourceRequest,"meta"));
	    		resourceResponse.getWriter().write("200");
    		} catch (PortalException | SystemException e) {
    			e.printStackTrace();
    		}
    	}
    }

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            LOGGER.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }
 
    protected String viewTemplate;

    private static Log LOGGER = LogFactoryUtil.getLog(Simulador.class);

}
