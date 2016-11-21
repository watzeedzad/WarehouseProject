/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Praewhubb
 */
public class Testtttt {

    public static void main(String[] args) throws SQLException {
//    -------------TEST add STAFF -----------------------
//        Staff s = new Staff();        
//        boolean success = s.addStaff(1, "aaaa", "bbbb", 5534567890123L , "aaaaadd" , "test");           

// ---------------- TEST Company -----------------------
//    Company com = Company.getCompany("TEST_COMPANY");
//    com = Company.getCompany(1);    
//    System.out.println(com.getCompany_name());
//  --------------- TEST Product -----------------------
//    Product prod = new Product("pen", 200,150, "pen" , "TEST_COMPANY", 1000001);
//    boolean success = prod.addNewProduct();   
//    System.out.println(success);

//    Connection con = ConnectionBuilder.getConnection();
//    boolean s = Product.addToProductStatus(con, 10000105);
//        System.out.println(s);
    
    
//    Product p = Product.getProduct(10000003);
//    System.out.println(p.getProd_id());
//    System.out.println(p.getProd_name());
//    System.out.println(p.getPrice());
//    System.out.println(p.getAmount());
//    System.out.println(p.getBranch().getBranch_name());
//    System.out.println(p.getProd_type());
//    System.out.println(p.getCompany().getCompany_name());    
//    System.out.println(p);
   
//    p.setAmount(1000);
//    p.editProduct();        
//    System.out.println(p);
//    p.addAmount(50);
//    System.out.println(p);
//    p.reduceAmount(15);
//    System.out.println(prod);    
//        if(success){
//            System.out.println("SUCCESS");            
//        }else{
//            System.out.println("FAILED!!");
//        }
//  --------------- TEST get List of Product -----------------------         
//        System.out.println("Product pro = Product.searchById(10000001);");
//        Product pro = Product.searchById(10000001);
//        System.out.println(pro);
//        System.out.println("----------------------------------------------------------\n\n");
//        
//        System.out.println("List<Product> searchName = Product.searchByName(\"P\");");
//        List<Product> searchName = Product.searchByName("P");
//        for (Product p : searchName) {
//            System.out.println(p);
//        }
//        System.out.println("----------------------------------------------------------\n\n");

//    Company company = new Company();    
//    company.setCompany_name("ABC");
//    company.setDescription("sell all product");
//    boolean success = company.addNewCompany();
//    if(success){
//        System.out.println("SUCCESS");
//        System.out.println(company);            
//    }else{
//            System.out.println("FAILED!!");
//    } 


//        System.out.println("List<Product> prodCompany = Product.getAllProduct(1);");
//        List<Product> prodCompany = Product.getAllProduct(1);
//        for (Product p : prodCompany) {
//            System.out.println(p);
//        }



//        
//        System.out.println("----------------------------------------------------------\n\n");
        
//        Product p1 = Product.getProduct(10000009);
//        p1.setAmount(1035);
//        p1.editProduct();
//        System.out.println(p1);


//        System.out.println("List<Product> prodOutOfStock = Product.productOutOfStock();");
//        List<Product> prodOutOfStock = Product.productOutOfStock();
//        if(prodOutOfStock != null){
//            for (Product p : prodOutOfStock) {
//                System.out.println(p);
//            }
//            System.out.println("----------------------------------------------------------\n\n");
//        }
        
        
//        System.out.println("********TEST Branch*********");
//        Branch b1 = new Branch();
//        b1.setBranch_name("branch two");
//        b1.setLocation("Somewhere on this world");
//        boolean success = b1.addNewBranch();
//        System.out.println(success? "SUCCESS":"FAILED");



//        Product prod = new Product("Keyboard", 30 , 990, "it-equipment" , "ABC", 1);
//        boolean success = prod.addNewProduct();
//        System.out.println(success);

//          List<Product> prods = Product.getAlertProduct(1);
//          for(Product p : prods){
//              System.out.println(p);
//              
//          }

//-----------------------------------------------------------------------------------
    

//          
          
//          List<Product> prods = Product.getCancelProduct(1);
//          for(Product p : prods){
//              System.out.println(p);
//              
//          }
          
//          System.out.println("--------------------------\n\n\n\n");
//          Product p = Product.searchById(10000003L, 1);          
//          System.out.println(p);
              
          
//        Product p =Product.getProduct(10000017);
//        Staff s = Staff.viewStaffData(10001);
//        Order o = new Order();
//        boolean suc = o.addNewProduct(p, s);
//        
//        System.out.println("************ "+suc);
            
//          boolean exist = Product.isExistProduct(2, 100000018);
//          System.out.println(exist);
//          
//          boolean success = Product.deleteProduct(10000017);
//          System.out.println(success);
//        Staff s = Staff.viewStaffData(10001);
//         boolean success = Order.reduceAmount(10000007, 20, s);
//         System.out.println(success);

//            String messageJa = "";
//            boolean success = Product.setAlertAmountInDB(2, 150);
//            if(success){
//                messageJa = "UPDATE alert amount SUCCESS!!";
//            }else{
//                messageJa = "FAILED to UPDATE alert amount!!";
//            }
//            System.out.println("messageJa = "+messageJa);
            

//          List<Product> prods = Product.searchByName("Sham",2);
//          for(Product p : prods){
//              System.out.println(p.getProd_name());              
//          }

//            Staff st = Staff.viewStaffData(10002);
//            System.out.println(st.getCompany().getCompany_name());
            
        List<Branch> branchPerCompany = Branch.viewAmountPerBranch(2);
        for(Branch b:branchPerCompany){
            System.out.println(b);
        }
        
        System.out.println("\n\n-------------------------------------------------\n\n");
        List<Branch> branchRamin = Branch.viewRemainPerBranch();
        
        for(Branch b:branchRamin){
            
        }
        List<Branch> result = new ArrayList<>();
        
    }
}
