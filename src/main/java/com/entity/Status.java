/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Status {
    
 private int id;
 private String status;

    public Status (){
        super();
    }
    //constructor ?need?
//    public Service(String type) {
//        super();
//        this.type = type;
//
//    }
    
    //constructor with id
    public Status (int id, String status) {
        super();
        this.id = id;
        this.status = status;

    }
    
    
    //method 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}

