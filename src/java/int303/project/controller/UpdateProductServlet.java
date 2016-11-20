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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Praewhubb
 */
public class UpdateProductServlet extends HttpServlet {

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
        
        String message = "";
        String[] deletes = request.getParameterValues("delete");
        String[] cancels = request.getParameterValues("cancel");
        boolean success1 = false;
        boolean success2 = false;
        
        if((deletes==null&&cancels==null) || (deletes.length==0&&cancels.length==0)){
            message = "Please select Product to CANCEL OR DELETE";
        }else{                    
            if(deletes!=null){
                for(String idStr : deletes){
                    long id = Long.parseLong(idStr);
                    success1 = Product.deleteProduct(id);
                }
                if(success1){
                    message = "DELETE product(s) SUCCESS";
                }else{
                    message = "FAILED to DELETE product(s)";
                }
            }
            if(cancels!=null){
                for(String idStr : cancels){
                    long id = Long.parseLong(idStr);
                    success2 = Product.cancelProduct(id);
                }
                if(success2){
                    message += "\n CANCEL product(s) SUCCESS";
                }else{
                    message = "FAILED to CANCEL product(s)";
                }
            }
        }
        
        request.setAttribute("messageJa", message);
        getServletContext().getRequestDispatcher("/AllProduct").forward(request, response);
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
