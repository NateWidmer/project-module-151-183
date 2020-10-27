<?php

session_start();

if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === false) {
  header("location: login.php");
  exit;
}
?>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="style.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script language="javascript" type="text/javascript">
    $(document).ready(function() {
      $.get("../BL/getQuizzes.php", function(data) {
        $("#card-container").html(data);
      })
    });
  </script>
</head>

<body>
  <!--START HEADER -->
  <div class="header">
    <img src="images/quizialist.PNG" alt="Quizialist Logo">
  </div>
  <!--END HEADER -->
  <!--START NAVBAR -->
  <ul>
    <li><a class="active" href="selectQuiz.php">Play Quiz</a></li>
    <li><a href="createQuiz.php">Create Quiz</a></li>
    <li class="logout"><a href="../BL/logout.php">Logout</a></li>
  </ul>
  <!--END NAVBAR -->
  <!--START PLAY QUIZ TITLE -->
  <div class="play-quiz-title">
    <h1>Quizzes</h1>
    <!--END PLAY QUIZ TITLE -->
    <div id="card-container">
      <!--START CARD -->
    </div>

  </div>
  <!--Put all cards into this diff!! -->
  <!--END CARD -->
</body>

</html>