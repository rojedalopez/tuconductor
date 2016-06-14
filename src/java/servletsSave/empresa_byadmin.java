package servletsSave;

import bean.usuario;
import dato.Save.Guardar;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class empresa_byadmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, ParseException, ClassNotFoundException, SQLException, IOException {
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
        JSONObject joUser_dp = null;
        joUser_dp = (JSONObject) parser.parse(sb.toString());
                
        String nit = (String) joUser_dp.get("nit");
        String r_social = (String) joUser_dp.get("r_social");
        String dir = (String) joUser_dp.get("dir");
        String tel = (String) joUser_dp.get("tel");
        String doc_replegal = (String) joUser_dp.get("doc_replegal");
        String nombre_replegal = (String) joUser_dp.get("nombre_replegal");
        String email_replegal = (String) joUser_dp.get("email_replegal");
        String tel_replegal = (String) joUser_dp.get("tel_replegal");
        
        
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.saveEmpresabyAdmin(nit, r_social, dir, tel, 
                        nombre_replegal, doc_replegal, email_replegal, tel_replegal);
                if(b){
                    out.print("true");
                }else{
                    out.print("false");
                }
            }else{
                out.print("session");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(usuario_dp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(usuario_dp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(empresa_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
