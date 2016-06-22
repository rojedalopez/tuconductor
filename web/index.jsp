<%@page import="bean.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma", "No-chache"); 
response.setHeader("Expires", "0"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache", "no-cache"); 
if(session.getAttribute("user") != null){
   usuario u = (usuario)session.getAttribute("user");
   if(u.getRol()==1){
        response.sendRedirect("../admin/");
   }else if(u.getRol()==2){
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
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    
    <link href="css/generales.css" rel="stylesheet" />
    
    <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/dataTables.responsive.min.js"></script>
    <script src="js/bootstrap/js/bootstrap.min.js"></script>
    <!-- Angular Material requires Angular.js Libraries -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-messages.min.js"></script>

    <!-- Angular Material Library -->
    <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.js"></script>
    <script src="js/dist/angular-datatables.min.js"></script>   
    
    
    <script type="text/javascript" src="js/app.js"></script>      
    <script type="text/javascript" src="js/angular/profile.js"></script>
    <script type="text/javascript" src="js/angular/sign.js"></script>
    <script type="text/javascript" src="js/angular/wall.js"></script>
    <script type="text/javascript" src="js/angular/oferta.js"></script>
    <script type="text/javascript" src="js/angular/inbox.js"></script>
    
</head>

<body class="body-Login-back" ng-app="myApp" class="ng-cloak">
    <div ng-controller="SignUpController as ctrl">
    <div class="container">
       
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center logo-margin ">
                <label style="font-size: 48px; color: white;">TuConductor</label>
                </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Formulario de ingreso</h3>
                    </div>
                    <div class="panel-body" >
                        
                        <form role="form" method="POST" action="login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="nick" type="email" value="<%out.print((request.getParameter("email")!=null)?request.getParameter("email"):"");%>" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Contraseña" name="pass" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Recordar mi contraseña
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Iniciar sesion" style="margin-top: 3%;"/>
                                
                                <div class="form-horizontal" style="text-align: left; margin-top: 3%;">
                                    ¿Aún no tienes una cuenta?, <a href="#" data-toggle="modal" data-target="#Modal_choise_options">Registrate aqui</a>
                                </div>
                                
                            </fieldset>
                        </form>
                    </div>                                
                </div>
                <div class="alert alert-danger" style="text-align: center;">
                    <a href="#" class="alert-link"data-toggle="modal" data-target="#Modal_forgotpass"><i class="fa fa-exclamation-triangle"></i> ¿Olvidaste tu contraseña?</a>                
                </div>
                
                
            </div>
        </div>
    </div>

    <div class="modal fade" id="Modal_Conductor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de registro</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="add_conductor" novalidate>
                        <p ng-class="{ 'has-error': (add_conductor.name.$error.required || add_conductor.name.$error.minlength) && add_conductor.name.$dirty }">
                            <label class="etiqueta_e">Nombre</label>
                            <input type="text" ng-model="ctrl.usuario.name" class="form-control texto_e" name="name" placeholder="Ingrese sus nombres" minlength="3" required>
                        </p>
                        <p ng-class="{ 'has-error': (add_conductor.lastname.$error.required || add_conductor.lastname.$error.minlength) && add_conductor.lastname.$dirty }">
                            <label class="etiqueta_e">Apellidos</label>
                            <input type="text" ng-model="ctrl.usuario.lastname" class="form-control texto_e" name="lastname" placeholder="Ingrese sus apellidos" minlength="3" required>
                        </p>
                        
                        <p ng-class="{ 'has-error': (add_conductor.mail.$error.required || add_conductor.mail.$error.$invalid) && add_conductor.mail.$dirty }">
                            <label class="etiqueta_e">E-mail</label>
                            <input type="email" ng-model="ctrl.usuario.mail" class="form-control texto_e" name="mail" placeholder="Ingrese su E-mail" required>
                        </p>
                        <p ng-class="{ 'has-error': !add_conductor.password.$error.minlength && add_conductor.password.$error.pattern && add_conductor.password.$dirty }">
                            <label class="etiqueta_e">Contraseña</label>
                            <input type="password" ng-model="ctrl.usuario.password" class="form-control texto_e" name="password" placeholder="Ingrese su contraseña" ng-pattern="/(?=.*[a-z])(?=.*[^a-zA-Z])/" 
                            minlength="8"  data-toggle="tooltip" data-placement="top" title="Debe contener por lo menos un numero o un simbolo. Debe tener tamaño minimo de 8">
                        </p>
                        <p ng-class="{ 'has-error': add_conductor.passwordRepeat.$invalid && add_conductor.passwordRepeat.$dirty }">
                            <label class="etiqueta_e">Confirmar contraseña</label>
                            <input type="password" class="form-control texto_e" placeholder="Ingrese su contraseña" name="passwordRepeat" 
                            ng-model="ctrl.usuario.passwordRepeat" same-as="{{ctrl.usuario.password}}"
                            data-toggle="tooltip" data-placement="top" title="Debe coincidir con la contraseña">
                        </p>
                        <p ng-class="{ 'has-error': (add_conductor.phone.$error.required || add_conductor.phone.$error.minlength) && add_conductor.phone.$dirty }">
                            <label class="etiqueta_e">Telefono</label>
                            <input type="text" ng-model="ctrl.usuario.phone" class="form-control texto_e" name="phone" placeholder="Ingrese su telefono">
                        </p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button class="btn btn-primary" ng-disabled="add_conductor.$invalid">Registrarme</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
                                
    <div class="modal fade" id="Modal_forgotpass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">¿Olvidaste tu contraseña?</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="form_forgot" ng-submit="ctrl.sendingForgot()" novalidate>
                        <div class="form-group">
                            <label>E-mail</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/email_icon.png" width="20" height="20" /></span>
                                <input type="email" class="form-control" ng-model="ctrl.mail" name="mail" placeholder="Ingrese su E-mail" required>
                            </div>
                        </div>
                        <div class="alert alert-info" id="Modal_forgotpass_success">
                            <b>Se ha enviado el mensaje de restablecimiento de contraseña.</b><br/>Sigue las instrucciones que se proporcionan en el mensaje de correo electronico para restablecer la contraseña.
                        </div>
                        <div class="alert alert-danger" id="Modal_forgotpass_error">
                            <b>Se ha presentado un error.</b><br/>El correo ingresado no se encuentra registrado en la plataforma TuConductor.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" ng-disabled="form_forgot.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Enviando correo..." id="btn_sending_mail">Enviar correo</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
                                
    <div class="modal fade" id="Modal_choise_options" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Selecciona tu perfil</h4>
                </div>    
                
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6" style="cursor: pointer;" onclick="open_modal('Modal_Conductor')">
                            <div class="panel panel-primary text-center no-boder">
                                <div class="panel-body green">
                                    <img src="assets/img/conductor_icon.png" />
                                    <h3>Conductor</h3>
                                </div>
                                <div class="panel-footer">
                                    <span class="panel-eyecandy-title">Registrate como conductor
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6" style="cursor: pointer;" onclick="open_modal('Modal_Empresa')">
                            <div class="panel panel-primary text-center no-boder">
                                <div class="panel-body green">
                                    <img src="assets/img/empresa_icon.png" />
                                    <h3>Empresa</h3>
                                </div>
                                <div class="panel-footer">
                                    <span class="panel-eyecandy-title">Registrate como empresa
                                    </span>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="Modal_Empresa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Registro Empresa</h4>
                </div>
                <div class="modal-body">
                    <form role="form" ng-submit="ctrl.submit_Empresa()" name="add_empresa" class="form-horizontal" novalidate>
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
                        <p>
                            <label class="etiqueta_e">Camara de comercio:</label>
                            <input type="file" class="form-control texto_e" uploader-model="ctrl.empresa.cam_com" accept=".pdf, .docx" name="cam_com"  required  />
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
                        <p ng-class="{ 'has-error': add_empresa.mail.$error.required || add_empresa.mail.$error.minlength }">
                            <label class="etiqueta_e">Usuario<i class="required">*</i>:</label>
                            <input type="text" class="form-control texto_e" name="mail" ng-model="ctrl.empresa.mail" placeholder="Usuario (E-mail) de la empresa" minlength="6" required />
                        </p>
                        <p ng-class="{ 'has-error': add_empresa.password.$error.required || add_empresa.password.$error.minlength }">
                            <label class="etiqueta_e">Contraseña<i class="required">*</i>:</label>
                            <input type="password" class="form-control texto_e" name="password" ng-model="ctrl.empresa.password" placeholder="Contraseña de la empresa" minlength="6" required />
                        </p>
                        <p ng-class="{ 'has-error': add_empresa.passwordRepeat.$error.required || add_empresa.passwordRepeat.$error.minlength }">
                            <label class="etiqueta_e">Confirmar contraseña<i class="required">*</i>:</label>
                            <input type="password" class="form-control texto_e" name="passwordRepeat" ng-model="ctrl.empresa.passwordRepeat" placeholder="Confirmar la contraseña" minlength="6" required />
                        </p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" ng-disabled="add_empresa.$invalid" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Guardando..." id="btn_add_empresa" class="btn btn-primary" >Registrar</button>
                        </div>
                    </form>                    
                </div>
                
            </div>
        </div>
    </div>
                                
    <div id="message_exito" class="alert alert-success alert-dismissable" style="width: 300px; position: absolute; right: 5px; bottom: 5px;" >
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Registro exitoso...
    </div>
    
    <div id="message_error" class="alert alert-danger alert-dismissable" style="width: 300px; position: absolute; right: 5px; bottom: 5px;" >
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Registro no exitoso...
    </div>
     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript">
        var dialog ;        
        var dialog2 ;
        var btn_sending_mail;
            $(document).ready(function() {
                btn_sending_mail = $("#btn_sending_mail");
                dialog = $("#Modal_Conductor");
                dialog2 = $("#Modal_Empresa");
            } );
        $( "#message_exito" ).hide();
        $( "#message_error" ).hide();
        $( "#Modal_forgotpass_success" ).hide();
        $( "#Modal_forgotpass_error" ).hide();
        function open_modal(modal){
            $("#Modal_choise_options").modal("hide");
            $("#"+modal).modal("show");
        }
        function open_message_forgot(valor){
            if(valor===true){
                $( "#Modal_forgotpass_error" ).hide();
                $( "#Modal_forgotpass_success" ).show("slow");                
            }else{
                $( "#Modal_forgotpass_success" ).hide();
                $( "#Modal_forgotpass_error" ).show("slow");
            }
            
        }
        function open_message(valor){
            if(valor=="true"){
                $("#message_exito").show();
                setTimeout(function(){
                    $( "#message_exito" ).hide();
                    $( "#message_error" ).hide();
		}, 3000);
            }else{
                $("#message_error").show();
                setTimeout(function(){
                    $( "#message_exito" ).hide();
                    $( "#message_error" ).hide();
		}, 3000);
            }
        }
        
    </script>
    </div>
</body>

</html>
