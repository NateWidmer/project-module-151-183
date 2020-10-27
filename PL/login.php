<?php

session_start();

if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
    header("location: selectQuiz.php");
    exit;
}
?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $("#submit").click(function(e) {
                e.preventDefault();

                var username = $("#username").val().trim();
                var password = $("#password").val().trim();

                if (username != "" && password != "") {
                    $.ajax({
                        url: '../BL/login.php',
                        type: 'post',
                        data: {
                            username: username,
                            password: password
                        },
                        success: function(response) {
                            console.log(response);
                            if (response == 1) {
                                window.location.href = "selectQuiz.php";
                            } else {
                                document.getElementById("error").innerHTML = response;
                            }
                        }
                    });
                }
            });
        });
    </script>
</head>

<body>
    <!--START HEADER -->
    <div class="header">
        <img src="images/quizialist.PNG" alt="Quizialist Logo">
    </div>
    <!--END HEADER -->

    <div class="login-container">
        <form class="login-form" id="login_form" method="post">
            <div class="form-group">
                <label>Username</label>
                <input id="username" type="text" name="username" class="form-control">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input id="password" type="password" name="password" class="form-control">
            </div>
            <div class="form-group">
                <input id="submit" type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account? <a href="register.html">Sign up now</a>.</p>
            <p style="color: #ff6a6a; margin: 0;" id="error"></p>
        </form>
    </div>
</body>

</html>