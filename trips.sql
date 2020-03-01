-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Lut 2020, 21:00
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `trips`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `measure_interval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `trips`
--

INSERT INTO `trips` (`id`, `name`, `measure_interval`) VALUES
(1, 'Trip 1', 15),
(2, 'Trip 2', 20),
(3, 'Trip 3', 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trip_measures`
--

CREATE TABLE `trip_measures` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `distance` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `trip_measures`
--

INSERT INTO `trip_measures` (`id`, `trip_id`, `distance`) VALUES
(1, 1, '0.00'),
(2, 1, '0.19'),
(3, 1, '0.50'),
(4, 1, '0.75'),
(5, 1, '1.00'),
(6, 1, '1.25'),
(7, 1, '1.50'),
(8, 1, '1.75'),
(9, 1, '2.00'),
(10, 1, '2.25'),
(11, 2, '0.00'),
(12, 2, '0.23'),
(13, 2, '0.46'),
(14, 2, '0.69'),
(15, 2, '0.92'),
(16, 2, '1.15'),
(17, 2, '1.38'),
(18, 2, '1.61'),
(19, 3, '0.00'),
(20, 3, '0.11'),
(21, 3, '0.22'),
(22, 3, '0.33'),
(23, 3, '0.44'),
(24, 3, '0.65'),
(25, 3, '1.08'),
(26, 3, '1.26'),
(27, 3, '1.68'),
(28, 3, '1.89'),
(29, 3, '2.10'),
(30, 3, '2.31'),
(31, 3, '2.52'),
(32, 3, '3.25');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `trip_measures`
--
ALTER TABLE `trip_measures`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `trip_measures`
--
ALTER TABLE `trip_measures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
