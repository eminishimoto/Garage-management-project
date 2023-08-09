<%-- 
    Document   : view_booking.jsp
    Created on : 26-Jul-2023, 13:52:53
    Author     : emi
--%>


<%@page import="com.dao.VehicleDao"%>
<%@page import="com.entity.Vehicle"%>
<%@page import="com.entity.Service"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.entity.Status"%>
<%@page import="com.dao.StatusDao"%>
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
        <title>view booking Page</title>
        <%@include file="../component/allcss.jsp"%><!-- linked allcss.jsp file -->
        <!-- position -->    
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
   

        </style>

    </head>
    <body>
        <%@include file="navbar.jsp"%><!-- linked navbar.jsp file -->

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">
                            
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                        
                        
                            <p class="fs-4 fw-bold text-center text-success">Booking List</p>
                            
                            <div class="mb-3">
                                <form action="view_booking.jsp" method="get">
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
                                        <th scope="col">Booking Id</th>
                                        <th scope="col">Customer info</th>
                                        <th scope="col">Vehicle info</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Service type</th>
                                        <th scope="col">Customer comment</th>
                                        
                                        <th scope="col">Mechanic</th>
                                        <th scope="col">Status</th>
                                   <tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        
                                    <%
                                        String startDateParam = request.getParameter("startDate");
                                        String endDateParam = request.getParameter("endDate"); 
                                        
                                       
                                        BookingDao dao = new BookingDao(SQLconnect.getConn());
                                        MechanicDao mdao = new MechanicDao(SQLconnect.getConn());
                                        CustomerDao cdao = new CustomerDao(SQLconnect.getConn());
                                        ServiceDao sdao = new ServiceDao(SQLconnect.getConn());
                                        StatusDao stdao = new StatusDao(SQLconnect.getConn()); 
                                        VehicleDao vdao = new VehicleDao(SQLconnect.getConn());
                                        
                                        List<Booking> list = dao.getAllBookingByWeek(startDateParam, endDateParam);
                                        for (Booking b : list) {
                                            Mechanic m = mdao.getMechanicById(b.getMechaId());
                                              Customer c = cdao.getCustomerById(b.getCusId());
                                              Service s = sdao.getServiceById(b.getServiceId());
                                              Status st = stdao.getStatusById(b.getStatusId());
                                              Vehicle v = vdao.getVehicleById(b.getVehiId());
                                    %><tr>
                                    <tr>
                                        <th><%=b.getId()%></th>
                                        <td><%=c.getfName()%></td>  
                                        <td><%=v.getLicenceDetail()%></td>
                                        <td><%=b.getDate()%></td>

                                         <td><%=s.getType()%></td>

                                        <td><%=b.getComment()%></td>
                                        
                                         <!--  set mechaID:7 as default = no mechanic assign yet-->
                                         <td> 
                                            <% if (b.getMechaId() == 7) { %>
                                                <a href="#" class="btn btn-sm btn-warning">notAssign</a>
                                            <% } else { %>
                                                <%= m.getfName()%>
                                            <% } %>
                                        </td>
                                        
                                        <!--  set id:1 booking status = new booking-->
                                        <td>
                                            <% if (b.getStatusId() == 1) { %>
                                                <a href="#" class="btn btn-sm btn-warning">New</a>
                                            <% } else { %>
                                                <%=st.getStatus()%>
                                            <% } %>
                                        </td>
                                        

                                        <td>
                                       <!--    link to manage_booking.jsp-->
                                        <a href="manage_booking.jsp?id=<%=b.getId()%>" class="btn btn-primary btn-sm ">Edit</a> 
                                        </td> 
                                    </tr>
                                    
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 p-3">
                    <img alt="" src="img/doct.jpg">
                </div>
            </div>
        </div>
    </body>
</html>