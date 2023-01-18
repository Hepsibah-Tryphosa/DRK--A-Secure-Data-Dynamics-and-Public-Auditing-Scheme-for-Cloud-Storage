/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sddpa.rsa;

/**
 *
 * @author Ramu Maloth
 */
import java.math.BigInteger;


/**
 * Test Section of RSA Generator
 * @author obikag
 * @since 2013-06-22
 */
public class RSATest {
  public static void main(String[] args) throws Exception{
		//Create a new RSA Generator Object of 64 bit length
		RSAGenerator rsa_gen = new RSAGenerator(64);
                
		//Create a message to encrypt
		String msg = "This is a test!!";
		//Encrypt message
		String encrypted = rsa_gen.encrypt(msg).toString();
		//Decrypt message
		BigInteger decrypt = rsa_gen.decrypt(new BigInteger(encrypted));
		String decrypted = "";
		//BigInteger must be converted to a byte array in order to rebuild the original message
		for(byte b: decrypt.toByteArray()){
			decrypted += (char) b;
		}
		System.out.println("Original Message: "+msg);
		System.out.println(rsa_gen.toString());
		System.out.println("Encrypted: "+encrypted);
		System.out.println("Decrypted: "+decrypted);
                
                Key prvt_key = rsa_gen.getPrivateKey();
                Key pblc_key = rsa_gen.getPublicKey();
                
                System.out.println("Private Key "+prvt_key.getComponent());
                System.out.println("Public Key "+pblc_key.getComponent());
		
		
	}
}
