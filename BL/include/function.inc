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
                $error = false;
                } else {
                echo '<p>Something went wrong when trying to hash password</p>';
                $error = true;
            }

            mysqli_stmt_close($stmt);

        }
    }

}

function check_username($dbconn, $username) {
    $query = "SELECT * FROM users WHERE username = '".$username."'";
    $result = $dbconn->query($query);

    $rows = $result->num_rows;

    return $rows;
}

function login_user($dbconn, $uname, $pass)
{
    $username = trim($uname);
    $password = trim($pass);

    if($username != "" && $password != "") {
        $sql = "SELECT id, username, password FROM users WHERE username = ?";

        if($stmt = mysqli_prepare($dbconn, $sql)) {
            mysqli_stmt_bind_param($stmt, "s", $param_username);

            $param_username = $username;

            if(mysqli_stmt_execute($stmt)) {
                mysqli_stmt_store_result($stmt);

                if(mysqli_stmt_num_rows($stmt) == 1) {
                    mysqli_stmt_bind_result($stmt, $id, $username, $hashed_password);

                    if(mysqli_stmt_fetch($stmt)) {
                        if(password_verify($password, $hashed_password)) {

                            session_start();

                            $_SESSION['uname'] = $username;
                            $_SESSION['id'] = $id;
                            $_SESSION['loggedin'] = true;

                            echo 1;
                        } else {
                            echo $password, " ", $hashed_password;
                        }
                    } else {
                        echo 'No user found with that username';
                    }
                } 
            } else {
                echo 'Something went wrong. Please try again later.';
            }

            mysqli_stmt_close($stmt);

        }
    }
}

?>
