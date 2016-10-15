<%-- 
    Document   : viewstaff
    Created on : Oct 14, 2016, 10:02:16 PM
    Author     : jirawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>:: View Staff ::</h1>
        <br>
        Staff ID : ${sessionScope.staffData.staffId}
        <br>
        Company ID : ${sessionScope.staffData.companyId}
        <br>
        Firstname : ${sessionScope.staffData.firstname}
        <br>
        Lastname : ${sessionScope.staffData.lastname}
        <br>
        Citizen No : ${sessionScope.staffData.citizenNo}
        <br>
        Address : ${sessionScope.staffData.address}
        <br>
        Position : ${sessionScope.staffData.position}
    </body>
</html>
