/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Type {
    
    private int id;
    private String type;

    public Type(){
        super();
    }
    
       //constructor ?need?
    public Type(String type) {
        super();
        this.type = type;

    }
    
    //constructor with id
    public Type(int id, String type) {
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
