<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$username = $_POST['username'];
$password = $_POST['password'];

login_user($con, $username, $password);
