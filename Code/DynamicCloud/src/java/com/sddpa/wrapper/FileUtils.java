/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.wrapper;

import com.sddpa.crypto.CryptoUtils;
import com.sddpa.crypto.EncryptorAesGcm;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import javax.crypto.SecretKey;

/**
 *
 * @author Ramu Maloth
 */
public class FileUtils {

    //private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";
   // private static final int TAG_LENGTH_BIT = 128;
    //private static final int IV_LENGTH_BYTE = 12;
   // private static final int AES_KEY_BIT = 128;
    private static final Charset UTF_8 = StandardCharsets.UTF_8;

    public static String encryptData(String data,SecretKey secretKey, byte[] iv) {
        String enc = null;
        try {
            //SecretKey secretKey = CryptoUtils.getAESKey(AES_KEY_BIT);
            //byte[] iv = CryptoUtils.getRandomNonce(IV_LENGTH_BYTE);
            byte[] encryptedText = EncryptorAesGcm.encryptWithPrefixIV(data.getBytes(UTF_8), secretKey, iv);
            enc = CryptoUtils.hex(encryptedText);
            //System.out.println("Encrypted is "+enc);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return enc;
    }

    public static String decryptData(String cipher,SecretKey secretKey) {
        String decryptedText = null;
        try {
            //SecretKey secretKey = CryptoUtils.getAESKey(AES_KEY_BIT);
            decryptedText = EncryptorAesGcm.decryptWithPrefixIV(cipher.getBytes(), secretKey);

            System.out.println("Decrypted Text " + decryptedText);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decryptedText;
    }

}
