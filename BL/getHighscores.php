<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$id = "";
if (isset($_GET['id'])) {
    $id = $_GET['id'];
}

get_highscores_by_quiz_id($con, $id);