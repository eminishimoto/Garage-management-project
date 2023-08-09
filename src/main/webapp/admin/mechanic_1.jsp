<%-- 
    Document   : doctor.jsp
    Created on : 08-Jul-2023, 13:50:06
    Author     : emi
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Mechanic"%>
<%@page import="com.dao.MechanicDao"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP mechanic Page</title>
        <%@include file="../component/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid p-3">
            <div class="row">
<!--                 <div class="col-md-5 offset-md-4">-->
                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Add Mechanic</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form action="../addMechanic" method="post">
                                <div class="mb-3">
                                    <label class="form-label">First Name</label> <input type="text"
                                                                                        required name="firstname" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Last Name</label> <input type="text"
                                                                                       required name="surname" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text"
                                                                                   required name="email" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text"
                                                                                    required name="mobno" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required
                                                                                      name="password" type="text" class="form-control">
                                </div>





                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Mechanic Details</p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Firstname</th>
                                        <th scope="col">Surname</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Mob No</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MechanicDao dao2 = new MechanicDao(SQLconnect.getConn());
                                        List<Mechanic> list2 = dao2.getAllMechanic();
                                            for (Mechanic m : list2) {%>
                                    <tr>
                                        <td><%=m.getfName()%></td>
                                        <td><%=m.getsName()%></td>
                                        <td><%=m.getEmail()%></td>
                                        <td><%=m.getMobNo()%></td>
                                        <!--link to edit_mechanic.jsp--> <!--pass particuler info by id-->
                                        <td><a href="edit_mechanic.jsp?id=<%=m.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                            <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                    <%}
                                    %>

                                </tbody>    
                            </table>
                        </div>
                    </div>
                </div>



            </div>
        </div>



    </body>
</html>
