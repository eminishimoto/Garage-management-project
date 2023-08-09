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

/**
 *
 * @author emi
 */
@WebServlet("/customerLogin")
public class CustomerLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email=req.getParameter("email");//name from signup.jsp
            String password=req.getParameter("password");
            
            HttpSession session = req.getSession();
            
            CustomerDao dao = new CustomerDao(SQLconnect.getConn());
            Customer customer = dao.login(email, password);
            
            if(customer != null) { 
                
                //ADD! Set the customer ID attribute in the session
            session.setAttribute("cusId", customer.getId());
                
                
              //show message             //created empty customer in Cusotmer class  //Set the customer object in the session
              session.setAttribute("customerObj", customer);
                //Redirect to signup.jsp
                resp.sendRedirect("index.jsp");
            } else{
                                //show message
                session.setAttribute("errorMsg", "Invalid email & password");
                //back to signup.jsp
                resp.sendRedirect("customer_login.jsp");
                
            }
    }
    
}
