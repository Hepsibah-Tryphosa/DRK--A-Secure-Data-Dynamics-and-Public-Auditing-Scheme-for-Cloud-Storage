/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.crypto;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import javax.crypto.SecretKey;

/**
 *
 * @author Ramu Maloth
 */
public class MyAES256TestRam {
    
    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";
    private static final int TAG_LENGTH_BIT = 128;
    private static final int IV_LENGTH_BYTE = 12;
    private static final int AES_KEY_BIT = 128 ;
    private static final Charset UTF_8 = StandardCharsets.UTF_8;
    public static void main(String[] args) {
        String plainText = "This is Aweomse Code to test my cyber security";
         try {
            SecretKey secretKey = CryptoUtils.getAESKey(AES_KEY_BIT);
            byte[] iv = CryptoUtils.getRandomNonce(IV_LENGTH_BYTE);

        byte[] encryptedText = EncryptorAesGcm.encryptWithPrefixIV(plainText.getBytes(UTF_8), secretKey, iv);
        String enc = CryptoUtils.hex(encryptedText);
        //System.out.println("Encrypted is "+enc);
        String blbla = "2724f507804303fce12b004d6ebbf89d52b54b602b646d2f3f3cf34b1bfaa0d79b325beb";
       // String decryptedText = EncryptorAesGcm.decryptWithPrefixIV(encryptedText, secretKey);
        String decryptedText = EncryptorAesGcm.decryptWithPrefixIV(blbla.getBytes(), secretKey);
        
             System.out.println("Decrypted Text "+decryptedText);

        } catch (Exception e) {
            e.printStackTrace();
        }
         
    }
    
}
