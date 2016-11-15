<%-- 
    Document   : EditStaff
    Created on : Nov 5, 2016, 4:22:02 PM
    Author     : 000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Tagnavigation_other.jsp"/>
        <div class="container"><br><br><br>
            <h1>::STAFF::</h1><br>
            <button type="button" class="btn btn-default">View Data</button><br><br><br>
            <form class="form-horizontal" action="editstaff" method="POST">
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Staff ID :</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="disabledInput" type="text" disabled value="${sessionScope.staffData.staffId}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Company ID :</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="disabledInput" type="text" disabled value="${sessionScope.staffData.companyId}">
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-2 control-label">Firstname:</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput" name="firstname" type="text" value="${sessionScope.staffData.firstname}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Lastname:</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput" name="lastname" type="text" value="${sessionScope.staffData.lastname}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Citizen No :</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="disabledInput" type="text" disabled value="${sessionScope.staffData.citizenNo}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address:</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput" name="address" type="text" value="${sessionScope.staffData.address}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">Position :</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="disabledInput" type="text" disabled value="${sessionScope.staffData.position}">
                    </div>
                </div> 
                <br>
                <input type="submit" class="btn btn-success" value="SEND">
            </form>
    </body>
</html>
