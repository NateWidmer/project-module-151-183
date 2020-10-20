<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$username = $_POST['username'];
$password = $_POST['password'];
$password2 = $_POST['password2'];

register_user($con, $username, $password, $password2);
