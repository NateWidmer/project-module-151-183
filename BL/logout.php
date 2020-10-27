<?php

session_start();

// Destroy 
session_destroy();

header('Location: ../PL/login.php');
exit;

?>
