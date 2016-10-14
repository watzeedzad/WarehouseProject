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
 * @author Praew
 */
public class Branch {
    private int warehouse_id;
    private String warehouse_name;
    private String location;

    public int getWarehouse_id() {
        return warehouse_id;
    }

    public void setWarehouse_id(int warehouse_id) {
        this.warehouse_id = warehouse_id;
    }

    public String getWarehouse_name() {
        return warehouse_name;
    }

    public void setWarehouse_name(String warehouse_name) {
        this.warehouse_name = warehouse_name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
      
    public static Branch getBranch(int branchId) throws SQLException{
        Branch branch = null;
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM branch WHERE warehouse_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, branchId);
        
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            orm(branch,rs);
        }
        
        
        return branch;
    }
    
    public static void orm(Branch branch,ResultSet rs) throws SQLException{
        branch.setWarehouse_id(rs.getInt("waregouse_id"));
        branch.setWarehouse_name(rs.getString("warehouse_name"));
        branch.setLocation(rs.getString("location"));
    }
}
