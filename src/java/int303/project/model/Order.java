/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Date;
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
    private List<Product> prodInOrder;
    
    //sell
    //buy
    //updateOrder Servlet
    //ดูยอดขายเดือน
    //ดูยอดขายปี
    //ดูสินค้าขายดีแต่ละเดือน
    //ดูสินค้าขายดีแต่ละปี
    

    public Order() {
        prodInOrder = new ArrayList<>();
        orderDate = new java.util.Date();       
    }
      
//    public void addProduct(long prodId){
//        try {
//            Product prod = Product.getProduct(prodId);
//            prodInOrder.add(prod);
//        } catch (SQLException ex) {
//            System.out.println(ex);
//        }
//    }
    
        
    public static boolean addAmount(long prodId,int amount){
        int x=0;
        
        return x>0;
    }
    
    public static boolean sell(long prodId,int amount){
        int x=0;
        // reduce amount in DB
        // save ข้อมูลใน order ด้วย
        // เอาข้อมูลจากใน List มาวนloop save ลง DB
        
        return x>0;
    }
    
    public static boolean buy(long prodId,int amount){
        int x=0;
        // add amount in DB
        // save ข้อมูลใน order ด้วย
        // เอาข้อมูลจากใน List มาวนloop save ลง DB
        
        
        return x>0;
    }
    
    
    
}
