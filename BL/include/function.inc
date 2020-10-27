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
                            echo 'Your password is incorrect';
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

function get_quizzes($dbconn) {
    $sql = "SELECT q.id as quizid, title, username, count(question) as question FROM users u JOIN quiz q ON q.user_id=u.id JOIN questions ON quiz_id=q.id GROUP BY quizid";

    $result = $dbconn->query($sql);

    while($row = $result->fetch_assoc()) {
        echo "<div class='card'>";
        echo "<h3>" . utf8_decode($row['title']) . "</h3>";
        echo "<div class='card-title'>";
        echo "<p>Number of questions: " . $row['question'] . "</p>";
        echo "<p>Creator: " . $row['username'] . "</p>";
        echo "</div>";
        echo "<div class='container'>";
        echo "<a class='button button1' href='playQuiz.php?id=" . $row['quizid'] ."'>Start Quiz!</a>";
        echo "<a class='button button1' href='quizHighscore.php?id=" . $row['quizid'] ."'>Highscores</a>";
        echo "</div>";
        echo "</div>";
    }
}

function get_quiz_by_id($dbconn, $id) {

    $sql = "SELECT question FROM quiz q JOIN questions ON quiz_id=q.id WHERE q.id= '" . $id . "'";

    $result = $dbconn->query($sql);

    while($row = $result->fetch_assoc()) {
        echo "<label id='question_for_quiz'>" . $row['question'] . "</label>";
        echo "</br></br>";
        echo "<input type='text' id='answer_for_question' name='answer' placeholder='Your answer...'>";
        echo "</br></br>";
    }

    echo "<input id='submit' type='submit' value='Submit answers'>";
}

function post_answers($dbconn, $id, $answers) {

    $score = 0;    

    $sql = "SELECT answer FROM quiz q JOIN questions ON quiz_id=q.id WHERE q.id= '" . $id . "'";

    $result = $dbconn->query($sql);

    $index = 0;

    while($row = $result->fetch_assoc()) {
        if(strtolower($row['answer']) === strtolower($answers[$index])) {
            $score += 100;
        } 
        $index++;
    }

    insertScore($dbconn, $id, $score);

    echo $score;
}

function insertScore($dbconn, $id, $score) {

    session_start();

    $userid = $_SESSION['id'];

    $sql = "SELECT score FROM highscore_quiz hq JOIN highscore h ON h.id = hq.highscore_id WHERE hq.quiz_id = '".$id."' AND h.username_id = '".$userid."'";
    $result = $dbconn->query($sql);

    if(mysqli_num_rows($result)!=0) {
		$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
        if($score > $row['score']) {
            $sql = "UPDATE highscore SET score = '".$score."' WHERE username_id = '".$userid."'";
            $result = $dbconn->query($sql);
        }
    } else {
        $sql = "INSERT INTO highscore(score, username_id) VALUES('".$score."', '".$userid."')";
        $result = $dbconn->query($sql);
        $last_id = $dbconn->insert_id;

        $sql = "INSERT INTO highscore_quiz(highscore_id, quiz_id) VALUES('".$last_id."', '".$id."')";
        $result = $dbconn->query($sql);
    }
    
}

function get_highscores_by_quiz_id($dbconn, $id) {
    $sql = "SELECT title FROM quiz WHERE id = '" . $id . "'";
    $result = $dbconn->query($sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

    echo "<h3>" . $row['title'] . "</h3>";

    $sql = " SELECT score, username FROM users u join highscore h on h.username_id = u.id join highscore_quiz hq on hq.highscore_id=h.id WHERE hq.quiz_id = '" . $id . "'";
    $result = $dbconn->query($sql);

    echo "<table>";
    echo "<tr>";
    echo "<th>Username</th>";
    echo "<th>Score</th>";
    echo "</tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['username'] . "</td>";
        echo "<td>" . $row['score'] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
}

function post_quiz($dbconn, $title, $questions, $answers) {
    
    session_start();

    $userid = $_SESSION['id'];

    $sql = "INSERT INTO quiz(title, user_id) VALUES ('".$title."', '".$userid."')";
    $result = $dbconn->query($sql);
    $last_id = $dbconn->insert_id;

    $sql = "INSERT INTO questions(question, answer, quiz_id) VALUES ";

    for($i = 0; $i < count($questions); $i++) {
        if($i == 0) {
            $sql.= "('".$questions[$i]."', '".$answers[$i]."', '".$last_id."')";
        } else {
            $sql.= ", ('".$questions[$i]."', '".$answers[$i]."', '".$last_id."') ";
        }
    };

    $result = $dbconn->query($sql);
}

?>
