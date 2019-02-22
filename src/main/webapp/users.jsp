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
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">--%>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" >

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>
    <link href="static/css/style.css" rel="stylesheet" type="text/css">
    <script src="static/js/script.js"></script>
    <script>


    </script>
    <title>Users</title>
</head>



<%
    String name = (String)request.getAttribute("name");
    String surname = (String)request.getAttribute("surname");

    List<User> list =(List<User> ) request.getAttribute("list");;
%>
<body>
<jsp:include page="menu.jsp" />
<br>

<div class="container">
    <h1>User Resume</h1>
    <form action="users" method="post">
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
    <div>
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
                        <input type="hidden" name="action" value="update"/>

                        <button type="submit"  class="btn-table btn-secondary">
                            <i class="fas fa-edit"></i>
                        </button>
                    </form>
                </td>
                <td style="width: 1px">
                    <form action="userdetail" method="post" >
                        <input type="hidden" name="id" value="<%= u.getId()%>"/>
                        <input type="hidden" name="action" value="delete"/>

                        <button type="button" class="btn-table btn-danger" onclick="clickme(<%= u.getId()%>)">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                        <%--<button type="button" class="btn btn-primary alma" >--%>
                            <%--Launch--%>
                        <%--</button>--%>
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
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Selected</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <form action="userdetail" method="post">
                <input type="hidden" name="id" id="deleteId" value=""/>
                <input type="hidden" name="action" value="delete"/>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
<script>

    $(document).ready(function(){

        function clickme(i){
            $("#deleteId").val(i);
        }
    });

</script>
</html>