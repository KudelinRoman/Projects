<?php

function get_posts() {
       
    global $mysql;
    $sql = "select * from posts";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function get_posts_author_id($id) {
       
    global $mysql;
    $sql = "select * from posts where user =$id";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function get_dialogs($sender_id) {
       
    global $mysql;
    $sql = "select * from dialogs where sender = $sender_id or recipient = $sender_id";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function get_comments_for_post($id){
    global $mysql;
    $sql = "select * from comments where post_id = $id";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function get_user_id($id){
    global $mysql;
    $sql = "select * from user where id = $id";
    $result = mysqli_query($mysql, $sql);
    $author = mysqli_fetch_assoc($result);

    return $author;
}

function get_post_id($id){
    global $mysql;
    $sql = "select * from posts where id = $id";
    $result = mysqli_query($mysql, $sql);
    $post = mysqli_fetch_assoc($result);

    return $post;
}

function get_messages($dialog_id){
    global $mysql;
    $sql = "select * from message where dialog = $dialog_id";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function get_dialog_id($id){
    global $mysql;
    $sql = "select * from dialogs where id = $id";
    $result = mysqli_query($mysql, $sql);
    $dialog = mysqli_fetch_assoc($result);

    return $dialog;
}

function get_dialog_user($user1, $user2){

    global $mysql;

    $sql = "select * from dialogs where sender = $user1 and recipient = $user2 or sender = $user2 and recipient = $user1";
    $result = mysqli_query($mysql, $sql);

    if($result->num_rows > 0)
        return 1;
    return 0;
}

function search_posts_title($word){
    global $mysql;

    $word = htmlspecialchars($word);
    $sql = "select * from posts where title LIKE '%$word%'";
    $result = mysqli_query($mysql, $sql);

    return $result;
}

function search_posts_title_user($user_id,$word){
    global $mysql;

    $word = htmlspecialchars($word);
    $sql = "select * from posts where title LIKE '%$word%' and user = $user_id";
    $result = mysqli_query($mysql, $sql);

    return $result;
}