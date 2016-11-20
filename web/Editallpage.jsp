<%-- 
    Document   : Editallpage
    Created on : Nov 7, 2016, 6:05:02 PM
    Author     : petch
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            @import url(http://fonts.googleapis.com/css?family=Open+Sans:300,400,700);
            .add-pro tr td input{
                margin: 20px;

            }
        </style>
        
    </head>
    <body>
        <div class="bl-main">
            <!--            <nav class="navbar navbar-inverse navbar-fixed-top" >
                            <div class="container">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span> 
                                    </button>
                                    <a class="navbar-brand" href="TestHome.jsp">WareHouse</a>
                                </div>
                                <div class="collapse navbar-collapse" id="myNavbar">
                                    <ul class="nav navbar-nav navbar-right d">
                                        <li class="dropdown"><a class="dropdown-toggle"  href="#" data-toggle="dropdown" >PRODUCT <span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="product.jsp">ALL PRODUCT</a></li>
                                                <li><a href="BestSeller.jsp">BEST SELLER</a></li>
                                                <li><a href="OutOfStock.jsp">OUT OF STOCK</a></li>
                                                <li><a href="CancelProduct.jsp">CANCEL PRODUCT</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="Editallpage.jsp">EDIT</a></li>
            
                                        <li><a href="#view">VIEW</a></li>
                                        <li><a href="#alert">ALERT</a></li>
                                        <li><a href="EditStaff.jsp">USER</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav> -->
            <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        </div><br><br>
        <div id="bl-main" class="bl-main">
            <section>
                <div class="bl-box">

                    <img src="image/add.png">
                    <h2>ADD</h2>
                </div>
                <div class="bl-content">
                    <center><h1>ADD PRODUCT</h1></center>
                    <span class=" bl-icon-close glyphicon glyphicon-remove"></span>
                    <hr>

                    <div class="modal-body" >
                        <form action="AddNewProduct">
                            <c:if test="${messageJa!=null}">
                                <center><h2>${messageJa}</h2></center>
                            </c:if>
                            <div class="modal-body">
                                <div class="container">
                                    <table class="add-pro">
                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" class="form-control" name="prodName"></td>                                   
                                        </tr>
                                        <tr>
                                            <td>Amount</td>
                                            <td><input type="number" class="form-control" min="1" name="prodAmount"></td>
                                        </tr>
                                        <tr>
                                            <td>Price</td>
                                            <td><input type="number" class="form-control" min="1" name="prodPrice"></td>
                                        </tr>
                                        <tr>
                                            <td>Type</td>
                                            <td><input type="text" class="form-control" name="prodType"></td>
                                        </tr>
                                        <tr>
                                            <td>Branch ID</td>
                                            <c:if test="${allBranch==null}">
                                                <td><input type="text" class="form-control" name="branchId" required></td>
                                            </c:if>
                                            <c:if test="${allBranch!=null}">
                                                <td>
                                                    <select name="branchId">
                                                        <c:forEach items="${allBranch}" var="b" >
                                                            <option value="${b.branch_id}">${b.branch_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="submit" class="btn btn-default" value="ADD" id="but1" onclick="alert1()">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!--                        <form>
                                                <h3>Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"></h3>
                                                <h3>Amount : <input type="number"></h3>
                                                <h3>Price : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"></h3>
                                                <h3>Type : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"></h3>
                                                <button type="submit">ADD</button>
                                            </form>-->
                    <hr>
                </div>

                <!--                    <span class="bl-icon bl-icon-close"></span>-->


            </section>
            <!---------------------------------------------------------------------------------------->                
            <section id="bl-work-section">
                <div class="bl-box">
                    <img src="image/remove.png">
                    <h2>REMOVE</h2>
                </div>
                <div class="bl-content">
                    <center><h1>REMOVE PRODUCT</h1></center>
                    <span class=" bl-icon-close glyphicon glyphicon-remove"></span>
                    <hr>
                    <div class="modal-body" >
                        <form action="RemoveProduct">
                            <div class="modal-body">
                                <table class="add-pro">
                                    <tr>
                                        <td>Product ID:</td>
                                        <td><input type="number" min="1" class="form-control" name="prodId"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="btn btn-default" value="Remove" id="but2" onclick="alert2()">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                    <!--                        <form>
                                                <h3>ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"  class="form-control" ></h3>
                                                <button type="submit" class="btn btn-default">REMOVE</button>
                                            </form>-->
                    <hr>
                </div>
                <!--                <span class="bl-icon bl-icon-close"></span>-->
            </section>
            <!----------------------------------------------------------------------------------------> 
            <section>
                <div class="bl-box">
                    <img src="image/pencil.png">
                    <h2>INCREASE</h2>
                </div>
                <div class="bl-content">
                    <center><h1>INCREASE PRODUCT</h1></center>
                    <span class=" bl-icon-close glyphicon glyphicon-remove"></span>
                    <hr>
                    <div class="modal-body" >
                        <form action="AddProductAmount">
                            <div class="modal-body">
                                <table class="add-pro">
                                    <tr>
                                        <td>ID:</td>
                                        <td><input type="number" class="form-control" name="prodId"></td>
                                    </tr>
                                    <tr>
                                        <td>Amount:</td>
                                        <td><input type="number" class="form-control" name="prodAmount"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="btn btn-default" value="Increase" id="but3" onclick="alert3()">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                    <!--                        <form>
                                                <h3>ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"></h3>
                                                <h3>AMOUNT : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"></h3>
                                                <button type="submit">OK</button>
                                            </form>-->
                    <hr>
                </div>
                <!--                <span class="bl-icon bl-icon-close"></span>-->
            </section>
            <!----------------------------------------------------------------------------------------> 
            <section>
                <div class="bl-box">
                    <img src="image/pencil.png">
                    <h2>REDUCE</h2>
                </div>
                <div class="bl-content">
                    <center><h1>REDUCE PRODUCT</h1></center>
                    <span class=" bl-icon-close glyphicon glyphicon-remove"></span>
                    <hr>
                    <div class="modal-body" >
                        <form action="ReduceProductAmount">
                            <div class="modal-body">
                                <table class="add-pro">
                                    <tr>
                                        <td>ID:</td>
                                        <td><input type="number" class="form-control" name="prodId"></td>
                                    </tr>
                                    <tr>
                                        <td>Amount:</td>
                                        <td><input type="number" class="form-control" name="prodAmount"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" class="btn btn-default" value="Reduce" id="but4" onclick="alert4()"></td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>

                    <!--                        <form>
                                                <h3>ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"></h3>
                                                <h3>AMOUNT : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"></h3>
                                                <button type="submit">OK</button>
                                            </form>-->
                    <hr>
                </div>                         
                <!--                <span class="bl-icon bl-icon-close" class="glyphicon glyphicon-remove"></span>-->
            </section>
            <!----------------------------------------------------------------------------------------> 
        </div>

        <!-- /container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="js/boxlayout.js"></script>
        
        <script>
            $(function () {
                Boxlayout.init();
            });
            
             function alert1(){
           alert("5555");
           }
             function alert2(){
           alert("5555");
           }
             function alert3(){
           alert("5555");
           }
             function alert4(){
           alert("5555");
           }
        </script>
        
    </body>
</html>

