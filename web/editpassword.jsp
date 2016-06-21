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
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Recuperacion de contraseña</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" action="validateforgot">
                            <fieldset>
                                <div class="form-group">
                                    <input type="hidden" value="<%= request.getParameter("tkn")%>" name="tkn"/>
                                    <input type="hidden" value="<%= request.getParameter("user")%>" name="user"/>
                                    <input class="form-control" placeholder="contraseña" name="pass" type="password" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Confirmar contraseña" name="passconfirm" type="password" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Cambiar contraseña"/>
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
                    <h4 class="modal-title" id="myModalLabel">Recuperacion de contraseña</h4>
                </div>
                <div class="modal-body">
                    <p>
                        <b>¡Felicitaciones has cambiado tu contraseña exitosamente!</b><br/>
                        Desde ya puedes ingresar a la plataforma utilizando tu correo electronico y la nueva contraseña.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="iralogin()">Ir a inicio de sesion</button>
                </div>
            </div>
        </div>
    </div>
    
    <div id="message_error" class="alert alert-danger alert-dismissable" style="width: 300px; position: absolute; right: 5px; bottom: 5px;" >
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        Recuperación de contraseña no exitosa...
    </div>
    
     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript">
        $( "#message_error" ).hide();
        function open_message(valor){
            if(valor=="true"){
                $( "#message_error" ).hide();
                $('#myModal').modal('show');
                
            }else{
                $("#message_error").show();
                setTimeout(function(){
                    $( "#message_error" ).hide();
		}, 3000);
            }
        }
        
        function iralogin(){
            window.location.href="index.html";
        }
    </script>
    
</body>

</html>

