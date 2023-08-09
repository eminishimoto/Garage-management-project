<%-- 
    Document   : signup.jsp
    Created on : 02-Jul-2023, 15:21:23
    Author     : emi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
                <%@include file="component/allcss.jsp"%><!<!-- linked allcss.jsp file -->
               <!-- position -->    
    <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
    </style>
    </head>
    <body>
             <%@include file="component/navbar.jsp"%><!-- linked navbar.jsp file -->
<!--for sign in-->
<div class="container p-5">
    <div class="row">
        <div class ="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class ="card-body">
                    <p class="fs-4 text-center">Customer Register</p>
                    
                   <!--  sign in/log in message-->
                    <c:if test="${not empty errorMsg}">
                        <p class ="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
     
                    <c:if test="${not empty succMsg}">
                        <p class ="fs-3 text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"  />
                    </c:if>
                        
                        <!--sign in form -->
                         　　    <!--  "customer" from CustomerRegister.java -->
                        <form action="customer" method="post">
                             <div class="mb-3">
                                <label class="form-label">First Name </label> 
                                <input required name="fname" type="text" class="form-contorl"> 
                            </div>
                                  <div class="mb-3">
                                <label class="form-label">Sir Name </label> 
                                <input required name="sname" type="text" class="form-contorl"> 
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email address </label> 
                                <input required name="email" type="email" class="form-contorl"> 
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile number </label> 
                                <input required name="mobno" type="mobno" class="form-contorl"> 
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password </label> 
                                <input required name="password" type="password" class="form-contorl">
                            </div>
                            
                            <button type="submit" class="btn bg-success text-white col-mid-12">Register</button>
                        </form>
                </div>
            </div>
        </div>
    </div>
    
</div>
      
        
    </body>
</html>
