/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.BookingDao;
import com.db.gersgarage.SQLconnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * for booking limitation
 * @author emi
 */
@WebServlet("/checkAvailability")
public class CheckDateAavirability extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selectedDate = req.getParameter("selectedDate");

        // check if the selected date is fully booked
        BookingDao dao = new BookingDao(SQLconnect.getConn());
        boolean isFullyBooked = dao.isDateFullyBooked(selectedDate);

        // Send the response back to the client (JSP)
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"isFullyBooked\": " + isFullyBooked + "}");
    }

}

    
