/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author emi
 */
public class Booking {
      //attributes
    private int id;
    private int cusId;
    private int vehiId;
    private String date;
    private int mechaId;
    private int statusId;  
//     private Integer mechaId; //Integer allows null value, for CustomerBooking.java servlet
//    private Integer statusId;
    private int serviceId;
    private String comment;

    public Booking() {
        super();
    }
  
    //int mechaId/int statusId will be set later stage.
        public Booking(int cusId, int vehiId, String date,  int serviceId,  String comment) {
        super();
        this.cusId = cusId;
        this.vehiId = vehiId;
        this.date = date;
        this.serviceId = serviceId;
        this.comment= comment;
    }

    

    public Booking(int cusId, int vehiId, String date, int mechaId, int statusId, int serviceId,  String comment) {
        super();
        this.cusId = cusId;
        this.vehiId = vehiId;
        this.date = date;
        this.mechaId = mechaId;
        this.statusId = statusId;
        this.serviceId = serviceId;
        this.comment= comment;
    }
    
    //all
    public Booking(int id, int cusId, int vehiId, String date, int mechaId, int statusId, int serviceId,  String comment) {
        super();
        this.id = id;
        this.cusId = cusId;
        this.vehiId = vehiId;
        this.date = date;
        this.mechaId = mechaId;
        this.statusId = statusId;
        this.serviceId = serviceId ;
        this.comment  =comment ;
    }
    
    

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

    public int getVehiId() {
        return vehiId;
    }

    public void setVehiId(int vehiId) {
        this.vehiId = vehiId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getMechaId() {
        return mechaId;
    }

    public void setMechaId(int mechaId) {
        this.mechaId = mechaId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


    
     
    
    
}

