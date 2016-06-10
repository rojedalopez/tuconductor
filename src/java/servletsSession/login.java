/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsSession;

import bean.usuario;
import dato.Aplicacion;
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

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String usuario = request.getParameter("nick");
        String contrasena = request.getParameter("pass");
        HttpSession session =  null;
 
        session = request.getSession(true);

        usuario u = Aplicacion.obtenerUsuario(usuario, contrasena);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(u!=null){
                if(u.getMensaje().equals("true")){
                    session.setAttribute("user", u);
                    session.setAttribute("cod", u.getCodigo());
                    session.setAttribute("session", true);
                    if(u.getRol()==1){
                        response.sendRedirect("admin/");
                    }else if(u.getRol()==2){
                        session.setAttribute("usr", u.getNombre());
                        response.sendRedirect("empresa/");
                    }else if(u.getRol()==3){
                        String[] nombre = u.getNombre().split(" ");
                        session.setAttribute("usr", nombre[0]);
                        response.sendRedirect("conductor/");
                    }
                 }else{
                    System.out.println("error en: " +u.getMensaje());
                    response.sendRedirect("?mensaje=Error en la autenticacion.");
                }
            }else{
                response.sendRedirect("../?mensaje=No existe usuario.");                
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
