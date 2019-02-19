/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import com.company.Context;
import com.company.dao.impl.UserDaoImpl;
import com.company.dao.inter.*;
import com.company.entity.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TURAL
 */
@WebServlet(name = "UserController" , urlPatterns = ("/userdetail"))
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserDaoInter userDao = Context.instanceUserDao();


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user=null;

        try{
            String userIdStr = request.getParameter("id");

            if(userIdStr == null || userIdStr.trim().isEmpty()){
                throw new IllegalArgumentException("id is not specified");
            }

            UserDaoInter userDao = Context.instanceUserDao();
            Integer userId = null;

            userId = Integer.parseInt(request.getParameter("id"));

            user = userDao.getById(userId);


            if(user == null){
                throw new IllegalArgumentException("there is no user with that id");
            }
            request.setAttribute("user",user);

            UserSkillDaoInter userSkillDao = Context.instanceUserSkillDao();
            List<UserSkill> userSkillList = userSkillDao.getAllSkillByUserId(user.getId());
            request.setAttribute("userSkillList",userSkillList);

            EmpHistoryDaoInter empHistoryDao = Context.instanceEmpHistoryDao();
            List<EmpHistory> empHistoryList = empHistoryDao.getAll();
            request.setAttribute("empHistoryList",empHistoryList);

            SkillDaoInter skillDao = Context.instanceSkillDao();
            List<Skill> skillList = skillDao.getAll();
            request.setAttribute("skillList",skillList);

            CountryDaoInter countryDao = Context.instanceCountryDao();
            List<Country> countryList = countryDao.getAll();
            request.setAttribute("countryList",countryList);

            request.getRequestDispatcher("user.jsp").forward(request,response);
        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }

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

        User us = userDao.getById(id);

        // Check if desk parameter exists
        if (request.getParameterMap().containsKey("name")) {
            String name = request.getParameter("name");
            us.setFirstname(name);
        }
        // Check if desk parameter exists
        if (request.getParameterMap().containsKey("surname")) {
            String surname = request.getParameter("surname");
            us.setLastname(surname);
        }

        // Check if profile desk parameter exists
        if (request.getParameterMap().containsKey("profile")) {
            String profile = request.getParameter("profile");
            us.setProfileDescription(profile);
        }

//        us.setFirstname(name);
//        us.setLastname(surname);
        userDao.updateUser(us);
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