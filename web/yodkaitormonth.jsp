<%-- 
    Document   : yodkaitormonth
    Created on : Nov 11, 2016, 3:04:03 PM
    Author     : Ekawat
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
            body{
                background-color: #323C50;  
            }
            /*            .navbar {
                            margin-bottom: 0;
                            background-color: black;
                            z-index: 9999;
                            border: 0;
                            font-size: 12px !important;
                            line-height: 1.42857143 !important;
                            letter-spacing: 4px;
                            border-radius: 0;
                        }*/

            /*            .navbar li a, .navbar .navbar-brand {
                            color: #fff !important;
                        }
            
                        .navbar-nav li a:hover, .navbar-nav li.active a {
                            color: #f4511e !important;
                            background-color: #fff !important;
                        }*/

            /*            .navbar-default .navbar-toggle {
                            border-color: transparent;
                            color: #fff !important;
                        }*/
            .container-fluid{
                padding-top: 60px;

            }
            input{
                padding: 10px;
                margin: 10px;
                border-radius: 10px; 
            }

            .container-fluid .text{
                color: white;
            }   

        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <form action="" method="GET">
            <div class="container-fluid">
                <div class="text">&nbsp;&nbsp; Month/Year:</div><input type="month" name="month"/>  <input type="submit" value="Search">
                <div>

                </div>
            </div>
        </form>
    </body>
</html>
