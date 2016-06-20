/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author HP I7
 */
public class experiencia_byadmin extends HttpServlet {

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
        JSONObject joExperiencia_usr = null;
        System.out.println(sb.toString());
        joExperiencia_usr = (JSONObject) parser.parse(sb.toString());
        int id = Integer.parseInt(joExperiencia_usr.get("id").toString());
        System.out.println("prueba = "+id);
        String empresa = (String) joExperiencia_usr.get("empresa");
        String cargo = (String) joExperiencia_usr.get("cargo");
        float salario = Float.parseFloat(joExperiencia_usr.get("salario").toString());
        float bonos = Float.parseFloat(joExperiencia_usr.get("bonos").toString());
        String supervisor = (String) joExperiencia_usr.get("supervisor");
        String telefono = (String) joExperiencia_usr.get("telefono");
        String pais = (String) joExperiencia_usr.get("pais");
        int dpto = Integer.parseInt(joExperiencia_usr.get("depto").toString());
        System.out.print(dpto+"-------");
        String depart = (String) joExperiencia_usr.get("depart");
        String ciudad = (String) joExperiencia_usr.get("ciudad");
        String direccion = (String) joExperiencia_usr.get("direccion");
        String codigoConductor = (String) joExperiencia_usr.get("cod");
        int mes_inicio = Integer.parseInt(joExperiencia_usr.get("mes_inicio").toString());
        int anio_inicio = Integer.parseInt(joExperiencia_usr.get("anio_inicio").toString());
        int mes_fin = 0;
        int anio_fin = 0;
        
        if(joExperiencia_usr.get("mes_fin")!=null){
            mes_fin = Integer.parseInt(joExperiencia_usr.get("mes_fin").toString());
        }
        if(joExperiencia_usr.get("anio_fin")!=null){
            anio_fin = Integer.parseInt(joExperiencia_usr.get("anio_fin").toString());
        }
        boolean labora = (Boolean) joExperiencia_usr.get("labora");
        boolean eliminar = (Boolean) joExperiencia_usr.get("eliminar");
        String retiro = (String) joExperiencia_usr.get("retiro");
                        
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.SaveExperiencia(codigoConductor, id, empresa, cargo, 
                        salario, bonos, supervisor, telefono, pais, dpto, depart, ciudad, direccion, mes_inicio, 
                        anio_inicio, mes_fin, anio_fin, labora, eliminar, retiro);
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


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(experiencia_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(experiencia_byadmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(experiencia_byadmin.class.getName()).log(Level.SEVERE, null, ex);
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
