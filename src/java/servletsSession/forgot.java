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

public class forgot extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String correo = request.getParameter("mail");
        
        try (PrintWriter out = response.getWriter()) {
            try {
                if(Aplicacion.ForgotPassword(correo)){
                    response.sendRedirect("?ya");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeyException ex) {
                Logger.getLogger(forgot.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
