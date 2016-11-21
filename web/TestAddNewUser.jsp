<%-- 
    Document   : TestAddNewUser
    Created on : Nov 21, 2016, 7:33:12 PM
    Author     : jiraw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add new user</h1>
        <form action="AddUser" onsubmit="return checkPassword()">
            <p>Company ID : <input type="number" name="companyId" required></p>
            <p>Firstname : <input type="text" name="firstName" required></p>
            <p>Lastname : <input type="text" name="lastName" required></p>
            <p>Citizen No : <input type="number" name="citizenNo" required></p>
            <p>Address : <input type="text" name="address" required></p>
            <p>Position : <input type="text" name="position" required></p>
            <br>
            <br>
            <p>Username : <input type="text" name="username" required></p>
            <p>Password : <input type="password" name="password" id="pass1" required></p>
            <p>Repeat Password : <input type="password" id="pass2" required></p>
            <p><input type="submit" value="Submit"></p>
        </form>
        ${message}
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
