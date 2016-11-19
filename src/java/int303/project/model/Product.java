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
 * @author jiraw
 */
public class Product {

    private long prod_id;
    private String prod_name;
    private int amount;
    private double price;
    private String prod_type;
    private Branch branch;
    private Company company;
    private int amountAlert; // จำนวนสินค้าที่ต้องการจะให้ alert

    //method getAlertProduct()
    //method delete Product()
    public Product() {

    }

    public Product(String name, int amount, double price, String prodType, String companyName, int branchId) throws SQLException {
        this.prod_name = name;
        this.amount = amount;
        this.price = price;
        this.prod_type = prodType;
        this.company = Company.getCompany(companyName);
        this.branch = Branch.getBranch(branchId);
    }

    public Product(String name, int amount, double price, String prodType, int companyId, int branchId) {
        this.prod_name = name;
        this.amount = amount;
        this.price = price;
        this.prod_type = prodType;
        try {
            this.company = Company.getCompany(companyId);
            this.branch = Branch.getBranch(branchId);
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public static Product getProduct(long prodId) throws SQLException {
        Product prod = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS WHERE prod_id = ?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setLong(1, prodId);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            prod = new Product();
            orm(prod, rs);
        }

        rs.close();
        pstm.close();
        con.close();

        return prod;
    }

    private static void orm(Product prod, ResultSet rs) throws SQLException {
        prod.setProd_id(rs.getLong("prod_id"));
        prod.setProd_name(rs.getString("prod_name"));
        prod.setPrice(rs.getDouble("price"));
        prod.setAmount(rs.getInt("amount"));
        prod.setBranch(Branch.getBranch(rs.getInt("branch_id")));
        prod.setProd_type(rs.getString("prod_type"));
        prod.setCompany(Company.getCompany(rs.getInt("company_id")));
    }

    public final static String SQL_SET_AMOUNT = "UPDATE PRODUCTS SET amount = ? WHERE prod_id = ?";

    public boolean addAmount(int amount) throws SQLException {
        int x = 0;

        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement pstm = con.prepareStatement(SQL_SET_AMOUNT);
        pstm.setInt(1, this.getAmount() + amount);
        pstm.setLong(2, this.getProd_id());

        this.setAmount(this.getAmount() + amount);
        x = pstm.executeUpdate();

        pstm.close();
        con.close();

        return x > 0;
    }

    public boolean reduceAmount(int amount) throws SQLException {
        int x = 0;

        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement pstm = con.prepareStatement(SQL_SET_AMOUNT);
        pstm.setInt(1, this.getAmount() - amount);
        pstm.setLong(2, this.getProd_id());

        x = pstm.executeUpdate();
        this.setAmount(this.getAmount() - amount);
        pstm.close();
        con.close();

        return x > 0;
    }

    public boolean addNewProduct() throws SQLException {
        int x = 0;
        Connection con = ConnectionBuilder.getConnection();
        String sql = "INSERT INTO PRODUCTS(prod_name,price,amount,branch_id,prod_type,company_id) VALUES(?,?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        pstm.setString(1, this.getProd_name());
        pstm.setDouble(2, this.getPrice());
        pstm.setInt(3, this.getAmount());
        pstm.setInt(4, this.getBranch().getBranch_id());
        pstm.setString(5, this.getProd_type());
        pstm.setInt(6, this.getCompany().getCompany_id());

        x = pstm.executeUpdate();
        ResultSet rs = pstm.getGeneratedKeys();

        rs.next();
        long id = rs.getLong(1);
        this.setProd_id(id);

        boolean saveStatusSuccess = addToProductStatus(con, id);

        pstm.close();
        con.close();

        return x > 0 && saveStatusSuccess;
    }

    public static boolean addToProductStatus(Connection con, long prodId) {
        int x = 0;
        String sql = "INSERT INTO PRODUCT_STATUS(prod_id,cancle_status,delete)"
                + "VALUES(?,false,false)"; // false = ยังผลิตอยู่
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setLong(1, prodId);
            x = pstm.executeUpdate();

            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x > 0;
    }

//    public static boolean isDeleteProduct(long prodId){
//        boolean delete = false;
//        
//        Connection con = ConnectionBuilder.getConnection();        
//        String sql = "SELECT delete FROM CANCLE_STATUS "
//                     + " WHERE prodId = ? ";        
//        try {
//            PreparedStatement pstm = con.prepareStatement(sql);
//            pstm.setLong(1, prodId);
//            
//            ResultSet rs = pstm.executeQuery();
//            if(rs.next()){
//                delete = rs.getBoolean("delete");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return delete;
//    }
    public static boolean isExistProduct(int companyId, long prodId) {
        boolean exist = false;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id = S.prod_id  "
                + " WHERE P.prod_id = ? "
                + " AND P.company_id = ? "
                + " AND S.delete != true ";
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setLong(1, prodId);
            pstm.setLong(2, companyId);

            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                exist = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }

        return exist;
    }

