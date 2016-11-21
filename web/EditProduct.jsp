<%-- 
    Document   : EditStaff
    Created on : Nov 5, 2016, 4:22:02 PM
    Author     : 000
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background-color:#185875;
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
        </style>
        <title>EDIT PRODUCT</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <div class="container"><br><br><br>
            <center><h1><span class="black"><b>{</b></span><span class="yellow">EDIT PRODUCT<span class="black"><b>}</b></span></h1><br></center>
            <a href="${param.source}"><button type="button" class="btn btn-success yellow">BACK</button><br><br><br></a>
                           
                <c:if test="${product !=null}">
                    <form action="EditProduct" class="form-horizontal">
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label yellow">Product ID :</label>
                            <div class="col-sm-10">
                                <input name="prod_id" class="form-control" id="disabledInput" type="number" value="${product.prod_id}" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label yellow">Product Name :</label>
                            <div class="col-sm-10">
                                <input name="prodName" class="form-control" id="disabledInput" type="text" value="${product.prod_name}" >
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-sm-2 control-label yellow">Type :</label>
                            <div class="col-sm-10">
                                <input name="prodType" class="form-control" id="focusedInput" value="${product.prod_type}" type="text" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label yellow">Price :</label>
                            <div class="col-sm-10">
                                <input name="prodPrice" class="form-control" id="focusedInput" value="${product.price}" type="number" >
                            </div>
                        </div>
                            <input type="submit" class="btn btn-success yellow" value="SEND">
                    </form><br>
                </c:if>
            

            
        </div>
    </body>
</html>
