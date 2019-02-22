/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import com.company.Context;
import com.company.dao.inter.LoginDaoInter;
import com.company.dao.inter.UserDaoInter;
import com.company.entity.Login;
import com.company.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author TURAL
 */
@WebServlet(name = "LogoutController" , urlPatterns = ("/logout"))
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session=request.getSession();
        session.invalidate();

        try{
            response.sendRedirect("login");
        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}