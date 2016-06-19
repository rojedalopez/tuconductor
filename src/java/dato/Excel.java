/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato;

import java.io.File;
import java.io.FileOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author ROJEDALOPEZ
 */
public class Excel {
    public static String Exportar(File archivo, String[][] Matriz){
        Workbook wb;
        CellStyle style = null;
        
        
        String respuesta="No se realizo con exito la exportación.";
        int numFila=Matriz.length, numColumna=Matriz[0].length;
        wb = new XSSFWorkbook();
        style = wb.createCellStyle();
        style.setWrapText(true);
        
        Sheet hoja = wb.createSheet("Pruebita");
        
        try {
            for (int i = 0; i < numFila; i++) {
                Row fila = hoja.createRow(i);
                for (int j = 0; j < numColumna; j++) {
                    Cell celda = fila.createCell(j);
                    if(i==0){
                        celda.setCellValue(String.valueOf(Matriz[0][j]));
                        celda.setCellStyle(style);
                    }else{
                        celda.setCellValue(String.valueOf(Matriz[i][j]));
                        celda.setCellStyle(style);
                    }
                    wb.write(new FileOutputStream(archivo));
                }
            }
            respuesta="Exportación exitosa.";
        } catch (Exception e) {
        }
        return respuesta;
    }
    
    public static void main(String[] args) {
        String[][] Matriz = new String[5][2];
        
        Matriz[0][0] = "Atributo";
        Matriz[0][1] = "Valor";
        Matriz[1][0] = "Nombre";
        Matriz[1][1] = "Roberto Carlos";
        Matriz[2][0] = "Apellido";
        Matriz[2][1] = "Ojeda Lopez";
        Matriz[3][0] = "Celular";
        Matriz[3][1] = "3008300794";
        Matriz[4][0] = "Direccion";
        Matriz[4][1] = "Calle 15 # 16 - 50";
        
        File f = new File("C:\\Users\\ROJEDALOPEZ\\Dropbox\\git\\tuconductor\\web\\excel\\nuevo.xlsx");
        
        System.out.println(Exportar(f, Matriz));
        
    }
    
}
