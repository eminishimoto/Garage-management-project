<%-- 
    Document   : customer_book.jsp
    Created on : 10-Jul-2023, 21:38:10
    Author     : emi
--%>
<%@page import="com.entity.Type"%>
<%@page import="com.dao.TypeDao"%>

<%@page import="com.user.servlet.CustomerBooking"%>
<%@page import="com.user.servlet.CheckDateAavirability"%> 

<%@page import="com.entity.Customer"%>
<%@page import="com.dao.CustomerDao"%>

<%@page import="com.db.gersgarage.SQLconnect"%>

<%@page import="com.entity.Service"%>
<%@page import="com.dao.ServiceDao"%>

<%@page import="com.entity.Vehicle"%>
<%@page import="com.dao.VehicleDao"%>


<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP customer book Page</title>
        <%@include file="component/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4));
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


                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">Book service</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <p class=" fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>


                            <!--                                             <!--       connect to CustomerBooking.java(servlet)-->
                            <form class="row g-3" action="customerBooking" method="post">
                                <!--       connect to CustomerBooking.java(servlet)-->
                                <!--         By using a hidden input field, the customerid parameter will be sent along with the form submission, and you can access it in the CustomerBooking servlet using req.getParameter("customerid").-->
                                <input type="hidden" name="customerid" value="${customerObj.id }">

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Customer name</label> <input
                                        required type="text" name="customerid" class="form-control" value="${customerObj.fName }"readonly>
                                </div>




                                <!-- date -->
                                <div class="col-md-6">
                                    <label for="inputEmail6" class="form-label">Date</label> <input 
                                        type="date" required class="form-control" 
                                        name="book_date" id="book_date"> <!-- include an id attribute so that we can select it using JavaScript-->
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Vehicle(Licence No.)</label> <select
                                        required class="form-control" name="vehicle"> 
                                        <%-- Use JSTL to get the customer ID from the customerObj attribute --%>
                                        <c:set  var="cusId" value="${customerObj.id}" /> 
                                        <option value="">--select--</option>
                                        <!-- select option from Vehicle entity-->
                                        <!--  instead it is vehicles now-->
                                        <%
                                            // Use JSTL to get the customer ID from the customerObj attribute
                                            int cusId = (int) session.getAttribute("cusId");

                                            VehicleDao vdao = new VehicleDao(SQLconnect.getConn());
                                            List<Vehicle> vlist = vdao.getVehiclesByCusId(cusId);

                                            TypeDao tDao = new TypeDao(SQLconnect.getConn()); // Create an instance of TypeDao to get type
                                            for (Vehicle v : vlist) {
                                                // Fetch the Type object based on the typeId of the vehicle
                                                Type t = tDao.getTypeById(v.getTypeId());
                                        %>

                                        <option value="<%= v.getId()%>"><%= t.getType()%> (Licence No. <%= v.getLicenceDetail()%>)</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <!-- service type -->
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Service</label> <select
                                        required class="form-control" name="service">
                                        <option value="">--select--</option>
                                        <!-- select option from Service entity-->
                                        <%
                                            ServiceDao dao = new ServiceDao(SQLconnect.getConn());
                                            List<Service> list = dao.getAllService();
                                            for (Service s : list) {
                                        %>
                                        <option value="<%=s.getId()%>"><%=s.getType()%> 
                                        </option>
                                        <%
                                            }
                                        %>

                                    </select>

                                </div>

                                <!-- comment -->
                                <div class="col-md-6">
                                    <label>Comments (Ex. Description of the problem)</label>
                                    <textarea required name="comment" class="form-control" rows="3"
                                              cols=""></textarea>
                                </div>

                                <c:if test="${empty customerObj }">
                                    <a href="customer_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Book</a>
                                </c:if>

                                <c:if test="${not empty customerObj }">
                                    <button class="col-md-6 offset-md-3 btn btn-success">Book</button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="component/footer.jsp"%>

        <!-- JavaScript code placed at the bottom before  </body> tag -->
        <!-- not allow to select Sunday, coclor difference to be noticable-->

        <!--<script>
            // Get the date input field
            var dateInput = document.getElementById("book_date");
        
            // Add event listener to the date input field
            dateInput.addEventListener("change", function() {
                // Get the selected date
                var selectedDate = new Date(this.value);
                
                // Check if the selected date is a Sunday (day number 0)
                if (selectedDate.getDay() === 0) {
                    // If it's a Sunday, reset the value of the input field
                    this.value = "";
                    // Optionally, you can show an alert or a message to inform the user that Sundays are not allowed
                    alert("The store is CLOSED on Sundays. Please choose another date.");
                }
            });
        </script>-->

        <!--<script>
            // Get the date input field
            var dateInput = document.getElementById("book_date");
        
            // Add event listener to the date input field
            dateInput.addEventListener("change", function() {
                // Get the selected date
                var selectedDate = this.value;
                
                // Check if the selected date is a Sunday (day number 0)
                if (selectedDate.getDay() === 0) {
                    this.value = "";
                    alert("The store is CLOSED on Sundays. Please choose another date.");
                } else {
        
                // Make an AJAX request to CheckAvailabilityServlet
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "checkAvailability", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Parse the response JSON
                            var response = JSON.parse(xhr.responseText);
                            var isFullyBooked = response.isFullyBooked;
        
                            if (isFullyBooked) {
                                // Show a message to the user indicating that the selected date is fully booked
                                alert("Sorry, the selected date is fully booked. Please choose another date.");
                                // Reset the date input field
                                dateInput.value = "";
                            }
                        } else {
                            // Handle AJAX request error
                            console.error("Error checking availability: " + xhr.status);
                        }
                    }
                };
        
                // Send the selected date as a parameter to CheckAvailabilityServlet
                xhr.send("selectedDate=" + encodeURIComponent(selectedDate));
            });
        </script>-->

        <!--<script>
            var dateInput = document.getElementById("book_date");
        
            dateInput.addEventListener("change", function() {
                var selectedDate = new Date(this.value);
        
                // Check if the selected date is a Sunday (day number 0)
                if (selectedDate.getDay() === 0) {
                    this.value = "";
                    alert("The store is CLOSED on Sundays. Please choose another date.");
                } else {
                    // Make an AJAX request to the server to check if the date is fully booked
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            var response = xhr.responseText;
                            if (response === "fully_booked") {
                                this.value = "";
                                alert("Sorry, the selected date is fully booked. Please choose another date.");
                            }
                        }
                    };
                    xhr.open("GET", "check_booking_status.jsp?date=" + this.value, true);
                    xhr.send();
                }
            });
        </script>-->

        <!--<script>
        // Get the date input field
        var dateInput = document.getElementById("book_date");
        // Get the element to show the booking status message
        var bookingStatusMessage = document.getElementById("bookingStatusMessage");
        
        // Add event listener to the date input field
        dateInput.addEventListener("change", function() {
            // Get the selected date
            var selectedDate = new Date(this.value);
        
            // Check if the selected date is a Sunday (day number 0)
            if (selectedDate.getDay() === 0) {
                this.value = ""; // Reset the value of the input field
                alert("The store is CLOSED on Sundays. Please choose another date.");
                return; // Exit the function to prevent further processing
            }
        
            // Make an AJAX request to CheckAvailabilityServlet
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/checkAvailability", true); // Update the AJAX request URL to match the servlet URL
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Parse the response JSON
                        var response = JSON.parse(xhr.responseText);
                        var isFullyBooked = response.isFullyBooked;
        
                        if (isFullyBooked) {
                            // Show a message to the user indicating that the selected date is fully booked
                            bookingStatusMessage.textContent = "Sorry, the selected date is fully booked. Please choose another date.";
                            // Reset the date input field
                            dateInput.value = "";
                        } else {
                            // Clear the booking status message if the selected date is available
                            bookingStatusMessage.textContent = "";
                        }
                    } else {
                        // Handle AJAX request error
                        console.error("Error checking availability: " + xhr.status);
                    }
                }
            };
        
            // Send the selected date as a parameter to CheckAvailabilityServlet
            xhr.send("selectedDate=" + encodeURIComponent(selectedDate.toISOString()));
        });
        
        
        
        </script>-->

        <script>
            // Get the date input field
            var dateInput = document.getElementById("book_date");

            // Add event listener to the date input field
            dateInput.addEventListener("change", function () {
                // Get the selected date
                var selectedDate = this.value;

                // Make an AJAX request to CheckDateAvailability
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "checkAvailability", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Parse the response JSON
                            var response = JSON.parse(xhr.responseText);
                            var isFullyBooked = response.isFullyBooked;

                            if (isFullyBooked) {
                                // Show a message to the user indicating that the selected date is fully booked
                                alert("Sorry, the selected date is fully booked. Please choose another date.");
                                // Reset the date input field
                                dateInput.value = "";
                            }
                        } else {
                            // Handle AJAX request error
                            console.error("Error checking availability: " + xhr.status);
                        }
                    }
                };

                // Send the selected date as a parameter to CheckAvailabilityServlet
                xhr.send("selectedDate=" + encodeURIComponent(selectedDate));
            });
        </script>
        <!DOCTYPE html>
    <html>
        <head>
            <!-- Your head content goes here -->
        </head>
        <body>
            <%-- Your existing HTML content goes here --%>

            <!-- Add a new element to show the booking status message -->
            <div id="bookingStatusMessage"></div>

            <%-- Your existing HTML content continues here --%>

            <%-- Your JavaScript code goes here --%>
            <script>
                // Get the date input field
                var dateInput = document.getElementById("book_date");
                // Get the element to show the booking status message
                var bookingStatusMessage = document.getElementById("bookingStatusMessage");

                // Add event listener to the date input field
                dateInput.addEventListener("change", function () {
                    // Get the selected date
                    var selectedDate = new Date(this.value);

                    // Check if the selected date is a Sunday (day number 0)
                    if (selectedDate.getDay() === 0) {
                        // If it's a Sunday, reset the value of the input field
                        this.value = "";
                        // Optionally, you can show an alert or a message to inform the user that Sundays are not allowed
                        alert("The store is CLOSED on Sundays. Please choose another date.");
                        return; // Exit the function to prevent further processing
                    }

                    // Make an AJAX request to CheckAvailabilityServlet
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "checkAvailability", true); // Update the AJAX request URL to match the servlet URL
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                // Parse the response JSON
                                var response = JSON.parse(xhr.responseText);
                                var isFullyBooked = response.isFullyBooked;

                                if (isFullyBooked) {
                                    // Show a message to the user indicating that the selected date is fully booked
                                    bookingStatusMessage.textContent = "Sorry, the selected date is fully booked. Please choose another date.";
                                    // Reset the date input field
                                    dateInput.value = "";
                                } else {
                                    // Clear the booking status message if the selected date is available
                                    bookingStatusMessage.textContent = "";
                                }
                            } else {
                                // Handle AJAX request error
                                console.error("Error checking availability: " + xhr.status);
                            }
                        }
                    };

                    // Send the selected date as a parameter to CheckAvailabilityServlet
                    xhr.send("selectedDate=" + encodeURIComponent(selectedDate.toISOString()));
                });
            </script>


        </body>
    </html>

