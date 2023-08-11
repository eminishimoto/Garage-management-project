<%-- 
    Document   : navbar.jsp
    Created on : 09-Jul-2023, 19:45:32
    Author     : emi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i  
			class="fa-solid fa-car"></i> Ger's Garage Home</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <a href="navbar.jsp"></a>
                                <!--   clicking leads each page-->
				<li class="nav-item"><a class="nav-link active " href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active" href="assigned_booking.jsp">Assigned Booking</a></li>



			</ul>

			<form class="d-flex">
                                <!--  bootstrap-->
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                                aria-expanded="false"><i class="fas fa-user-circle"></i>${mechanicObj.fName}
                                        </button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="">Edit Profile</a></li>
                                                                        <!--      servlet link-->
                                                <li><a class="dropdown-item" href="../mechanicLogout">Logout</a></li>
                                        </ul>
				</div>
			</form>
		</div>
	</div>
</nav>