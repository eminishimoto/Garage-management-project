/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */

//id ver
public class Vehicle {
    private int id;
    private int cusId;
    private int typeId;
    private int makerId;
    private String licenceDetail;
    private int engId;
    
    
    public Vehicle(){
        super();
    }
        
    //constructor without id
    public Vehicle(int cusId, int typeId, int makerId, String licenceDetail, int engId) {
        this.cusId = cusId;
        this.typeId = typeId;
        this.makerId = makerId;
        this.licenceDetail = licenceDetail;
        this.engId = engId;
    }
    
    //constructor with id
    public Vehicle(int id, int cusId, int typeId, int makerId, String licenceDetail, int engId) {
        this.id = id;
        this.cusId = cusId;
        this.typeId = typeId;
        this.makerId = makerId;
        this.licenceDetail = licenceDetail;
        this.engId = engId;
    }
    
    
    //method
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getMakerId() {
        return makerId;
    }

    public void setMakerId(int makerId) {
        this.makerId = makerId;
    }

    public String getLicenceDetail() {
        return licenceDetail;
    }

    public void setLicenceDetail(String licenceDetail) {
        this.licenceDetail = licenceDetail;
    }

    public int getEngId() {
        return engId;
    }

    public void setEngId(int engId) {
        this.engId = engId;
    }
       
}




//public class Vehicle {
//    
//    private int id;
//    private String type;
//    private String maker;
//    private String licenceDetail;
//    private String engine;
//    
//    
//    
//    public Vehicle(){
//        super();
//    }
//    
//    //constructor without id
//    public Vehicle(String type, String maker, String licenceDetail, String engine) {
//        this.type = type;
//        this.maker = maker;
//        this.licenceDetail = licenceDetail;
//        this.engine = engine;
//    }    
//            
//    //constructor with id
//    public Vehicle(int id, String type, String maker, String licenceDetail, String engine) {
//        this.id = id;
//        this.type = type;
//        this.maker = maker;
//        this.licenceDetail = licenceDetail;
//        this.engine = engine;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getType() {
//        return type;
//    }
//
//    public void setType(String type) {
//        this.type = type;
//    }
//
//    public String getMaker() {
//        return maker;
//    }
//
//    public void setMaker(String maker) {
//        this.maker = maker;
//    }
//
//    public String getLicenceDetail() {
//        return licenceDetail;
//    }
//
//    public void setLicenceDetail(String licenceDetail) {
//        this.licenceDetail = licenceDetail;
//    }
//
//    public String getEngine() {
//        return engine;
//    }
//
//    public void setEngine(String engine) {
//        this.engine = engine;
//    }
//    
//    
//    
//}
