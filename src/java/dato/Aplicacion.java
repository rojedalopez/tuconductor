/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
    
    
    public static String prueba(){
     JSONObject obj = null;
     JSONObject obj2 = null;
     JSONArray lista = new JSONArray();
     JSONArray lista2 = new JSONArray();
     JSONObject retorno =new JSONObject();
     
     for(int i=0; i<15;i++){
         obj = new JSONObject();
         obj.put("valor", i);
         lista.add(obj);
     }
     
     for(int i=20; i<45;i++){
         obj2 = new JSONObject();
         obj2.put("valor", i);
         lista2.add(obj2);
     }
    
     retorno.put("lista1", lista);
     retorno.put("lista2", lista2);
     
     return retorno.toJSONString();
    }
    
}
