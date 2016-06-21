package servletsSession;

import dato.Aplicacion;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class forgot extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
  
        try
        {
          BufferedReader reader = request.getReader();
          String line = null;
          while ((line = reader.readLine()) != null)
          {
            sb.append(line);
          }
        } catch (Exception e) { e.printStackTrace(); }
 
        JSONParser parser = new JSONParser();
        JSONObject joCliente = null;
         
        try {
            joCliente = (JSONObject) parser.parse(sb.toString());
        } catch (ParseException ex) {
            Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String mail = (String) joCliente.get("mail");
        
        try (PrintWriter out = response.getWriter()) {
            try {
                if(Aplicacion.ForgotPassword(mail)){
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("forgot",true);
                    out.print(jSONObject.toJSONString());
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeyException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
