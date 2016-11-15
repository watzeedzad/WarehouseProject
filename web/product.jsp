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
            body{
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
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                        <form class="form-inline" action="AllProduct" method="GET">
                            <td><input type="text" class="form-control" size="40" placeholder="SEARCH PRODUCT" name="searchParam"></td>
                            <td><input type="submit" value="SEARCH" class="btn btn-success"></td>
                        </form>
                        <c:if test="${products != null}">
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${products}" var="p" varStatus="vs">                       
                                    <tr>
                                        <td> ${p.prod_id}</td>
                                        <td> ${p.prod_name}</td>
                                        <td> ${p.price}</td>
                                <div class="form-group">
                                    <input type="number" value="${p.amount}" min="1" style="width: 100px; text-align: center" class="form-control" id="usr" name="prodAmount">
                                </div>
                                </tr>                   
                            </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
            </div>    
            <!--            <div class="container">
                            <h2>Table</h2>
                            <p>The .table-responsive class creates a responsive table which will scroll horizontally on small devices (under 768px). When viewing on anything larger than 768px wide, there is no difference:</p>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Firstname</th>
                                            <th>Lastname</th>
                                            <th>Age</th>
                                            <th>City</th>
                                            <th>Country</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Anna</td>
                                            <td>Pitt</td>
                                            <td>35</td>
                                            <td>New York</td>
                                            <td>USA</td>
                                            <td> 
                                                <div class="form-group">
                                                    <input type="number" min="1" style="width: 100px; text-align: center" class="form-control" id="usr">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>-->
            <div class="col-sm-2">

            </div>
        </div>
        <div class="row text-center">
            <!--add product ----------------------------------------------------------------------------------------------------------------->
            <button type="button" class="btn btn-success">UP DATE</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">ADD</button>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
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
                <div class="modal-dialog modal-lg">
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
            <!-- increase ----------------------------------------------------------------------------------------------------------------->          
            <!--            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">INCREASE</button>
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
                        </div>-->
            <!-- reduce ----------------------------------------------------------------------------------------------------------------->          
            <!--            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3">REDUCE</button>
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
                        </div>-->
        </div>
    </body>
</html>