/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

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
        int count = 0;
        if(count==0){
            System.out.println("HEYYYYY");
            config.getServletContext().getRequestDispatcher("/UpdateProduct").forward(request, response);
        }else{
            chain.doFilter(request, response);
        }
        
        
    }

    @Override
    public void destroy() {
         
    }
    
    
    
}
