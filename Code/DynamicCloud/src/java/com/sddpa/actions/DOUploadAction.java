/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.actions;

import com.sddpa.crypto.CryptoUtils;
import com.sddpa.crypto.EncryptorAesGcm;
import com.sddpa.db.DBConnections;
import com.sddpa.rsa.RSAGenerator;
import com.sddpa.utils.CryptoUtilities;
import com.sddpa.utils.StoreFileInCloud;
import com.sddpa.wrapper.FileUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ramu Maloth
 */
@MultipartConfig(maxFileSize = 100000l)
public class DOUploadAction extends HttpServlet {

    private static int AES_KEY_BIT;
    private static int IV_LENGTH_BYTE;
    byte[] iv;
    SecretKey secretKey = null;
    private static Charset UTF_8;

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            super.init(config); //To change body of generated methods, choose Tools | Templates.
            AES_KEY_BIT = 128;
            IV_LENGTH_BYTE = 12;
            iv = CryptoUtils.getRandomNonce(IV_LENGTH_BYTE);
            //secretKey = CryptoUtils.getAESKey(AES_KEY_BIT);
            UTF_8 = StandardCharsets.UTF_8;
        } catch (Exception ex) {
            Logger.getLogger(DOUploadAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part part = request.getPart("file");
        InputStream is = part.getInputStream();
        HttpSession hs = request.getSession();
        InputStreamReader isReader = new InputStreamReader(is);
        //Creating a BufferedReader object
        BufferedReader reader = new BufferedReader(isReader);
        StringBuffer sb = new StringBuffer();
        String str;
        String data = null;
        while ((str = reader.readLine()) != null) {
            sb.append(str);
        }
        data = sb.toString();
        String OUTPUT_FORMAT = "%-30s:%s";
        try {
            secretKey = CryptoUtils.getAESKey(AES_KEY_BIT);
            System.out.println("Secret Key " + secretKey);
            String encodedKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
            System.out.println("Secret Key is = " + encodedKey);
            byte[] encryptedText = EncryptorAesGcm.encryptWithPrefixIV(data.getBytes(UTF_8), secretKey, iv);

            //System.out.println("\n------ AES GCM Encryption ------");
            // System.out.println(String.format(OUTPUT_FORMAT, "Input (plain text)", data));
            System.out.println(String.format(OUTPUT_FORMAT, "Key (hex)", CryptoUtils.hex(secretKey.getEncoded())));
            //System.out.println(String.format(OUTPUT_FORMAT, "IV  (hex)", CryptoUtils.hex(iv)));
            System.out.println(String.format(OUTPUT_FORMAT, "Encrypted (hex) ", CryptoUtils.hex(encryptedText)));
            //System.out.println(String.format(OUTPUT_FORMAT, "Encrypted (hex) (block = 16)", CryptoUtils.hexWithBlockSize(encryptedText, 16)));
            //StoreFileInCloud.storeInCloud(CryptoUtils.hex(encryptedText), CryptoUtils.hex(secretKey.getEncoded()));
            // System.out.println("\n------ AES GCM Decryption ------");
            //System.out.println(String.format(OUTPUT_FORMAT, "Input (hex)", CryptoUtils.hex(encryptedText)));
            // System.out.println(String.format(OUTPUT_FORMAT, "Input (hex) (block = 16)", CryptoUtils.hexWithBlockSize(encryptedText, 16)));
            System.out.println(String.format(OUTPUT_FORMAT, "Key (hex)", CryptoUtils.hex(secretKey.getEncoded())));

            String decryptedText = EncryptorAesGcm.decryptWithPrefixIV(encryptedText, secretKey);

            System.out.println(String.format(OUTPUT_FORMAT, "Decrypted (plain text)", decryptedText));

        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement ps = null;
        try(Connection con = DBConnections.getDBConnection()) {
            RSAGenerator rsa = new RSAGenerator(64);
            
            String c_crypto_data = CryptoUtilities.encrypt(data);
           // Storing File in DriveHQ Cloud Server
            //StoreFileInCloud.storeInCloud(CryptoUtils.hex(c_crypto_data.getBytes()), CryptoUtils.hex(secretKey.getEncoded()));
            System.out.println("Data =" + c_crypto_data);
            
            BigInteger private_key = rsa.getPrivateKey().getComponent();
            BigInteger public_key  = rsa.getPublicKey().getComponent();
            String secretkey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
            String shaHexKey = CryptoUtils.hex(secretKey.getEncoded());
            int data_length = data.length();
            String email = hs.getAttribute("email").toString();
            String ownername = hs.getAttribute("username").toString();
            String fileName = part.getSubmittedFileName();
            String cs_status = "waiting";
            
            String sql_query = "insert into ownersfiles(ownername,email,privatekey,publickey,secretkey,hexkey,filename,datalength,data,cs_status) values(?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql_query);
            ps.setString(1, ownername);
            ps.setString(2, email);
            ps.setLong(3, private_key.longValue());
            ps.setLong(4, public_key.longValue());
            ps.setString(5, secretkey);
            ps.setString(6, shaHexKey);
            ps.setString(7, fileName);
            ps.setInt(8, data_length);
            ps.setString(9,c_crypto_data);
            ps.setString(10,cs_status);
            ps.executeUpdate();            
            response.sendRedirect("DOUploadFile.jsp?msg=success");
            
            
            
            //System.out.println("In The Server Secret Ket " + secretKey.toString());
            //String cipher = FileUtils.encryptData(data, secretKey, iv);
            //String plain = FileUtils.decryptData(cipher, secretKey);

            // System.out.println("Cipher Blocks " + cipher);
            // System.out.println("Plain Data " + plain);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DOUploadFile.jsp?msg=failed");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
