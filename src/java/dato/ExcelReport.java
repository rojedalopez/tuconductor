package dato;

import bean.usuario;
import static dato.Aplicacion.conexion;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HeaderFooter;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Footer;
import org.apache.poi.ss.usermodel.Header;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelReport {

 static CellStyle cs = null;
 static XSSFCellStyle csBold = null;
 static XSSFCellStyle csNoBold = null;
 static XSSFCellStyle csNoBoldNum = null;
 
 public static void createExcel(String cod, String ruta) {

  try{

   Workbook wb = new XSSFWorkbook();
   Sheet datos_personales = wb.createSheet("DATOS PERSONALES");
   Sheet exp_laboral = wb.createSheet("EXP LABORAL");
   

   //Setup some styles that we need for the Cells
   setCellStyles(wb);

   //Get current Date and Time
   Date date = new Date(System.currentTimeMillis());
   DateFormat df = new SimpleDateFormat("MM/dd/yy HH:mm:ss");

   //Set Column Widths
   datos_personales.setColumnWidth(1, 6000); 
   datos_personales.setColumnWidth(2, 12000);
   
   //Set Column Widths
   exp_laboral.setColumnWidth(1, 5000); 
   exp_laboral.setColumnWidth(2, 10000);
   
   //Setup the Page margins - Left, Right, Top and Bottom
   datos_personales.setMargin(Sheet.LeftMargin, 0.25);
   datos_personales.setMargin(Sheet.RightMargin, 0.25);
   datos_personales.setMargin(Sheet.TopMargin, 0.75);
   datos_personales.setMargin(Sheet.BottomMargin, 0.75);

   //Setup the Page margins - Left, Right, Top and Bottom
   exp_laboral.setMargin(Sheet.LeftMargin, 0.25);
   exp_laboral.setMargin(Sheet.RightMargin, 0.25);
   exp_laboral.setMargin(Sheet.TopMargin, 0.75);
   exp_laboral.setMargin(Sheet.BottomMargin, 0.75);

   //Setup the Header and Footer Margins
   datos_personales.setMargin(Sheet.HeaderMargin, 0.25);
   datos_personales.setMargin(Sheet.FooterMargin, 0.25);
   
   //Setup the Header and Footer Margins
   exp_laboral.setMargin(Sheet.HeaderMargin, 0.25);
   exp_laboral.setMargin(Sheet.FooterMargin, 0.25);
   
   //If you are using HSSFWorkbook() instead of XSSFWorkbook()
   //HSSFPrintSetup ps = (HSSFPrintSetup) sheet.getPrintSetup();
   //ps.setHeaderMargin((double) .25);
   //ps.setFooterMargin((double) .25);

   //Set Header Information 
   Header header = datos_personales.getHeader();
   header.setLeft("*** ORIGINAL COPY ***");
   header.setCenter(HSSFHeader.font("Arial", "Bold") +
     HSSFHeader.fontSize((short) 14) + "SAMPLE ORDER");
   header.setRight(df.format(date));

   //Set Footer Information with Page Numbers
   Footer footer = datos_personales.getFooter();
   footer.setRight( "Page " + HeaderFooter.page() + " of " + 
     HeaderFooter.numPages() );


   int rowIndexDP = 1;
   rowIndexDP = sheetDatosPersonales(datos_personales, rowIndexDP, cod);
   
   int rowIndexExp = 1;
   rowIndexDP = sheetExperienciaLaboral(exp_laboral, rowIndexExp, cod);

   //Write the Excel file
   FileOutputStream fileOut = null;
   fileOut = new FileOutputStream(ruta + "/excel/"+cod+".xlsx");
   wb.write(fileOut);
   fileOut.close();

  }
  catch (Exception e) {
   System.out.println(e);
  }

 }

 private static void setCellStyles(Workbook wb) {

  //font size 10
  Font f = wb.createFont();
  f.setFontHeightInPoints((short) 10);

  //Simple style 
  cs = wb.createCellStyle();
  cs.setFont(f);

  //Bold Fond
  Font bold = wb.createFont();
  bold.setBoldweight(Font.BOLDWEIGHT_BOLD);
  bold.setFontHeightInPoints((short) 10);

  //Bold style 
  csBold = (XSSFCellStyle) wb.createCellStyle();
  csBold.setBorderTop(CellStyle.BORDER_THIN);
  csBold.setBorderRight(CellStyle.BORDER_THIN);
  csBold.setBorderLeft(CellStyle.BORDER_THIN);
  csBold.setBorderBottom(CellStyle.BORDER_THIN);
  //217, 234, 211
  byte[] rgb = new byte[3];
  rgb[0] = (byte) 217; // red
  rgb[1] = (byte) 234; // green
  rgb[2] = (byte) 211; // blue
  XSSFColor myColor = new XSSFColor(rgb); // #f2dcdb
  csBold.setFillForegroundColor(myColor);
  csBold.setFillPattern(CellStyle.SOLID_FOREGROUND);
  csBold.setFont(bold);

  csNoBold = (XSSFCellStyle) wb.createCellStyle();
  csNoBold.setBorderTop(CellStyle.BORDER_THIN);
  csNoBold.setBorderRight(CellStyle.BORDER_THIN);
  csNoBold.setBorderLeft(CellStyle.BORDER_THIN);
  csNoBold.setBorderBottom(CellStyle.BORDER_THIN);
  csNoBold.setFont(f);
  
  csNoBoldNum = (XSSFCellStyle) wb.createCellStyle();
  csNoBoldNum.setBorderTop(CellStyle.BORDER_THIN);
  csNoBoldNum.setBorderRight(CellStyle.BORDER_THIN);
  csNoBoldNum.setBorderLeft(CellStyle.BORDER_THIN);
  csNoBoldNum.setBorderBottom(CellStyle.BORDER_THIN);
  csNoBoldNum.setAlignment(HorizontalAlignment.LEFT);
  csNoBoldNum.setFont(f);

 }

 private static int sheetDatosPersonales(Sheet sheet, int index, String cod) throws SQLException{
    int rowIndex = index;
    Row row = null;
    Cell c = null;
  
    usuario u = null;
    Connection conn=null;
    PreparedStatement insertar=null;
    Statement stm=null;
    ResultSet datos=null;

        try{
            conn=conexion();
            String instruccion="SELECT nbr_empleado, apl_empleado, tpo_doc_empleado, doc_empleado, gnr_empleado, dsc_estcivil,\n" +
            "dir_empleado, CONCAT(cui_empleado,', ',nbr_dpt_empleado,', ',pais_empleado) AS loc, tel_empleado,\n" +
            "mvl_empleado, eml_usuario, nto_empleado, CONCAT(CAST(ROUND(exp_empleado) AS CHAR),' Años') as Exp, pje_empleado\n" +
            "FROM tblEmpleado AS ep INNER JOIN tblEstCivil ec ON sta_civ_empleado = id_estcivil\n" +
            "WHERE cod_empleado = ?;";

            insertar=conn.prepareStatement(instruccion);
            insertar.setString(1, cod);
            datos=insertar.executeQuery();
            if (datos.next()) {
                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Nombres:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(1));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Apellidos:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(2));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Tipo Doc:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(3));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Número Doc:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(4));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Genero:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(5));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Estado Civil:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(6));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Dirección:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(7));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Ciudad/Dpto/Pais:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(8));
                c.setCellStyle(csNoBold);


                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Telefono:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(9));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Celular:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(10));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Email:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(11));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Fecha Nacimiento:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(12));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Experiencia:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(13));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Puntaje TC:");
                c.setCellStyle(csBold);
                c = row.createCell( 2);
                c.setCellValue(datos.getString(14));
                c.setCellStyle(csNoBold);

                return rowIndex;

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

        return rowIndex;
}

 private static int sheetExperienciaLaboral(Sheet sheet, int index, String cod) throws SQLException{
    int rowIndex = index;
    Row row = null;
    Cell c = null;
  
    usuario u = null;
    Connection conn=null;
    PreparedStatement insertar=null;
    Statement stm=null;
    ResultSet datos=null;

        try{
            conn=conexion();
            String instruccion="SELECT epr_explaboral, crg_explaboral, slr_explaboral, bon_explaboral, spv_explaboral, tel_spv_explaboral,\n" +
                                "dir_explaboral, CONCAT(cui_explaboral,', ',nbr_dpt_explaboral,', ',pais_explaboral), \n" +
                                "CASE WHEN aun_explaboral = 1 THEN 'Si' ELSE 'No' END, rzn_fin_explaboral, \n" +
                                "CONCAT(TextoExperiencia(mes_ini_explaboral, anio_ini_explaboral),' - ',TextoExperiencia(mes_fin_explaboral,anio_fin_explaboral)),\n" +
                                "TiempoExperiencia(mes_explaboral, anio_explaboral, mes_ini_explaboral, anio_ini_explaboral,mes_fin_explaboral,anio_fin_explaboral)\n" +
                                "FROM tblExpLaboral WHERE cod_empleado = ?;";

            insertar=conn.prepareStatement(instruccion);
            insertar.setString(1, cod);
            datos=insertar.executeQuery();
            while (datos.next()) {
                System.out.println(datos.getString(1));
                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Empresa:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(1));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Dirección:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(7));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Ciudad/Dpto/Pais:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(8));
                c.setCellStyle(csNoBold);
                
                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Cargo:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(2));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Salario:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getFloat(3));
                c.setCellStyle(csNoBoldNum);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Bonos:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getFloat(4));
                c.setCellStyle(csNoBoldNum);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Supervisor:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(5));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Telefono Sup:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(6));
                c.setCellStyle(csNoBold);

                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Aún labora?:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(9));
                c.setCellStyle(csNoBold);

                if(datos.getString(9).equals("No")){
                    rowIndex++;
                    row = sheet.createRow(rowIndex);
                    c = row.createCell(1);
                    c.setCellValue("Razon Retiro:");
                    c.setCellStyle(csBold);
                    c = row.createCell(2);
                    c.setCellValue(datos.getString(10));
                    c.setCellStyle(csNoBold);

                }
                
                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Lapso laboral:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(11));
                c.setCellStyle(csNoBold);
                    
                rowIndex++;
                row = sheet.createRow(rowIndex);
                c = row.createCell(1);
                c.setCellValue("Tiempo Experiencia:");
                c.setCellStyle(csBold);
                c = row.createCell(2);
                c.setCellValue(datos.getString(12));
                c.setCellStyle(csNoBold);

                rowIndex++;
                rowIndex++;

            }
            
            datos.close();
            conn.close();
            
            return rowIndex;
            
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

        return rowIndex;
}
}