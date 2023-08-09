<%-- 
    Document   : customer_vehicle.jsp
    Created on : 16-Jul-2023, 15:28:26
    Author     : emi
--%>
<%@page import="com.entity.Customer"%>
<%@page import="com.entity.Vehicle"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.entity.Type"%>
<%@page import="com.dao.TypeDao"%>
<%@page import="com.entity.Maker"%>
<%@page import="com.dao.MakerDao"%>
<%@page import="com.entity.Engine"%>
<%@page import="com.dao.EngineDao"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page import="java.util.List"%>

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP customer vehicle Page</title>
        <%@include file="component/allcss.jsp"%>
        <style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct.jpg">
			</div>

			<div class="col-md-6">
                            	<c:if test="${not empty errorMsg}">
				    <p class="fs-4 text-center text-danger">${errorMsg}</p>
				    <c:remove var="errorMsg" scope="session" />
				</c:if>
				<c:if test="${not empty succMsg}">
				    <p class=" fs-4 text-center text-success">${succMsg}</p>
				    <c:remove var="succMsg" scope="session" />
				</c:if>
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Vehicle detail</p>
	
                                                        <!--   action, name =    connect to RegisterVehicle.java(servlet)-->
						<form class="row g-3" action="registerVehicle" method="post">
                                                        


							<div class="col-md-6">
                                                              <label for="cus">Customer ID</label>
                                                             <input type="text" name="cus" value="${customerObj.id}" readonly>
                                                             </div>
                                                            
                                                            
								<label for="inputPassword5" class="form-label">Type</label> <select
									required class="form-control" name="type">
									<option value="">--select--</option>
                                                                       <!--    select option from Engine entity-->
									<%
									TypeDao tdao = new TypeDao(SQLconnect.getConn()); 
									List<Type> tlist = tdao.getAllType();
									for (Type t : tlist) {
									%>
									<option value="<%=t.getId()%>"><%=t.getType()%> 
									</option>
									<%
									}
									%>

								</select>
                                                                        
                                                                        
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Maker</label> <select
									required class="form-control" name="maker">
									<option value="">--select--</option>
                                                                       <!--    select option from Maker entity-->
									<%
									MakerDao dao = new MakerDao(SQLconnect.getConn());
									List<Maker> list = dao.getAllMaker();
									for (Maker m : list) {
									%>
									<option value="<%=m.getId()%>"><%=m.getMaker()%> 
									</option>
									<%
									}
									%>

								</select>
                                                                        
							</div>
                                                                        
                                                        <div class="col-md-12">
								<label>Licence detail </label>
								<textarea required name="licencedetail" class="form-control" rows="3"
									cols=""></textarea>
							</div>

					


							<div class="col-md-6">
								<label for="inputPassword5" class="form-label">Engine</label> <select
									required class="form-control" name="engine">
									<option value="">--select--</option>
                                                                       <!--    select option from Engine entity-->
									<%
									EngineDao edao = new EngineDao(SQLconnect.getConn()); 
									List<Engine> elist = edao.getAllEngine();
									for (Engine en : elist) {
									%>
									<option value="<%=en.getId()%>"><%=en.getType()%> 
									</option>
									<%
									}
									%>

								</select>
                                                                        
							</div>

                
<!--                                                        If the customerObj is empty or not present, the content within the -c:if- tag will be rendered.-->

                                                               <!--if I add codition, data does not fetch. need condition if not empty etc-->
								<button class="col-md-6 offset-md-3 btn btn-success">Register</button>

								
							
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>