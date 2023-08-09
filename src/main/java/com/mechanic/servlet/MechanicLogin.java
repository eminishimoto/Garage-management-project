/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mechanic.servlet;

import com.dao.MechanicDao;
import com.db.gersgarage.SQLconnect;
import com.entity.Mechanic;
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
@WebServlet("/mechanicLogin")
public class MechanicLogin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            
        String email=req.getParameter("email");//name from signup.jsp
            String password=req.getParameter("password");
            
            HttpSession session = req.getSession();
            
            MechanicDao dao = new MechanicDao(SQLconnect.getConn());
            Mechanic mechanic = dao.login(email, password);
            
            if(mechanic != null) { 
              //show message                      //created empty mechanic 
              session.setAttribute("mechanicObj", mechanic);
                //back to signup.jsp
                resp.sendRedirect("mechanic/index.jsp");
            } else{
                                //show message
                session.setAttribute("errorMsg", "Invalid email & password");
                //back to signup.jsp
                resp.sendRedirect("mechanic_login.jsp");
                
            }
    }

    
    
}
