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

@WebServlet(name = "SkillController" , urlPatterns = ("/skill"))
public class SkillController extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        try{
            SkillDaoInter skillDao = Context.instanceSkillDao();


            List<Skill> list = null;
            list = skillDao.getAll();

            request.setAttribute("list",list);


            request.getRequestDispatcher("skills.jsp").forward(request,response);


        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{


            SkillDaoInter skillDao = Context.instanceSkillDao();
            String userId = request.getParameter("userId");

            String name = request.getParameter("name");
            if(name==""){
                throw new IllegalArgumentException("name is empty");
            }

            Skill sk = new Skill(null,name);

            skillDao.insertSkill(sk);
            response.sendRedirect("userdetail?id="+userId);


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