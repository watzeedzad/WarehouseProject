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

/**
 *
 * @author Praew
 */
public class Company {
    
    private int company_id;
    private String company_name;
    private String description;

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }   
    
    public static Company getCompany(String name) throws SQLException{
        Company comp = null;
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM COMPANIES WHERE company_name = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,name);
        
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            comp = new Company();
            orm(comp,rs);
        }
        
        rs.close();
        pstm.close();
        con.close();
        
        return comp;
    }
    
    private static void orm(Company company,ResultSet rs) throws SQLException{
        company.setCompany_id(rs.getInt("company_id"));
        company.setCompany_name(rs.getString("company_name"));
        company.setDescription(rs.getString("company_description"));
    }
    
    public static Company getCompany(int id) throws SQLException{
        Company comp = null;
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM COMPANIES WHERE company_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1,id);
        
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            comp = new Company();
            orm(comp,rs);
        }
        
        rs.close();
        pstm.close();
        con.close();
        
        return comp;
    }
    
    public boolean addNewCompany() throws SQLException{
       int x = 0;
       Connection con = ConnectionBuilder.getConnection();
       String sql = "INSERT INTO COMPANIES(company_name,company_description) VALUES(?,?)";
       PreparedStatement pstm = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);  
       
       pstm.setString(1, this.getCompany_name());
       pstm.setString(2, this.getDescription());              
       x = pstm.executeUpdate();
       
       ResultSet rs = pstm.getGeneratedKeys();
       rs.next();      
       this.setCompany_id(rs.getInt(1));      
       
       pstm.close();
       
       return x>0;
    }

    @Override
    public String toString() {
        return "Company{" + "company_id=" + company_id + ", company_name=" + company_name + ", description=" + description + '}';
    }
    
    
}
