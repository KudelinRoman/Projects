<?php 
    require_once 'connect.php';
    require_once 'functions.php';
    require_once 'bloks/menu_no_search.php';  
?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <title>Пост</title>
</head>

<body>
    <!-- -->
    <!-- Проверка на аторизованность пользователя
если пользователь не авторизован его перенаправляет на страницу авторизации -->
    <?php
        $user_id=$_COOKIE['user'];
        $user = get_user_id($user_id);
        $post_id = $_GET['post_id'];
        $post = get_post_id($post_id); 

        $result = get_comments_for_post($post_id); 

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
            <div class="news1">
            <div class="name-date-time">
                    <div class="name">
                        <p><? echo $post[title]?></p>
                    </div>
                    <div class="date-time">
                        <p><? echo $post[date]?></p>
                    </div>
                </div>
                <div class="publication">
                    <p><? echo $post[text] ?></p>
                </div>
                <div class="autor">
                    <?php $author = get_user_id($post[user])  ?>
                    <p><a href="/"><?= $author[name]." ".$author[famile] ?></a></p>
                </div>
            </div>
            
            <div class="commentary">
                <div class="name_com">
                    <br>
                    <p class="comm_name_p">Комментарии</p>
                    <br>
                </div>
                <?php while($comment = mysqli_fetch_assoc($result)) { 
                $user_c = get_user_id($comment[user_id]); 
                ?>
                <div class = "comments">                               
                    <div class = ""><?= $user_c[name]." ".$user_c[last_name]?> </div>
                    <div class = ""> <p><?= $comment[text] ?></p> </div>
                    <div class = ""><?= $comment[date] ?></div>
                </div>
                <?php } ?>
                <div class = "comment_input">
                    <form name="comment" action="comment.php" method="post">
                        <p>
                            <label><?=$user[name]." ".$user[last_name]?></label>
                            <input type="hidden" name="user_id" value=<? echo $user_id ?> ><br/>
                        
                        
                            <label>Комментарий:</label>
                            <br/>
                            <textarea class="input_comment" name="text" ></textarea><br/>
                        
                
                            <input type="hidden" name="post_id" value=<? echo $post_id ?> >
                            <button class="btn btn-success" type="submit">Отправить</button>
                        </p>
                    </form>
                </div>
             </div>
        </div>



        <div class="user">
            <div class="avatar">
                <?php
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
