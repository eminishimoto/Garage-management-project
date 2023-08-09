/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Maker {
    
    private int id;
    private String maker;

    public Maker(){
        super();
    }
    
        //constructor ?need?
    public Maker(String maker) {
        super();
        this.maker = maker;

    }
    
    //constructor with id
    public Maker(int id, String maker) {
        super();
        this.id = id;
        this.maker = maker;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }
    
    
    
}
