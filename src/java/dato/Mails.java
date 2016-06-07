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
    public static void SendMail(String user, String token, String as, String textoBoton){
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
 
             html.setContent("<div style='font-size: 12px;color: #424242;width:100%;margin-left:auto;margin-right:auto;padding:10px;background-color: #E0E0E0;'>\n" +
"            <div style='width: 70%; margin: 0 auto;background-color: #ffffff;'>\n" +
"    <div style='border-bottom: 1px solid #E0E0E0;'>\n" +
"      <div style='width: 100%;margin-left: auto;margin-right: auto;background-color: navy;height: 15px;'>\n" +
"      </div>\n" +
"    </div>\n" +
"    <div style='box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);width: 100%;margin-left: auto;margin-right: auto;'>\n" +
"      <div style='box-sizing: border-box;'>\n" +
"        <center><h2 style='font-weight: 250;font-size: 2.5em;margin: 0.5em 0.25em;display: inline-block;color: #3E4156;'>\n" +
              as + 
"        </h2></center>\n" +
"       <center style='padding: 20px 10px;'>\n" +
"               <a style='color:white; background-color:red; border: solid 1px white;padding: 17px;text-decoration:none; \n" +
"                  cursor:pointer;font-weight:bold;' href='http://sappyme.co:8081/tuconductor/validate?user="+user+"&tkn="+token+"'>\n" +
                    textoBoton +
"               </a>\n" +
"       </center>\n" +
"       <p style='padding: 15px;'>\n" +
"       Para completar su registro es necesario que active su cuenta, para esto debe darle clic al boton anterior.<br/>\n" +
"       Si no es posible ingresar al boton, ingrese al siguiente link:<br/>\n" +
"       <a href='http://sappyme.co:8081/tuconductor/validate?user="+user+"&tkn="+token+"'>href='http://sappyme.co:8081/tuconductor/validate?user="+user+"&tkn="+token+"'</a>\n" +
"       <br/>\n" +
"       <br/>\n" +
"       Si ya confirmaste tu cuenta o no has solicitado un restablecimiento de contraseña o usted siente que ha recibido este mensaje por error, \n" +
"       por favor llame a nuestro equipo de soporte 24/7 de inmediato. <br/>\n" +
"       Si usted no hace nada, no se preocupes; nadie va a ser capaz de cambiar su contraseña sin acceso a este correo electrónico.\n" +
"       </p>\n" +
"      </div>\n" +
"      <div style='border-top: 1px solid #E0E0E0;padding:25px;'>\n" +
"       <center>Por favor no responder a este email.</center>\n" +
"       <center>Los correos electrónicos enviados a esta dirección no serán contestados.</center>\n" +
"        <center>© 2016 TuConductor</center>\n" +
"      </div>\n" +
"    </div>\n" +
"    </div>        \n" +
"  </div>", "text/html");
 
         /*BodyPart imgPart = new MimeBodyPart();
         String fileName = imagen;
 
 
 
         DataSource ds = new FileDataSource(fileName);
         imgPart.setDataHandler(new DataHandler(ds));
         imgPart.setHeader("Content-ID", "<logoimg>");
         alternative.addBodyPart(imgPart); */
         alternative.addBodyPart(html);
 
         //se recorre la lista de correos del contrato
 
 
         message.addRecipient(Message.RecipientType.CC, new InternetAddress(user));
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