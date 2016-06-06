/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato;
 
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
 
/**
 *
 * @author SISTEMAS
 */
public class Mails {
    public static void SendMail(String to, String user, String imagen, String token, String as, String empresa, String textoBoton){
        String servidorSMTP = "smtp.gmail.com";
        String puerto = "587";
        String usuario = "info.sappyme@gmail.com";
        String password = "vale,.,270414";
        String asunto = as;
 
        Properties props = new Properties();
 
        props.put("mail.debug", "true");
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", servidorSMTP);
        props.put("mail.smtp.port", puerto);
 
        Session session = Session.getInstance(props, null);
 
        try {
 
         MimeMultipart alternative = new MimeMultipart("alternative");
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress("Sappyme Colombia <info.sappyme@gmail.com>"));
         MimeBodyPart html = new MimeBodyPart();
 
             html.setContent("<div style='font-size: 12px;color: #424242;width:700px;margin-left:auto;margin-right:auto;padding:10px;;border:solid 2px gray;'>\n" +
"\n" +
"    <div style='border-bottom: 1px solid #E0E0E0;'>\n" +
"      <div style='width: 100%;margin-left: auto;margin-right: auto;'>\n" +
"        <img src='cid:logoimg' style='height: 72px; width: 72px;margin-right: 1em;vertical-align: top;margin-top: 12px;' >\n" +
"        <a href=''>\n" +
"        <h1 style='font-weight: 300;font-size: 4em;margin: 0.5em 0.25em;display: inline-block;color: #3E4156;'>\n" +
"              "+empresa+"\n" +
"        </h1>\n" +
"        </a>\n" +
"      </div>\n" +
"    </div>\n" +
"    <div style='box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);width: 100%;margin-left: auto;margin-right: auto;'>\n" +
"      <div style='box-sizing: border-box;'>\n" +
"        <center><h2 style='font-weight: 250;font-size: 2.5em;margin: 0.5em 0.25em;display: inline-block;color: #3E4156;'>\n" +
"              "+as.toUpperCase()+"\n" +
"        </h2></center>\n" +
"       <center style='padding: 20px 10px;'>\n" +
"               <a style='color:white; background-color:red; border: solid 1px white;padding: 17px;text-decoration:none; cursor:pointer;font-weight:bold;' href='sappyme.co/resetPassword?user="+user+"&tkn="+token+"'>"+textoBoton+"</a>\n" +
"       </center>\n" +
"       <p style='padding: 15px;'>\n" +
"       Después de hacer clic en el botón de arriba , se le pedirá que complete los pasos siguientes :<br/>\n" +
"       1. Introduzca su nueva contraseña.<br/>\n" +
"       2. Haga clic en \"Enviar\" .<br/>\n" +
"       <br/>\n" +
"       Si ya confirmaste tu cuenta o no has solicitado un restablecimiento de contraseña o usted siente que ha recibido este mensaje por error, \n" +
"       por favor llame a nuestro equipo de soporte 24/7 de inmediato. <br/>\n" +
"       Si usted no hace nada, no se preocupes; nadie va a ser capaz de cambiar su contraseña sin acceso a este correo electrónico.\n" +
"       </p>\n" +
"      </div>\n" +
"      <div style='border-top: 1px solid #E0E0E0;padding:25px;'>\n" +
"       <center>Por favor no responder a este email. Los correos electrónicos enviados a esta dirección no serán contestados .</center>\n" +
"        <center>Sofware desarrollado por ROjedaLopez</center>\n" +
"      </div>\n" +
"    </div>\n" +
"  </div>", "text/html");
 
         BodyPart imgPart = new MimeBodyPart();
         String fileName = imagen;
 
 
 
         DataSource ds = new FileDataSource(fileName);
         imgPart.setDataHandler(new DataHandler(ds));
         imgPart.setHeader("Content-ID", "<logoimg>");
         alternative.addBodyPart(imgPart); 
         alternative.addBodyPart(html);
 
         //se recorre la lista de correos del contrato
 
 
         message.addRecipient(Message.RecipientType.CC, new InternetAddress(to));
         message.setSubject(asunto);
         message.setContent(alternative);
 
         Transport tr = session.getTransport("smtp");
         tr.connect(servidorSMTP, usuario, password);
         message.saveChanges();   
         tr.sendMessage(message, message.getAllRecipients());
         tr.close();
 
        } catch (MessagingException e) {
        }
    }
}