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
@WebServlet(name = "UserSkillController" , urlPatterns = ("/userskill"))
public class UserSkillController extends HttpServlet {



    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("id"));
        UserDaoInter userDao = Context.instanceUserDao();

        User us = userDao.getById(id);

        UserSkillDaoInter userSkillDao = Context.instanceUserSkillDao();
        SkillDaoInter skillDao = Context.instanceSkillDao();

        Integer skillId = null;
        // Check if skill id parameter exists
        if (request.getParameterMap().containsKey("skillId")) {
            skillId = Integer.parseInt(request.getParameter("skillId"));

        }
        Integer power = 0;
        // Check if profile power parameter exists
        if (request.getParameterMap().containsKey("power")) {
            power = Integer.parseInt(request.getParameter("power"));
        }
        UserSkill skill = new UserSkill(null,us,skillDao.getById(skillId),power);

        userSkillDao.insertUserSkill(skill);

        System.out.println("here we are");
        response.sendRedirect("userdetail?id="+us.getId());

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}