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
        response.sendRedirect("/admin/");
   }else if(u.getRol()==2){
        response.sendRedirect("/empresa/");
   }else if(u.getRol()==3){
        response.sendRedirect("/conductor/");
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
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.min.css"/>
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.css">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
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
    <script src="js/angular-material.min.js"></script>
    <script src="js/dist/angular-datatables.min.js"></script>     
    
    <script type="text/javascript">
        var dialog ;        
        var dialog2 ;
        var btn_sending_mail, btn_add_conductor, btn_add_empresa;
        var Modal_forgotpass_success, Modal_forgotpass_error;
        $(document).ready(function() {
            btn_sending_mail = $("#btn_sending_mail");
            btn_add_conductor = $("#btn_add_conductor");
            btn_add_empresa = $("#btn_add_empresa");
            dialog = $("#Modal_Conductor");
            dialog2 = $("#Modal_Empresa");
            Modal_forgotpass_success = $("#Modal_forgotpass_success");
            Modal_forgotpass_error = $("#Modal_forgotpass_error");
        } );
        
        function open_modal(modal){
            //$("#Modal_choise_options").modal("hide");
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
    
    <script type="text/javascript" src="js/date.js"></script>
    <script type="text/javascript" src="js/app.js"></script>      
    <script type="text/javascript" src="js/angular/profile.js"></script>
    <script type="text/javascript" src="js/angular/sign.js"></script>
    <script type="text/javascript" src="js/angular/wall.js"></script>
    <script type="text/javascript" src="js/angular/oferta.js"></script>
    <script type="text/javascript" src="js/angular/inbox.js"></script>
    <script type="text/javascript" src="js/angular/angular-validator.js"></script>
    
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Levl Plugin Scripts-->
    <script src="assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/scripts/dashboard-demo.js"></script>
    
    <style>
        .text-valid{font-size:11px;font-style: italic;}
    </style>
    
</head>

<body class="body-Login-back" ng-app="myApp" >
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
    
                                
    <div class="modal fade" id="Modal_forgotpass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">¿Olvidaste tu contraseña?</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="form_forgot" angular-validator-submit="ctrl.sendingForgot()"  
                          novalidate angular-validator>
                        <div class="form-group">
                            <label>E-mail</label>
                                <input type="email" 
                                name = "mail"
                                class = "form-control"
                                ng-model = "ctrl.mail"
                                validate-on="dirty"
                                invalid-message="'Esta ingresando un correo incorrecto'"
                                required-message="'El campo no puede estar vacio'"
                                required>
                        </div>
                        <div class="alert alert-info hide" id="Modal_forgotpass_success">
                            <b>Se ha enviado el mensaje de restablecimiento de contraseña.</b><br/>Sigue las instrucciones que se proporcionan en el mensaje de correo electronico para restablecer la contraseña.
                        </div>
                        <div class="alert alert-danger hide" id="Modal_forgotpass_error " >
                            <b>Se ha presentado un error.</b><br/>El correo ingresado no se encuentra registrado en la plataforma TuConductor.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Enviando correo..." id="btn_sending_mail">Enviar correo</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
                                
                                
    <div class="modal fade" id="Modal_Conductor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de registro</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="add_conductor" angular-validator-submit="ctrl.sendingForgot()"  
                          novalidate angular-validator>
                        <div class="form-group">
                                <label>Nombre</label>
                                <input 
                                type="text" 
                                name="name"
                                class="form-control"  
                                ng-model="ctrl.usuario.name" 
                                validate-on="dirty" 
                                invalid-message="'Esta ingresando un correo incorrecto'"
                                required-message="'El campo no puede estar vacio'" 
                                required/>
                        </div>
                        <div class="form-group">
                                <label>Apellidos</label>
                                <input 
                                type="text" 
                                name="lastname" 
                                class="form-control" 
                                ng-model="ctrl.usuario.lastname" 
                                validate-on="dirty" 
                                required-message="'El campo no puede estar vacio'" 
                                required/>
                        </div>
                        <div class="form-group">
                                <label>E-mail</label>
                                <input 
                                type="email"
                                name="mail"
                                class="form-control" 
                                ng-model="ctrl.usuario.mail" 
                                validate-on="dirty" 
                                invalid-message="'Esta ingresando un correo incorrecto'"
                                required-message="'El campo no puede estar vacio'" 
                                required/>
                        </div>
                        <div class="form-group">
                                <label>Contraseña</label>
                                <input 
                                type="password" 
                                name="password"
                                class="form-control"
                                ng-model="ctrl.usuario.password" 
                                validator = "ctrl.passwordValidator(form.password) === true"
                                invalid-message = "ctrl.passwordValidator(form.password)"
                                required-message="'El campo no puede estar vacio'"
                                required/>
                        </div>
                        <div class="form-group">
                                <label>Confirmar contraseña</label>
                                <input 
                                type="password" 
                                name = "confirmPassword"
                                class = "form-control"
                                ng-model = "ctrl.usuario.confirmPassword"
                                validator = "ctrl.usuario.password === ctrl.usuario.confirmPassword"
                                validate-on="dirty"
                                invalid-message = "'Passwords do not match!'"
                                required/>
                        </div>
                        <div class="form-group">
                                <label>Telefono</label>
                                <input 
                                type="tel"
                                name="phone"
                                class="form-control texto_e"
                                ng-model="ctrl.usuario.phone"  
                                validate-on="dirty"
                                invalid-message = "'Passwords do not match!'"
                                required-message="'El campo no puede estar vacio'"
                                required/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Enviando..." id="btn_add_conductor">Registrarme</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>                            
    
    <div class="modal fade" id="Modal_Empresa" tabindex="3" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Registro Empresa</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="add_empresa" class="form-horizontal" angular-validator-submit="ctrl.submit_Empresa()" angular-validator novalidate>
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
                            <button type="submit" data-loading-text="<i class='fa fa-refresh fa-spin fa-1x fa-fw'></i> Enviando..." id="btn_add_empresa" class="btn btn-primary" >Registrar</button>
                        </div>
                    </form>                    
                </div>
                
            </div>
        </div>
    </div>
                                
    <div id="message_exito" class="alert alert-success alert-dismissable hidden" style="width: 300px; position: absolute; right: 5px; bottom: 5px;" >
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Registro exitoso...
    </div>
    
    <div id="message_error" class="alert alert-danger alert-dismissable hidden" style="width: 300px; position: absolute; right: 5px; bottom: 5px;" >
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Registro no exitoso...
    </div>

    </div>
</body>

</html>
