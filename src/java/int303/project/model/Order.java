/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    public static boolean addAmount(long prodId, int amount, Staff s) {
        int x = 0;
        boolean addOrderSuccess = false;
        // add amount in DB
        // save ข้อมูลใน order ด้วย  
        try {
            Product p = Product.getProduct(prodId);
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PRODUCTS SET amount = ? "
                    + " WHERE prod_id = ? ";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, p.getAmount() + amount);
            pstm.setLong(2, prodId);

            x = pstm.executeUpdate();
            addOrderSuccess = Order.addOrder(p, s, "IN", amount);

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return x > 0 && addOrderSuccess;
    }

    public static boolean reduceAmount(long prodId, int amount, Staff s) {
        int x = 0;
        boolean addOrderSuccess = false;
        // reduce amount in DB
        // save ข้อมูลใน order ด้วย  
        try {
            Product p = Product.getProduct(prodId);
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PRODUCTS SET amount = ?"
                    + " WHERE prod_id = ? ";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, p.getAmount() - amount);
            pstm.setLong(2, prodId);

            x = pstm.executeUpdate();
            addOrderSuccess = Order.addOrder(p, s, "OUT", amount);

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return x > 0 && addOrderSuccess;

    }

    public static boolean addNewProduct(Product p, Staff s) throws SQLException {
//        int x = 0;
        boolean addProductSuccess = p.addNewProduct();
        boolean addOrderSuccess = addOrder(p, s, "IN", p.getAmount());

//        Connection con = ConnectionBuilder.getConnection();
//        String sql = "INSERT INTO ORDERS(staff_id,ordertype,date_order,prod_id,amount) "
//                     + " VALUES(?,?,?,?,?)";
//        PreparedStatement pstm = con.prepareStatement(sql);
//        pstm.setInt(1, s.getStaffId());
//        pstm.setString(2, "IN");
//        pstm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
//        pstm.setLong(4, p.getProd_id());
//        pstm.setInt(5, p.getAmount());        
//        x = pstm.executeUpdate();              
        return addOrderSuccess && addProductSuccess;
    }

    public static boolean addOrder(Product p, Staff s, String str, int amount) throws SQLException {
        int x = 0;
        String inOrOut = "";

        if (str.equalsIgnoreCase("IN")) {
            inOrOut = "IN";
        } else if (str.equalsIgnoreCase("OUT")) {
            inOrOut = "OUT";
        }

        Connection con = ConnectionBuilder.getConnection();
        String sql = "INSERT INTO ORDERS(staff_id,ordertype,date_order,prod_id,amount) "
                + " VALUES(?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, s.getStaffId());
        pstm.setString(2, inOrOut);
        pstm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
        pstm.setLong(4, p.getProd_id());
        pstm.setInt(5, amount);

        x = pstm.executeUpdate();

        return x > 0;
    }

    public static Product statBestSeller(int companyId) {
        Product prod = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return prod;
    }

    //----------- SUM(amount)  // order by SUM(amount) DESC;
    // WHERE order_type = 'IN'
    // WHERE order_type = 'OUT'
    public static List<Product> statSellerByMonth(int companyId) {
        List<Product> products = null;
        Product prod = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return products;
    }

    public static List<Product> statSellerByYear(int companyId) {
        List<Product> products = null;
        Product prod = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return products;
    }

}
