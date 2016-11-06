/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Praewhubb
 */
public class Order {
    private int orderId;
    private Staff staff;
    private String orderType; //-------- 
    private Date orderDate;
    private List<Product> prodInOrder;
    
}
