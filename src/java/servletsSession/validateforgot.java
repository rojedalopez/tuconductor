
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
        response.setContentType("text/html;charset=UTF-8");
        
        String user = request.getParameter("user");
        String tkn = request.getParameter("tkn");
        String pwd = request.getParameter("pass");
         
        try {
            if(Aplicacion.validarReset(user, tkn)){
                if(Aplicacion.ActivarUsuario(user, pwd)){
                    response.sendRedirect("?exito");
                }else{
                    response.sendRedirect("?error");
                }
            }else{
                response.sendRedirect("activacion.jsp?error");
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validateforgot.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(validateforgot.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
