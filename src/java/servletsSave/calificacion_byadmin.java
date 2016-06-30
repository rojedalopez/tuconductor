package servletsSave;

import bean.usuario;
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

public class calificacion_byadmin extends HttpServlet {

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
        JSONObject joCalificacion = null;
        System.out.println(sb.toString());
        joCalificacion = (JSONObject) parser.parse(sb.toString());
        String cod = (String)joCalificacion.get("cod");
        
        boolean chk_exp = (Boolean) joCalificacion.get("chk_exp");
        boolean chk_acc = (Boolean) joCalificacion.get("chk_acc");
        boolean chk_uexp = (Boolean) joCalificacion.get("chk_uexp");
        boolean chk_cur = (Boolean) joCalificacion.get("chk_cur");
        boolean chk_myo = (Boolean) joCalificacion.get("chk_myo");
        boolean chk_esc = (Boolean) joCalificacion.get("chk_esc");
        boolean chk_jud = (Boolean) joCalificacion.get("chk_jud");
        boolean chk_com = (Boolean) joCalificacion.get("chk_com");
        boolean chk_equ = (Boolean) joCalificacion.get("chk_equ");
        boolean chk_lab = (Boolean) joCalificacion.get("chk_lab");
        
        String not_exp = (String) joCalificacion.get("not_exp");
        String not_acc = (String) joCalificacion.get("not_acc");
        String not_uexp = (String) joCalificacion.get("not_uexp");
        String not_cur = (String) joCalificacion.get("not_cur");
        String not_myo = (String) joCalificacion.get("not_myo");
        String not_esc = (String) joCalificacion.get("not_esc");
        String not_jud = (String) joCalificacion.get("not_jud");
        String not_com = (String) joCalificacion.get("not_com");
        String not_equ = (String) joCalificacion.get("not_equ");
        String not_lab = (String) joCalificacion.get("not_lab");
        System.out.println(not_lab);
        int pun_tot = Integer.parseInt(joCalificacion.get("tot_cal").toString());
        String not_ = (String) joCalificacion.get("not_");
        
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user"); 
                System.out.println(u.getCodigo());
                boolean b = dato.Save.Guardar.SaveCalificacion(cod, chk_exp, chk_acc, chk_uexp, chk_cur, chk_myo, 
                chk_esc, chk_jud, chk_com, chk_equ, chk_lab, not_exp, not_acc, not_uexp, not_cur, not_myo, not_esc, 
                not_jud, not_com, not_equ, not_lab, pun_tot, u.getCodigo(), not_);
                        
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
           Logger.getLogger(calificacion_byadmin.class.getName()).log(Level.SEVERE, null, ex);
       } catch (ClassNotFoundException ex) {
           Logger.getLogger(calificacion_byadmin.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(calificacion_byadmin.class.getName()).log(Level.SEVERE, null, ex);
       }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
