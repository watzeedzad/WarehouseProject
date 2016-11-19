/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Praewhubb
 */
public class Order {
    private int orderId;
    private Staff staff;
    private String orderType; 
    private java.util.Date orderDate;        
       
    //sell
    //buy
    //updateOrder Servlet
    //ดูยอดขายเดือน
    //ดูยอดขายปี
    //ดูสินค้าขายดีแต่ละเดือน
    //ดูสินค้าขายดีแต่ละปี
    

    public Order() {       
           
    }   
        
//    public static boolean addAmount(long prodId,int amount){
//        int x=0;
//        
//        return x>0;
//    }
    
//    public static boolean reduceAmount(long prodId,int amount){
//        int x=0;
//        
//        return x>0;
//    }
    
    public static boolean addAmount(long prodId,int amount){
        int x=0;
        // reduce amount in DB
        // save ข้อมูลใน order ด้วย
        
        
        return x>0;
    }
    
    public static boolean reduceAmount(long prodId,int amount){
        int x=0;
        // add amount in DB
        // save ข้อมูลใน order ด้วย
        
        
        
        return x>0;
    }
    
    public static boolean addNewProduct(Product p,Staff s) throws SQLException{
        int x = 0;
        boolean addProductSuccess = p.addNewProduct();
        
        Connection con = ConnectionBuilder.getConnection();
        String sql = "INSERT INTO ORDERS(staff_id,ordertype,date_order,prod_id,amount) VALUES(?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, s.getStaffId());
        pstm.setString(2, "IN");
        pstm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
        pstm.setLong(4, p.getProd_id());
        pstm.setInt(5, p.getAmount());
        
        x = pstm.executeUpdate();        
        
        return x>0 && addProductSuccess;
    }
    
    
    
}
