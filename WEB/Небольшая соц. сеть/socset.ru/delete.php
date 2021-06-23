<?php
    require_once 'connect.php';

    /* Принимаем данные из формы */
    $post_id = $_POST["post_id"];

    $mysql->query("DELETE FROM `comments` WHERE post_id = $post_id");
    $mysql->query("DELETE FROM `posts` WHERE id = $post_id");
    
    $mysql->close();
    header("Location: ".$_SERVER["HTTP_REFERER"]);// Делаем реридект обратно