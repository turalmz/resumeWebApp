/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.company.Context;
import com.company.dao.inter.*;
import com.company.entity.*;
import com.company.resume.util.ControllerUtil;

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
        BCrypt.Verifyer verifyer = BCrypt.verifyer();

        UserDaoInter userDao = Context.instanceUserDao();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = userDao.findByEmail(email);

            if (user == null) {
                throw new IllegalArgumentException("User doesn't existt!!!");
            }

            BCrypt.Result rs = verifyer.verify(password.toCharArray(), user.getPassword().toCharArray());

            if(!rs.verified){
                throw new IllegalArgumentException("password is incorrect!!!");
            }

            request.getSession().setAttribute("loggedInUser", user);
            response.sendRedirect("users");
        }catch (Exception ex){
            ControllerUtil.errorPage(response, ex);
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}