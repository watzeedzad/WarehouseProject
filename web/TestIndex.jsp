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
            .containerforAleart{
                padding-top: 50px;
                background-color: #485C5A;
                color: whitesmoke;
                font-family: 'Nunito', sans-serif;
                padding-bottom: 50px;
            }
            .thumbnail{
                background-color: #8C9C9A;
                font-family: 'Nunito', sans-serif;
            }
            .container-fluid  tr:hover{
                background-color: pink;
                border-width: -10px;   
            }
        </style>
    </head>
    <!--       new navigator(have a dropdown) -------------------------------------------------------------------------------------------->
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" >
          <div class="container">
            <nav class="navbar navbar-default navbar-fixed-top">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="#home">WareHouse</a>   
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#product">PRODUCT</a></li>
                        <li><a href="#edit">EDIT</a></li>
                        <li><a href="#view">VIEW</a></li>
                        <li><a href="#alert">ALERT</a></li>
                        <li><a href="#" title="Dismissible popover" data-toggle="popover" data-trigger="focus" data-content="Click anywhere in the document to close this popover">User</a></li>
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
            </form></p>
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
            <table>
                <p><img src="image/cancel.png"></p>
                <h4>CANCEL PRODUCT</h4>
                <button class="btn btn-default btn-lg">Enter</button>  
            </table>
        </div>
    </div>
</div>
<!--        -------------------------------------------------------------------------------------------->
<div id="edit" class="containerforEdit text-center">
    <h2>EDIT</span></h2>
    <h4>You can choose the menu from here!!</span></h4>
    <div class="row text-center">
        <div class="col-sm-3">
            <div class="thumbnail">
                <p><img src="image/add.png"></p>
                <p><strong>INCREASE</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="thumbnail">
                <p><img src="image/remove.png"></p>
                <p><strong>REDUCE</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="thumbnail">
                <p><img src="image/pencil.png"></p>
                <p><strong>EDIT</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="thumbnail">
                <p><img src="image/pencil.png"></p>
                <p><strong>EDIT</strong></p>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>
        </div>
    </div>
</div>
<!--        -------------------------------------------------------------------------------------------->
<div id="view" class=" containerforView text-center">
    <h2>VIEW</h2>
    <h4>You can choose the menu from here!!</h4> 
    <br>
    <div class="row">
        <div class="col-sm-4">
            <p><img src="image/box.png"></p>
            <h4>VIew income per month</h4>
            <button class="btn btn-default btn-lg ">Enter</button>
        </div><br>
        <div class="col-sm-4">
            <img src="image/podium.png">
            <h4>number of product store</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div><br>
        <div class="col-sm-4">
            <img src="image/podium.png">
            <h4>total price of selling</h4>
            <button class="btn btn-default btn-lg">Enter</button>
        </div><br>
    </div>   
</div>
<!--        -------------------------------------------------------------------------------------------->
<div id="alert" class="containerforAleart ">
    <!--    <h2 style="text-align:center">ALERT</h2>-->
    <!--    <h4>You can choose the menu from here!!</h4> -->
    <br>
    <div class="row">
        <div class="col-sm-6 text-center">
            <p><center><img src="image/nalica.png" style="width: 400px; height: 400px;"></center>
            <h2>ALERT</h2><!--
            <button class="btn btn-default btn-lg ">Enter</button>-->
        </div><br>
        <div class="col-sm-6">
            <div class="jumbotron">
                <h2>The Emergency Alert System</h2><hr>
                <h4>The Emergency Alert System (EAS) is a national public warning system that requires broadcasters, 
                    cable television systems, wireless cable systems, satellite digital audio radio service 
                    (SDARS) providers, and direct broadcast satellite (DBS) providers to provide the communications
                    capability to the President to address the American public during a national emergency. 
                    The system also may be used by state and local authorities to deliver important emergency information,
                    such as AMBER alerts and weather information targeted to specific areas.</h4>
                <button class="btn btn-default btn-lg">Enter</button>
            </div>


        </div>
    </div>   
</div>
<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
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
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});
</script>
</body>
</html>

