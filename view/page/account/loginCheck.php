<?php
session_start();
$errors = array();
require("model/database.php");
$database = new Database();

if (isset($_POST["email"]) && !empty($_POST["email"])) {
    $email = $_POST["email"];
} else {
    array_push($errors, "You need to choose an email");
}

if (isset($_POST["psw"]) && !empty($_POST["psw"])) {
    $psw = $_POST["psw"];
} else {
    array_push($errors, "You need to choose a password");
}

if ($database->loginUser($email, $psw)) {
    $_SESSION["login"] = $email;
    //header("Location: index.php?controller=home&action=index");
    //exit();
} else {
    echo "t nul";
}
