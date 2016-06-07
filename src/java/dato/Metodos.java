/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dato;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;


/**
 *
 * @author SISTEMAS
 */
public class Metodos {
        
    static SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    static SimpleDateFormat formateador_ = new SimpleDateFormat("yyyy/MM/dd hh:mm a");
        
    //CANCULA CON EL ALGORITMO SHA256
    public static String sha256(String usuario, String key) throws InvalidKeyException{
    	String sha="";
    	String secretAccessKey = key;
        String data = usuario;
        byte[] secretKey = secretAccessKey.getBytes();
        SecretKeySpec signingKey = new SecretKeySpec(secretKey, "HmacSHA512");
        Mac mac=null;
		try {
			mac = Mac.getInstance("HmacSHA512");
			mac.init(signingKey);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        byte[] bytes = data.getBytes();
        byte[] rawHmac = mac.doFinal(bytes);
        sha=Base64.encode(rawHmac);
    	return sha;
    }
    
    //GENERA UN NUMERO RAnDOM DE TAMAÑO X
    public static String RandomString(int tamano, boolean especiales){
        String dCase = "abcdefghijklmnopqrstuvwxyz";
        String uCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String sChar = "!@#$%^&*";
        String intChar = "0123456789";
        Random r = new Random();
        String pass = "";

        while (pass.length () != tamano){
            int rPick = r.nextInt(4);
            if (rPick == 0){
                int spot = r.nextInt(25);
                pass += dCase.charAt(spot);
            } else if (rPick == 1) {
                int spot = r.nextInt (25);
                pass += uCase.charAt(spot);
            } else if (rPick == 2 && especiales) {
                int spot = r.nextInt (7);
                pass += sChar.charAt(spot);
            } else if (rPick == 3){
                int spot = r.nextInt (9);
                pass += intChar.charAt (spot);
            }
        }
        return pass;
    }
    
    public static String remove(String input) {
        String original = "áàäéèëíìïóòöúùuñÁÀÄÉÈËÍÌÏÓÒÖÚÙÜÑçÇ,.-_:;/?¡¿!&*+";
        String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC              ";
        String output = input;
        for (int i=0; i<original.length(); i++) {
            output = output.replace(original.charAt(i), ascii.charAt(i));
        }
        return output;
    }
    
    public static int ObtenerMes(){
        Calendar cal = Calendar.getInstance();
        int thisMonth = cal.get(Calendar.MONTH) + 1;
        return thisMonth;
    }
    
    public static String calcular(String fecha_){

        Date fecha = null;

        try {
                fecha = formateador.parse(fecha_);
        } catch (ParseException e) {
                e.printStackTrace();
        }
                
        long[] vector = new long[4];

        final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000; //Milisegundos al día
        final long MILLSECS_PER_HOUR = 60 * 60 * 1000; //Milisegundos a la hora
        final long MILLSECS_PER_MINUTE = 60 * 1000; //Milisegundos al minuto
        final long MILLSECS_PER_SECOND = 1000; //Milisegundos al minuto
        Date hoy = new Date(); //Fecha de hoy

        long diferencia = (hoy.getTime() - fecha.getTime());
        long dias = diferencia / MILLSECS_PER_DAY;
        long horas = (diferencia % MILLSECS_PER_DAY) / MILLSECS_PER_HOUR;
        long minutos = (diferencia % MILLSECS_PER_HOUR) / MILLSECS_PER_MINUTE;
        long segundos = (diferencia % MILLSECS_PER_MINUTE) / MILLSECS_PER_SECOND;

        vector[3] = segundos;
        vector[2] = minutos;
        vector[1] = horas;
        vector[0] = dias;
        
        String desde = "";
        String[] medidas = {" dias", " horas", " minutos", " segundos"};
        for(int i=0; i<vector.length; i++){
            if(vector[i]!=0){
                    desde += vector[i] + "" + medidas[i];
                    break;
            }
        }

        return desde;
    }

    
}
