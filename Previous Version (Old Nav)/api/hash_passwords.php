<?php
require 'cors.php';
$passwords = ["*Sh^eld*", "Speed64", "Triumph@nt"];
foreach ($passwords as $password) {
    echo password_hash($password, PASSWORD_DEFAULT) . "<br>";
}
?>