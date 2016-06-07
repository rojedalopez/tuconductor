/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato.Json;

import static dato.Aplicacion.conexion;
import dato.Metodos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/**
 *
 * @author SISTEMAS
 */
public class Listas {
    public static String ObtenerCliente(String id) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT p.id_publicacion, fch_publicacion, cmn_publicacion, ach_publicacion, " +
                                    "CONCAT(e1.nbr_empleado, \" \", e1.apl_empleado) AS Origen, e1.cod_empleado AS cod_origen, mg_publicacion, p.cod_empleado, num_cmn_publicacion " +
                                    "FROM tblPublicacion as p INNER JOIN tblEmpleado as e1 ON p.cod_empleado = e1.cod_empleado " +
                                    "WHERE mro_cod_empleado = ? ORDER BY fch_publicacion DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("fecha", datos.getString(2));
                        obj.put("comentario", datos.getString(3));
                        obj.put("archivo", datos.getString(4));
                        obj.put("origen", datos.getString(5));
                        obj.put("cod_origen", datos.getString(6));
                        obj.put("megusta", datos.getInt(7));
                        obj.put("destino", datos.getString(8));
                        obj.put("num_comentario", datos.getInt(9));
                        obj.put("desde", Metodos.calcular(datos.getString(2)));
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    return lista.toJSONString();
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerCliente");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerCliente");
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return "";
    }
    
   
}
