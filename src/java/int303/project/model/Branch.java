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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Praew
 */
public class Branch {

    private int branch_id;
    private String branch_name;
    private String location;
    private int max_amount;
    private int amountProduct;  
    private int remain;

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

    public int getMax_amount() {
        return max_amount;
    }

    public void setMax_amount(int max_amount) {
        this.max_amount = max_amount;
    }

    public int getAmountProduct() {
        return amountProduct;
    }

    public void setAmountProduct(int amountProduct) {
        this.amountProduct = amountProduct;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    
    public static Branch getBranch(int branchId) throws SQLException {
        Branch branch = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM BRANCH WHERE branch_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, branchId);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            branch = new Branch();
            orm(branch, rs);
        }
        con.close();
        pstm.close();
        rs.close();
        return branch;
    }

    public static List<Branch> getAllBranch() {
        List<Branch> branches = null;
        Branch branch = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM BRANCH ";
        PreparedStatement pstm;
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (branches == null) {
                    branches = new ArrayList<>();
                }
                branch = new Branch();
                orm(branch, rs);
                branches.add(branch);
            }
            con.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return branches;
    }

    public static void orm(Branch branch, ResultSet rs) throws SQLException {
        branch.setBranch_id(rs.getInt("branch_id"));
        branch.setBranch_name(rs.getString("branch_name"));
        branch.setLocation(rs.getString("location"));
    }

    public boolean addNewBranch() throws SQLException {
        int x = 0;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "INSERT INTO BRANCH(branch_name,location) VALUES(?,?)";
        PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.setString(1, this.getBranch_name());
        pstm.setString(2, this.getLocation());

        x = pstm.executeUpdate();
        ResultSet rs = pstm.getGeneratedKeys();
        rs.next();
        this.setBranch_id(rs.getInt(1));

        rs.close();
        pstm.close();
        con.close();

        return x > 0;
    }

    public static List<Branch> viewAmountPerBranch(int companyId) {
        List<Branch> branches = null;
        Branch b = null;
        
         Connection con = ConnectionBuilder.getConnection();
         String sql = "SELECT B.BRANCH_ID,B.BRANCH_NAME,B.location,B.MAX_AMOUNT,SUM(P.AMOUNT),remain "
                    + " FROM PRODUCTS P "
                    + " JOIN BRANCH B ON P.BRANCH_ID = B.BRANCH_ID "
                    + " WHERE P.COMPANY_ID = ? "
                    + " GROUP BY B.BRANCH_ID,B.BRANCH_NAME ORDER BY B.BRANCH_ID ";
         PreparedStatement pstm;
         
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (branches == null) {
                    branches = new ArrayList<>();
                }
                b = new Branch();
                b.setBranch_id(rs.getInt("B.BRANCH_ID"));
                b.setBranch_name(rs.getString("B.BRANCH_NAME"));
                b.setLocation(rs.getString("B.location"));
                b.setMax_amount(rs.getInt("B.MAX_AMOUNT"));
                b.setAmountProduct(rs.getInt("SUM(P.AMOUNT)"));
                b.setRemain(rs.getInt("remain"));
                branches.add(b);
            }
            pstm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return branches;
    }

    public static List<Branch> viewRemainPerBranch() {
        List<Branch> branches = null;
        Branch b = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT B.BRANCH_ID,B.BRANCH_NAME,B.location,B.MAX_AMOUNT, "
                + " B.MAX_AMOUNT-SUM(P.AMOUNT) AS \"REMAIN\" "
                + " FROM PRODUCTS P "
                + " JOIN BRANCH B ON P.BRANCH_ID = B.BRANCH_ID  "
                + " GROUP BY B.BRANCH_ID,B.BRANCH_NAME "
                + " ORDER BY B.BRANCH_ID ";
        PreparedStatement pstm;

        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (branches == null) {
                    branches = new ArrayList<>();
                }
                b = new Branch();
                int id = rs.getInt("B.BRANCH_ID");
                b.setBranch_id(id);
                b.setBranch_name(rs.getString("B.BRANCH_NAME"));
                b.setLocation(rs.getString("B.location"));
                b.setMax_amount(rs.getInt("B.MAX_AMOUNT"));
                int remain = rs.getInt(5);
                b.setAmountProduct(remain);
                branches.add(b);
                updateRemainInDB(id, remain);                
            }
            pstm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return branches;
    }
    
    public static boolean updateRemainInDB(int bId,int remain) throws SQLException{
        int x=0;
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "UPDATE BRANCH SET remain = ? "
                    + "  WHERE BRANCH_ID = ? ";
        PreparedStatement pstm = null;        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, remain);
            pstm.setInt(2, bId);            
            x = pstm.executeUpdate();            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        con.close();
        pstm.close();
        return x>0;
    }

    @Override
    public String toString() {
        return "Branch{" + "branch_id=" + branch_id + 
                "\n, branch_name=" + branch_name + 
                "\n, location=" + location + 
                "\n, max_amount=" + max_amount + 
                "\n, amountProduct=" + amountProduct + 
                "\n remain= "+remain+'}';
    }

}
