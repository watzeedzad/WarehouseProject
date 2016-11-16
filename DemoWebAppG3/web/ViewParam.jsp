<%-- 
    Document   : ViewParam
    Created on : 07-Oct-2016, 08:49:29
    Author     : int303
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table,tr,td{
                border: solid black 1px;
            }
        </style>
    </head>
   
    <body>
        <h1>View Parameter</h1>
        <table>
            <tr><td>Program ID:</td><td>${param.programId}</td></tr>
            <tr><td>Student ID:</td><td>${param.sid}</td></tr>
            <tr><td>Student name:</td><td>${param.sid}</td></tr>
            <tr><td>Faculty:</td><td>${faculty[param.faculty]}</td></tr>
            <tr><td>Favourite Subject:</td>
                <td>
                    ${subjects[paramValues.subjects[0]]}${paramValues.subjects[1]==null ?"":"<br>"}
                    ${subjects[paramValues.subjects[1]]}${paramValues.subjects[2]==null ?"":"<br>"}
                    ${subjects[paramValues.subjects[2]]}${paramValues.subjects[3]==null ?"":"<br>"}
                    ${subjects[paramValues.subjects[3]]}${paramValues.subjects[4]==null ?"":"<br>"}
                    ${subjects[paramValues.subjects[4]]}${paramValues.subjects[5]==null ?"":"<br>"}
                    ${subjects[paramValues.subjects[5]]}
                </td>
            </tr>
        </table>
        <hr>
        <table>
            <tr><td>Browser:</td><td>${header["User-Agent"]}</td></tr>
            <tr><td>Accept-Language:</td><td>${header["accept-Language"]}</td></tr>
            <tr><td>Session ID:</td><td>${cookie.JSESSIONID.value}</td></tr>
        </table>
    </body>
</html>
