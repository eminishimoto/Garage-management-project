    <!-- 
        Document   : index.jsp
        Created on : 03-Jul-2023, 21:11:38
        Author     : emi-->

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false"  %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Admin dashboard JSP Page</title>
             <%@include file="../component/allcss.jsp"%>

                 <style type="text/css">
    .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }


        </style>

        </head>
        <body>
            <%@include file="navbar.jsp"%>

                    <c:if test="${ empty adminObj }">
                    <c:redirect url="../admin_login.jsp"></c:redirect>
            </c:if>





            <div class="container p-5">
                    <p class="text-center fs-3">Hello, Admin!</p>
                    <c:if test="${not empty errorMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <div class="row">
                            <div class="col-md-4">
                                    <div class="card paint-card">
                                            <div class="card-body text-center text-success">
                                                    <i class="fas fa-users-cog  fa-3x"></i><br>
                                                    <a href="mechanic.jsp"  class="fs-4 text-center">
                                                           Add Mechanic <br>
                                                    </a>
                                                                                                        <a href="view_mechanic.jsp"  class="fs-4 text-center">
                                                           Adit&View<br>
                                                    </a>
                                                    
                                            </div>
                                    </div>
                            </div>




                            <div class="col-md-4">
                                    <a href="view_customer.jsp"  class="card paint-card">
                                            <div class="card-body text-center text-success">
                                                    <i class="fas fa-user-circle fa-3x"></i><br>
                                                    <p class="fs-4 text-center">
                                                            Customer <br>
                                                    </p>
                                            </div>
                                    </a>
                            </div>

                            <div class="col-md-4">
                                    <a href="view_booking.jsp" class="card paint-card" >
                                       
                                            <div class="card-body text-center text-success">
                                                    <i class="far fa-calendar-check fa-3x"></i><br>
                                                    <p class="fs-4 text-center">
                                                            Booking <br>
                                                    </p>
                                            </div>
                                    </a>
                            </div>

                            <div class="col-md-4 mt-2">

                                    <div class="card paint-card " data-bs-toggle="modal"
                                            data-bs-target="#exampleModal">
                                            <div class="card-body text-center text-success">
                                                    <i class="far fa-calendar-check fa-3x"></i><br>
                                                    <p class="fs-4 text-center">
                                                            Add Service <br>
                                                    </p>
                                            </div>
                                    </div>

                            </div>

                    </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                            <div class="modal-content">
                                    <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Service type</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                            <form action="../addService" method="post">

                                                    <div class="form-group">
                                                            <label>New service type</label> <input type="text"
                                                                    name="type" class="form-control">
                                                    </div>
                                                    <div class="text-center mt-3">
                                                            <button type="submit" class="btn btn-primary">Add</button>
                                                    </div>

                                            </form>

                                    </div>
                                    <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>

                                    </div>
                            </div>
                    </div>
            </div>



        </body>
    </html>
