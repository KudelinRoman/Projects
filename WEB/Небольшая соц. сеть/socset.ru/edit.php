<?php
    require_once 'connect.php';
    require_once 'functions.php'; 
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name ="viewport" content="width=device-width", initial-scale=1.0>
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="css/edit.css" type="text/css">
    <title>Редактирование профиля</title>
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
        <?php require_once "bloks/menu_no_search.php"?>
        <div class="edit-bloks">
            <div class="avatar">
                <?php>
                    $id=$_COOKIE['user'];
                    $user = get_user_id($id);
                    if ($user[avatar]!=''){
                    echo '<img class="my-avatar" src="';
                    echo $user[avatar];
                    echo '">';
                    }else{
                        echo '<img class="my-avatar" src="avatars/no_avatar.png">';
                    }   
                ?>
            </div>
            <button class="edit-avatar" onclick='location.href="javascript:PopUpShow()"'>Изменить аватар</button>
            <form class="info" action="show.php" method="post">
                <div class="infos">
                    <p>Имя</p>
                     <?php
                        echo '<input class="name" autocomplete="off" type="text" id="name" name="name" value="';
                        echo $user[name];
                        echo '">';   
                    ?>
                </div>
                <div class="infos">
                    <p>Фамилия</p>
                    <?php
                        echo '<input class="famile" autocomplete="off" type="text" id="famile" name="famile" value="';
                        echo $user[last_name];
                        echo '">';  
                    ?>
                </div>
                <div class="infos">
                    <p>Дата рождения</p>
                    <?php
                        echo '<input class="date" autocomplete="off" type="date" id="date" name="date" value="';
                        echo $user[dateOfBirth];
                        echo '">';  
                    ?>
                </div>
                <div class="infos">
                    <p>О себе</p>
                    <?php
                        echo '<textarea class="description" id="description" name="description">';
                        echo $user[description];
                        echo '</textarea>';
                        $mysql->close();   
                    ?>
                </div>
                <div class="butt">
                <button class="save">Сохранить</button>
                <button class="cancel" type="button" onclick='location.href="index.php"'>Отмена</button>
            </div>
            </form>
            
        </div>
        
        <!--окно выбора аватарки -->
        <div class="b-popup" id="popup1">
            <div class="b-popup-content">
                <div class="avatarki">
                    
                    <img class="av" id="av" name="av" src="avatars/no_avatar.png">
                    <div class="radio_ph">
                        <input name="ph" type="radio" value="avatars/one.png" onclick="fot()">
                        <input name="ph" type="radio" value="avatars/two.png"  onclick="fot2()">
                        <input name="ph" type="radio" value="avatars/three.png"  onclick="fot3()">
                        <input name="ph" type="radio" value="avatars/five.png"  onclick="fot4()">
                        <input name="ph" type="radio" value="avatars/four.png"  onclick="fot5()">
                        <input name="ph" type="radio" value="avatars/no_avatar.png"  onclick="fot6()">
                     </div>
                </div>
                <div class="butt-close">
                    <button class="pop-close" onclick='location.href="javascript:PopUpHide1()"'>Закрыть</button>
                </div>
            </div>
        </div>
   
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
        <!--Выбор аватара -->
        <script>
            function fot (){
               document.getElementById("av").src="avatars/one.png";
                var variableToSend = 'avatars/one.png';
                $.post('new_av.php', {variable: variableToSend});
               
            }
            function fot2 (){
               document.getElementById("av").src="avatars/two.png";
                var variableToSend = 'avatars/two.png';
                $.post('new_av.php', {variable: variableToSend});
            }
                 function fot3 (){
               document.getElementById("av").src="avatars/three.png";
                     var variableToSend = 'avatars/three.png';
                $.post('new_av.php', {variable: variableToSend});
                     
            }
                 function fot4 (){
               document.getElementById("av").src="avatars/five.png";
                     var variableToSend = 'avatars/five.png';
                $.post('new_av.php', {variable: variableToSend});
                     
            }
                 function fot5 (){
               document.getElementById("av").src="avatars/four.png";
                     var variableToSend = 'avatars/four.png';
                $.post('new_av.php', {variable: variableToSend});
                     
            }
                 function fot6 (){
               document.getElementById("av").src="avatars/no_avatar.png";
                     var variableToSend = 'avatars/no_avatar.png';
                $.post('new_av.php', {variable: variableToSend});
            
            }
                 function obnovit_stranicu() {
                     location.reload();
                 }
        
        </script>
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
            function PopUpHide1(){
            $("#popup1").hide();
            obnovit_stranicu();
        }
    </script>
     <script>
            $(document).ready(function(){
                $('.av').click(function(){
                    var url = $(this).prop('src'),
                        location.href = "http://socset.ru/show.php?url=" + url;
                  $("#popup1").hide();
           });
            });
            
              
        </script>
    <?php endif; ?> 
    </body>
</html>