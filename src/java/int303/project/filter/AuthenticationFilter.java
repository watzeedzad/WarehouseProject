/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jiraw
 */
public class AuthenticationFilter implements Filter {

    FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/login";
        String path = request.getRequestURI();

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        
       
        
        if (loginRequest || loggedIn || path.matches(".*(css|jpg|png|gif|js)")) {
            chain.doFilter(request, response);
        } else { 
             String targetJa = request.getRequestURI();
            int slash = targetJa.indexOf("/", 1);
            targetJa = targetJa.substring(slash);
            request.setAttribute("targetJa", targetJa);
            System.out.println("***AUTHEN >>>> TARGETJA = "+targetJa);
            System.out.println("*** INNNNN AUTHEN ***");
            response.sendRedirect(loginURI);
            //config.getServletContext().getRequestDispatcher("/login").forward(req, res);
        }
    }

    @Override
    public void destroy() {
    }

}