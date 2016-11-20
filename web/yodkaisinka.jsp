<%-- 
    Document   : PraewTest
    Created on : Nov 20, 2016, 3:17:29 PM
    Author     : Praewhubb
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
    <c:if test="${message != null}">
        <h2>${message}</h2>
    </c:if>

    <c:if test="${messageJa != null}">
        <h3>${messageJa}</h3>
    </c:if>                

    <c:if test="${productsAlert!=null}">

        <table class="table table-inverse">
            <tr class="bg-dark">
                <td>id</td>
                <td>name</td>
                <td>price</td>
                <td>amount</td>
            </tr>
            <c:forEach items="${productsAlert}" var="p" varStatus="vs"> 
                <tr>
                    <td>${vs.count}</td>
                    <td>${p.prod_id}</td>
                    <td>${p.prod_name}</td>                    
                </tr>
            </c:forEach>

                                          
        </table>         
    </c:if>
</body>
</html>
