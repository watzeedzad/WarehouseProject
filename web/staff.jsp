<%-- 
    Document   : staff
    Created on : Oct 12, 2016, 11:47:15 AM
    Author     : jiraw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>:: Staff ::</h1>
        <form method="GET" action="viewstaff">
            <input type="submit" value="View Staff Data">
        </form>
        <br>
        <br>
        <form method="GET" action="editstaff">
            Staff ID : <input type="number" name="staffid" value="${sessionScope.staffData.staffId}" disabled>
            <br>
            Company ID : <input type="number" name="companyid" value="${sessionScope.staffData.companyId}" disabled>
            <br>
            Firstname : 
        </form>
    </body>
</html>
