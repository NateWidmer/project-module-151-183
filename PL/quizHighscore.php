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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script language="javascript" type="text/javascript">
    let params = (new URL(document.location)).searchParams;
    let id = params.get('id');
    let score = params.get('score');

    $(document).ready(function() {
      $.get("../BL/getHighscores.php/?id=" + id, function(data) {
        $("#highscore-container").html(data);
      })

      if (score) {
        document.getElementById("score-title").innerHTML = "You have achieved a Score of:"
        document.getElementById("score").innerHTML = score;
      }
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
  <!--START TABLe -->
  <div class="score-page">
    <div id="your-score">
      <h3 id="score-title"></h3>
      <h1 id="score"></h1>
    </div>
    <h2>All Highscores</h1>
      <div id="highscore-container">

      </div>

  </div>
  <!--END TABLE -->

</body>

</html>