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
import java.util.List;

/**
 *
 * @author jiraw
 */
public class Product {
    private long prod_id;
    private String prod_name;
    private int amount;
    private double price;
    private String prod_type;
    private Company company;
    private Branch branch;
    
    public Product(){
        
    }
    
    public Product(String name,int amount,double price,String prodType,String companyName,int branchId) throws SQLException{
        this.prod_name = name;
        this.amount = amount;
        this.price = price;
        this.prod_type = prodType;
        this.company = Company.getCompany(companyName);
        this.branch = Branch.getBranch(branchId);
    }

    public long getProd_id() {
        return prod_id;
    }

    public void setProd_id(long prod_id) {
        this.prod_id = prod_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProd_type() {
        return prod_type;
    }

    public void setProd_type(String prod_type) {
        this.prod_type = prod_type;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }
    
    public static Product getProduct(long prodId) throws SQLException{
        Product prod = null;
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM Products WHERE prod_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setLong(1, prodId);
        
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            orm(prod,rs);
        }
        
        rs.close();
        pstm.close();
        con.close();
        
        return  prod;
    }
    
    private static void orm(Product prod , ResultSet rs) throws SQLException{
        prod.setProd_id(rs.getLong("prod_id"));
        prod.setProd_name(rs.getString("prod_name"));
        prod.setPrice(rs.getDouble("price"));
        prod.setAmount(rs.getInt("amount"));
        prod.setBranch(Branch.getBranch(rs.getInt("branch_id")));
        prod.setProd_type(rs.getString("prod_type"));
        prod.setCompany(Company.getCompany("prod_id"));        
    }
    
    public final static String SQL_SET_AMOUNT = "UPDATE Products SET amount = ? WHERE prod_id = ?";
    
    public boolean addAmount(int amount) throws SQLException{
        int x=0;
        
        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement pstm = con.prepareStatement(SQL_SET_AMOUNT);
        pstm.setInt(1, this.getAmount()+amount);
        pstm.setLong(2, this.getProd_id());
        
        x = pstm.executeUpdate();
        
        pstm.close();
        con.close();
               
        return x>0;
    }    
    
    public boolean reduceAmount(int amount) throws SQLException{
        int x=0;
        
        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement pstm = con.prepareStatement(SQL_SET_AMOUNT);
        pstm.setInt(1, this.getAmount()-amount);
        pstm.setLong(2, this.getProd_id());
        
        x = pstm.executeUpdate();
        
        pstm.close();
        con.close();
               
        return x>0;        
    }
    
    public void addNewProduct(){
        
        
    }
    
    public void editProduct(boolean update){
        
    }
    
    public List<Product> searchByName(){
        List<Product> products = null;
        
        return products;
    }
    
    public List<Product> searchById(){
        List<Product> products = null;
        
        return products;
    }
    
    public List<Product> productOutOfStock(){
        List<Product> products = null;
        
        return products;
    }
           
    
    
    
    
    
}
