<%-- 
    Document   : ViewStateByDate
    Created on : Nov 20, 2016, 6:13:34 PM
    Author     : 000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
            bg-dark{
                background-color: #1F2739;
            }
            .navbar {
                margin-bottom: 0;
                background-color: black;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
            }
            body{
                /*background-color: #8C9C9A;*/
                /*                background-color:#1F2739;*/
                background-color:#185875;
                color: white;
                font-family: sans-serif
            }
            .container-fluid{
                padding-top: 60px;
            }
            .modal-dialog{
                padding-top: 80px;
                width: 400px;
            }
            .form-group{
                width: 200px;
            }
            .add-pro input{
                padding: 10px;
                margin: 10px;
                border-radius: 10px; 
            }
            .bg-taley{
                background-color:#185875;
            }
            .bg-dark{
                background-color:#1F2739;
            }
            .blue { color: #185875; }
            .yellow { color: #FFF842; }
            .black { color: black}
            .text-white{ color: white}
            .center{text-align: center}
        </style>    

    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/><br><br><br>
        <form action="OrderByTime" method="GET">

            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <table>
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">VIEW STAT BY DATE<span class="black"><b>}</b></span></h1><br></center>
                    <tr><td>Category : </td>
                        <td>
                            <select name="range"" id="category" class="black">
                                <option value=''>--Select View By--</option>
                                <option value="month" ${param.searchDateBy=='month' ? 'selected': ''}>Month</option>
                                <option value="year" ${param.searchDateBy=='year' ? 'selected': ''}>Year</option>
                                <option value="monthandyear" ${param.searchDateBy=='monthandyear' ? 'selected': ''}>Month and Year</option>
                            </select>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>Month : </td>
                        <td>
                            <select name="month" class="black">
                                <option value=''>--Select Month--</option>
                                <option value='1'>Janaury</option>
                                <option value='2'>February</option>
                                <option value='3'>March</option>
                                <option value='4'>April</option>
                                <option value='5'>May</option>
                                <option value='6'>June</option>
                                <option value='7'>July</option>
                                <option value='8'>August</option>
                                <option value='9'>September</option>
                                <option value='10'>October</option>
                                <option value='11'>November</option>
                                <option value='12'>December</option>
                            </select> 
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>Year</td>
                        <td>
                            <select name="year"  class="black">
                                <option value=''>--Select Year--</option>
                                <option value='2005'>2005</option>
                                <option value='2006'>2006</option>
                                <option value='2007'>2007</option>
                                <option value='2008'>2008</option>
                                <option value='2009'>2009</option>
                                <option value='2010'>2010</option>
                                <option value='201'>2011</option>
                                <option value='2012'>2012</option>
                                <option value='2013'>2013</option>
                                <option value='2014'>2014</option>
                                <option value='2015'>2015</option>
                                <option value='2016'>2016</option>
                            </select>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> Order Type</td>
                        <td>
                            <select name="viewBy" class="black" >
                                <option value=''>--Order Type--</option>
                                <option value="in">IN</option>
                                <option value="out">OUT</option>
                                <option value="all">ALL</option>
                            </select>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="submit" value="Submit" class="btn-default"></td>
                    </tr>
                </table>

                <table class="table table-inverse">
                    <thead>
                        <c:if test="${messagesTime!=null}">
                            <tr>
                                <td colspan="10" style="text-align: center;"> <c:out value="${messagesTime}" ></c:out> </td>
                                </tr>                            
                        </c:if>

                        <c:if test="${ordersTime != null}">
                            <tr class="bg-dark text-white">
                                <th>Order ID</th>
                                <th>Product Id</th>
                                <th>Name</th>
                                <th>Amount</th>
                                <th>Staff Name</th>
                                <th>Order Type</th>
                                <th>Date</th>
                                <th>Branch</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ord" items="${ordersTime}">
                                <tr>
                                    <td>${ord.orderId}</td>
                                    <td>${ord.prodId}</td>
                                    <td>${ord.prodName}</td>
                                    <td>${ord.prodAmount}</td>
                                    <td>${ord.staffName}</td>
                                    <td>${ord.orderType}</td>
                                    <td>${ord.dateOrder}</td>
                                    <td>${ord.branchName}</td>
                                </tr>
                            </c:forEach>
                        </tbody>                        
                    </c:if>
                </table>
            </div>

            <div class="col-sm-2">

            </div>
        </form>
    </body>
</html>
