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
    <script type="text/javascript" src="../js/date.js"></script>
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
        
        
        $(document).ready(function(){
            
        });
        
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
                
                <form ng-submit="ctrl.submitDP()" name="datos_personales" novalidate>
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                VERIFICACION Y PUNTUACION
                            </div>
                            
                            <div class="panel-body">
                                <div class="col-lg-8 col-lg-offset-2">                                    
                                    <p>
                                        <input type="checkbox" value="1" name="chkbox" > Validacion datos personales.
                                        <textarea class="form-control" placeholder="Nota..."></textarea>
                                    </p>
                                    <hr>
                                    <p>
                                        <input type="checkbox" value="1" name="chkbox" > Validacion formacion.
                                        <textarea class="form-control" placeholder="Nota..."></textarea>
                                    </p>
                                    <p>
                                        <div class="form-group">
                                            <div class="form-group" style="text-align: right;">
                                                <button type="submit" ng-disabled="datos_personales.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_cambios" class="btn btn-primary" >Guardar cambios</button>
                                                <input type="reset" class="btn btn-default" value="Cancelar">
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
        
        
        <div class="modal fade" id="form_experiencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de experiencia laboral</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submitExp()" name="exp_laboral" class="form-horizontal" novalidate>
                        <p ng-class="{ 'has-error': exp_laboral.empresa.$error.required || exp_laboral.empresa.$error.minlength }">
                            <label class="etiqueta_e">Empresa<i class="required">*</i>:</label>
                            <input type="hidden" name="id" ng-model="ctrl.exp_laboral.id"/>
                            <input type="hidden" name="cod" ng-model="ctrl.exp_laboral.cod"/>
                            <input type="text" class="form-control texto_e" name="empresa" ng-model="ctrl.exp_laboral.empresa"  placeholder="Nombre de la empresa" minlength="5" required/>
                        </p>
                        <p ng-class="{ 'has-error': exp_laboral.cargo.$error.required || exp_laboral.cargo.$error.minlength }">
                            <label class="etiqueta_e">Cargo<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="cargo" ng-model="ctrl.exp_laboral.cargo" placeholder="Cargo realizado" minlength="5" required/>
                        </p>
                        <p>
                            <label class="etiqueta_e">Salario:</label>
                            <input type="number" class="form-control texto_e_min" name="salario" ng-model="ctrl.exp_laboral.salario" placeholder="$" />
                        </p>
                        <p>
                            <label class="etiqueta_e">Bonos:</label>
                            <input type="number" class="form-control texto_e_min" name="bonos" ng-model="ctrl.exp_laboral.bonos" placeholder="$" />
                        </p>
                        <p ng-class="{ 'has-error': exp_laboral.supervisor.$error.required || exp_laboral.supervisor.$error.minlength }">
                            <label class="etiqueta_e">Supervisor<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="supervisor" ng-model="ctrl.exp_laboral.supervisor" placeholder="Nombre / Apellido" minlength="6" required/>
                        </p>
                        <p ng-class="{ 'has-error': exp_laboral.telefono.$error.required || exp_laboral.telefono.$error.minlength }">
                            <label class="etiqueta_e">Telefono<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="telefono" ng-model="ctrl.exp_laboral.telefono" placeholder=""  minlength="6" required />
                        </p>
                        <p>
                            <label class="etiqueta_e">Pais:</label>
                            <select class="form-control selector_e" name="pais" ng-model="ctrl.exp_laboral.pais" ng-options="Pais.ID as Pais.Nombre for Pais in ctrl.PaisesExp" ng-change="ctrl.selectPaisExp(ctrl.exp_laboral.pais)">
                                <option>--- Seleccione Pais ---</option>
                            </select>
                        </p>
                        <p>
                            <label class="etiqueta_e">Dpto:</label>
                            <select class="form-control selector_e" ng-show="ctrl.colombiaExp" name="depto" ng-model="ctrl.exp_laboral.depto" ng-options="dpto.id as dpto.departamento for dpto in ctrl.dptosExp" ng-change="ctrl.selectDptoExp(ctrl.exp_laboral.depto)">
                                <option value="">--- Seleccione Departamento ---</option>
                            </select>
                            <input type="text" ng-show="!ctrl.colombiaExp" class="form-control texto"  name="depart" ng-model="ctrl.exp_laboral.depart" >
                        </p>
                        <p>
                            <label class="etiqueta_e">Ciudad:</label>
                            <select class="form-control selector_e" ng-show="ctrl.colombiaExp" name="ciudad" ng-model="ctrl.exp_laboral.ciudad" ng-options="ciudad for ciudad in ctrl.ciudadesExp">
                                <option value="">--- Seleccione Ciudad ---</option>
                            </select>
                            <input type="text" ng-show="!ctrl.colombiaExp" class="form-control texto"  name="ciudad" ng-model="ctrl.exp_laboral.ciudad" >
                        </p>
                        <p ng-class="{ 'has-error': exp_laboral.empresa.$error.required || exp_laboral.empresa.$error.minlength }">
                            <label class="etiqueta_e">Direccion<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="direccion" ng-model="ctrl.exp_laboral.direccion" placeholder="Direccion"  minlength="6" required />
                        </p>
                        <p  ng-class="{ 'has-error': exp_laboral.mes_inicio.$error.required || exp_laboral.anio_inicio.$error.required}">
                            <label class="etiqueta_e">Inicio<i class="required">*</i>:</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_inicio" ng-model="ctrl.exp_laboral.mes_inicio" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses" required>
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_inicio" ng-model="ctrl.exp_laboral.anio_inicio" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios" required>
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        <p>
                            <label class="etiqueta_e">Fin</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" ng-disabled="ctrl.exp_laboral.labora" name="mes_fin" ng-model="ctrl.exp_laboral.mes_fin" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" ng-disabled="ctrl.exp_laboral.labora" name="anio_fin" ng-model="ctrl.exp_laboral.anio_fin" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
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
                            <textarea class="form-control area_e" name="retiro" ng-disabled="ctrl.exp_laboral.labora" ng-model="ctrl.exp_laboral.retiro" rows="3" placeholder="Razones de su retiro..." ></textarea>
                        </p>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" ng-disabled="exp_laboral.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_exp" class="btn btn-primary" >{{(ctrl.exp_laboral.id===-1)?'Añadir':'Editar'}}</button>
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
                    <form role="form" name="form_formacion" ng-submit="ctrl.submitForm()" class="form-horizontal" novalidate>
                        <p ng-class="{ 'has-error': form_formacion.c_educativo.$error.required || form_formacion.c_educativo.$error.minlength }">
                            <label class="etiqueta_e">Centro educativo<i class="required">*</i>:</label>                            
                            <input type="text" class="form-control texto_e" name="c_educativo" ng-model="ctrl.formacion.c_educativo" placeholder="Nombre del centro educativo" minlength="6" required />
                        </p>
                        <p>
                            <label class="etiqueta_e">Nivel de estudios:</label>                           
                            <select class="form-control selector_e" name="nivel_estudio" ng-model="ctrl.formacion.nivel_estudio" ng-options="Nivel.ID as Nivel.Value for Nivel in ctrl.NvlFormacion">
                                <option value="">--- Seleccione opción ---</option>
                            </select>
                        </p>
                        <p ng-class="{ 'has-error': form_formacion.area_estudio.$error.required || form_formacion.area_estudio.$error.minlength }">
                            <label class="etiqueta_e">Area de estudio<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="area_estudio" ng-model="ctrl.formacion.area_estudio" placeholder="Area de estudio" minlength="5" required />
                        </p>
                        <p>
                            <label class="etiqueta_e">Estado:</label>
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
                        </p>
                        <p  ng-class="{ 'has-error': form_formacion.mes_inicio.$error.required || form_formacion.anio_inicio.$error.required}">
                            <label class="etiqueta_e">Inicio<i class="required">*</i>:</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_inicio" ng-model="ctrl.formacion.mes_inicio" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses" required>
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_inicio" ng-model="ctrl.formacion.anio_inicio" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios" required>
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        <p>
                            <label class="etiqueta_e">Fin</label>
                            <div class="form-group form-inline">
                                <select class="form-control selector_e_min" name="mes_fin" ng-model="ctrl.formacion.mes_fin" ng-options="Mes.ID as Mes.Mes for Mes in ctrl.Meses">
                                    <option value="">--- Seleccione Mes ---</option>
                                </select>
                                <select class="form-control selector_e_min" name="anio_fin" ng-model="ctrl.formacion.anio_fin" ng-options="Anio.ID as Anio.Year for Anio in ctrl.Anios">
                                    <option value="">--- Seleccione Año ---</option>
                                </select>
                            </div>
                        </p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" ng-disabled="form_formacion.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_formacion" class="btn btn-primary" >{{(ctrl.formacion.id===-1)?'Añadir':'Editar'}}</button>
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
                    <form role="form" name="form_multa" ng-submit="ctrl.submitMulta()" class="form-horizontal" novalidate>
                        <p ng-class="{ 'has-error': form_multa.lgr_multa.$error.required || form_multa.lgr_multa.$error.minlength }">
                            <label class="etiqueta_e">Lugar:<i class="required">*</i>:</label>                            
                            <input type="text" class="form-control texto_e" name="lgr_multa" ng-model="ctrl.multa.lgr_multa" placeholder="Lugar de la multa" minlength="3" required />
                        </p>
                        <p ng-class="{ 'has-error': form_multa.fch_multa.$error.required }">
                            <label class="etiqueta_e">Fecha:<i class="required">*</i>:</label>                            
                            <input type="date" class="form-control texto_e" name="fch_multa" ng-model="ctrl.multa.fch_multa" placeholder="Fecha de la multa" required />
                        </p>
                        <p ng-class="{ 'has-error': form_multa.cgo_multa.$error.required  || form_multa.cgo_multa.$error.minlength }">
                            <label class="etiqueta_e">Cargo:</label>
                            <textarea class="form-control texto_e" name="cgo_multa" ng-model="ctrl.multa.cgo_multa" placeholder="Cargo de la multa" minlength="6" required ></textarea>
                        </p>                        
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
                            <button type="submit" ng-disabled="form_multa.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_multa" class="btn btn-primary" >{{(ctrl.multa.id===-1)?'Añadir':'Editar'}}</button>
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
                    <form role="form" name="form_accidente" ng-submit="ctrl.submitAccidente()" class="form-horizontal" novalidate>
                        <!--<p ng-class="{ 'has-error': form_accidente.lugar.$error.required || form_accidente.lugar.$error.minlength }">
                            <label class="etiqueta_e">Lugar:<i class="required">*</i>:</label>                            
                            <input type="text" class="form-control texto_e" name="lugar" ng-model="ctrl.accidente.lugar" placeholder="Lugar de la multa" minlength="3" required />
                        </p>-->
                        <p ng-class="{ 'has-error': form_accidente.fch_accidente.$error.required }">
                            <label class="etiqueta_e">Fecha:<i class="required">*</i>:</label>                            
                            <input type="date" class="form-control texto_e" name="fch_accidente" ng-model="ctrl.accidente.fch_accidente" placeholder="Fecha de la multa" required />
                        </p>
                        <p>
                            <label class="etiqueta_e">Tipo accidente:</label>                           
                            <select class="form-control selector_e" name="tipo" ng-model="ctrl.accidente.tipo" ng-options="Tipo.ID as Tipo.Tipo for Tipo in ctrl.tipoAccidentes">
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
                            <button type="submit" ng-disabled="form_accidente.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_accidente" class="btn btn-primary" >{{(ctrl.accidente.id===-1)?'Añadir':'Editar'}}</button>
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
                    <form role="form" name="form_judicial" ng-submit="ctrl.submitJudicial()" class="form-horizontal" novalidate>
                        <!--<p ng-class="{ 'has-error': form_accidente.lugar.$error.required || form_accidente.lugar.$error.minlength }">
                            <label class="etiqueta_e">Lugar:<i class="required">*</i>:</label>                            
                            <input type="text" class="form-control texto_e" name="lugar" ng-model="ctrl.accidente.lugar" placeholder="Lugar de la multa" minlength="3" required />
                        </p>-->
                        <p ng-class="{ 'has-error': form_judicial.fch_procjudicial.$error.required }">
                            <label class="etiqueta_e">Fecha:<i class="required">*</i>:</label>                            
                            <input type="date" class="form-control texto_e" name="fch_procjudicial" ng-model="ctrl.judicial.fch_procjudicial" placeholder="Fecha del delito" required />
                        </p>
                        <p ng-class="{ 'has-error': form_judicial.del_procjudicial.$error.required  || form_judicial.del_procjudicial.$error.minlength }">
                            <label class="etiqueta_e">Delito:</label>                           
                            <textarea class="form-control texto_e" name="del_procjudicial" ng-model="ctrl.judicial.del_procjudicial" placeholder="Descripcion del delito" minlength="4" required ></textarea>
                        </p>
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
                            <button type="submit" ng-disabled="form_judicial.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_guardar_judicial" class="btn btn-primary" >{{(ctrl.judicial.id===-1)?'Añadir':'Editar'}}</button>
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
                        <p>{{(ctrl.usuario_dp.verificado)?"Este conductor ya esta adminitido en la plataforma, ¿desea revocarle la adminsión?":"Verificando todos los datos de este conductor, ¿desea usted darle la admision al sistema?"}}</p>
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