///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package int303.project.filter;
//
//import int303.project.model.Product;
//import int303.project.model.Staff;
//import java.io.IOException;
//import java.io.PrintStream;
//import java.io.PrintWriter;
//import java.io.StringWriter;
//import static java.rmi.server.LogStream.log;
//import java.util.List;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author Praew
// */
//
//public class AlertFilter implements Filter {
//    private FilterConfig config;
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        config = filterConfig;
//   }
//
//   @Override
//   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        // invoke method alert in class Product
//        HttpServletRequest req = (HttpServletRequest)request;
//        HttpSession session = req.getSession();                       
//        String projectName =  "WarehouseProject";
//        Staff user = (Staff)session.getAttribute("staffData");
//        
//        if(user == null){
//            log(session.toString());
//            request.getServletContext().getRequestDispatcher("/logout").forward(request, response);
//            log(user+""); 
//            log("NULLLL");
//        }
//        
//        if(session == null){
//            String msg = "Session Timeout";
//            config.getServletContext().getRequestDispatcher("/try").forward(request, response);
//        }else{
//            if(session.getAttribute("alertProd") != null){
//                ((List)session.getAttribute("alertProd")).clear();
//            } 
//        }              
//        
//        List<Product> alertProd = Product.getAlertProduct(user.getCompanyId());
//        if(alertProd != null){
//            session.setAttribute("alertProd",alertProd);
//            ((HttpServletResponse)response).sendRedirect("/"+projectName+"/Alert.jsp"); 
//            // too many redirect
////            config.getServletContext().getRequestDispatcher("/Alert1").forward(request, response);
//            // javax.servlet.ServletException: AS-WEB-CORE-00089
//        }else{
//            chain.doFilter(request, response);
//        }       
//    }
//
//    @Override
//    public void destroy() {
//         
//    }
//    
//    
//    
//}
