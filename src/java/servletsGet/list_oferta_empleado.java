package servletsGet;

import bean.usuario;
import dato.Json.Listas;
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


public class list_oferta_empleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session =  null;
 
        session = request.getSession(false);
         
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                String x = Listas.listaOfertasEmpleado(u.getCodigo()).toJSONString();//?
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
            Logger.getLogger(list_oferta_empleado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
