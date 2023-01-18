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

public class Key {

  private BigInteger component; //Component
	private BigInteger modulus; //Modulus
	
	/**
	 * Object Constructor
	 * @param component Component of Key
	 * @param modulus Modulus
	 */
	Key(BigInteger component, BigInteger modulus){
		this.component = component;
		this.modulus = modulus;
	}
	
	/**
	 * Method used to return the Component of the Key
	 * @return BigInteger value of key's Component
	 */
	public BigInteger getComponent(){
		return component;
	}
	
	/**
	 * Method used to return the Modulus
	 * @return BigInteger value of Modulus
	 */
	public BigInteger getModulus(){
		return modulus;
	}
	
	/**
	 * Prints to screen Key Information
	 */
	@Override
	public String toString(){
		return "Component: "+component+" / Modulus: "+modulus;
	}
}
