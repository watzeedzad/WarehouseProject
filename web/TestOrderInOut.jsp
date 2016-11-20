<%-- 
    Document   : TestOrderInOut
    Created on : Nov 20, 2016, 11:40:09 AM
    Author     : jiraw
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="OrderInOut" method="GET">
            <P>Search : <input name="searchParam" type="text"/></p>
            <p>
                <select name="viewBy">
                    <option value="in">IN</option>
                    <option value="out">OUT</option>
                    <option value="all">ALL</option>
                </select>
            </p>
            <p><input type="submit"/></p>
        </form>
        <br>
        <c:forEach var="ord" items="${orders}">
            <p>${ord.prodName}</p>
            <p>${ord.prodAmount}</p>
            <p>${ord.orderId}</p>
            <p>${ord.staffName}</p>
            <p>${ord.orderType}</p>
            <p>${ord.dateOrder}</p>
            <p>${ord.branchName}</p>
        </c:forEach>
    </body>
</html>
