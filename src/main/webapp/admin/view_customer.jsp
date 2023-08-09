<%-- 
    Document   : view_customer.jsp
    Created on : 01-Aug-2023, 21:56:27
    Author     : emi
--%>

<%@page import="com.entity.Booking"%>
<%@page import="com.dao.BookingDao"%>
<%@page import="com.entity.Customer"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.gersgarage.SQLconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>view customer JSP Page</title>
    <%@include file="../component/allcss.jsp"%>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>

</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="col-md-12">
        <div class="card paint-card">
            <div class="card-body">
                <p class="fs-3 text-center">Customer Details</p>

                <%-- Form for filtering by customer ID --%>
                <form action="view_customer.jsp" method="GET">
                    <label for="filterCustomerId">Filter by Customer ID:</label>
                    <input type="text" id="filterCustomerId" name="filterCustomerId" value="<%= request.getParameter("filterCustomerId") %>">
                    <button type="submit">Filter</button>
                </form>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Customer ID</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Sir Name</th>
                            <th scope="col">Email address</th>
                            <th scope="col">Mobile number</th>
                            <th scope="col">History(BookingID)</th>

                        </tr>
                    </thead>
                    
                    <tbody>
                        <%-- Get the customer ID for filtering --%>
                        <% String filterCustomerId = request.getParameter("filterCustomerId"); %>

                        <%-- Create a new instance of CustomerDao --%>
                        <% CustomerDao customerDao = new CustomerDao(SQLconnect.getConn()); %>

                        <%-- Retrieve all customer data --%>
                        <% List<Customer> customerList = customerDao.getAllCustomer(); %>

                        <%-- Filter the customer data if the filterCustomerId is not null or empty --%>
                        <% if (filterCustomerId != null && !filterCustomerId.isEmpty()) { %>
                            <% try { %>
                                <% int customerId = Integer.parseInt(filterCustomerId); %>
                                <% customerList = customerDao.getCustomersById(customerId); %>
                            <% } catch (NumberFormatException e) {
                                    // Handle invalid customer ID input (e.g., non-numeric characters)
                                    // In this case, do not apply filtering and display all customers.
                            } %>
                        <% } %>

                        <%-- Display customer details --%>
                        <% for (Customer customer : customerList) { %>
                            <tr>
                                <td><%= customer.getId() %></td>
                                <td><%= customer.getfName() %></td>
                                <td><%= customer.getsName() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td><%= customer.getMobNo() %></td>
                                <td> <% BookingDao bookingDao = new BookingDao(SQLconnect.getConn()); %>
                                   <%  List<Booking> bookingList = bookingDao.getAllBookingByLoginCustomer(customer.getId());
                                 %>
                                <table>

                                        <tbody>
                                            <% for (Booking booking : bookingList) { %>
                                                <tr>
                                                    <td><%= booking.getId() %></td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                    </table></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

