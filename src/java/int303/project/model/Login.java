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

    private static int id;
    private static String username;
    private static String password;
    private static boolean loginStatus;

    private static final String LOGIN_SQL = "SELECT * FROM ACCOUNTS WHERE USERNAME = ? AND PASSWORD = ?";
    private static final String FIND_USER_SQL = "SELECT * FROM ACCOUNTS WHERE USERNAME = ?";

    public static boolean login(String user, String pass) {
        try {
            Connection conn = ConnectionBuilder.getConn();
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
            //conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return loginStatus;
    }

    public static boolean isUserExist(String user) {
        boolean status = false;
        try {
            Connection conn = ConnectionBuilder.getConn();
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
            //conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return status;
    }

    public static int getUserId(String user) {
        try {
            Connection conn = ConnectionBuilder.getConn();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM STAFFS WHERE STAFF_ID = (SELECT STAFF_ID FROM ACCOUNTS WHERE USERNAME = ?)");
            pstm.setString(1, user);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("STAFF_ID");
            }
            //conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return id;
    }

    public static boolean addNewUser(String username, String password, int staffId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConn();
            PreparedStatement pstm = conn.prepareStatement("INSERT INTO `ACCOUNTS` (`ID`, `USERNAME`, `PASSWORD`, `STAFF_ID`) "
                    + "VALUES (NULL, ?, ?, ?);");
            pstm.setString(1, username);
            pstm.setString(2, password);
            pstm.setInt(3, staffId);
            x = pstm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return x > 0;
    }
}
