<%-- 
    Document   : Alertother
    Created on : Nov 11, 2016, 2:21:30 PM
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
            @import url(http://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

            body {
                /*                font-family: 'Open Sans', sans-serif;
                                font-weight: 300;*/
                line-height: 1.42em;
                color:#A7A1AE;
                background-color:#1F2739;
            }

            h1 {
                font-size:3em; 
                font-weight: 300;
                line-height:1em;
                text-align: center;
                color: #4DC3FA;
            }

            h2 {
                font-size:1em; 
                font-weight: 300;
                text-align: center;
                display: block;
                line-height:1em;
                padding-bottom: 2em;
                color: #FB667A;
            }

            h2 a {
                font-weight: 700;
                text-transform: uppercase;
                color: #FB667A;
                text-decoration: none;
            }

            .blue { color: #185875; }
            .yellow { color: #FFF842; }

            .container th h1 {
                font-weight: bold;
                font-size: 1em;
                text-align: left;
                color: #185875;
            }

            .container td {
                font-weight: normal;
                font-size: 1em;
                -webkit-box-shadow: 0 2px 2px -2px #0E1119;
                -moz-box-shadow: 0 2px 2px -2px #0E1119;
                box-shadow: 0 2px 2px -2px #0E1119;
            }

            .container {
                /*                text-align: left;
                                overflow: hidden;
                                width: 80%;
                                margin: 0 auto;
                                display: table;
                                padding: 0 0 8em 0;*/
            }

            .container td, .container th {
                padding-bottom: 2%;
                padding-top: 2%;
                padding-left:2%;  
            }

            /* Background-color of the odd rows */
            .container tr:nth-child(odd) {
                background-color: #323C50;
            }

            /* Background-color of the even rows */
            .container tr:nth-child(even) {
                background-color: #2C3446;
            }

            .container th {
                background-color: #1F2739;
            }

            .container td:first-child { color: #FB667A; }
            .modal-dialog{
                padding-top: 80px;
                width: 400px;
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
            .fix{
                font-size: 30px;
                border: 10px;
            }
            /*            .container tr:hover {
                            background-color: #464A52;
                            -webkit-box-shadow: 0 6px 6px -6px #0E1119;
                            -moz-box-shadow: 0 6px 6px -6px #0E1119;
                            box-shadow: 0 6px 6px -6px #0E1119;
                        }
            
                        .container td:hover {
                            background-color: #FFF842;
                            color: #403E10;
                            font-weight: bold;
            
                            box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
                            transform: translate3d(6px, -6px, 0);
            
                            transition-delay: 0s;
                            transition-duration: 0.4s;
                            transition-property: all;
                            transition-timing-function: line;
                        }*/

            /*            @media (max-width: 800px) {
                            .container td:nth-child(4),
                            .container th:nth-child(4) { display: none; }
                        }*/
            /* ---------------------------------------------------------------*/
            /*            .navbar {
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
                            background-color: black;
                        }*/

        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <br><br><br><br>
        <h1><span class="blue"><b>{</b></span><span class="yellow">ALERT<span class="blue"><b>}</b></span></h1>
        <form action="AlertProduct">
            <input type="submit" value="GET ALL">
        </form>
    <center><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">SET ALERT</button></center><br><br>


    <!-- popup set slaer-->
    <div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog modal-lg black">
            <div class="modal-content">
                <div class="modal-header" style="background-color: gray">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title text-white ">Set Alert</h2>
                </div>
                <form action="AlertProduct">
                    <input type="hidden" name="source" value="allProduct">
                    <div class="modal-body">
                        <table class="add-pro">
                            <tr>
                                <td>Set Alert Amount:</td>
                                <td><input type="number" min="1" class="form-control" name="alertAmount" value="${amount}" required></td>
                            </tr>
                        </table>
                        <br>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-default" value="UPDATE">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>

    <c:if test="${message != null}">
        <h2></h2>
    </c:if>

    <c:if test="${messageJa != null}">
        <h3></h3>
    </c:if>                

    <c:if test="${productsAlert!=null}">
        <div class="row">            
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">                    
                    <!--<input type="submit" value="Get All"/>-->
                    <table class="table table-inverse">
                        <tr class="bg-dark">
                            <td>item no</td>
                            <td>id</td>
                            <td>name</td>
                            <td>price</td>
                            <td>amount</td>
                        </tr>

                        <c:forEach items="${productsAlert}" var="p" varStatus="vs"> 
                            <tr>
                                <td>${vs.count}</td>
                                <td>${p.prod_id}</td>
                                <td>${p.prod_name}</td>
                                <td>${p.price}</td> 
                                <td>${p.amount}</td>  
                            </tr>
                        </c:forEach>                                    
                    </table>                    
                </div> 
            </div>

            <div class="col-sm-2">

            </div>        
        </div>
    </c:if>
</body>
</html>
