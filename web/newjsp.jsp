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
      
      

</head>

<body class="body-Login-back">

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
                    <div class="panel-body">
                        <form role="form" method="POST" action="login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="nick" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Contrase�a" name="pass" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Recordar mi contrase�a
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Iniciar sesion"/>
                                <div  id="registro_form" style="text-align: center; margin-top: 5%;">
                                    �Aun no tienes una cuenta?, <a href="#" data-toggle="modal" data-target="#myModal">Registrate aqui</a>
                                    
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Formulario de registro</h4>
                </div>
                <div class="modal-body">
                    <form role="form" action="signup" method="POST">
                        <div class="form-group">
                            <label>Nombre</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/user_icon.png" width="20" height="20" /></span>
                                <input type="text" class="form-control" name="name" placeholder="Ingrese sus nombres">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Apellidos</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/user_icon.png" width="20" height="20" /></span>
                                <input type="text" class="form-control" name="lastname" placeholder="Ingrese sus apellidos">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>E-mail</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/email_icon.png" width="20" height="20" /></span>
                                <input type="text" class="form-control" name="email" placeholder="Ingrese su E-mail">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Contrase�a</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/pass_icon.png" width="20" height="20" /></span>
                                <input type="password" class="form-control" name="password" placeholder="Ingrese su contrase�a">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Confirmar contrase�a</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/pass_icon.png" width="20" height="20" /></span>
                                <input type="password" class="form-control" placeholder="Ingrese su contrase�a">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                            <div class="form-group input-group">
                                <span class="input-group-addon"><img src="assets/img/telefono_icon.png" width="20" height="20" /></span>
                                <input type="text" class="form-control" name="phone" placeholder="Ingrese su telefono">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Candelar</button>
                    <button type="button" class="btn btn-primary">Registrarme</button>
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
        $( "#message_exito" ).hide();
        $( "#message_error" ).hide();
        $( "#img_register" ).hide();
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
    
</body>

</html>