<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>
<%@page import="co.com.ic2.colciencias.gruplac.ClasificacionGrupo" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<portlet:resourceURL var="resourceURL"></portlet:resourceURL>

<%String tiposProductos=(String) request.getAttribute("tiposProductos");
ClasificacionGrupo clasificacionGrupo=(ClasificacionGrupo) request.getAttribute("clasificacionGrupo");
String recomendacion=(String) request.getAttribute("recomendacion");
%>
<style>
<!--

-->
.row {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display:         flex;
  flex-wrap: wrap;
}
.row > [class*='col-'] {
  display: flex;
  flex-direction: column;
}
.centered{
	text-align:center;
}
.widget-title{
	display: inline-block;
    font-size: 30px;
    color: #f39c12;
    background: #fff;
    border-radius: 46px;
    padding: 6px 9px;
    margin-top: 12px;
}
.clasificacion .nav.nav-stacked li{
	width:100%;
}
.clasificacion .nav.nav-stacked li a{
    padding: 4px;
}
.fixed{
	position: fixed;
    top: 0;
    z-index: 12;
}
.clasificacion{
	margin-bottom: 16px;
}

</style>
<section class="">
	  <div class="row clasificacion" style="">
			<div>
				<div id="clasificacion" style="">
					<div class="row">
						<div class=" col-md-2 bg-yellow centered">
							<div>
								<span class="widget-title" id="clasificacionGrupo"><%=clasificacionGrupo.getClasificacionGrupo()%></span>
							</div>
	
							<h3 class="widget-user-username">Clasificacion</h3>
						</div>
						<div class="col-md-10 box-footer">
							<div class="row">
								<div class="col-md-6">
									<ul class="nav nav-stacked">
										<li><a href="#"><span>Indicador grupo</span> <span
												class="pull-right badge bg-blue" id="indicadorGrupo"><%=clasificacionGrupo.getIndicadorGrupo()%></span></a></li>
										<li><a href="#"><span>Indicador TOP</span> <span
												class="pull-right badge bg-aqua" id="indicadorTOP"><%=clasificacionGrupo.getIndicadorTop()%></span></a></li>
										<li><a href="#"><span>Indicador productos A</span><span
												class="pull-right badge bg-green" id="indicadorA"><%=clasificacionGrupo.getIndicadorA()%></span></a></li>
										<li><a href="#"><span>Indicador productos B</span> <span
												class="pull-right badge bg-red" id="indicadorB"><%=clasificacionGrupo.getIndicadorB()%></span></a></li>
										<li><a href="#"><span>Indicador colaboracion</span> <span
												class="pull-right badge bg-aqua" id="indicadorColaboracion"><%=clasificacionGrupo.getIndicadorColaboracion()%></span></a></li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="nav nav-stacked">
										<li><a href="#"><span>Indicador productos
													apropiacion conocimiento</span><span
												class="pull-right badge bg-green" id="indicadorASC"><%=clasificacionGrupo.getIndicadorApropiacionConocimiento()%></span></a></li>
										<li><a href="#"><span>Indicador productos
													formacion rec humano A</span> <span
												class="pull-right badge bg-red" id="indicadorFRHA"><%=clasificacionGrupo.getIndicadorFormacionRecursoHumanoA()%></span></a></li>
										<li><a href="#"><span>Indicador productos
													formacion rec humano B</span> <span
												class="pull-right badge bg-yellow" id="indicadorFRHB"><%=clasificacionGrupo.getIndicadorFormacionRecursoHumanoB()%></span></a></li>
										<li><a href="#"><span>Indicador cohesion</span> <span
												class="pull-right badge bg-blue" id="indicadorCohesion"><%=clasificacionGrupo.getIndicadorCohesion()%></span></a></li>
										<li>
											<button type="button" class="btn btn-block btn-warning btn-xs" onclick="cargarRecomendacion()">Cargar recomendacion</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
      <div class="row" style="">
      	<div class="">
      		<div class="row">
		        <!-- left column -->
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos TOP</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosA1">
		<!--                 <div class="form-group"> -->
		<!--                   <label for="exampleInputEmail1">Email address</label> -->
		<!--                   <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"> -->
		<!--                 </div> -->
		                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos A</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosA">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos B</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosB">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos apropiacion social de conocimiento</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosASC">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos formacion recurso humano A</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosFRH_A">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Productos formacion recurso humano B</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosFRH_B">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Cohesion y colaboracion</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body">
		              	<div class="form-group">
		              		<label>Integrantes grupo</label>
		              		<input type="text" class="form-control" id="integrantesGrupo">
		              	</div>
		              	<div class="form-group">
		              		<label>Grupos colaboracion</label>
		              		<input type="text" class="form-control" id="gruposColaboracion">
		              	</div>                 
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		    </div>
	    </div>
		
	</div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var productos=JSON.parse('<%=tiposProductos%>');
var productosGrupo=JSON.parse('<%=clasificacionGrupo.getProductos()%>');
var recomendacion='<%=recomendacion%>';
var productosA1=productos.filter(producto => producto.c_tipo_produccion==="A1");
var productosA=productos.filter(producto => producto.c_tipo_produccion==="A");
var productosB=productos.filter(producto => producto.c_tipo_produccion==="B");
var productosASC=productos.filter(producto => producto.c_tipo_produccion==="ASC");
var productosFRH_A=productos.filter(producto => producto.c_tipo_produccion==="FRH_A");
var productosFRH_B=productos.filter(producto => producto.c_tipo_produccion==="FRH_B");

