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
import java.text.SimpleDateFormat;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/**
 *
 * @author SISTEMAS
 */
public class Listas {
    static SimpleDateFormat Fechaformateador = new SimpleDateFormat("yyyy-MM-dd 00:00");
    static SimpleDateFormat Fecha = new SimpleDateFormat("yyyy-MM-dd");
    static SimpleDateFormat Hora = new SimpleDateFormat("hh:mm");
  
    public static String ObtenerDestinos(String cod, int rol) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    
                    if(rol==2){
                        instruccion  =  " SELECT ee.cod_empleado, CONCAT(ep.nbr_empleado, ' ',  ep.apl_empleado) AS nombre ";
                        instruccion +=  " FROM tblEmpresaEmpleado AS ee INNER JOIN tblEmpresa AS em ON ee.nit_empresa = em.nit_empresa ";
                        instruccion +=  " INNER JOIN tblEmpleado AS ep ON ee.cod_empleado = ep.cod_empleado " ;
                        instruccion +=  " WHERE ee.nit_empresa = ? AND not exists(SELECT 1 from tblChat  AS ch WHERE ch.cod_empleado = ep.cod_empleado );";
                    }else{
                        instruccion  =  "SELECT ee.nit_empresa, nbr_empresa AS nombre ";
                        instruccion += " FROM tblEmpresaEmpleado AS ee INNER JOIN tblEmpresa AS em ON ee.nit_empresa = em.nit_empresa " ;
                        instruccion += " INNER JOIN tblEmpleado AS ep ON ee.cod_empleado = ep.cod_empleado " ;
                        instruccion += " WHERE ee.cod_empleado = ? AND not exists(ELECT 1 from tblChat  AS ch WHERE ch.nit_empresa = em.nit_empresa );";
                    }
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("destino", datos.getString(1));
                        obj.put("n_destino", datos.getString(2));
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
    
    
    public static String ObtenerChats(String cod, int rol) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    
                    if(rol==2){
                        instruccion  =  "SELECT c.id_chat, CONCAT(e.nbr_empleado, ' ', e.apl_empleado) AS nombre, c.cod_empleado, c.fch_chat, c.ult_msn_chat, ";
                        instruccion +=  " c.vis_epl_chat, c.inv_epl_chat FROM tblChat AS c INNER JOIN tblEmpleado AS e ON e.cod_empleado = c.cod_empleado ";
                        instruccion +=  " WHERE nit_empresa = ?";
                    }else{
                        instruccion  = " SELECT c.id_chat, e.nbr_empresa, c.nit_empresa, c.fch_chat, c.ult_msn_chat, c.vis_emp_chat, c.inv_emp_chat " ;
                        instruccion += " FROM tblChat AS c INNER JOIN tblEmpresa AS e ON e.nit_empresa = c.nit_empresa " ;
                        instruccion += " WHERE cod_empleado = ?;";
                    }
                    System.out.println(instruccion + "                " + cod);
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("n_destino", datos.getString(2));
                        obj.put("destino", datos.getString(3));
                        obj.put("fecha", Metodos.calcular(datos.getString(4)));
                        obj.put("ult_mensaje", Metodos.calcular(datos.getString(5)));
                        obj.put("visto", datos.getBoolean(6));
                        obj.put("invisible", datos.getBoolean(7));
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
    
