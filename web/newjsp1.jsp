<%-- 
    Document   : newjsp1
    Created on : 24-jun-2016, 9:56:19
    Author     : SISTEMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="https://testpayvalidaapp.payvalida.com/AppPaymentPay" method="post">
            <input type="text" name="merchant_id" value="logiseg"/>
            <input type="text" name="po_id" value="LOG0000000002"/>
            <input type="text" name="iso_currency" value="COP"/>
            <input type="number" name="amount" value="10000"/>
            <input type="text" name="pv_checksum" value="636347b3924d8ececa7f0e4ea35f987e23f300473748daa6b9daff57be0acfcf"/>
            <input type="number" name="lifetime" value="0"/>
            <input type="submit" value="enviar"/>   
        </form>
    </body>
</html>
