<%-- 
    Document   : view_booking.jsp
    Created on : 25-Jul-2023, 17:53:41
    Author     : emi
--%>

<%@page import="com.entity.Mechanic"%>
<%@page import="com.entity.Booking"%>
<%@page import="com.entity.Type"%>
<%@page import="com.entity.Vehicle"%>
<%@page import="com.entity.Service"%>
<%@page import="com.entity.Status"%>
<%@page import="java.util.List"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page import="com.dao.BookingDao"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.entity.Customer"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.dao.TypeDao"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.dao.StatusDao"%>

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
            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("img/top-view.jpg");
                height: 20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp"%><!-- linked navbar.jsp file -->
        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-4 fw-bold text-center text-success">Booking List</p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Booking No.</th>

                                        <th scope="col">Vehicle LicenceNo.</th>
                                        <th scope="col">Vehicle Type</th>
                                        <th scope="col">Date</th>


                                        <th scope="col">Service type</th>
                                        <th scope="col">Customer comment</th>
                                        <th scope="col">Status</th>


                                    </tr>
                                </thead>
                                <tbody>        
                                    <%                                             //  login customer
                                        Customer customer = (Customer) session.getAttribute("customerObj");

                                        

                                        BookingDao dao = new BookingDao(SQLconnect.getConn());
                                        MechanicDao dao2 = new MechanicDao(SQLconnect.getConn());
                                        List<Booking> list = dao.getAllBookingByLoginCustomer(customer.getId());

                                        for (Booking b : list) {
                                            Mechanic m = dao2.getMechanicById(b.getVehiId());
                                            
                                        
                                    %>
                                    <tr>
                                        <th><%=b.getId()%></th>


                                        <%
                                        // As　VehicleDao instance accessible in the JSP page,  can call the getVehicleById method.
                                        VehicleDao vehicleDao = new VehicleDao(SQLconnect.getConn());
                                        Vehicle vehicle = vehicleDao.getVehicleById(b.getVehiId());
                                        TypeDao tDao = new TypeDao(SQLconnect.getConn());
                                        Type t = tDao.getTypeById(vehicle.getTypeId());
                                        %>
                                        <td><%= vehicle.getLicenceDetail() %></td>
                                        <td><%= t.getType()%> </td>


                                        <td><%=b.getDate()%></td>





                                        <td><%= new ServiceDao(SQLconnect.getConn()).getServiceById(b.getServiceId()).getType() %></td>

                                        <td><%=b.getComment()%></td>

                                        <td>
                                            <%
                                            if (b.getStatusId() == 1) { %>
                                            <a href="#" class="btn btn-sm btn-warning">Booked</a>
                                            <%} else {%>
                                            
                                                                                    <%
                                        // As　
                                        StatusDao stDao = new StatusDao(SQLconnect.getConn());
                                        Status st = stDao.getStatusById(b.getStatusId());
                                        %>
                                            <%= st.getStatus()%>
                                            <%
                                                }
                                            %> </td>


                                    </tr>
                                    <%
                                        }
                                    %>



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