    public boolean editProduct() throws SQLException {
        int x = 0;
        Connection con = ConnectionBuilder.getConnection();
        String sql = "UPDATE PRODUCTS SET prod_name=?,price=?,amount=?,branch_id=?,prod_type=?,company_id=? WHERE prod_id=?";
        PreparedStatement pstm = con.prepareStatement(sql);

        pstm.setString(1, this.getProd_name());
        pstm.setDouble(2, this.getPrice());
        pstm.setInt(3, this.getAmount());
        pstm.setInt(4, this.getBranch().getBranch_id());
        pstm.setString(5, this.getProd_type());
        pstm.setInt(6, this.getCompany().getCompany_id());
        pstm.setLong(7, this.getProd_id());

        x = pstm.executeUpdate();

        pstm.close();
        con.close();

        return x > 0;
    }

//    public static List<Product> searchByName(String prodName) throws SQLException{
//        List<Product> products = null;
//        Product prod = null;
//        
//        Connection con = ConnectionBuilder.getConnection();
//        String sql = "SELECT * FROM PRODUCTS WHERE lower(prod_name) LIKE ? ORDER BY prod_id";
//        PreparedStatement pstm = con.prepareStatement(sql);
//        pstm.setString(1, prodName.toLowerCase()+"%");
//        
//        ResultSet rs = pstm.executeQuery();
//        while(rs.next()){
//            prod = new Product();
//            orm(prod, rs);
//            if(products == null){
//                products = new ArrayList();
//            }            
//            products.add(prod);
//        }
//        
//        rs.close();
//        pstm.close();
//        con.close();
//        
//        return products;
//    }
    public static List<Product> searchByName(String prodName, int companyId) throws SQLException {
        List<Product> products = null;
        Product prod = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id =  S.prod_id "
                + " WHERE lower(P.prod_name) LIKE ? "
                + " AND P.company_id = ? "
                + " AND S.cancle_status = false  "
                + " AND S.delete = false  "
                + " ORDER BY P.prod_id";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, "%" + prodName.toLowerCase() + "%");
        pstm.setInt(2, companyId);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            prod = new Product();
            orm(prod, rs);
            if (products == null) {
                products = new ArrayList();
            }
            products.add(prod);
        }

        rs.close();
        pstm.close();
        con.close();

        return products;
    }

    public static Product searchById(long prodId, int companyId) throws SQLException {
        Product prod = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id =  S.prod_id "
                + " WHERE P.prod_id = ? "
                + " AND P.company_id = ? "
                + " AND S.cancle_status = false  "
                + " AND S.delete = false  ";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setLong(1, prodId);
        pstm.setInt(2, companyId);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            prod = new Product();
            orm(prod, rs);
        }

        rs.close();
        pstm.close();
        con.close();

        return prod;
    }

    public static List<Product> productOutOfStock(int companyId) throws SQLException {
        List<Product> products = null;
        Product prod = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id =  S.prod_id "
                + " WHERE P.amount = 0 "
                + " AND P.company_id = ? "
                + " AND S.cancle_status = false  "
                + " AND S.delete = false  "
                + " ORDER BY P.prod_id";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, companyId);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            prod = new Product();
            orm(prod, rs);
            if (products == null) {
                products = new ArrayList();
            }
            products.add(prod);
        }

        rs.close();
        pstm.close();
        con.close();

        return products;
    }

    public static List<Product> getAllProduct(int companyId) throws SQLException {
        List<Product> products = null;
        Product prod = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id = S.prod_id "
                + " WHERE P.company_id = ? "
                + " AND S.cancle_status = false "
                + " AND S.delete = false  "
                + " ORDER BY P.prod_id ";

//        SELECT * FROM PRODUCTS P
//        JOIN PRODUCT_STATUS S ON P.prod_id =  S.prod_id
//        WHERE company_id = 1 AND cancle_status = false 
//        ORDER BY company_id;
        System.out.println(companyId);
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, companyId);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            prod = new Product();
            orm(prod, rs);
            if (products == null) {
                products = new ArrayList();
            }
            products.add(prod);
        }

        rs.close();
        pstm.close();
        con.close();
        return products;
    }

