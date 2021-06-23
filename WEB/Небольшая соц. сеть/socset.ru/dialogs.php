<?php 
    require_once 'connect.php';
    require_once 'functions.php';
    require_once 'bloks/menu_no_search.php';
?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <title>Диалоги</title>
</head>

<body>
    <!-- -->
    <!-- Проверка на аторизованность пользователя
если пользователь не авторизован его перенаправляет на страницу авторизации -->
    <?php
        $user_id=$_COOKIE['user'];
        $result = get_dialogs($user_id); 

        if($_COOKIE['user']==''):
    ?>
    <script>
        window.location.href = 'login.php';

    </script>
    <!-- если пользователь аторизован он видит содержание страницы-->
    <?php else: ?>
    <!-- подключение файла содержащего меню для сайта-->
    <div class="container">
        <div class="news">
            <?php while($dialog = mysqli_fetch_assoc($result)) {
                if($user_id == $dialog[sender]) {
                    $user = get_user_id($dialog[recipient]);
                }
                else {$user = get_user_id($dialog[sender]);}
            ?>

             <div class="dialog">
                <p class="dial"><a href="/dialog.php?dialog_id=<?=$dialog[id]?>"><?= $user[name]." ".$user[last_name]?></a></p>
             </div>

            <?php } ?>
        </div>
        <div class="user">
            <div class="avatar">
                <?php>
                    $id=$_COOKIE['user'];
                    $user = get_user_id($id);
                    if ($user[avatar]!=''){
                    echo '<img src="';
                    echo $user[avatar];
                    echo '">';
                    }else{
                        echo '<img src="avatars/no_avatar.png">';
                    } 
                ?>
            </div>
            <div class="last-fers-name">
                <?php            
                    echo '<p>';
                    echo $user[name];
                    echo " ";
                    echo $user[last_name];
                    echo '</p>';
                    $mysql->close();   
                ?>
            </div>
            <div class="settings-profill">
                <button class="sett-prof" onclick='location.href="edit.php"'> Изменить профиль</button>
            </div>
            <div class="open-profill">
                <button class="open-prof"> Открыть профиль</button>
            </div>
        </div>

    </div>
    <?php endif; ?>
</body>

</html>