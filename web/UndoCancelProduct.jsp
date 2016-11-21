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
        <link rel="stylesheet" type="text/css" href="css/product.css" />
        <style>

        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <!--table ----------------------------------------------------------------------------------------------------------------->

        <hr>
        <hr>
        <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>


    <center><h1><span class="black"><b>{</b></span><span class="yellow">UNDO CANCEL PRODUCT<span class="black"><b>}</b></span></h1><br></center>


<!--    <form id="search" class="form-inline" action="UndoCancel" method="GET">
        <center>
            <input style="width: 150;" type="text" class="form-control" size="50" placeholder="SEARCH PRODUCT" name="searchParam" value="${param.searchParam}">
            <input type="submit" value="SEARCH" form="search" class="btn btn-success">
        </center>
    </form>        -->



    <div class="row">            
        <div class="col-sm-2">

        </div>
        <div class="col-sm-8">
            <div class="container-fluid" style="margin-top: -20px;">
                <form id="update" action="UndoCancel" method="POST">                     
                    <table class="table table-inverse">
                        <!--<center><h1><span class="black"><b>{</b></span><span class="yellow">ALL PRODUCT<span class="black"><b>}</b></span></h1><br></center>-->
                        <thead>

                            <c:if test="${message!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${message}" ></c:out> </td>

                                    </tr>                            
                            </c:if>
                            <c:if test="${messageJa!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${messageJa}" ></c:out> </td>

                                    </tr>                            
                            </c:if>
                            <c:if test="${messageJa1!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${messageJa1}" ></c:out> </td>

                                    </tr>                            
                            </c:if> 
                            <c:if test="${messageJa2!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${messageJa2}" ></c:out> </td>

                                    </tr>                            
                            </c:if> 
                            <c:if test="${messageJa3!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${messageJa3}" ></c:out> </td>

                                    </tr>                            
                            </c:if>  
                            <c:if test="${messageJa4!=null}">
                                <tr>
                                    <td colspan="16" style="text-align: center;"> <c:out value="${messageJa4}" ></c:out> </td>

                                    </tr>                            
                            </c:if>      


                            <c:if test="${products != null}">
                                <!-------------------------àËÅ×ÍãÊè¿ÍÃìÁÊÓËÃÑº cancel >>>> DELETE-------------------------------------->
                                <!--<form action="UpdateProduct"></form>-->
                                <tr class="bg-dark text-white">
                                    <th colspan="3">Item no</th>
                                    <th>ID</th>
                                    <th colspan="5">Name</th>
                                    <th>Price</th>
                                    <th class="center" style="text-align: center;">Amount</th>
                                    <th>Undo Cancel</th>
                                    <th colspan="3">Branch name</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="bgRed" value=" style='background-color: red;' "></c:set>
                                <c:forEach items="${products}" var="p" varStatus="vs">                       
                                    <tr>
                                        <td colspan="3">${vs.count}</td>
                                        <td > ${p.prod_id}</td>
                                        <td colspan="5"><a href="EditProduct?prod_id=${p.prod_id}&source=product.jsp">${p.prod_name}</a> </td>
                                        <td> ${p.price}</td>
                                        <td>
                                            <input type="number" ${p.amount<alertAmount? "style='background-color: red;width: 100px; text-align: center'":""} class="black "value="${p.amount}" min="1" style="width: 100px; text-align: center" name="prodAmount" readonly="">
                                        </td>
                                       
                                       
                                        <td><input type="checkbox" name="cancel" form="update" value="${p.prod_id}"></td>
                                        <td> ${p.branch.branch_name}</td>
                                    </tr>                   
                                </c:forEach> 

                            </tbody>                        
                        </c:if>
                    </table>
                </form>
            </div>
        </div>    

        <div class="col-sm-2">

        </div>

    </div> 
            
    <div class="row text-center">  
        <input type="submit" class="btn btn-success" value="UPDATE" onclick="submit()">
    </div>  



  

</body>
<script>
    function submit() {
        document.forms['update'].submit();
    }
    function myFunction() {
        confirm("Are you sure to cancel and delete product(s)");
    }
</script>
</html>