//    public static List<Product> getAllProduct(String companyName) throws SQLException{
//        List<Product> products = null;
//        Product prod = new Product();
//        
//        Connection con = ConnectionBuilder.getConnection();
//        String sql = "SELECT * FROM PRODUCTS p JOIN Companies c ON p.COMPANY_ID ="
//                      +"c.company_id WHERE c.company_name = ? ORDER BY p.prod_id";
//        PreparedStatement pstm = con.prepareStatement(sql);
//        pstm.setString(1, companyName);
//        
//        ResultSet rs = pstm.executeQuery();
//        while(rs.next()){
//           orm(prod,rs);
//           if(products == null){
//               products = new ArrayList();
//           }           
//           products.add(prod);           
//        }
//        
//        rs.close();
//        pstm.close();
//        con.close();    
//        return products;
//    }
    public static List<Product> getAlertProduct(int companyId) {
        List<Product> prods = null;
        Product p = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id = S.prod_id "
                + " WHERE P.amount <= (SELECT alertAmount FROM ALERT) "
                + " AND S.cancle_status = false "
                + " AND S.delete = false  "
                + " AND P.company_id = ? "
                + " ORDER BY P.prod_id ";
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (prods == null) {
                    prods = new ArrayList<>();
                }
                p = new Product();
                orm(p, rs);
                prods.add(p);
            }

            rs.close();
            pstm.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return prods;
    }

    public static boolean deleteProduct(long prodId) {
        int x = 0;

        try {
            Connection con = ConnectionBuilder.getConnection();

            String sql = "UPDATE `PRODUCT_STATUS` SET `DELETE` = ? "
                    + "WHERE PROD_ID = ? ;";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setBoolean(1, true);
            pstm.setLong(2, prodId);
            x = pstm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }

        return x > 0;
    }

    public static List<Product> getCancelProduct(int companyId) {
        List<Product> products = null;
        Product p = null;

        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM PRODUCTS P "
                + " JOIN PRODUCT_STATUS S ON P.prod_id = S.prod_id "
                + " WHERE P.company_id = ? "
                + " AND S.cancle_status = true "
                + " AND S.delete = false  "
                + " ORDER BY P.prod_id ";
        try {
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, companyId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (products == null) {
                    products = new ArrayList<>();
                }
                p = new Product();
                orm(p, rs);
                products.add(p);
            }

            rs.close();
            pstm.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return products;

    }

    public static Product bestSeller() {
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

    public static Product bestSellerByTime() {
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

    @Override
    public String toString() {
        return "Product{" + "prod_id=" + prod_id + ", prod_name=" + prod_name
                + "\n, amount=" + amount + ", price=" + price
                + "\n, prod_type=" + prod_type + ", branch=" + branch.getBranch_id()
                + "\n, company=" + company.getCompany_name() + '}';
    }

}
