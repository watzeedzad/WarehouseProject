/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.Product;
import int303.project.model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jiraw
 */
public class EditProductServlet extends HttpServlet {

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
        String message="";
        Staff user = (Staff)session.getAttribute("staffData");
        
        if(user == null){
//            log(session.toString());
            request.getServletContext().getRequestDispatcher("/logout").forward(request, response);
            log("USER = "+user); 
            log("NULLLL");
        }        
        
        try {           
            String idStr = request.getParameter("prod_id");
            String prodName = request.getParameter("prodName");
            String prodPrice = request.getParameter("prodPrice");
            String prodType = request.getParameter("prodType");
            Product prod=null;
            
            if(idStr!=null||idStr.trim().length()!=0){
                long prodId = Long.parseLong(idStr);
                prod = Product.getProduct(prodId); 
            }              
                                    
            if (prodName == null || prodName.trim().length()==0) {
                String name = prod.getProd_name();
                prod.setProd_name(name);
            }else{
                prod.setProd_name(prodName);
            }
            
            double prodPriceDouble=0;            
            if (prodPrice == null || prodPrice.trim().length()==0) {                
                double price = prod.getPrice();
                prod.setPrice(price);
            }else{
                prodPriceDouble = Double.parseDouble(prodPrice);
                prod.setPrice(prodPriceDouble); 
            }            
            
            if (prodType == null||prodType.trim().length()==0) {
                String type = prod.getProd_type();
                prod.setProd_type(type);
            }else{
                prod.setProd_type(prodType);
            }            
            prod.editProduct(prodName, prodPriceDouble, prodType, prod.getProd_id());
            session.setAttribute("product", prod);
            System.out.println("session.setAttribute(\"p\", prod);");
            
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (NumberFormatException ex) {
            System.err.println(ex);
        }
        
        getServletContext().getRequestDispatcher("/EditProduct.jsp").forward(request, response);
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
