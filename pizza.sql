-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Okt 27. 07:40
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizza`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `pizza` enum('Margarita','Sajtos','Sonkas') NOT NULL,
  `meret` enum('Nagy','Kicsi') NOT NULL,
  `extraSajt` tinyint(1) NOT NULL,
  `ido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`id`, `nev`, `email`, `telefon`, `pizza`, `meret`, `extraSajt`, `ido`) VALUES
(1, 'Palasti Zoltan', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Nagy', 0, '2023-10-26 10:47:11'),
(18, 'Sajt Kiraly 1', 'sajtokiraly1@gmail.com', '+36701576423', 'Margarita', 'Kicsi', 1, '2023-10-26 13:14:23'),
(19, 'Sajt Kiraly 1', 'sajtokiraly1@gmail.com', '+36701576423', 'Sajtos', 'Nagy', 0, '2023-10-26 13:15:32'),
(20, 'Pizza Forte', 'pizzaforte@gmail.com', '+36701576423', 'Margarita', 'Nagy', 1, '2023-10-26 13:15:58'),
(21, 'Pizza Forte', 'pizzaforte2@gmail.com', '+36701576423', 'Sajtos', 'Nagy', 0, '2023-10-26 13:16:20'),
(22, 'Pizza Forte', 'pizzaforte3@gmail.com', '+36701576423', 'Sonkas', 'Kicsi', 0, '2023-10-26 13:16:29'),
(23, 'Merged code', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 13:49:53'),
(24, 'Merged code', 'p.z.palasti@gmail.com0', '+6702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 13:50:34'),
(25, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Nagy', 1, '2023-10-26 14:49:46'),
(26, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 14:54:06'),
(27, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 14:59:51'),
(28, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 15:04:09'),
(29, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 15:40:40'),
(30, 'The Last', 'last@gmail.com', '+36789456', 'Sonkas', 'Nagy', 0, '2023-10-26 15:58:14'),
(31, 'The Last', 'last@gmail.com', '+367894561', 'Sajtos', 'Nagy', 1, '2023-10-26 15:58:57'),
(32, 'The Last', 'last@gmail.com', '367894561', 'Sajtos', 'Nagy', 1, '2023-10-26 15:59:40'),
(33, 'asdas asdasd', 'p.z.palasti@gmail.com', '06702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 16:03:39'),
(34, 'asdas asdasd', 'p.z.palasti@gmail.com', '+06702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 16:05:11'),
(35, 'Ut olso remelem', 'p.z.palasti@gmail.com', '06702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 16:08:31'),
(36, 'Ut olso remelem', 'p.z.palasti@gmail.com', '6702754418', 'Margarita', 'Kicsi', 1, '2023-10-26 16:14:42'),
(37, 'asdas asdasd', 'p.z.palasti@gmail.com', '+6702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 16:15:54'),
(38, 'Ugyan azazemail', 'p.z.palasti@gmail.com', '+06702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 16:19:58'),
(39, 'Ugyan azazemail', 'p.z.palasti@gmail.con', '+06702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 16:20:06'),
(40, 'Mas Email', 'p.z.palasti@gmail.con', '+06702754418', 'Margarita', 'Kicsi', 0, '2023-10-26 16:27:36'),
(41, 'Tom Brady', 'patriots@gmail.com', '+47742300496', 'Margarita', 'Kicsi', 1, '2023-10-27 05:38:44'),
(42, 'Tom Brady', 'patriots@gmail.con', '+47742300496', 'Margarita', 'Kicsi', 1, '2023-10-27 05:39:01');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
