/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.StringTokenizer;
import sit.int303.demo.model.ConnectionBuilder;

/**
 *
 * @author Khaitong
 */
public class ImportPokemon {

    public static void main(String[] args) throws FileNotFoundException, SQLException {
        String sql = "insert into pokemon values(?, ?, ?, ?, ?, ?, ?, ?)";
        File f = new File("pokemon.csv");
        Scanner sc = new Scanner(f);
        Connection conn = ConnectionBuilder.getCon();
        PreparedStatement pstm = conn.prepareStatement(sql);
        while (sc.hasNextLine()) {
            String line = sc.nextLine();
            StringTokenizer stk = new StringTokenizer(line, ",");
            int col = 1;
            while (stk.hasMoreElements()) {
                switch (col) {
                    case 2:
                        pstm.setString(col, stk.nextElement().toString());
                        break;
                    default:
                        int value = Integer.parseInt(stk.nextElement().toString());
                        pstm.setInt(col, value);
                }
                col++;
                System.out.println();
            }
            pstm.addBatch();
            System.out.println("----------------------------------------");
        }
        pstm.executeBatch();
        pstm.close();
        conn.close();
        sc.close();

    }

}
