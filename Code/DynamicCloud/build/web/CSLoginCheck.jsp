<%-- 
    Document   : CSLoginCheck
    Created on : Nov 2, 2020, 10:24:23 AM
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
            String cloudname = request.getParameter("loginid");
            String pswd = request.getParameter("pswd");
            if (cloudname.equals("Admin") && pswd.equals("Admin")) {
                response.sendRedirect("CSHome.jsp?msg=success");
            } else if (cloudname.equals("Cloud") && pswd.equals("Cloud")) {
                response.sendRedirect("CSHome.jsp?msg=success");
            } else {
                response.sendRedirect("CSLogin.jsp?msg=failed");
            }
        %>
    </body>
</html>
