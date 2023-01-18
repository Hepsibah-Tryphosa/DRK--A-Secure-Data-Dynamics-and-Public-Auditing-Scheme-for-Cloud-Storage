/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.utils;

import com.sddpa.db.DBConnections;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ramu Maloth
 */
public class Md5Auditutiliy {

    private static  PreparedStatement ps = null;
    private static ResultSet rs = null;

    public static List getOwnerDetails(int fileid) {
        List list = new ArrayList();
        try (Connection con = DBConnections.getDBConnection()){
            String sqlQuery = "select ownername,email, publickey,filename from ownersfiles where id = ?";
            ps = con.prepareStatement(sqlQuery);
            ps.setInt(1, fileid);
            rs = ps.executeQuery();
            if(rs.next()){
            list.add(rs.getString("ownername"));
            list.add(rs.getString("email"));
            list.add(rs.getString("publickey"));
            list.add(rs.getString("filename"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
