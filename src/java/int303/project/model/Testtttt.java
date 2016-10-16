/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

/**
 *
 * @author Praewhubb
 */
public class Testtttt {
    public static void main(String[] args) {
//    -------------TEST add STAFF -----------------------
        Staff s = new Staff();        
        boolean success = s.addStaff(1, "HEY", "Hello", 1234567890123L , "yyyyyy" , "Slave");        
        if(success){
            System.out.println("SUCCESS");
        }else{
            System.out.println("FAILED!!");
        }
              
    }
}
