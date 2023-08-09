
<%@page import="java.sql.Connection"%>
<%@page import="com.db.gersgarage.SQLconnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <%@include file="component/allcss.jsp"%><!<!-- linked allcss.jsp file -->
                
       <!-- position -->    
    <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
    </style>
 
    </head>
    <body>
        <%@include file="component/navbar.jsp"%><!-- linked navbar.jsp file. paste to each module too-->
        

                
        <!-- carousel indicator from bootstrap-->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/img/auto-workshop-car.jpg " class="d-block w-100" alt="..." height="1000px">   <!-- insert image-->
                </div>
                <div class="carousel-item">
                    <img src="img/top-view.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="/img/auto-workshop-car.jpg"class="d-block w-100" alt="..." height="500px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        
        <%@include file="component/footer.jsp" %>


    </body>
</html>
