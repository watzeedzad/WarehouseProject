<%-- 
    Document   : TestHome
    Created on : Oct 13, 2016, 2:59:08 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>-->
<head>
    <title>Bootstrap Theme Company</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Francois+One" rel="stylesheet">
    <style>
        #home{
            background-image: url("image/warehouse.jpg");
            position: fixed auto calc;
            /*background-size: 100%;*/
            width: 100%;
            height: 780px;
            display:block;
            padding:0 !important;
            margin:0;
            font-family: 'Francois One', sans-serif;
            -webkit-text-stroke-width: 3px;
            -webkit-text-stroke-color: black;    
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
            background-color: gray;
            /*background-color: #485C5A;*/
        }
        .bg-gray{
            background-color: gainsboro;
        }
        .thumbnail{
            background-color: #8C9C9A;
            border-radius: 20px;
        }
        /*footer */
        footer .glyphicon {
            font-size: 20px;
            margin-bottom: 20px;
            color: #f4511e;
        }
        /*slide element */
        .slideanim {visibility:hidden;}
        .slide {
            /* The name of the animation */
            animation-name: slide;
            -webkit-animation-name: slide; 
            /* The duration of the animation */
            animation-duration: 1s; 
            -webkit-animation-duration: 1s;
            /* Make the element visible */
            visibility: visible; 
        }

        /* Go from 0% to 100% opacity (see-through) and specify the percentage from when to slide in the element along the Y-axis */
        @keyframes slide {
            0% {
                opacity: 0;
                transform: translateY(70%);
            } 
            100% {
                opacity: 1;
                transform: translateY(0%);
            } 
        }
        @-webkit-keyframes slide {
            0% {
                opacity: 0;
                -webkit-transform: translateY(70%);
            } 
            100% {
                opacity: 1;
                -webkit-transform: translateY(0%);
            }
        }
    </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <jsp:include page="/WEB-INF/jsp/Tagnavigation.jsp"/>
    <!--Home ----------------------------------------class="jumbotron text-center"-------------------------------------------------------->  
    <div id="home" class="jumbotron text-center" >       
        <div class="slideanim">
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <h1>WareHouse</h1> 
        </div>
    </div>
    <!--product--------------------------------------------------------------------------------------------->
    <div id="product" class="container-fluid bg-gray">
        <div class="col-sm-4"><br><br><br><br><br><br><br>
            <center><img src="image/product.png" style="width: 300px; height: 300px;"></center>
            <center><h1>PRODUCT</h1></center>
            <center><h4>You can see all product this here!</h4></center>
        </div>
        <div class="col-sm-8">
            <div class="container-fluid text-center">
                <div class="row slideanim ">
                    <div class="col-sm-6">
                        <div class="thumbnail" >
                            <p><img src="image/box.png"></p>
                            <h4><b>ALL PRODUCT</b></h4>
                            <a href="AllProduct"><button class="btn btn-default btn-lg ">Enter</button></a>                            
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="thumbnail" >
                            <p><img src="image/podium.png"></p>
                            <h4><b>BEST SELLER</b></h4>
                            <button class="btn btn-default btn-lg"><a href="BestSeller.jsp">Enter</a></button>   
                        </div>
                    </div>
                </div><br><br>
                <div class="row slideanim ">
                    <div class="col-sm-6">
                        <div class="thumbnail" >
                            <p><img src="image/list.png"></p>
                            <h4><b>สินค้าที่หมด</b></h4>
                            <button class="btn btn-default btn-lg"><a href="CancelProduct.jsp">Enter</a></button>  
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="thumbnail" >
                            <p><img src="image/cancel.png"></p>
                            <h4><b>CANCEL PRODUCT</b></h4>
                            <button class="btn btn-default btn-lg"><a href="CancelProduct.jsp">Enter</a></button>  
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
                <div class="row slideanim ">
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <p><img src="image/add.png"></p>
                            <p><strong>ADD</strong></p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">ADD</button>
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h2 class="modal-title">ADD PRODUCT</h2>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form >
                                                    <table class="add-pro">
                                                        <tr>
                                                            <td>Name:</td>
                                                            <td><input type="text" name="name"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Amount:</td>
                                                            <td><input type="text" name="amount"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price:</td>
                                                            <td><input type="text" name="price"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Type:</td>
                                                            <td><input type="text" name="type"></td>
                                                        </tr>
                                                    </table>

                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" >ADD</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <p><img src="image/remove.png"></p>
                            <p><strong>REMOVE</strong></p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">REMOVE</button>

                            <div class="modal fade" id="myModal1" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Remove Products</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="add-pro">
                                                <tr>
                                                    <td>ID:</td>
                                                    <td><input type="text" name="id"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Remove</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div><br><br>
                <div class="row slideanim ">
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <p><img src="image/pencil.png"></p>
                            <p><strong>INCREASE</strong></p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">INCREASE</button>
                            <div class="modal fade" id="myModal2" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">INCREASE</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="add-pro">
                                                <tr>
                                                    <td>ID:</td>
                                                    <td><input type="text" name="id"></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount:</td>
                                                    <td><input type="text" name="amount1"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="thumbnail">
                            <p><img src="image/pencil.png"></p>
                            <p><strong>REDUCE</strong></p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3">REDUCE</button>
                            <div class="modal fade" id="myModal3" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Reduce Product</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="add-pro">
                                                <tr>
                                                    <td>ID:</td>
                                                    <td><input type="text" name="id2"></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount:</td>
                                                    <td><input type="text" name="amount2"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4"><br><br><br><br><br><br><br>
            <center><img src="image/wrench.png" style="width: 300px; height: 300px;"></center>
            <center><h1>EDIT</h1></center>
            <center><h4>blablablablablablablablablablablablablablablabl</h4></center>
        </div>
    </div>
    <!--view--------------------------------------------------------------------------------------------->
    <div id="view" class="container-fluid text-center bg-gray">
        <div class="row slideanim ">
            <div class="col-sm-6">                   
                <p><img src="image/search_1.png" style="width: 150px; height: 150px;"></p>
                <h2>VIEW</h2>
                <h4>blablablablablablablablablablablablablablablabl</h4>
            </div>
            <div class="col-sm-6">
                <div class="thumbnail">
                    <p><img src="image/password.png"></p>
                    <p><strong>ยอดขายต่อเดือน</strong></p>
                    <button class="btn btn-default btn-lg">Enter</button>
                </div>
            </div>
        </div><br><br>
        <div class="row slideanim ">
            <div class="col-sm-6">
                <div class="thumbnail">
                    <img src="image/password.png">
                    <p><strong>ยอดเก็บสินค้า</strong></p>
                    <button class="btn btn-default btn-lg">Enter</button>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="thumbnail">
                    <img src="image/password.png">
                    <p><strong>ยอดขายสินค้า</strong></p>
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
                <div class=" text-center thumbnail slideanim ">
                    <h4>The Emergency Alert System (EAS) is a national public warning system that requires broadcasters, 
                        cable television systems, wireless cable systems, satellite digital audio radio service 
                        (SDARS) providers, and direct broadcast satellite (DBS) providers to provide the communications

                        such as AMBER alerts and weather information targeted to specific areas.</h4>
                    <button class="btn btn-default btn-lg">Enter</button>
                </div>
            </div>
        </div>
    </div>   
    <footer class="container-fluid text-center bg-gray">
        <a href="#myPage" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
        <p>Bootstrap Theme Made By <a href="http://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p> 
    </footer>


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
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
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
//           popover
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover({
                placement: 'top',
                html: true,
                title: 'User Info <a href="#" class="close" data-dismiss="alert">×</a>',
                content: '<div class="media"><a href="#" class="pull-left"><img src="../images/avatar-tiny.jpg" class="media-object" alt="Sample Image"></a><div class="media-body"><h4 class="media-heading">Jhon Carter</h4><p>Excellent Bootstrap popover! I really love it.</p></div></div>'
            });
            $(document).on("click", ".popover .close", function () {
                $(this).parents(".popover").popover('hide');
            });
        });
//slide element
        $(window).scroll(function () {
            $(".slideanim").each(function () {
                var pos = $(this).offset().top;

                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                    $(this).addClass("slide");
                }
            });
        });
    </script>
</body>
</html>
