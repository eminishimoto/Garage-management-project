
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

   


  
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        /* Update the CSS for the welcome message container */
        .welcome-message-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 80vh; /* Adjust the height for better proportion */
            background-image: url('path_to_your_background_image.jpg'); /* Add a background image */
            background-size: cover; /* Cover the entire container */
            background-position: center; /* Center the background image */
            padding: 0 20px; /* Add horizontal padding */
            color: #fff; /* Set text color to white */
            text-align: center;
        }



        /* Add this style for the footer */
        .sticky-footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        

    </style>





    </head>
    <body>
        <%@include file="component/navbar.jsp"%><!-- linked navbar.jsp file. paste to each module too-->


        <div id="carouselExampleIndicators" class="carousel slide"
             data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0" class="active" aria-current="true"
                        aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <!--                welcomemessage-->
                <div class="carousel-item active">     <!-- active makes carousel active, need only for the first catd -->
                    <!-- Message Card -->
                    <div class="container welcome-message-container">
                        <div class="card paint-card">
                            <div class="card-body">
                                <h1 class="card-title text-center">Welcome to Our Auto Workshop</h1>
                                <p class="card-text text-center">Experience top-notch car services and maintenance.</p>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="carousel-item">
                    <!--                    feature-->
                    <div class="container p-2">
                        <p class="text-center fs-2 ">Key Features of our Garage</p>

                        <div class="row">
                            <div class="col-md-8 p-5">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card paint-card">
                                            <div class="card-body">
                                                <p class="fs-5">100% Relaiable</p>
                                                <p>Highly skilled mechanics are confident to fix any problems.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card paint-card">
                                            <div class="card-body">
                                                <p class="fs-5">Clean Environment</p>
                                                <p>We try to have our work environmentaly friendly as mych as possible!</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mt-2">
                                        <div class="card paint-card">
                                            <div class="card-body">
                                                <p class="fs-5">Friendly staff</p>
                                                <p>you are warmly welcomed by our lovely staff from start to the end.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mt-2">
                                        <div class="card paint-card">
                                            <div class="card-body">
                                                <p class="fs-5">Local trust</p>
                                                <p>Our business has been supported and loved by people in Dublin since 1990.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <img alt="" src="">
                            </div>

                        </div>
                    </div>



                </div>



                <!--                introduce team-->
                <div class="carousel-item">
                    <div class="container p-3">
                        <p class="text-center fs-2 ">Our Service</p>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="card paint-card">
                                    <div class="card-body text-center">
                                       
                                        <p class="fw-bold fs-5">Annual Service</p>
                                        <p class="fs-7">(200€ ~)</p>
                                    </div>
                                </div>
                            </div>
                            
                                                        <div class="col-md-3">
                                <div class="card paint-card">
                                    <div class="card-body text-center">
                                       
                                        <p class="fw-bold fs-5">Major Service</p>
                                        <p class="fs-7">(150€ ~)</p>
                                    </div>
                                </div>
                            </div>

                                                                                    <div class="col-md-3">
                                <div class="card paint-card">
                                    <div class="card-body text-center">
                                       
                                        <p class="fw-bold fs-5">Repair/Fault</p>
                                        <p class="fs-7">(250€ ~)</p>
                                    </div>
                                </div>
                            </div>
                                                                                                                <div class="col-md-3">
                                <div class="card paint-card">
                                    <div class="card-body text-center">
                                       
                                        <p class="fw-bold fs-5">Major Repair</p>
                                        <p class="fs-7">(300€ ~)</p>
                                    </div>
                                </div>
                                                                                                                                                                                                    
                            </div>






                        </div>
                          <hr>
<!--                                                         <h1 class="card-title text-center">We have store variety of items.</h1>-->
                                <p class="card-text text-center">Contact us </p> 
                               
                                <p class="card-text text-center">TEL:083-XXX-XXXX</p> 
                                <p class="card-text text-center">Email:customerservice@gersgarage.com</p> 
                                <p class="card-text text-center">Address:Gersgarage st, Dublin</p> 
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                    class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
                    class="visually-hidden">Next</span>
            </button>
        </div>





        <!--         carousel indicator from bootstrap
        -->        
        <!--<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="WEB-INF/img/auto-workshop-car" class="d-block w-100" alt="..." height="1000px">   
                        
                        
                        </div>
                        <div class="carousel-item">
                            <img src="WEB-INF/img/top-view.jpg" class="d-block w-100" alt="..." height="500px">
                        </div>
                        <div class="carousel-item">
                            <img src="WEB-INF/img/auto-workshop-car.jpg"class="d-block w-100" alt="..." height="500px">
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
                </div>-->




    <footer class="sticky-footer">
        <%@include file="component/footer.jsp" %>
    </footer>

</body>

</html>
