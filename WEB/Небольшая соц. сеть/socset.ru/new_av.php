<? php>
    $put=filter_var(trim($_POST['av']), FILTER_SANITIZE_STRING); 
    $variable = $_POST['variable'];
    $id=$_COOKIE['user'];
    require_once("connect.php");
    $result=$mysql->query("UPDATE `user` SET avatar= '$variable' WHERE id=$id");
    $mysql->close();
   header("Location: ".$_SERVER["HTTP_REFERER"]);
?>