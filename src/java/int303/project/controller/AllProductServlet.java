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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Praew
 */
public class AllProductServlet extends HttpServlet {

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
        
        HttpSession session = request.getSession(false);
        String searchParam = request.getParameter("searchParam");
        String target = "/allProduct.jsp";
        List<Product> products = null;
        String message = "";
        Staff user = (Staff)session.getAttribute("staffData");
        
        if(user == null){
            request.getServletContext().getRequestDispatcher("/login").forward(request, response);
            log(user+""); 
            log("NULLLL");
        }
        
        int companyId = user.getCompanyId();
        
        if(searchParam != null){
            searchParam.trim();
            
            if(session.getAttribute("products") != null){
                ((List)session.getAttribute("products")).clear();
            }
            
            try {
                Long id = Long.parseLong(searchParam);
                Product p = Product.searchById(id,companyId);
                log("id = "+id);
                log(p.toString());
                // เกิด NullPointerException เลยลงไปทำ findByName
                if(p == null){
                    message = "Product ID '"+id+"' does not exist!!"; 
                    log("In p==null");
                }else{
                    log("in product != null");
                    products = new ArrayList<>();
                    products.add(p);
//                    System.out.println(products);
                    session.setAttribute("products", products);
                    message = "search By ID";
                }
                
            } catch (Exception e) {
                log(e+"");
                try {                    
                    products = Product.searchByName(searchParam,companyId);
                    session.setAttribute("products", products);
                    message = "search by Name";                 
                    log("hereeee");
                } catch (SQLException ex) {
                    request.setAttribute("error", ex);
                    request.getServletContext().getRequestDispatcher("/watcherror").forward(request, response);
                }
            }
        }else{
            message = "Get All Product";            
            try {
                products = Product.getAllProduct(companyId);
                session.setAttribute("products", products);
            } catch (SQLException ex) {
                request.setAttribute("error", ex);
                request.getServletContext().getRequestDispatcher("/watcherror").forward(request, response);
            }
        }
        

        // โดย default getAllproduct
        // searchByName / id / 
        
        session.setAttribute("message", message);
        getServletContext().getRequestDispatcher(target).forward(request, response);
    
        
        
        
        
        
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
