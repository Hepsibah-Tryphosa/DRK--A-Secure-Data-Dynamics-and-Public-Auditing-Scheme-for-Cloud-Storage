/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.utils;

import com.cloud.SimpleFTPClient;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

/**
 *
 * @author Ramu Maloth
 */
public class StoreFileInCloud {
    static SimpleFTPClient client;
        File file;

    public static void storeInCloud(String cipher,String filename) {
        try {
             InputStream input = getInputStream(cipher, "UTF-8");
             client = new SimpleFTPClient();
            client.setHost("ftp.drivehq.com");
            client.setUser("dpHyd");
            client.setPassword("lx160cm");
            client.setRemoteFile("dph/"+filename+".txt");
            boolean log = client.connect();
            client.uploadFile(input);
             
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static InputStream getInputStream(String str, String encoding) throws UnsupportedEncodingException {
        return new ByteArrayInputStream(str.getBytes(encoding));
    }

}
