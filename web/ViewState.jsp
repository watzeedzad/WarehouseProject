<%-- 
    Document   : ViewState
    Created on : Nov 20, 2016, 2:16:17 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
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
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/><br><br>
        <div class="col-sm-2">

        </div>


        <div class="col-sm-8">

            <div class="container-fluid">
                <table class="table table-inverse">
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">VIEW STAT<span class="black"><b>}</b></span></h1><br></center>
                    <div class="row ">
                        <p class="black">Search product Id/Name : <input type="text" name="" class="form-group">
                            <select class="">
                                <option >IN</option>
                                <option>OUT</option>
                                <option>ALL</option>
                            </select>
                            <input type="submit" class="btn-default"></p>
                    </div> 
                    <thead>
                    <c:if test="${message!=null}">
                        <tr>
                            <td colspan="10" style="text-align: center;"> <c:out value="${message}" ></c:out> </td>
                        </tr>                            
                    </c:if>

                    <c:if test="${products != null}">
                        <tr class="bg-dark text-white">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th colspan="3" class="center" style="text-align: center;">Amount</th>
                            <th>Cancel</th>
                            <th>Delete</th>

                        </tr>
                        </thead>
                        <tbody>


                        </tbody>                        
                    </c:if>
                </table>

            </div>
        </div>
    </div>


    <div class="col-sm-2">

    </div>
</body>
</html>
