<%-- 
    Document   : AdminActivaUsers
    Created on : Oct 20, 2020, 9:08:39 AM
    Author     : Ramu Maloth
--%>


<%@page import="com.sddpa.db.DBConnections"%>
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
       int id = Integer.parseInt(request.getParameter("id"));
       PreparedStatement ps = null;
       try(Connection con = DBConnections.getDBConnection()) {
           String sqlQuery = "update ownersfiles set cs_status = ? where id = ?";
           ps = con.prepareStatement(sqlQuery);
           ps.setString(1, "Ack Sent");
           ps.setInt(2, id);
           ps.executeUpdate();
           response.sendRedirect("./CSViewData.jsp?msg= Activated user id"+id);
           } catch (Exception e) {
               System.out.println("Error at "+e.getMessage());
           }
  
       %>
    </body>
</html>
