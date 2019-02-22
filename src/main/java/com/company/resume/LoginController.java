/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import com.company.Context;
import com.company.dao.inter.*;
import com.company.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author TURAL
 */
@WebServlet(name = "LoginController" , urlPatterns = ("/login"))
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        try{

            request.getRequestDispatcher("login.jsp").forward(request,response);
        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String username = "";
        // Check if skill id parameter exists
        if (request.getParameterMap().containsKey("username")) {
            username = (request.getParameter("username"));

        }
        String password = "";

        // Check if skill id parameter exists
        if (request.getParameterMap().containsKey("password")) {
            password = (request.getParameter("password"));

        }

        LoginDaoInter loginDao = Context.instanceLoginDao();

        Login lg = loginDao.getByUserameAndPassword(username,password);

        UserDaoInter userDao = Context.instanceUserDao();
        User us = userDao.getById(lg.getUser().getId());

        System.out.println("here we are");

        request.getSession().setAttribute("user",us);
        request.getSession().setMaxInactiveInterval(60*60);

        response.sendRedirect("users?name=" + us.getFirstname()+"&surname="+us.getLastname());

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}