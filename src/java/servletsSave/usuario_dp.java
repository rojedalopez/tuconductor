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
 * @author SISTEMAS
 */

public class usuario_dp extends HttpServlet {

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
        JSONObject joUser_dp = null;
        joUser_dp = (JSONObject) parser.parse(sb.toString());
                
        String nombre = (String) joUser_dp.get("nombre");
        String apellido = (String) joUser_dp.get("apellido");
        String tip_doc = (String) joUser_dp.get("tip_doc");
        String num_doc = (String) joUser_dp.get("num_doc");
        String fecha_nac = (String) joUser_dp.get("date");
        System.out.println(fecha_nac);
        String genero = (String) joUser_dp.get("genero");
        String est_civil = (String) joUser_dp.get("est_civil");
        String mov = (String) joUser_dp.get("movil");
        String tel = (String) joUser_dp.get("tel");
        String pais = (String) joUser_dp.get("pais");
        String ciudad = (String) joUser_dp.get("ciudad");
        String nbr_dpto = (String) joUser_dp.get("depart");
        int dpto = Integer.parseInt(joUser_dp.get("depto").toString());
        System.out.println(ciudad + ", " + nbr_dpto + ", " + pais);
        String dir = (String) joUser_dp.get("dir");
        String naci = (String) joUser_dp.get("naci");
        boolean la1 = (Boolean) joUser_dp.get("la1");
        boolean la2 = (Boolean) joUser_dp.get("la2");
        boolean lb1 = (Boolean) joUser_dp.get("lb1");
        boolean lb2 = (Boolean) joUser_dp.get("lb2");
        boolean lb3 = (Boolean) joUser_dp.get("lb3");
        boolean lc1 = (Boolean) joUser_dp.get("lc1");
        boolean lc2 = (Boolean) joUser_dp.get("lc2");
        boolean lc3 = (Boolean) joUser_dp.get("lc3");
        String perfil = (String) joUser_dp.get("perfil");
        String cargo = (String) joUser_dp.get("cargo");
        
        HttpSession session =  null;
 
        session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(session.getAttribute("user")!=null){
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.UpdateUsuarioDatosPersonales(u.getCodigo(), nombre, apellido, tip_doc, 
                        num_doc, fecha_nac, genero, est_civil, mov, tel, pais, ciudad, dpto, nbr_dpto, dir, naci, 
                        la1, la2, lb1, lb2, lb3, lc1, lc2, lc3, perfil, cargo);
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
            Logger.getLogger(usuario_dp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(usuario_dp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(usuario_dp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
