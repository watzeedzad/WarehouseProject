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
            bg-dark{
                background-color: #1F2739;
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

            /*            .navbar li a, .navbar .navbar-brand {
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
            body{
                /*background-color: #8C9C9A;*/
                /*                background-color:#1F2739;*/
                background-color:#185875;
                color: white;
                font-family: sans-serif
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
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">BEST SELLER<span class="black"><b>}</b></span></h1><br></center>
                    <!--<input type="submit" value="Get All"/>-->
                    <c:if test="${bestSeller != null}">
                        <table class="table table-inverse">
                            <tr class="bg-dark ">
                                <td>Product ID</td>
                                <td>Name</td>
                                <td>Type</td>
                                <td>Price</td>
                                <td>Amount (sum)</td>
                                <td>Branch Name</td>
                                <td>Company Name</td>
                                <td>Product Status</td>
                            </tr>

                            <c:forEach items="${bestSeller}" var="b" varStatus="vs">                       
                                <tr>
                                    <td>${b.prodId}</td>
                                    <td>${b.prodName}</td>
                                    <td>${b.prodType}</td>
                                    <td>${b.prodPrice}</td>
                                    <td>${b.prodAmount}</td>
                                    <td>${b.branchName}</td>
                                    <td>${b.companyName}</td>
                                    <td>${b.cancelStatus}</td>
                                </tr>                   
                            </c:forEach>                                    
                        </table>
                    </c:if>
                </div> 
            </div>     
            <div class="col-sm-2">

            </div>
        </div>




    </body>
</html>