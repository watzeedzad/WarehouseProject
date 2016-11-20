<%-- 
    Document   : Tagnavigation_other
    Created on : Nov 7, 2016, 9:51:29 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
            
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="TestHome.jsp">WareHouse</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right ">
                        <li class="dropdown"><a class="dropdown-toggle"  href="#" data-toggle="dropdown" >PRODUCT<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="AllProduct">ALL PRODUCT</a></li>
                                <li><a href="BestSeller">BEST SELLER</a></li>
                                <li><a href="OutOfStock">OUT OF STOCK</a></li>
                                <li><a href="CancelProduct">CANCEL PRODUCT</a></li>
                            </ul>
                        </li>
                        <li><a href="Editallpage.jsp">EDIT</a></li>

                        <li class="dropdown"><a class="dropdown-toggle"  href="#" data-toggle="dropdown" >VIEW<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="yodkaitormonth.jsp">YODCAYPERMONTH</a></li>
                                <li><a href="yodkaisinka.jsp">YODCAYPRODUCT</a></li>
                            </ul>
                        </li>
                        <li><a href="UpdateAlert">ALERT</a></li>
                        <li><a href="editstaff">USER</a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
                    </ul>
                </div>
            </div>
        </nav>       
    </body>
</html>
