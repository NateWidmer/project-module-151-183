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
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
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
   <div class="highscore-title">
    <h1>Highscores</h1>
    <h3>Quiz Name</h3>
   </div>
   <table>
    <tr>
      <th>Username</th>
      <th>Score</th>
    </tr>
    <tr>
      <td>test</td>
      <td>test</td>
    </tr>
    <tr>
      <td>test</td>
      <td>test</td>
    </tr>
    <tr>
      <td>test</td>
      <td>test</td>
    </tr>
    <tr>
      <td>test</td>
      <td>test</td>
    </tr>
    <tr>
      <td>test</td>
      <td>test</td> 
    </tr>
    <tr>
      <td>test</td>
      <td>test</td>
    </tr>
  </table>
   <!--END TABLE -->

</body>
</html>