/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
//private?
public class Service {
    
    private int id;
    private String type;

    public Service(){
        super();
    }
    //constructor ?need?
//    public Service(String type) {
//        super();
//        this.type = type;
//
//    }
    
    //constructor with id
    public Service(int id, String type) {
        super();
        this.id = id;
        this.type = type;

    }
    
    
    //method 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
