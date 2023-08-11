<%-- 
    Document   : assigned_booking.jsp
    Created on : 31-Jul-2023, 23:38:01
    Author     : emi
--%>

<%@page import="com.entity.Vehicle"%>
<%@page import="com.entity.Status"%>
<%@page import="com.entity.Service"%>
<%@page import="com.entity.Service"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.dao.StatusDao"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.entity.Booking"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="com.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page import="com.dao.BookingDao"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.dao.CustomerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>assigned booking Page</title>
        <%@include file="../component/allcss.jsp"%><!-- linked allcss.jsp file -->
               
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <c:if test="${empty mechanicObj }">
            <c:redirect url="../mechanic_login.jsp"></c:redirect>
        </c:if>

        <%@include file="navbar.jsp"%><!-- linked navbar.jsp file -->
        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">                      
                            <p class="fs-4 fw-bold text-center text-success"> ${mechanicObj.fName} assigned</p>
                             <p class="fs-4 fw-bold text-center text-success">Booking List</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <p class=" fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            
                            <div class="mb-3">
                                <form action="assigned_booking.jsp" method="get">
                                    <div class="row">
                                        <div class="col">
                                            <label for="inputStartDate" class="form-label">Start Date:</label>
                                            <input type="date" id="inputStartDate" name="startDate" class="form-control" required>
                                        </div>
                                        <div class="col">
                                            <label for="inputEndDate" class="form-label">End Date:</label>
                                            <input type="date" id="inputEndDate" name="endDate" class="form-control" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-2">View Bookings</button>
                                </form>
                            </div>

                                

                            <table class="table">
                                <thead>
                                    <tr>
                                         <th scope="col"> Booking Id</th>
                                        <th scope="col">Customer info</th>
                                        <th scope="col">Vehicle info</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Service type</th>
                                        <th scope="col">Customer comment</th>
                                        
<!--                                        <th scope="col">Mechanic</th>-->
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
      

                         
                                    
                                     <%
                                                                                     //filter name
                                        String startDateParam = request.getParameter("startDate");
                                        String endDateParam = request.getParameter("endDate");
                                        
                                        Mechanic m = (Mechanic) session.getAttribute("mechanicObj");
                                        BookingDao dao = new BookingDao(SQLconnect.getConn());
                                        MechanicDao mdao = new MechanicDao(SQLconnect.getConn());
                                        CustomerDao cdao = new CustomerDao(SQLconnect.getConn());
                                        ServiceDao sdao = new ServiceDao(SQLconnect.getConn());
                                        StatusDao stdao = new StatusDao(SQLconnect.getConn()); 
                                        VehicleDao vdao = new VehicleDao(SQLconnect.getConn());
                                        

//                                         List<Booking> list = dao.getAllBookingByLoginMechanic(m.getId());
// for (Booking b : list) { 
                                            List<Booking> list = dao.getBookingsByMechanicAndDateRange(m.getId(),startDateParam, endDateParam);
                                        for (Booking b : list) {
                                        
                                        
                                             m = mdao.getMechanicById(b.getId());
                                             Mechanic m2 = mdao.getMechanicById(b.getMechaId());
                                              Customer c = cdao.getCustomerById(b.getCusId());
                                              Service s = sdao.getServiceById(b.getServiceId());
                                              Status st = stdao.getStatusById(b.getStatusId());
                                              Vehicle v = vdao.getVehicleById(b.getVehiId());
                                    %>
  
                                    

                    
                    
               
                                    <tr>
                                        <th><%=b.getId()%></th>
                                        <td><%=c.getfName()%></td>  
                                        <td><%=v.getLicenceDetail()%></td>
                                        <td><%=b.getDate()%></td>

                                         <td><%=s.getType()%></td>

                                        <td><%=b.getComment()%></td>
                                        
                                         <!--  set mechaID:7 as default = no mechanic assign yet-->

                                        <!--  set id:1 = booking status = New to standout-->
                                        <td>
                                            <% if (b.getStatusId() == 1) { %>
                                                <a href="#" class="btn btn-sm btn-warning">New</a>
                                            <% } else { %>
                                                <%=st.getStatus()%>
                                            <% } %>
                                        </td>
                                        
                                        
                                        
                                    </tr>
                                    


                                    
                                    <% } %>

                


                                </tbody>
               </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </body>
</html>









