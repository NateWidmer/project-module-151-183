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
    <li><a href="selectQuiz.php">Play Quiz</a></li>
    <li><a class="active" href="createQuiz.php">Create Quiz</a></li>
    <li class="logout"><a href="../BL/logout.php">Logout</a></li>
  </ul>
  <!--END NAVBAR -->
  <div class="create-quiz-title">
    <h3>Create a new Quiz</h3>
  </div>

  <!--Plus from start-->
  <div class="quiz-form-container">
    <!--<form class="quiz-form" id="quiz-form"> -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script language="javascript" type="text/javascript">
      $(document).ready(function() {
        $("#submit").click(function(e) {
          e.preventDefault();

          var questions = [];
          $('input[name="question"]').each(function() {
            questions.push(this.value);
          })

          var answers = [];
          $('input[name="answer"]').each(function() {
            answers.push(this.value);
          })

          $.ajax({
            type: 'post',
            url: '../BL/postQuiz.php',
            data: {
              title: $("#quiz_title_input").val(),
              questions: questions,
              answers: answers,
            },
            success: function(response) {
              alert("The Quiz has been created successfully.");
            }
          });
        });
      });
    </script>

    <form id="quiz_form">
      <label id='quiz_title'>Quiz Title</label>
      <br><br>
      <input type='text' id='quiz_title_input' name='title' placeholder='Your title...'>
    </form>
    <form id="quiz_questions_form"></form>
    <input type="hidden" value="1" id="total_inputfields">
    <br />
    <button onclick="add()" class="button button1">Add</button>
    <button onclick="remove()" class="button button1">Remove</button>

    <script>
      function add() {
        var new_inputfield_no = parseInt($('#total_inputfields').val()) + 1;
        var new_input_question = "<input type='text' id='new_" + new_inputfield_no + "' name='question' placeholder='Your question..' >";
        var new_input_answer = "<input type='text' id='new_" + new_inputfield_no + "' name='answer' placeholder='Your answer..'>";
        var question_title = "<label id='question_tit" + new_inputfield_no + "'>Question</label>";
        var answer_title = "<label id='answer_tit" + new_inputfield_no + "'>Answer</label>";
        $('#quiz_questions_form').append(question_title);
        $('#total_inputfields').val(new_inputfield_no);
        $('#quiz_questions_form').append(new_input_question);
        $('#total_inputfields').val(new_inputfield_no);
        $('#quiz_questions_form').append(answer_title);
        $('#total_inputfields').val(new_inputfield_no);
        $('#quiz_questions_form').append(new_input_answer);
        $('#total_inputfields').val(new_inputfield_no);
      }

      function remove() {
        var last_inputfield_no = $('#total_inputfields').val();
        if (last_inputfield_no > 1) {
          ;
          $('#question_tit' + last_inputfield_no).remove();
          $('#total_inputfields').val(last_inputfield_no - 1);
          $('#new_' + last_inputfield_no).remove();
          $('#total_inputfields').val(last_inputfield_no - 1);
          $('#answer_tit' + last_inputfield_no).remove();
          $('#total_inputfields').val(last_inputfield_no - 1);
          $('#new_' + last_inputfield_no).remove();
          $('#total_inputfields').val(last_inputfield_no - 1);

        }
      }
    </script>

    <input id="submit" type="submit" value="Create Quiz">
    <p id="error"></p>
  </div>

  <!--Plus from end-->


</body>

</html>