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


public class list_oferta_empleado extends HttpServlet {

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
        JSONObject joOferta = null;
        System.out.println(sb.toString());
        joOferta = (JSONObject) parser.parse(sb.toString());
        String txt = joOferta.get("txt").toString();
        System.out.println(txt);
        int dpto = Integer.parseInt(joOferta.get("dpto_select").toString());
        System.out.println(dpto);
        int pagina = Integer.parseInt(joOferta.get("pagina").toString());
        System.out.println(pagina);
        HttpSession session =  null;
        
        session = request.getSession(false);
         
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                
                String x = Listas.listaOfertasEmpleado(u.getCodigo(), txt, dpto, pagina).toJSONString();//?
                System.out.println(x+"objeto");
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
            Logger.getLogger(list_oferta_empleado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(list_oferta_empleado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
