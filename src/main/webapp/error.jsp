<html>
<body>
<h2>

<%
    if (request.getAttribute("msg") == null) {
        out.println("Why are you here?");
    } else {
        out.println(""+request.getAttribute("msg")+"");
    }
%>
</h2>
</body>
</html>
