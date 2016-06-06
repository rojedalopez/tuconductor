/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato;

import bean.usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import dato.Metodos.*;
import java.security.InvalidKeyException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;

/**
 *
 * @author SISTEMAS
 */
public class Aplicacion {
    
    public static Connection conexion() throws ClassNotFoundException{
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //Nombre del servidor. localhost:3306 es la ruta y el puerto de la conexión MySQL
            //panamahitek_text es el nombre que le dimos a la base de datos
            String servidor = "jdbc:mysql://52.36.119.44:3306/tuconductor?noAccessToProcedureBodies=true";
            //String servidor = "jdbc:mysql://localhost:3306/"+bd;
            //El root es el nombre de usuario por default. No hay contraseña
            //Se inicia la conexión
            conn = DriverManager.getConnection(servidor, "platform_tc", "fd15c4d8f0c066eaad84a7055c2191c7d8f51b71");
            
        }catch ( SQLException excepcionSql){ //excepcionSql = puede ponerle otro nombre
            System.out.println("error en la conexion a la base de datos"+excepcionSql.getMessage());           
        }
        return conn;
    }
    
    
    public static usuario obtenerUsuario(String correo, String pass) throws SQLException{
        usuario u = null;
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
                try{
                    conn=conexion();
                    String instruccion="SELECT cod_empleado, eml_empleado, hsh_empleado, psw_empleado, nbr_empleado, apl_empleado, mvl_empleado FROM tblEmpleado WHERE eml_empleado = ?;";
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, correo);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        //valido las credenciales
                        String hash = datos.getString(3);
                        String pasw = datos.getString(4);
 
                        if(pasw.equals(Metodos.sha256(pass, hash))){
                            //obtengo el usuario
                            u = new usuario();
                            u.setCodigo(datos.getString(1));
                            u.setCorreo(datos.getString(2));
                            u.setNombre(datos.getString(5));
                            u.setApellido(datos.getString(6));
                            u.setTelefono(datos.getString(7));
                            u.setMensaje("true");
                            return u;
                        }else{
                            u = new usuario();
                            u.setCodigo("-1");
                            u.setMensaje("autenticacion");
 
                            return u;
                        }
 
                    }
                    datos.close();
                    conn.close();
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerUsuario");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerUsuario");
                    System.out.println(e.getMessage());
                }finally{
                    if(conn!=null){
                        if(!conn.isClosed()){
                            conn.close();
                        }
                    }
                }
                     
        return u;
    }
    
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
                    Mails.SendMail(correo, correo, path+"/css/images/varustore.png", hash, "Confirmación de cuenta", "la que sea", "Confirmar");
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
     
     /*
    public static boolean ActivarUsuario(String nick, String passw, String path) throws ClassNotFoundException, SQLException, InvalidKeyException{
        boolean b=false;
        Connection conn=null;
        PreparedStatement insertar=null;
        conn=conexion("sappyme");
        try{
         
        String instruccion="UPDATE usuarios SET hashUsr = ?, passwordUsr = ?, cambiar = 0, tokenCambio = NULL WHERE id_usuarios = ?;";
         
        String hash = Metodos.RandomString(15, true);
        String pass = Metodos.sha256(passw, hash);
         
        insertar=conn.prepareStatement(instruccion);
        insertar.setString(1, hash);
        insertar.setString(2, pass);
        insertar.setString(3, nick);
                 
        if(insertar.executeUpdate()==1){
            b=true;
        }
         
        insertar.close();
        conn.close();
         
         
         
        }catch (SQLException ex) {
                System.out.println("error en InsertUsuario");
            System.out.println(ex.getMessage());
        }finally{
            if(!conn.isClosed()){
                conn.close();
            }
        }
         
        return b;
    }
     
    public static boolean validarReset(String user, String tkn) throws  SQLException{
            Propietario p = null;
            Connection conn=null;
            PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
                try{
                    conn=conexion("sappyme");
                    String instruccion="SELECT id_usuarios FROM usuarios WHERE id_usuarios = ? AND tokenCambio = ? AND cambiar = 1;";
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, user);
                    insertar.setString(2, tkn);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        return true;
                    }
                    datos.close();
                    conn.close();
                 
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerPropietario");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerPropietario");
                    System.out.println(e.getMessage());
        }finally{
                    if(conn!=null){
                        if(!conn.isClosed()){
                            conn.close();
                        }
                    }
                }
                     
        return false;
    }*/
}
