/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

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
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try{
                
            String email=req.getParameter("email");//name from signup.jsp
            String password=req.getParameter("password");
            
            HttpSession session = req.getSession();
            
            if("admin@gmail.com".equals(email)&&"admin".equals(password)) { 
              //show message                      //created empty customer in Custmer class
              session.setAttribute("adminObj",new Customer());
                //back to signup.jsp
                resp.sendRedirect("admin/index.jsp");
            } else{
                                //show message
                session.setAttribute("errorMsg", "Invalid email & password");
                //back to signup.jsp
                resp.sendRedirect("admin_login.jsp");
                
            }

    } catch (Exception e){
            e.printStackTrace();
            }
        
    }
}
