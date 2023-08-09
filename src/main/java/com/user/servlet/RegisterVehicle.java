/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.VehicleDao;
import com.db.gersgarage.SQLconnect;
import com.entity.Vehicle;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.regex.Pattern;
/**
 *
 * @author emi
 */

//from action in customer_vehicle.jsp
@WebServlet("/registerVehicle")
public class RegisterVehicle extends HttpServlet {
    
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        try{
            //customer id もいる？
//            String type=req.getParameter("type"); //name from customer_vehicle.jsp
//            String maker=req.getParameter("maker");
//            String licenceDetail=req.getParameter("licencedetail"); 
//            String engine=req.getParameter("engine"); 
            
           int cusId=Integer.parseInt(req.getParameter("cus")); //name from customer_vehicle.jsp
            int typeId=Integer.parseInt(req.getParameter("type")); //name from customer_vehicle.jsp
            int makerId=Integer.parseInt(req.getParameter("maker"));
            String licenceDetail = req.getParameter("licencedetail");
            int engId=Integer.parseInt(req.getParameter("engine")); 
            
            
            VehicleDao vehicleDao = new VehicleDao(SQLconnect.getConn());
        //register licence no. unique & letter validation
        // validation
           
            boolean isValidFormat = vehicleDao.isValidFormat(licenceDetail);
            boolean isUniqueLicenceDetail = vehicleDao.isUniqueLicenceDetail(licenceDetail);

           if (!isValidFormat) {
                // Password format is not valid, show error message and redirect back to the form
                HttpSession session = req.getSession();
                session.setAttribute("errorMsg", "LicenceDetail must have first 2 letters as numbers, then alphabets, and last 4 as numbers (total 7 letters).");
                resp.sendRedirect("customer_vehicle.jsp");
                return;
            }

            if (!isUniqueLicenceDetail) {
                // if licenee is not unique, show error message and redirect back to the form
                HttpSession session = req.getSession();
                session.setAttribute("errorMsg", "LicenceDetail is already used. Please maek sure of your LicenceDetail .");
                resp.sendRedirect("customer_vehicle.jsp");
                return;
            }


            
            
                                       //  from vehicle.java
//            Vehicle v = new Vehicle(type, maker, licenceDetail, engine);
              Vehicle v = new Vehicle(cusId,typeId,makerId,licenceDetail,engId);

              // Get the connection from SQLconnect.getConn()
//            Connection conn = SQLconnect.getConn();

           VehicleDao dao=new VehicleDao(SQLconnect.getConn());
           

            HttpSession session = req.getSession();
            boolean f = dao.registerVehicle(v);
          
           
//           ???あってる?
//       if(dao.registerVehicle(v))
          if(f)
           {
//            HttpSession session = req.getSession();
               //set message                     
              session.setAttribute("succMsg","Vehicle registered!<br> Need a service? <br>Please go - Book Service -  ");
              //実験
              session.setAttribute("vehicleObj","vehicle");

                //back to customer.jsp
                resp.sendRedirect("customer_vehicle.jsp");
               
           }else{
//               HttpSession session = req.getSession();
                              //show message                     
              session.setAttribute("errorMsg","Server error");
                //back to customer.jsp
              resp.sendRedirect("customer_vehicle.jsp");
           }
          
          // Close the connection after usage (Optional but recommended)
            
                


     } catch (Exception e){
            e.printStackTrace();
            }
        
}

}





    
    

