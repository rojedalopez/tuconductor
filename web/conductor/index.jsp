<%@page import="bean.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "No-chache"); 
response.setHeader("Expires", "0"); 
response.setHeader("Cache-Control", "no-cache"); 
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
        var popup = $( "#Modal_comment" );
        $(document).ready(function(){
           $("#Modal_viewoferta").modal("show"); 
        });
        function open_modal_subirhv(){
            $("#Modal_hv").modal("show");
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
    <div id="wrapper"  ng-controller="WallController as ctrl">
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
                        <i class="fa fa-cloud-upload"></i>&nbsp;<b>Subir Hoja de Vida</b>
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
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Inicio</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Perfil<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="editprofile.jsp">Editar perfil</a>
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
                <div class="col-lg-8">
                    <div class="alert alert-info text-center">
                        <!--<i class="fa fa-comment"></i>&nbsp;<a href="#" onclick="visualizar_addcomment()">Comparte una actualización</a>-->
                        <span class="form-inline">
                            <label ><i class="fa fa-edit"></i> Palabra clave:</label>
                            <input type="text" class="form-control texto_e" name="p_clave" placeholder="Palabra clave"/>  
                            <label ><i class="fa fa-map-marker"></i> Lugar:</label>
                            <select class="form-control selector_e_min" name="lugar" >
                                <option>Lugar</option>
                            </select>                            
                            <button class="btn btn-warning" id="btn-filtrar">
                                    Buscar ofertas
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-lg-8">
                    <!-- Chat Panel Example-->
                <div class="chat-panel panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-comments fa-fw"></i>
                        Ofertas
                    </div>

                    
                    <div class="panel-body" >
                        
                        <div class="col-lg-12" ng-repeat="of in ctrl.ofertas">
                            <div class="panel panel-info">
                                <div class="panel-heading">    
                                    <i class="fa fa-map-marker"> <b>Barranquilla</b></i>
                                    <button type="button" ng-click="ctrl.ver(of.id)" class="close"><img src="../assets/img/vista_icon.png" width="18" height="18"></button>
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
                    <!--End Chat Panel Example-->
            </div>
                
            <div class="col-lg-4">
                <div class="panel panel-primary text-center">
                    <div class="panel-body blue">
                        <i class="fa fa-bar-chart-o fa-3x"></i>
                        <h3>20,741 </h3>
                    </div>
                    <div class="panel-footer">
                        <span class="panel-eyecandy-title">OFERTAS DISPONIBLES
                        </span>
                    </div>
                </div>
            </div>
            
                
        </div>


         


        </div>
        <!-- end page-wrapper -->
    
        
    
    <div class="modal fade" id="Modal_hv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Mi hoja de vida</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="form_hv" ng-submit="ctrl.submitHV()">
                    <p>
                        <label class="etiqueta_e">Seleccionar H.V:</label>
                        <input name="file" type="file" uploader-model="ctrl.hoja_vida.file" accept=".pdf, .docx" class="form-control texto" required/>

                    </p>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped" >
                                            <thead>
                                                <tr>
                                                    <th>Fecha</th>
                                                    <th>Hoja de vida</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody class='tooltip-demo'>                                                
                                                <tr>
                                                    <td>{{ctrl.hoja_vida.fecha}}</td>
                                                    <td>{{ctrl.hoja_vida.nombre}}</td>
                                                    <td style="text-align: center;">
                                                        <a target="_blank" href="../upload/{{ctrl.hoja_vida.archivo}}"><img src="../assets/img/hv_icon.png" width="18" height="18" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Descargar H.V"></a>
                                                        <img src="../assets/img/delete_icon.png" width="18" height="18" class="btn_icon" data-toggle="tooltip" data-placement="left" title="Eliminar H.V">                                                        
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary" ng-disabled="form_hv.$invalid">Subir hoja de vida</button>
                    </div>
                </form>

                </div>
                
            </div>
        </div>
    </div>
        
        
    <div class="modal fade" id="Modal_viewoferta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Oferta seleccionada</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-info">
                        <label style="font-size: 16px;">Se Requiere ingeniero de sistemas,Se Requiere ingeniero de sistemas</label>
                    </div>
                    <label style="font-size: 14px; color: #0088cc;">Descripción:</label><br/>
                    <p>Se requiere personal con experiencia mínima de 6 meses en ventas, atención al cliente, manejo de dinero, manejo de caja, datafono, salario: 689455 + prestaciones + Auxilio de Transporte. Horario: lunes a domingo, incluido festivos por turnos rotativos de 8 horas, se descansa un día cada 8 días.</p>
                    <label style="font-size: 14px; color: #0088cc;">Localizacion:</label>
                    <p><i class="fa fa-map-marker"></i> Barranquilla</p>
                    <label style="font-size: 14px; color: #0088cc;">Salario:</label>
                    <p><i class="fa fa-dollar"></i> 1.800.000</p>
                    <label style="font-size: 14px; color: #0088cc;">Cantidad de vacantes:</label>
                    <p><i class="fa fa-folder-open"></i> 4</p>
                    <label style="font-size: 14px; color: #0088cc;">Fecha de contratación:</label>
                    <p><i class="fa fa-calendar"></i> 09/08/2016</p>
                <form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary" ng-disabled="form_hv.$invalid">Aplicar</button>
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


