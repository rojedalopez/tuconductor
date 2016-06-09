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
public class Objetos {
    public static String ObtenerDatosdeUsuario(String id) throws SQLException{
        JSONObject obj = new JSONObject();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT cod_empleado, nbr_empleado, apl_empleado, tpo_doc_empleado, doc_empleado, nto_empleado, gnr_empleado, sta_civ_empleado, " +
                                    "mvl_empleado, tel_empleado, pais_empleado, cui_empleado, dpt_empleado, dir_empleado, nac_empleado, lic_a1_empleado, " +
                                    "lic_a2_empleado, lic_b1_empleado, lic_b2_empleado, lic_b3_empleado, lic_c1_empleado, lic_c2_empleado, lic_c3_empleado, prf_empleado, cgo_empleado " +
                                    "FROM tblEmpleado WHERE cod_empleado = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        obj.put("cod", datos.getString(1));
                        obj.put("nombre", datos.getString(2));
                        obj.put("apellido", datos.getString(3));
                        obj.put("tip_doc", datos.getString(4));
                        obj.put("num_doc", datos.getString(5));
                        obj.put("fecha_nac", datos.getString(6));
                        obj.put("genero", datos.getString(7));
                        obj.put("est_civil", datos.getString(8));
                        obj.put("movil", datos.getString(9));
                        obj.put("tel", datos.getString(10));
                        obj.put("pais", datos.getString(11));
                        obj.put("ciudad", datos.getString(12));
                        obj.put("depto", datos.getString(13));
                        obj.put("dir", datos.getString(14));
                        obj.put("naci", datos.getString(15));
                        obj.put("la1", datos.getBoolean(16));
                        obj.put("la2", datos.getBoolean(17));
                        obj.put("lb1", datos.getBoolean(18));
                        obj.put("lb2", datos.getBoolean(19));
                        obj.put("lb3", datos.getBoolean(20));
                        obj.put("lc1", datos.getBoolean(21));
                        obj.put("lc2", datos.getBoolean(22));
                        obj.put("lc3", datos.getBoolean(23));
                        obj.put("perfil", datos.getString(24));
                        obj.put("cargo", datos.getString(25));
                    }
                    datos.close();
                    conn.close();
                    return obj.toJSONString();
             
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
