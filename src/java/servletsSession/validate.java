/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsSession;

import dato.Aplicacion;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.parser.ParseException;

public class validate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, InvalidKeyException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        String user = request.getParameter("user");
        String tkn = request.getParameter("tkn");
         
        try {
            if(Aplicacion.validarReset(user, tkn)){
                response.sendRedirect("conf/resetPassw.jsp?user="+user+"&tkn="+tkn);
            }else{
                response.sendRedirect("conf/resetPassw.jsp?error=ya fue utilizado el enlace");
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
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
