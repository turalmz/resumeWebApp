<%--
    Document   : users
    Created on : Feb 7, 2019, 6:41:00 PM
    Author     : TURAL
--%>

<%@page import="com.company.Context"%>
<%@page import="com.company.dao.inter.UserDaoInter"%>
<%@ page import="com.company.dao.inter.UserSkillDaoInter" %>
<%@ page import="java.util.List" %>
<%@ page import="com.company.dao.inter.EmpHistoryDaoInter" %>
<%@ page import="com.company.dao.inter.SkillDaoInter" %>
<%@ page import="com.company.dao.inter.CountryDaoInter" %>
<%@ page import="com.company.entity.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link href="static/css/style.css" rel="stylesheet" type="text/css">

    <title>Login Page</title>
</head>
<%


%>
<body>
<jsp:include page="menu.jsp" />
<br>
<div class="container">

        <h1>Login</h1>

    <form action="login" method="post">
        <div class="form-group">
            <lablel for="username" >Username</lablel>

            <input type="text" class="form-control" name="email" id="email" aria-describedby="nameHelp" placeholder="Enter username" >
            <small id="nameHelp" class="form-text text-muted">This is your public name.</small>
        </div>
        <div class="form-group">
            <lablel for="password" >Password</lablel>
            <input type="password" class="form-control"  name="password"  id="password" placeholder="Enter password" >
        </div>

        <button type="submit" class="btn btn-primary">Enter</button>
    </form>



</div>
</body>
<script type="text/javascript" src="static/js/script.js"></script>

</html>
