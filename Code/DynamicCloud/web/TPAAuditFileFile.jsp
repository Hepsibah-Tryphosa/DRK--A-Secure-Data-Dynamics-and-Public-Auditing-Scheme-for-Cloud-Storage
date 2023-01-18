<%-- 
    Document   : TPAAuditFileFile
    Created on : Nov 2, 2020, 3:02:50 PM
    Author     : Ramu Maloth
--%>

<%@page import="com.sddpa.db.DBConnections"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sddpa.utils.Md5Auditutiliy"%>
<%@page import="java.util.List"%>
<%@page import="com.sddpa.crypto.CryptoUtils"%>
<%@page import="com.sddpa.utils.StoreFileInCloud"%>
<%@page import="com.sddpa.utils.CryptoUtilities"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="com.sddpa.utils.MD5Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int fileid = Integer.parseInt(request.getParameter("fileid"));
        String data = request.getParameter("data");
        String md5_data = data.substring(0, 32);
        Charset UTF_8 = StandardCharsets.UTF_8;
        byte[] md5InBytes = MD5Utils.digest(md5_data.getBytes(UTF_8));
        String md5_key = MD5Utils.bytesToHex(md5InBytes);
        System.out.println("MD5 (hex) "+ md5_key);
        String c_crypto_data = CryptoUtilities.encrypt(data);
        //Drive hq Update Codes
        //StoreFileInCloud.storeInCloud(CryptoUtils.hex(c_crypto_data.getBytes()), CryptoUtils.hex(md5_key.getBytes()));
        
        List list = Md5Auditutiliy.getOwnerDetails(fileid);
        String ownername = (String)list.get(0);
        String email = (String)list.get(1);
        String publickey = (String)list.get(2);
        String filename = (String)list.get(3);
        java.sql.Date c_date = new java.sql.Date(new java.util.Date().getTime());
        System.out.println("owner name "+ownername);
        int data_length = data.length();
        PreparedStatement ps = null;
        try(Connection con = DBConnections.getDBConnection()) {
            String updateQuery ="update ownersfiles set data = ?,datalength = ? where id = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, c_crypto_data);
            ps.setInt(2, data_length);
            ps.setInt(3, fileid);
            ps.executeUpdate();
            String sqlQuery = "insert into tpaaudit(ownername,email,publickey,filename,md5hash,fileid,auiditdate) values(?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, ownername);
            ps.setString(2, email);
            ps.setString(3, publickey);
            ps.setString(4, filename);
            ps.setString(5, md5_key);
            ps.setInt(6, fileid);
            ps.setDate(7, c_date);
            ps.executeUpdate();
            response.sendRedirect("TPAGetFile.jsp?msg=success");
            } catch (Exception e) {
                System.out.println("Error at Updating Cipher Data "+e.getMessage());
            }
         
        

        
        %>
    </body>
</html>
