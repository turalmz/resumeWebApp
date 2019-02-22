package com.company.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName = "JspFilter",urlPatterns = ("*.jsp"))
public class JspFilter implements Filter{


    public void init(FilterConfig arg0) throws ServletException {}

    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletResponse response = (HttpServletResponse) res;
        HttpServletRequest request = (HttpServletRequest) req;

        try{
            response.sendRedirect("error?msg="+"dont use jsp");

        }catch (Exception ex){
            ex.printStackTrace();

        }
    }
    public void destroy() {}

}