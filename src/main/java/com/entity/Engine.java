/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Engine {
    private int id;
    private String type;

    public Engine() {
        super();
    }

    public Engine(String type) {
        this.type = type;
    }

    public Engine(int id, String type) {
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
