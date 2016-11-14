/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiraw
 */
public class ConnectionBuilder {

    /*
    private static org.apache.derby.jdbc.ClientDataSource ds = null;
    
    public static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/warehouse", "int303", "int303");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionBuilder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionBuilder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://52.77.225.149:3306/int303_project?zeroDateTimeBehavior=convertToNull", "int303", "int303");
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        return conn;
    }
}
