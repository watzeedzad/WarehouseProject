/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sit.int303.demo.model.Customer;

/**
 *
 * @author int303
 */
public class SearchCustomerServlet extends HttpServlet {

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
        String param = request.getParameter("searchParam");
        String message = "";
        String target = "/ListCustomer.jsp";

        if (param != null) {
            int id = 0;
            try {
                id = Integer.parseInt(param);
//                Customer c = Customer.findById(id);
                Customer c = null;
                HttpSession session = request.getSession(false);
                
                if (session != null && session.getAttribute("customers") != null) { //
                    List<Customer> customers = (List) session.getAttribute("customers");
                    c = new Customer();
                    c.setCustomerId(id);
                    
                    int index = customers.indexOf(c);
                    
                    if(index>0){
                         c = customers.get(index);
                    }else{
                        c = null;
                        message = "your id " + param + " is not found";
                    }
                } else {
                    c = Customer.findById(id);
                }//

                if (c == null) {
                    message = "your id " + param + " is not found";
                } else {
                    session.setAttribute("customer", c);
                }
                target = "/CustomerDetail.jsp";
                
                
            } catch (Exception e) {
                HttpSession session = request.getSession();
                List<Customer> customers = Customer.findByname(param);
                if (customers == null) {
                    message = "your name like " + param + "% does not exist";
                    if (session.getAttribute("customers") != null) {
                        ((List) session.getAttribute("customers")).clear();
                    } else {
                        session.setAttribute("customers", new ArrayList<Customer>());
                    }
                } else {
                    session.setAttribute("customers", customers);
                }
            }

        } else {
            request.getSession().setAttribute("customers", new ArrayList<Customer>());
        }
        request.setAttribute("message", message);
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
