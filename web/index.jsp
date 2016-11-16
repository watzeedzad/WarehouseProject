<!DOCTYPE html>

<html >
    <head>
        <meta charset="UTF-8">
        <title>Elastic Login Form</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null) {
                getServletContext().getRequestDispatcher("/TestHome.jsp").forward(request, response);
            }
        %>
        <!--Google Font - Work Sans-->
        <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,700' rel='stylesheet' type='text/css'>

        <div class="container">

            <div class="profile">
                <div id="alert">
                    <center style="color: red; visibility: visible;" class="slideanim">${requestScope.message}</center>
                </div>    
                <br>
                <br>
<!--                <div id="click">-->
                    <button  onclick="NumChk();" class="profile__avatar" id="toggleProfile">
                        <img src="image/login-pic.png" alt="Avatar" /> 
                    </button>
<!--                </div>-->
                <div class="profile__form" style="margin-top: 100px;">
                    <div class="profile__fields">
                        <form action="login" method="POST">       
                            <div class="field">
                                <input type="text" id="fieldUser" class="input" required pattern=.*\S.* name="username"/>
                                <label for="fieldUser" class="label">Username</label>
                            </div>
                            <div class="field">
                                <input type="password" id="fieldPassword" class="input" required pattern=.*\S.* name="password"/>
                                <label for="fieldPassword" class="label">Password</label>
                            </div>
                            <div class="profile__footer">
                                <input type="submit" class="btn" value="Login">
                            </div>
                            <br>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/index.js" type="text/javascript"></script>
    </body>
</html>