    public static String ObtenerMensajes(int id, int rol) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    
                    if(rol==2){
                        instruccion  =  "SELECT id_mensaje, CASE WHEN m.emp_rol_mensaje = 1 THEN ep.cod_empleado ELSE em.nit_empresa END AS cod_destino, " +
                                        "CASE WHEN m.emp_rol_mensaje = 1 THEN ep.nbr_empleado ELSE em.nbr_empresa END AS n_destino, " +
                                        "txt_mensaje, m.fch_mensaje, emp_rol_mensaje " +
                                        "FROM tblMensaje AS m INNER JOIN tblChat AS c ON m.id_chat = c.id_chat " +
                                        "INNER JOIN tblEmpleado AS ep ON ep.cod_empleado = c.cod_empleado " +
                                        "INNER JOIN tblEmpresa AS em ON em.nit_empresa = c.nit_empresa WHERE m.id_chat = ?; ";
                    }else{
                        instruccion  = "SELECT id_mensaje, CASE WHEN m.epl_rol_mensaje = 1 THEN em.nit_empresa ELSE ep.cod_empleado END AS cod_destino, " +
                                        "CASE WHEN m.epl_rol_mensaje = 1 THEN em.nbr_empresa ELSE ep.nbr_empleado END AS n_destino, " +
                                        "txt_mensaje, m.fch_mensaje, epl_rol_mensaje " +
                                        "FROM tblMensaje AS m INNER JOIN tblChat AS c ON m.id_chat = c.id_chat " +
                                        "INNER JOIN tblEmpleado AS ep ON ep.cod_empleado = c.cod_empleado " +
                                        "INNER JOIN tblEmpresa AS em ON em.nit_empresa = c.nit_empresa WHERE m.id_chat = ?; ";
                    }
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setInt(1, id);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("destino", datos.getString(2));
                        obj.put("n_destino", datos.getString(3));
                        obj.put("texto", datos.getString(4));
                        obj.put("fecha", Metodos.calcular(datos.getString(5)));
                        obj.put("rol", datos.getBoolean(6));
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
    
    
    public static String ObtenerMensajesByChat(int id) throws SQLException{
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
                        obj.put("fecha", Fechaformateador.format(datos.getDate(3)));
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
    
    
    public static String PlanesTokens() throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion = "SELECT id_plan, dsc_plan, tkn_plan, ofr_mes_plan, dur_plan, vlr_plan " ;
                    instruccion += "FROM tuconductor.tblPlan WHERE id_plan <> 0 ORDER BY id_plan ASC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("nombre", datos.getString(2));
                        obj.put("visual", datos.getInt(3));
                        obj.put("oferta", datos.getInt(4));
                        obj.put("duracion", datos.getInt(5));
                        obj.put("valor", datos.getFloat(6));
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
    
    
     public static JSONArray ObtenerTrazaTknByEmpresa(String id) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT DATE_FORMAT(fch_trazatoken,'%Y/%m/%d') AS Fecha, DATE_FORMAT(fch_trazatoken,'%h:%i %p') AS Hora, CASE WHEN tpo_token = 1 THEN 'Publico Oferta' ELSE concat('Compro Información de :',em.nbr_empleado) END " +
                                    "FROM tblTrazaToken AS tt LEFT JOIN tblEmpleado AS em ON tt.cod_empleado = em.cod_empleado " +
                                    "WHERE nit_empresa = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("fecha", datos.getString(1));
                        obj.put("hora", datos.getString(2));
                        obj.put("evento", datos.getString(3));
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
     
    public static JSONObject listaExpLaborales(String cod, boolean cal) throws SQLException{
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
                                    "tel_spv_explaboral, dir_explaboral, cui_explaboral, dpt_explaboral, nbr_dpt_explaboral, IFNULL(pais_explaboral,'CO'), aun_explaboral, " +
                                    "rzn_fin_explaboral, mes_ini_explaboral, anio_ini_explaboral, mes_fin_explaboral, " +
                                    "anio_fin_explaboral, mes_explaboral, anio_explaboral, cod_empleado " +
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
                        obj.put("depto", datos.getInt(10));
                        obj.put("depart", datos.getString(11));
                        obj.put("pais", datos.getString(12));
                        obj.put("labora", datos.getBoolean(13));
                        obj.put("retiro", datos.getString(14));
                        obj.put("mes_inicio", datos.getInt(15));
                        obj.put("anio_inicio", datos.getInt(16));
                        obj.put("mes_fin", datos.getInt(17));
                        obj.put("anio_fin", datos.getInt(18));
                        obj.put("exp_meses", datos.getInt(19));
                        obj.put("cod", datos.getString(20));
                        obj.put("eliminar", false);
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    
                    JSONObject re = new JSONObject();
                    re.put("lista", lista);
                    if(cal){
                        re.put("check", Objetos.ObtenerPuntaje(cod));        
                    }
                    return re;
             
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
        return null;
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
                                    "fch_ctr_oferta, sal_oferta, act_oferta, IFNULL(pais_oferta,'CO'), dpt_oferta, nbr_dpt_oferta, ciu_oferta FROM tuconductor.tblOferta ";
                    if(!cod.equals("")){
                        instruccion  += " WHERE nit_empresa = ? ";
                    }else{
                        instruccion  += " WHERE act_oferta = 1 ";
                    }
                    instruccion  += "ORDER BY fch_oferta DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    if(!cod.equals("")){
                        insertar.setString(1, cod);
                    }
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("fecha", datos.getString(2));
                        obj.put("vacante", datos.getInt(3));
                        obj.put("titulo", datos.getString(4));
                        obj.put("descripcion", datos.getString(5));
                        obj.put("tipo", datos.getInt(6));
                        obj.put("fecha_contratacion", Fechaformateador.format(datos.getDate(7)));
                        obj.put("salario", datos.getFloat(8));
                        obj.put("estado", datos.getBoolean(9));
                        obj.put("pais", datos.getString(10));
                        obj.put("depto", datos.getInt(11));
                        obj.put("depart", datos.getString(12));
                        obj.put("ciudad", datos.getString(13));
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
    
    
    public static JSONObject listaOfertasEmpleado(String cod, String q, int depto, int pageno, int porpage) throws SQLException{
        JSONObject obj = null;
        JSONObject obj_ = new JSONObject();
        obj_.put("error", 0);
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    int desde = ((pageno-1)*porpage); 
                    instruccion =   "SELECT x.id_oferta, fch_oferta, vac_oferta, tit_oferta, dsc_oferta, tip_ctr_oferta, " ;
                    instruccion += "fch_ctr_oferta, sal_oferta, act_oferta, " ;
                    instruccion += "ifnull((SELECT CASE WHEN id_oferta IS NULL THEN 0 ELSE 1 END FROM tblVistaOferta " ;
                    instruccion += "WHERE cod_empleado = ? and id_oferta = x.id_oferta),0) as ya_vio, IFNULL(pais_oferta,'CO'), dpt_oferta, nbr_dpt_oferta, ciu_oferta " ;
                    instruccion += "FROM tblOferta as x WHERE act_oferta = 1 ";
                    
                    if(!q.isEmpty()){
                        instruccion += " AND (tit_oferta like '%"+q+"%' OR dsc_oferta like '%"+q+"%') ";
                    }

                    if(depto!=-1){
                        instruccion += " AND dpt_oferta = " + depto;
                    }
                    
                    instruccion += " ORDER BY fch_oferta DESC ";
                    instruccion += " LIMIT "+desde+","+porpage+";";
                    
                    System.out.println(instruccion);
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("fecha", datos.getString(2));
                        obj.put("vacante", datos.getInt(3));
                        obj.put("titulo", datos.getString(4));
                        obj.put("descripcion", datos.getString(5));
                        obj.put("tipo", datos.getInt(6));
                        obj.put("fecha_contratacion", Fechaformateador.format(datos.getDate(7)));
                        obj.put("salario", datos.getFloat(8));
                        obj.put("estado", datos.getBoolean(9));
                        obj.put("visto", datos.getBoolean(10));
                        obj.put("pais", datos.getString(11));
                        obj.put("depto", datos.getInt(12));
                        obj.put("depart", datos.getString(13));
                        obj.put("ciudad", datos.getString(14));
                        lista.add(obj);
                        
                    }
                    datos.close();
                    conn.close();
                    
                    obj_.put("total_count", totalFiltradosOfertas(q, depto));
                    obj_.put("data", lista);
                    
                    return obj_;
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerCliente");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerCliente"+e.toString());
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        obj_.put("total_count", 0);
        obj_.put("data", lista);
        return obj_;
    }
    
    public static int totalFiltradosOfertas(String q, int depto) throws SQLException{
        int retorno=0;
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
        
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT count(1) FROM tblOferta as x WHERE act_oferta ";
                    
                    if(!q.isEmpty()){
                        instruccion += " AND (tit_oferta like '%"+q+"%' OR dsc_oferta like '%"+q+"%') ";
                    }

                    if(depto!=-1){
                        instruccion += " AND dpt_oferta = " + depto;
                    }
                    
                    insertar=conn.prepareStatement(instruccion);

                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        return datos.getInt(1);
                    }
                    
                    return 0;
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerCliente");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerCliente"+e.toString());
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return 0;
    }
    
    
    public static JSONObject listaFormaciones(String cod, boolean cal) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_formacion, ins_formacion, id_nvlformacion, area_formacion, id_estformacion, mes_ini_formacion, " +
                                    "anio_ini_formacion, mes_fin_formacion, anio_fin_formacion, cod_empleado FROM tblFormacion " +
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
                        obj.put("cod", datos.getString(10));
                        obj.put("eliminar", false);
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    JSONObject re = new JSONObject();
                    re.put("lista", lista);
                    if(cal){
                        re.put("check", Objetos.ObtenerPuntaje(cod));        
                    }      
                    return re;
             
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
        return null;
    }
    
    public static JSONObject listaMultas(String cod, boolean cal) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_multa, lgr_multa, fch_multa, cgo_multa, pgo_multa, cod_empleado " +
                                    "FROM tblMulta " +
                                    "WHERE cod_empleado = ? ORDER BY fch_multa DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("lgr_multa", datos.getString(2));
                        obj.put("fch_multa", Fechaformateador.format(datos.getDate(3)));
                        obj.put("cgo_multa", datos.getString(4));
                        obj.put("pgo_multa", datos.getBoolean(5));
                        obj.put("cod", datos.getString(6));
                        obj.put("eliminar", false);                        
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    JSONObject re = new JSONObject();
                    re.put("lista", lista);
                    if(cal){
                        re.put("check", Objetos.ObtenerPuntaje(cod));        
                    }       
                    return re;
             
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
        return null;
    }
    
    
    public static JSONObject listaAccidentes(String cod, boolean cal) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_accidente, cod_empleado, fch_accidente, tpo_accidente, mte_accidente, hdo_accidente " +
                                    "FROM tblAccidente WHERE cod_empleado = ? ORDER BY fch_accidente DESC;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("cod", datos.getString(2));
                        obj.put("fch_accidente", Fechaformateador.format(datos.getDate(3)));
                        obj.put("tipo", datos.getString(4));
                        obj.put("muertos", datos.getInt(5));
                        obj.put("heridos", datos.getInt(6));
                        obj.put("eliminar", false);
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    JSONObject re = new JSONObject();
                    re.put("lista", lista);
                    if(cal){
                        re.put("check", Objetos.ObtenerPuntaje(cod));        
                    }
                    return re;
             
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
        return null;
    }
    
    
    public static JSONArray listaProcDiciplinal(String cod) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_procdisciplina, cod_empleado, del_procdisciplina, fch_procdisciplina, act_procdisciplina " +
                                    "FROM tblProcDisciplina WHERE cod_empleado = ? ORDER BY fch_procdisciplina DESC; " ;
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("cod", datos.getString(2));
                        obj.put("delito", datos.getString(3));
                        obj.put("fecha", Fechaformateador.format(datos.getDate(4)));
                        obj.put("activo", datos.getBoolean(5));
                        obj.put("eliminar", false);
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
    
    
    
    public static JSONObject listaProcJudicial(String cod, boolean cal) throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT id_procjudicial, cod_empleado, del_procjudicial, fch_procjudicial, act_procjudicial " +
                                    "FROM tblProcJudicial WHERE cod_empleado = ? ORDER BY fch_procjudicial DESC; " ;
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, cod);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("id", datos.getInt(1));
                        obj.put("cod", datos.getString(2));
                        obj.put("del_procjudicial", datos.getString(3));
                        obj.put("fch_procjudicial", Fechaformateador.format(datos.getDate(4)));
                        obj.put("act_procjudicial", datos.getBoolean(5));
                        obj.put("eliminar", false);
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    JSONObject re = new JSONObject();
                    re.put("lista", lista);
                    if(cal){
                        re.put("check", Objetos.ObtenerPuntaje(cod));        
                    }
                    return re;
             
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
        return null;
    }
   
    public static JSONObject listaEmpleados(String codigo, int porpage, int pageno, String q, int expmi, int expmx, int punmi, int punmx,
            int edadmi, int edadmx, int depto) throws SQLException{
        JSONObject obj = null;
        JSONObject obj_ = new JSONObject();
        obj_.put("error", 0);
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    int desde = ((pageno-1)*porpage);
                    instruccion =   "SELECT e.cod_empleado, eml_usuario, nbr_empleado, apl_empleado, c.pun_tot_calificacion, hv_empleado, ROUND(exp_empleado), ROUND(datediff(now(),nto_empleado)/365), nbr_dpt_empleado, " +
                                    "(SELECT COUNT(1) FROM tblVistaEmpleado AS v WHERE e.cod_empleado = v.cod_empleado AND nit_empresa = ?) AS cod " +
                                    "FROM tblEmpleado AS e INNER JOIN tblCalificacion AS c ON e.cod_empleado = c.cod_empleado WHERE ver_empleado = 1 ";
                    if(!q.isEmpty()){
                        instruccion += " AND nbr_empleado like '%"+q+"%' OR apl_empleado like '%"+q+"%' ";
                    }
                    
                    if(expmi!=0&&expmx!=0&&expmi<expmx){
                        instruccion += " AND exp_empleado BETWEEN " + expmi + " AND " + expmx;
                    }else if(expmi!=0&&expmx==0){
                        instruccion += " AND exp_empleado >= " + expmi;
                    }else if(expmi==0&&expmx!=0){
                        instruccion += " AND exp_empleado <= " + expmx;
                    }
                    
                    if(punmi!=0&&punmx!=0&&punmi<punmx){
                        instruccion += " AND pun_tot_calificacion BETWEEN " + punmi + " AND " + punmx;
                    }else if(punmi!=0&&punmx==0){
                        instruccion += " AND pun_tot_calificacion >= " + punmi;
                    }else if(punmi==0&&punmx!=0){
                        instruccion += " AND pun_tot_calificacion <= " + punmx;
                    }
                    
                    if(edadmi!=0&&edadmx!=0&&edadmi<edadmx){
                        instruccion += " AND ROUND(datediff(now(),nto_empleado)/365) BETWEEN " + edadmi + " AND " + edadmx;
                    }else if(edadmi!=0&&edadmx==0){
                        instruccion += " AND ROUND(datediff(now(),nto_empleado)/365) >= " + edadmi;
                    }else if(edadmi==0&&edadmx!=0){
                        instruccion += " AND ROUND(datediff(now(),nto_empleado)/365) <= " + edadmx;
                    }
                    if(depto!=-1){
                        instruccion += " AND dpt_empleado = " + depto;
                    }
                    
                    instruccion += " ORDER BY c.pun_tot_calificacion DESC ";
                    instruccion += " LIMIT "+desde+","+porpage+";";
                    
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, codigo);
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("cod", datos.getString(1));
                        obj.put("email", datos.getString(2));
                        obj.put("nombre", datos.getString(3));
                        obj.put("apellido", datos.getString(4));
                        obj.put("puntaje", datos.getInt(5));
                        obj.put("hoja_vida", datos.getString(6));
                        obj.put("experiencia", datos.getInt(7));
                        obj.put("adquirir", datos.getBoolean(8));
                        obj.put("edad", datos.getString(8));
                        obj.put("depto", datos.getString(9));
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                                    
                    obj_.put("total_count", totalFiltrados(q, expmi, expmx, punmi, punmx, edadmi, edadmx, depto));
                    obj_.put("data", lista);
                    
                    return obj_;
             
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
        
        obj_.put("total_count", 0);
        obj_.put("data", lista);
        return obj_;
    }
    
    
    public static JSONObject listaEmpleados(int porpage, int pageno, String q, int expmi, int expmx, int punmi, int punmx,
            int edadmi, int edadmx, int depto) throws SQLException{
        JSONObject obj = null;
        JSONObject obj_ = new JSONObject();
        obj_.put("error", 0);
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                    int desde = ((pageno-1)*porpage);
                    instruccion =   "SELECT e.cod_empleado, eml_usuario, nbr_empleado, apl_empleado, c.pun_tot_calificacion, hv_empleado, ROUND(exp_empleado), ROUND(datediff(now(),nto_empleado)/365), nbr_dpt_empleado  " ;
                    instruccion += "FROM tblEmpleado AS e INNER JOIN tblCalificacion AS c ON e.cod_empleado = c.cod_empleado ";
                    boolean where = false;
                    if(!q.isEmpty()){
                        instruccion += " WHERE nbr_empleado like '%"+q+"%' OR apl_empleado like '%"+q+"%' ";
                        where = true;
                    }
                    
                    if(expmi!=0&&expmx!=0&&expmi<expmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado BETWEEN " + expmi + " AND " + expmx;
                        where = true;
                    }else if(expmi!=0&&expmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado >= " + expmi;
                        where = true;
                    }else if(expmi==0&&expmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado <= " + expmx;
                        where = true;
                    }
                    
                    if(punmi!=0&&punmx!=0&&punmi<punmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion BETWEEN " + punmi + " AND " + punmx;
                        where = true;
                    }else if(punmi!=0&&punmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion >= " + punmi;
                        where = true;
                    }else if(punmi==0&&punmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion <= " + punmx;
                        where = true;
                    }
                    
                    if(edadmi!=0&&edadmx!=0&&edadmi<edadmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) BETWEEN " + edadmi + " AND " + edadmx;
                        where = true;
                    }else if(edadmi!=0&&edadmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) >= " + edadmi;
                        where = true;
                    }else if(edadmi==0&&edadmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) <= " + edadmx;
                        where = true;
                    }
                    if(depto!=-1){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " dpt_empleado = " + depto;
                        where = true;
                    }
                    
                    instruccion += " ORDER BY c.pun_tot_calificacion DESC ";
                    instruccion += " LIMIT "+desde+","+porpage+";";
                    System.out.println(instruccion) ;
                    insertar=conn.prepareStatement(instruccion);
                    
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("cod", datos.getString(1));
                        obj.put("email", datos.getString(2));
                        obj.put("nombre", datos.getString(3));
                        obj.put("apellido", datos.getString(4));
                        obj.put("puntaje", datos.getInt(5));
                        obj.put("hoja_vida", datos.getString(6));
                        obj.put("experiencia", datos.getInt(7));
                        obj.put("edad", datos.getString(8));
                        obj.put("depto", datos.getString(9));
                        lista.add(obj);
                    }
                    datos.close();
                    conn.close();
                    
                    obj_.put("total_count", totalFiltrados(q, expmi, expmx, punmi, punmx, edadmi, edadmx, depto));
                    obj_.put("data", lista);
                    
                    return obj_;
             
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
        
        obj_.put("total_count", 0);
        obj_.put("data", lista);
        return obj_;
    }
    
    public static JSONArray listaEmpresas() throws SQLException{
        JSONObject obj = null;
        JSONArray lista = new JSONArray();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT nit_empresa, nbr_empresa, dir_empresa, tel_empresa, cam_com_empresa, doc_rep_empresa,"+
                                    "nbr_rep_empresa, eml_rep_empresa, tel_rep_empresa, dmo_empresa, id_plan, tkn_dis_empresa, "+
                                    "ofr_dis_empresa, ult_cmp_empresa, vnc_cmp_empresa, tot_tkn_empresa, tot_ofr_empresa " +
                                    "FROM tblEmpresa ORDER BY nbr_empresa";
                     
                    insertar=conn.prepareStatement(instruccion);
                    
                    datos=insertar.executeQuery();
                    while (datos.next()) {
                        obj = new JSONObject();
                        obj.put("nit", datos.getString(1)); 
                        obj.put("r_social", datos.getString(2));
                        obj.put("dir", datos.getString(3));
                        obj.put("tel", datos.getString(4));
                        obj.put("cam_com", datos.getString(5));
                        obj.put("doc_replegal", datos.getString(6));
                        obj.put("nombre_replegal", datos.getString(7));
                        obj.put("email_replegal", datos.getString(8));
                        obj.put("tel_replegal", datos.getString(9));
                        obj.put("demo", datos.getBoolean(10));
                        obj.put("id_plan", datos.getInt(11));
                        obj.put("tkn_disp", datos.getInt(12));
                        obj.put("ofertas_disp", datos.getInt(13));
                        obj.put("ult_compra", Fechaformateador.format(datos.getDate(14)));
                        obj.put("vence_compra", Fechaformateador.format(datos.getDate(15)));
                        obj.put("tot_tkn", datos.getInt(16));
                        obj.put("tot_ofr", datos.getInt(17));
                        obj.put("trazas", Listas.ObtenerTrazaTknByEmpresa(datos.getString(1)));
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
    
    public static int totalFiltrados(String q, int expmi, int expmx, int punmi, int punmx,
            int edadmi, int edadmx, int depto) throws SQLException{
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
        Connection conn=null;
        
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT count(1)  " ;
                    instruccion += "FROM tblEmpleado ";
                    boolean where = false;
                    if(!q.isEmpty()){
                        instruccion += " WHERE nbr_empleado like '%"+q+"%' OR apl_empleado like '%"+q+"%' ";
                        where = true;
                    }
                    
                    if(expmi!=0&&expmx!=0&&expmi<expmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado BETWEEN " + expmi + " AND " + expmx;
                        where = true;
                    }else if(expmi!=0&&expmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado >= " + expmi;
                        where = true;
                    }else if(expmi==0&&expmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " exp_empleado <= " + expmx;
                        where = true;
                    }
                    
                    if(punmi!=0&&punmx!=0&&punmi<punmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion BETWEEN " + punmi + " AND " + punmx;
                        where = true;
                    }else if(punmi!=0&&punmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion >= " + punmi;
                        where = true;
                    }else if(punmi==0&&punmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " pun_tot_calificacion <= " + punmx;
                        where = true;
                    }
                    
                    if(edadmi!=0&&edadmx!=0&&edadmi<edadmx){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) BETWEEN " + edadmi + " AND " + edadmx;
                        where = true;
                    }else if(edadmi!=0&&edadmx==0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) >= " + edadmi;
                        where = true;
                    }else if(edadmi==0&&edadmx!=0){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " ROUND(datediff(now(),nto_empleado)/365) <= " + edadmx;
                        where = true;
                    }
                    if(depto!=-1){
                        if(!where){
                            instruccion += " WHERE ";
                        }else{
                            instruccion += " AND ";
                        }
                        instruccion += " dpt_empleado = " + depto;
                        where = true;
                    }
                     
                    insertar=conn.prepareStatement(instruccion);
                    
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        return datos.getInt(1);
                    }
                    datos.close();
                    conn.close();
                    return 0;
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerCliente");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerCliente");
                    System.out.println(e.getMessage());
        }
        return 0;
    }
    
   
}
