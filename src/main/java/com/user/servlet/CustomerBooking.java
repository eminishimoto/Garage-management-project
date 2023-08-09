/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.BookingDao;
import com.db.gersgarage.SQLconnect;
import com.entity.Booking;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author emi
 */
//from action in customer_book.jsp
@WebServlet("/customerBooking")
public class CustomerBooking  extends HttpServlet {
    
        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                                                       //link to jsp
        int cusId=Integer.parseInt(req.getParameter("customerid"));//name from customer_book.jsp
        int vehiId=Integer.parseInt(req.getParameter("vehicle"));
        String date=req.getParameter("book_date");
        
//     int mechaId=-1;//indicates the value is not known
//     int statusId=-1;//indicates the value is not known

        //those 2 are not set when customer book
//      int mechaId=Integer.parseInt(req.getParameter(""));
//      int statusId=Integer.parseInt(req.getParameter(""));
        int serviceId=Integer.parseInt(req.getParameter("service"));
        String comment=req.getParameter(    "comment");

        
        // Check if the selected date is fully booked
        BookingDao dao = new BookingDao(SQLconnect.getConn());
        boolean isFullyBooked = dao.isDateFullyBooked(date);
        
        if (isFullyBooked) {
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Sorry, the selected date is fULLY BOOKED. Please choose another date.");
            resp.sendRedirect("customer_book.jsp");
            return; // Return to avoid proceeding with the booking if the date is fully booked
        }
        
        
        
       // If the date is not fully booked, proceed with the booking
                                                  //temporary 7 as not assign mechanic    //status1=boked            
        Booking booking = new Booking(cusId, vehiId, date, 7 ,1, serviceId,comment);
        
//       as for int, "pending" does not work . instead, create other constructor without statusId and mechanicId
//        Booking b = new Booking(cusId, vehiId, date ,serviceId,comment);
 
            
            

            try {
                if(dao.addBooking(booking)) {
                    HttpSession session = req.getSession();
                    //show message
                    session.setAttribute("succMsg", "Booked successfully");
                     session.setAttribute("bookingObj", booking);
//  実験                           created empty customer in Custmer class
              session.setAttribute("bookingObj", booking);
//back to signup.jsp
resp.sendRedirect("customer_book.jsp");
                } else{
                     HttpSession session = req.getSession();
                    //show message
                    session.setAttribute("errorMsg", "Server error");
                    //back to customer_book.jsp
                    resp.sendRedirect("customer_book.jsp");
                    
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }
    
}
