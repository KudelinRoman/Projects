<?php
    require_once 'connect.php';
    require_once 'functions.php';

    $author_id = $_GET['id'];
    require_once 'bloks/menu_u.php'; 
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name ="viewport" content="width=device-width", initial-scale=1.0>
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <title>
        <? 
            $other = get_user_id($author_id);
            echo $other[name]." ".$other[last_name];
        ?>
    </title>
</head>
    <body>
    <!-- Проверка на аторизованность пользователя
если пользователь не авторизован его перенаправляет на страницу авторизации -->
        <?php
            $author_id = $_GET['id'];
            $user_id=$_COOKIE['user'];
        
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
            <?php 
                if(isset($_GET['search'])){
                    $result = search_posts_title_user($author_id,$_GET['search']);               
                }
                else{
                    $result = get_posts_author_id($author_id); 
                }
            ?>
            <?php while($post = mysqli_fetch_assoc($result)): ?>
                <div class="news1">
                    <div class="name-date-time">
                        <div class="name">
                            <p><a href="/post.php?post_id=<?= $post[id]?>"><?= $post[title]?></a></p>
                        </div>
                        <div class="date-time">
                            <p><?= $post[date]?></p>
                        </div>
                    </div>
                    <div class="publication">
                        <p><?= $post[text] ?></p>
                    </div>
                    <div class="autor">
                        <?php $author = get_user_id($post[user])  ?>
                        <p><a href="/user.php?id=<?= $author[id]?>"><?= $author[name]." ".$author[last_name] ?></a></p>
                    </div>
                    <? if($post[user] == $user_id): ?>
                        <form name="delete" action="delete.php" method="post">
                            <input type="hidden" name = "post_id" value = <?= $post[id] ?> />
                            <input class="bt_del" type="submit" name = "delete_btn" value = "Удалить"/>
                        </form>
                    <? endif; ?>
                </div>
            <?php endwhile; ?>
        </div>
        <div class="user">
            <div class="avatar">
                <?php>
                    $user = get_user_id($author_id);
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
                <p>О себе</p>
                    <?php
                        echo '<text class="description" id="description" name="description">';
                        echo $user[description];
                        echo '</text>';
                    ?>
            </div>
            <? if($author_id == $user_id): ?>
            <div class="settings-profill">
                <button class="sett-prof" onclick='location.href="edit.php"'> Изменить профиль</button>
            </div>
            <div class="open-profill">
                <button class="open-prof" onclick='location.href="javascript:PopUpShow()"'> Новая запись</button>
            </div>
            <? else: ?>
                <div class="open-profill">
                    <form name="add_dialog" action="add_dialog.php" method="post">
                        <input type = "hidden" name = "user_id" value = <? echo $user_id ?> />
                        <input type = "hidden" name = "author_id" value = <? echo $author_id ?> />
                        <input type = "submit" name = "add_btn" class="open-prof" value = "Начать диалог"/>
                    </form>
                </div>
            <? endif; ?>
        </div>
    
    </div>
<?php endif; ?>  
    </body>
</html>