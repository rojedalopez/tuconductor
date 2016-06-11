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
    public static String ObtenerPublicacionesProfile(String id) throws SQLException{
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
    
    public static String ObtenerCommentsByPublish(int id) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT c.id_comentario, CONCAT(e.nbr_empleado, \" \", e.apl_empleado) AS Origen, " +
                                    "c.fch_comentario, c.cmn_comentario, e.cod_empleado, c.id_publicacion " +
                                    "FROM tblComentario  AS c INNER JOIN tblEmpleado AS e ON c.cod_empleado = e.cod_empleado " +
                                    "WHERE id_publicacion = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setInt(1, id);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("origen", datos.getString(2));
                        obj.put("fecha", datos.getString(3));
                        obj.put("comentario", datos.getString(4));
                        obj.put("cod_origen", datos.getString(5));
                        obj.put("id_publicacion", datos.getInt(6));
                        obj.put("desde", Metodos.calcular(datos.getString(3)));
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
        return lista.toJSONString();
    }
    
    public static JSONArray listaExpLaborales(String cod) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_explaboral, epr_explaboral, crg_explaboral, slr_explaboral, bon_explaboral, spv_explaboral, " +
                                    "tel_spv_explaboral, dir_explaboral, cui_explaboral, dpt_explaboral, pais_explaboral, aun_explaboral, " +
                                    "rzn_fin_explaboral, mes_ini_explaboral, anio_ini_explaboral, mes_fin_explaboral, " +
                                    "anio_fin_explaboral, exp_mes_explaboral " +
                                    "FROM tuconductor.tblExpLaboral WHERE cod_empleado = ? ORDER BY aun_explaboral DESC, anio_ini_explaboral DESC, mes_ini_explaboral DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("empresa", datos.getString(2));
                        obj.put("cargo", datos.getString(3));
                        obj.put("salario", datos.getFloat(4));
                        obj.put("bonos", datos.getFloat(5));
                        obj.put("supervisor", datos.getString(6));
                        obj.put("telefono", datos.getString(7));
                        obj.put("direccion", datos.getString(8));
                        obj.put("ciudad", datos.getString(9));
                        obj.put("dpto", datos.getString(10));
                        obj.put("pais", datos.getString(11));
                        obj.put("labora", datos.getBoolean(12));
                        obj.put("retiro", datos.getString(13));
                        obj.put("mes_inicio", datos.getInt(14));
                        obj.put("anio_inicio", datos.getInt(15));
                        obj.put("mes_fin", datos.getInt(16));
                        obj.put("anio_fin", datos.getInt(17));
                        obj.put("exp_meses", datos.getInt(18));
                        
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    return lista;
             
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
        return lista;
    }
    
    public static JSONArray listaOfertas(String cod) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_oferta, fch_oferta, vac_oferta, tit_oferta, dsc_oferta, tip_ctr_oferta, " +
                                    "fch_ctr_oferta, sal_oferta, act_oferta " +
                                    "FROM tuconductor.tblOferta WHERE nit_empresa = ? ORDER BY fch_oferta DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("fecha", datos.getString(2));
                        obj.put("vacante", datos.getString(3));
                        obj.put("titulo", datos.getFloat(4));
                        obj.put("descripcion", datos.getFloat(5));
                        obj.put("tipo", datos.getString(6));
                        obj.put("fecha_contratacion", datos.getString(7));
                        obj.put("salario", datos.getString(8));
                        obj.put("estado", datos.getString(9));
                        
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    return lista;
             
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
        return lista;
    }
    
    public static JSONArray listaFormaciones(String cod) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_formacion, ins_formacion, id_nvlformacion, area_formacion, id_estformacion, mes_ini_formacin, " +
                                    "anio_ini_formacion, mes_fin_formacion, anio_fin_formacion FROM tblFormacion " +
                                    "WHERE cod_empleado = ? ORDER BY id_nvlformacion DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("c_educativo", datos.getString(2));
                        obj.put("nivel_estudio", datos.getInt(3));
                        obj.put("area_estudio", datos.getString(4));
                        obj.put("estado", datos.getInt(5));
                        obj.put("mes_inicio", datos.getInt(6));
                        obj.put("anio_inicio", datos.getInt(7));
                        obj.put("mes_fin", datos.getInt(8));
                        obj.put("anio_fin", datos.getInt(9));
                        
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    return lista;
             
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
        return lista;
    }
   
}
