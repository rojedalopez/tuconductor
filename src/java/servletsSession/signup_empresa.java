package servletsSession;

import dato.Metodos;
import dato.Save.Guardar;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.simple.parser.ParseException;

@MultipartConfig
public class signup_empresa extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, InvalidKeyException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8"); 
        
        Part filePart = request.getPart("cam_com"); // Retrieves <input type="file" name="file">
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
        
        String nit = (String) request.getParameter("nit");
        String r_social = (String) request.getParameter("r_social");
        String dir = (String) request.getParameter("dir");
        String pais = (String) request.getParameter("pais");
        int dpto = Integer.parseInt(request.getParameter("depto"));
        System.out.print(dpto+"-------");
        String depart = (String) request.getParameter("depart");
        String ciudad = (String) request.getParameter("ciudad");
        String tel = (String) request.getParameter("tel");
        String nombre_replegal = (String) request.getParameter("nombre_replegal");
        String doc_replegal = (String) request.getParameter("doc_replegal");
        String email_replegal = (String) request.getParameter("email_replegal");
        String tel_replegal = (String) request.getParameter("tel_replegal");
        String correo = (String) request.getParameter("mail");
        String password = (String) request.getParameter("password");
        
        String path = getServletContext().getRealPath("");
        
        System.out.println("Se va " );
        boolean b=Guardar.saveEmpresa(nit, r_social, dir, tel, nuevo_nombre, nombre_replegal, doc_replegal, 
                email_replegal, tel_replegal, correo, password, pais, dpto, depart, ciudad);
         
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(b){
                out.print("true");
            }else{
                out.print("false");
            }
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
