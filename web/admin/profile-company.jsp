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
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:::TuConductor:::</title>
    <!-- Core CSS - Include with every page -->
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
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
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="../js/dist/angular-datatables.min.js"></script>   
    
    <script type="text/javascript">
        var btn_add_empresa = $("#btn_add_empresa");
        var modal_editempresa, modal_editadicional;
        $(document).ready(function (){
            modal_editempresa=$("#Modal_editempresa");
            modal_editadicional=$("#Modal_info");
        });
        function Open_dialog_filter(){
            $( "#Modal_filter" ).modal("show");
        }
        function Open_dialog_tokens(){
            $( "#Modal_tokens" ).modal("show");
        }
        function Open_dialog_info(){
            $("#Modal_info").modal("show");
        }
        function Open_dialog_edit(){
            $("#Modal_editempresa").modal("show");
        }
    

    </script>
    
    
    <script type="text/javascript" src="../js/app.js"></script>      
    <script type="text/javascript" src="../js/angular/profile.js"></script>
    <script type="text/javascript" src="../js/angular/sign.js"></script>
    <script type="text/javascript" src="../js/angular/wall.js"></script>
    <script type="text/javascript" src="../js/angular/oferta.js"></script>
    
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
    <div id="wrapper"  ng-controller="ProfileAdminController as ctrl">
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
                    <li class="selected">
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Inicio</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Perfil<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Editar perfil</a>
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
                    <h1 class="page-header">Perfil Administrativo (Empresas)</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Lista de Empresas
                        </div>
                        <div class="panel-body">
                            <div>
                                <table class="table table-striped table-bordered dt-responsive nowrap compact table-hover" width="100%" cellspacing="0" datatable="ng" dt-options="ctrl.dtOptions" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>NIT</th>
                                            <th>Razon social</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeA tooltip-demo" ng-repeat="e in ctrl.list_empresas">
                                            <td style="text-align: center;"><span ng-bind="e.nit"></span></td>
                                            <td><span ng-bind="e.r_social"></span></td>
                                            <td><span ng-bind="e.dir"></span></td>
                                            <td><span ng-bind="e.tel"></span></td>
                                            <td style="text-align: center; cursor: pointer;">
                                                <img src="../assets/img/cam_com_icon.png" class="btn_icon_red" style="cursor: pointer;" data-toggle="tooltip" data-placement="left" title="Descargar Camara de comercio"/>
                                                <img src="../assets/img/info_icon.png" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Informacion adicional" ng-click="ctrl.open_info_adicional(e.nit)"/>
                                                <img src="../assets/img/edit2_icon.png" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Editar empresa" ng-click="ctrl.edit_empresa(e.nit)"/>
                                                <img src="../assets/img/bloquear_icon.png" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Bloquear empresa"/></td>
                                        </tr>                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>

            </div>


         


        </div>
        <!-- end page-wrapper -->

        
    <div class="modal fade" id="Modal_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Información adicional</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-4" style="cursor: pointer;" onclick="Open_dialog_tokens()">
                            <div class="panel panel-primary text-center">
                                <div class="panel-body blue">
                                    <img src="../assets/img/token_icon.png" />
                                </div>
                                <div class="panel-footer">
                                    <span class="panel-eyecandy-title">Tokens
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="panel panel-primary text-center">
                                <div class="panel-body blue">
                                    <img src="../assets/img/oferta_icon.png" />
                                    <label>{{ctrl.empresa.tot_ofr}} </label>
                                </div>
                                <div class="panel-footer">
                                    <span class="panel-eyecandy-title">Ofertas realizadas 
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="panel panel-primary text-center">
                                <div class="panel-body blue">
                                    <img src="../assets/img/vista_icon.png" />
                                    <label>{{ctrl.empresa.tot_tkn}}</label>
                                </div>
                                <div class="panel-footer">
                                    <span class="panel-eyecandy-title">Vistas realizadas
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="Modal_editempresa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Edición Empresa</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submitExp()" name="add_empresa" class="form-horizontal" novalidate>
                        <p ng-class="{ 'has-error': add_empresa.nit.$error.required || add_empresa.nit.$error.minlength }">
                            <label class="etiqueta_e">NIT<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="nit" ng-model="ctrl.empresa.nit" placeholder="Nit de la empresa" minlength="6" required />
                        </p>
                        <p ng-class="{ 'has-error': add_empresa.r_social.$error.required || add_empresa.r_social.$error.minlength }">
                            <label class="etiqueta_e">Razon social<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="r_social" ng-model="ctrl.empresa.r_social" placeholder="Razon social de la empresa" minlength="6" required />
                        </p>
                        <p ng-class="{ 'has-error': add_empresa.dir.$error.required || add_empresa.dir.$error.minlength }">
                            <label class="etiqueta_e">Dirección<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="dir" ng-model="ctrl.empresa.dir" placeholder="Direccion de la empresa" minlength="6" required />
                        </p>
                        <p  ng-class="{ 'has-error': add_empresa.tel.$error.required || add_empresa.tel.$error.minlength }">
                            <label class="etiqueta_e">Telefono<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="tel" ng-model="ctrl.empresa.tel" placeholder="Telefono de la empresa" minlength="7" required />
                        </p>
                        <p  ng-class="{ 'has-error': add_empresa.nombre_replegal.$error.required || add_empresa.nombre_replegal.$error.minlength }">
                            <label class="etiqueta_e">Nombre Rep. legal<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="nombre_replegal" ng-model="ctrl.empresa.nombre_replegal" placeholder="Nombre del rep. legal de la empresa" minlength="6" required/>
                        </p>
                        <p  ng-class="{ 'has-error': add_empresa.doc_replegal.$error.required || add_empresa.doc_replegal.$error.minlength }">
                            <label class="etiqueta_e">Documento Rep. legal<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="doc_replegal" ng-model="ctrl.empresa.doc_replegal" placeholder="Documento del rep. legal de la empresa" minlength="6" required/>
                        </p>
                        <p>
                            <label class="etiqueta_e">Email Rep. legal:</label>
                            <input type="text" class="form-control texto_e" name="email_replegal" ng-model="ctrl.empresa.email_replegal" placeholder="Email del rep. legal de la empresa" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Telefono Rep. legal:</label>
                            <input type="text" class="form-control texto_e" name="tel_replegal" ng-model="ctrl.empresa.tel_replegal" placeholder="Telefono del rep. legal de la empresa" />
                        </p>                        
                        
                    </form>                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" ng-disabled="add_empresa.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_empresa" class="btn btn-primary" >Editar</button>
                </div>
            </div>
        </div>
    </div>
        
       
    <div class="modal fade" id="Modal_tokens" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Informacion Tokens</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="alert alert-info text-center">
                                <i class="fa fa-tags fa-3x"></i>&nbsp;<b>{{ctrl.empresa.ofertas_disp}} </b>Ofertas disponibles  
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="alert alert-info text-center">
                                <i class="fa fa-eye fa-3x"></i>&nbsp;<b>{{ctrl.empresa.tkn_disp}} </b>Vistas disponibles

                            </div>
                        </div>
                        <!--end quick info section -->
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Tabla de trazabilidad
                        </div>
                        <div class="panel-body">
                            
                            <div>
                                <table class="table table-striped table-bordered dt-responsive nowrap compact table-hover" cellspacing="0" width="100%"  datatable="ng" dt-options="ctrl.dtOptions">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Opcion realizada</th>
                                            <th>Informacion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeA tooltip-demo"  ng-repeat="tr in ctrl.empresa.trazas">
                                            <td style="text-align: center;"><span ng-bind="tr.fecha"></span></td>
                                            <td><span ng-bind="tr.hora"></span></td>
                                            <td style="text-align: center;"><span ng-bind="tr.evento"></span></td>
                                            <td style="text-align: center; cursor: pointer;"><img src="../assets/img/hv_icon.png" class="btn_icon_red" data-toggle="tooltip" data-placement="left" title="Descargar H.V"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    <!-- end wrapper -->
    
</body>

</html>