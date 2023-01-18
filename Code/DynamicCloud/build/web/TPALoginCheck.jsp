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
            if (cloudname.equals("TPA") && pswd.equals("TPA")) {
                response.sendRedirect("TPAHome.jsp?msg=success");
            } else if (cloudname.equals("tpa") && pswd.equals("tpa")) {
                response.sendRedirect("TPAHome.jsp?msg=success");
            } else {
                response.sendRedirect("TPALogin.jsp?msg=failed");
            }
        %>
    </body>
</html>
