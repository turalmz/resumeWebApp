<%--
    Document   : users
    Created on : Feb 7, 2019, 6:41:00 PM
    Author     : TURAL
--%>

<%@page import="com.company.entity.User"%>
<%@page import="com.company.Context"%>
<%@page import="com.company.dao.inter.UserDaoInter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="static/css/users.css" rel="stylesheet" type="text/css">

    <title>Users</title>
</head>
<%
    String name = (String)request.getAttribute("name");
    String surname = (String)request.getAttribute("surname");

    List<User> list =(List<User> ) request.getAttribute("list");;
%>
<body>
<div class="container">
<h1>User Resume</h1>
<form action="userdetail" method="post">
<div class="form-group">
    <div class="form-group">
        <lablel for="name" >Name:</lablel>
        <input type="text" class="form-control" name="name" value="<%=name%>">
    </div>
    <br/>
    <div class="form-group">
        <lablel for="surname" >Surname:</lablel>
        <input type="text" class="form-control" name="surname" value="<%=surname%>">
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" value="Search"/>
    </div>
</div>
</form>



<!-- Tab content -->
<div id="Profile" class="tabcontent">
    <table class="table" >
        <thead>
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Nationality</th>
            <th style="width: 1px"></th>
            <th style="width: 1px"></th>
        </tr>
        </thead>
        <tbody>
        <%
        for(User u:list){
        %>

        <tr>
            <td><%=u.getFirstname()%></td>
            <td><%=u.getLastname()%></td>
            <td><%=u.getNationality().getNatinality()%></td>
            <td style="width: 1px">
                <form action="userdetail" method="get">
                    <input type="hidden" name="id" value="<%= u.getId()%>"/>

                    <button type="submit" name="action" class="btn-table btn-secondary" value="update">
                        <i class="fas fa-edit"></i>
                    </button>
                </form>
            </td>
            <td style="width: 1px">
                <form action="userdetail" method="get" >
                    <button type="submit" name="action"  class="btn-table btn-danger"  value="delete">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </form>

            </td>
        </tr>
        <%
            }
        %>
        </tbody>

    </table>
</div>




</div>
</body>
</html>