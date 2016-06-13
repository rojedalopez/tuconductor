/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato.Get;

import static dato.Aplicacion.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.simple.JSONObject;

/**
 *
 * @author SISTEMAS
 */
public class Objetos {
    public static String TituloOferta(int id) throws SQLException{
        Connection conn=null;
        PreparedStatement insertar=null;
        Statement stm=null;
        ResultSet datos=null;
             
        try{
                    conn=conexion();
                    String instruccion="";
                     
                    instruccion =   "SELECT CONCAT(tit_oferta,', publicada el ', DATE_FORMAT(fch_oferta, '%Y-%m-%e'), ' a las ',  DATE_FORMAT(fch_oferta, '%h:%i %p')) AS texto, " +
                                    "eml_usuario FROM tblOferta as o INNER JOIN tblEmpresa as a ON o.nit_empresa = a.nit_empresa WHERE id_oferta = ?;";
                     
                    insertar=conn.prepareStatement(instruccion);
                    insertar.setInt(1, id);
                    datos=insertar.executeQuery();
                    if (datos.next()) {
                        return datos.getString(1)+"|"+datos.getString(2);
                    }
                    datos.close();
                    conn.close();
             
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
