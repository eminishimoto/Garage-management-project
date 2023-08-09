/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.dao.MechanicDao;
import com.db.gersgarage.SQLconnect;
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
@WebServlet("/deleteMechanic")
public class DeleteMechanic  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        int id =  Integer.parseInt(req.getParameter("id"));
        
        MechanicDao dao=new MechanicDao(SQLconnect.getConn());
           HttpSession session = req.getSession();
           
           if(dao.deleteMechanic(id))
           {
               //show message                     
              session.setAttribute("succMsg","Mechanic deleted");
                //back to mechanic.jsp
                resp.sendRedirect("admin/view_mechanic.jsp");
               
           }else{
                              //show message                     
              session.setAttribute("errorMsg","Server error");
                //back to mechanic.jsp
              resp.sendRedirect("admin/view_mechanic.jsp");
           }

    }
    
}
