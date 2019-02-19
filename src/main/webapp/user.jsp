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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" >

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link href="static/css/style.css" rel="stylesheet" type="text/css">

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
    <%--<form action="UserController" method="post">--%>
        <%--<div class="row">--%>

            <%--<input type="hidden"  name="id" value="<%=user.getId()%>">--%>
            <%--<div class="col-4">--%>

                <%--<lablel for="name" >Name:</lablel>--%>
                <%--<input type="text" class="form-control" name="name" value="<%=user.getFirstname()%>">--%>
            <%--</div>--%>
            <%--<div class="col-4">--%>

                <%--<lablel for="surname" >Surname:</lablel>--%>
                <%--<input type="text" class="form-control" name="surname" value="<%=user.getLastname()%>">--%>
            <%--</div>--%>
            <%--<div class="col-4">--%>
                <%--<div ><lablel for="name" ><br></lablel></div>--%>
                <%--<div>--%>
                    <%--<input type="submit" value="Save" class="btn btn-primary">--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>


    <%--</form>--%>

    <form action="UserController" method="post">
        <div class="form-group">
            <input type="hidden"  name="id" value="<%=user.getId()%>">
            <lablel for="name" >Name:</lablel>

            <input type="text" class="form-control" id="name" aria-describedby="nameHelp" placeholder="Enter name" value="<%=user.getFirstname()%>">
            <small id="nameHelp" class="form-text text-muted">This is your public name.</small>
        </div>
        <div class="form-group">
            <lablel for="surname" >Surname:</lablel>
            <input type="text" class="form-control" id="surname" placeholder="Enter surname">
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
    </form>


    <br>
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
            <form action="UserController" method="post">
                <div class="form-group">
                    <textarea class="form-control" name="profile" ><%=user.getProfileDescription()%></textarea>

                </div>
            </form>
        </div>

        <div id="Detail" class="tabcontent">
            <div>
                <h3>Detail</h3>
            </div>
            <form >

                    <div class="form-group">
                        <lablel for="address" >Address:</lablel>
                        <input type="text" class="form-control" name="address" value="<%=user.getAddress()%>">
                    </div>

                    <div class="form-group">
                        <lablel for="phone" >Phone:</lablel>

                        <input type="text" class="form-control" name="phone" value="<%=user.getPhone()%>">
                    </div>
                    <div class="form-group">
                        <lablel for="email" >Email:</lablel>

                        <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>">
                    </div>
                    <div class="form-group">
                        <lablel for="birthday" >Birthday:</lablel>
                        <div class="input-group date" id="datetimepicker1">
                            <input type="text" class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <%--<input type="text" id="datetimepicker2" class="form-control" name="birthday" value="<%=user.getBirthDate()%>">--%>
                    </div>
                    <div class="form-group">
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
                    <div class="form-group">
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
            </form>


        </div>

        <div id="Skill" class="tabcontent">
            <h3>Skill</h3>
            <div >
                <form>
                    <div class="form-group">
                        <lablel for="skill" >Skill</lablel>

                        <select class="form-control" name="skill">

                            <%  for(Skill skill:skillList){ %>


                                <option  value="<%=skill.getId()%>"><%=skill.getName()%></option>


                               <% }
                            %>

                        </select>
                    </div>

                    <div class="form-group">

                        <lablel for="power" >Power:</lablel>
                        <input type="text" class="form-control" name="power" value="">
                    </div>
                    <div class="form-group">
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
                    <div class="form-group">
                        <lablel for="header" >Header:</lablel>

                        <input type="text" class="form-control" name="header" value="">
                    </div>
                    <div class="form-group ">
                        <lablel for="description" >Description:</lablel>
                        <input type="text" class="form-control" name="description" value="">
                    </div>
                    <div class="form-group">
                        <lablel for="begin_date" >Begin Date:</lablel>
                        <%--<input type="text" class="form-control" name="begin_date" value="">--%>
                        <div class="input-group date" id="datetimepicker2">
                            <input type="text" class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
                    <div class="form-group">
                        <lablel for="end_date" >End Date:</lablel>
                        <%--<input type="text" class="form-control" name="end_date" value="">--%>
                        <div class="input-group date" id="datetimepicker3">
                            <input type="text" class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="static/js/script.js"></script>

</html>
