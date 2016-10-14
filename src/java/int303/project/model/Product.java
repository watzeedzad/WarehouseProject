/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.SQLException;

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
    
    
    
}
