<%-- 
    Document   : CustomerDetail
    Created on : 09-Sep-2016, 09:52:36
    Author     : int303
--%>

<%@page import="sit.int303.demo.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:useBean id="customer" scope="session" type="sit.int303.demo.model.Customer" />

        <h1>Customer Listing</h1>
        <% Customer c = customer;%>

        <!--        <form action="SearchCustomer" method="post">
                    <table class="table" style="background-color: cadetblue">
                        <tr>
                            <td>Enter Customer name?id:</td>
                            <td><input type="text" name="searchParam"></td>
                            <td><input type="submit"></td>
                        </tr>            
                    </table>
                </form>-->
        <form action="SearchCustomer" method="post">
            <table class="table" style="background-color: cadetblue">
                <tr>
                    <td>Enter Customer name?id:</td>
                    <td><input type="text" name="searchParam" value="${param.searchParam}"></td>
                    <td><input type="submit"></td>
                </tr>            
            </table>
        </form>
        <table class="table table-striped">
            <tr>
                <th>Customer ID:</th>
                <td><input type="text" name="customerId" disabled size="10"
                           value="${customer.customerId}" ></td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><input type="text" name="name" disabled size="50"
                           value="${customer.name}" ></td>
            </tr>
            <tr>
                <th>City:</th>
                <td><input type="text" name="city" disabled size="20"
                           value="${customer.city}" ></td>
            </tr>
            <tr>
                <th>State:</th>
                <td><input type="text" name="state" disabled size="10"
                           value="${customer.state}" ></td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td><input type="text" name="phone" disabled size="20"
                           value="${customer.phone}" ></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="email" disabled size="50"
                           value="${customer.email}" ></td>
            </tr>
            <td><input type="button" value="back" onclick="history.back()"></td>
        </table>
        <h3>${message}</h3>
    </body>
</html>
