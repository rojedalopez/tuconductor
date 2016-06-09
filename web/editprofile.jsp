<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "No-chache"); 
response.setHeader("Expires", "0"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache", "no-cache"); 
if(session.getAttribute("user") == null){
   //redirijo al login
    response.sendRedirect("?mensaje=Acabo su sesion.");
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
                <form ng-submit="ctrl.submitDP('${sessionScope.cod}')" name="datos_personales">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                DATOS PERSONALES
                            </div>
                            
                            <div class="panel-body ">
                                <p>
                                    <label class="etiqueta" for="tip_doc">Tipo de doc<i class="required">*</i>:</label>                                        
                                    <select class="form-control selector"  name="tip_doc" ng-model="ctrl.usuario_dp.tip_doc" ng-options="tipoIdent.ID as tipoIdent.Tipo for tipoIdent in ctrl.tipoIdents" class="selector" required>
                                        <option value="" selected>--Seleccione Opcion--</option>
                                    </select>
                                    <span ng-show="datos_personales.tip_doc.$error.required && datos_personales.tip_doc.$dirty" class="required">Error</span>
                                </p>
                                <p>
                                    <label class="etiqueta" for="num_doc">No. documento<i class="required">*</i>:</label>                                            
                                    <input type="text" class="form-control texto"  name="num_doc" ng-model="ctrl.usuario_dp.num_doc" required minlength="6"/>
                                    <span ng-show="datos_personales.num_doc.$error.required && datos_personales.num_doc.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.num_doc.$error.minlength && datos_personales.num_doc.$dirty" class="required">Error tamaño</span>
                                </p>
                                <p>
                                    <label class="etiqueta" for="nombre">Nombre<i class="required">*</i>:</label>
                                    <input type="text" class="form-control texto"  name="nombre" ng-model="ctrl.usuario_dp.nombre" required minlength="5"/>
                                    <span ng-show="datos_personales.nombre.$error.required && datos_personales.nombre.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.nombre.$error.minlength && datos_personales.nombre.$dirty" class="required">Error tamaño</span>
                                </p>
                                <p>
                                    <label class="etiqueta" for="apellido">Apellido<i class="required">*</i>:</label>                                        
                                    <input type="text" class="form-control texto"  name="apellido" ng-model="ctrl.usuario_dp.apellido" required minlength="5"/>
                                    <span ng-show="datos_personales.apellido.$error.required && datos_personales.apellido.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.apellido.$error.minlength && datos_personales.apellido.$dirty" class="required">Error tamaño</span>
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
                                <p>
                                    <label class="etiqueta" for="movil">Celular<i class="required">*</i>:</label>                                        
                                    <input type="text" class="form-control texto" name="movil" ng-model="ctrl.usuario_dp.movil" required minlength="7"/>
                                    <span ng-show="datos_personales.movil.$error.required && datos_personales.movil.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.movil.$error.minlength && datos_personales.novil.$dirty" class="required">Error tamaño</span>
                                </p>
                                <p>
                                    <label class="etiqueta" for="telefono">Telefono:</label>                                        
                                    <input type="text" class="form-control texto"  name="tel" ng-model="ctrl.usuario_dp.tel" >
                                </p>
                                <p>
                                    <label class="etiqueta" for="pais">Pais</label>                                        
                                    <select class="form-control selector"  name="pais" ng-model="ctrl.usuario_dp.pais">
                                            <option value="AF">Afganistán</option>
                                            <option value="AL">Albania</option>
                                            <option value="DE">Alemania</option>
                                            <option value="AD">Andorra</option>
                                            <option value="AO">Angola</option>
                                            <option value="AI">Anguilla</option>
                                            <option value="AQ">Antártida</option>
                                            <option value="AG">Antigua y Barbuda</option>
                                            <option value="AN">Antillas Holandesas</option>
                                            <option value="SA">Arabia Saudí</option>
                                            <option value="DZ">Argelia</option>
                                            <option value="AR">Argentina</option>
                                            <option value="AM">Armenia</option>
                                            <option value="AW">Aruba</option>
                                            <option value="AU">Australia</option>
                                            <option value="AT">Austria</option>
                                            <option value="AZ">Azerbaiyán</option>
                                            <option value="BS">Bahamas</option>
                                            <option value="BH">Bahrein</option>
                                            <option value="BD">Bangladesh</option>
                                            <option value="BB">Barbados</option>
                                            <option value="BE">Bélgica</option>
                                            <option value="BZ">Belice</option>
                                            <option value="BJ">Benin</option>
                                            <option value="BM">Bermudas</option>
                                            <option value="BY">Bielorrusia</option>
                                            <option value="MM">Birmania</option>
                                            <option value="BO">Bolivia</option>
                                            <option value="BA">Bosnia y Herzegovina</option>
                                            <option value="BW">Botswana</option>
                                            <option value="BR">Brasil</option>
                                            <option value="BN">Brunei</option>
                                            <option value="BG">Bulgaria</option>
                                            <option value="BF">Burkina Faso</option>
                                            <option value="BI">Burundi</option>
                                            <option value="BT">Bután</option>
                                            <option value="CV">Cabo Verde</option>
                                            <option value="KH">Camboya</option>
                                            <option value="CM">Camerún</option>
                                            <option value="CA">Canadá</option>
                                            <option value="TD">Chad</option>
                                            <option value="CL">Chile</option>
                                            <option value="CN">China</option>
                                            <option value="CY">Chipre</option>
                                            <option value="VA">Ciudad del Vaticano (Santa Sede)</option>
                                            <option value="CO">Colombia</option>
                                            <option value="KM">Comores</option>
                                            <option value="CG">Congo</option>
                                            <option value="CD">Congo, República Democrática del</option>
                                            <option value="KR">Corea</option>
                                            <option value="KP">Corea del Norte</option>
                                            <option value="CI">Costa de Marfíl</option>
                                            <option value="CR">Costa Rica</option>
                                            <option value="HR">Croacia (Hrvatska)</option>
                                            <option value="CU">Cuba</option>
                                            <option value="DK">Dinamarca</option>
                                            <option value="DJ">Djibouti</option>
                                            <option value="DM">Dominica</option>
                                            <option value="EC">Ecuador</option>
                                            <option value="EG">Egipto</option>
                                            <option value="SV">El Salvador</option>
                                            <option value="AE">Emiratos írabes Unidos</option>
                                            <option value="ER">Eritrea</option>
                                            <option value="SI">Eslovenia</option>
                                            <option value="ES">España</option>
                                            <option value="US">Estados Unidos</option>
                                            <option value="EE">Estonia</option>
                                            <option value="ET">Etiopía</option>
                                            <option value="FJ">Fiji</option>
                                            <option value="PH">Filipinas</option>
                                            <option value="FI">Finlandia</option>
                                            <option value="FR">Francia</option>
                                            <option value="GA">Gabñn</option>
                                            <option value="GM">Gambia</option>
                                            <option value="GE">Georgia</option>
                                            <option value="GH">Ghana</option>
                                            <option value="GI">Gibraltar</option>
                                            <option value="GD">Granada</option>
                                            <option value="GR">Grecia</option>
                                            <option value="GL">Groenlandia</option>
                                            <option value="GP">Guadalupe</option>
                                            <option value="GU">Guam</option>
                                            <option value="GT">Guatemala</option>
                                            <option value="GY">Guayana</option>
                                            <option value="GF">Guayana Francesa</option>
                                            <option value="GN">Guinea</option>
                                            <option value="GQ">Guinea Ecuatorial</option>
                                            <option value="GW">Guinea-Bissau</option>
                                            <option value="HT">Haití</option>
                                            <option value="HN">Honduras</option>
                                            <option value="HU">Hungría</option>
                                            <option value="IN">India</option>
                                            <option value="ID">Indonesia</option>
                                            <option value="IQ">Irak</option>
                                            <option value="IR">Irán</option>
                                            <option value="IE">Irlanda</option>
                                            <option value="BV">Isla Bouvet</option>
                                            <option value="CX">Isla de Christmas</option>
                                            <option value="IS">Islandia</option>
                                            <option value="KY">Islas Caimán</option>
                                            <option value="CK">Islas Cook</option>
                                            <option value="CC">Islas de Cocos o Keeling</option>
                                            <option value="FO">Islas Faroe</option>
                                            <option value="HM">Islas Heard y McDonald</option>
                                            <option value="FK">Islas Malvinas</option>
                                            <option value="MP">Islas Marianas del Norte</option>
                                            <option value="MH">Islas Marshall</option>
                                            <option value="UM">Islas menores de Estados Unidos</option>
                                            <option value="PW">Islas Palau</option>
                                            <option value="SB">Islas Salomñn</option>
                                            <option value="SJ">Islas Svalbard y Jan Mayen</option>
                                            <option value="TK">Islas Tokelau</option>
                                            <option value="TC">Islas Turks y Caicos</option>
                                            <option value="VI">Islas Vírgenes (EEUU)</option>
                                            <option value="VG">Islas Vírgenes (Reino Unido)</option>
                                            <option value="WF">Islas Wallis y Futuna</option>
                                            <option value="IL">Israel</option>
                                            <option value="IT">Italia</option>
                                            <option value="JM">Jamaica</option>
                                            <option value="JP">Japón</option>
                                            <option value="JO">Jordania</option>
                                            <option value="KZ">Kazajistán</option>
                                            <option value="KE">Kenia</option>
                                            <option value="KG">Kirguizistán</option>
                                            <option value="KI">Kiribati</option>
                                            <option value="KW">Kuwait</option>
                                            <option value="LA">Laos</option>
                                            <option value="LS">Lesotho</option>
                                            <option value="LV">Letonia</option>
                                            <option value="LB">Líbano</option>
                                            <option value="LR">Liberia</option>
                                            <option value="LY">Libia</option>
                                            <option value="LI">Liechtenstein</option>
                                            <option value="LT">Lituania</option>
                                            <option value="LU">Luxemburgo</option>
                                            <option value="MK">Macedonia, Ex-República Yugoslava de</option>
                                            <option value="MG">Madagascar</option>
                                            <option value="MY">Malasia</option>
                                            <option value="MW">Malawi</option>
                                            <option value="MV">Maldivas</option>
                                            <option value="ML">Malí</option>
                                            <option value="MT">Malta</option>
                                            <option value="MA">Marruecos</option>
                                            <option value="MQ">Martinica</option>
                                            <option value="MU">Mauricio</option>
                                            <option value="MR">Mauritania</option>
                                            <option value="YT">Mayotte</option>
                                            <option value="MX">México</option>
                                            <option value="FM">Micronesia</option>
                                            <option value="MD">Moldavia</option>
                                            <option value="MC">Mñnaco</option>
                                            <option value="MN">Mongolia</option>
                                            <option value="MS">Montserrat</option>
                                            <option value="MZ">Mozambique</option>
                                            <option value="NA">Namibia</option>
                                            <option value="NR">Nauru</option>
                                            <option value="NP">Nepal</option>
                                            <option value="NI">Nicaragua</option>
                                            <option value="NE">Níger</option>
                                            <option value="NG">Nigeria</option>
                                            <option value="NU">Niue</option>
                                            <option value="NF">Norfolk</option>
                                            <option value="NO">Noruega</option>
                                            <option value="NC">Nueva Caledonia</option>
                                            <option value="NZ">Nueva Zelanda</option>
                                            <option value="OM">Omán</option>
                                            <option value="NL">Países Bajos</option>
                                            <option value="PA">Panamá</option>
                                            <option value="PG">Papúa Nueva Guinea</option>
                                            <option value="PK">Paquistán</option>
                                            <option value="PY">Paraguay</option>
                                            <option value="PE">Perú</option>
                                            <option value="PN">Pitcairn</option>
                                            <option value="PF">Polinesia Francesa</option>
                                            <option value="PL">Polonia</option>
                                            <option value="PT">Portugal</option>
                                            <option value="PR">Puerto Rico</option>
                                            <option value="QA">Qatar</option>
                                            <option value="UK">Reino Unido</option>
                                            <option value="CF">República Centroafricana</option>
                                            <option value="CZ">República Checa</option>
                                            <option value="ZA">República de Sudáfrica</option>
                                            <option value="DO">República Dominicana</option>
                                            <option value="SK">República Eslovaca</option>
                                            <option value="RE">Reuniñn</option>
                                            <option value="RW">Ruanda</option>
                                            <option value="RO">Rumania</option>
                                            <option value="RU">Rusia</option>
                                            <option value="EH">Sahara Occidental</option>
                                            <option value="KN">Saint Kitts y Nevis</option>
                                            <option value="WS">Samoa</option>
                                            <option value="AS">Samoa Americana</option>
                                            <option value="SM">San Marino</option>
                                            <option value="VC">San Vicente y Granadinas</option>
                                            <option value="SH">Santa Helena</option>
                                            <option value="LC">Santa Lucía</option>
                                            <option value="ST">Santo Tomé y Príncipe</option>
                                            <option value="SN">Senegal</option>
                                            <option value="SC">Seychelles</option>
                                            <option value="SL">Sierra Leona</option>
                                            <option value="SG">Singapur</option>
                                            <option value="SY">Siria</option>
                                            <option value="SO">Somalia</option>
                                            <option value="LK">Sri Lanka</option>
                                            <option value="PM">St Pierre y Miquelon</option>
                                            <option value="SZ">Suazilandia</option>
                                            <option value="SD">Sudán</option>
                                            <option value="SE">Suecia</option>
                                            <option value="CH">Suiza</option>
                                            <option value="SR">Surinam</option>
                                            <option value="TH">Tailandia</option>
                                            <option value="TW">Taiwán</option>
                                            <option value="TZ">Tanzania</option>
                                            <option value="TJ">Tayikistán</option>
                                            <option value="TF">Territorios franceses del Sur</option>
                                            <option value="TP">Timor Oriental</option>
                                            <option value="TG">Togo</option>
                                            <option value="TO">Tonga</option>
                                            <option value="TT">Trinidad y Tobago</option>
                                            <option value="TN">Túnez</option>
                                            <option value="TM">Turkmenistán</option>
                                            <option value="TR">Turquía</option>
                                            <option value="TV">Tuvalu</option>
                                            <option value="UA">Ucrania</option>
                                            <option value="UG">Uganda</option>
                                            <option value="UY">Uruguay</option>
                                            <option value="UZ">Uzbekistán</option>
                                            <option value="VU">Vanuatu</option>
                                            <option value="VE">Venezuela</option>
                                            <option value="VN">Vietnam</option>
                                            <option value="YE">Yemen</option>
                                            <option value="YU">Yugoslavia</option>
                                            <option value="ZM">Zambia</option>
                                            <option value="ZW">Zimbabue</option>
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
                                    <select class="form-control selector" name="naci" ng-model="ctrl.usuario_dp.naci">
                                        <option value="AF">Afganistán</option>
                                            <option value="AL">Albania</option>
                                            <option value="DE">Alemania</option>
                                            <option value="AD">Andorra</option>
                                            <option value="AO">Angola</option>
                                            <option value="AI">Anguilla</option>
                                            <option value="AQ">Antártida</option>
                                            <option value="AG">Antigua y Barbuda</option>
                                            <option value="AN">Antillas Holandesas</option>
                                            <option value="SA">Arabia Saudí</option>
                                            <option value="DZ">Argelia</option>
                                            <option value="AR">Argentina</option>
                                            <option value="AM">Armenia</option>
                                            <option value="AW">Aruba</option>
                                            <option value="AU">Australia</option>
                                            <option value="AT">Austria</option>
                                            <option value="AZ">Azerbaiyán</option>
                                            <option value="BS">Bahamas</option>
                                            <option value="BH">Bahrein</option>
                                            <option value="BD">Bangladesh</option>
                                            <option value="BB">Barbados</option>
                                            <option value="BE">Bélgica</option>
                                            <option value="BZ">Belice</option>
                                            <option value="BJ">Benin</option>
                                            <option value="BM">Bermudas</option>
                                            <option value="BY">Bielorrusia</option>
                                            <option value="MM">Birmania</option>
                                            <option value="BO">Bolivia</option>
                                            <option value="BA">Bosnia y Herzegovina</option>
                                            <option value="BW">Botswana</option>
                                            <option value="BR">Brasil</option>
                                            <option value="BN">Brunei</option>
                                            <option value="BG">Bulgaria</option>
                                            <option value="BF">Burkina Faso</option>
                                            <option value="BI">Burundi</option>
                                            <option value="BT">Bután</option>
                                            <option value="CV">Cabo Verde</option>
                                            <option value="KH">Camboya</option>
                                            <option value="CM">Camerún</option>
                                            <option value="CA">Canadá</option>
                                            <option value="TD">Chad</option>
                                            <option value="CL">Chile</option>
                                            <option value="CN">China</option>
                                            <option value="CY">Chipre</option>
                                            <option value="VA">Ciudad del Vaticano (Santa Sede)</option>
                                            <option value="CO">Colombia</option>
                                            <option value="KM">Comores</option>
                                            <option value="CG">Congo</option>
                                            <option value="CD">Congo, República Democrática del</option>
                                            <option value="KR">Corea</option>
                                            <option value="KP">Corea del Norte</option>
                                            <option value="CI">Costa de Marfíl</option>
                                            <option value="CR">Costa Rica</option>
                                            <option value="HR">Croacia (Hrvatska)</option>
                                            <option value="CU">Cuba</option>
                                            <option value="DK">Dinamarca</option>
                                            <option value="DJ">Djibouti</option>
                                            <option value="DM">Dominica</option>
                                            <option value="EC">Ecuador</option>
                                            <option value="EG">Egipto</option>
                                            <option value="SV">El Salvador</option>
                                            <option value="AE">Emiratos írabes Unidos</option>
                                            <option value="ER">Eritrea</option>
                                            <option value="SI">Eslovenia</option>
                                            <option value="ES">España</option>
                                            <option value="US">Estados Unidos</option>
                                            <option value="EE">Estonia</option>
                                            <option value="ET">Etiopía</option>
                                            <option value="FJ">Fiji</option>
                                            <option value="PH">Filipinas</option>
                                            <option value="FI">Finlandia</option>
                                            <option value="FR">Francia</option>
                                            <option value="GA">Gabñn</option>
                                            <option value="GM">Gambia</option>
                                            <option value="GE">Georgia</option>
                                            <option value="GH">Ghana</option>
                                            <option value="GI">Gibraltar</option>
                                            <option value="GD">Granada</option>
                                            <option value="GR">Grecia</option>
                                            <option value="GL">Groenlandia</option>
                                            <option value="GP">Guadalupe</option>
                                            <option value="GU">Guam</option>
                                            <option value="GT">Guatemala</option>
                                            <option value="GY">Guayana</option>
                                            <option value="GF">Guayana Francesa</option>
                                            <option value="GN">Guinea</option>
                                            <option value="GQ">Guinea Ecuatorial</option>
                                            <option value="GW">Guinea-Bissau</option>
                                            <option value="HT">Haití</option>
                                            <option value="HN">Honduras</option>
                                            <option value="HU">Hungría</option>
                                            <option value="IN">India</option>
                                            <option value="ID">Indonesia</option>
                                            <option value="IQ">Irak</option>
                                            <option value="IR">Irán</option>
                                            <option value="IE">Irlanda</option>
                                            <option value="BV">Isla Bouvet</option>
                                            <option value="CX">Isla de Christmas</option>
                                            <option value="IS">Islandia</option>
                                            <option value="KY">Islas Caimán</option>
                                            <option value="CK">Islas Cook</option>
                                            <option value="CC">Islas de Cocos o Keeling</option>
                                            <option value="FO">Islas Faroe</option>
                                            <option value="HM">Islas Heard y McDonald</option>
                                            <option value="FK">Islas Malvinas</option>
                                            <option value="MP">Islas Marianas del Norte</option>
                                            <option value="MH">Islas Marshall</option>
                                            <option value="UM">Islas menores de Estados Unidos</option>
                                            <option value="PW">Islas Palau</option>
                                            <option value="SB">Islas Salomñn</option>
                                            <option value="SJ">Islas Svalbard y Jan Mayen</option>
                                            <option value="TK">Islas Tokelau</option>
                                            <option value="TC">Islas Turks y Caicos</option>
                                            <option value="VI">Islas Vírgenes (EEUU)</option>
                                            <option value="VG">Islas Vírgenes (Reino Unido)</option>
                                            <option value="WF">Islas Wallis y Futuna</option>
                                            <option value="IL">Israel</option>
                                            <option value="IT">Italia</option>
                                            <option value="JM">Jamaica</option>
                                            <option value="JP">Japón</option>
                                            <option value="JO">Jordania</option>
                                            <option value="KZ">Kazajistán</option>
                                            <option value="KE">Kenia</option>
                                            <option value="KG">Kirguizistán</option>
                                            <option value="KI">Kiribati</option>
                                            <option value="KW">Kuwait</option>
                                            <option value="LA">Laos</option>
                                            <option value="LS">Lesotho</option>
                                            <option value="LV">Letonia</option>
                                            <option value="LB">Líbano</option>
                                            <option value="LR">Liberia</option>
                                            <option value="LY">Libia</option>
                                            <option value="LI">Liechtenstein</option>
                                            <option value="LT">Lituania</option>
                                            <option value="LU">Luxemburgo</option>
                                            <option value="MK">Macedonia, Ex-República Yugoslava de</option>
                                            <option value="MG">Madagascar</option>
                                            <option value="MY">Malasia</option>
                                            <option value="MW">Malawi</option>
                                            <option value="MV">Maldivas</option>
                                            <option value="ML">Malí</option>
                                            <option value="MT">Malta</option>
                                            <option value="MA">Marruecos</option>
                                            <option value="MQ">Martinica</option>
                                            <option value="MU">Mauricio</option>
                                            <option value="MR">Mauritania</option>
                                            <option value="YT">Mayotte</option>
                                            <option value="MX">México</option>
                                            <option value="FM">Micronesia</option>
                                            <option value="MD">Moldavia</option>
                                            <option value="MC">Mñnaco</option>
                                            <option value="MN">Mongolia</option>
                                            <option value="MS">Montserrat</option>
                                            <option value="MZ">Mozambique</option>
                                            <option value="NA">Namibia</option>
                                            <option value="NR">Nauru</option>
                                            <option value="NP">Nepal</option>
                                            <option value="NI">Nicaragua</option>
                                            <option value="NE">Níger</option>
                                            <option value="NG">Nigeria</option>
                                            <option value="NU">Niue</option>
                                            <option value="NF">Norfolk</option>
                                            <option value="NO">Noruega</option>
                                            <option value="NC">Nueva Caledonia</option>
                                            <option value="NZ">Nueva Zelanda</option>
                                            <option value="OM">Omán</option>
                                            <option value="NL">Países Bajos</option>
                                            <option value="PA">Panamá</option>
                                            <option value="PG">Papúa Nueva Guinea</option>
                                            <option value="PK">Paquistán</option>
                                            <option value="PY">Paraguay</option>
                                            <option value="PE">Perú</option>
                                            <option value="PN">Pitcairn</option>
                                            <option value="PF">Polinesia Francesa</option>
                                            <option value="PL">Polonia</option>
                                            <option value="PT">Portugal</option>
                                            <option value="PR">Puerto Rico</option>
                                            <option value="QA">Qatar</option>
                                            <option value="UK">Reino Unido</option>
                                            <option value="CF">República Centroafricana</option>
                                            <option value="CZ">República Checa</option>
                                            <option value="ZA">República de Sudáfrica</option>
                                            <option value="DO">República Dominicana</option>
                                            <option value="SK">República Eslovaca</option>
                                            <option value="RE">Reuniñn</option>
                                            <option value="RW">Ruanda</option>
                                            <option value="RO">Rumania</option>
                                            <option value="RU">Rusia</option>
                                            <option value="EH">Sahara Occidental</option>
                                            <option value="KN">Saint Kitts y Nevis</option>
                                            <option value="WS">Samoa</option>
                                            <option value="AS">Samoa Americana</option>
                                            <option value="SM">San Marino</option>
                                            <option value="VC">San Vicente y Granadinas</option>
                                            <option value="SH">Santa Helena</option>
                                            <option value="LC">Santa Lucía</option>
                                            <option value="ST">Santo Tomé y Príncipe</option>
                                            <option value="SN">Senegal</option>
                                            <option value="SC">Seychelles</option>
                                            <option value="SL">Sierra Leona</option>
                                            <option value="SG">Singapur</option>
                                            <option value="SY">Siria</option>
                                            <option value="SO">Somalia</option>
                                            <option value="LK">Sri Lanka</option>
                                            <option value="PM">St Pierre y Miquelon</option>
                                            <option value="SZ">Suazilandia</option>
                                            <option value="SD">Sudán</option>
                                            <option value="SE">Suecia</option>
                                            <option value="CH">Suiza</option>
                                            <option value="SR">Surinam</option>
                                            <option value="TH">Tailandia</option>
                                            <option value="TW">Taiwán</option>
                                            <option value="TZ">Tanzania</option>
                                            <option value="TJ">Tayikistán</option>
                                            <option value="TF">Territorios franceses del Sur</option>
                                            <option value="TP">Timor Oriental</option>
                                            <option value="TG">Togo</option>
                                            <option value="TO">Tonga</option>
                                            <option value="TT">Trinidad y Tobago</option>
                                            <option value="TN">Túnez</option>
                                            <option value="TM">Turkmenistán</option>
                                            <option value="TR">Turquía</option>
                                            <option value="TV">Tuvalu</option>
                                            <option value="UA">Ucrania</option>
                                            <option value="UG">Uganda</option>
                                            <option value="UY">Uruguay</option>
                                            <option value="UZ">Uzbekistán</option>
                                            <option value="VU">Vanuatu</option>
                                            <option value="VE">Venezuela</option>
                                            <option value="VN">Vietnam</option>
                                            <option value="YE">Yemen</option>
                                            <option value="YU">Yugoslavia</option>
                                            <option value="ZM">Zambia</option>
                                            <option value="ZW">Zimbabue</option>
                                    </select>
                                </p>
                                <div class="form-group">
                                    <label class="etiqueta" for="nac">Licencia de conducción:</label>                                        
                                    <div class="form-inline">                                            
                                        <label class="checkbox-inline">
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
                                    </div>                                
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
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
                                    </div>                                
                                </div>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                PERFIL PROFESIONAL
                            </div>
                            <div class="panel-body">
                                <p>
                                    <label class="etiqueta_a">Cargo o titulo breve de su hoja de vida<i class="required">*</i>:</label>                                                                                  
                                    <input type="text" name="cargo" ng-model="ctrl.usuario_dp.cargo" class="form-control area" placeholder="Ej: C" equired minlength="10"/>
                                    <span ng-show="datos_personales.cargo.$error.required && datos_personales.cargo.$dirty" class="required">Error requerido</span>
                                    <span ng-show="datos_personales.cargo.$error.minlength && datos_personales.cargo.$dirty" class="required">Error tamaño</span>
                                </p>
                                <p>
                                    <label class="etiqueta_a">Decripcion breve de su perfil profesional:</label>                                                                                 
                                    <textarea class="form-control area" name="perfil" ng-model="ctrl.usuario_dp.perfil" placeholder="Ej: C" rows="4" ></textarea>
                                </p>

                                <div class="form-group">
                                    <div class="form-group" style="text-align: right;">
                                        <input type="submit" class="btn btn-primary" ng-disabled="datos_personales.$invalid" value="Guardar Cambios">
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
                                <div class="col-lg-12">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">                                                
                                            Ingeniero de Investigacion y desarrollo
                                            <button type="button" class="close"><img src="assets/img/delete_icon.png" width="18" height="18"></button>
                                            <button type="button" class="close"><img src="assets/img/edit_icon.png"  width="18" height="18"></button>                                                
                                        </div>
                                        <div class="panel-body">
                                            <p>Logiseguridad ltda, barranquilla, Atlantico, Colombia</p>
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
                            <button type="button" class="btn btn-primary btn-lg center-block" data-toggle="modal" data-target="#Modal_experiencia">Añadir experiencia laboral</button>
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

    </div>
    <!-- end wrapper -->

    
    <div class="modal fade" id="Modal_experiencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de experiencia laboral</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="myForm" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-xs-2">Empresa:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" name="phone" placeholder="Nombre de la empresa" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Cargo:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" name="phone" placeholder="Cargo realizado" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Salario:</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control" name="phone" placeholder="$" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Bonos:</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control" name="phone" placeholder="$" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Supervisor:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" name="phone" placeholder="Nombre / Apellido" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Telefono:</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control" name="phone" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Pais:</label>
                            <div class="col-xs-8">
                                <select class="form-control">
                                    <option>Pais</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Dpto:</label>
                            <div class="col-xs-8">
                                <select class="form-control">
                                    <option>Departamento</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Ciudad:</label>
                            <div class="col-xs-8">
                                <select class="form-control">
                                    <option>Ciudad</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Direccion:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" name="phone" placeholder="Direccion" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Inicio:</label>
                            <div class="col-xs-6">
                                <select class="form-control">
                                    <option value="0">Mes</option>
                                    <option value="1">Enero</option><option value="2">Febrero</option>
                                    <option value="3">Marzo</option><option value="4">Abril</option>
                                    <option value="5">Mayo</option><option value="6">Junio</option>
                                    <option value="7">Julio</option><option value="8">Agosto</option>
                                    <option value="9">Septiembre</option><option value="10">Octubre</option>
                                    <option value="11">Noviembre</option><option value="12">Diciembre</option>
                                </select>
                            </div>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option>Año</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Fin:</label>
                            <div class="col-xs-6">
                                <select class="form-control">
                                    <option value="0">Mes</option>
                                    <option value="1">Enero</option><option value="2">Febrero</option>
                                    <option value="3">Marzo</option><option value="4">Abril</option>
                                    <option value="5">Mayo</option><option value="6">Junio</option>
                                    <option value="7">Julio</option><option value="8">Agosto</option>
                                    <option value="9">Septiembre</option><option value="10">Octubre</option>
                                    <option value="11">Noviembre</option><option value="12">Diciembre</option>
                                </select>
                            </div>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option>Año</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-10">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="agree"> Actualmente labora.
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-2">Retiro:</label>
                            <div class="col-xs-10">
                                <textarea class="form-control" rows="3" placeholder="Razones de su retiro..." ></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary">Añadir</button>
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
                    <form role="form" name="myForm" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-xs-4">Centro educativo:</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="phone" placeholder="Nombre de la empresa" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-4">Nivel de estudios:</label>
                            <div class="col-xs-8">
                                <select class="form-control">
                                    <option>Nivel De Estudios</option>
                                    <option>Educación Basica Primaria</option>
                                    <option>Educación Basica Secundaria</option>
                                    <option>Bachillerato / educacion Media</option>
                                    <option>Universidad / Carrera Tecnica</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-4">Area de estudio:</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="phone" placeholder="$" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-4">Estado:</label>
                            <div class="form-inline col-xs-8">
                                <label class="checkbox-inline" style="font-size: 11px;">
                                    <input type="checkbox" value="news"> Culminado
                                </label>
                                <label class="checkbox-inline"  style="font-size: 11px;">
                                    <input type="checkbox" value="news"> Cursando
                                </label>
                                <label class="checkbox-inline"  style="font-size: 11px;">
                                    <input type="checkbox" value="news"> Aplazado/Abandonado
                                </label>
                            </div>                                
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-4">Periodo inicio:</label>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option value="0">Mes</option>
                                    <option value="1">1</option><option value="2">2</option>
                                    <option value="3">3</option><option value="4">4</option>
                                    <option value="5">5</option><option value="6">6</option>
                                    <option value="7">7</option><option value="8">8</option>
                                    <option value="9">9</option><option value="10">10</option>
                                    <option value="11">11</option><option value="12">12</option>
                                </select>
                            </div>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option>Año</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-4">Periodo fin:</label>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option value="0">Mes</option>
                                    <option value="1">1</option><option value="2">2</option>
                                    <option value="3">3</option><option value="4">4</option>
                                    <option value="5">5</option><option value="6">6</option>
                                    <option value="7">7</option><option value="8">8</option>
                                    <option value="9">9</option><option value="10">10</option>
                                    <option value="11">11</option><option value="12">12</option>
                                </select>
                            </div>
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option>Año</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary">Añadir</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
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
    </script>
</body>

</html>
