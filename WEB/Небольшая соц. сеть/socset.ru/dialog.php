<?
    require_once 'connect.php';
    require_once 'functions.php';
    require_once 'bloks/menu_no_search.php';

 
?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/home.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script type="text/javascript"  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Диалог</title>
</head>

<body>
    <!-- -->
    <!-- Проверка на аторизованность пользователя
если пользователь не авторизован его перенаправляет на страницу авторизации -->
    <?php
        $user_id=$_COOKIE['user'];
        $dialog_id = $_GET['dialog_id'];

        if($_COOKIE['user']==''):
    ?>
    <script>
        window.location.href = 'login.php';

    </script>
    <!-- если пользователь аторизован он видит содержание страницы-->
    <?php else: ?>
    <!-- подключение файла содержащего меню для сайта-->
        <?php
            $dialog = get_dialog_id($dialog_id);
            $result = get_messages($dialog_id);

            if($user_id == $dialog[sender]) {
                $recipient = get_user_id($dialog[recipient]);
            }
            else {
                $recipient = get_user_id($dialog[sender]);
            } 
        ?>
        <section class="msger">
            <header class="msger-header">
                <div class="msger-header-title">
                <i class="fas fa-comment-alt"></i> <?= $recipient[name]." ".$recipient[last_name];?>
                </div>
            </header>
                <main id = "let" class="msger-chat">
                    <?php 
                    while($messages = mysqli_fetch_assoc($result)) :
                        $user_m = get_user_id($messages[sender]);
                        if($messages[sender] == $user_id):
                    ?>
                        <div class="msg right-msg">
                            <div class="msg-bubble">
                                <div class="msg-info">
                                    <div class="msg-info-name"><?= $user_m[name]." ".$user_m[last_name]?></div>
                                    <div class="msg-info-time"><?= $messages[date] ?></div>
                                </div>
                                <div class="msg-text"><?= $messages[text] ?></div>
                            </div>
                        </div>
                        <? else: ?>
                        <div class="msg left-msg">
                            <div class="msg-bubble">
                                <div class="msg-info">
                                    <div class="msg-info-name"><?= $user_m[name]." ".$user_m[last_name]?></div>
                                    <div class="msg-info-time"><?= $messages[date] ?></div>
                                </div>
                                <div class="msg-text"><?= $messages[text] ?></div>
                            </div>
                        </div>
                        <? endif; endwhile; ?>
                </main>
                
                <form class="msger-inputarea" action="/message.php" method="post" >
                    <input  type="hidden" name="user_id" value=<?= $user_id ?> />
                    <input  type="hidden" name="dialog_id" value=<?= $dialog[id] ?> />
                    <input  type="text"   name="text" class="msger-input" placeholder="Enter your message...">
                    <button type="submit" name="senDialog" class="msger-send-btn">Отправить</button>
                </form>
        </section>

    <?php endif; ?>
</body>

    <script type="text/javascript">
        function GetSelect(){
            $("#let").load("/dialog.php?dialog_id=<?= $dialog[id] ?> #let")
        }
        GetSelect();
        var interval = 1000;
        setInterval('GetSelect()',interval);
    </script>

</html>
