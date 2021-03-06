<%-- 
    Document   : product
    Created on : Oct 13, 2016, 10:42:48 PM
    Author     : 000
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
            .center{text-align: center}
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
                    <table class="table table-inverse">
                        <center><h1><span class="black"><b>{</b></span><span class="yellow">ALL PRODUCT<span class="black"><b>}</b></span></h1><br></center>
                        <thead>
                            <tr>
                        <form class="form-inline" action="AllProduct" method="GET">
                            <td><input type="text" class="form-control" size="40" placeholder="SEARCH PRODUCT" name="searchParam"></td>
                            <td><input type="submit" value="SEARCH" class="btn btn-success"></td>
                        </form>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center;"> <c:out value="${message}" ></c:out> </td>
                            </tr>
                        <c:if test="${products != null}">

                            <tr class="bg-dark text-white">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th colspan="3" class="center">Amount</th>

                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${products}" var="p" varStatus="vs">                       
                                    <tr>
                                        <td> ${p.prod_id}</td>
                                        <td> ${p.prod_name}</td>
                                        <td> ${p.price}</td>
                                        <td>
                                            <input type="number" class="black "value="${p.amount}" min="1" style="width: 100px; text-align: center" name="prodAmount" readonly="">
                                        </td>                                        
                                        <td>


                                            <!--Button add product -->
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">INCREASE</button>
                                            <!-- ---  -->
                                            <div class="modal fade" id="myModal2" role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header" style="background-color: gray">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h2 class="modal-title">INCREASE Amount</h2>
                                                        </div>
                                                        <form action="AddProductAmount">
                                                            <div class="modal-body">
                                                                <table class="add-pro black">
                                                                    <tr>
                                                                        <td>ID:</td>
                                                                        <td><input type="number" class="form-control" name="prodId" value="${p.prod_id}" readonly=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Amount:</td>
                                                                        <td><input type="number" class="form-control" name="prodAmount"></td>
                                                                    </tr>
                                                                    <input type="hidden" name="source" value="allProduct">
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <input type="submit" class="btn btn-default" value="Increase">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- --------------------------------------------->    
                                        </td>


                                        <td>
                                            <!--Button add product -->
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal3">REDUCE</button>
                                            <div class="modal fade" id="myModal3" role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header" style="background-color: gray">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h2 class="modal-title">REDUCE Amount</h2>
                                                        </div>
                                                        <form action="ReduceProductAmount">
                                                            <div class="modal-body">
                                                                <table class="add-pro black">
                                                                    <tr>
                                                                        <td>ID:</td>
                                                                        <td><input type="number" class="form-control" name="prodId" value="${p.prod_id}" readonly=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Amount:</td>
                                                                        <td><input type="number" class="form-control" name="prodAmount"></td>
                                                                    </tr>
                                                                    <input type="hidden" name="source" value="allProduct">
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <input type="submit" class="btn btn-default" value="Reduce">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>


                                        </td>
                                        <td><input type="checkbox" name="cancle" value="${p.prod_id}"></td>
                                        <td><input type="checkbox" name="delete" value="${p.prod_id}"></td>
                                    </tr>                   
                                </c:forEach> 
                            </tbody>
                        </c:if>
                    </table>
                </div>
            </div>    

            <div class="col-sm-2">

            </div>
        </div>
        <div class="row text-center">
            <!--add product ----------------------------------------------------------------------------------------------------------------->
            <button type="button" class="btn btn-success">UP DATE</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">ADD</button>
            <div class="modal fade " id="myModal" role="dialog">
                <div class="modal-dialog modal-lg black">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: gray">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 class="modal-title">ADD PRODUCT</h2>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <form >
                                    <table class="add-pro">
                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" class="form-control" ></td>                                   
                                        </tr>
                                        <tr>
                                            <td>Amount</td>
                                            <td><input type="number" class="form-control" min="1"></td>
                                        </tr>
                                        <tr>
                                            <td>Price</td>
                                            <td><input type="number" class="form-control" min="1"></td>
                                        </tr>
                                        <tr>
                                            <td>Type</td>
                                            <td><input type="text" class="form-control" ></td>
                                        </tr>
                                        <tr>
                                            <td>Branch Id</td>
                                            <td><input type="Number" class="form-control" ></td>
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
            <!-- remove ----------------------------------------------------------------------------------------------------------------->          

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">REMOVE</button>

            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-lg black">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: gray">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 class="modal-title">Remove Products</h2>
                        </div>
                        
                        <div class="modal-body">
                            <table class="add-pro">
                                <tr>
                                    <td>ID:</td>
                                    <td><input type="number" min="1" class="form-control" name="id"></td>
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
    </body>
</html>