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
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author TURAL
 */
@WebServlet(name = "UserSkillController" , urlPatterns = ("/userskill"))
public class UserSkillController extends HttpServlet {


//    public void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Set response content type
//        response.setContentType("text/html");
//
//        PrintWriter out = response.getWriter();
//
//        out.println(
//                "<html> hello</html>"
//        );
//    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("id"));
        UserDaoInter userDao = Context.instanceUserDao();

        String action="";
        if (request.getParameterMap().containsKey("action")) {
            action = request.getParameter("action");
        }
        System.out.println("action="+action);
        User us = userDao.getById(id);
        UserSkillDaoInter userSkillDao = Context.instanceUserSkillDao();
        Integer skillId = null;

        // Check if skill id parameter exists
        if (request.getParameterMap().containsKey("skillId")) {
            skillId = Integer.parseInt(request.getParameter("skillId"));

        }

        if(action.equalsIgnoreCase("update")) {


            SkillDaoInter skillDao = Context.instanceSkillDao();


            Integer power = 0;
            // Check if profile power parameter exists
            if (request.getParameterMap().containsKey("power")) {
                power = Integer.parseInt(request.getParameter("power"));
            }
            UserSkill skill = new UserSkill(null, us, skillDao.getById(skillId), power);

            userSkillDao.insertUserSkill(skill);


        }else if(action.equalsIgnoreCase("delete")) {
            userSkillDao.removeUserSkill(skillId);
        }

        System.out.println("here we are");
        response.sendRedirect("userdetail?id=" + us.getId());
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}