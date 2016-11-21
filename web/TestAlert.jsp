<%-- 
    Document   : PraewTest
    Created on : Nov 20, 2016, 3:17:29 PM
    Author     : Praewhubb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::ALERT::</title>
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
            .center{text-align: center}
        </style>
    </head>
    <body>
        <jsp:include page="WEB-INF/jsp/Tagnavigation_other.jsp" ></jsp:include>

            <div class="row">            
                <div class="col-sm-2">

                </div>
                <div class="col-sm-8">
                    <div class="container-fluid">                                   


                        <center><h1><span class="black"><b>{</b></span><span class="yellow">ALERT<span class="black"><b>}</b></span></h1><br></center>
                        <center><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">SET ALERT</button></center><br>
                        
                        
                        
                        <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog modal-lg black">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: gray">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h2 class="modal-title text-white ">Set Alert</h2>
                                    </div>
                                    <form action="UpdateAlert">
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
                    <table class="table table-inverse">
                          
                            <c:if test="${message != null}">
                                <tr>
                                <center><h4>${message}</h4></center>
                                </tr>
                            </c:if>
                        <c:if test="${productsAlert!=null}"> 
                            <c:if test="${messageJa != null}">
                                <tr>
                                <center><h5>${messageJa}</h5></center>
                                </tr>
                            </c:if>   
                            <tr class="bg-dark">
                                <td>Item no</td>
                                <td>Id</td>
                                <td>Name</td>
                                <td>Price</td>
                                <td colspan="2">Amount</td>
                                <td>Branch name</td>
                            </tr>
                            <c:forEach items="${productsAlert}" var="p" varStatus="vs"> 
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${p.prod_id}</td>
                                    <td><a href="EditProduct?prod_id=${p.prod_id}">${p.prod_name}</a></td>  
                                    <td>${p.price}</td>
                                    <td>
                                        <input type="number" class="black "value="${p.amount}" min="1" style="background-color: red; width: 100px; text-align: center" name="prodAmount" readonly="">
                                    </td>
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
                                                    <form action="AddProductAmount">
                                                        <input type="hidden" name="source" value="alert">
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
                                    <td>${p.branch.branch_name}</td>
                                </tr>
                            </c:forEach>

                        </c:if>
                    </table>         
                </div>
            </div>
            <div class="col-sm-2">

            </div>
    </body>
</html>
