<? php>
    $login=filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING); 
    $pass=filter_var(trim($_POST['pass']), FILTER_SANITIZE_STRING);
    
    require_once("connect.php");
    //хеширование
    $pass=md5($pass."sdffsaw3341");
    
    $result=$mysql->query("SELECT*FROM `user` WHERE `login`='$login' AND `password`='$pass'");
    $user=$result->fetch_assoc();
    if(count($user)==0){
        echo "Пользователь не найден";
        exit();
    }
    setcookie('user', $user['id'], time()+60*60*24, "/");

    $mysql->close();
    
    header('Location: /');
?>