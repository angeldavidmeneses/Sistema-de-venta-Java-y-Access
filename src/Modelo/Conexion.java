package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class Conexion {
    
    Connection SQLConexion;
    
    public Conexion (){
        String host = "localhost";
        String puerto = "3306";
        String nameBD = "sistemaventa";
        
        String usuario = "root";
        String pass = "";
        
        String driver = "com.mysql.cj.jdbc.Driver";
        
        String databaseURL = "jdbc:mysql://" + host + ":" + puerto + "/" + nameBD + "?useSSL=false";
        
        try {
            Class.forName(driver);
            SQLConexion = DriverManager.getConnection(databaseURL, usuario, pass);
            System.out.println("Base de datos conectada");
        } catch(Exception ex) {
            ex.printStackTrace(); // Agregamos una línea para imprimir la traza del error en consola
        }
    }

    public Connection getConectarBD() {
        return SQLConexion;
    }
}

