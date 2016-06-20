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
    <script src="../js/bootstrap.min.js"></script>
    <!-- Angular Material requires Angular.js Libraries -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-messages.min.js"></script>

    <!-- Angular Material Library -->
    <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.js"></script>
    <script src="../js/dist/angular-datatables.min.js"></script>   
    
    
    <script type="text/javascript">
        var Modal_confirmacion, btn_add_compra;
        
        $(document).ready(function(){
            Modal_confirmacion = $("#Modal_confirmacion");
            btn_add_compra = $("#btn_add_compra");
        });
        
        function Open_dialog_filter(){
            $( "#Modal_filter" ).modal("show");
        }
        function Open_dialog_tokens(){
            $( "#Modal_tokens" ).modal("show");
        }
        
        function Open_confirmation(){
            $( "#Modal_confirmacion" ).modal("show");
        }


    </script>
    
    <script type="text/javascript" src="../js/app.js"></script>      
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
    <div id="wrapper"  ng-controller="WallEmpresaController as ctrl">
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
                <li style="cursor: pointer;" onclick="open_modal_subirhv()">                    
                    <div class="alert2 alert-info text-center" style="position: relative; top:-7px;">
                        <i class="fa fa-shopping-cart"></i>&nbsp;<b>Comprar Tokens</b>
                    </div>
                </li>
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
                        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>Inicio</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> Perfil<span class="fa arrow"></span></a>
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
                    <h1 class="page-header">Mi Perfil</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <div class="col-lg-4" style="cursor: pointer;" onclick="Open_dialog_filter()">
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body blue">
                            <img src="../assets/img/filter_icon.png" />
                            <label>FILTROS</label>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">Mejorar mi busqueda
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
                <div class="col-lg-4 tooltip-demo" style="cursor: pointer;" onclick="Open_dialog_tokens()">
                    <div class="panel panel-primary text-center no-boder" >
                        <div class="panel-body yellow">
                            <img src="../assets/img/token_icon.png" />
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title"><i class="fa fa-tags"></i> Mis Tokens
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Lista de conductores
                        </div>
                        <div class="panel-body">
                            <div>
                                <table class="table table-striped table-bordered dt-responsive nowrap compact table-hover" cellspacing="0" width="100%"  datatable="ng" dt-options="ctrl.dtOptions" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Puntaje</th>
                                            <th>Tipo Vehiculo</th>
                                            <th>Licencia</th>
                                            <th>Exp.(Años)</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>H.V</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <tr class="gradeA tooltip-demo" ng-repeat="emp in ctrl.empleados">
                                            <td style="text-align: center;"><spam ng-bind="emp.puntaje"></spam></td>
                                            <td>Camion</td>
                                            <td style="text-align: center;">C3</td>
                                            <td style="text-align: center;"><spam ng-bind="emp.experiencia"></spam></td>
                                            <td><spam ng-bind="emp.nombre"></spam></td>
                                            <td><spam ng-bind="emp.apellido"></spam></td>
                                            <td style="text-align: center; cursor: pointer;"><a href="../upload/{{emp.hoja_vida}}"><img src="../assets/img/hv_icon.png" class="btn_icon_red" data-toggle="tooltip" data-placement="left" title="Descargar H.V"/></a></td>
                                            <td style="text-align: center; cursor: pointer;"><a  ng-click="ctrl.openAdquirir(emp.cod)"><img src="../assets/img/token2_icon.png" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Obtener este conductor"/></a></td>
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

    

    
    <div class="modal fade" id="Modal_filter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Filtros de busqueda</h4>
                </div>
                <div class="modal-body">
                    prueba
                </div>
            </div>
        </div>
    </div>
        
        
    <div class="modal fade" id="Modal_confirmacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Confirmación</h4>
                </div>
                <div class="modal-body">
                    ¿Desea usted obtener la informacion total y detallada del Sr(a) {{ctrl.empleado.nombre}} {{ctrl.empleado.apellido}}?
                    <div style="color: green;font-style: italic;">{{ctrl.mensajeModal}}</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" ng-disabled="ctrl.empleado.adquirir" ng-click="ctrl.adquirirEmp(ctrl.empleado.cod)" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Ejecutando..." id="btn_add_compra" class="btn btn-primary" >Adquirir</button>
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
                                <i class="fa fa-tags fa-3x"></i>&nbsp;<b> {{ctrl.info_empresa.ofertas_disp}} </b>Ofertas disponibles  
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="alert alert-info text-center">
                                <i class="fa fa-eye fa-3x"></i>&nbsp;<b>{{ctrl.info_empresa.tkn_disp}} </b>Vistas disponibles

                            </div>
                        </div>
                        <!--end quick info section -->
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Tabla de trazabilidad
                        </div>
                        <div class="panel-body">
                            
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Opcion realizada</th>
                                            <th>Informacion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeA tooltip-demo" ng-repeat="tr in ctrl.list_trazas">
                                            <td style="text-align: center;">{{tr.fecha}}</td>
                                            <td>{{tr.hora}}</td>
                                            <td style="text-align: center;">{{tr.evento}}</td>
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