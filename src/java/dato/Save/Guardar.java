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
    
}
