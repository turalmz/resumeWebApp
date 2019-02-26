/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import at.favre.lib.crypto.bcrypt.BCrypt;
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

    UserDaoInter userDao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user=null;


        if (!request.getParameterMap().containsKey("id")) {
            request.setAttribute("user",user);

            CountryDaoInter countryDao = Context.instanceCountryDao();
            List<Country> countryList = countryDao.getAll();
            request.setAttribute("countryList",countryList);

            request.getRequestDispatcher("profile.jsp").forward(request,response);

        }


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
        }
        catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action="";
        if (request.getParameterMap().containsKey("action")) {
            action = request.getParameter("action");
        }

        System.out.println("action="+action);




        if(action.equalsIgnoreCase("update")) {
            int id = Integer.valueOf(request.getParameter("id"));

            User us = userDao.getById(id);

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

            // get if profile  parameter exists
            String password = request.getParameter("password");

            String bcryptHashString = BCrypt.withDefaults().hashToString(4, password.toCharArray());

            us.setPassword(bcryptHashString);


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
            int id = Integer.valueOf(request.getParameter("id"));

            User us = userDao.getById(id);

            userDao.removeUser(us.getId());
            response.sendRedirect("users");

        }else if(action.equalsIgnoreCase("add")) {
            User us = null;

            us = new User(0);

            // get if name parameter exists
            String name = request.getParameter("name");
            us.setFirstname(name);

            // get if surname parameter exists
            String surname = request.getParameter("surname");
            us.setLastname(surname);

            // get if profile  parameter exists
            String profile = request.getParameter("profile");
            us.setProfileDescription(profile);

            // get if profile  parameter exists
            String password = request.getParameter("password");

            String bcryptHashString = BCrypt.withDefaults().hashToString(4, password.toCharArray());

            us.setPassword(bcryptHashString);

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

            userDao.insertUser(us);

            
            System.out.println("here we are");
            System.out.println("userdetail?id=" + us.getId());

            response.sendRedirect("userdetail?id=" + us.getId());

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}