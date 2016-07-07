/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato.Json;

import static dato.Aplicacion.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.json.simple.JSONObject;

/**
 *
 * @author SISTEMAS
 */
public class Objetos {
    
    static SimpleDateFormat Fechaformateador = new SimpleDateFormat("yyyy-MM-dd 00:00");
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
                                    "mvl_empleado, tel_empleado, IFNULL(pais_empleado,'CO'), cui_empleado, dpt_empleado, dir_empleado, nac_empleado, lic_a1_empleado, " +
                                    "lic_a2_empleado, lic_b1_empleado, lic_b2_empleado, lic_b3_empleado, lic_c1_empleado, lic_c2_empleado, lic_c3_empleado, prf_empleado, cgo_empleado, ver_empleado " +
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
                        if(datos.getString(6) == null){
                            obj.put("fecha_nac", Fechaformateador.format(new Date()));
                        }else{
                            obj.put("fecha_nac", Fechaformateador.format(datos.getDate(6)));
                        }
                        obj.put("genero", datos.getString(7));
                        obj.put("est_civil", datos.getString(8));
                        obj.put("movil", datos.getString(9));
                        obj.put("tel", datos.getString(10));
                        obj.put("pais", datos.getString(11));
                        obj.put("ciudad", datos.getString(12));
                        obj.put("depto", datos.getInt(13));
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
                        obj.put("verificado", datos.getBoolean(26));
                        obj.put("exp_laborales", Listas.listaExpLaborales(id,false));
                        obj.put("formacion", Listas.listaFormaciones(id, false));
                        obj.put("multas", Listas.listaMultas(id, false));
                        obj.put("accidentes", Listas.listaAccidentes(id, false));
                        obj.put("judiciales", Listas.listaProcJudicial(id, false));
                        obj.put("check", ObtenerPuntaje(id));
                    }
                    datos.close();
                    conn.close();
                    return obj.toJSONString();
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerDatosdeUsuario");
                    System.out.println(e.toString());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerDatosdeUsuario");
                    System.out.println(e.toString());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return "";
    }
   
    public static String ObtenerDatosdeEmpresa(String id) throws SQLException{
        JSONObject obj = new JSONObject();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT nit_empresa, nbr_empresa, dir_empresa, tel_empresa, cam_com_empresa, doc_rep_empresa, " +
                                    "nbr_rep_empresa, eml_rep_empresa, tel_rep_empresa, dmo_empresa, id_plan, tkn_dis_empresa, " +
                                    "ofr_dis_empresa, ult_cmp_empresa, vnc_cmp_empresa, tot_tkn_empresa, tot_ofr_empresa " +
                                    "FROM tblEmpresa " +
                                    "WHERE nit_empresa = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
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
                        obj.put("trazas", Listas.ObtenerTrazaTknByEmpresa(id));
                    }
                    datos.close();
                    conn.close();
                    System.out.println(obj.toJSONString());
                    return obj.toJSONString();
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerDatosdeEmpresa");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerDatosdeEmpresa");
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return "";
    }
    
    
    public static String ObtenerDatosGeneral(String id) throws SQLException{
        JSONObject obj = new JSONObject();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT hv_empleado, nbr_hv_empleado, tkn_hv_empleado, up_hv_empleado FROM tuconductor.tblEmpleado WHERE cod_empleado = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        obj.put("archivo", datos.getString(1));
                        obj.put("nombre", datos.getString(2));
                        obj.put("token", datos.getString(3));
                        obj.put("fecha", datos.getString(4));
                    }
                    datos.close();
                    conn.close();
                    System.out.println(obj.toJSONString());
                    return obj.toJSONString();
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerDatosGeneral");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerDatosGeneral");
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return "";
    }
    
    
    public static JSONObject ObtenerPuntaje(String id) throws SQLException{
        JSONObject obj = new JSONObject();
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT chk_exp_calificacion, not_exp_calificacion, chk_acc_calificacion, not_acc_calificacion, " +
                                    "chk_uexp_calificacion, not_uexp_calificacion, chk_cur_calificacion, not_cur_calificacion, " +
                                    "chk_myo_calificacion, not_myo_calificacion, chk_esc_calificacion, not_esc_calificacion, " +
                                    "chk_jud_calificacion, not_jud_calificacion, chk_com_calificacion, not_com_calificacion, " +
                                    "chk_equ_calificacion, not_equ_calificacion, chk_lab_calificacion, not_lab_calificacion, " +
                                    "pun_tot_calificacion, not_calificacion FROM tblCalificacion WHERE cod_empleado = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setString(1, id);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        obj.put("chk_exp", datos.getBoolean(1));
                        obj.put("not_exp", datos.getString(2));
                        obj.put("chk_acc", datos.getBoolean(3));
                        obj.put("not_acc", datos.getString(4));
                        obj.put("chk_uexp", datos.getBoolean(5));
                        obj.put("not_uexp", datos.getString(6));
                        obj.put("chk_cur", datos.getBoolean(7));
                        obj.put("not_cur", datos.getString(8));
                        obj.put("chk_myo", datos.getBoolean(9));
                        obj.put("not_myo", datos.getString(10));
                        obj.put("chk_esc", datos.getBoolean(11));
                        obj.put("not_esc", datos.getString(12));
                        obj.put("chk_jud", datos.getBoolean(13));
                        obj.put("not_jud", datos.getString(14));
                        obj.put("chk_com", datos.getBoolean(15));
                        obj.put("not_com", datos.getString(16));
                        obj.put("chk_equ", datos.getBoolean(17));
                        obj.put("not_equ", datos.getString(18));
                        obj.put("chk_lab", datos.getBoolean(19));
                        obj.put("not_lab", datos.getString(20));
                        obj.put("tot_cal", datos.getInt(21));
                        obj.put("not_", datos.getString(22));
                    }
                    datos.close();
                    conn.close();
                    return obj;
             
        }catch (SQLException e) {
            System.out.println("error SQLException en ObtenerPuntaje");
                    System.out.println(e.getMessage());
        }catch (Exception e){
                    System.out.println("error Exception en ObtenerPuntaje");
                    System.out.println(e.getMessage());
        }finally{
                    if(!conn.isClosed()){
                        conn.close();
                    }
                }
        return null;
    }

    
}
