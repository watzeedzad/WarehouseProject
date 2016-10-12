/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.etc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author jiraw
 */
public class TestConnectionBuilderMySql {
    public static void main(String[] args) {
        try {
            Connection conn = ConnectionBuilderMySql.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT * FROM ACCOUNTS WHERE USERNAME = ? AND PASSWORD = ?");
            pstm.setString(1, "test");
            pstm.setString(2, "test");
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                System.out.println(rs.getInt("ID"));
                System.out.println(rs.getString("USERNAME"));
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (Exception ex) {
            System.err.println(ex);
        }
    }
}
