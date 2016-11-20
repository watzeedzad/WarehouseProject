<%-- 
    Document   : ViewStateByDate
    Created on : Nov 20, 2016, 6:13:34 PM
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
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/><br><br><br>
        <form action="" >
<!--            <table>
                <center><h1><span class="black"><b>{</b></span><span class="yellow">VIEW STAT BY DATE<span class="black"><b>}</b></span></h1><br></center>
                <tr><td>Category : </td>
                    <td>
                        <select name="searchDateBy"" id="category" class="black">
                            <option value=''>--Select View By--</option>
                            <option value="month" ${param.searchDateBy=='month' ? 'selected': ''}>Month</option>
                            <option value="year" ${param.searchDateBy=='year' ? 'selected': ''}>Year</option>
                            <option value="monthandyear" ${param.searchDateBy=='monthandyear' ? 'selected': ''}>Month and Year</option>
                        </select>
                    </td>
                    <td>Month : </td>
                    <td>
                        <select name="month" class="black">
                            <option value=''>--Select Month--</option>
                            <option value='1'>Janaury</option>
                            <option value='2'>February</option>
                            <option value='3'>March</option>
                            <option value='4'>April</option>
                            <option value='5'>May</option>
                            <option value='6'>June</option>
                            <option value='7'>July</option>
                            <option value='8'>August</option>
                            <option value='9'>September</option>
                            <option value='10'>October</option>
                            <option value='11'>November</option>
                            <option value='12'>December</option>
                        </select> 
                    </td>
                    <td>Year</td>
                    <td>
                        <select name="year"  class="black">
                            <option value=''>--Select Year--</option>
                            <option value='1'>2005</option>
                            <option value='2'>2006</option>
                            <option value='3'>2007</option>
                            <option value='4'>2008</option>
                            <option value='5'>2009</option>
                            <option value='6'>2010</option>
                            <option value='7'>2011</option>
                            <option value='8'>2012</option>
                            <option value='9'>2013</option>
                            <option value='10'>2014</option>
                            <option value='11'>2015</option>
                            <option value='12'>2016</option>
                        </select>
                    </td>
                    <td>Type</td>
                    <td>
                        <select name="type" class="black" >
                            <option >IN</option>
                            <option>OUT</option>
                            <option>ALL</option>
                        </select>
                    </td>
                </tr>
            </table>-->
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8">
                <table>
                    <center><h1><span class="black"><b>{</b></span><span class="yellow">VIEW STAT BY DATE<span class="black"><b>}</b></span></h1><br></center>
                    <tr><td>Category : </td>
                        <td>
                            <select name="searchDateBy"" id="category" class="black">
                                <option value=''>--Select View By--</option>
                                <option value="month" ${param.searchDateBy=='month' ? 'selected': ''}>Month</option>
                                <option value="year" ${param.searchDateBy=='year' ? 'selected': ''}>Year</option>
                                <option value="monthandyear" ${param.searchDateBy=='monthandyear' ? 'selected': ''}>Month and Year</option>
                            </select>
                        </td>
                        <td>Month : </td>
                        <td>
                            <select name="month" class="black">
                                <option value=''>--Select Month--</option>
                                <option value='1'>Janaury</option>
                                <option value='2'>February</option>
                                <option value='3'>March</option>
                                <option value='4'>April</option>
                                <option value='5'>May</option>
                                <option value='6'>June</option>
                                <option value='7'>July</option>
                                <option value='8'>August</option>
                                <option value='9'>September</option>
                                <option value='10'>October</option>
                                <option value='11'>November</option>
                                <option value='12'>December</option>
                            </select> 
                        </td>
                        <td>Year</td>
                        <td>
                            <select name="year"  class="black">
                                <option value=''>--Select Year--</option>
                                <option value='1'>2005</option>
                                <option value='2'>2006</option>
                                <option value='3'>2007</option>
                                <option value='4'>2008</option>
                                <option value='5'>2009</option>
                                <option value='6'>2010</option>
                                <option value='7'>2011</option>
                                <option value='8'>2012</option>
                                <option value='9'>2013</option>
                                <option value='10'>2014</option>
                                <option value='11'>2015</option>
                                <option value='12'>2016</option>
                            </select>
                        </td>
                        <td>Type</td>
                        <td>
                            <select name="type" class="black" >
                                <option value="in">IN</option>
                                <option value="out">OUT</option>
                                <option value="all">ALL</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <table class="table table-inverse">
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
                            <th>Status</th>
                            <th colspan="3" class="center" style="text-align: center;">Amount</th>


                        </tr>
                        </thead>
                        <tbody>


                        </tbody>                        
                    </c:if>
                </table>


            </div>

            <div class="col-sm-2">

            </div>
        </form>
    </body>
</html>
