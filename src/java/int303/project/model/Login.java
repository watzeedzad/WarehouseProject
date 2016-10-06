/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author jiraw
 */
public class Login {

    private static String username;
    private static String password;
    private static boolean loginStatus;

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    private static final String LOGIN_SQL = "SELECT * FROM ACCOUNT_STAFF WHERE USERNAME = ? AND PASSWORD = ?";
    
    public static boolean Login(String user, String pass) {
        try {
            Connection conn = ConnectionBuilder.getConnection();
            username = user;
            password = pass;
            PreparedStatement pstm = conn.prepareStatement(LOGIN_SQL);
            pstm.setString(1, username);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                loginStatus = true;
            } else {
                loginStatus = false;
            }
        } catch (Exception ex) {
            System.err.println(ex);
        }
        return loginStatus;
    }
}
