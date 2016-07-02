package dato.Save;

import static dato.Aplicacion.conexion;
import dato.ExcelReport;
import dato.Get.Objetos;
import dato.Mails;
import dato.Metodos;
import java.security.InvalidKeyException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.List;
import org.json.simple.JSONObject;

/**
 *
 * @author SISTEMAS
 */
public class Guardar {
    static SimpleDateFormat Fechaformateador = new SimpleDateFormat("yyyy-MM-dd 00:00");
    static String FIXED_HASH = "b0b20707cca2b283b5844e77cadf2b5813bd923362b91583c95b736c8763937c0e0df27e9b730c404eeac6484666430f6042c043089135e8d3e76f2e86a82c38";
    static String MERCHANT_ID = "logiseg";
    public static boolean InsertUsuario(String correo, String contrasena, String nomb, String apellido, String telefono, String path, String nacimiento) throws ClassNotFoundException, SQLException, InvalidKeyException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        String hash = Metodos.RandomString(25, false);
        String pass = Metodos.sha512(contrasena, hash);
        String cod = Metodos.RandomString(20, false);
        String token = Metodos.RandomString(10, false);
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_RegistroUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
                cs.setString(1, correo);
                cs.setString(2, hash);
                cs.setString(3, pass);
                cs.setInt(4, 3);
                cs.setString(5, cod);
                cs.setString(6, nomb);
                cs.setString(7, apellido);
                cs.setString(8, telefono);
                cs.setString(9, token);
                cs.setString(10, nacimiento);
                cs.registerOutParameter(11, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(11);
                
                if(retorno==1){
                    Mails.SendMail(correo, token, "CONFIRMACIÓN DE CUENTA", "ACTIVAR");
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    
    public static String SaveMensaje(int chat, String texto, int rol, String origen, String destino) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_Mensaje(?, ?, ?, ?, ?, ?, ?)}")) {
                cs.setInt(1, chat);
                if(rol==2){
                    cs.setInt(2, 0);
                    cs.setInt(3, 1);
                }else{
                    cs.setInt(2, 1);
                    cs.setInt(3, 0);
                }
                cs.setString(4, texto);
                cs.setString(5, origen);
                cs.setString(6, destino);
                cs.registerOutParameter(7, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(7);
                
                System.out.println(retorno);
                if(retorno==1){
                    return "true";
                }else{
                    return "false";
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return "false";

    }
    

    public static boolean UpdateUsuarioDatosPersonales(String cod_, String nombre, String apellido, String tipo_doc_, String doc_, String fecha_, 
            String genero_, String est_civil_, String movil, String tel_, String pais_, String ciudad_, int dpto_, String nbr_dpto, String dir_,
            String nac_, boolean la1, boolean la2, boolean lb1, boolean lb2, boolean lb3, boolean lc1, boolean lc2, boolean lc3, String perfil, String cargo, boolean admitir) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveDatosPersonales(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setString(2, nombre);
                cs.setString(3, apellido);
                cs.setString(4, tipo_doc_);
                cs.setString(5, doc_);
                cs.setString(6, fecha_);
                cs.setString(7, genero_);
                cs.setString(8, est_civil_);
                cs.setString(9, movil);
                cs.setString(10, tel_);
                cs.setString(11, pais_);
                cs.setString(12, ciudad_);
                cs.setInt(13, dpto_);
                cs.setString(14, nbr_dpto);
                cs.setString(15, dir_);
                cs.setString(16, nac_);
                cs.setInt(17, (la1)?1:0);
                cs.setInt(18, (la2)?1:0);
                cs.setInt(19, (lb1)?1:0);
                cs.setInt(20, (lb2)?1:0);
                cs.setInt(21, (lb3)?1:0);
                cs.setInt(22, (lc1)?1:0);
                cs.setInt(23, (lc2)?1:0);
                cs.setInt(24, (lc3)?1:0);
                cs.setString(25, perfil);
                cs.setString(26, cargo);
                cs.setInt(27, (admitir)?1:0);
                cs.registerOutParameter(28, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(28);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    
    public static boolean SaveExperiencia(String cod_, int id, String empresa, String cargo, float salario, float bonos, String supervisor, 
            String telefono, String pais, int dpto, String nbr_depto, String ciudad, String dir, int mes_inicio, int anio_inicio, int mes_fin, int anio_fin, 
            boolean labora, boolean eliminar, String retiro) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveExperiencia(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, empresa);
                cs.setString(4, cargo);
                cs.setFloat(5, salario);
                cs.setFloat(6, bonos);
                cs.setString(7, supervisor);
                cs.setString(8, telefono);
                cs.setString(9, pais);
                cs.setInt(10, dpto);
                cs.setString(11, nbr_depto);
                cs.setString(12, ciudad);
                cs.setString(13, dir);
                cs.setInt(14, mes_inicio);
                cs.setInt(15, anio_inicio);
                cs.setInt(16, mes_fin);
                cs.setInt(17, anio_fin);
                cs.setInt(18, (labora)?1:0);
                cs.setInt(19, (eliminar)?1:0);
                cs.setString(20, retiro);
                cs.registerOutParameter(21, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(21);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en SAVE EXPERIENCIA USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en SAVE EXPERIENCIA USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    //PROC_SaveFormacion
    public static boolean SaveFormacion(String cod_, int id, String c_educativo, int nivel, String area, int estado,
            int mes_inicio, int anio_inicio, int mes_fin, int anio_fin, boolean eliminar) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveFormacion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, c_educativo);
                cs.setInt(4, nivel);
                cs.setString(5, area);
                cs.setInt(6, estado);
                cs.setInt(7, mes_inicio);
                cs.setInt(8, anio_inicio);
                cs.setInt(9, mes_fin);
                cs.setInt(10, anio_fin);
                cs.setInt(11, (eliminar)?1:0);
                cs.registerOutParameter(12, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(12);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en SAVE FORMACION USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en SAVE FORMACION USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    /*
    
    */
    
    
    
    public static JSONObject SaveCompraTokens(int id, String empresa, int plan, float valor, String iso_cur, String medio,
            int tok_vis, int tok_ofr) throws ClassNotFoundException, SQLException{
        boolean b=false;
        JSONObject jSONObject = new JSONObject();
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveCompraTokens(?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setInt(1, id);
                cs.setString(2, empresa);
                cs.setInt(3, plan);
                cs.setFloat(4, valor);
                cs.setString(5, iso_cur);
                cs.setString(6, medio);
                cs.setInt(7, tok_vis);
                cs.setInt(8, tok_ofr);
                cs.registerOutParameter(9, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(9);

                if(retorno!=0){
                    jSONObject.put("merchant_id",MERCHANT_ID);
                    jSONObject.put("po_id",retorno);
                    jSONObject.put("iso_currency",iso_cur);
                    jSONObject.put("amount",(int)valor);
                    jSONObject.put("pv_checksum",Metodos.SHA256(retorno+""+iso_cur+""+((int)valor)+""+FIXED_HASH));
                    jSONObject.put("lifetime",0);
                    jSONObject.put("error",0);
                    return jSONObject;
                }else{
                    jSONObject.put("merchant_id","");
                    jSONObject.put("po_id",0);
                    jSONObject.put("iso_currency","");
                    jSONObject.put("amount",0);
                    jSONObject.put("pv_checksum","");
                    jSONObject.put("lifetime",0);
                    jSONObject.put("error",1);
                    return jSONObject;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en SAVE FORMACION USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en SAVE FORMACION USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return null;

    }
    
    //PROC_SaveFormacion
    public static boolean SaveMulta(String cod_, int id, String lgr_multa, String fch_multa, String cgo_multa, 
            boolean pgo_multa, boolean eliminar) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveMulta(?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, lgr_multa);
                cs.setString(4, fch_multa);
                cs.setString(5, cgo_multa);
                cs.setInt(6, (pgo_multa)?1:0);
                cs.setInt(7, (eliminar)?1:0);
                cs.registerOutParameter(8, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(8);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en SAVE MULTA USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en SAVE MULTA USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    public static boolean SaveAccidente(String cod_, int id, String tipo, int muertes, int heridos, 
            String fecha, boolean eliminar, String lugar) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveAccidente(?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, tipo);
                cs.setInt(4, muertes);
                cs.setInt(5, heridos);
                cs.setString(6, fecha);
                cs.setInt(7, (eliminar)?1:0);
                cs.setString(8, lugar);
                cs.registerOutParameter(9, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(9);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en SAVE MULTA USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en SAVE MULTA USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    public static boolean SaveProcDiciplinal(String cod_, int id, String delito, boolean activo, String fecha, boolean eliminar) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveProcDiciplinal(?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, delito);
                cs.setInt(4, (activo)?1:0);
                cs.setString(5, fecha);
                cs.setInt(6, (eliminar)?1:0);
                cs.registerOutParameter(7, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(7);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en PROC_SaveProcDiciplinal");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en PROC_SaveProcDiciplinal");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    public static boolean SaveProcJudicial(String cod_, int id, String delito, boolean activo, String fecha, boolean eliminar) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveProcJudicial(?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, id);
                cs.setString(3, delito);
                cs.setInt(4, (activo)?1:0);
                cs.setString(5, fecha);
                cs.setInt(6, (eliminar)?1:0);
                cs.registerOutParameter(7, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(7);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en PROC_SaveProcJudicial");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en PROC_SaveProcJudicial");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
    
    public static boolean saveHV(String codigo, String archivo, String token, String nombre, String nombre_persona) throws ClassNotFoundException, SQLException{
         
        Connection conn=null;
        PreparedStatement insertar=null;
        conn=conexion();
        try{
        System.out.println(archivo); 
        System.out.println(codigo); 
        String instruccion="UPDATE tblEmpleado SET hv_empleado = ?, nbr_hv_empleado = ?, tkn_hv_empleado = ?, up_hv_empleado = DATE_ADD(now(), INTERVAL -1 HOUR)"
                + " WHERE cod_empleado = ?;";
         
        insertar=conn.prepareStatement(instruccion);
        insertar.setString(1, archivo);
        insertar.setString(2, nombre);
        insertar.setString(3, token);
        insertar.setString(4, codigo);
                 
        if(insertar.executeUpdate()==1){
            List<String> lista = Objetos.listCorreos();
            Mails.SendMailAgregoHV("INGRESO DE HOJA DE VIDA", "<b>"+nombre_persona+"</b> HA INGRESADO SU HOJA DE VIDA HACE UN INSTANTE",codigo, lista);
            return true;
        }
         
        insertar.close();
        conn.close();
         
        }catch (SQLException ex) {
                System.out.println("error en saveFinCompra");
            System.out.println(ex.getMessage());
        }finally{
            if(conn!=null){
                if(!conn.isClosed()){
                    conn.close();
                }
            }
        }
         
        return false;
    }
    
    public static boolean saveEmpresa(String nit, String r_social, String dir, String tel, String cam_com, 
            String nbr_rep, String doc_rep, String mail_rep, String tel_rep, String correo, String contrasena, String pais,
            int depto, String depart, String ciudad) throws ClassNotFoundException, SQLException, InvalidKeyException{
         
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        String hash = Metodos.RandomString(25, false);
        String pass = Metodos.sha512(contrasena, hash);
        String cod = Metodos.RandomString(20, false);
        String token = Metodos.RandomString(10, false);
        conn=conexion();        
        try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_RegistroEmpresa(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?)}")) {
                cs.setString(1, nit);
                cs.setString(2, r_social);
                cs.setString(3, dir);
                cs.setString(4, tel);
                cs.setString(5, cam_com);
                cs.setString(6, doc_rep);
                cs.setString(7, nbr_rep);
                cs.setString(8, mail_rep);
                cs.setString(9, tel_rep);
                cs.setString(10, correo);
                cs.setString(11, hash);
                cs.setString(12, pass);
                cs.setInt(13, 2);
                cs.setString(14, token);
                cs.setString(15, pais);
                cs.setInt(16, depto);
                cs.setString(17, depart);
                cs.setString(18, ciudad);
                cs.registerOutParameter(19, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(19);
                
                System.out.println("llego aqui");
                if(retorno==1){
                    System.out.println("mandara correo a " + correo);
                    Mails.SendMail(correo, token, "CONFIRMACIÓN DE CUENTA", "ACTIVAR");
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR EMPRESA");
                System.out.println(e.toString());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR EMPRESA");
                System.out.println(e.toString());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;
    }
    
    
    public static boolean saveEmpresabyAdmin(String nit, String r_social, String dir, String tel, String nbr_rep, 
            String doc_rep, String mail_rep, String tel_rep) throws ClassNotFoundException, SQLException{
         
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();        
        try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveEmpresabyAdmin(?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
                cs.setString(1, nit);
                cs.setString(2, r_social);
                cs.setString(3, dir);
                cs.setString(4, tel);
                cs.setString(5, doc_rep);
                cs.setString(6, nbr_rep);
                cs.setString(7, mail_rep);
                cs.setString(8, tel_rep);
                cs.registerOutParameter(9, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(9);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;
    }
    
    
    public static boolean saveOferta(int id, String titulo, String descripcion, int vacante, int tipo, String fecha, 
            float salario, boolean estado, String nit, String pais, int dpto, String nbr_dpto, String ciudad) throws ClassNotFoundException, SQLException, InvalidKeyException{ 
         
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        conn=conexion();        
        try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveOferta(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
                cs.setInt(1, id);
                cs.setInt(2, vacante);
                cs.setString(3, titulo);
                cs.setString(4, descripcion);
                cs.setInt(5, tipo);
                cs.setString(6, fecha);
                cs.setString(7, ""+salario);
                cs.setBoolean(8, estado);
                cs.setString(9, nit);
                cs.setString(10, pais);
                cs.setInt(11, dpto);
                cs.setString(12, nbr_dpto);
                cs.setString(13, ciudad);
                cs.registerOutParameter(14, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(14);
                
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;
    }
    
    
    public static int saveVistaOferta(String cod, int oferta, String correo, String nombre) throws ClassNotFoundException, SQLException, InvalidKeyException{ 
         
        Connection conn=null;
        PreparedStatement insertar=null;
        conn=conexion();        
        try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_VerOferta(?, ?, ?)}")) {
                cs.setString(1, cod);
                cs.setInt(2, oferta);
                cs.registerOutParameter(3, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(3);
                
                if(retorno==1){
                    String info = Objetos.TituloOferta(oferta);
                    String[] textoemail = info.split("\\|");
                    Mails.SendMailOferta(textoemail[1], "VISTA OFERTA", "Su oferta con titulo: "+textoemail[0]+", ha sido vista por " + nombre);
                    Mails.SendMailOferta(correo, "VISTA OFERTA", "Usted ha visto la oferta: "+textoemail[0]);
                    return 1;
                }else{
                    return retorno;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return 0;
    }
    
    public static boolean saveVistaEmpleado(String cod, String empresa, String correo, String ruta) throws ClassNotFoundException, SQLException{ 
         
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        conn=conexion();        
        try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_VerEmpleado(?, ?, ?)}")) {
                cs.setString(1, cod);
                cs.setString(2, empresa);
                cs.registerOutParameter(3, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(3);
                
                if(retorno==1){
                    String info = Objetos.InfoEmpleado(cod);
                    String[] textoemail = info.split("\\|");
                    ExcelReport.createExcel(cod, ruta);
                    Mails.SendCompraEmpleado(correo, "OBTENCIÓN DE INFO DE EMPLEADO", "USTED HA ADQUIRIDO LA INFORMACION DEL SR. "+textoemail[0], cod+".xlsx",ruta,textoemail[2]);
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR EMPRESA");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;
    }
    
    public static boolean SaveCalificacion(String cod_, boolean chk_exp, boolean chk_acc, boolean chk_uexp, boolean chk_cur, boolean chk_myo, boolean chk_esc, 
            boolean chk_jud, boolean chk_com, boolean chk_equ, boolean chk_lab, String not_exp, String not_acc, String not_uexp, String not_cur, String not_myo, 
            String not_esc, String not_jud, String not_com, String not_equ, String not_lab, int pun_tot, String user_val, String not_) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveCalificacion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
                cs.setString(1, cod_);
                cs.setInt(2, (chk_exp)?1:0);
                cs.setInt(3, (chk_acc)?1:0);
                cs.setInt(4, (chk_uexp)?1:0);
                cs.setInt(5, (chk_cur)?1:0);
                cs.setInt(6, (chk_myo)?1:0);
                cs.setInt(7, (chk_esc)?1:0);
                cs.setInt(8, (chk_jud)?1:0);
                cs.setInt(9, (chk_com)?1:0);
                cs.setInt(10, (chk_equ)?1:0);
                cs.setInt(11, (chk_lab)?1:0);
                cs.setString(12, not_exp);
                cs.setString(13, not_acc);
                cs.setString(14, not_uexp);
                cs.setString(15, not_cur);
                cs.setString(16, not_myo);
                cs.setString(17, not_esc);
                cs.setString(18, not_jud);
                cs.setString(19, not_com);
                cs.setString(20, not_equ);
                cs.setString(21, not_lab);
                cs.setInt(22, pun_tot);
                cs.setString(23, user_val);
                cs.setString(24, not_);
                
                cs.registerOutParameter(25, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(25);
                System.out.println(retorno);
                if(retorno==1){
                    return true;
                }else{
                    return false;
                }

            }catch (SQLException e) {
                System.out.println("error SQLException en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }catch (Exception e){
                System.out.println("error Exception en INSERTAR USUARIO");
                System.out.println(e.getMessage());
            }finally{
                if(!conn.isClosed()){
                    conn.close();
                }
            }
            return false;

    }
    
     
}
