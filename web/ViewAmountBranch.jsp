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
        <title>::TOTAL PRODUCT IN EACH BRANCH::</title>
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
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">TOTAL PRODUCT IN EACH BRANCH<span class="black"><b>}</b></span></h1><br></center>
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
        <c:if test="${branchPerCompany!=null}">                    
                            <tr class="bg-dark ">
                                <td>Item no</td>
                                <td>Branch ID</td>
                                <td>Branch Name</td>
                                <td>Location</td>
                                <td colspan="2">MAX Amount</td>
                                <td>Amount</td>
                                <td>REMAIN Amount</td>
                                <!--<td>Cancel</td>-->
                            </tr>
                            
                            <c:forEach items="${branchPerCompany}" var="b1" varStatus="vs">                       
                                <tr>
                                    <td> ${vs.count}</td>
                                    <td> ${b1.branch_id}</td>
                                    <td> ${b1.branch_name}</td>
                                    <td> ${b1.location}</td>
                                    <td colspan="2"> ${b1.max_amount}</td>
                                    <td > ${b1.amountProduct}</td>                                    
                                    <td> ${b1.remain}</td>
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
