<?php
    require_once 'connect.php';
    require_once 'functions.php';
    require_once 'bloks/menu.php'; 
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name ="viewport" content="width=device-width", initial-scale=1.0>
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="css/home.css" type="text/css">
</head>
    <body>
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
            <div class="news1">
                <?php>
                    $id=$_COOKIE['user'];
                    $result=$mysql->query("SELECT * FROM `kursach`.`record` WHERE autor=2");
                    $user=$result->fetch_assoc();
                    $autor=$user['autor'];
                    $subject=$user['subject'];
                    $date=$user['date'];
                    $text=$user['text'];
                    $result=$mysql->query("SELECT * FROM `kursach`.`user` WHERE id=$autor");
                    $user=$result->fetch_assoc();
                    $autor_name=$user['name'];
                    $autor_famile=$user['famile'];
                    echo '<div class="name-date-time">
                    <div class="name">';
                    echo '<p>';
                    echo $subject;
                    echo '</p>';
                    echo '</div>
                    <div class="date-time">
                        <p>';
                    echo $date;
                    echo '</p>';
                    echo '</div>
                </div>
                <div class="publication">
                    <p>';
                    echo $text;
                    echo '</p>';
                    echo '</div>';
                    echo '<div class="autor">
                    <p><a href="/">';
                    echo $autor_name;
                    echo " ";
                    echo $autor_famile;
                    echo '</a></p>';
                    echo '</div>';
                    $mysql->close();   
                ?>
                
            </div>
            <div class="news1">
                <div class="name-date-time">
                    <div class="name">
                        <p>News</p>
                    </div>
                    <div class="date-time">
                        <p>Date</p>
                    </div>
                </div>
                <div class="publication">
                    <p>Текст публикации</p>
                </div>
            </div>
            <div class="news1">
                <div class="name-date-time">
                    <div class="name">
                        <p>News</p>
                    </div>
                    <div class="date-time">
                        <p>Date</p>
                    </div>
                </div>
                <div class="publication">
                    <p>Текст публикации</p>
                </div>
            </div>        
        </div>
        <div class="user">
            <div class="avatar">
                <?php>
                    $mysql= new mysqli('localhost', 'root','','kursach'); 
                    $id=$_COOKIE['user'];
                    $result=$mysql->query("SELECT * FROM `kursach`.`user` WHERE id=$id");
                    $user=$result->fetch_assoc();
                    $avatar=$user['avatar'];
                    if ($avatar!=''){
                    echo '<img src="';
                    echo $avatar;
                    echo '">';
                    }else{
                        echo '<img src="avatars/no_avatar.png">';
                    }
                    $mysql->close();   
                ?>
            </div>
            <div class="last-fers-name">
                <?php>
                    $mysql= new mysqli('localhost', 'root','','kursach'); 
                    $id=$_COOKIE['user'];
                    $result=$mysql->query("SELECT * FROM `kursach`.`user` WHERE id=$id");
                    $user=$result->fetch_assoc();
                    $name=$user['name'];
                    $famile=$user['famile'];
                    echo '<p>';
                    echo $name;
                    echo " ";
                    echo $famile;
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