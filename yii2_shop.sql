-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 07 2022 г., 10:49
-- Версия сервера: 8.0.29
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dinamic-site`
--
CREATE DATABASE IF NOT EXISTS `dinamic-site` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dinamic-site`;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `admin` tinyint NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created`) VALUES
(1, 0, 'Dmitry', 'test@gmail.com', '12345', '2022-08-05 12:01:10'),
(2, 0, 'Klim', 'klim@test.com', '1111', '2022-08-05 12:34:26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- База данных: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `cat_name` varchar(45) NOT NULL,
  `browser_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `cat_name`, `browser_name`) VALUES
(1, 'sets', 'Сеты'),
(2, 'sushi', 'Суши'),
(3, 'rolls', 'Роллы');

-- --------------------------------------------------------

--
-- Структура таблицы `good`
--

CREATE TABLE `good` (
  `id` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `composition` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `link_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';

--
-- Дамп данных таблицы `good`
--

INSERT INTO `good` (`id`, `category`, `name`, `composition`, `price`, `descr`, `img`, `link_name`) VALUES
(1, 'sets', 'Сет Запеченный', 'запеченные роллы', 800, 'lorem', 'baked.jpg', 'baked_set'),
(2, 'sets', 'Сет Филамикс', 'три разных ролла Филадельфия', 950, 'lorem', 'philaset.jpg', 'phila_set'),
(3, 'rolls', 'Ролл Филадельфия', 'лосось, сливочный сыр', 300, 'lorem', 'phila.jpg', 'phila'),
(4, 'rolls', 'Ролл Калифорния', 'краб, огурец, масаго', 200, 'lorem', 'california.jpg', 'california'),
(5, 'sushi', 'Суши Лосось', 'лосось, рис', 100, 'lorem', 'salmon.jpg', 'salmon'),
(6, 'sushi', 'Суши Угорь', 'угорь, рис', 110, 'lorem', 'eel.jpg', 'eel');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sum` int NOT NULL,
  `status` enum('Новый','Завершен') NOT NULL DEFAULT 'Новый'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `date`, `name`, `email`, `phone`, `address`, `sum`, `status`) VALUES
(13, '2019-01-20 16:51:52', 'Василий', 'vasickru@mail.ru', '+79518190825', 'Школьная 1/32', 4710, 'Завершен'),
(38, '2019-01-21 06:51:16', '123', 'vasickru@mail.ru', '+79518190825', 'Свердловский Тракт ү', 100, 'Новый'),
(39, '2019-01-28 08:20:29', 'Василий', '1@1.ru', '+79518190825', 'Свердловский Тракт ү', 1900, 'Новый'),
(40, '2019-01-28 08:38:19', '123', 'vasickru@mail.ru', '+79518190825', 'Свердловский Тракт ү', 1250, 'Новый'),
(41, '2022-08-06 21:11:23', 'вапв', 'dfg@mail.ru', '123123', '12313', 2050, 'Новый'),
(42, '2022-08-07 10:20:07', 'дмитрий', '2123@mail.ru', '123123123', '123123123', 13750, 'Новый'),
(43, '2022-08-07 10:25:57', 'дмитрий', '2123@mail.ru', '123123123', '123123123', 13750, 'Новый'),
(44, '2022-08-07 10:26:52', 'дмитрий', '2123@mail.ru', '123123123', '123123123', 13750, 'Новый'),
(45, '2022-08-07 10:27:22', '1', '2123@mail.ru', '2', '2', 1750, 'Новый'),
(46, '2022-08-07 10:27:59', 'вапв', '2123@mail.ru', '89128553767', 'ул.Автозаводская 18-54', 1750, 'Новый'),
(47, '2022-08-07 10:28:22', 'вапв', '2123@mail.ru', '89128553767', 'ул.Автозаводская 18-54', 1750, 'Новый'),
(48, '2022-08-07 10:28:30', 'вапв', '2123@mail.ru', '89128553767', 'ул.Автозаводская 18-54', 1750, 'Новый'),
(49, '2022-08-07 10:30:09', 'вапв', 'dfg@mail.ru', '89128553767', 'ул.Автозаводская 18-54', 1750, 'Новый'),
(50, '2022-08-07 10:30:29', 'вапв', 'dfg@mail.ru', '89128553767', 'ул.Автозаводская 18-54', 1750, 'Новый'),
(51, '2022-08-07 10:30:43', 'g', '2123@mail.ru', 'g', 'g', 1750, 'Новый');

