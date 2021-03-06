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

/**
 *
 * @author jiraw
 */
public class OrderInOut {

    private int prodId;
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
        this.staffName = rs.getString("staffName");
        this.orderType = rs.getString("ors.ORDERTYPE");
        this.dateOrder = rs.getDate("ors.DATE_ORDER");
        this.branchName = rs.getString("b.BRANCH_NAME");
        this.dateOrder = rs.getDate("DATE_ORDER");
        this.prodId = rs.getInt("prod.PROD_ID");
    }

    public OrderInOut() {

    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
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

    public static List<OrderInOut> orderById(String in, int searchInput, int companyId) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = ? AND prod.PROD_ID = ? AND prod.COMPANY_ID = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setInt(2, searchInput);
            pstm.setInt(3, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> orderByName(String in, String searchInput, int companyId) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = ? AND prod.PROD_NAME LIKE ? AND prod.COMPANY_ID = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, "%" + searchInput + "%");
            pstm.setInt(3, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> allOrderByName(String in, String out, String searchInput, int companyId) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE (ors.ORDERTYPE = ? OR ors.ORDERTYPE = ?) AND prod.PROD_NAME LIKE ? AND prod.COMPANY_ID = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, out);
            pstm.setString(3, "%" + searchInput + "%");
            pstm.setInt(4, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> allOrderById(String in, String out, int searchInput, int companyId) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE (ors.ORDERTYPE = ? OR ors.ORDERTYPE = ?) AND prod.PROD_ID = ? AND prod.COMPANY_ID = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, out);
            pstm.setInt(3, searchInput);
            pstm.setInt(4, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> orderMonth(String in, int companyId, String month) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = ? AND prod.COMPANY_ID = ? AND MONTH(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setInt(2, companyId);
            pstm.setString(3, month);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> orderYear(String in, int companyId, String year) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = ? AND prod.COMPANY_ID = ? AND YEAR(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setInt(2, companyId);
            pstm.setString(3, year);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> orderMonthYear(String in, int companyId, String month, String year) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE ors.ORDERTYPE = ? AND prod.COMPANY_ID = ? AND MONTH(ors.DATE_ORDER) = ? AND YEAR(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setInt(2, companyId);
            pstm.setString(3, month);
            pstm.setString(4, year);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> allOrderMonth(String in, String out, int companyId, String month) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE (ors.ORDERTYPE = ? OR ors.ORDERTYPE = ?) AND prod.COMPANY_ID = ? AND MONTH(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, out);
            pstm.setInt(3, companyId);
            pstm.setString(4, month);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> allOrderYear(String in, String out, int companyId, String year) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE (ors.ORDERTYPE = ? OR ors.ORDERTYPE = ?) AND prod.COMPANY_ID = ? AND YEAR(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, out);
            pstm.setInt(3, companyId);
            pstm.setString(4, year);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }

    public static List<OrderInOut> allOrderMonthYear(String in, String out, int companyId, String month, String year) {
        List<OrderInOut> order = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement("SELECT ors.ORDER_ID, prod.PROD_ID, prod.PROD_NAME, ors.AMOUNT, CONCAT(S.FIRSTNAME, \" \", S.LASTNAME) AS \"staffName\", ors.ORDERTYPE, ors.DATE_ORDER, b.BRANCH_NAME FROM ORDERS ors\n"
                    + "LEFT JOIN STAFFS S\n"
                    + "ON S.STAFF_ID = ors.STAFF_ID\n"
                    + "LEFT JOIN PRODUCTS prod\n"
                    + "ON prod.PROD_ID = ors.PROD_ID\n"
                    + "LEFT JOIN BRANCH b\n"
                    + "ON b.BRANCH_ID = prod.BRANCH_ID\n"
                    + "WHERE (ors.ORDERTYPE = ? OR ors.ORDERTYPE = ?) AND prod.COMPANY_ID = ? AND MONTH(ors.DATE_ORDER) = ? AND YEAR(ors.DATE_ORDER) = ?\n"
                    + "ORDER BY ORDER_ID DESC ;");
            pstm.setString(1, in);
            pstm.setString(2, out);
            pstm.setInt(3, companyId);
            pstm.setString(4, month);
            pstm.setString(5, year);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                OrderInOut ord = new OrderInOut(rs);
                if (order == null) {
                    order = new ArrayList<>();
                }
                order.add(ord);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return order;
    }
}
