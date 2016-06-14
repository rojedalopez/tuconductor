/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletsSave;

import bean.usuario;
import dato.Json.Listas;
import dato.Metodos;
import dato.Save.Guardar;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.simple.JSONObject;

@MultipartConfig
public class upload_hv extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        String filename = getFilename(filePart);
        System.out.println(filename);
        String[] vector_nombre = filename.split("\\.");
        int tamanio = vector_nombre[0].length();
        String token = Metodos.RandomString(55-tamanio, false);
        String nuevo_nombre = vector_nombre[0]+"_"+token+"."+vector_nombre[1];
        InputStream filecontent = filePart.getInputStream();
        String c = "";
        try{
            c = Thread.currentThread().getContextClassLoader().getResource("../../").getPath();    
            System.out.println(c);
            File f = new File(c+"/upload/"+nuevo_nombre).getCanonicalFile();
            FileOutputStream ous = new FileOutputStream(f);
            int dato = filecontent.read();
            while(dato != -1){
                ous.write(dato);
                dato = filecontent.read();
            }
        }catch(IOException ex){
            System.out.println(ex.getMessage());
        }
        
        HttpSession session =  null;
 
        session = request.getSession(false);
         
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("user")!=null){
                session.setAttribute("hv", vector_nombre[0]);
                session.setAttribute("tkn", token);
                session.setAttribute("ext", vector_nombre[1]);
                session.setAttribute("fch", new Date());
                
                usuario u = (usuario)session.getAttribute("user");
                boolean b = Guardar.saveHV(u.getCodigo(), nuevo_nombre, token, filename, u.getNombre() + " " + u.getApellido());
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
        } catch (SQLException ex) {
            Logger.getLogger(upload_hv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(upload_hv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private static String getFilename(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
