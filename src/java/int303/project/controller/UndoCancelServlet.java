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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Praewhubb
 */
public class UndoCancelServlet extends HttpServlet {

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
        Staff user = (Staff) session.getAttribute("staffData");

        if (user == null) {
//            log(session.toString());
            request.getServletContext().getRequestDispatcher("/logout").forward(request, response);
            log("USER = " + user);
            log("NULLLL");
        }

        int companyId = user.getCompanyId();
        String message = "";
        String messageJa = "";
        String[] cancels = request.getParameterValues("cancel");

        if (cancels == null) {
            message = "Please select Product to UNDO CANCEL";
        } else {
            for (String idStr : cancels) {
                long id = Long.parseLong(idStr);
                Product.undoCancelProduct(id);
            }

            message = "UNDO cancel Product SUCCESS";
        }

        List<Product> products = Product.getCancelProduct(companyId);
        if (products != null) {
            messageJa = "ALL cancel Product";
            session.setAttribute("products", products);
        } else {
            messageJa = "There is no cancel Product";
            if (session.getAttribute("products") != null) {
                session.removeAttribute("products");
            }
        }
        
        request.setAttribute("message", message);
        request.setAttribute("messageJa", messageJa);
        getServletContext().getRequestDispatcher("/UndoCancelProduct.jsp").forward(request, response);

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
