/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

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

//connect mechanic.jsp
@WebServlet("/addMechanic")
public class AddMechanic extends HttpServlet  {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        try{
//            get data from sql
            String firstname=req.getParameter("firstname");
            String surname=req.getParameter("surname");
            String mobno=req.getParameter("mobno"); 
            String email=req.getParameter("email"); 
            String password=req.getParameter("password"); 
            
                                       //  from mechanic.jsp
            Mechanic m = new Mechanic(firstname, surname, email, mobno, password);

           MechanicDao dao=new MechanicDao(SQLconnect.getConn());
           HttpSession session = req.getSession();
           
           if(dao.registerMechanic(m))
           {
               //show message                     
              session.setAttribute("succMsg","Mechanic added");
                //back to mechanic.jsp
                resp.sendRedirect("admin/mechanic.jsp");
               
           }else{
                              //show message                     
              session.setAttribute("errorMsg","Server error");
                //back to mechanic.jsp
              resp.sendRedirect("admin/mechanic.jsp");
           }

     } catch (Exception e){
            e.printStackTrace();
            }
}
}





   