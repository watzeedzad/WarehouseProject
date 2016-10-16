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
    private int branch_id;
    private String branch_name;
    private String location;

    public int getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(int branch_id) {
        this.branch_id = branch_id;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
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
        String sql = "SELECT * FROM branch WHERE branch_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, branchId);
        
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            orm(branch,rs);
        }
        
        
        return branch;
    }
    
    public static void orm(Branch branch,ResultSet rs) throws SQLException{
        branch.setBranch_id(rs.getInt("branch_id"));
        branch.setBranch_name(rs.getString("branch_name"));
        branch.setLocation(rs.getString("location"));
    }
}
