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


    <center><h1><span class="black"><b>{</b></span><span class="yellow">ALL PRODUCT<span class="black"><b>}</b></span></h1><br></center>


    <form id="search" class="form-inline" action="AllProduct" method="GET">
        <center>
            <input style="width: 150;" type="text" class="form-control" size="50" placeholder="SEARCH PRODUCT" name="searchParam" value="${param.searchParam}">
            <input type="submit" value="SEARCH" form="search" class="btn btn-success">
        </center>
    </form>        



    <div class="row">            
        <div class="col-sm-2">

        </div>
        <div class="col-sm-8">
            <div class="container-fluid" style="margin-top: -20px;">
                <form id="update" action="UpdateProduct" method="POST">                     
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
                                    <th colspan="3" class="center" style="text-align: center;">Amount</th>
                                    <th>Cancel</th>
                                    <th>Delete</th>
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


                                        <td>
                                            <!--Button add product -->
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mymodalReduce${p.prod_id}">REDUCE</button>
                                            <div class="modal fade" id="mymodalReduce${p.prod_id}" role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header" style="background-color: gray">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h2 class="modal-title">REDUCE Amount</h2>
                                                        </div>
                                                        <form action="ReduceProductAmount" id="reduce">
                                                            <input type="hidden" name="source" value="allProduct">
                                                            <div class="modal-body">
                                                                <table class="add-pro black">
                                                                    <tr>
                                                                        <td>ID:</td>
                                                                        <td><input type="number" class="form-control" name="prodId" value="${p.prod_id}" readonly="" min=1></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Amount:</td>
                                                                        <td><input type="number" class="form-control" name="prodAmount" required min=1></td>
                                                                    </tr>
                                                                </table>
                                                                <br>
                                                                <div class="modal-footer">
                                                                    <input type="submit" class="btn btn-default" value="Reduce">
                                                                </div></div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><input type="checkbox" name="cancel" form="update" value="${p.prod_id}" ${p.cancelStatus==true? 'disabled':''}></td>
                                        <td><input type="checkbox" name="delete" form="update" value="${p.prod_id}"></td>
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">ADD New Product</button> 
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">REMOVE Product</button><br><br>
    </div>  



    <!--add product ----------------------------------------------------------------------------------------------------------------->



    <div class="modal fade " id="myModal" role="dialog">
        <div class="modal-dialog modal-lg black">
            <div class="modal-content">
                <div class="modal-header" style="background-color: gray">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title">ADD PRODUCT</h2>
                </div>
                <form action="AddNewProduct">
                    <input type="hidden" name="source" value="allProduct">
                    <div class="modal-body">
                        <div class="container">

                            <table class="add-pro">
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" class="form-control" name="prodName" required></td>                                   
                                </tr>
                                <tr>
                                    <td>Amount</td>
                                    <td><input type="number" class="form-control" min="1" name="prodAmount" required></td>
                                </tr>
                                <tr>
                                    <td>Price</td>
                                    <td><input type="number" class="form-control" min="1" name="prodPrice" required></td>
                                </tr>
                                <tr>
                                    <td>Type</td>
                                    <td><input type="text" class="form-control" name="prodType" required></td>
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
                            </table>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-default" value="ADD">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- remove ----------------------------------------------------------------------------------------------------------------->          



    <div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog modal-lg black">
            <div class="modal-content">
                <div class="modal-header" style="background-color: gray">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title">Remove Product</h2>
                </div>
                <form action="RemoveProduct">
                    <input type="hidden" name="source" value="allProduct">
                    <div class="modal-body">
                        <table class="add-pro">
                            <tr>
                                <td>Product ID:</td>
                                <td><input type="number" min="1" class="form-control" name="prodId" required></td>
                            </tr>
                        </table>
                        <br>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-default" value="Remove">
                        </div></div>
                </form>
            </div>
        </div>
    </div>
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
