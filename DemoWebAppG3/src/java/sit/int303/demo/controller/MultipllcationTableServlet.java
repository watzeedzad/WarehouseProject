///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package sit.int303.demo.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// *
// * @author int303
// */
//public class MultipllcationTableServlet extends HttpServlet {
//    int num = 7;
//
//    @Override
//    public void init() throws ServletException {
//        String temp = getInitParameter("defaultNumber");
//        try {
//            num = Integer.parseInt(temp);
//        } catch (Exception e) {        
//        }  
//        }
//    }
//    
//    
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String GuestNum = request.getParameter("n");
//        //int n = 2;
//        int n;
//        n = num;
//        String message = "";
//        try {
//           n = Integer.parseInt(GuestNum);
//        } catch (Exception e) {
//            message = "Can't convert "+GuestNum+" to integer ...tryagain";
//        }
//
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet MultipllcationTableServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<table>");
//            out.println("<tr><th colspan='5'>MultiplicationTable"+n+"</th></tr>");
//            for(int num = 1 ; num < 13 ; num++){
//                out.println("<tr> <td>"+n+"</td><td>x</td><td>"+num+"</td><td>=</td><td>"+n*num+"</td>                    </tr>");      
//            }
//            
//            out.println("</table>");
//            if(message.length()>0){
//                out.println("<h3>"+message+"</h3>");
//            }
//            //out.println("<h1>Servlet MultipllcationTableServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