var productosColaboracion=productos.filter(producto => producto.c_area_conocimiento==="GNC" || producto.c_area_conocimiento==="DTI");

llenarSeccion(productosA1,$('#productosA1'));
llenarSeccion(productosA,$('#productosA'));
llenarSeccion(productosB,$('#productosB'));
llenarSeccion(productosASC,$('#productosASC'));
llenarSeccion(productosFRH_A,$('#productosFRH_A'));
llenarSeccion(productosFRH_B,$('#productosFRH_B'));

function llenarSeccion(productosSeccion,elemento){
	productosSeccion.forEach(function(producto){
		var item=$('<div>',{class:'form-group'});
		item.append('<label>'+producto.n_nombre+'</label>');
		item.append($('<input>',{class:'form-control input-producto',type:'text',id:producto.k_codigo}));
		elemento.append(item);
		var productBar=$('<div>',{class:'progress lg',id:'progress-'+producto.k_codigo});
		elemento.append(productBar);
	});
}

if(productosGrupo){
	productosGrupo.forEach(function(productoGrupo){
		$('#'+productoGrupo.c_categoria).val(productoGrupo.i_num_productos);
	});
}

function llenarBarras(){
	$('.input-producto').each(function(i,inputProducto){
		var producto=buscarProducto(productosGrupo,inputProducto.id)[0];
		var numProductosGrupo=producto?producto.i_num_productos:0;
		var valorInput=inputProducto.value!==""?inputProducto.value:0;
		var valorSimulacion=valorInput-numProductosGrupo;
		$('#progress-'+inputProducto.id).html('');
		$('#progress-'+inputProducto.id).append('<div class="progress-bar progress-bar-green" style="width: '+((numProductosGrupo*100)/valorInput)+'%">'+numProductosGrupo+'</div>');
		if(valorSimulacion!==0){
		$('#progress-'+inputProducto.id).append('<div class="progress-bar progress-bar-yellow" style="width: '+((valorSimulacion*100)/valorInput)+'%">'+valorSimulacion+'</div>');
		}
		});
}
function llenarCohesionColaboracion(){
	var colaboracion=0;
	productosColaboracion.forEach(function(productoColaboracion){
		if($('#'+productoColaboracion.k_codigo).val()!==""){
			colaboracion+=parseInt($('#'+productoColaboracion.k_codigo).val());
		}
	});
	$("#integrantesGrupo").val(colaboracion+1);
	$("#gruposColaboracion").val(colaboracion+1);
}

function buscarProducto(productosFiltro,busqueda){
	return productosFiltro.filter(producto => producto.c_categoria===busqueda);
}

$(document).ready(function(){
	llenarBarras();
	llenarCohesionColaboracion();
	$(".input-producto").keyup(function(){
		llenarBarras();
		llenarCohesionColaboracion();
		ejecutarSimulacion();
	});
});

window.onscroll=function(){
	var scroll = window.scrollY;
	var elementY = document.getElementById("clasificacion").getBoundingClientRect().y;
	
	if(scroll <= elementY){
		$("#clasificacion").removeClass("fixed");
	}else{
		$("#clasificacion").addClass("fixed");
	}
	};
	
function ejecutarSimulacion(){
	var productosSimulacion=[];
	$(".input-producto").each(function(i,inputProducto){
		if(inputProducto.value!==""){
		productosSimulacion.push({c_categoria:inputProducto.id,
			i_num_productos:parseInt(inputProducto.value)});
		}
	});
	
	console.log(JSON.stringify(productosSimulacion));
	
	$.ajax({
		url: '<%=resourceURL%>',
		data:{'<portlet:namespace/>productos':JSON.stringify(productosSimulacion),
			'<portlet:namespace/>colaboracion':'[{"i_integrantes_grupo":"'+$("#integrantesGrupo").val()+'","i_grupos_colaboracion":"'+$("#gruposColaboracion").val()+'"}]'},
		type:'POST',
		dataType:'json',
		success: function(respuesta) {
			console.log(respuesta);
			if(respuesta){
				$("#clasificacionGrupo").html(respuesta.clasificacionGrupo);
				$("#indicadorGrupo").html(respuesta.indicadorGrupo);
				$("#indicadorTOP").html(respuesta.indicadorTop);
				$("#indicadorA").html(respuesta.indicadorA);
				$("#indicadorB").html(respuesta.indicadorB);
				$("#indicadorASC").html(respuesta.indicadorApropiacionConocimiento);
				$("#indicadorFRHA").html(respuesta.indicadorFormacionRecursoHumanoA);
				$("#indicadorFRHB").html(respuesta.indicadorFormacionRecursoHumanoB);
			}
		},
		error: function() {
	        console.log("No se ha podido obtener la información");
	    }
	});
}

function cargarRecomendacion(){
	if(recomendacion!==""){
		jsonRecomendacion=JSON.parse("["+recomendacion+"]");
		jsonRecomendacion.forEach(function(productoRecomendacion){
			if($('#'+productoRecomendacion.c_categoria).val()!==""){
				console.log($('#'+productoRecomendacion.c_categoria).val());
				console.log(productoRecomendacion.i_num_productos);
				var cantidadProductos=parseInt($('#'+productoRecomendacion.c_categoria).val())+productoRecomendacion.i_num_productos;
				console.log(cantidadProductos);
				$('#'+productoRecomendacion.c_categoria).val(cantidadProductos);
			}else{
				$('#'+productoRecomendacion.c_categoria).val(productoRecomendacion.i_num_productos);
			}
		});
		llenarBarras();
		llenarCohesionColaboracion();
		ejecutarSimulacion();
	}
}
	
</script>