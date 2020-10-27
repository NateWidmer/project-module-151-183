<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$id = "";
if (isset($_GET['id'])) {
    $id = $_GET['id'];
}
$answers = $_POST['answers'];

post_answers($con, $id, $answers);
