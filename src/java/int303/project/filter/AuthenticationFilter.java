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
import javax.servlet.http.HttpSession;

/**
 *
 * @author jiraw
 */
public class AuthenticationFilter implements Filter {
    FilterConfig config ;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig ;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession s = ((HttpServletRequest) request).getSession(false) ;
        String target = ((HttpServletRequest) request).getRequestURI() ;
        target = target.substring(target.indexOf("/", 1)+1); //           /wpg3/xxxxxx
        if (s==null || s.getAttribute("user")==null) {
            config.getServletContext().getRequestDispatcher("/Login?target="+ target).forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
    
}
