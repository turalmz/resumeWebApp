/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.resume;

import com.company.Context;
import com.company.dao.inter.*;
import com.company.entity.*;
import com.company.util.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author TURAL
 */
@WebServlet(name = "EmHistoryController" , urlPatterns = ("/emphistory"))
public class EmHistoryController extends HttpServlet {


    UserDaoInter userDao = Context.instanceUserDao();


//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer id = null;

        if (request.getParameterMap().containsKey("id")) {
            id = Integer.valueOf(request.getParameter("id"));
        }

        Integer empHistoryId = null;

        if (request.getParameterMap().containsKey("empHistoryId")) {
            empHistoryId = Integer.valueOf(request.getParameter("empHistoryId"));
        }

        String action="";
        if (request.getParameterMap().containsKey("action")) {
            action = request.getParameter("action");
        }
        EmpHistoryDaoInter empHistoryDao = Context.instanceEmpHistoryDao();
        UserDaoInter userDao = Context.instanceUserDao();


        if(action.equalsIgnoreCase("update")) {
            System.out.println("update");

            EmpHistory eh = empHistoryDao.getById(empHistoryId);

            String header="";
            if (request.getParameterMap().containsKey("header")) {
                header = request.getParameter("header");
                eh.setHeader(header);
            }

            String description="";
            if (request.getParameterMap().containsKey("description")) {
                description = request.getParameter("description");
                eh.setJobDescription(description);
            }

            String beginDate="";
            Date bDate = new Date(0);

            if (request.getParameterMap().containsKey("beginDate")) {
                beginDate = request.getParameter("beginDate");
                bDate = Converter.convertToDate(beginDate,"dd/MM/yyyy");
                eh.setBeginDate(bDate);

            }

            String endDate="";
            Date eDate = new Date(0);
            if (request.getParameterMap().containsKey("endDate")) {
                endDate = request.getParameter("endDate");
                eDate = Converter.convertToDate(endDate,"dd/MM/yyyy");
                eh.setEndDate(eDate);
            }
            empHistoryDao.updateEmpHistory(eh);

            response.sendRedirect("userdetail?id="+id);


        }else if(action.equalsIgnoreCase("delete")){
            System.out.println("delete");

            EmpHistory empHistory = empHistoryDao.getById(empHistoryId);

            empHistoryDao.removeEmpHistory(empHistory.getId());
            response.sendRedirect("userdetail?id="+id);


        }else if(action.equalsIgnoreCase("insert")){

            System.out.println("insert");

            String header="";
            if (request.getParameterMap().containsKey("header")) {
                header = request.getParameter("header");
            }

            String description="";
            if (request.getParameterMap().containsKey("description")) {
                description = request.getParameter("description");
            }

            String beginDate="";
            Date bDate = new Date(0);
            if (request.getParameterMap().containsKey("beginDate")) {
                beginDate = request.getParameter("beginDate");
                bDate = Converter.convertToDate(beginDate,"dd/MM/yyyy");

            }


            String endDate="";
            Date eDate = new Date(0);
            if (request.getParameterMap().containsKey("endDate")) {
                endDate = request.getParameter("endDate");
                eDate = Converter.convertToDate(endDate,"dd/MM/yyyy");
            }

            EmpHistory eh = new EmpHistory(null,userDao.getById(id),header,bDate,eDate,description);

            empHistoryDao.insertEmpHistory(eh);
            response.sendRedirect("userdetail?id="+id);

        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}