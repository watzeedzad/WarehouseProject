<%-- 
    Document   : yodkaisinka
    Created on : Nov 11, 2016, 3:06:51 PM
    Author     : Ekawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>

            h1{
                font-size: 30px;
                color: #fff;
                text-transform: uppercase;
                font-weight: 300;
                text-align: center;
                margin-bottom: 15px;
            }
            table{
                width:100%;
                table-layout: fixed;
            }
            .tbl-header{
                background-color: rgba(255,255,255,0.3);
            }
            .tbl-content{
                height:300px;
                overflow-x:auto;
                margin-top: 0px;
                border: 1px solid rgba(255,255,255,0.3);
            }
            th{
                padding: 20px 15px;
                text-align: left;
                font-weight: 500;
                font-size: 12px;
                color: #fff;
                text-transform: uppercase;
            }
            td{
                padding: 15px;
                text-align: left;
                vertical-align:middle;
                font-weight: 300;
                font-size: 12px;
                color: #fff;
                border-bottom: solid 1px rgba(255,255,255,0.1);
            }


            /* demo styles */


            body{
                background: -webkit-linear-gradient(left, #25c481, #25b7c4);
                background: linear-gradient(to right, #25c481, #25b7c4);
                font-family: 'Roboto', sans-serif;
            }
            section{
                margin: 50px;
            }


            /* follow me template */
            .made-with-love {
                margin-top: 40px;
                padding: 10px;
                clear: left;
                text-align: center;
                font-size: 10px;
                font-family: arial;
                color: #fff;
            }
            .made-with-love i {
                font-style: normal;
                color: #F50057;
                font-size: 14px;
                position: relative;
                top: 2px;
            }
            .made-with-love a {
                color: #fff;
                text-decoration: none;
            }
            .made-with-love a:hover {
                text-decoration: underline;
            }


            /* for custom scrollbar for webkit browser*/

            ::-webkit-scrollbar {
                width: 6px;
            } 
            ::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
            } 
            ::-webkit-scrollbar-thumb {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
            }
/*            .navbar {
                margin-bottom: 0;
                background-color: black;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
            }

            .navbar li a, .navbar .navbar-brand {
                color: #fff !important;
            }

            .navbar-nav li a:hover, .navbar-nav li.active a {
                color: #f4511e !important;
                background-color: #fff !important;
            }

            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }*/


            
        </style>
    </head>
    <body>
<section>
    <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
<div class="container" style="margin-top: 5%;">
    <div class="col-md-6 col-md-offset-3">

        <!-- Search Form -->
        <form role="form">
        
        <!-- Search Field -->
            <div class="row">
                <h1 >Search Title</h1>
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" type="text" name="search" placeholder="Search" required/>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"><span style="margin-left:10px;">Search</span></button>
                        </span>
                        
                    </div>
                </div>
            </div>
            
        </form>
        <!-- End of Search Form -->
            
    </div>
</div>

        
            
            <!--for demo wrap-->
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Company</th>
                            <th>Price</th>
                            <th>Change</th>
                            <th>Change %</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN COMPANY </td>
                            <td>$1.38</td>
                            <td>+2.01</td>
                            <td>-0.36%</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>AUSENCO</td>
                            <td>$2.38</td>
                            <td>-0.01</td>
                            <td>-1.36%</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>ADELAIDE</td>
                            <td>$3.22</td>
                            <td>+0.01</td>
                            <td>+1.36%</td>
                        </tr>
                        <tr>
                            <td>XXD</td>
                            <td>ADITYA BIRLA</td>
                            <td>$1.02</td>
                            <td>-1.01</td>
                            <td>+2.36%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>



    </body>
</html>
