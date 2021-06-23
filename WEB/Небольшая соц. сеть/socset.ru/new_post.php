<? php>
    session_start();
    $theme_post=filter_var(trim($_POST['theme_post']), FILTER_SANITIZE_STRING); 
    $text_post=filter_var(trim($_POST['text_post']), FILTER_SANITIZE_STRING);  
    $date=date('Y-m-d');
    $id=$_COOKIE['user'];
    if(strlen($theme_post) > 1 && strlen($text_post) > 1 ){
        require_once("connect.php");
        $mysql->query("INSERT INTO `posts` (`user`, `title`,`text`, `date`)
        VALUES('$id', '$theme_post','$text_post','$date')");
        $mysql->close();
    }
    
    header("Location: ".$_SERVER["HTTP_REFERER"]);
?>