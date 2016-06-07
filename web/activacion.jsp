<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Bienvenido a TuConductor</h4>
                </div>
                <div class="modal-body">
                    <p>
                        <% if(request.getParameter("error")==null){%>
                            <b> ¡Felicitaciones has activado tu cuenta con exito! </b><br/>
                            Gracias por activar tu cuenta en nuestro portal <b>TuConductor</b>, 
                            Desde ya puedes ingresar a la plataforma utilizando tu correo electronico y contraseña.
                        <%}else{%>
                            <b> ¡Se ha generado un error en el proceso! </b><br/>
                            El enlace que usted desea utilizar, ya fue utilizado con anterioridad, 
                            es decir que su cuenta ya ha sido activada o el correo no es correcto.    
                            Intente ingresar a la plataforma utilizando su correo electronico y contraseña.<br/>
                            Si no recuerda su contraseña, puede hacer uso de la opcion, recordar contraseña.<br/>
                        <%}%>
                        
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="iralogin('<%out.print((request.getParameter("email")!=null)?request.getParameter("email"):"");%>')">Ir a inicio de sesion</button>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript">
        $('#myModal').modal('show');
        
        function iralogin(correo){
            if(correo===""){
                window.location.href="index.jsp";
            }else{
                window.location.href="index.jsp?email="+correo;
            }
        }
    </script>
    
</body>

</html>
