<%-- 
    Document   : edit_mechanic.jsp
    Created on : 09-Jul-2023, 13:02:46
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
        <title>JSP View&Edit mechanic Page</title>
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

                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Edit Mechanic details</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <!-- linked data with id-->
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                MechanicDao dao2 = new MechanicDao(SQLconnect.getConn());
                                Mechanic m = dao2.getMechanicById(id);//get info of a mechanic
                            %>





                            <!-- link  -->
                            <form action="../updateMechanic" method="post">
                                <div class="mb-3">
                                    <label class="form-label">First Name</label> <input type="text"
                                                                                        required name="firstname" class="form-control" value="<%=m.getfName()%>"> <!-- call data by id-->
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Last Name</label> <input type="text"
                                                                                       required name="surname" class="form-control" value="<%=m.getsName()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text"
                                                                                   required name="email" class="form-control" value="<%=m.getEmail()%>"> 
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text"
                                                                                    required name="mobno" class="form-control" value="<%=m.getMobNo()%>"> 
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required
                                                                                      name="password" type="text" class="form-control" value="<%=m.getPassword()%>"> 
                                </div>


                                <input type="hidden" name="id" value="<%=m.getId()%>" >





                                <button type="submit" class="btn btn-primary col-md-12">Update</button>
                            </form>
                        </div>
                    </div>
                </div>






            </div>
        </div>



    </body>
</html>
