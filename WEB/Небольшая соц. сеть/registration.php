<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name ="viewport" content="width=device-width", initial-scale=1.0>
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <title>Регистрация</title>
</head>
<?if(isset($_GET['error'])) $error = $_GET['error'];?>
    <body>
        <div class="auth">
        <form class="autoriz" action="reg.php" method="post">
            <h1>Регистрация</h1>
                
                    <input type="text" autocomplete="off" class="form-control" name="login" id="login" placeholder="Введите логин" required minlength="6" >
                    <input type="text" autocomplete="off" class="form-control" name="name" id="name" placeholder="Введите имя" minlength="2" pattern="[А-Я][А-Яа-я]+" required><br>
                    <input type="text" autocomplete="off" class="form-control" name="famile" id="famile" placeholder="Введите фамилию"><br>
                    <input type="email" autocomplete="off" class="form-control" name="email" minlength="2" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" id="email" placeholder="Введите почту" required><br>
                    <input type="password" class="form-control" name="pass" id="pass" placeholder="Введите парооль" required><br>
                    <input type="password" class="form-control" name="pass" id="pass1" placeholder="Введите парооль еще раз" required>
             
            <br>
                    <? switch($error){
                         case 0:
                            echo "<br>";
                            break;
                        case 1: 
                            echo "<br> Данный логин уже существует!";
                            $error = 9;
                            break;
                        case 2:
                            echo "<br> Недопустимая длина логина!";
                            break;
                        case 3:
                            echo "<br> Недопустимая длина имя!";
                            break;
                        case 5:
                            echo "<br> Недопустимая длина почты!";
                            break;
                        case 6:
                            echo "<br> Недопустимая длина пароля. Допустимая длина от 6 до 16!";
                            break;
                        case 7:
                            echo "<br> Пароли не совпадают!";
                            break;
                        case 8:
                            echo "<br> Пользователь с такой почтой уже существует!";
                            break;
                        case 9:
                            break;
                        default:
                            break;
                        }?>
                        
                    <button class="btn btn-success" type="submit">Отправить</button> <br>
                    <a href="login.php">У меня уже есть аккаунт</a><br>
        </form>
        </div>
    </body>
</html>