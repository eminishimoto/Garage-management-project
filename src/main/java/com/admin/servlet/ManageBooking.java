/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.dao.BookingDao;
import com.db.gersgarage.SQLconnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *this is the class for AssignMechanic/UpdateBookingStatus
 * @author emi
 */
//connect mechanic.jsp
@WebServlet("/manageBooking")
public class ManageBooking  extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    try{
            
            int id=Integer.parseInt(req.getParameter("id")); //name from manage_booking.jsp
            int mechaId=Integer.parseInt(req.getParameter("assignmechanic")); 
            int statusId=Integer.parseInt(req.getParameter("updatestatus"));


           BookingDao dao=new BookingDao(SQLconnect.getConn());
           HttpSession session = req.getSession();
           
           //uppdate
           if(dao.manageBooking(id, mechaId, statusId))
           {
               //show message                     
              session.setAttribute("succMsg","Updated");
                //back to view_booking.jsp"
                resp.sendRedirect("admin/view_booking.jsp");
               
           }else{
                              //show message                     
              session.setAttribute("errorMsg","Server error");
                //back to view_booking.jsp"
              resp.sendRedirect("admin/view_booking.jsp");
           }

     } catch (Exception e){
            e.printStackTrace();
            }
    
    
    }
    
}
