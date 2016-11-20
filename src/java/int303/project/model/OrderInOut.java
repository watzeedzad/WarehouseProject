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
import java.util.List;

/**
 *
 * @author jiraw
 */
public class OrderInOut {

    private String prodName;
    private int prodAmount;
    private int orderId;
    private String staffName;
    private String orderType;
    private Date dateOrder;
    private String branchName;

    public OrderInOut(ResultSet rs) throws SQLException {
        this.prodName = rs.getString("prod.PROD_NAME");
        this.prodAmount = rs.getInt("ors.AMOUNT");
        this.orderId = rs.getInt("ors.ORDER_ID");
        this.staffName = rs.getString("ors.ORDER_ID");
        
    }
    
    public OrderInOut(){
        
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getProdAmount() {
        return prodAmount;
    }

    public void setProdAmount(int prodAmount) {
        this.prodAmount = prodAmount;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public static List<Order> orderIn(String in) {
        List<Order> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT prod.PROD_NAME, ors.AMOUNT, ors.ORDER_ID, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME), ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = 'IN'\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }
}