-- --------------------------------------------------------

--
-- Структура таблицы `order_good`
--

CREATE TABLE `order_good` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sum` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `order_good`
--

INSERT INTO `order_good` (`id`, `order_id`, `product_id`, `name`, `price`, `quantity`, `sum`) VALUES
(1, 12, 1, 'Сет Запеченный', 800, 1, 800),
(2, 12, 2, 'Сет Филамикс', 950, 1, 950),
(3, 12, 3, 'Ролл Филадельфия', 300, 2, 600),
(4, 13, 4, 'Ролл Калифорния', 200, 2, 400),
(5, 13, 2, 'Сет Филамикс', 950, 2, 1900),
(6, 13, 6, 'Суши Угорь', 110, 1, 110),
(7, 13, 1, 'Сет Запеченный', 800, 1, 800),
(8, 13, 3, 'Ролл Филадельфия', 300, 5, 1500),
(9, 14, 2, 'Сет Филамикс', 950, 1, 950),
(10, 14, 3, 'Ролл Филадельфия', 300, 2, 600),
(11, 15, 5, 'Суши Лосось', 100, 1, 100),
(12, 15, 6, 'Суши Угорь', 110, 2, 220),
(13, 16, 2, 'Сет Филамикс', 950, 1, 950),
(14, 17, 2, 'Сет Филамикс', 950, 1, 950),
(15, 17, 3, 'Ролл Филадельфия', 300, 1, 300),
(16, 18, 2, 'Сет Филамикс', 950, 1, 950),
(17, 19, 2, 'Сет Филамикс', 950, 1, 950),
(18, 20, 3, 'Ролл Филадельфия', 300, 1, 300),
(19, 21, 3, 'Ролл Филадельфия', 300, 1, 300),
(20, 22, 2, 'Сет Филамикс', 950, 1, 950),
(21, 23, 3, 'Ролл Филадельфия', 300, 1, 300),
(22, 23, 2, 'Сет Филамикс', 950, 1, 950),
(23, 24, 2, 'Сет Филамикс', 950, 1, 950),
(24, 25, 3, 'Ролл Филадельфия', 300, 1, 300),
(25, 26, 3, 'Ролл Филадельфия', 300, 1, 300),
(26, 27, 2, 'Сет Филамикс', 950, 1, 950),
(27, 28, 3, 'Ролл Филадельфия', 300, 1, 300),
(28, 29, 2, 'Сет Филамикс', 950, 1, 950),
(29, 30, 1, 'Сет Запеченный', 800, 2, 1600),
(30, 31, 2, 'Сет Филамикс', 950, 1, 950),
(31, 32, 2, 'Сет Филамикс', 950, 1, 950),
(32, 33, 1, 'Сет Запеченный', 800, 1, 800),
(33, 34, 2, 'Сет Филамикс', 950, 1, 950),
(34, 35, 3, 'Ролл Филадельфия', 300, 1, 300),
(35, 36, 2, 'Сет Филамикс', 950, 1, 950),
(36, 37, 1, 'Сет Запеченный', 800, 1, 800),
(37, 38, 5, 'Суши Лосось', 100, 1, 100),
(38, 39, 1, 'Сет Запеченный', 800, 2, 1600),
(39, 39, 3, 'Ролл Филадельфия', 300, 1, 300),
(40, 40, 2, 'Сет Филамикс', 950, 1, 950),
(41, 40, 3, 'Ролл Филадельфия', 300, 1, 300);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$OzahBu2mo8152R9lQdvagOXmQ3r26TENt42QjSDJFS2mReC16oUrC', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_good`
--
ALTER TABLE `order_good`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `order_good`
--
ALTER TABLE `order_good`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
