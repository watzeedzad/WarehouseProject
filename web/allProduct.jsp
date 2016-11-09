<%-- 
    Document   : Bestseller
    Created on : Oct 15, 2016, 9:29:45 AM
    Author     : petch
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <style>
            .navbar {
                margin-bottom: 0;
                background-color: #A31E39;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
            }

            .navbar li a, .navbar .navbar-brand {
                color: #fff !important;
            }

            .navbar-nav li a:hover, .navbar-nav li.active a {
                color: #f4511e !important;
                background-color: #fff !important;
            }

            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }
            .dropdown-menu{
                background-color: #A31E39;
            }
            body{
                background-color: #8C9C9A;
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
            .button a{
                color: white;
            }
         
            </style>
    </head>
    <body>
        <%-- Nav--%>
        <div style="text-align: center; margin-top: 100px;">
            <a href="AllProduct"><button class="btn btn-default btn-lg ">All Product</button></a> 
            
            <form action="AllProduct" method="get">                
                Search By Name or Id : <input type="text" name="searchParam" width="200px" value="${param.searchParam}">
                <input type="submit" value="Submit" class="btn btn-default btn-lg">
            </form>
            ${message}
        </div>
       
         <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NameProduct</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>100001</td>
                                <td>Pen</td>
                                <td>200</td>
                            </tr>
                            <tr>
                                <td>100002</td>
                                <td>Rubber</td>
                                <td>50</td>
                            </tr>
                            <tr>
                                <td>100003</td>
                                <td>Ruler</td>
                                <td>40</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>    
            <div class="col-sm-2">

            </div>
        </div>
        <div class="row text-center">
            <div class="button">
                <button type="button" class="btn btn-primary"><a href="TestHome.jsp">OK</a></button>
            </div>
            <table style="border: solid; margin-left: 250px; " width="500px">
                <tr>
                    <td>id</td>
                    <td>name</td>
                    <td>price</td>
                    <td>amount</td>
                </tr>
                <c:forEach items="${products}" var="p" varStatus="vs">                       
                    <tr>
                        <td> ${p.prod_id}</td>
                        <td> ${p.prod_name}</td>
                        <td> ${p.price}</td>
                        <td> ${p.amount} </td>
                    </tr>                   
                </c:forEach>
            </table>
    </body>
</html>
