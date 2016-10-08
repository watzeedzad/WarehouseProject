<%-- 
    Document   : index
    Created on : Oct 8, 2016, 6:59:46 PM
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
        <%
            if (session.getAttribute("user") != null) {
                getServletContext().getRequestDispatcher("/homepage.jsp").forward(request, response);
            }
        %>
        <h1>::: Welcome to Warehouse System :::</h1>
        <h1>Please login before process next step</h1>
        <form action="login" method="POST">
            <br>
            Username : <input type="text" name="username">
            <br>
            <br>
            Password : <input type="password" name="password">
            <br>
            <br>
            <input type="submit" value="Login">
            <br>
            <br>
            <%
                if (request.getParameter("username") != null) {
            %>
            ${message}
            <%                }
            %>
        </form>
    </body>
</html>
