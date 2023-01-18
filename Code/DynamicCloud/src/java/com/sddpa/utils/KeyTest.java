/*ing Key
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.utils;

import com.sddpa.crypto.CryptoUtils;
import com.sddpa.crypto.EncryptorAesGcm;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Ramu Maloth
 */
public class KeyTest {

    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";

    public static void main(String[] args) {
        String OUTPUT_FORMAT = "%-30s:%s";
        String encodedKey = "e01f0303fb6ae625a6d4b23b4ecdf76e";
        byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
// rebuild key using SecretKeySpec
       SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
        
        
        String encryptedText = "aac6d30d0dc85a52a40b8c11f8d9353cff827789915f3120c12df25c7da7fbbb6d743c66";
        String decryptedText = null;
        try {
            byte[] ci = encryptedText.getBytes();
            
            //SecretKey oriSecretKey = CryptoUtils.hex(decodedKey);
            //decryptedText = EncryptorAesGcm.decryptWithPrefixIV(ci, originalKey);
            //System.out.println(String.format(OUTPUT_FORMAT, "Decrypted (plain text)", decryptedText));
            
            System.out.println(""+CryptoUtilities.decrypt("PXbfsEbr+/DG/uP9Al0Kbw=="));

            //String decryptedText = EncryptorAesGcm.decryptWithPrefixIV(bla.getBytes(), secretKey);
        } catch (Exception ex) {
            Logger.getLogger(KeyTest.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
