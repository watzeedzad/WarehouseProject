<%-- 
    Document   : logon
    Created on : Oct 5, 2016, 9:58:49 PM
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
        <h1>Logon Member</h1>
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
            ${message}
            Test git commit
        </form>
    </body>
</html>
