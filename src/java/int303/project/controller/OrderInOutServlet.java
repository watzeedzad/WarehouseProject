/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.OrderInOut;
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
 * @author jiraw
 */
public class OrderInOutServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("staffData");
        if (staff == null) {
            request.getServletContext().getRequestDispatcher("/logout").forward(request, response);
        }
        int companyId = staff.getCompanyId();
        String orderStatus = request.getParameter("viewBy");
        String searchParam = request.getParameter("searchParam");
        String messages = "";
        if (orderStatus != null && searchParam != null) {
            try {
                int searchParamInt = Integer.parseInt(searchParam);
                if (orderStatus.equalsIgnoreCase("in")) {
                    List<OrderInOut> orders = OrderInOut.orderById("in", searchParamInt, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product ID " + searchParamInt + " not found!";
                    }
                } else if (orderStatus.equalsIgnoreCase("out")) {
                    List<OrderInOut> orders = OrderInOut.orderById("out", searchParamInt, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product ID " + searchParamInt + " not found!";
                    }
                    //return;
                } else if (orderStatus.equalsIgnoreCase("all")) {
                    List<OrderInOut> orders = OrderInOut.allOrderById("in", "out", searchParamInt, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product ID " + searchParamInt + " not found!";
                    }
                }
            } catch (NumberFormatException ex) {
                if (orderStatus.equalsIgnoreCase("in")) {
                    if (searchParam.trim().length() == 0) {
                        searchParam = "";
                    }
                    List<OrderInOut> orders = OrderInOut.orderByName("in", searchParam, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product Name " + searchParam + " not found!";
                    }
                } else if (orderStatus.equalsIgnoreCase("out")) {
                    if (searchParam.trim().length() == 0) {
                        searchParam = "";
                    }
                    List<OrderInOut> orders = OrderInOut.orderByName("out", searchParam, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product Name " + searchParam + " not found!";
                    }
                    //return;
                } else if (orderStatus.equalsIgnoreCase("all")) {
                    if (searchParam.trim().length() == 0) {
                        searchParam = "";
                    }
                    List<OrderInOut> orders = OrderInOut.allOrderByName("in", "out", searchParam, companyId);
                    if (orders != null) {
                        request.setAttribute("orders", orders);
                    } else {
                        messages = "Product Name " + searchParam + " not found!";
                    }
                }
            }
        } else {
            messages = "Can not be null!";
        }
        request.setAttribute("messages", messages);
        getServletContext().getRequestDispatcher("/ViewState.jsp").forward(request, response);
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
