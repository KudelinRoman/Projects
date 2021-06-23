<?php
    session_start();

    require_once("connect.php");
    $login=filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING); 
    $name=filter_var(trim($_POST['name']), FILTER_SANITIZE_STRING); 
    $famile=filter_var(trim($_POST['famile']), FILTER_SANITIZE_STRING); 
    $email=filter_var(trim($_POST['email']), FILTER_SANITIZE_STRING); 
    $pass=filter_var(trim($_POST['pass']), FILTER_SANITIZE_STRING);
    $pass1=filter_var(trim($_POST['pass1']), FILTER_SANITIZE_STRING); 
    $date=date('Y-m-d');
    $null=null;

    $result = $mysql->query("SELECT*FROM `user` WHERE `login`='$login'");
    $user = $result->fetch_assoc();
    if(count($user) > 0){
        header('Location: /registration.php?error=1');
        exit();
    }
    $result = $mysql->query("SELECT*FROM `user` WHERE `email`='$email'");
    $userEm = $result->fetch_assoc();
    if(count($userEm) > 0){
        header('Location: /registration.php?error=8');
        exit();
    }
    if (mb_strlen($login)<5 || mb_strlen($login)>25){
        header('Location: /registration.php?error=2');
        exit();
    }else if (mb_strlen($name)<2 || mb_strlen($name)>25){
        header('Location: /registration.php?error=3');
        exit();
    }else if (mb_strlen($famile)<3 || mb_strlen($famile)>25){
        header('Location: /registration.php?error=4');
        exit();
    }else if (mb_strlen($email)<5 || mb_strlen($email)>40){
        header('Location: /registration.php?error=5');
        exit();
    }else if (mb_strlen($pass)<6 || mb_strlen($pass)>16){
        header('Location: /registration.php?error=6');
        exit();
    }
    else if (strcmp($pass, $pass) != 0){
        header('Location: /registration.php?error=7');
        exit();
    }
    //хеширование
    $pass=md5($pass."sdffsaw3341");


    $mysql->query("INSERT INTO `user` (`login`, `name`, `last_name`, `email`, `password`, `dateOfRegistration`, `avatar`)
        VALUES('$login', '$name','$famile','$email','$pass', '$date', 'avatars/no_avatar.png')");
    $mysql->close();
    header('Location: /login.php');

?>