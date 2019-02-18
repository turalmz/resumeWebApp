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
    <link href="static/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="static/js/script.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">

    <title>User Page</title>
</head>
<%
    User user = (User)request.getAttribute("user");
    List<UserSkill> userSkillList = (List<UserSkill>)request.getAttribute("userSkillList");
    List<EmpHistory> empHistoryList = (List<EmpHistory>)request.getAttribute("empHistoryList");
    List<Skill> skillList = (List<Skill>)request.getAttribute("skillList");
    List<Country> countryList = (List<Country>)request.getAttribute("countryList");

%>
<body>
<div class="container">
    <h1>User details</h1>
    <form action="UserController" method="post">
        <div class="row">

            <input type="hidden"  name="id" value="<%=user.getId()%>">
            <div class="col-6">

                <lablel for="name" >Name:</lablel>
                <input type="text" class="form-control" name="name" value="<%=user.getFirstname()%>">
            </div>
            <div class="col-6">

                <lablel for="surname" >Surname:</lablel>
                <input type="text" class="form-control" name="surname" value="<%=user.getLastname()%>">
            </div>
            <div class="col-6">
                <lablel for="name" ></lablel>

                <input type="submit" value="Save" class="btn btn-primary">
            </div>
        </div>

    </form>

    <div>
        <!-- Tab links -->
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'Profile')">Profile</button>

            <button class="tablinks" onclick="openCity(event, 'Detail')">Detail</button>
            <button class="tablinks" onclick="openCity(event, 'Skill')">Skill</button>
            <button class="tablinks" onclick="openCity(event, 'Emp_History')">Emp History</button>
        </div>

        <!-- Tab content -->
        <div id="Profile" class="tabcontent">
            <h3>Profile</h3>
            <form>
                <div>
                    <textarea name></textarea>

                    <input type="submit" value="Save">
                </div>
            </form>
        </div>

        <div id="Detail" class="tabcontent">
            <div>
                <h3>Detail</h3>
            </div>
            <ul>
                <li>
                    <div>
                        <lablel for="address" >Address:</lablel>
                        <input type="text" name="address">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="phone" >Phone:</lablel>

                        <input type="text" name="phone">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="email" >Email:</lablel>

                        <input type="text" name="email">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="birthday" >Birthday:</lablel>

                        <input type="text" name="birthday">
                    </div>
                </li>

                <li>
                    <div>
                        <lablel for="nationality" >Nationality</lablel>

                        <select name="nationality">

                            <%
                                for(Country country:countryList){
                            %>

                            <option value="<%=country.getId()%>"><%=country.getNatinality()%></option>

                            <%
                                }
                            %>

                        </select>
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="country" >Country:</lablel>

                        <select name="country">

                            <%
                                for(Country country:countryList){
                            %>

                            <option value="<%=country.getId()%>"><%=country.getName()%></option>

                            <%
                                }
                            %>

                        </select>
                    </div>
                </li>
            </ul>


        </div>

        <div id="Skill" class="tabcontent">
            <h3>Skill</h3>
            <div>
                <table class="table" >
                    <thead>
                    <tr>
                        <td>Name</td>
                        <td>Power</td>
                    </tr>
                    </thead>
                    <%
                        for(UserSkill us:userSkillList){
                    %>
                    <thead>
                    <tr>
                        <td><%= us.getSkill().getName() %></td>
                        <td><%= us.getPower() %></td>
                    </tr>
                    </thead>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>

        <div id="Emp_History" class="tabcontent">
            <h3>Emp History</h3>
            <div>
                <table class="table" >
                    <thead>
                    <tr>
                        <td>Header</td>
                        <td>Begin date</td>
                        <td>End date</td>
                        <td>Job description</td>
                    </tr>
                    </thead>
                    <%
                        for(EmpHistory us:empHistoryList){
                    %>
                    <thead>
                    <tr>
                        <td><%= us.getHeader() %></td>
                        <td><%= us.getBeginDate() %></td>
                        <td><%= us.getEndDate() %></td>
                        <td><%= us.getJobDescription() %></td>
                    </tr>
                    </thead>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
