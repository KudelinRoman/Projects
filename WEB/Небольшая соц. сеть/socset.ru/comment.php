<?php

    require_once 'connect.php';

    /* Принимаем данные из формы */
    $user_id = $_POST["user_id"];
    $post_id = $_POST["post_id"];

    $text = $_POST["text"];
    $text = htmlspecialchars($text);// Преобразуем спецсимволы в HTML-сущности

    $date=date('Y-m-d H:i');

    $mysql->query("INSERT INTO `comments` (`user_id`,`post_id`, `text`, `date`) VALUES ('$user_id','$post_id', '$text','$date')");
    $mysql->close();
    header("Location: ".$_SERVER["HTTP_REFERER"]);// Делаем реридект обратно