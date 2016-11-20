/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.controller;

import int303.project.model.Branch;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import int303.project.model.Login;
import int303.project.model.Staff;
import java.util.List;

/**
 *
 * @author jiraw
 */
public class LoginServlet extends HttpServlet {

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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String target = "/index.jsp";
        String message = "";
        HttpSession session = request.getSession();
        if (Login.login(user, pass) == true) {
            target = "/TestHome.jsp";
            session.setAttribute("user", user);
            int staffId = Login.getUserId(user);
            session.setAttribute("user_id", staffId);
            //ดึงข้อมูลมาทั้ง record ของ staff เอาไว้ใช้ต่อไป
            Staff st = Staff.viewStaffData(staffId);
//            log("staffId "+session.getAttribute("user_id"));
//            log(Login.getUserId(user)+" Login.getUserId(user)");

            session.setAttribute("staffData", st);
            if (session.getAttribute("staffData") != null) {
                Staff s = (Staff) session.getAttribute("staffData");
                session.setAttribute("staffData", s);
//                log("---has Staff");
//                log(s.toString());
            }

            List<Branch> allBranch = Branch.getAllBranch();
            if (allBranch != null) {
                getServletContext().setAttribute("allBranch", allBranch);
            }

            String targetJa = (String) getServletContext().getAttribute("targetJa");
            System.out.println(targetJa);
            if (targetJa == null || target.trim().length() == 0) {
                getServletContext().getRequestDispatcher("/TestHome.jsp").forward(request, response);
                System.out.println("********in targetJa == null");
                return;
            } else {
                System.out.println("--- LOG IN >>> TARGETJA = " + targetJa);
                //getServletContext().getRequestDispatcher(targetJa).forward(request, response);
                response.sendRedirect("http://localhost:8080/WarehouseProject" + targetJa);
                return;
            }
            //log("test in log in");

        } else if (Login.isUserExist(user)) {
            message = "Wrong password !";
            return;
        } else {
            message = "Username " + user + " does not exist !";
        }
        if (user == null) {
            message = "";
        }
        request.setAttribute("message", message);
        System.out.println("----- INNNNN LOGIN -----");
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
