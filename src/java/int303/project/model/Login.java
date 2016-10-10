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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiraw
 */
public class Login {

    private static int id;
    private static String username;
    private static String password;
    private static boolean loginStatus;

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    private static final String LOGIN_SQL = "SELECT * FROM ACCOUNTS WHERE USERNAME = ? AND PASSWORD = ?";
    private static final String FIND_USER_SQL = "SELECT * FROM ACCOUNTS WHERE USERNAME = ?";

    public static boolean login(String user, String pass) {
        try {
            Connection conn = ConnectionBuilderMySql.getConnection();
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
            pstm.close();
            rs.close();
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        return loginStatus;
    }

    public static boolean isUserExit(String user) {
        boolean status = false;
        try {
            Connection conn = ConnectionBuilderMySql.getConnection();
            PreparedStatement pstm = conn.prepareStatement(FIND_USER_SQL);
            pstm.setString(1, user);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                status = true;
            } else {
                status = false;
            }
            pstm.close();
            rs.close();
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        return status;
    }
}
