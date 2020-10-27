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
    var url = window.location.pathname;
    let params = (new URL(document.location)).searchParams;
    let id = params.get('id');

    $(document).ready(function() {
      $.get("../BL/getQuiz.php/?id=" + id, function(data) {
        $("#play-quiz-container").html(data);
      })
    });

    $(function() {
      $('#play-quiz-container').on('submit', function(e) {
        e.preventDefault();
        var formData = [];
        $('input[name="answer"]').each(function() {
          formData.push(this.value);
        })

        console.log(formData);

        $.ajax({
          type: 'post',
          url: '../BL/postAnswers.php/?id=' + id,
          data: {
            answers: formData
          },
          success: function(response) {
            document.getElementById("error").innerHTML = response;
          }
        });

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
  <!--START NAVBAR -->
  <ul>
    <li><a class="active" href="selectQuiz.php">Play Quiz</a></li>
    <li><a href="createQuiz.php">Create Quiz</a></li>
    <li class="logout"><a href="../BL/logout.php">Logout</a></li>
  </ul>
  <!--END NAVBAR -->
  <!--START PLAY QUIZ TITLE -->
  <div class="play-quiz-title">
    <h1>Quiz name</h1>
    <!--END PLAY QUIZ TITLE -->

    <form id="play-quiz-container">
    </form>

    <p id="error"></p>

</body>

</html>