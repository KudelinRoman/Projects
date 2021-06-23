<?php

        $server = "localhost"; /* имя хоста (уточняется у провайдера), если работаем на локальном сервере, то указываем localhost */
        $username = "root"; /* Имя пользователя БД */
        $password = ""; /* Пароль пользователя, если у пользователя нет пароля то, оставляем пустым */
        $database = "kursach"; /* Имя базы данных, которую создали */

        $mysql = mysqli_connect($server,$username,$password,$database);

?>