
package servletsGet;

import bean.usuario;
import dato.Json.Listas;
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


public class list_employes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
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
        JSONObject joEmploye = null;
         
        joEmploye = (JSONObject) parser.parse(sb.toString());
        
        int porpage = Integer.parseInt(joEmploye.get("porpage").toString());
        int pageno = Integer.parseInt(joEmploye.get("pageno").toString());
        String q = (String) joEmploye.get("q");
        
        int expmi = 0;
        int expmx = 0;
        int punmi = 0;
        int punmx = 0;
        int edadmi = 0;
        int edadmx = 0;
        int depto = -1;
        
        if(joEmploye.get("expmi")!=null){
            if(joEmploye.get("expmi").toString().equals("")){
                expmi = 0;
            }else{
                expmi = Integer.parseInt(joEmploye.get("expmi").toString());
            }
        }
        if(joEmploye.get("punmi")!=null){
            if(joEmploye.get("punmi").toString().equals("")){
                punmi = 0;
            }else{
                punmi = Integer.parseInt(joEmploye.get("punmi").toString());
            }
        }
        if(joEmploye.get("edadmi")!=null){
            if(joEmploye.get("edadmi").toString().equals("")){
                edadmi = 0;
            }else{
                edadmi = Integer.parseInt(joEmploye.get("edadmi").toString());
            }
        }
        if(joEmploye.get("expmx")!=null){
            if(joEmploye.get("expmx").toString().equals("")){
                expmx = 0;
            }else{
                expmx = Integer.parseInt(joEmploye.get("expmx").toString());
            }
        }
        if(joEmploye.get("punmx")!=null){
            if(joEmploye.get("punmx").toString().equals("")){
                punmx = 0;
            }else{
                punmx = Integer.parseInt(joEmploye.get("punmx").toString());
            }
        }
        if(joEmploye.get("edadmx")!=null){
            if(joEmploye.get("edadmx").toString().equals("")){
                edadmx = 0;
            }else{
                edadmx = Integer.parseInt(joEmploye.get("edadmx").toString());
            }
        }
        if(joEmploye.get("depto")!=null){
            if(joEmploye.get("depto").toString().equals("")){
                depto = -1;
            }else{
                depto = Integer.parseInt(joEmploye.get("depto").toString());
            }
        }
        HttpSession session =  null;
 
        session = request.getSession(false);
         
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                String x = Listas.listaEmpleados(u.getCodigo(),porpage, pageno, q, expmi, expmx, punmi, punmx, edadmi, edadmx, depto).toJSONString();//?
                System.out.println(x);
                out.print(x);
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
        } catch (SQLException ex) {
            Logger.getLogger(list_employes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(list_employes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
