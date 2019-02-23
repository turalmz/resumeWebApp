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
@WebServlet(name = "CountryController" , urlPatterns = ("/country"))
public class CountryController extends HttpServlet {

    UserDaoInter userDao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CountryDaoInter countryDao = Context.instanceCountryDao();
        List<Country> list = countryDao.getAll();
        request.setAttribute("list",list);
        try{

            request.getRequestDispatcher("country.jsp").forward(request,response);
        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CountryDaoInter countryDao = Context.instanceCountryDao();

        String action="";
        if (request.getParameterMap().containsKey("action")) {
            action = request.getParameter("action");
        }

        try{

            if(action.equals("add")){

                String countryName = request.getParameter("countryName");
                if(countryName==""){
                    throw new IllegalArgumentException("Country name is empty");
                }

                String nationalityName = request.getParameter("nationalityName");
                if(nationalityName==""){
                    throw new IllegalArgumentException("Nationality is empty");
                }
                Country country = new Country(null,countryName,nationalityName);
                countryDao.insertCountry(country);

            }else if(action.equals("delete")){

                Integer id = Integer.valueOf(request.getParameter("id"));

                countryDao.removeCountry(id);

            }

            response.sendRedirect("country");


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