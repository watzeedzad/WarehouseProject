/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.Order;
import int303.project.model.Product;
import int303.project.model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Praew
 */
public class ReduceProductAmountServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession session = request.getSession();
        Staff user = (Staff)session.getAttribute("staffData");
       
        if(user == null){
//            log(session.toString());
            request.getServletContext().getRequestDispatcher("/logout").forward(request, response);
            log("USER = "+user); 
            log("NULLLL");
        }
        
        String idStr = request.getParameter("prodId");
        String amountStr = request.getParameter("prodAmount");
        String message = "";
        
         try {
            long id = Long.parseLong(idStr);
            int amount = Integer.parseInt(amountStr);            
            boolean exist =  Product.isExistProduct(user.getCompanyId(), id);
                                
            if(exist){
                Product prod = Product.getProduct(id);
                if(prod.getAmount()<amount){
                    message = "Invalid amount : your input is more than the amount of Product";
                }else{
                   boolean success = Order.reduceAmount(id, amount,user);
                   if(success){
                       message = " Reduce amount SUCCESS!!";
                   }else{
                       message = " FAILED to Reduce amount!!";
                   }   
                }
            }else{               
                message = "Product ID '"+id+"' does not exist";
            }      
        } catch (Exception e) {
            System.out.println(e);         
        }
        //เวลาเพิ่มจำนวน ต้องaddลงORDERSด้วย
        
        request.setAttribute("messageJa", message);
        
        String source = request.getParameter("source");
        if(source != null){
            if(source.equals("allProduct")){
                getServletContext().getRequestDispatcher("/AllProduct").forward(request, response);
            }
        }else{
            getServletContext().getRequestDispatcher("/Editallpage.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
