<?php
 
function register_user($dbconn, $username, $password, $password2)
{
    $error = false;

    if (strlen($password) == 0) {
        echo '<p>Bitte ein Passwort angeben</p><br>';
        $error = true;
    }
    
    if ($password != $password2) {
        echo '<p>Die Passwörter müssen übereinstimmen</p><br>';
        $error = true;
    }

    if(check_username($dbconn, $username)) {
        echo '<p>A user with this username already exists</p><br>';
        $error = true;
    }

    if (!$error) {
        $query = "INSERT INTO users(username, password) VALUES('".$username."', '".$password."')";
        $dbconn->query($query);
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
