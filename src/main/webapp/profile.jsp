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
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link href="static/css/style.css" rel="stylesheet" type="text/css">

    <title>User Page</title>
</head>
<%
    List<Country> countryList = (List<Country>)request.getAttribute("countryList");
%>
<body>
<jsp:include page="menu.jsp" />
<br>
<div class="container">

    <h1>User details</h1>

    <form action="userdetail" method="post">
        <div class="form-group">
           <lablel for="name" >Name</lablel>
            <input type="text" class="form-control" name="name" id="name" aria-describedby="nameHelp" placeholder="Enter name" value="">
            <small id="nameHelp" class="form-text text-muted">This is your public name.</small>
        </div>
        <div class="form-group">
            <lablel for="surname" >Surname</lablel>
            <input type="text" class="form-control"  name="surname"  id="surname" placeholder="Enter surname" value="">
        </div>

        <button type="button" class="btn btn-primary" onclick="updateUser()">Save</button>
    </form>


    <br>
    <div>
        <!-- Tab links -->
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'Profile')">Profile</button>
            <button class="tablinks" onclick="openCity(event, 'Detail')">Detail</button>
        </div>

        <!-- Tab content -->
        <div id="Profile" class="tabcontent">
            <h3>Profile</h3>
            <form action="userdetail" method="post">
                <input type="hidden"  name="id" value="">

                <div class="form-group">
                    <textarea class="form-control" name="profile" id="profileDet" ></textarea>
                </div>
            </form>
        </div>

        <div id="Detail" class="tabcontent">
            <div>
                <h3>Detail</h3>
            </div>
            <form action="userdetail" method="post" >

                    <div class="form-group">
                        <lablel for="address" >Address:</lablel>
                        <input type="text" class="form-control" id="address" name="address" value="">
                    </div>

                    <div class="form-group">
                        <lablel for="phone" >Phone:</lablel>

                        <input type="text" class="form-control" id="phone" name="phone" value="">
                    </div>
                    <div class="form-group">
                        <lablel for="email" >Email:</lablel>

                        <input type="text" class="form-control" id="email" name="email" value="">
                    </div>
                    <div class="form-group">
                        <lablel for="birthday" >Birthday:</lablel>
                        <div class="input-group date" id="datetimepicker1">
                            <input type="text" class="form-control" id="birthday" name="birthday" value="" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <lablel for="nationality" >Country:</lablel>

                        <select class="form-control"  name="country" id="country" >

                            <%  for(Country country:countryList){ %>

                                <option value="<%=country.getId()%>"><%=country.getName()%></option>
                            <%
                            }
                            %>

                        </select>
                    </div>
                    <div class="form-group">
                        <lablel for="country" >Nationality:</lablel>

                        <select class="form-control" name="nationality" id="nationality" >

                            <% for(Country country:countryList){  %>

                            <option value="<%=country.getId()%>"><%=country.getNatinality()%></option>
                            <%
                                }
                            %>

                        </select>
                    </div>
            </form>


        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure entered data is correct?
            </div>
            <form action="userdetail" method="post">

                <input type="hidden"  name="name" id="nameMain" value="">
                <input type="hidden"  name="surname" id="surnameMain" value="">
                <input type="hidden"  name="profile" id="profileDetMain" value="">
                <input type="hidden"  name="address" id="addressMain" value="">
                <input type="hidden"  name="phone" id="phoneMain" value="">
                <input type="hidden"  name="email" id="emailMain" value="">
                <input type="hidden"  name="birthday" id="birthdayMain" value="">
                <input type="hidden"  name="country"  id="countryMain" value="">
                <input type="hidden"  name="nationality" id="nationalityMain" value="">


                <input type="hidden" name="action" value="add"/>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%--<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>--%>

<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>

<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


<script type="text/javascript" src="static/js/datepicker.js"></script>
<script type="text/javascript" src="static/js/script.js"></script>

</html>
