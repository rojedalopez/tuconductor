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
            <input type="text" name="po_id" value="LOG0000000001"/>
            <input type="text" name="iso_currency" value="COP"/>
            <input type="number" name="amount"/>
            <input type="text" name="pv-checksum" value="5ab60b638c0800fa0bcdd390e2bd4c674864c2d0221cf757877c0b8a8cf1e3ee"/>
            <input type="number" name="lifetime" value="0"/>
            <input type="submit" value="enviar"/>   
        </form>
    </body>
</html>
