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
   if(u.getRol()==2){
        response.sendRedirect("../empresa/");
   }else if(u.getRol()==3){
        response.sendRedirect("../conductor/");
   }
}
%>
<!DOCTYPE html>
<html lang="ES">
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
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-messages.min.js"></script>

    <!-- Angular Material Library -->
    <script src="../js/angular-material.min.js"></script>
    <script src="../js/dist/angular-datatables.min.js"></script>    
    
    <script type="text/javascript">
        var btn_guardar_cambios, form_experiencia, form_formacion, form_multa, form_accidente,form_judicial, btn_add_exp, btn_add_formacion, 
                btn_guardar_multa, btn_guardar_accidente, btn_guardar_judicial, btn_admitir, btn_send_checked;
        
        $(document).ready(function(){
            verOpcion(1);
            btn_send_checked = $("#btn_send_checked");
            btn_guardar_multa = $("#btn_guardar_multa");
            btn_guardar_accidente = $("#btn_guardar_accidente");
            btn_guardar_judicial = $("#btn_guardar_judicial");
            btn_guardar_cambios = $("#btn_guardar_cambios");
            form_experiencia = $("#form_experiencia");
            form_formacion = $("#form_formacion");
            form_multa = $("#form_multa");
            form_accidente = $("#form_accidente");
            form_judicial = $("#form_judicial");
            btn_add_exp = $("#btn_add_exp");
            btn_add_formacion = $("#btn_add_formacion");   
            btn_admitir = $("#btn_admitir");
        });
        function eliminarOpciones(){
            for(var i=1;i<8;i++){
                $(".opcion"+i).hide();
            }
        }
        function verOpcion(id){
            eliminarOpciones();
            $(".opcion"+id).show();
        }
        function abrir_admision(){
            $("#form_admision").modal("show");
        }
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
    <div id="wrapper" ng-controller="EditConductorbyAdminController as ctrl">
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
                    <li class="selected">
                        <a href="#"><i class="fa fa-user fa-fw"></i> Perfil<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#" onclick="verOpcion(1)">Datos personales</a>
                            </li>
                            <li>
                                <a href="#" onclick="verOpcion(2)">Experiencial laboral</a>
                            </li>
                            <li>
                                <a href="#" onclick="verOpcion(3)">Formacion</a>
                            </li>
                            <li>
                                <a href="#" onclick="verOpcion(4)">Multas</a>
                            </li>
                            <li>
                                <a href="#" onclick="verOpcion(5)">Accidentes</a>
                            </li>
                            <li>
                                <a href="#" onclick="verOpcion(6)">Procesos judiciales</a>
                            </li>
                        </ul>
                        <!-- second-level-items -->
                    </li>                    
                    <li>
                        <a href="#" onclick="verOpcion(7)"><i class="fa fa-check-square fa-fw"></i> Admision</a>
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
                    <h1 class="page-header">Perfil empleado: {{ctrl.usuario_dp.nombre + ' ' + ctrl.usuario_dp.apellido}}</h1>
                </div>
                <div class="col-lg-12" style="text-align: center;">
                    <div class="alert alert-success" ng-show="ctrl.usuario_dp.verificado">
                        <b>Estado:</b> <i class="fa fa-check-square"></i> ADMITIDO.
                    </div>
                    <div class="alert alert-danger" ng-show="!ctrl.usuario_dp.verificado">
                        <b>Estado:</b> <i class="fa fa-exclamation-triangle"></i> PENDIENTE
                    </div>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                
                <form angular-validator-submit="ctrl.submitDP()" name="datos_personales" 
                      angular-validator class="form-horizontal" novalidate>
                    <div class="col-lg-12 opcion1">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                DATOS PERSONALES
                            </div>
                            
                            <div class="panel-body ">
                                <label class="etiqueta" for="tip_doc">Tipo de doc<i class="required">*</i>:</label>                                        
                                <div class="form-group">
                                    <select class="form-control selector"  
                                        name="tip_doc" 
                                        ng-model="ctrl.usuario_dp.tip_doc" 
                                        ng-options="tipoIdent.ID as tipoIdent.Tipo for tipoIdent in ctrl.tipoIdents" 
                                        class="selector" 
                                        clase="text_valid"
                                        required-message="'Debe seleccionar una opción'"
                                        required>
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                </div>
                                <label class="etiqueta" for="num_doc">No. documento<i class="required">*</i>:</label>                                            
                                <div class="form-group">
                                    <input type="text" 
                                        class="form-control texto"  
                                        name="num_doc" 
                                        ng-model="ctrl.usuario_dp.num_doc" 
                                        clase="text_valid"
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.num_doc, 4) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.num_doc, 4)"
                                        required-message="'El campo no puede estar vacio'" 
                                        required/>
                                </div>
                                <label class="etiqueta" for="nombre">Nombre<i class="required">*</i>:</label>
                                <div class="form-group">
                                        <input type="text" 
                                        name="nombre" 
                                        ng-model="ctrl.usuario_dp.nombre" 
                                        class="form-control texto"  
                                        clase="text_valid"
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.nombre, 6) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.nombre, 6)"
                                        required-message="'El campo no puede estar vacio'" 
                                        required/>
                                    
                                </div>
                                <label class="etiqueta" for="apellido">Apellido<i class="required">*</i>:</label>                                        
                                <div class="form-group">
                                    <input type="text" 
                                        name="apellido" 
                                        ng-model="ctrl.usuario_dp.apellido"
                                        class="form-control texto"
                                        clase="text_valid" 
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.apellido, 6) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.apellido, 6)"
                                        required-message="'El campo no puede estar vacio'" 
                                        required/>
                                </div>
                                <label class="etiqueta" for="fecha_nac">Nacimiento:</label>                                        
                                <div class="form-group">
                                    <input type="date" 
                                           class="form-control texto"  
                                           name="fecha_nac" 
                                           ng-model="ctrl.usuario_dp.fecha_nac" />
                                </div>
                                <label class="etiqueta" for="genero">Genero:</label>                                        
                                <div class="form-group">
                                    <select name="genero"
                                            ng-model="ctrl.usuario_dp.genero" 
                                            ng-options="Sexo.ID as Sexo.Tipo for Sexo in ctrl.Sexos" 
                                            class="form-control selector" 
                                            clase="text_valid" 
                                            required-message="'Debe seleccionar una opción'"
                                            required>
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                </div>
                                <label class="etiqueta" for="est_civil">Estado civil:</label>                                        
                                <div class="form-group">
                                    <select class="form-control selector"  name="est_civil" ng-model="ctrl.usuario_dp.est_civil" ng-options="estCivil.ID as estCivil.Value for estCivil in ctrl.estCiviles" class="selector">
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                </div>
                                <label class="etiqueta" for="movil">Celular<i class="required">*</i>:</label>                                        
                                <div class="form-group">
                                    <input type="tel" 
                                        name="movil" 
                                        ng-model="ctrl.usuario_dp.movil" 
                                        class="form-control texto" 
                                        clase="text_valid" 
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.movil, 10) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.movil, 10)"
                                        required-message="'El campo no puede estar vacio'"
                                        required />
                                </div>
                                <label class="etiqueta" for="telefono">Telefono:</label>                                        
                                <div class="form-group">
                                    <input type="tel" class="form-control texto"  name="tel" ng-model="ctrl.usuario_dp.tel" >
                                </div>
                                <label class="etiqueta" for="dir">Direccion:</label>                                        
                                <div class="form-group">
                                    <input type="text" 
                                        name="dir" 
                                        ng-model="ctrl.usuario_dp.dir"
                                        class="form-control texto"  
                                        clase="text_valid" 
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.dir, 10) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.dir, 10)"
                                        required-message="'El campo no puede estar vacio'"
                                        required>
                                </div>
                                <label class="etiqueta">Pais:</label>
                                <div class="form-group">
                                    <select class="form-control selector" 
                                        name="pais" ng-model="ctrl.usuario_dp.pais" 
                                        ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises" 
                                        ng-change="ctrl.selectPais(ctrl.usuario_dp.pais)"
                                        clase="text_valid"
                                        required-message="'El campo no puede estar vacio'"
                                        required>
                                        <option>--- Seleccione Pais ---</option>
                                    </select>
                                </div>
                                <label class="etiqueta">Dpto:</label>
                                <div class="form-group">
                                    <select class="form-control selector" 
                                        ng-show="ctrl.colombia" 
                                        required="{{ctrl.colombia}}" 
                                        name="depto" 
                                        ng-model="ctrl.usuario_dp.depto" 
                                        ng-options="dpto.id as dpto.departamento for dpto in ctrl.dptos" 
                                        ng-change="ctrl.selectDpto(ctrl.usuario_dp.depto)"
                                        clase="text_valid"
                                        required-message="'El campo no puede estar vacio'">
                                        <option value="">--- Seleccione Departamento ---</option>
                                    </select>
                                    <input type="text" ng-show="!ctrl.colombia" 
                                        class="form-control texto"  
                                        name="depart" 
                                        ng-model="ctrl.usuario_dp.depart" 
                                        required="{{!ctrl.colombia}}" 
                                        clase="text_valid"
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.depart, 4) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.depart, 4)"
                                        required-message="'El campo no puede estar vacio'"/>
                                </div>
                                <label class="etiqueta">Ciudad:</label>
                                <div class="form-group">
                                    <select class="form-control selector" 
                                        ng-show="ctrl.colombia" 
                                        required="{{ctrl.colombia}}" 
                                        name="ciudad" 
                                        ng-model="ctrl.usuario_dp.ciudad" 
                                        ng-options="ciudad for ciudad in ctrl.ciudades"
                                        clase="text_valid"
                                        required-message="'El campo no puede estar vacio'">
                                        <option value="">--- Seleccione Ciudad ---</option>
                                    </select>
                                    <input type="text" 
                                        ng-show="!ctrl.colombia" 
                                        class="form-control texto"  
                                        name="ciudad" 
                                        ng-model="ctrl.usuario_dp.ciudad" 
                                        required="{{!ctrl.colombia}}"
                                        
                                        clase="text_valid"
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.ciudad, 4) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.ciudad, 4)"
                                        required-message="'El campo no puede estar vacio'"/>
                                </div>
                                <label class="etiqueta" for="nac">Nacionalidad:</label>                                        
                                <div class="form-group">
                                    <select class="form-control selector" name="naci" ng-model="ctrl.usuario_dp.naci" ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.Paises">
                                        <option value="" selected>--Seleccione Nacionalidad--</option>
                                    </select>
                                </div>
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
                    <div class="col-lg-12 opcion1" >
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                PERFIL PROFESIONAL
                            </div>
                            <div class="panel-body">
                                <p>
                                    <label class="etiqueta_a">Cargo o titulo breve de su hoja de vida<i class="required">*</i>:</label>                                                                                  
                                    <input type="text" 
                                        name="cargo" 
                                        clase="text_valid_a" 
                                        ng-model="ctrl.usuario_dp.cargo" 
                                        class="form-control area" 
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.cargo, 10) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.cargo, 10)"
                                        required-message="'El campo no puede estar vacio'"
                                        required/>
                                </p>
                                <p>
                                    <label class="etiqueta_a">Decripcion breve de su perfil profesional:</label>                                                                                 
                                    <textarea 
                                        class="form-control area" 
                                        clase="text_valid_a" 
                                        name="perfil" 
                                        ng-model="ctrl.usuario_dp.perfil" 
                                        rows="4"
                                        
                                        validator = "ctrl.lengthValidator(ctrl.usuario_dp.perfil, 20) === true"
                                        invalid-message = "ctrl.lengthValidator(ctrl.usuario_dp.perfil, 20)"
                                        required-message="'El campo no puede estar vacio'"
                                        required></textarea>
                                </p>

                                <div class="form-group">
                                    <div class="form-group" style="text-align: right;margin-right: 15px;">
                                        <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_cambios" class="btn btn-primary" >Guardar cambios</button>
                                        <input type="reset" class="btn btn-default" value="Cancelar">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                </form>
                <div class="col-lg-12 opcion2" >
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
                                            <button type="button" class="close" ng-click="ctrl.deleteExp(ex.id)"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close" ng-click="ctrl.editExp(ex.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
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
                
                <div class="col-lg-12 opcion3" >
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            FORMACIÓN
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12" ng-repeat="fm in ctrl.formaciones">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            {{ctrl.NvlFormacion[fm.nivel_estudio-1].Value}}
                                            <button type="button" class="close" ng-click="ctrl.deleteForm(fm.id)"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close" ng-click="ctrl.editForm(fm.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p><span ng-bind="fm.c_educativo"></span></p>
                                        </div>
                                        <div class="panel-footer">
                                            {{ctrl.Meses[fm.mes_inicio-1].Mes + " " + fm.anio_inicio}} - {{(fm.estado!==2)?(fm.estado===1)?'Cursando':'Aplazado/Abandonado':ctrl.Meses[fm.mes_fin-1].Mes + " " + fm.anio_fin}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.openForm()">Añadir formación</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 opcion4" >
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            MULTAS
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12" ng-repeat="m in ctrl.multas">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            {{m.lgr_multa}}
                                            <button type="button" class="close" ng-click="ctrl.deleteMulta(m.id)"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close"  ng-click="ctrl.editMulta(m.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p><span ng-bind="m.cgo_multa"></span></p>
                                        </div>
                                        <div class="panel-footer">
                                            <label>Fecha: {{ctrl.formatDate(m.fch_multa) | date:"dd MMM 'de' yyyy"}}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.openMulta()">Añadir Multa</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 opcion5" >
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            ACCIDENTES
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12" ng-repeat="a in ctrl.accidentes">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            {{ctrl.textAccidente(a.tipo)}}
                                            <button type="button" class="close" ng-click="ctrl.deleteAccidente(a.id)"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close" ng-click="ctrl.editAccidente(a.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p>Muertos: {{(a.muertos)?'Si':'No'}}</p>
                                            <p>Heridos: {{(a.heridos)?'Si':'No'}}</p>
                                        </div>
                                        <div class="panel-footer">
                                            <label>Fecha: {{ctrl.formatDate(a.fch_accidente) | date:"dd MMM 'de' yyyy"}}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.openAccidente()">Añadir Accidente</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 opcion6" >
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            PROCESOS JUDICIALES
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12" ng-repeat="pj in ctrl.judiciales">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            <span ng-bind="pj.del_procjudicial"></span>
                                            <button type="button" class="close" ng-click="ctrl.deleteJudicial(pj.id)"><img src="../assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close" ng-click="ctrl.editJudicial(pj.id)"><img src="../assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p>{{(pj.act_procjudicial)?'El procedimiento se encuentra actualmente activo.':'El procedimiento se encuentra finalizado.'}}</p>
                                        </div>
                                        <div class="panel-footer">
                                            <label>Fecha: {{ctrl.formatDate(pj.fch_procjudicial) | date:"dd MMM 'de' yyyy"}}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-12"><br/></div>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.openJudicial()">Añadir proceso judicial</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-14 opcion7" >
                <form  name="calificacion_user" angular-validator-submit="ctrl.submitCalificacion()"
                       angular-validator class="form-horizontal"  novalidate>
                    <div class="col-lg-14">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                VERIFICACION Y PUNTUACION <b>({{(ctrl.check.tot_cal === 1 || ctrl.check.tot_cal === 0)?ctrl.check.tot_cal+' Punto':ctrl.check.tot_cal+' Puntos'}})</b>
                            </div>
                            
                            <div class="panel-body">
                                <div class="col-lg-14 col-lg-offset-1">  
                                    <p>
                                        <label class="etiqueta_up">Datos y Experiencia laboral</label>
                                        <input type="checkbox" value="1" name="chk_lab" ng-model="ctrl.check.chk_lab" ng-change="ctrl.cambioChk(ctrl.check.chk_lab)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_lab" ng-model="ctrl.check.not_lab" ></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">Escolaridad MINIMA DE bachillerato</label>
                                        <input type="checkbox" value="1" name="chk_esc" ng-model="ctrl.check.chk_esc" ng-change="ctrl.cambioChk(ctrl.check.chk_esc)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_esc"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">Cursos adicionales realizados</label>
                                        <input type="checkbox" value="1" name="chk_cur" ng-model="ctrl.check.chk_cur" ng-change="ctrl.cambioChk(ctrl.check.chk_cur)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_cur"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">TIENE MINIMO 35 Años</label>
                                        <input type="checkbox" value="1" name="chk_myo" ng-model="ctrl.check.chk_myo" ng-change="ctrl.cambioChk(ctrl.check.chk_myo)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_myo" ng-model="ctrl.check.not_myo"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">Ult. Experiencia MINIMA DE 3 años</label>
                                        <input type="checkbox" value="1" name="chk_uexp" ng-model="ctrl.check.chk_uexp" ng-change="ctrl.cambioChk(ctrl.check.chk_uexp)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_uexp" ng-model="ctrl.check.not_uexp"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">Experiencia MINIMA de dos equipos</label>
                                        <input type="checkbox" value="1" name="chk_equ" ng-model="ctrl.check.chk_equ" ng-change="ctrl.cambioChk(ctrl.check.chk_equ)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_equ" ng-model="ctrl.check.not_equ"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">Experiencia total MINIMA DE 10 Años</label>
                                        <input type="checkbox" value="1" name="chk_exp" ng-model="ctrl.check.chk_exp" ng-change="ctrl.cambioChk(ctrl.check.chk_exp)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_exp"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">0 Comparendos en los Ult. 5 Años</label>
                                        <input type="checkbox" value="1" name="chk_com" ng-model="ctrl.check.chk_com" ng-change="ctrl.cambioChk(ctrl.check.chk_com)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_com"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">0 Accidentes en los Ult. 5 Años</label>
                                        <input type="checkbox" value="1" name="chk_acc" ng-model="ctrl.check.chk_acc" ng-change="ctrl.cambioChk(ctrl.check.chk_acc)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_acc"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <label class="etiqueta_up">0 Proc. Judiales activos</label>
                                        <input type="checkbox" value="1" name="chk_jud" ng-model="ctrl.check.chk_jud" ng-change="ctrl.cambioChk(ctrl.check.chk_jud)"/> 
                                        <label class="etiqueta_up">Nota</label>
                                        <textarea class="form-control area_e" name="not_exp" ng-model="ctrl.check.not_jud"></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <div class="form-group">
                                            <div class="form-group" style="text-align: right;margin-right: 15px;">
                                                <button type="button" onclick="abrir_admision()" class="btn btn-default" >{{ctrl.usuario_dp.verificado?'Retirar Admisión':'Admintir'}}</button>
                                                <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_send_checked" class="btn btn-primary" >Guardar cambios</button>
                                            </div>
                                        </div>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>    
            </div>

         


        </div>
        <!-- end page-wrapper -->
        
        
        <div class="modal fade" id="form_experiencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
             aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de experiencia laboral</h4>
                </div>
                <div class="modal-body">
                    <form role="form" angular-validator-submit="ctrl.submitExp()" name="expe_laboral"
                      angular-validator class="form-horizontal" novalidate>
                        <label class="etiqueta_e">Empresa<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="hidden" name="id" ng-model="ctrl.exp_laboral.id"/>
                            <input type="hidden" name="cod" ng-model="ctrl.exp_laboral.cod"/>
                            <input type="text" 
                                class="form-control texto_e" 
                                name="empresa" 
                                ng-model="ctrl.exp_laboral.empresa"  
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.exp_laboral.empresa, 6) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.empresa, 6)"
                                required-message="'El campo no puede estar vacio'"
                                required/>
                        </div>
                        <label class="etiqueta_e">Cargo<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="cargo" 
                                ng-model="ctrl.exp_laboral.cargo" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.exp_laboral.cargo, 6) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.cargo, 6)"
                                required-message="'El campo no puede estar vacio'"
                                required/>
                        </div>
                        <label class="etiqueta_e">Tipo Equipo:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                name="tipo_equipo" ng-model="ctrl.exp_laboral.tipo_equipo" 
                                ng-options="TipoE.ID as TipoE.Value for TipoE in ctrl.TipoEquipos">
                                <option>--- Seleccione Tipo Equipo ---</option>
                            </select>
                        </div>
                        <label class="etiqueta_e">Salario:</label>
                        <div class="form-group">
                            <input type="number" class="form-control texto_e_min" min="0" name="salario" ng-model="ctrl.exp_laboral.salario" placeholder="$" />
                        </div>
                        <label class="etiqueta_e">Bonos:</label>
                        <div class="form-group">
                            <input type="number" class="form-control texto_e_min" min="0" name="bonos" ng-model="ctrl.exp_laboral.bonos" placeholder="$" />
                        </div>
                        <label class="etiqueta_e">Supervisor<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="text" 
                            class="form-control texto_e" 
                            name="supervisor" 
                            ng-model="ctrl.exp_laboral.supervisor" 
                            placeholder="Nombre / Apellido"
                            clase="text_valid_e"
                            validator = "ctrl.lengthValidator(ctrl.exp_laboral.supervisor, 6) === true"
                            invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.supervisor, 6)"
                            required-message="'El campo no puede estar vacio'"
                            required/>
                        </div>
                        <label class="etiqueta_e">Telefono<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="tel" 
                            class="form-control texto_e" 
                            name="telefono" 
                            ng-model="ctrl.exp_laboral.telefono" 
                            clase="text_valid_e"
                            validator = "ctrl.lengthValidator(ctrl.exp_laboral.telefono, 7) === true"
                            invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.telefono, 7)"
                            required-message="'El campo no puede estar vacio'"
                            required />
                        </div>
                        <label class="etiqueta_e">Direccion<i class="required">*</i>:</label>
                        <div class="form-group">
                            <input type="text" 
                            class="form-control texto_e" 
                            name="direccion" 
                            ng-model="ctrl.exp_laboral.direccion" 
                            clase="text_valid_e"
                            validator = "ctrl.lengthValidator(ctrl.exp_laboral.direccion, 10) === true"
                            invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.direccion, 10)"
                            required-message="'El campo no puede estar vacio'"
                            required />
                        </div>
                        <label class="etiqueta_e">Pais:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                name="pais" ng-model="ctrl.exp_laboral.pais" 
                                ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.PaisesExp" 
                                ng-change="ctrl.selectPaisExp(ctrl.exp_laboral.pais)"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'"
                                required>
                                <option>--- Seleccione Pais ---</option>
                            </select>
                        </div>
                        <label class="etiqueta_e">Dpto:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                ng-show="ctrl.colombiaExp" 
                                required="{{ctrl.colombiaExp}}" 
                                name="depto" 
                                ng-model="ctrl.exp_laboral.depto" 
                                ng-options="dpto.id as dpto.departamento for dpto in ctrl.dptosExp" 
                                ng-change="ctrl.selectDptoExp(ctrl.exp_laboral.depto)"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'">
                                <option value="">--- Seleccione Departamento ---</option>
                            </select>
                            <input type="text" ng-show="!ctrl.colombiaExp" 
                                class="form-control texto"  
                                name="depart" 
                                ng-model="ctrl.exp_laboral.depart" 
                                required="{{!ctrl.colombiaExp}}" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.exp_laboral.depart, 4) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.depart, 4)"
                                required-message="'El campo no puede estar vacio'"/>
                        </div>
                        <label class="etiqueta_e">Ciudad:</label>
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                ng-show="ctrl.colombiaExp" 
                                required="{{ctrl.colombiaExp}}" 
                                name="ciudad" 
                                ng-model="ctrl.exp_laboral.ciudad" 
                                ng-options="ciudad for ciudad in ctrl.ciudadesExp"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'">
                                <option value="">--- Seleccione Ciudad ---</option>
                            </select>
                            <input type="text" 
                                ng-show="!ctrl.colombiaExp" 
                                class="form-control texto"  
                                name="ciudad" 
                                ng-model="ctrl.exp_laboral.ciudad" 
                                required="{{!ctrl.colombiaExp}}"
                                
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.exp_laboral.ciudad, 4) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.exp_laboral.ciudad, 4)"
                                required-message="'El campo no puede estar vacio'"/>
                        </div>
                        <label class="etiqueta_e">Inicio<i class="required">*</i>:</label>
                        <div class="form-group">
                            <div class="form-inline">
                                    <select class="form-control selector_e_min" 
                                            name="mes_inicio" 
                                            ng-model="ctrl.exp_laboral.mes_inicio" 
                                            ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses" 
                                            clase="text_valid_e"
                                            parent="anio_inicio">
                                        <option value="">--- Seleccione Mes ---</option>
                                    </select>
                                    <select class="form-control selector_e_min" 
                                            name="anio_inicio" 
                                            ng-model="ctrl.exp_laboral.anio_inicio" 
                                            ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios" 
                                            clase="text_valid_e"
                                            validator = "ctrl.dateValidator(ctrl.exp_laboral.mes_inicio, ctrl.exp_laboral.anio_inicio) === true"
                                            invalid-message = "ctrl.dateValidator(ctrl.exp_laboral.mes_inicio, ctrl.exp_laboral.anio_inicio)"
                                            required-message="'Debe seleccionar una opción'"
                                            required>
                                        <option value="">--- Seleccione Año ---</option>
                                    </select>
                            </div>
                        </div>
                        <label class="etiqueta_e">Fin</label>
                        <div class="form-group">
                            <div class="form-inline">
                                <select class="form-control selector_e_min" 
                                        ng-disabled="ctrl.exp_laboral.labora"
                                        name="mes_fin" ng-model="ctrl.exp_laboral.mes_fin" 
                                        ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" 
                                        ng-disabled="ctrl.exp_laboral.labora" 
                                        name="anio_fin" 
                                        ng-model="ctrl.exp_laboral.anio_fin" 
                                        ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios"
                                        clase="text_valid_e"
                                        validator = "ctrl.dateValidator(ctrl.exp_laboral.mes_fin, ctrl.exp_laboral.anio_fin) === true"
                                        invalid-message = "ctrl.dateValidator(ctrl.exp_laboral.mes_fin, ctrl.exp_laboral.anio_fin)">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </div>
                        
                        <label class="etiqueta_e_up">Actualmente labora?</label>
                        <div class="form-group">
                            <input type="checkbox" name="labora" ng-change="ctrl.limpiar()" ng-model="ctrl.exp_laboral.labora"/>
                        </div>
                        <label class="etiqueta_e">Retiro:</label>
                        <div class="form-group">
                            <textarea class="form-control area_e" name="retiro" ng-disabled="ctrl.exp_laboral.labora" ng-model="ctrl.exp_laboral.retiro" rows="3" placeholder="Razones de su retiro..." ></textarea>
                        </div>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_exp" class="btn btn-primary" >{{(ctrl.exp_laboral.id===-1)?'Añadir':'Editar'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="form_formacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de formación</h4>
                </div>
                <div class="modal-body">
                    <form role="form" angular-validator-submit="ctrl.submitForm()" name="forma_formacion"
                        angular-validator class="form-horizontal" novalidate>
                        <label class="etiqueta_e_up">Centro educativo<i class="required">*</i>:</label>                            
                        <input type="hidden" name="id" ng-model="ctrl.formacion.id"/>
                        <input type="hidden" name="cod" ng-model="ctrl.formacion.cod"/>
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="c_educativo" 
                                ng-model="ctrl.formacion.c_educativo"  
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.formacion.c_educativo, 6) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.formacion.c_educativo, 6)"
                                required-message="'El campo no puede estar vacio'"
                                required/>
                        </div>
                        <label class="etiqueta_e">Nivel de estudios<i class="required">*</i>:</label>                           
                        <div class="form-group">
                            <select class="form-control selector_e" 
                                    name="nivel_estudio" 
                                    ng-model="ctrl.formacion.nivel_estudio" 
                                    ng-options="Nivel.ID as Nivel.Value for Nivel in ctrl.NvlFormacion"
                                    clase="text_valid_e"
                                    required-message="'El campo no puede estar vacio'"
                                    required>
                                <option value="">--- Seleccione opción ---</option>
                            </select>
                        </div>
                        <label class="etiqueta_e">Area de estudio:</label>
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="area_estudio" 
                                ng-model="ctrl.formacion.area_estudio" />
                        </div>
                        <label class="etiqueta_e">Estado:</label>
                        <div class="form-group">
                            <div class="form-inline">
                                <label class="checkbox-inline">
                                    <input type="radio" value="1" name="estado" ng-model="ctrl.formacion.estado"> Cursando
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" value="2" name="estado" ng-model="ctrl.formacion.estado"> Culminado
                                </label>
                                <label class="checkbox-inline">
                                    <input type="radio" value="3" name="estado" ng-model="ctrl.formacion.estado"> Aplazado/Abandonado
                                </label>
                            </div>                                
                        </div>
                        <label class="etiqueta_e">Inicio<i class="required">*</i>:</label>
                        <div class="form-group">
                            <div class="form-inline">
                                    <select class="form-control selector_e_min" 
                                            name="mes_inicio" 
                                            ng-model="ctrl.formacion.mes_inicio" 
                                            ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses" 
                                            clase="text_valid_e"
                                            parent="anio_inicio">
                                        <option value="">--- Seleccione Mes ---</option>
                                    </select>
                                    <select class="form-control selector_e_min" 
                                            name="anio_inicio" 
                                            ng-model="ctrl.formacion.anio_inicio" 
                                            ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios" 
                                            clase="text_valid_e"
                                            validator = "ctrl.dateValidator(ctrl.formacion.mes_inicio, ctrl.formacion.anio_inicio) === true"
                                            invalid-message = "ctrl.dateValidator(ctrl.formacion.mes_inicio, ctrl.formacion.anio_inicio)"
                                            required-message="'Debe seleccionar una opción'"
                                            required>
                                        <option value="">--- Seleccione Año ---</option>
                                    </select>
                            </div>
                        </div>
                        <label class="etiqueta_e">Fin</label>
                        <div class="form-group">
                            <div class="form-inline">
                                <select class="form-control selector_e_min" 
                                        name="mes_fin" ng-model="ctrl.formacion.mes_fin" 
                                        ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses"
                                        parent="anio_fin">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" 
                                        name="anio_fin" 
                                        ng-model="ctrl.formacion.anio_fin" 
                                        ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios"
                                        clase="text_valid_e"
                                        validator = "ctrl.dateValidator(ctrl.formacion.mes_fin, ctrl.formacion.anio_fin) === true"
                                        invalid-message = "ctrl.dateValidator(ctrl.formacion.mes_fin, ctrl.formacion.anio_fin)">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_formacion" class="btn btn-primary" >{{(ctrl.formacion.id===-1)?'Añadir':'Editar'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="form_multa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de multas</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="forma_multa" angular-validator-submit="ctrl.submitMulta()"  
                          angular-validator class="form-horizontal" novalidate>
                        <input type="hidden" name="id" ng-model="ctrl.multa.id"/>
                        <input type="hidden" name="cod" ng-model="ctrl.multa.cod"/>
                        <label class="etiqueta_e">Lugar:<i class="required">*</i>:</label>                            
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="lgr_multa" 
                                ng-model="ctrl.multa.lgr_multa" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.multa.lgr_multa, 4) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.multa.lgr_multa, 4)"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Fecha<i class="required">*</i>:</label>                            
                        <div class="form-group">
                            <input type="date" 
                                class="form-control texto_e" 
                                name="fch_multa" 
                                ng-model="ctrl.multa.fch_multa" 
                                clase="text_valid_e"
                                invalid-message = "'Debe ingresar una fecha valida'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Cargo<i class="required">*</i>:</label>
                        <div class="form-group"> 
                            <textarea class="form-control texto_e" 
                                name="cgo_multa" 
                                ng-model="ctrl.multa.cgo_multa" 
                                clase="text_valid_e"
                                validator = "ctrl.lengthValidator(ctrl.multa.cgo_multa, 6) === true"
                                invalid-message = "ctrl.lengthValidator(ctrl.multa.cgo_multa, 6)"
                                required-message="'El campo no puede estar vacio'"
                                required ></textarea>
                        </div>                        
                        <p>
                            <label class="etiqueta_e">Estado:</label>
                            <div class="form-inline">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="1" name="pgo_multa" ng-model="ctrl.multa.pgo_multa"> Pagado
                                </label>
                            </div>                                
                        </p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_multa" class="btn btn-primary" >{{(ctrl.multa.id===-1)?'Añadir':'Editar'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="form_accidente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de accidentes</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="forma_accidente" angular-validator-submit="ctrl.submitAccidente()" 
                          class="form-horizontal" angular-validator novalidate>
                        <label class="etiqueta_e">Lugar<i class="required">*</i>:</label>                            
                        <div class="form-group">
                            <input type="text" 
                                class="form-control texto_e" 
                                name="lgr_accidente" 
                                ng-model="ctrl.accidente.lugar" 
                                clase="text_valid_e"
                                invalid-message = "'Debe ingresar una fecha valida'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Fecha<i class="required">*</i>:</label>                            
                        <div class="form-group">
                            <input type="date" 
                                class="form-control texto_e" 
                                name="fch_accidente" 
                                ng-model="ctrl.accidente.fch_accidente" 
                                clase="text_valid_e"
                                invalid-message = "'Debe ingresar una fecha valida'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <p>
                            <label class="etiqueta_e">Tipo accidente<i class="required">*</i>:</label>                           
                            <select 
                                class="form-control selector_e" 
                                name="tipo" ng-model="ctrl.accidente.tipo" 
                                ng-options="Tipo.ID as Tipo.Tipo for Tipo in ctrl.tipoAccidentes"
                                clase="text_valid_e"
                                required-message="'El campo no puede estar vacio'"
                                required>
                                <option value="">--- Seleccione opción ---</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Eventos:</label>
                            <div class="form-inline">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="muertos" ng-model="ctrl.accidente.muertos"> Muertes
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"  name="heridos" ng-model="ctrl.accidente.heridos"> Heridos
                                </label>
                            </div>
                        </p>  
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_accidente" class="btn btn-primary" >{{(ctrl.accidente.id===-1)?'Añadir':'Editar'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="form_judicial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de procesos judiciales</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="forma_judicial" angular-validator-submit="ctrl.submitJudicial()" 
                          class="form-horizontal" angular-validator novalidate>
                        <label class="etiqueta_e">Fecha:<i class="required">*</i>:</label> 
                        <div class="form-group">
                            <input type="date" 
                                class="form-control texto_e" 
                                name="fch_procjudicial" 
                                clase="text_valid_e"
                                ng-model="ctrl.judicial.fch_procjudicial" 
                                invalid-message = "'Debe ingresar una fecha valida'"
                                required-message="'El campo no puede estar vacio'"
                                required />
                        </div>
                        <label class="etiqueta_e">Delito<i class="required">*</i>:</label>                           
                        <div class="form-group">
                            <textarea class="form-control texto_e" 
                            name="del_procjudicial" 
                            ng-model="ctrl.judicial.del_procjudicial" 
                            clase="text_valid_e"
                            validator = "ctrl.lengthValidator(ctrl.judicial.del_procjudicial, 6) === true"
                            invalid-message = "ctrl.lengthValidator(ctrl.judicial.del_procjudicial, 6)"
                            required-message="'El campo no puede estar vacio'"
                            required ></textarea>
                        </div>
                        <p>
                            <label class="etiqueta_e">Eventos:</label>
                            <div class="form-inline">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="1" name="act_procjudicial" ng-model="ctrl.judicial.act_procjudicial"> Activo
                                </label>
                            </div>
                        </p>  
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_judicial" class="btn btn-primary" >{{(ctrl.judicial.id===-1)?'Añadir':'Editar'}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="form_admision" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de Admision</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submitAdminision()" name="exp_laboral" class="form-horizontal" novalidate>
                        <p><b>Conductor: </b>{{ctrl.usuario_dp.nombre + ' ' + ctrl.usuario_dp.apellido}}</p>
                        <p>{{(ctrl.usuario_dp.verificado)?"Este conductor ya esta admitido en la plataforma, ¿desea revocarle la adminsión?":"Verificando todos los datos de este conductor, ¿desea usted darle la admision al sistema?"}}</p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" ng-show="!ctrl.usuario_dp.verificado" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Admitiendo..." id="btn_admitir" class="btn btn-primary" >Admitir</button>                        
                            <button type="submit" ng-show="ctrl.usuario_dp.verificado" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Retirando..." id="btn_admitir" class="btn btn-primary" >Retirar adminsión</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    <!-- end wrapper -->

    
</body>

</html>
