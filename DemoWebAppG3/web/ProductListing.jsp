<%-- 
    Document   : ProductListing
    Created on : 21-Oct-2016, 09:03:15
    Author     : int303
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sit.int303.demo.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Product Listing</title>
        <style>
            /*            body{
                            moz-filter:grayscale(50%);
                            webkit-filter:grayscale(100%);
                            filter:gray;
                            filter:grayscale(100%);
                        }*/
        </style>
    </head>
    <body onload="changeSearchText()">
        <jsp:include page="WEB-INF/jsp/Header.jsp?title=G3: Product - Listing:::" /><br>
        <%--
            List<Product> products = Product.findByPrice(100,500);
            pageContext.setAttribute("products", products);
        --%>
        <%-- add form  --%>
        <script>
            function changeSearchText() {
                var txt1 = document.getElementById('txt1');
                var txt2 = document.getElementById('txt2');
                var cat = document.getElementById('category');
                var label = document.getElementById('caption1'); //add1
                //txt2.value =  cat.options[cat.selectedIndex].value;
                var selectedValue = cat.options[cat.selectedIndex].value;

                if (selectedValue === 'price') {
                    txt2.hidden = false;
                    txt2.type = 'number';
                    txt2.min = 0;
                    txt2.size = '10';

                    txt1.size = '10';
                    txt1.type = 'number';
                    txt1.min = 0;
                    label.innerHTML = '&nbsp;Price Range:&nbsp';//add2
                } else if (selectedValue === 'name') {
                    txt2.hidden = true;
                    txt1.type = 'text';
                    txt1.size = '50';
                    label.innerHTML = '&nbsp;Product Name/Type:&nbsp';//add3
                } else {
                    txt2.hidden = true;
                    txt1.type = 'number';
                    txt1.min = 0;
                    txt1.size = '10';
                    label.innerHTML = '&nbsp;Enter product ID:&nbsp';//add4
                }
            }
        </script>
        <form action="SearchProduct" method="post" >
            <table>
                <tr><td>Category : </td>
                    <td>
                        <select name="searchCategory" onchange="changeSearchText()" id="category">
                            <option value="id" ${param.searchCategory=='id' ? 'selected': ''}>Product ID</option>
                            <option value="name" ${param.searchCategory=='name' ? 'selected': ''}>Product Description</option>
                            <option value="price" ${param.searchCategory=='price' ? 'selected': ''}>Price Range</option>
                        </select>
                    </td>
                    <td id="caption1">&nbsp;</td>
                    <td><input type="text" name="searchText1" id="txt1" value="${param.searchText1}" /></td>
                    <td id="caption2">&nbsp;</td>
                    <td><input type="text" name="searchText2" id="txt2" value="${param.searchText2}" /></td>
                    <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td><td> View : 
                        <select name="viewBy">
                            <option value="row" ${param.viewBy=='row' ? 'selected': ''}>List View</option>
                            <option value="column" ${param.viewBy=='column' ? 'selected': ''}>Gallery View</option>
                        </select>
                    </td>
                    <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                    <td><input type="submit" value="Go"/></td>
                </tr>
            </table>
        </form>
        <c:if test="${! empty message}">
            <table class="table" style="width: 98%;background-color: yellow;color:red">
                <tr><td>${message}</td></tr>
            </table>
        </c:if>

        <c:if test="${products != null}">           
            <form action="AddToCart" method="get">
                <c:choose>
                    <c:when test="${param.viewBy=='column'}">            
                        <table class="table">
                            <tr><td colspan="4" style="text-align: right"><input type="submit" value="Add to Cart"></td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                        ${vs.count%4==1?"<tr>":""}
                                <td style="text-align: center;">
                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to your "><br>
                                    <img src="images/${p.productId}.jpg" width="150" height="120">
                                    <br>
                                    ${p.productId}(${productType}),
                                    Price:<fmt:formatNumber value="${p.price}" type="currency" />
                                    <br>
                                    ${p.description}
                                </td>                
                                ${vs.count%4==0?"</tr>":""}
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <tr><td colspan="4" style="text-align: right">
                                    <input type="submit" value="Add to Cart"></td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                <tr>         
                                    <td>
                                        <table>
                                            <tr>
                                                <td><img src="images/${p.productId}.jpg" width="150" height="120"></td>
                                                <td></td>
                                                <td>${p.productId}(${productType}),
                                                    Price:<fmt:formatNumber value="${p.price}" type="currency" />
                                                    <br>
                                                    ${p.description}
                                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to your "><br>
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                    </td>                
                                </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>       
            </form>
        </c:if>

    </body>
</html>
