<?php
    if(isset($_POST["senDialog"])){
        require_once 'connect.php';

        $text = $_POST["text"];
        $user_id = $_POST["user_id"];
        $dialog_id = $_POST["dialog_id"];

        $text = htmlspecialchars($text);

        $date=date('Y-m-d H:i');

        $mysql->query("insert into message (`text`, `date`, `dialog`, `sender`) 
        VALUES ('$text','$date','$dialog_id','$user_id')");
        $mysql->close();
        header("Location: ".$_SERVER["HTTP_REFERER"]);
    }
