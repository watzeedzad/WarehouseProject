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
        <title>JSP Page</title>
    </head>
    <body>

    <center><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal1">SET ALERT</button></center><br><br>


    <!-- popup set slaer-->
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



    <c:if test="${message != null}">
        <h2>${message}</h2>
    </c:if>

    <c:if test="${messageJa != null}">
        <h3>${messageJa}</h3>
    </c:if>                

    <c:if test="${productsAlert!=null}">

        <table class="table table-inverse">
            <tr class="bg-dark">
                <td>id</td>
                <td>name</td>
                <td>price</td>
                <td>amount</td>
            </tr>
            <c:forEach items="${productsAlert}" var="p" varStatus="vs"> 
                <tr>
                    <td>${vs.count}</td>
                    <td>${p.prod_id}</td>
                    <td>${p.prod_name}</td>                    
                </tr>
            </c:forEach>


        </table>         
    </c:if>
</body>
</html>
