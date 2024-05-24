package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import org.apache.commons.dbcp2.BasicDataSource;
 
public class Conexion {
    
    private BasicDataSource dataSource;
    
    public Conexion (){
        String host = "localhost";
        String puerto = "3306";
        String nameBD = "sistemaventa";
        
        String usuario = "root";
        String pass = "";
        
        String driver = "com.mysql.cj.jdbc.Driver";
        
        String databaseURL = "jdbc:mysql://" + host + ":" + puerto + "/" + nameBD + "?useSSL=false";
        
        try {
            dataSource = new BasicDataSource();
            dataSource.setDriverClassName(driver);
            dataSource.setUrl(databaseURL);
            dataSource.setUsername(usuario);
            dataSource.setPassword(pass);
        } catch(Exception ex) {
            ex.printStackTrace(); // Agregamos una línea para imprimir la traza del error en consola
        }
    }

    public Connection getConectarBD() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

