/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.Company;
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
 * @author Praew
 */
public class AddNewProductServlet extends HttpServlet {

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

        String name = request.getParameter("name");
        String amountStr = request.getParameter("amount");
        String priceStr = request.getParameter("price");
        String type = request.getParameter("type");
        String branchIdStr = request.getParameter("branchId");
        int amount = Integer.parseInt(amountStr);
        double price = Double.parseDouble(priceStr);
        int branchId = Integer.parseInt(branchIdStr);

        HttpSession session = request.getSession();
        String message = "";
        Staff user = (Staff) session.getAttribute("staffData");
        int companyId = user.getCompanyId();

        Product p = new Product(name, amount, price, type, companyId, branchId);

        boolean success;
        try {
            success = p.addNewProduct();
            if (success) {
                message = "Add new Product SUCCESS!!";
            } else {
                message = "Failed To add new Product";
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddNewProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        session.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/editallpage.jsp").forward(request, response);

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
