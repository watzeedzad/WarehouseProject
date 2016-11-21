<%-- 
    Document   : Tagnavigation
    Created on : Nov 5, 2016, 3:36:36 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="#home">WareHouse</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">  
                        <li><a href="ViewAmountBranch">${staffData.company.company_name}</a></li>
                        <li><a href="#product">PRODUCT</a></li>
                        <li><a href="#edit">EDIT</a></li>
                        <li><a href="#view">STATISTIC</a></li>
                        <li><a href="#alert">ALERT</a></li>
                        <li><a href="editstaff">${staffData.firstname}</a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
                    </ul>
                </div>
            </div>
        </nav>       
    </body>
</html>
