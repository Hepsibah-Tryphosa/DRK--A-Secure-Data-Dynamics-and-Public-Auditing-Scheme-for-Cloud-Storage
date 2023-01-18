/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.crypto;

/**
 *
 * @author Ramu Maloth
 */
public class AES256Test {

    private static String secretKey = "boooooooooom!!!!";
    private static String salt = "ssshhhhhhhhhhh!!";

    public static void main(String[] args) {

        String originalString = "howtodoinjava.com";

        String encryptedString = MyAES256.encrypt(originalString, secretKey);
        String decryptedString = MyAES256.decrypt(encryptedString, secretKey);

        System.out.println(originalString);
        System.out.println(encryptedString);
        System.out.println(decryptedString);
    }
}
