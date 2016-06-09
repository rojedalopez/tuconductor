/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato.Save;

import static dato.Aplicacion.conexion;
import dato.Mails;
import dato.Metodos;
import java.security.InvalidKeyException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author SISTEMAS
 */
public class Guardar {
    
    public static boolean InsertUsuario(String correo, String contrasena, String nomb, String apellido, String telefono, String path) throws ClassNotFoundException, SQLException, InvalidKeyException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        String hash = Metodos.RandomString(25, false);
        String pass = Metodos.sha256(contrasena, hash);
        String cod = Metodos.RandomString(20, false);
        String token = Metodos.RandomString(10, false);
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_RegistroUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
                cs.setString(1, correo);
                cs.setString(2, hash);
                cs.setString(3, pass);
                cs.setInt(4, 3);
                cs.setString(5, cod);
                cs.setString(6, nomb);
                cs.setString(7, apellido);
                cs.setString(8, telefono);
                cs.setString(9, token);
                cs.registerOutParameter(10, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(10);
                
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
    
    
    public static String InsertComment(int id, int publicacion, String cod, String comment) throws ClassNotFoundException, SQLException, InvalidKeyException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_Comentario(?, ?, ?, ?, ?)}")) {
                System.out.println("prueba 1");
                cs.setInt(1, id);
                System.out.println(id);
                cs.setInt(2, publicacion);
                System.out.println(publicacion);
                cs.setString(3, cod);
                System.out.println(cod);
                cs.setString(4, comment);
                System.out.println(comment);
                cs.registerOutParameter(5, Types.INTEGER);
                cs.executeQuery();

                System.out.println("prueba 1");
                int retorno = cs.getInt(5);
                
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
            String genero_, String est_civil_, String movil, String tel_, String pais_, String ciudad_, String dpto_, String dir_,
            String nac_, boolean la1, boolean la2, boolean lb1, boolean lb2, boolean lb3, boolean lc1, boolean lc2, boolean lc3, String perfil, String cargo) throws ClassNotFoundException, SQLException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        
        conn=conexion();
            try (CallableStatement cs = conn.prepareCall("{CALL tuconductor.PROC_SaveDatosPersonales(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)};")) {
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
                cs.setString(13, dpto_);
                cs.setString(14, dir_);
                cs.setString(15, nac_);
                cs.setInt(16, (la1)?1:0);
                cs.setInt(17, (la2)?1:0);
                cs.setInt(18, (lb1)?1:0);
                cs.setInt(19, (lb2)?1:0);
                cs.setInt(20, (lb3)?1:0);
                cs.setInt(21, (lc1)?1:0);
                cs.setInt(22, (lc2)?1:0);
                cs.setInt(23, (lc3)?1:0);
                cs.setString(24, perfil);
                cs.setString(25, cargo);
                cs.registerOutParameter(26, Types.INTEGER);
                cs.executeQuery();

                int retorno = cs.getInt(26);
                
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
