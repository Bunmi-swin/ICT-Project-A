<?php
$password = "*Shield*";
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
echo $hashedPassword;
?>