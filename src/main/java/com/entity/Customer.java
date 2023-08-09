/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Customer {
    //attributes
    private int id;
    private String fName;
    private String sName;
    private String email;
    private String mobNo;
    private String password;
    
   //FOR AdminLogin
    public Customer() {
        super();
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    //constructor
    public Customer(String fName, String sName, String email,String password,String mobNo ) {
        super();// superclass (parent) objects. It is used to call superclass methods, and to access the superclass constructor. 
        this.fName = fName;
        this.sName = sName;
        this.email = email;
        this.password = password;
        this.mobNo = mobNo;
    }
    
        //constructorwith id
    public Customer(int id, String fName, String sName, String email, String password,String mobNo) {
        super();// superclass (parent) objects. It is used to call superclass methods, and to access the superclass constructor. 
        this.id = id;
        this.fName = fName;
        this.sName = sName;
        this.email = email;
        this.password = password;
        this.mobNo = mobNo;
    }
    
    
    

    //method getter & setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobNo() {
        return mobNo;
    }

    public void setMobNo(String mobNo) {
        this.mobNo = mobNo;
    }
    
    
    
    
    
    
}
