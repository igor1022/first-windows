-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.13-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/* SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/* SET NAMES utf8 */;
/* SET NAMES utf8mb4 */;
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных perfectum
CREATE DATABASE IF NOT EXISTS `perfectum` /* DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `perfectum`;

-- Дамп структуры для таблица dialogs
CREATE TABLE IF NOT EXISTS `dialogs` (
  `id_dialog` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_from` tinyint(4) DEFAULT NULL,
  `user_to` tinyint(4) DEFAULT NULL,
  `id_message` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_dialog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы dialogs: ~0 rows (приблизительно)
/* ALTER TABLE `dialogs` DISABLE KEYS */;
/* ALTER TABLE `dialogs` ENABLE KEYS */;

-- Дамп структуры для таблица messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id_message` smallint(6) NOT NULL AUTO_INCREMENT,
  `message` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы messages: ~0 rows (приблизительно)
/* ALTER TABLE `messages` DISABLE KEYS */;
/* ALTER TABLE `messages` ENABLE KEYS */;

-- Дамп структуры для таблица users
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы users: ~4 rows (приблизительно)
/*ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `name`) VALUES
	(1, 'Man 1'),
	(2, 'Man 2'),
	(3, 'Man 3'),
	(4, 'Woman 1');
/* ALTER TABLE `users` ENABLE KEYS */;

/* SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/* SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/* SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
