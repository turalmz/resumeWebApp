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

@WebServlet(name = "UserListController" , urlPatterns = ("/users"))
public class UserListController extends HttpServlet {

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


        try{
            UserDaoInter userDao = Context.instanceUserDao();

            String name = request.getParameter("name");
            if(name==""){
                name = null;
            }
            String surname = request.getParameter("surname");

            if(surname==""){
                surname = null;
            }

            List<User> list = null;
            list = userDao.getAll(name,surname,null);

            request.setAttribute("list",list);
            if(name==null){
                request.setAttribute("name","");
            }else {
                request.setAttribute("name", name);
            }
            if(surname==null) {
                request.setAttribute("surname", "");
            }else{
                request.setAttribute("surname", surname);

            }

            request.getRequestDispatcher("users.jsp").forward(request,response);


        }catch (Exception ex){
            response.sendRedirect("error?msg="+ex.getMessage());
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{


            String name = request.getParameter("name");
            if(name==""){
                name = null;
            }
            String surname = request.getParameter("surname");

            if(surname==""){
                surname = null;
            }

            List<User> list = null;
            list = userDao.getAll(name,surname,null);

            request.setAttribute("list",list);
            if(name==null){
                request.setAttribute("name","");
            }else {
                request.setAttribute("name", name);
            }
            if(surname==null) {
                request.setAttribute("surname", "");
            }else{
                request.setAttribute("surname", surname);

            }
            request.getRequestDispatcher("users.jsp").forward(request,response);


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