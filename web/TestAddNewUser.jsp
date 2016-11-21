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
        <title>::Add New Account::</title>
        <style>
            body{
                background-color:#185875;
                color: white
            }
        </style>
    </head>
    <body>
    <center><h1>::Add New Account::</h1></center><br>

        <form class="form-horizontal" action="AddUser" onsubmit="return checkPassword()" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">Company ID :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="number" name="companyId" min="1" required>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">Firstname :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="firstName" required>
                </div>
            </div> 
            <div class="form-group">
                <label class="col-sm-2 control-label">Lastname :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="lastName" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Citizen No :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="number" name="citizenNo" min="1" required>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">Address :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="address" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Position :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="position" required>
                </div>
            </div><br><br>
            <div class="form-group">
                <label  class="col-sm-2 control-label">Username :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="username" required>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">Password :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="password" name="password" id="pass1" required>
                </div>
            </div> 
            <div class="form-group">
                <label  class="col-sm-2 control-label">Repeat Password :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="password" id="pass2" required>
                </div>
            </div> 
            <div class="form-group">
                <center><label  class="col-sm-8 control-label">${message}</label></center>
            </div>
            <br>
            <center><input class="btn-default"type="submit" value="Submit"><a href="logout"><input class="btn-default" type="button" value="Logout"></a></center><br><br><br><br><br><br>
        </form>
    </body>
    <script>
        function checkPassword() {
            var pass1 = document.getElementById("pass1").value;
            var pass2 = document.getElementById("pass2").value;
            var ok = true;
            if (pass1 != pass2) {
                //alert("Passwords Do not match");
                document.getElementById("pass1").style.borderColor = "#E34234";
                document.getElementById("pass2").style.borderColor = "#E34234";
                ok = false;
            }
            return ok;
        }
    </script>
</html>
