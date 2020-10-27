<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$title = $_POST['title'];
$questions = $_POST['questions'];
$answers = $_POST['answers'];

post_quiz($con, $title, $questions, $answers);
