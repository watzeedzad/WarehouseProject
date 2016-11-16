


<%@page import="java.util.List"%>
<%@page import="sit.int303.demo.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
        <style>
            body{
                moz-filter:grayscale(100%);
                webkit-filter:grayscale(100%);
                filter:gray;
                filter:grayscale(100%);
            }
        </style>
    </head>
    <body>
<!--        <h1>Customer Listing</h1>-->
       <jsp:include page="WEB-INF/jsp/Header.jsp?title=G3: List-Customer:::" />
        <form action="SearchCustomer" method="post">
            <table class="table" style="background-color: cadetblue">
                <tr>
                    <td>Enter Customer name?id:</td>
                    <td><input type="text" name="searchParam" value="${param.searchParam}"></td>
                    <td><input type="submit"></td>
                </tr>            
            </table>
        </form>

        <c:if test="${customers != null}">
            <table class="table table-striped">
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Phone</th>
                    <th>Email</th>
                </tr>
                <c:forEach items="${customers}" var="customer" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${customer.customerId}</td>
                        <td><a href="SearchCustomer?searchParam=${customer.customerId}">${customer.name}</a></td> 
                        <td>${customer.city}</td>
                        <td>${customer.state}</td>
                        <td>${customer.phone}</td>  
                        <td>${customer.email}</td>             
                    </tr>
                </c:forEach>
            </table>
        </c:if><hr>
        <h3>${message}</h3>
    </body>
</html>
