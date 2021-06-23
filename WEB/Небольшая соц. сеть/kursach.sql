-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 16 2020 г., 02:24
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kursach`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `text`, `date`) VALUES
(1, 4, 1, 'Гутен таг', '2020-06-15 00:00:00'),
(2, 4, 1, 'dasdasd', '2020-06-15 16:33:00');

-- --------------------------------------------------------

--
-- Структура таблицы `dialogs`
--

CREATE TABLE `dialogs` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dialogs`
--

INSERT INTO `dialogs` (`id`, `sender`, `recipient`) VALUES
(1, 4, 1),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `dialog` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user`, `title`, `text`, `date`) VALUES
(1, 2, 'Первая запись', 'Привет, это самая первая запись. Оставайся на сайте. Делись своими новостями.Читай новости других пользователей. И помогай нам делать наш сайт лучше.\r\nСпасибо)', '2020-06-13'),
(2, 2, 'Вторая запись', 'Это вторая запись', '2020-06-07');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `dateOfRegistration` date NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `last_name`, `avatar`, `login`, `email`, `password`, `dateOfBirth`, `dateOfRegistration`, `description`) VALUES
(1, 'dfvfdbfd', 'dfbfdbdf', 'avatars/one.png', 'vdvdsdvf', 'dfbfdfd@', '1637c4aaa9740096b2b91a8c5b682f7f', NULL, '2020-06-13', NULL),
(2, 'Admin', 'Admin', 'avatars/two.png', 'Admin', 'adm@mail.ru', '1637c4aaa9740096b2b91a8c5b682f7f', '2020-06-10', '2020-06-13', 'bgfbgfbgft'),
(3, 'BHDsjs', 'Rgvdb', 'avatars/two.png', 'RRRRR', 'gregre@bfd', '1637c4aaa9740096b2b91a8c5b682f7f', '2020-05-25', '2020-06-13', '1323543'),
(4, 'Сергей', 'Дремченко', 'avatars/no_avatar.png', 'samurais', 'asda@mail.ru', '9ca4a22708269b5a1fa13a2a31baf419', NULL, '2020-06-14', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD KEY `id` (`id`),
  ADD KEY `users` (`user_id`);

--
-- Индексы таблицы `dialogs`
--
ALTER TABLE `dialogs`
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD KEY `id` (`id`),
  ADD KEY `dialog` (`dialog`),
  ADD KEY `receiver` (`recipient`),
  ADD KEY `sender` (`sender`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD KEY `id` (`id`),
  ADD KEY `autor` (`user`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `dialogs`
--
ALTER TABLE `dialogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`dialog`) REFERENCES `dialogs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`sender`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
