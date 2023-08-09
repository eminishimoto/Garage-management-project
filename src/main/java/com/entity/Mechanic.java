/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Mechanic {
   
    private int id;
    private String fName;
    private String sName;
    private String email;
    private String mobNo;
    private String password;
    
    public Mechanic(){
        super();
    }
    //constructor
    public Mechanic(String fName, String sName, String email, String mobNo, String password) {
        super();
        this.fName = fName;
        this.sName = sName;
        this.email = email;
        this.mobNo = mobNo;
        this.password = password;
    }
    
    //constructor with id
    public Mechanic(int id, String fName, String sName, String email, String mobNo, String password) {
        super();
        this.id = id;
        this.fName = fName;
        this.sName = sName;
        this.email = email;
        this.mobNo = mobNo;
        this.password = password;
    }

    
    
    
    //method 
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

    public String getMobNo() {
        return mobNo;
    }

    public void setMobNo(String mobNo) {
        this.mobNo = mobNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    }
    
    
    

