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

<%String tiposProductos=(String) request.getAttribute("tiposProductos");
ClasificacionGrupo clasificacionGrupo=(ClasificacionGrupo) request.getAttribute("clasificacionGrupo");%>
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
</style>
<section class="content">
      <div class="row">
      	<div class="col-md-10">
      		<div class="row">
		        <!-- left column -->
		        <div class="col-md-4">
		          <!-- general form elements -->
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">Quick Example</h3>
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
		              <h3 class="box-title">Quick Example</h3>
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
		              <h3 class="box-title">Quick Example</h3>
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
		              <h3 class="box-title">Quick Example</h3>
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
		              <h3 class="box-title">Quick Example</h3>
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
		              <h3 class="box-title">Quick Example</h3>
		            </div>
		            <!-- /.box-header -->
		            <!-- form start -->
		              <div class="box-body" id="productosFRH_B">                
		              </div>
		              <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		    </div>
	    </div>
	    <div class="col-md-2">
	    <div style="position: fixed;">
	    	<div class="box">
            
            <div class="bg-yellow">
              <div class="">
                <span>A1</span>
              </div>
             
              <h3 class="widget-user-username">Clasificacion</h3>
            </div>
            <div class="box-footer no-padding">
              <ul class="nav nav-stacked">
                <li><a href="#">Projects <span class="pull-right badge bg-blue">31</span></a></li>
                <li><a href="#">Tasks <span class="pull-right badge bg-aqua">5</span></a></li>
                <li><a href="#">Completed Projects <span class="pull-right badge bg-green">12</span></a></li>
                <li><a href="#">Followers <span class="pull-right badge bg-red">842</span></a></li>
              </ul>
            </div>
          </div>

<!-- 	    	<div class="box box-primary" > -->
<!-- 		            <div class="box-header with-border"> -->
<!-- 		              <h3 class="box-title">Clasificacion simulada</h3> -->
<!-- 		            </div> -->
		            
<!-- 		              <div class="box-body" id=""> -->
<!-- 		                    <ul class="nav nav-stacked"> -->
<!-- 							  <li><a href="#">Projects <span class="pull-right badge bg-blue">31</span></a></li> -->
<!-- 							  <li><a href="#">Tasks <span class="pull-right badge bg-aqua">5</span></a></li> -->
<!-- 							  <li><a href="#">Completed Projects <span class="pull-right badge bg-green">12</span></a></li> -->
<!-- 							  <li><a href="#">Followers <span class="pull-right badge bg-red">842</span></a></li> -->
<!-- 							</ul>          -->
<!-- 		              </div> -->
		             
<!-- 		          </div> -->
		          </div>
	    </div>
   	</div>
</section>
<!-- <div id="productosA1" class="row"></div> -->
<!-- <div id="productosA" class="row"></div> -->
<!-- <div id="productosB" class="row"></div> -->
<!-- <div id="productosASC" class="row"></div> -->
<!-- <div id="productosFRH_A" class="row"></div> -->
<!-- <div id="productosFRH_B" class="row"></div> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var productos=JSON.parse('<%=tiposProductos%>');
var productosGrupo=JSON.parse('<%=clasificacionGrupo.getProductos()%>');
var productosA1=productos.filter(producto => producto.c_tipo==="1");
var productosA=productos.filter(producto => producto.c_tipo==="2");
var productosB=productos.filter(producto => producto.c_tipo==="3");
var productosASC=productos.filter(producto => producto.c_tipo==="4");
var productosFRH_A=productos.filter(producto => producto.c_tipo==="5");
var productosFRH_B=productos.filter(producto => producto.c_tipo==="6");

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
		$('#'+productoGrupo.c_categoria).val(productoGrupo.numero);
	});
}

function llenarBarras(){
	$('.input-producto').each(function(i,inputProducto){
		console.log(inputProducto.id);
		var producto=buscarProducto(productosGrupo,inputProducto.id)[0];
		var numProductosGrupo=producto?producto.numero:0;
		console.log(numProductosGrupo);
		var valorInput=inputProducto.value!==""?inputProducto.value:0;
		var valorSimulacion=valorInput-numProductosGrupo;
		$('#progress-'+inputProducto.id).html('');
		$('#progress-'+inputProducto.id).append('<div class="progress-bar progress-bar-green" style="width: '+((numProductosGrupo*100)/valorInput)+'%">'+numProductosGrupo+'</div>');
		if(valorSimulacion!==0){
		$('#progress-'+inputProducto.id).append('<div class="progress-bar progress-bar-yellow" style="width: '+((valorSimulacion*100)/valorInput)+'%">'+valorSimulacion+'</div>');
		}
		console.log(i);
		});
}

function buscarProducto(productosFiltro,busqueda){
	return productosFiltro.filter(producto => producto.c_categoria===busqueda);
}


	
</script>