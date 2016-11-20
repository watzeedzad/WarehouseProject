<%-- 
    Document   : TestOrderInOutTime
    Created on : Nov 20, 2016, 6:22:47 PM
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
        <h1>Hello World!</h1>
        <form method="GET" action="OrderByTime">
            <p>
                <select name="range">
                    <option value="month">Month</option>
                    <option value="year">Year</option>
                    <option value="month_year">Month and Year</option>
                </select>
            </p>
            <p>
                <select name="month">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </p>
            <p>
                <select name="year">
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select>
            </p>
            <p>
                <select name="viewBy">
                    <option value="in">IN</option>
                    <option value="out">OUT</option>
                    <option value="all">ALL</option>
                </select>
            </p>
            <p><input type="submit"/></p>
        </form>

    <c:if test="${messagesTime!=null}">
        <hr>
        <h2>${messagesTime}</h2>
    </c:if>

    <c:if test="${ordersTime!=null}">
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
            <c:forEach var="ord" items="${ordersTime}">
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
