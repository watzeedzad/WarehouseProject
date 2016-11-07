<%-- 
    Document   : product
    Created on : Oct 13, 2016, 10:42:48 PM
    Author     : 000
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
        <jsp:include page="/WEB-INF/jsp/Tagnavigation.jsp"/>
        <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                            </tr>
                            <tr>
                                <td>Mary</td>
                                <td>Moe</td>
                                <td>mary@example.com</td>
                            </tr>
                            <tr>
                                <td>July</td>
                                <td>Dooley</td>
                                <td>july@example.com</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>    
            <div class="col-sm-2">

            </div>
        </div>
        <div class="row text-center">
            <!--add product ----------------------------------------------------------------------------------------------------------------->
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
            <!-- remove ----------------------------------------------------------------------------------------------------------------->          

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
            <!-- increase ----------------------------------------------------------------------------------------------------------------->          
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
            <!-- reduce ----------------------------------------------------------------------------------------------------------------->          
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
    </body>
</html>
