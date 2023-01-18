<%-- 
    Document   : UserLoginCheck
    Created on : Oct 20, 2020, 9:23:10 AM
    Author     : Ramu Maloth
--%>

<%@page import="com.sddpa.db.DBConnections"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String loginid = request.getParameter("loginid");
            String pswd = request.getParameter("pswd");
            PreparedStatement ps = null;
            ResultSet rs = null;
           
            String email = null;
            try (Connection con = DBConnections.getDBConnection()) {
                String sqlQuery = "select email from dataowners where loginid = ? and pswd = ?";
                ps = con.prepareStatement(sqlQuery);
                ps.setString(1, loginid);
                ps.setString(2, pswd);
                rs = ps.executeQuery();
                if (rs.next()) {
                    email = rs.getString("email");
                    session.setAttribute("username", loginid);
                    session.setAttribute("email", email);
                    response.sendRedirect("./DOHome.jsp?msg=success");
                }
                 else {
                    response.sendRedirect("./DataOwnerLogin.jsp?msg=failed");
                }

            } catch (Exception e) {
                System.out.println("Error at "+e.getMessage());
                response.sendRedirect("./DataOwnerLogin.jsp?msg=failed");
            }finally{
            
            }
        %>
    </body>
</html>
