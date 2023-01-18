<%-- 
    Document   : logout
    Created on : Oct 30, 2020, 12:01:44 PM
    Author     : Ramu Maloth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
