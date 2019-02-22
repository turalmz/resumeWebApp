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
@WebServlet(name = "UserDetailController" , urlPatterns = ("/userdetail"))
public class UserDetailController extends HttpServlet {

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
        String action="";
        if (request.getParameterMap().containsKey("action")) {
            action = request.getParameter("action");
        }

        System.out.println("action="+action);

        User us = userDao.getById(id);


        /*
                name="name"  user.getFirstname()
                name="surname" user.getLastname()
                name="profile" user.getProfileDescription()
                name="address" user.getAddress()
                name="phone" user.getPhone()
                name="email" user.getEmail()
                name="birthday" user.getBirthDate()
                name="country"  user.getBirthPlace().getId()
                name="nationality" user.getNationality().getId()

         */


        if(action.equalsIgnoreCase("update")) {
            // get if name parameter exists
            String name = request.getParameter("name");
            us.setFirstname(name);

            // get if surname parameter exists
            String surname = request.getParameter("surname");
            us.setLastname(surname);

            // get if profile  parameter exists
            String profile = request.getParameter("profile");
            us.setProfileDescription(profile);

            // get if address parameter exists
            String address = request.getParameter("address");
            us.setAddress(address);

            // get if phone parameter exists
            String phone = request.getParameter("phone");
            us.setPhone(phone);

            // get if email parameter
            String email = request.getParameter("email");
            us.setEmail(email);

            int countryId = Integer.valueOf(request.getParameter("country"));
            us.setBirthPlace(new Country(countryId));

            int nationalityId = Integer.valueOf(request.getParameter("nationality"));
            us.setNationality(new Country(nationalityId));

            userDao.updateUser(us);
            System.out.println("here we are");

            response.sendRedirect("userdetail?id=" + us.getId());

        }else if(action.equalsIgnoreCase("delete")){

            userDao.removeUser(us.getId());
            response.sendRedirect("users");

        }
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