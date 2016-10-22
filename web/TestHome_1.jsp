<%-- 
    Document   : TestHome
    Created on : Oct 13, 2016, 2:59:08 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Theme Company</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            /* nav bar */
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
            /* nav bar */
            .jumbotron { 
                /*                background-color: #A31E39; red old*/
                background-color: #485C5A;
                color: #ffffff;
                padding: 100px 25px;
            }
            .container-fluid {
                padding: 60px 50px;
            }
            .bg-blue {
                background-color: #485C5A;
            }
            .thumbnail{
                background-color: #8C9C9A;
                border-radius: 20px;
            }
        </style>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <!--Navigation ------------------------------------------------------------------------------------------------>
        <nav class="navbar navbar-default navbar-fixed-top">
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
                        <li><a href="#product">PRODUCT</a></li>
                        <li><a href="#edit">EDIT</a></li>
                        <li><a href="#view">VIEW</a></li>
                        <li><a href="#alert">ALERT</a></li>
                        <%--  login navbar --%>
                        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
                            <ul id="login-dp" class="dropdown-menu">
                            <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputPassword2">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                                    <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> keep me logged-in
                                    </label>
                                </div>
                            </form>
                        </li>
                    </ul>



                </div>
            </div>
        </nav>
        <!--Home ------------------------------------------------------------------------------------------------>
        <div id="home" class="jumbotron text-center">
            <h1 >WareHouse</h1> 
            <p>..Welcome to the organization..</p> 
            <form class="form-inline ">
                <input type="text" class="form-control" size="20" placeholder="Search Product">
                <button type="button" class="btn btn-danger">Search</button>
            </form>
        </div>
        <!--product--------------------------------------------------------------------------------------------->
        <div id="product" class="container-fluid">
            <div class="col-sm-4"><br><br><br><br><br><br><br>
                <center><img src="image/product.png" style="width: 300px; height: 300px;"></center>
                <center><h2>PRODUCT</h2></center>
                <center><h4>blablablablablablablablablablablablablablablabl</h4></center>
            </div>
            <div class="col-sm-8">
                <div class="container-fluid text-center">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="thumbnail" >
                                <p><img src="image/box.png"></p>
                                <h4>PRODUCT REMAINING</h4>
                                <button class="btn btn-default btn-lg "><a href="product.jsp">Enter</a></button> 
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="thumbnail" >
                                <p><img src="image/podium.png"></p>
                                <h4>BEST SELLER</h4>
                                <button class="btn btn-default btn-lg"><a href="Bestseller.jsp">Enter</a></button>   
                            </div>
                        </div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="thumbnail" >
                                <p><img src="image/list.png"></p>
                                <h4>ALL PRODUCT</h4>
                                <button class="btn btn-default btn-lg">Enter</button>  
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="thumbnail" >
                                <p><img src="image/cancel.png"></p>
                                <h4>CANCEL PRODUCT</h4>
                                <button class="btn btn-default btn-lg">Enter</button>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--edit--------------------------------------------------------------------------------------------->
        <div id="edit" class="container-fluid bg-blue">
            <div class="col-sm-8">
                <div class="container-fluid text-center">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="thumbnail">
                                <p><img src="image/add.png"></p>
                                <p><strong>INCREASE</strong></p>
                                <button class="btn btn-default btn-lg">Enter</button>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="thumbnail">
                                <p><img src="image/remove.png"></p>
                                <p><strong>REDUCE</strong></p>
                                <button class="btn btn-default btn-lg">Enter</button>
                            </div>  
                        </div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="thumbnail">
                                <p><img src="image/pencil.png"></p>
                                <p><strong>EDIT</strong></p>
                                <button class="btn btn-default btn-lg">Enter</button>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="thumbnail">
                                <p><img src="image/pencil.png"></p>
                                <p><strong>EDIT</strong></p>
                                <button class="btn btn-default btn-lg">Enter</button>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4"><br><br><br><br><br><br><br>
                <center><img src="image/wrench.png" style="width: 300px; height: 300px;"></center>
                <center><h2>EDIT</h2></center>
                <center><h4>blablablablablablablablablablablablablablablabl</h4></center>
            </div>
        </div>
        <!--view--------------------------------------------------------------------------------------------->
        <div id="view" class="container-fluid text-center">
            <div class="row">
                <div class="col-sm-6">                   
                    <p><img src="image/search_1.png" style="width: 150px; height: 150px;"></p>
                    <h2>VIEW</h2>
                    <h4>blablablablablablablablablablablablablablablabl</h4>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <p><img src="image/add.png"></p>
                        <p><strong>INCREASE</strong></p>
                        <button class="btn btn-default btn-lg">Enter</button>
                    </div>
                </div>
            </div><br><br>
            <div class="row">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img src="image/podium.png">
                        <h4>number of product store</h4>
                        <button class="btn btn-default btn-lg">Enter</button>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img src="image/podium.png">
                        <h4>total price of selling</h4>
                        <button class="btn btn-default btn-lg">Enter</button>
                    </div>  
                </div>
            </div>
        </div>
        <!--Alert --------------------------------------------------------------------------------------------->
        <div id="alert" class="container-fluid bg-blue ">
            <div class="col-sm-6 text-center">
                <p><center><img src="image/nalica.png" style="width: 400px; height: 400px;"></center>
                <h2>ALERT</h2><!--
                <button class="btn btn-default btn-lg ">Enter</button>-->
            </div><br>
            <div class="col-sm-6">
                <div class="container-fluid">
                    <h2>The Emergency Alert System</h2><hr>
                    <div class=" text-center thumbnail">
                        <h4>The Emergency Alert System (EAS) is a national public warning system that requires broadcasters, 
                            cable television systems, wireless cable systems, satellite digital audio radio service 
                            (SDARS) providers, and direct broadcast satellite (DBS) providers to provide the communications

                            such as AMBER alerts and weather information targeted to specific areas.</h4>
                        <button class="btn btn-default btn-lg">Enter</button>
                    </div>
                </div>
            </div>
        </div>   
        <script>
            $(document).ready(function () {
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {
                        // Prevent default anchor click behavior
                        event.preventDefault();

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {

                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });

                $(window).scroll(function () {
                    $(".slideanim").each(function () {
                        var pos = $(this).offset().top;

                        var winTop = $(window).scrollTop();
                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            })

        </script>
    </body>
</html>
