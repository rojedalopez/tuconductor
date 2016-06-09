<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "No-chache"); 
response.setHeader("Expires", "0"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache", "no-cache"); 
if(session.getAttribute("user") == null){
   //redirijo al login
    response.sendRedirect("../tuconductor/?mensaje=Acabo su sesion.");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:::TuConductor:::</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="css/generales.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="js/angular.min.js"></script>
    <script type="text/javascript" src="js/app.js"></script>      
    <script type="text/javascript" src="js/angular/controles.js"></script>    
    <script type="text/javascript" src="js/date.js"></script>
    
   </head>
<body ng-app="myApp" class="ng-cloak">
    <!--  wrapper -->
    <div id="wrapper" ng-controller="ProfileController as ctrl">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="" />
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->                
                <li class="dropdown">
                    
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-danger">3</span><i class="fa fa-envelope fa-3x"></i>
                    </a>
                    <!-- dropdown-messages -->
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-danger">Andrew Smith</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-info">Jonney Depp</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong><span class=" label label-success">Jonney Depp</span></strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-messages -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-success">4</span>  <i class="fa fa-tasks fa-3x"></i>
                    </a>
                    <!-- dropdown tasks -->
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-tasks -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-3x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i>New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i>3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i>Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i>New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i>Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-alerts -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                <img src="assets/img/user.jpg" alt="">
                            </div>
                            <div class="user-info">
                                <div>${sessionScope.usr}</div>
                                <div class="user-text-online">
                                    <a href="#">Mejora tu Perfil</a>
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    <li class="selected">
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Inicio</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Perfil<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#editperfil.html">Editar perfil</a>
                            </li>
                            <li>
                                <a href="morris.html">Quién ha visto tu perfil</a>
                            </li>
                            <li>
                                <a href="morris.html">Tus actualizaciones</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Mi Red<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Contactos</a>
                            </li>
                            <li>
                                <a href="morris.html">Buscar contactos</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Empleos</a>
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Intereses</a>
                    </li>
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Mi Perfil</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                
                <form ng-submit="ctrl.submitDP()" name="datos_personales" novalidate>
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                DATOS PERSONALES
                            </div>
                            
                            <div class="panel-body ">
                                <p ng-class="{ 'has-error': datos_personales.tip_doc.$error.required }">
                                    <label class="etiqueta" for="tip_doc">Tipo de doc<i class="required">*</i>:</label>                                        
                                    <select class="form-control selector"  name="tip_doc" ng-model="ctrl.usuario_dp.tip_doc" ng-options="tipoIdent.ID as tipoIdent.Tipo for tipoIdent in ctrl.tipoIdents" class="selector" required>
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                    <!-- <span ng-show="datos_personales.tip_doc.$error.required && datos_personales.tip_doc.$dirty" class="required">Error</span> -->
                                </p>
                                <p ng-class="{ 'has-error': datos_personales.num_doc.$error.required || datos_personales.num_doc.$error.minlength}">
                                    <label class="etiqueta" for="num_doc">No. documento<i class="required">*</i>:</label>                                            
                                    <input type="text" class="form-control texto"  name="num_doc" ng-model="ctrl.usuario_dp.num_doc" required minlength="6"/>
                                    <!--<span ng-show="datos_personales.num_doc.$error.required && datos_personales.num_doc.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.num_doc.$error.minlength && datos_personales.num_doc.$dirty" class="required">Error tamaño</span>-->
                                </p>
                                <p ng-class="{ 'has-error': datos_personales.nombre.$error.required || datos_personales.nombre.$error.minlength}">
                                    <label class="etiqueta" for="nombre">Nombre<i class="required">*</i>:</label>
                                    <input type="text" class="form-control texto"  name="nombre" ng-model="ctrl.usuario_dp.nombre" required minlength="5"/>
                                    <!--<span ng-show="datos_personales.nombre.$error.required && datos_personales.nombre.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.nombre.$error.minlength && datos_personales.nombre.$dirty" class="required">Error tamaño</span>-->
                                </p>
                                <p ng-class="{ 'has-error': datos_personales.apellido.$error.required || datos_personales.apellido.$error.minlength}">
                                    <label class="etiqueta" for="apellido">Apellido<i class="required">*</i>:</label>                                        
                                    <input type="text" class="form-control texto"  name="apellido" ng-model="ctrl.usuario_dp.apellido" required minlength="5"/>
                                    <!--<span ng-show="datos_personales.apellido.$error.required && datos_personales.apellido.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.apellido.$error.minlength && datos_personales.apellido.$dirty" class="required">Error tamaño</span>-->
                                </p>
                                <p>
                                    <label class="etiqueta" for="fecha_nac">Nacimiento:</label>                                        
                                    <input type="date" class="form-control texto"  name="fecha_nac" ng-model="ctrl.usuario_dp.fecha_nac" />
                                </p>
                                <p>
                                    <label class="etiqueta" for="genero">Genero:</label>                                        
                                    <select name="genero"  class="form-control selector" ng-model="ctrl.usuario_dp.genero" ng-options="Sexo.ID as Sexo.Tipo for Sexo in ctrl.Sexos" required>
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="etiqueta" for="est_civil">Estado civil:</label>                                        
                                    <select class="form-control selector"  name="est_civil" ng-model="ctrl.usuario_dp.est_civil" ng-options="estCivil.ID as estCivil.Value for estCivil in ctrl.estCiviles" class="selector">
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                </p>
                                <p ng-class="{ 'has-error': datos_personales.movil.$error.required || datos_personales.movil.$error.minlength}">
                                    <label class="etiqueta" for="movil">Celular<i class="required">*</i>:</label>                                        
                                    <input type="text" class="form-control texto" name="movil" ng-model="ctrl.usuario_dp.movil" required minlength="7"/>
                                    <!--<span ng-show="datos_personales.movil.$error.required && datos_personales.movil.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.movil.$error.minlength && datos_personales.novil.$dirty" class="required">Error tamaño</span>-->
                                </p>
                                <p>
                                    <label class="etiqueta" for="telefono">Telefono:</label>                                        
                                    <input type="text" class="form-control texto"  name="tel" ng-model="ctrl.usuario_dp.tel" >
                                </p>
                                <p>
                                    <label class="etiqueta" for="pais">Pais</label>                                        
                                    <select class="form-control selector"  name="pais" ng-model="ctrl.usuario_dp.pais" ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises">
                                            <option value="" selected>--Seleccione Pais--</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="etiqueta" for="dpto">Departamento:</label>                                        
                                    <select class="form-control selector" name="dpto" ng-model="ctrl.usuario_dp.dpto">
                                        <option>Departamento</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="etiqueta" for="ciudad">Ciudad:</label>                                        
                                    <select class="form-control selector" name="ciudad" ng-model="ctrl.usuario_dp.ciudad">
                                        <option>Ciudad</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="etiqueta" for="dir">Direccion:</label>                                        
                                    <input type="text" class="form-control texto"  name="dir" ng-model="ctrl.usuario_dp.dir">
                                </p>
                                <p>
                                    <label class="etiqueta" for="nac">Nacionalidad:</label>                                        
                                    <select class="form-control selector" name="naci" ng-model="ctrl.usuario_dp.naci" ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises">
                                        <option value="" selected>--Seleccione Nacionalidad--</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="etiqueta">Licencia de conducción:</label>                                       
                                    <label class="checkbox-inline" >
                                        <input type="checkbox" value="1" name="la1" ng-model="ctrl.usuario_dp.la1"> A1.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="la2" ng-model="ctrl.usuario_dp.la2"> A2.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lb1" ng-model="ctrl.usuario_dp.lb1"> B1.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lb2" ng-model="ctrl.usuario_dp.lb2"> B2.
                                    </label>
                                </p>
                                <p>
                                    <label class="etiqueta" ></label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lb3" ng-model="ctrl.usuario_dp.lb3"> B3.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lc1" ng-model="ctrl.usuario_dp.lc1"> C1.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lc2" ng-model="ctrl.usuario_dp.lc2"> C2.
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="1"  name="lc3" ng-model="ctrl.usuario_dp.lc3"> C3.
                                    </label>     
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                PERFIL PROFESIONAL
                            </div>
                            <div class="panel-body">
                                <p ng-class="{ 'has-error': datos_personales.cargo.$error.required || datos_personales.cargo.$error.minlength}">
                                    <label class="etiqueta_a">Cargo o titulo breve de su hoja de vida<i class="required">*</i>:</label>                                                                                  
                                    <input type="text" name="cargo" ng-model="ctrl.usuario_dp.cargo" class="form-control area" placeholder="Ej: C" required minlength="15"/>
                                    <!-- <span ng-show="datos_personales.cargo.$error.required && datos_personales.cargo.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.cargo.$error.minlength && datos_personales.cargo.$dirty" class="required">Error tamaño</span>-->
                                </p>
                                <p ng-class="{ 'has-error': datos_personales.perfil.$error.required || datos_personales.perfil.$error.minlength}">
                                    <label class="etiqueta_a">Decripcion breve de su perfil profesional:</label>                                                                                 
                                    <textarea class="form-control area" name="perfil" ng-model="ctrl.usuario_dp.perfil" placeholder="Ej: C" rows="4" required minlength="50"></textarea>
                                </p>

                                <div class="form-group">
                                    <div class="form-group" style="text-align: right;">
                                        <button type="submit" ng-disabled="datos_personales.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_cambios" class="btn btn-primary" >Guardar cambios</button>
                                        <input type="reset" class="btn btn-default" value="Cancelar">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                </form>
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            EXPERIENCIA LABORAL
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12" ng-repeat="ex in ctrl.experiencias">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            <span ng-bind="ex.cargo" ></span>
                                            <button type="button" class="close"><img src="assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" ng-click="ctrl.editExp(ex.id)" class="close"><img src="assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <span ng-bind="ex.empresa" ></span>
                                        </div>
                                        <div class="panel-footer">
                                            {{ctrl.Meses[ex.mes_inicio-1].Mes + " " + ex.anio_inicio}} - {{(ex.labora)?"Actualmente":ctrl.Meses[ex.mes_fin-1].Mes + " " + ex.anio_fin}}
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.openExp()">Añadir experiencia laboral</button>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            FORMACIÓN
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            Universidad / carrera universitaria
                                            <button type="button" class="close"><img src="assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close"><img src="assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p>Universidad san martin de porras</p>
                                        </div>
                                        <div class="panel-footer">
                                            Febrero 2013 - actualidad
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" data-toggle="modal" data-target="#Modal_formacion">Añadir formación</button>
                        </div>
                    </div>
                </div>
            </div>
            

         


        </div>
        <!-- end page-wrapper -->
        
        
        <div class="modal fade" id="Modal_experiencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de experiencia laboral</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submitExp()" name="exp_laboral" class="form-horizontal">
                        <p>
                            <label class="etiqueta_e">Empresa:</label>
                            <input type="hidden" name="id" ng-model="ctrl.exp_laboral.id"/>
                            <input type="text" class="form-control texto_e" name="empresa" ng-model="ctrl.exp_laboral.empresa"  placeholder="Nombre de la empresa" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Cargo:</label>
                            <input type="text" class="form-control texto_e" name="cargo" ng-model="ctrl.exp_laboral.cargo" placeholder="Cargo realizado" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Salario:</label>
                            <input type="number" class="form-control texto_e_min" name="salario" ng-model="ctrl.exp_laboral.salario" placeholder="$" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Bonos:</label>
                            <input type="number" class="form-control texto_e_min" name="bonos" ng-model="ctrl.exp_laboral.bonos" placeholder="$" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Supervisor:</label>
                            <input type="text" class="form-control texto_e" name="supervisor" ng-model="ctrl.exp_laboral.supervisor" placeholder="Nombre / Apellido" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Telefono:</label>
                            <input type="text" class="form-control texto_e" name="telefono" ng-model="ctrl.exp_laboral.telefono" placeholder="" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Pais:</label>
                            <select class="form-control selector_e" name="pais" ng-model="ctrl.exp_laboral.pais" ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises">
                                <option>--- Seleccione Pais ---</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Dpto:</label>
                            <select class="form-control selector_e" name="dpto" ng-model="ctrl.exp_laboral.dpto">
                                <option>Departamento</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Ciudad:</label>
                            <select class="form-control selector_e" name="ciudad" ng-model="ctrl.exp_laboral.ciudad">
                                <option>Ciudad</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Direccion:</label>
                            <input type="text" class="form-control texto_e" name="direccion" ng-model="ctrl.exp_laboral.direccion" placeholder="Direccion" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Inicio:</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_inicio" ng-model="ctrl.exp_laboral.mes_inicio" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_inicio" ng-model="ctrl.exp_laboral.anio_inicio" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        <p>
                            <label class="etiqueta_e">Fin</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_fin" ng-model="ctrl.exp_laboral.mes_fin" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_fin" ng-model="ctrl.exp_laboral.anio_fin" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        
                        <p>
                            <label class="etiqueta_e">Actualmente labora?</label>
                            <input type="checkbox" name="labora" ng-model="ctrl.exp_laboral.labora"/>
                        </p>
                        <p>
                            <label class="etiqueta_e">Retiro:</label>
                            <textarea class="form-control area_e" name="retiro" ng-model="ctrl.exp_laboral.retiro" rows="3" placeholder="Razones de su retiro..." ></textarea>
                        </p>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Añadir</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="Modal_formacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de formación</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="formacion" class="form-horizontal">
                        <p>
                            <label class="etiqueta_e">Centro educativo:</label>                            
                            <input type="text" class="form-control texto_e" name="c_educativo" ng-model="ctrl.formacion.c_educativo" placeholder="Nombre del centro educativo" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Nivel de estudios:</label>                           
                            <select class="form-control selector_e" name="nivel_estudio" ng-model="ctrl.formacion.nivel_estudio">
                                <option>Nivel De Estudios</option>
                                <option>Educación Basica Primaria</option>
                                <option>Educación Basica Secundaria</option>
                                <option>Bachillerato / educacion Media</option>
                                <option>Universidad / Carrera Tecnica</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Area de estudio:</label>
                            <input type="text" class="form-control texto_e" name="area_estudio" ng-model="ctrl.formacion.area_estudio" placeholder="Area de estudio" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Estado:</label>
                            <div class="form-inline">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="news"> Culminado
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="news"> Cursando
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="news"> Aplazado/Abandonado
                                </label>
                            </div>                                
                        </p>
                        <p>
                            <label class="etiqueta_e">Inicio:</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_inicio" ng-model="ctrl.exp_laboral.mes_inicio" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_inicio" ng-model="ctrl.exp_laboral.anio_inicio" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        <p>
                            <label class="etiqueta_e">Fin</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_fin" ng-model="ctrl.exp_laboral.mes_fin" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_fin" ng-model="ctrl.exp_laboral.anio_fin" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary">Añadir</button>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    <!-- end wrapper -->

    
    
    
    
    
    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/scripts/dashboard-demo.js"></script>

    <script type="text/javascript">
        var btn_guardar_cambios = $("#btn_guardar_cambios");
        var form_experiencia = $("#Modal_experiencia");
    </script>
</body>

</html>
