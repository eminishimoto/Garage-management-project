/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.CustomerDao;
import com.db.gersgarage.SQLconnect;
import com.entity.Customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author emi
 */
//dataname
@WebServlet("/customer")
public class CustomerRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fName = req.getParameter("fname");//name from signup.jsp
            String sName = req.getParameter("sname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String mobno = req.getParameter("mobno");

 
            CustomerDao customerDao = new CustomerDao(SQLconnect.getConn());

            // Password validation
            boolean isValidFormat = customerDao.isValidFormat(password);
            boolean isUniquePassword = customerDao.isUniquePassword(password);

            if (!isValidFormat) {
                // Password format is not valid, show error message and redirect back to the form
                HttpSession session = req.getSession();
                session.setAttribute("errorMsg", "Invalid.<br> Password must be <br> *Mix of Alphabets and Numbers <br> * 6 - 8 characters");
                resp.sendRedirect("signup.jsp");
                return;
            }

            if (!isUniquePassword) {
                // Password is not unique, show error message and redirect back to the form
                HttpSession session = req.getSession();
                session.setAttribute("errorMsg", "Password is already used. Please choose a different password.");
                resp.sendRedirect("signup.jsp");
                return;
            }

            Customer c = new Customer(fName, sName, email, password, mobno);
            CustomerDao dao = new CustomerDao(SQLconnect.getConn());
            HttpSession session = req.getSession();
            boolean f = dao.register(c);

            if (f) {   //show message
                session.setAttribute("succMsg", "Register Success!<br> Please login for further service.");
                //back to signup.jsp
                resp.sendRedirect("customer_login.jsp");
            } else {
                //show message
                session.setAttribute("errorMsg", "Server error");
                //back to signup.jsp
                resp.sendRedirect("signup.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
