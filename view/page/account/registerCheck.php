<?php

var_dump($_POST);

$errors = array();

if (isset($_POST["username"]) && !empty($_POST["username"])) {
    $username = $_POST["username"];
} else {
    array_push($errors, "You must choose a username");
}

if (isset($_POST["name"]) && !empty($_POST["name"])) {
    $name = $_POST["name"];
} else {
    array_push($errors, "You must choose a name");
}
if (isset($_POST["surname"]) && !empty($_POST["surname"])) {
    $surname = $_POST["surname"];
} else {
    array_push($errors, "You must choose a surname");
}

if (isset($_POST["email"]) && !empty($_POST["email"])) {
    $email = $_POST["email"];
} else {
    array_push($errors, "You must choose an email");
}

if (isset($_POST["psw"]) && !empty($_POST["psw"])) {
    $psw = $_POST["psw"];
} else {
    array_push($errors, "You must choose a password");
}

if (isset($_POST["psw-repeat"]) && !empty($_POST["psw-repeat"])) {
    $pswrepeat = $_POST["psw-repeat"];
} else {
    array_push($errors, "You must repeat your password");
}

if($psw !== $pswrepeat){
    array_push($errors, "Your passwords do not match");
}

if ($errors) {
    echo "<ul>";
    foreach ($errors as $error) {
        echo "<li>$error</li>";
    }
    echo "</ul>";
} else {
    require_once("./model/database.php");
    $database = new Database();
    $database->createNewUser($username, $name, $surname, $email, password_hash($_POST["psw"], PASSWORD_BCRYPT));
    $SESSION["user"] = $username;
    header("./index.php?controller=account&action=index");
}