<%-- 
    Document   : index
    Created on : 14-Oct-2016, 09:23:33
    Author     : int303
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   
    <body style="background-color: F5F5F5" >
        
                    <jsp:include page="WEB-INF/jsp/Header.jsp?title=G3: Home-Page:::" />
                <div style="margin-left: 50px; width: 30%">
                    <p>Welcome to my page</p><hr>
                    <p><a href="Page1">page-1</a></p>
                    <p><a href="">page-2</a></p>
                    <p><a href="">page-3</a></p>
                    <p><a href="">page-4</a></p>
                    <p><a href="SearchCustomer">Search Customer</a></p>
                    <p><a href="SearchProduct">Our Product</a>
                    <p><a href="${loginOrLogout}">${loginOrLogout}</a></p>
                </div>
    </body>
</html>
