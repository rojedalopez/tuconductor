
package servletsSession;

import dato.Aplicacion;
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

public class validateforgot extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InvalidKeyException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String user = request.getParameter("user");
            String tkn = request.getParameter("tkn");
            String pwd = request.getParameter("pass");

            try {
                if(Aplicacion.validarReset(user, tkn)){
                    System.out.println("valido");
                    if(Aplicacion.ActivarUsuario(user, pwd)){
                        System.out.println("activo");
                        response.sendRedirect("activacion.jsp");
                    }else{
                        System.out.println("no activo");
                        response.sendRedirect("activacion.jsp?error");
                    }
                }else{
                    System.out.println("ocurrio error");
                    response.sendRedirect("activacion.jsp?error");
                }
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validateforgot.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(validateforgot.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String user = request.getParameter("user");
            String tkn = request.getParameter("tkn");

            if(Aplicacion.validarReset(user, tkn)){
                response.sendRedirect("editpassword.jsp?tkn="+tkn+"&user="+user);    
            }else{
                response.sendRedirect("activacion.jsp?error");
            }
        } catch (SQLException ex) {
            Logger.getLogger(validateforgot.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
