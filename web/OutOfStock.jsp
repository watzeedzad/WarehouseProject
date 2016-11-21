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
        <title>::OUT OF STOCK::</title>
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
            a:link {
                color: white;
            }
            a:visited {
                color: palevioletred;
            }
            a:hover {
                color: greenyellow;
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
        <%-- Nav--%>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <!--table ----------------------------------------------------------------------------------------------------------------->
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <div class="container-fluid">
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">OUT OF STOCK<span class="black"><b>}</b></span></h1><br></center>
                    <form action="OutOfStock">
                        <!--<input type="submit" value="Get All"/>-->
                        <table class="table table-inverse">
                            <!--ปุ่ม message มันโชว์แต่ there is no product ทั้งๆที่มันมีอยู่ -->
                            <tr>
                                <c:if test="${message!=null}">
                                <tr>
                                    <td colspan="10" style="text-align: center;font-size:large"> <c:out value="${message}" ></c:out> </td>

                                    </tr>                            
                                </c:if>
                            </tr>
        <c:if test="${products!=null}">                    
                            <tr class="bg-dark ">
                                <td>Item no</td>
                                <td>Id</td>
                                <td>Name</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Branch name</td>
                                <!--<td>Cancel</td>-->
                            </tr>

                            <c:forEach items="${products}" var="p" varStatus="vs">                       
                                <tr>
                                    <td> ${vs.count}</td>
                                    <td> ${p.prod_id}</td>
                                    <td><a href="EditProduct?prod_id=${p.prod_id}&source=OutOfStock">${p.prod_name}</a></td>
                                    <td> ${p.price}</td>
                                    <td>


                                            <!--Button add product -->
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mymodalIncrease${p.prod_id}" ${p.cancelStatus==true? 'disabled':''} >INCREASE</button>
                                            <!-- ---  -->
                                            <div class="modal fade" id="mymodalIncrease${p.prod_id}" role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header" style="background-color: gray">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h2 class="modal-title">INCREASE Amount</h2>
                                                        </div>
                                                        <form action="AddProductAmount" id="add">
                                                            <input type="hidden" name="source" value="allProduct">
                                                            <div class="modal-body">
                                                                <table class="add-pro black">
                                                                    <tr>
                                                                        <td>ID:</td>
                                                                        <td><input type="number" class="form-control" name="prodId" value="${p.prod_id}" readonly="" min=1></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Amount:</td>
                                                                        <td><input type="number" class="form-control" name="prodAmount" min=1 required></td>
                                                                    </tr>
                                                                </table>
                                                                <br>
                                                                <div class="modal-footer">
                                                                    <input type="submit" class="btn btn-default" value="Increase">
                                                                </div></div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- --------------------------------------------->    
                                        </td>
                                    <td> ${p.branch.branch_name}</td>
                                    <!--<td><input type="checkbox" ></input></td>-->
                                </tr>                   
                            </c:forEach> 
        </c:if>    
                        </table>
                    </form>
                </div> 
            </div>     
            <div class="col-sm-2">

            </div>
        </div>
        <div class="row text-center">
            <div class="button">
                <a href="TestHome.jsp"><button type="button" class="btn btn-success">BACK</button></a>
            </div>


    </body>
</html>
