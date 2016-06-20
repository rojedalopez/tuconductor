
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

public class formacion_usuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, ClassNotFoundException, SQLException {
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
        JSONObject joFormacion = null;
        System.out.println(sb.toString());
        joFormacion = (JSONObject) parser.parse(sb.toString());
        int id = Integer.parseInt(joFormacion.get("id").toString());
        System.out.println(id);
        String c_educativo = (String) joFormacion.get("c_educativo");
        int nivel = Integer.parseInt(joFormacion.get("nivel_estudio").toString());
        String area = (String) joFormacion.get("area_estudio");
        int estado = Integer.parseInt(joFormacion.get("estado").toString());
        int mes_inicio = Integer.parseInt(joFormacion.get("mes_inicio").toString());
        int anio_inicio = Integer.parseInt(joFormacion.get("anio_inicio").toString());
        int mes_fin = 0;
        int anio_fin = 0;
        if(joFormacion.get("mes_fin")!=null){
            mes_fin = Integer.parseInt(joFormacion.get("mes_fin").toString());
        }
        if(joFormacion.get("anio_fin")!=null){
            anio_fin = Integer.parseInt(joFormacion.get("anio_fin").toString());
        }
        boolean eliminar = (Boolean) joFormacion.get("eliminar");
                        
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.SaveFormacion(u.getCodigo(), id, c_educativo, nivel, 
                        area, estado, mes_inicio, anio_inicio, mes_fin, anio_fin, eliminar);
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
            Logger.getLogger(formacion_usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(formacion_usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(formacion_usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
