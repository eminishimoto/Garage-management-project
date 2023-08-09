/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.db.gersgarage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
/**
 *
 * @author emi
 */

public class SQLconnect {
       private static Connection conn;
        public static Connection getConn() {
        try {
            //load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");  //cj?
            //get database connection with "gersgarage" in mysql
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gersgarage", "root", "root");

        } catch (Exception e) {
            e.printStackTrace();
        } 
        return conn;          
    }
}

//public class SQLconnect {
//        public static void main(String[] args) {
//        // TODO code application logic here
//        
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gersgarage", "root", "root");
//
//            System.out.println("Connected to DB...");
//            System.out.println(con); 
//
//            Statement stmt = con.createStatement(); //we can us
//
//
//        } catch (SQLException e) {
//
//            System.out.println("SQL Error --> ");
//            System.out.println(e.getMessage());
//            System.out.println(e.getSQLState());
//        } catch (ClassNotFoundException e) {
//
//            System.out.println("Class not found");
//        }
//        
//    }
//}
    

