<?php 
    require_once 'connect.php';
    require_once 'functions.php';
    require_once 'bloks/menu.php';

    
?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <script type="text/javascript"  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Главная страница</title>
</head>

<body>
    <!-- -->
    <!-- Проверка на аторизованность пользователя
если пользователь не авторизован его перенаправляет на страницу авторизации -->
    <?php
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
                    $result = search_posts_title($_GET['search']);
                }
                else{
                    $result = get_posts(); 
                }
            ?>
            <div id = "ps">
                <?php while($post = mysqli_fetch_assoc($result)):?>
                    <div class="news1">
                        <div class="name-date-time">
                            <div class="name">
                                <p><a href="/post.php?post_id=<? echo $post[id]?>"><?= $post[title]?></a></p>
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
                    </div>
                <?php endwhile; ?>
            </div>
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
                <button class="open-prof" onclick='location.href="user.php?id=<?= $id?>"'> Открыть профиль</button>
            </div>
            <div class="open-profill">
                <button class="open-prof" onclick='location.href="javascript:PopUpShow()"'> Новая запись</button>
            </div>
        </div>

    </div>

        <div class="b-popup" id="popup1">
            <div class="b-popup-content">
                
                <div class="butt-close">
                    <form class="new-post" action="new_post.php" method="post">
                    <div class="infos">
                       
                        <p>Тема</p>
                        <input class="theme-post" autocomplete="off" type="text" id="theme_post" name="theme_post" minlength="1" value="" required>
                    </div>
                    <div class="infos">
                        <p>Новость</p>
                        <textarea class="text-post" id="text_post" name="text_post" minlength="1" required></textarea>
                    </div>
                    <div class="butt">
                         <button class="open-prof" type="submit">Сохранить</button>
                        <button class="open-prof" type="button" onclick='location.href="javascript:PopUpHide()"'>Закрыть</button>
                    </div>
                     </form>
                </div>
               
            </div>
        </div>
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
        <!--Открытие/закрытие окна выбора аватарки  -->
        <script>
        $(document).ready(function(){
            //Скрыть PopUp при загрузке страницы    
            PopUpHide();            
        });
        //Функция отображения PopUp
        function PopUpShow(){
            $("#popup1").show();
        }
        //Функция скрытия PopUp
        function PopUpHide(){
            $("#popup1").hide();
        }
    </script>

        <script type="text/javascript">
        function GetSelect(){
            $("#ps").load("/index.php?search=<?=$_GET['search']?> #ps")
        }
        GetSelect();
        var interval = 1000;
        setInterval('GetSelect()',interval);
    </script>
    <?php endif; ?>
</body>

</html>
