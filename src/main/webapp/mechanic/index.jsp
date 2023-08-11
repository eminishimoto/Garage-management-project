<%-- 
    Document   : index.jsp
    Created on : 09-Jul-2023, 19:17:51
    Author     : emi
--%>
<%@page import="com.entity.Mechanic"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page import="com.dao.MechanicDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Mechanic Page</title>
                    <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
    </style>
        <%@include file="../component/allcss.jsp"%><!<!-- linked allcss.jsp file -->
    </head>
    <body>
        <c:if test="${ empty mechanicObj }">
	<c:redirect url="../mechanic_login.jsp"></c:redirect>
	</c:if>
        
         <%@include file="navbar.jsp"%><!-- linked navbar.jsp file. paste to each module too-->
        
        <p class="text-center fs-3">Hello,${mechanicObj.fName}!</p>
        <%
	Mechanic d = (Mechanic) session.getAttribute("mechanicObj");
	MechanicDao dao = new MechanicDao(SQLconnect.getConn());
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Mechanic <br>
                                                       
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<a href="assigned_booking.jsp" class="card paint-card"> 
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
						Assigned Booking <br>
							
						</p>
					</div>
				</a>
			</div>

                    
                    
                    
                    
		</div>
	</div>
    </body>
    
</html>
