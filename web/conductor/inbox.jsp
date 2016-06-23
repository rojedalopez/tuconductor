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
   }else if(u.getRol()==2){
        response.sendRedirect("../empresa/");
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
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
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
    
    <script type="text/javascript" src="../js/date.js"></script>
    <script type="text/javascript" src="../js/app.js"></script>      
    <script type="text/javascript" src="../js/angular/profile.js"></script>
    <script type="text/javascript" src="../js/angular/sign.js"></script>
    <script type="text/javascript" src="../js/angular/wall.js"></script>
    <script type="text/javascript" src="../js/angular/oferta.js"></script>
    <script type="text/javascript" src="../js/angular/inbox.js"></script>
    <script type="text/javascript" src="../js/angular/angular-validator.js"></script>
    
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
    <div id="wrapper" ng-controller="InboxController as ctrl">
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
                    
                    <a class="dropdown-toggle"  href="inbox.jsp">
                        <span class="top-label label label-danger">3</span><i class="fa fa-envelope fa-3x"></i>
                    </a>
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
                    <h1 class="page-header">Mensajes</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            INBOX
                        </div>
                        <div class="panel-body">
                            <div class="row">                                
                                <div class="col-lg-4">
                                    <!-- Notifications-->
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <i class="fa fa-users fa-fw"></i> Mis contactos 
                                            <i class="fa fa-plus-square fa-fw close2" ></i>
                                        </div>
                                        <div class="panel-footer">
                                                <input id="btn-input" type="text" class="form-control" placeholder="Buscar contacto.."  data-provide="typeahead" />
                                        </div>
                                        <div class="panel-body" style="height: 400px; overflow-y: scroll;">
                                            <div class="list-group" ng-repeat="ch in ctrl.chats"> 
                                                
                                                <a style="cursor: pointer;" class="list-group-item" ng-click="ctrl.selectChat(ch.id)" >
                                                    <img src="https://scontent-mia1-1.xx.fbcdn.net/v/t1.0-9/1014251_10202212948658325_299875096_n.jpg?oh=26715f788a0bc8715ad33013759ca25e&oe=57CE6B55" width="24" height="24" class="img-circle"  /> <span ng-bind="ch.n_destino"></span>
                                                    <span class="pull-right text-muted small"><em style="color: {{(!ch)?'green':'red'}};">{{(!ch)?'Visto':'No Leido'}}</em>
                                                    </span>
                                                </a>
                                                
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                
                                <div class="col-lg-8">
                                    <!-- Chat Panel Example-->
                                    <div class="chat-panel panel panel-primary">
                                        <div class="panel-heading">
                                            <i class="fa fa-comments fa-fw"></i>
                                            Chat
                                        </div>

                                        <div class="panel-body" style="height: 400px; overflow-y: scroll;" id="contenedor_mensaje" reload>
                                            <ul class="chat" scroll="studentDetail">
                                                <li  ng-class="{'left clearfix': m.rol, 'right clearfix': !m.rol }"  ng-repeat="m in ctrl.mensajes">
                                                    <span ng-class="{'chat-img pull-left': m.rol, 'chat-img pull-right': !m.rol }">
                                                        <img src="{{(m.rol)?'http://placehold.it/50/FA6F57/fff':'http://placehold.it/50/55C1E7/fff'}}http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                                    </span>
                                                    <div class="chat-body clearfix">
                                                        <div class="header">
                                                            <strong ng-class="{'primary-font': m.rol, 'primary-font pull-right': !m.rol }" ><span ng-bind="m.n_destino"></span></strong>
                                                            <small ng-class="{'pull-right text-muted': m.rol, 'text-muted': !m.rol }">
                                                                <i class="fa fa-clock-o fa-fw"></i><span ng-bind="m.fecha"></span>
                                                            </small>
                                                        </div>
                                                        <p ng-class="{'pull-right': !m.rol}">
                                                            <span ng-bind="m.texto"></span>
                                                        </p>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>

                                        <div class="panel-footer">
                                            <form name="send_mensaje" ng-submit="ctrl.submitMensaje()" novalidate>
                                                    <div class="input-group">
                                                        <input type="hidden" ng-model="ctrl.nuevo_mensaje.chat" required/>
                                                        <input id="btn-input" type="text" ng-model="ctrl.nuevo_mensaje.texto" class="form-control input-sm" placeholder="Escriba su mensaje aquí..." autocomplete="off" required />
                                                        <span class="input-group-btn">
                                                            <button type="submit" ng-disabled="send_mensaje.$invalid" class="btn btn-warning btn-sm" id="btn-chat">
                                                                Enviar
                                                            </button>
                                                        </span>
                                                    </div>
                                                </form>
                                        </div>

                                    </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

         


        </div>
            
    <div class="modal fade" id="form_addchat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Iniciar chat</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submitExp()" name="exp_laboral" class="form-horizontal" novalidate>
                        <label class="etiqueta_e">Iniciar chat con:</label>
                        <input type="text" name="userchat"  class="form-control texto_e"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" ng-disabled="form_formacion.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_formacion" class="btn btn-primary" >{{(ctrl.formacion.id===-1)?'Añadir':'Editar'}}</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- end wrapper -->    
    </div>

</body>

</html>

