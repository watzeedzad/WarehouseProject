<%-- 
    Document   : EditallPage2
    Created on : Nov 11, 2016, 1:20:39 AM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Fullscreen Layout with Page Transitions</title>
        <meta name="description" content="Fullscreen Layout with Page Transitions" />
        <meta name="keywords" content="fullscreen layout, boxes, responsive, page transitions, css transitions, jquery, portfolio, template" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/componentedit.css" />
        <script src="js/modernizr.custom.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
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
                background-color: black;
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
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <div id="edit" class="container-fluid bg-blue">
        <div class="col-sm-12">
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
                                        <div class="modal-header" style="background-color: gray">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Remove Products</h4>
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
                                        <div class="modal-header" style="background-color: gray">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">INCREASE</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="add-pro">
                                                <tr>
                                                    <td>ID:</td>
                                                    <td><input type="number" class="form-control" name="id"></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount:</td>
                                                    <td><input type="number" class="form-control" name="amount1"></td>
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
                                        <div class="modal-header" style="background-color: gray">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Reduce Product</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="add-pro">
                                                <tr>
                                                    <td>ID:</td>
                                                    <td><input type="number" class="form-control" name="id2"></td>
                                                </tr>
                                                <tr>
                                                    <td>Amount:</td>
                                                    <td><input type="number" class="form-control" name="amount2"></td>
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
    </div>
    </body>    
</html>
