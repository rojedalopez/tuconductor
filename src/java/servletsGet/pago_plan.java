
package servletsGet;

import bean.usuario;
import dato.Json.Objetos;
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


public class pago_plan extends HttpServlet {

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
        JSONObject joPagoPlan = null;
        joPagoPlan = (JSONObject) parser.parse(sb.toString());
        System.out.println(sb.toString());
        int id_ = Integer.parseInt(joPagoPlan.get("id").toString());
        int id_plan = Integer.parseInt(joPagoPlan.get("id_plan").toString());
        float valor = Float.parseFloat(joPagoPlan.get("valor").toString());
        String iso_cur = (String)joPagoPlan.get("iso_cur");
        String medio = (String)joPagoPlan.get("medio");
        int tok_vis = Integer.parseInt(joPagoPlan.get("visual").toString());
        int tok_ofr = Integer.parseInt(joPagoPlan.get("oferta").toString());
        
        HttpSession session =  null;
 
        session = request.getSession(false);
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                String x = Guardar.SaveCompraTokens(id_, u.getCodigo(), id_plan, valor, iso_cur, medio, tok_vis, tok_ofr).toJSONString();
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
        } catch (ParseException ex) {
            Logger.getLogger(pago_plan.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(pago_plan.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(pago_plan.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
