<?php
 
function register_user($dbconn, $username, $password, $password2)
{
    $error = false;

    if (strlen($password) == 0) {
        echo '<p>Please enter a password</p>';
        $error = true;
    }
    
    if ($password != $password2) {
        echo '<p>The passwords are not matching</p>';
        $error = true;
    }

    if(check_username($dbconn, $username)) {
        echo '<p>A user with this username already exists</p>';
        $error = true;
    }

    if(!$error) {
        $sql = "INSERT INTO users (username, password) VALUES (?, ?)";

        if($stmt = mysqli_prepare($dbconn, $sql)) {
            mysqli_stmt_bind_param($stmt, "ss", $param_username, $param_password);

            $param_username = $username;
            $param_password = password_hash($password, PASSWORD_DEFAULT);

            if(mysqli_stmt_execute($stmt)) {
                header("location: login.html");
            } else {
                echo '<p>Something went wrong when trying to hash password</p>';
                $error = true;
            }

            mysqli_stmt_close($stmt);

        }
    }




    return $error;

}

function check_username($dbconn, $username) {
    $query = "SELECT * FROM users WHERE username = '".$username."'";
    $result = $dbconn->query($query);

    $rows = $result->num_rows;

    return $rows;
}

function login_user($dbconn, $username, $password)
{
    $uname = mysqli_real_escape_string($dbconn, $username);
    $password = mysqli_real_escape_string($dbconn, $password);

    if($uname != "" && $password != "") {
        $query = "SELECT * FROM users WHERE username='".$uname."' AND password='".$password."'";
        $result = $dbconn->query($query);

        $rows = $result->num_rows;

        if($rows > 0) {
            $_SESSION['uname'] = $uname;
            echo 1;
        } else {
            echo 0;
        }
    }
}

?>
