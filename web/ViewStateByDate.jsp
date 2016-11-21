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
            a:link {
                color: white;
            }
            a:visited {
                color: palevioletred;
            }
            a:hover {
                color: greenyellow;
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
            .rounded {
                -webkit-border-radius: 20px;
                -moz-border-radius: 20px;
                border-radius: 20px;
            }
            .styled-select {
                background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
                height: 29px;
                overflow: hidden;
                width: 240px;
            }
            .semi-square {
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
            }
            .green   { background-color: #779126; }
            .select_join {
                width: 170px;
                height: 28px;
                overflow: hidden;
/*                background: url('http://s24.postimg.org/lyhytocf5/dropdown.png') no-repeat right #FEFEFE;*/
                border: black 1px solid;
                -webkit-border-radius: 3px;
/*                border-radius: 3px;
                -webkit-box-shadow: inset 0px 0px 10px 1px #FEFEFE;
                box-shadow: inset 0px 0px 10px 1px #FEFEFE;*/
            }
        </style>    

    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/><br><br><br>
        <form action="OrderByTime" method="GET">

            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <center>  <table>                    

                    <h1><span class="black"><b>{</b></span><span class="yellow">VIEW STAT BY DATE<span class="black"><b>}</b></span></h1><br></center>
                    <tr><center>
                        <td><center><h4>Category :</h4></center></td> 

                            <td><select name="range" id="category" class="select_join green" onchange="cat()" style="width: 150px;">
                                <option value="monthandyear" ${param.range=='monthandyear' ? 'selected': ''}>Month and Year</option>
                                <option value="month" ${param.range=='month' ? 'selected': ''}>Month</option>
                                <option value="year" ${param.range=='year' ? 'selected': ''}>Year</option>                                
                                </select></td>

                            
                                <td id="mt">&nbsp;Month :&nbsp;</td>

                            <td><select name="month" style="width: 100px;" class="select_join green" id="month" ${param.range=='month'}>
                                <option value='1' ${param.month==1 ? 'selected': ''}>January</option>
                                <option value='2' ${param.month==2 ? 'selected': ''}>February</option>
                                <option value='3' ${param.month==3 ? 'selected': ''}>March</option>
                                <option value='4' ${param.month==4 ? 'selected': ''}>April</option>
                                <option value='5' ${param.month==5 ? 'selected': ''}>May</option>
                                <option value='6' ${param.month==6 ? 'selected': ''}>June</option>
                                <option value='7' ${param.month==7 ? 'selected': ''}>July</option>
                                <option value='8' ${param.month==8 ? 'selected': ''}>August</option>
                                <option value='9' ${param.month==9 ? 'selected': ''}>September</option>
                                <option value='10' ${param.month==10 ? 'selected': ''}>October</option>
                                <option value='11' ${param.month==11 ? 'selected': ''}>November</option>
                                <option value='12' ${param.month==12 ? 'selected': ''}>December</option>
                                </select> </td>

                            
                                <td id="ye">&nbsp;Year :&nbsp;</td>

                            <td><select name="year" style="width: 70px;" class="select_join green" id="year" ${param.range=='year'}>
                                <option value='2005' ${param.year==2005 ? 'selected': ''}>2005</option>
                                <option value='2006' ${param.year==2006 ? 'selected': ''}>2006</option>
                                <option value='2007' ${param.year==2007 ? 'selected': ''}>2007</option>
                                <option value='2008' ${param.year==2008 ? 'selected': ''}>2008</option>
                                <option value='2009' ${param.year==2009 ? 'selected': ''}>2009</option>
                                <option value='2010' ${param.year==2010 ? 'selected': ''}>2010</option>
                                <option value='2011' ${param.year==2011 ? 'selected': ''}>2011</option>
                                <option value='2012' ${param.year==2012 ? 'selected': ''}>2012</option>
                                <option value='2013' ${param.year==2013 ? 'selected': ''}>2013</option>
                                <option value='2014' ${param.year==2014 ? 'selected': ''}>2014</option>
                                <option value='2015' ${param.year==2015 ? 'selected': ''}>2015</option>
                                <option value='2016' ${param.year==2016 ? 'selected': ''}>2016</option>
                                </select></td>

                            &nbsp;
                            <td>&nbsp;Order Type :&nbsp;</td>

                            <td><select name="viewBy" class="select_join green" style="width: 70px;">
                                <option value="in" ${param.viewBy=='in' ? 'selected': ''}>IN</option>
                                <option value="out" ${param.viewBy=='out' ? 'selected': ''}>OUT</option>
                                <option value="all" ${param.viewBy=='all' ? 'selected': ''}>ALL</option>
                            </select></td>
                     
                            <td>&nbsp;&nbsp;&nbsp;<input type="submit" value="SEARCH" class="btn-default semi-square"/>&nbsp;</td>
                            
                            <input type="hidden" name="range" value="${param.range}">
                            <input type="hidden" name="range" value="${param.range}">
                            <input type="hidden" name="month" value="${param.month}">
                            <input type="hidden" name="year" value="${param.year}">
                            <input type="hidden" name="viewBy" value="${param.viewBy}">
                        </h4>
                    </center>
                    </tr>

                </table></center>

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
                                    <td><a href="EditProduct?prod_id=${ord.prodId}&source=ViewStateByDate.jsp">${ord.prodName}</a></td>
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
    <script>
        function cat() {
            var x = document.getElementById("category");
            if (x.value == "month") {
                document.getElementById("ye").style.visibility = "hidden";
                document.getElementById("year").style.visibility = "hidden";
                document.getElementById("mt").style.visibility = "visible";
                document.getElementById("month").style.visibility = "visible";
//                document.getElementById("year").disabled = true;
//                document.getElementById("month").disabled = false;
            } else if (x.value == "year") {
                document.getElementById("mt").style.visibility = "hidden";
                document.getElementById("month").style.visibility = "hidden";
                document.getElementById("ye").style.visibility = "visible";
                document.getElementById("year").style.visibility = "visible";
//                document.getElementById("month").disabled = true;
//                document.getElementById("year").disabled = false;
            } else if (x.value == "monthandyear") {
                document.getElementById("mt").style.visibility = "visible";
                document.getElementById("month").style.visibility = "visible";
                document.getElementById("ye").style.visibility = "visible";
                document.getElementById("year").style.visibility = "visible";
//                document.getElementById("month").disabled = false;
//                document.getElementById("year").disabled = false;
            }
        }
    </script>
</html>
