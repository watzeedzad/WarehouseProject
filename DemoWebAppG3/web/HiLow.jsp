<%-- 
    Document   : HiLow
    Created on : 05-Aug-2016, 10:23:00
    Author     : int303
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>::HiLow Game::</h1><hr>
        <form action="Hilow" method="post">
            Enter you guess number :<input type="number" required name = "number"/>
            <input type = "submit"/>
        </form>
        <hr>
        <h3>${message}</h3><hr>
        (${h1.d1.face},${h1.d2.face},${h1.d3.face}==>${h1.hiLow})
    </body>
</html>
