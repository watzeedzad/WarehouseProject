/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.Login;
import int303.project.model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jiraw
 */
public class AddUserServlet extends HttpServlet {

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
        int companyId;
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        long citizenNo;
        String address = request.getParameter("address");
        String position = request.getParameter("position");

        String username = request.getParameter("username");
        String password = String.valueOf(request.getParameter("password"));
        int staffId;
        boolean status;
        boolean status2;
        String message = "";

        if (firstName != null && lastName != null && request.getParameter("citizenNo") != null && address != null && position != null) {
            companyId = Integer.parseInt(request.getParameter("companyId"));
            citizenNo = Long.parseLong(request.getParameter("citizenNo"));
            Staff s = new Staff();
            status = s.addStaff(companyId, firstName, lastName, citizenNo, address, position);
            if (status) {
                staffId = s.getStaffId();
                status2 = Login.addNewUser(username, password, staffId);
                if (status2) {
                    message = "Add new user successful!";
                } else {
                    message = "Can not add SQL Error. Please check input data.";
                }
            } else {
                message = "Can not add SQL Error. Please check input data.";
            }
        } else {
            message = "Can not have any empty field. Every field must be filled!";
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/TestAddNewUser.jsp").forward(request, response);
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
