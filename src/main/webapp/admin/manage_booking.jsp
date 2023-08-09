<%-- 
    Document   : manage_booking.jsp
    Created on : 01-Aug-2023, 14:07:17
    Author     : emi
--%>
<%@page import="com.entity.Vehicle"%>
<%@page import="com.entity.Service"%>
<%@page import="com.entity.Customer"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.entity.Status"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StatusDao"%>
<%@page import="com.dao.MakerDao"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.dao.ServiceDao"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page import="com.entity.Booking"%>
<%@page import="com.dao.BookingDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP manage booking Page</title>
        
        <style type="text/css">
.paint-card {
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
        </style>
        <%@include file="../component/allcss.jsp"%>
    </head>
    <body>
        <c:if test="${ empty adminObj }">
            <c:redirect url="../admin_login.jsp"></c:redirect>
        </c:if>
        <%@include file="navbar.jsp"%>
        	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Change Status/ Assign Mechanic</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));//from view_booking.jsp <a href="manage_booking.jsp?id= b.getId()"
						BookingDao dao = new BookingDao(SQLconnect.getConn());
                                               
                                        CustomerDao cdao = new CustomerDao(SQLconnect.getConn());
                                        ServiceDao sdao = new ServiceDao(SQLconnect.getConn());
                                        VehicleDao vdao = new VehicleDao(SQLconnect.getConn());
                                        
						Booking b = dao.getBookingById(id);
                                                
                                             Customer c = cdao.getCustomerById(b.getCusId());
                                              Service s = sdao.getServiceById(b.getServiceId());
                                              Vehicle v = vdao.getVehicleById(b.getVehiId());
						%>                       
                                                           <!-- link to  ManageBooking.java-->
						<form class="row" action="../manageBooking" method="post">
							<div class="col-md-6">
								<label>Booking ID</label> <input type="text" readonly
									value="<%=b.getId()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Customer name</label> <input type="text" value="<%=c.getfName()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Service</label> <input type="text" readonly
									value="<%=s.getType()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Vehicle detail</label> <input type="text" readonly
									value="<%=v.getLicenceDetail()%>" class="form-control">
							</div>
                                                        
                                                        <div class="col-md-12">
								<br> <label>Assign Mechanic</label><select
                                                                            required class="form-control" name="assignmechanic">
									<option value="">--select--</option>
                                                                       <!--    select option from Maker entity-->
									<%
									MechanicDao mdao = new MechanicDao(SQLconnect.getConn());
									List<Mechanic> list = mdao.getAllMechanic();
									for (Mechanic m : list) {
									%>
									<option value="<%=m.getId()%>"><%=m.getfName()%> 
									</option>
									<%
									}
									%>
                                                                        </select>
	
							</div>

							<div class="col-md-12">
								<br> <label>Status</label><select
									required class="form-control" name="updatestatus">
									<option value="">--select--</option>
                                                                       <!--    select option from Maker entity-->
									<%
									StatusDao dao2 = new StatusDao(SQLconnect.getConn());
									List<Status> list2 = dao2.getAllStatus();
									for (Status st : list2) {
									%>
									<option value="<%=s.getId()%>"><%=st.getStatus()%> 
									</option>
									<%
									}
									%>
                                                                        </select>
	
							</div>
                                                        
        
                                                                        
                                                                        
                                                                        
                                                                        

							<input type="hidden" name="id" value="<%=b.getId()%>"> <input
								type="hidden" name="did" value="<%=b.getMechaId()%>">

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Update</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>
