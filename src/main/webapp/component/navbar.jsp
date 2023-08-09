<%-- 
    Document   : navi.jsp
    Created on : 29-Jun-2023, 15:49:15
    Author     : emi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>

<!-- navbar bootstrap -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-car"></i> Ger's Garage HOME</a> <!-- icon from fontawesome)-->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">  <!-- ms: margin from start(left)-->
                
                
                
<!--  user landing page, if the customer does not have object-->
                <c:if test="${empty customerObj}">
                    <li class="nav-item">                               <!-- href="admin_login.jsp" leads to the admin page-->
                        <a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Admin</a></li>


                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="mechanic_login.jsp">Mechanic</a></li>

                    <li class="nav-item">                  
                        <a class="nav-link active" aria-current="page" href="customer_book.jsp">Service</a></li>

                    <li class="nav-item">                           
                        <a class="nav-link active" aria-current="page" href="customer_login.jsp">Customer</a></li>
                    
                    
                    

                </c:if> 





<!--   customer dashboard, if the customer has object-->
                <c:if test="${not empty customerObj}">
                     <li class="nav-item">                                 <!-- href="customer_vehicle.jsp" leads to the customer vehicle page-->
                         <a class="nav-link active" aria-current="page" href="customer_vehicle.jsp">Register Vehicle</a></li>
                                              
                    <li class="nav-item">                                   <!-- href="customer_book.jsp" leads to the customer booking page-->
                        <a class="nav-link active" aria-current="page" href="customer_book.jsp">Book Service</a></li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="view_booking.jsp">View Booking</a></li>
                                             
                    <!--  dropdown from  bootstrap                 -->
                    <div class="dropdown">
  <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <!--  icon from  fontawesome                                         -->
                            <i class="fa-regular fa-user"></i>${customerObj.fName}
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Change Password</a></li>
                             <!--    "customerLogout" from CustomerLogout.java-->
    <li><a class="dropdown-item" href="customerLogout">Logout</a></li>
  </ul>
</div>
                    

                </c:if>  





                <!--        <li class="nav-item">
                          <a class="nav-link" href="#">Link</a>-->

                <!--        </li>
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                          </a>
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                          </ul>
                        </li>-->
                <!--        <li class="nav-item">
                          <a class="nav-link disabled">Disabled</a>
                        </li>
                      </ul>-->
                <!-- serch button     <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                      </form>-->
        </div>
    </div>
</nav>