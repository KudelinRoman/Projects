<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css" type="text/css">
<title>Авторизация</title>
</head>
    <body>
        <div class="auth">
            <form class="autoriz" action="auth.php" method="post">
                <h1>Авторизация</h1>
                    <input type="text" class="form-control" name="login" id="login" minlength="5" placeholder="Введите логин"> <br>
                    <input type="password" class="form-control" name="pass" id="pass" placeholder="Введите парооль"><br>
                <p><a href="registration.php">Еще не зарегестрированы?</a></p>
                    <button class="btn btn-success" type="submit">Отправить</button>
                    </form>
        </div>
    </body>
</html>