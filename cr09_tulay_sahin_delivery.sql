-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 08. Nov 2020 um 23:08
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_tulay_sahin_delivery`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Post_Office`
--

CREATE TABLE `Post_Office` (
  `postoffice_id` int(50) NOT NULL,
  `package_acceptance_date` date NOT NULL,
  `sender_id` int(50) NOT NULL,
  `sender_name` varchar(250) NOT NULL,
  `sender_address` varchar(400) NOT NULL,
  `recipient_id` varchar(250) NOT NULL,
  `recipient_name` varchar(250) NOT NULL,
  `receiver_address` varchar(400) NOT NULL,
  `amount_of_packages` varchar(400) NOT NULL,
  `package_type` varchar(250) NOT NULL,
  `supplier_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` varchar(50) NOT NULL,
  `recipient_name` varchar(250) NOT NULL,
  `receiver_address` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Sender`
--

CREATE TABLE `Sender` (
  `sender_id` int(20) NOT NULL,
  `sender_name` varchar(250) NOT NULL,
  `sender_adress` varchar(400) NOT NULL,
  `amount_of_packages` varchar(50) NOT NULL,
  `recipient_name` varchar(250) NOT NULL,
  `receiver_address` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Sender`
--

INSERT INTO `Sender` (`sender_id`, `sender_name`, `sender_adress`, `amount_of_packages`, `recipient_name`, `receiver_address`) VALUES
(1, 'Tülay Sahin', 'Gudrunstr 98/3/27', '2', 'Meryem Hanne', 'Vienadresse 34'),
(2, 'Muhammed Sahin', 'Gudrunst 88', '1', 'Lina Take', 'Wollegasse 45'),
(3, 'Lina Tina', 'Grugasse 34', '1', 'Geni Teni', 'Sangasse 45'),
(4, 'Lukas Heidl', 'Lukagasse 45', '3', 'Tina Hallo', 'Hallogasse 34'),
(7, 'Tina Turak', 'Turakgasse 355', '1', 'Lena Turak', 'Jooingasse 34'),
(8, 'Lisa Bobo', 'Bobogasse 34', '3', 'Kuka Luka', 'Kukagasse 3903'),
(9, 'Jenifer Lopez', 'Lopezgasse 353', '1', 'Henry Has', 'Hasgassem 334'),
(10, 'John Due', 'Duegasse 405', '5', 'Karl Hok', 'Hokygasse 49');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Supplier`
--

CREATE TABLE `Supplier` (
  `supplier_id` int(250) NOT NULL,
  `package_acceptance_date` date NOT NULL,
  `package_delivery_date` date NOT NULL,
  `recipient_id` varchar(250) NOT NULL,
  `recipient_name` varchar(250) NOT NULL,
  `receiver_address` varchar(400) NOT NULL,
  `amount_of_packages` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Post_Office`
--
ALTER TABLE `Post_Office`
  ADD PRIMARY KEY (`postoffice_id`),
  ADD UNIQUE KEY `package_acceptance_date_2` (`package_acceptance_date`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `sender_name` (`sender_name`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_address` (`sender_address`),
  ADD KEY `recipient_name` (`recipient_name`),
  ADD KEY `receiver_address` (`receiver_address`),
  ADD KEY `amount_of_packages` (`amount_of_packages`),
  ADD KEY `sender_name_2` (`sender_name`);

--
-- Indizes für die Tabelle `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `recipient_name` (`recipient_name`),
  ADD KEY `receiver_address` (`receiver_address`);

--
-- Indizes für die Tabelle `Sender`
--
ALTER TABLE `Sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `sender_name` (`sender_name`),
  ADD KEY `sender_adress` (`sender_adress`),
  ADD KEY `amount_of_packages` (`amount_of_packages`),
  ADD KEY `recipient_name` (`recipient_name`),
  ADD KEY `receiver_address` (`receiver_address`);

--
-- Indizes für die Tabelle `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `recipient_name` (`recipient_name`),
  ADD KEY `receiver_address` (`receiver_address`),
  ADD KEY `amount_of_packages` (`amount_of_packages`),
  ADD KEY `package_acceptance_date` (`package_acceptance_date`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Post_Office`
--
ALTER TABLE `Post_Office`
  MODIFY `postoffice_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Sender`
--
ALTER TABLE `Sender`
  MODIFY `sender_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `supplier_id` int(250) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Post_Office`
--
ALTER TABLE `Post_Office`
  ADD CONSTRAINT `Post_Office_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `Sender` (`sender_id`),
  ADD CONSTRAINT `Post_Office_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`supplier_id`),
  ADD CONSTRAINT `Post_Office_ibfk_3` FOREIGN KEY (`sender_address`) REFERENCES `Sender` (`sender_adress`),
  ADD CONSTRAINT `Post_Office_ibfk_4` FOREIGN KEY (`recipient_name`) REFERENCES `Sender` (`recipient_name`),
  ADD CONSTRAINT `Post_Office_ibfk_5` FOREIGN KEY (`receiver_address`) REFERENCES `Sender` (`receiver_address`),
  ADD CONSTRAINT `Post_Office_ibfk_6` FOREIGN KEY (`amount_of_packages`) REFERENCES `Sender` (`amount_of_packages`),
  ADD CONSTRAINT `Post_Office_ibfk_7` FOREIGN KEY (`sender_name`) REFERENCES `Sender` (`sender_name`);

--
-- Constraints der Tabelle `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `Post_Office` (`recipient_id`),
  ADD CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`recipient_name`) REFERENCES `Post_Office` (`recipient_name`),
  ADD CONSTRAINT `receiver_ibfk_3` FOREIGN KEY (`receiver_address`) REFERENCES `Post_Office` (`receiver_address`);

--
-- Constraints der Tabelle `Supplier`
--
ALTER TABLE `Supplier`
  ADD CONSTRAINT `Supplier_ibfk_1` FOREIGN KEY (`package_acceptance_date`) REFERENCES `Post_Office` (`package_acceptance_date`),
  ADD CONSTRAINT `Supplier_ibfk_2` FOREIGN KEY (`recipient_name`) REFERENCES `Post_Office` (`recipient_name`),
  ADD CONSTRAINT `Supplier_ibfk_3` FOREIGN KEY (`amount_of_packages`) REFERENCES `Post_Office` (`amount_of_packages`),
  ADD CONSTRAINT `Supplier_ibfk_4` FOREIGN KEY (`receiver_address`) REFERENCES `Post_Office` (`receiver_address`),
  ADD CONSTRAINT `Supplier_ibfk_5` FOREIGN KEY (`recipient_id`) REFERENCES `Post_Office` (`recipient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
