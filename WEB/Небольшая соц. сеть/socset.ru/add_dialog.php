<?php
require_once 'connect.php';
require_once 'functions.php';

/* Принимаем данные из формы */
$user_id = $_POST["user_id"];
$author_id = $_POST["author_id"];
$count = get_dialog_user($user_id,$author_id);
if($count == 0){
    $mysql->query("INSERT INTO `dialogs`( `sender`, `recipient`) VALUES ('$user_id','$author_id')");
}
$mysql->close();

header("Location: /dialogs.php");