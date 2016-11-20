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
        
        <c:if test="${messages!=null}">
            <hr>
            <h2>${messages}</h2>
        </c:if>
        
        <c:if test="${orders!=null}">
            <table>
                <tr>
                    <td>Name</td>
                    <td>amount</td>
                    <td>orderId</td>
                    <td>staffName</td>
                    <td>orderType</td>
                    <td>dateOrder</td>
                    <td>branchName</td>
                </tr>
                <c:forEach var="ord" items="${orders}">
                    <tr>
                        <td>${ord.prodName}</td>
                        <td>${ord.prodAmount}</td>
                        <td>${ord.orderId}</td>
                        <td>${ord.staffName}</td>
                        <td>${ord.orderType}</td>
                        <td>${ord.dateOrder}</td>
                        <td>${ord.branchName}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
