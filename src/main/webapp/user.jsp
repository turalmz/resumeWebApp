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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

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
                    <textarea class="form-control" name="profile" ><%=user.getProfileDescription()%></textarea>

                </div>
            </form>
        </div>

        <div id="Detail" class="tabcontent">
            <div>
                <h3>Detail</h3>
            </div>
            <form class="form-group">
            <div class="row">
            <ul>
                <li>
                    <div>
                        <lablel for="address" >Address:</lablel>
                        <input type="text" class="form-control" name="address" value="<%=user.getAddress()%>">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="phone" >Phone:</lablel>

                        <input type="text" class="form-control" name="phone" value="<%=user.getPhone()%>">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="email" >Email:</lablel>

                        <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>">
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="birthday" >Birthday:</lablel>

                        <input type="text" class="form-control" name="birthday" value="<%=user.getBirthDate()%>">
                    </div>
                </li>

                <li>
                    <div>
                        <lablel for="nationality" >Nationality</lablel>

                        <select class="form-control" name="nationality">

                            <%  for(Country country:countryList){ %>
                            <%        if(country.getId()==user.getBirthPlace().getId()){ %>


                                <option selected value="<%=country.getId()%>"><%=country.getNatinality()%></option>

                            <%  }else{ %>
                                <option value="<%=country.getId()%>"><%=country.getNatinality()%></option>
                            <%
                                }
                            }
                            %>

                        </select>
                    </div>
                </li>
                <li>
                    <div>
                        <lablel for="country" >Country:</lablel>

                        <select class="form-control" name="country">

                            <% for(Country country:countryList){  %>
                            <%        if(country.getId()==user.getNationality().getId()){ %>


                            <option selected value="<%=country.getId()%>"><%=country.getNatinality()%></option>

                            <%  }else{ %>
                            <option value="<%=country.getId()%>"><%=country.getNatinality()%></option>
                            <%
                                    }
                                }
                            %>

                        </select>
                    </div>
                </li>
            </ul>
            </div>
            </form>


        </div>

        <div id="Skill" class="tabcontent">
            <h3>Skill</h3>
            <div >
                <form>
                    <div class="col-6">
                        <lablel for="skill" >Skill</lablel>

                        <select class="form-control" name="skill">

                            <%  for(Skill skill:skillList){ %>


                                <option  value="<%=skill.getId()%>"><%=skill.getName()%></option>


                               <% }
                            %>

                        </select>
                    </div>

                    <div class="col-6">

                        <lablel for="power" >Power:</lablel>
                        <input type="text" class="form-control" name="power" value="">
                    </div>
                    <div class="col-6">
                        <lablel for="name" ></lablel>

                        <input type="submit" value="Save" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div>
                <table class="table" >
                    <thead>
                    <tr>
                        <td>Name</td>
                        <td>Power</td>
                        <td></td>

                    </tr>
                    </thead>
                    <%
                        for(UserSkill us:userSkillList){
                    %>
                    <thead>
                    <tr>
                        <td><%= us.getSkill().getName() %></td>
                        <td><%= us.getPower() %></td>
                        <td>
                            <form action="userdetail" method="post" >
                                <button type="submit" name="action"  class="btn-table btn-danger"  value="delete">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>

                        </td>
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
            <div >
                <form>
                    <div class="col-6">
                        <lablel for="header" >Header:</lablel>

                        <input type="text" class="form-control" name="header" value="">
                    </div>
                    <div class="col-6">
                        <lablel for="description" >Description:</lablel>
                        <input type="text" class="form-control" name="description" value="">
                    </div>
                    <div class="col-6">
                        <lablel for="begin_date" >Begin Date:</lablel>
                        <input type="text" class="form-control" name="begin_date" value="">
                    </div>
                    <div class="col-6">
                        <lablel for="end_date" >End Date:</lablel>
                        <input type="text" class="form-control" name="end_date" value="">
                    </div>
                    <div class="col-6">
                        <lablel for="name" ></lablel>

                        <input type="submit" value="Save" class="btn btn-primary">
                    </div>
                </form>
            </div>
            <div>
                <table class="table" >
                    <thead>
                    <tr>
                        <td>Header</td>
                        <td>Begin date</td>
                        <td>End date</td>
                        <td>Job description</td>
                        <td></td>
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
                        <td >
                            <form action="userdetail" method="post" >
                                <button type="submit" name="action"  class="btn-table btn-danger"  value="delete">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>

                        </td>
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
