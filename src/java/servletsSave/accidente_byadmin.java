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

public class accidente_byadmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
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
        JSONObject joAccidente = null;
        System.out.println(sb.toString());
        joAccidente = (JSONObject) parser.parse(sb.toString());
        int id = Integer.parseInt(joAccidente.get("id").toString());
        System.out.println(id);
        boolean bmuertes=Boolean.parseBoolean(joAccidente.get("muertos").toString());
        int muertes = (bmuertes) ? 1 : 0;
        System.out.println(muertes);
        boolean bheridos=Boolean.parseBoolean(joAccidente.get("heridos").toString());
        int heridos = (bheridos) ? 1 : 0;
        System.out.println(heridos);
        String tipo = joAccidente.get("tipo").toString();
        
        String lugar = joAccidente.get("lugar").toString();
        System.out.println(tipo);
        String fecha = (String) joAccidente.get("date");
        System.out.println(fecha);
        String codigoConductor = (String) joAccidente.get("cod");
        boolean eliminar = (Boolean) joAccidente.get("eliminar");
        System.out.println(id+" - "+muertes+" - "+heridos+" - "+tipo+" - "+fecha+" - "+codigoConductor);
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.SaveAccidente(codigoConductor, id, tipo, muertes, heridos, fecha, eliminar, lugar);
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
        } catch (ParseException ex) {
            Logger.getLogger(procdiciplinal_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(procdiciplinal_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(procdiciplinal_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
