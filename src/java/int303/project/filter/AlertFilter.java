/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.filter;

import int303.project.model.Product;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Praew
 */
public class AlertFilter implements Filter {
    private FilterConfig config;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // invoke method alert in class Product
        HttpSession session = ((HttpServletRequest)request).getSession();                       
        
        if(session == null){
            String msg = "Session Timeout";
            config.getServletContext().getRequestDispatcher("/try").forward(request, response);
        }else{
            if(session.getAttribute("alertProd") != null){
                ((List)session.getAttribute("alertProd")).clear();
            } 
        }              
        
        List<Product> alertProd = Product.getAlertProduct();
        if(alertProd != null){
            session.setAttribute("alertProd",alertProd);
            config.getServletContext().getRequestDispatcher("/Alert").forward(request, response);
        }else{
            chain.doFilter(request, response);
        }       
    }

    @Override
    public void destroy() {
         
    }
    
    
    
}
