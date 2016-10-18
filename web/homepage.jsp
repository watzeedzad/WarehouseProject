<%-- 
    Document   : homepage
    Created on : Oct 5, 2016, 9:59:15 PM
    Author     : jiraw
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Theme Made By www.w3schools.com - No Copyright -->
        <title>Bootstrap Theme Company Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
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
            .logo {
                font-size: 100px;
            }
            .jumbotron {
                background-color: #485C5A;
                color: #fff;
                padding: 100px 25px;
                font-family: 'Nunito', sans-serif;
            }
            /*            .container-fluid {
                            background-color: #D6E4E1;
                        }*/
            .containerforProduct{
                padding-top: 50px;
                padding-bottom: 50px;
            }
            .containerforEdit{
                padding-top: 50px;
                background-color: #485C5A;
                color: whitesmoke;
                font-family: 'Nunito', sans-serif;
                padding-bottom: 50px;
            }
            .containerforView{
                padding-top: 50px;
                font-family: 'Nunito', sans-serif;
                background-color: white;
                color: black;
                padding-bottom: 50px;
            }
            .thumbnail{
                background-color: #8C9C9A;
                font-family: 'Nunito', sans-serif;
            }
        </style>
    </head>
    <!--       new navigator(have a dropdown) -------------------------------------------------------------------------------------------->
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" >
        <!--        <nav class="navbar navbar-default" navbar-fixed-top>
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#home">WareHouse</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#home">
                                    <form class="form-inline ">
                                        <input type="text" class="form-control" size="20" placeholder="Search Product">
                                        <button type="button" class="btn btn-danger">Search</button>
                                    </form></a></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">PRODUCT REMAINING</a></li>
                                    <li><a href="#">BEST SELLER</a></li>
                                    <li><a href="#">ALL PRODUCT</a></li>
                                    <li><a href="#">CANCEL PRODUCT</a></li>
                                </ul>
                            </li>
                            <li><a href="#edit">EDIT</a></li>
                            <li><a href="#view">VIEW</a></li>
                            <li><a href="#alert">ALERT</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </nav>-->
        <!--    old navigation <nav class="navbar navbar-default navbar-fixed-top">
        -->                    <div class="container">
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="#home">WareHouse</a>   
                <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">PRODUCT REMAINING</a></li>
                                    <li><a href="#">BEST SELLER</a></li>
                                    <li><a href="#">ALL PRODUCT</a></li>
                                    <li><a href="#">CANCEL PRODUCT</a></li>
                                </ul>
                            </li>
                            <li><a href="#edit">EDIT</a></li>
                            <li><a href="#view">VIEW</a></li>
                            <li><a href="#alert">ALERT</a></li>
                            <li><a href="#login">LOGIN</a></li>
                        </ul> 
                    
                </div>
            </nav>
        </div>
        <!--        -------------------------------------------------------------------------------------------->
        <div id="home"class="jumbotron text-center">
            <h1>WareHourse</h1> 
            <p><form class="form-inline ">
                <input type="text" class="form-control" size="20" placeholder="Search Product">
                <button type="button" class="btn btn-danger">Search</button>
            </form></a></li></p>
</div>
<!--        -------------------------------------------------------------------------------------------->
<div id="product" class="containerforProduct text-center">
    <h2>PRODUCT</h2>
    <h4>You can choose the menu from here!!</h4> 
    <br>
    <div class="row">
        <div class="col-sm-6">
            <p><img src="image/box.png"></p>
            <h4>PRODUCT REMAINING</h4>
            <button class="btn btn-default btn-lg ">Enter</button>
        </div>
        <div class="col-sm-6">
            <img src="image/podium.png">
            <h4>BEST SELLER</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="col-sm-6">
            <p><img src="image/list.png"></p>
            <h4>ALL PRODUCT</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div>
        <div class="col-sm-6">
            <p><img src="image/cancel.png"></p>
            <h4>CANCEL PRODUCT</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div>
    </div>
</div>
<!--        -------------------------------------------------------------------------------------------->
<div id="edit" class="containerforEdit text-center">
    <h2>EDIT</span></h2>
    <h4>You can choose the menu from here!!</span></h4>
    <div class="row text-center">
        <div class="col-sm-4">
            <div class="thumbnail">
                <p><img src="image/add.png"></p>
                <p><strong>INCREASE</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="thumbnail">
                <p><img src="image/remove.png"></p>
                <p><strong>REDUCE</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="thumbnail">
                <p><img src="image/pencil.png"></p>
                <p><strong>EDIT</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
    </div>
</div>
    <!--        -------------------------------------------------------------------------------------------->
    <div id="view" class="containerforView text-center">
    <h2>VIEW</h2>
    <h4>You can choose the menu from here!!</h4> 
    <br>
    <div class="row">
        <div class="col-sm-4">
            <p><img src="image/box.png"></p>
            <h4>fdsfs</h4>
            <button class="btn btn-default btn-lg ">Enter</button>
        </div><br>
        <div class="col-sm-4">
            <img src="image/podium.png">
            <h4>fdfsdf</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div><br>
        <div class="col-sm-4">
            <img src="image/podium.png">
            <h4>fsdfsdfs</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div><br>
    </div>   
</div>
       <!--        -------------------------------------------------------------------------------------------->
       
       
</body>
</html>


