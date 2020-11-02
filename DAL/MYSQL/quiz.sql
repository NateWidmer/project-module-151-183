-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Nov 2020 um 21:47
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quiz`
--
CREATE DATABASE IF NOT EXISTS `quiz` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `quiz`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `highscore`
--

CREATE TABLE `highscore` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `username_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `highscore`
--

INSERT INTO `highscore` (`id`, `score`, `username_id`) VALUES
(1, 300, 47),
(2, 100, 48),
(4, 200, 46),
(5, 200, 47),
(6, 100, 46),
(7, 400, 46),
(8, 300, 48),
(9, 100, 46);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `highscore_quiz`
--

CREATE TABLE `highscore_quiz` (
  `id` int(11) NOT NULL,
  `highscore_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `highscore_quiz`
--

INSERT INTO `highscore_quiz` (`id`, `highscore_id`, `quiz_id`) VALUES
(4, 5, 6),
(5, 6, 6),
(6, 7, 7),
(7, 8, 7),
(8, 9, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(100) COLLATE utf8_bin NOT NULL,
  `answer` varchar(50) COLLATE utf8_bin NOT NULL,
  `quiz_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`, `quiz_id`) VALUES
(7, 'Katze', 'Cat', 6),
(8, 'Hund', 'Dog', 6),
(9, 'Name the three types of rocks', 'Igneous, Sedimentary, Metamorphic', 7),
(10, 'What are rocks made out of?', 'Minerals', 7),
(11, 'Where do igneous rocks come from?', 'Molten Magma', 7),
(12, 'What is the study of rocks called?', 'Geology', 7),
(13, 'This is a test question', 'This is a test answer', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `quiz`
--

INSERT INTO `quiz` (`id`, `title`, `user_id`) VALUES
(6, 'Do YOU know these GERMAN words?', 47),
(7, 'How well do you know rocks?', 46),
(8, 'Test Quiz', 46);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(46, 'admin', '$2y$10$TebKpT1vZe28de.8nPd1Zu/2A7bbiJZxxeipNBugI5yb0/8sRLNA6', '2020-10-27 09:16:22'),
(47, 'nwidmer', '$2y$10$MYoJcikgv/0mDL5Y5HCwv.PGEOhkI0dCgsGhxtIgwREN92pwWatje', '2020-10-27 09:25:38'),
(48, 'lbosshard', '$2y$10$2.x.O30X6TxyKy/hf4.eAOfGDTF1OxYnUUEDJCV.vsgnRSYfKRXBK', '2020-10-27 09:30:25'),
(49, 'Testuser', '$2y$10$LJZrAzQmRHfGkNVejEcUVeiibkTvMbrQtv1XElgo911VUq0f7GtMm', '2020-11-02 22:07:39'),
(50, 'Testuser2', '$2y$10$eYng.XnpNoGgL0HE9rFfp.O/xM5sHcePNyTTGv2wrUQ6/6pKcBoay', '2020-11-02 22:10:04'),
(51, 'Testuser3', '$2y$10$hvoI5J0x3rbYGe.R8bM1q.APDA1Jov7Za2YvUvXp7whlJ7/C.gYPu', '2020-11-02 22:10:21'),
(53, 'Gaffel', '$2y$10$tnzHeOaF.o0aHZOR56UvBer3PKH/OarhN5P3engftfS3xC/O2MdAq', '2020-11-02 22:13:00'),
(54, 'Hades', '$2y$10$xqyGx/U/Lccrwoh5hVH4QOOuwNcW5Pm9DpeP1Ou7PKt.F8tOOc2Ny', '2020-11-02 22:14:28'),
(55, 'Hansel', '$2y$10$IN8ZQajKgmp2pzze5Y7iAuarvQoVNBNAxN9JhtkrqyEaCZNYj3l4C', '2020-11-02 22:16:13'),
(56, 'FinalTest', '$2y$10$ktRrz5NquQpwsfMwAxAx.Orcj6gi7YxB9jkESz48X1DZ8W8OvRBvG', '2020-11-02 22:44:03');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `highscore`
--
ALTER TABLE `highscore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username_id` (`username_id`);

--
-- Indizes für die Tabelle `highscore_quiz`
--
ALTER TABLE `highscore_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `highscore_id` (`highscore_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indizes für die Tabelle `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indizes für die Tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `highscore`
--
ALTER TABLE `highscore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `highscore_quiz`
--
ALTER TABLE `highscore_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `highscore`
--
ALTER TABLE `highscore`
  ADD CONSTRAINT `highscore_ibfk_1` FOREIGN KEY (`username_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `highscore_quiz`
--
ALTER TABLE `highscore_quiz`
  ADD CONSTRAINT `highscore_quiz_ibfk_1` FOREIGN KEY (`highscore_id`) REFERENCES `highscore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `highscore_quiz_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
