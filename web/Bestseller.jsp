<%-- 
    Document   : Bestseller
    Created on : Oct 15, 2016, 9:29:45 AM
    Author     : petch
--%>

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
                background-color: black;
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
            .add-pro input{
                padding: 10px;
                margin: 10px;
                border-radius: 10px; 
            }
        </style>
    </head>
    <body>
        <%-- Nav--%>
        <nav class="navbar navbar-default navbar-fixed-top">
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
                    <ul class="nav navbar-nav navbar-right">
                        <!--                        <li><a href="#product">PRODUCT</a></li>-->
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#product">PRODUCT<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">PRODUCT REMAINING</a></li>
                                <li><a href="#">BEST SELLER</a></li>
                                <li><a href="#">ALL PRODUCT</a></li>
                                <li><a href="#">CANCEL PRODUCT</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#edit">EDIT<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">INCREASE</a></li>
                                <li><a href="#">REDUCE</a></li>
                                <li><a href="#">EDIT</a></li>
                                <li><a href="#">EDIT</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#view">VIEW<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1-1</a></li>
                                <li><a href="#">Page 1-2</a></li>
                                <li><a href="#">Page 1-3</a></li>
                                <li><a href="#">Page 1-3</a></li>
                            </ul>
                        </li>
                        <li><a href="#alert">ALERT</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Ranking</th>
                                <th>NameProduct</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Pen</td>
                                <td>200</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Rubber</td>
                                <td>50</td>
                            </tr>
                            <tr>
                                <td>3</td>
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



    </body>
</html>
