/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.SQLException;
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
//    Product prod = new Product("Keyboard", 30, 990, "it-equipment" , "ABC", 1000001);
//    boolean success = prod.addNewProduct();   
//    Product p = Product.getProduct(10000006);
//    System.out.println(p.getProd_id());
//    System.out.println(p.getProd_name());
//    System.out.println(p.getPrice());
//    System.out.println(p.getAmount());
//    System.out.println(p.getBranch().getBranch_name());
//    System.out.println(p.getProd_type());
//    System.out.println(p.getCompany().getCompany_name());    
//    System.out.println(p);
//   
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
        System.out.println("Product pro = Product.searchById(10000001);");
        Product pro = Product.searchById(10000001);
        System.out.println(pro);
        System.out.println("----------------------------------------------------------\n\n");
        
        System.out.println("List<Product> searchName = Product.searchByName(\"P\");");
        List<Product> searchName = Product.searchByName("P");
        for (Product p : searchName) {
            System.out.println(p);
        }
        System.out.println("----------------------------------------------------------\n\n");

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
        System.out.println("List<Product> prodCompany = Product.getAllProduct(\"ABC\");");
        List<Product> prodCompany = Product.getAllProduct("ABC");
        for (Product p : prodCompany) {
            System.out.println(p);
        }
        
        System.out.println("----------------------------------------------------------\n\n");
        
//        Product p1 = Product.getProduct(10000009);
//        p1.setAmount(1035);
//        p1.editProduct();
//        System.out.println(p1);
        System.out.println("List<Product> prodOutOfStock = Product.productOutOfStock();");
        List<Product> prodOutOfStock = Product.productOutOfStock();
        for (Product p : prodOutOfStock) {
            System.out.println(p);
        }
        System.out.println("----------------------------------------------------------\n\n");
        
//        System.out.println("********TEST Branch*********");
//        Branch b1 = new Branch();
//        b1.setBranch_name("branch two");
//        b1.setLocation("Somewhere on this world");
//        boolean success = b1.addNewBranch();
//        System.out.println(success? "SUCCESS":"FAILED");
    }
}
