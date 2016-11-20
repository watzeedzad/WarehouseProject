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
import java.sql.SQLException;
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
public class OrderByTimeRangeServlet extends HttpServlet {

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
        String range = request.getParameter("range");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String messages = "";
        if (orderStatus != null && range != null && month != null) {
            System.out.println(range);
            System.out.println(orderStatus);
            System.out.println(month);
            System.out.println(year);
            try {
                if (range.equalsIgnoreCase("month")) {
                    if (orderStatus.equalsIgnoreCase("in")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderMonth("in", companyId, month);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test1");
                    } else if (orderStatus.equalsIgnoreCase("out")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderMonth("out", companyId, month);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test2");
                    } else if (orderStatus.equalsIgnoreCase("all")) {
                        List<OrderInOut> ordersTime = OrderInOut.allOrderMonth("in", "out", companyId, month);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test3");
                    }
                } else if (range.equalsIgnoreCase("year")) {
                    if (orderStatus.equalsIgnoreCase("in")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderYear("in", companyId, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test4");
                    } else if (orderStatus.equalsIgnoreCase("out")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderYear("out", companyId, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test5");
                    } else if (orderStatus.equalsIgnoreCase("all")) {
                        List<OrderInOut> ordersTime = OrderInOut.allOrderYear("in", "out", companyId, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test6");
                    }
                } else if (range.equalsIgnoreCase("month_year")) {
                    if (orderStatus.equalsIgnoreCase("in")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderMonthYear("in", companyId, month, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + "," + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test7");
                    } else if (orderStatus.equalsIgnoreCase("out")) {
                        List<OrderInOut> ordersTime = OrderInOut.orderMonthYear("out", companyId, month, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + "," + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test8");
                    } else if (orderStatus.equalsIgnoreCase("all")) {
                        List<OrderInOut> ordersTime = OrderInOut.allOrderMonthYear("in", "out", companyId, month, year);
                        if (ordersTime != null) {
                            request.setAttribute("ordersTime", ordersTime);
                        } else {
                            messages = "Range " + month + "," + year + " and order type " + orderStatus + " not found.";
                        }
                        System.out.println("test9");
                    }
                }
            } catch (NumberFormatException ex) {
                messages = "Must be decimal number only!!";
            }
            request.setAttribute("messagesTime", messages);
            getServletContext().getRequestDispatcher("/TestOrderInOutTime.jsp").forward(request, response);
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
