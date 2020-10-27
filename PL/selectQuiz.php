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
  <link rel="stylesheet" type="text/css" href="style.css" />
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
    <h1>Quizes</h1>
    <!--END PLAY QUIZ TITLE -->
    <!--START CARD -->
    <div class="card">
      <h3>Quiz Name</h3>
      <div class="card-title">
        <p>Number of questions: </p>
        <p>Creator: </p>
      </div>
      <div class="container">
        <a class="button button1" href="playQuiz.php">Start Quiz!</a>
        <a class="button button1" href="quizHighscore.php">Highscores</a>
      </div>
    </div>

  </div>
  <!--Put all cards into this diff!! -->
  <!--END CARD -->
</body>

</html>