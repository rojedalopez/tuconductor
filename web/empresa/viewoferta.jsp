<%@page import="bean.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "No-chache"); 
response.setHeader("Expires", "0"); 
response.setHeader("Cache-Control", "no-store"); 
response.setHeader("Cache", "no-cache"); 
if(session.getAttribute("user") == null){
   //redirijo al login
   response.sendRedirect("../?mensaje=Acabo su sesion.");
}else{
    usuario u = (usuario)session.getAttribute("user");
   if(u.getRol()==1){
        response.sendRedirect("../admin/");
   }else if(u.getRol()==3){
        response.sendRedirect("../conductor/");
   }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:::TuConductor:::</title>
    <!-- Core CSS - Include with every page -->
    <link rel="stylesheet" href="../js/bootstrap/css/bootstrap.min.css"/>
    <link href="../assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="../assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="../css/generales.css" rel="stylesheet" />

    <script type="text/javascript" src="../js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/dataTables.responsive.min.js"></script>
    <script src="../js/bootstrap/js/bootstrap.min.js"></script>
    <!-- Angular Material requires Angular.js Libraries -->
    <script src="../js/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-messages.min.js"></script>

    <!-- Angular Material Library -->
    <script src="../js/angular-material.min.js"></script>
    <script src="../js/dist/angular-datatables.min.js"></script>   
    
    
    <script type="text/javascript">
          var btn_guardar_cambios, form_oferta, btn_add_exp, btn_add_formacion;
          var dialog_oferta;
        $(document).ready(function(){
            btn_guardar_cambios = $("#btn_guardar_cambios");
            form_oferta = $("#form_oferta");
            dialog_oferta = $("#Modal_publicar");
            btn_add_exp = $("#btn_add_exp");
            btn_add_formacion = $("#btn_add_formacion");
        });
        
    </script>
    
    <script type="text/javascript" src="../js/angular/dirPagination.js"></script>
    <script type="text/javascript" src="../js/app.js"></script>      
    <script type="text/javascript" src="../js/angular/angular-validator.js"></script>
    <script type="text/javascript" src="../js/angular/profile.js"></script>
    <script type="text/javascript" src="../js/angular/sign.js"></script>
    <script type="text/javascript" src="../js/angular/wall.js"></script>
    <script type="text/javascript" src="../js/angular/oferta.js"></script>
    <script type="text/javascript" src="../js/angular/inbox.js"></script>
    
    <script src="../assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../assets/plugins/pace/pace.js"></script>
    <script src="../assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="../assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="../assets/plugins/morris/morris.js"></script>
    <script src="../assets/scripts/dashboard-demo.js"></script>
    
    
   </head>
<body ng-app="myApp" class="ng-cloak">
    <!--  wrapper -->
    <div id="wrapper" ng-controller="OfertaController as ctrl">
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
                    <img src="../assets/img/logo.png" alt="" />
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
                        <li><a href="../logout"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
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
                                <img src="../assets/img/user.jpg" alt="">
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
                    <li>
                        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>Inicio</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> Perfil<span class="fa arrow"></span></a>
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
                    <li class="selected">
                        <a href="viewoferta.jsp"><i class="fa fa-tags fa-fw"></i> Ofertas</a>                        
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
                    <h1 class="page-header">Ofertas</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <div class="col-lg-4" style="cursor: pointer;" ng-click="ctrl.openOferta()">
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body blue">
                            <img src="../assets/img/add_icon.png" />
                            <label>PUBLICAR</label>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Publicar nueva oferta
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body blue">
                            <img src="../assets/img/dashboard_icon.png" />
                            <label>DASHBOARD</label>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Representación de mis indicadores
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 tooltip-demo" style="cursor: pointer;" >
                    <div class="panel panel-primary text-center no-boder"  data-toggle="tooltip" data-placement="bottom" title="Ofertas disponibles: 3 / Ofertas disponibles: 3">
                        <div class="panel-body yellow">
                            <img src="../assets/img/token_icon.png" />
                            <label>500</label>

                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Mis tokens
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            LISTA DE OFERTAS                            
                        </div>
                        <div class="panel-body">
                            <div class="row">                                
                                <div class="col-lg-12" ng-repeat="of in ctrl.ofertas">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">    
                                            <i class="fa fa-map-marker"> <b>{{of.ciudad + ', '+ of.depart + ', ' + of.pais}}</b></i>
                                            <button type="button" class="close"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close" ng-click="ctrl.editOferta(of.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p style="font-size: 20px; color: #0088cc;"><span ng-bind="of.titulo"></span></p>
                                            <p><span ng-bind="of.descripcion"></span></p>
                                        </div>
                                        <div class="panel-footer">                                            
                                            Publicado: <b><span ng-bind="of.fecha"></span></b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

         


        </div>
        <!-- end page-wrapper -->
        <div class="modal fade" id="Modal_publicar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Publicar oferta</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="form_oferta" angular-validator-submit="ctrl.submitOferta()" class="form-horizontal" angular-validator novalidate>
                        <label class="etiqueta_e">Titulo<i class="required">*</i>:</label>                            
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="titulo" 
                                ng-model="ctrl.oferta.titulo" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.oferta.titulo, 6) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.oferta.titulo, 6)"
                                required-message="'El campo no puede estar vacio'"                                   
                                required />
                        </div>
                        <label class="etiqueta_e">Descripción<i class="required">*</i>:</label>
                        <div class="form-group">
                            <textarea 
                                class="form-control texto_e" 
                                rows="4" name="descripcion" 
                                ng-model="ctrl.oferta.descripcion" 
                                placeholder="Descripcion de la oferta" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.oferta.descripcion, 10) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.oferta.descripcion, 10)"
                                required-message="'El campo no puede estar vacio'"                                   
                                required></textarea>
                        </div>
                        <label class="etiqueta_e"># Vacantes<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="number" 
                                class="form-control texto_e" 
                                min="1" name="vacantes" 
                                ng-model="ctrl.oferta.vacante" 
                                clase="text_valid_e"
                                invalid-message ="'El campo debe ser valido'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Salario<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="number" 
                                class="form-control texto_e" 
                                name="salario" 
                                min="1"
                                ng-model="ctrl.oferta.salario" 
                                clase="text_valid_e"
                                invalid-message ="'El campo debe ser valido'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Tipo contrato<i class="required">*</i>:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                            name="tipo" ng-model="ctrl.oferta.tipo" 
                            ng-options="Tipo.ID as Tipo.Value for Tipo in ctrl.TipoContrato" 
                            clase="text_valid_e"
                            required-message="'El campo no puede estar vacio'"
                            required>
                                <option value="">--- Seleccione Tipo ---</option>
                            </select>
                        </div>
                        <label class="etiqueta_e_up">Fecha contratación<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="date" 
                                class="form-control texto_e" 
                                name="fecha_contratacion" 
                                ng-model="ctrl.oferta.fecha_contratacion" 
                                clase="text_valid_e"
                                invalid-message ="'La fecha debe ser valido'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Pais<i class="required">*</i>:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                name="pais" ng-model="ctrl.oferta.pais" 
                                ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises" 
                                ng-change="ctrl.selectPais(ctrl.oferta.pais)"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'"
                                required>
                                <option>--- Seleccione Pais ---</option>
                            </select>
                        </div>
                        <label class="etiqueta_e">Dpto<i class="required">*</i>:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                ng-show="ctrl.colombia" 
                                required="{{ctrl.colombia}}" 
                                name="depto" 
                                ng-model="ctrl.oferta.depto" 
                                ng-options="dpto.id as dpto.departamento for dpto in ctrl.dptos" 
                                ng-change="ctrl.selectDpto(ctrl.oferta.depto)"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'">
                                <option value="">--- Seleccione Departamento ---</option>
                            </select>
                            <input type="text" ng-show="!ctrl.colombia" 
                                class="form-control texto_e"  
                                name="depart" 
                                ng-model="ctrl.oferta.depart" 
                                required="{{!ctrl.colombia}}" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.oferta.depart, 4) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.oferta.depart, 4)"
                                required-message="'El campo no puede estar vacio'"/>
                        </div>
                        <label class="etiqueta_e">Ciudad<i class="required">*</i>:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                ng-show="ctrl.colombia" 
                                required="{{ctrl.colombia}}" 
                                name="ciudad" 
                                ng-model="ctrl.oferta.ciudad" 
                                ng-options="ciudad for ciudad in ctrl.ciudades"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'">
                                <option value="">--- Seleccione Ciudad ---</option>
                            </select>
                            <input type="text" 
                                ng-show="!ctrl.colombia" 
                                class="form-control texto_e"  
                                name="ciudad" 
                                ng-model="ctrl.oferta.ciudad" 
                                required="{{!ctrl.colombia}}"
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.oferta.ciudad, 4) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.oferta.ciudad, 4)"
                                required-message="'El campo no puede estar vacio'"/>
                        </div>
                        <label class="etiqueta_e">Estado<i class="required">*</i>:</label>
                        <div class="form-group">
                            <label class="checkbox-inline" >
                                <input type="checkbox" value="1" name="estado" ng-model="ctrl.oferta.estado"> Activar.
                            </label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_formacion" class="btn btn-primary" >Añadir</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- end wrapper -->    
    </div>

</body>

</html>
