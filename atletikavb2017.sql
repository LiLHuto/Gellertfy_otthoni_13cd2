-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 06. 14:43
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `atletikavb2017`
--
CREATE DATABASE IF NOT EXISTS `atletikavb2017` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `atletikavb2017`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nemzetek`
--

CREATE TABLE `nemzetek` (
  `NemzetId` int(11) NOT NULL,
  `Nemzet` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `nemzetek`
--

INSERT INTO `nemzetek` (`NemzetId`, `Nemzet`) VALUES
(1, 'Egyesült Államok'),
(2, 'Törökország'),
(3, 'Dél-afrikai Köztársaság'),
(4, 'Franciaország'),
(5, 'Kenya'),
(6, 'Etiópia'),
(7, 'Nagy-Britannia'),
(8, 'Jamaica'),
(9, 'Norvégia'),
(10, 'Kolumbia'),
(11, 'Katar'),
(12, 'Litvánia'),
(13, 'Németország'),
(14, 'Új-Zéland'),
(15, 'Lengyelország'),
(16, 'Bahama-szigetek'),
(17, 'Uganda'),
(18, 'ANA'),
(19, 'Marokkó'),
(20, 'Japán'),
(21, 'Svédország'),
(22, 'Csehország'),
(23, 'Trinidad és Tobago'),
(24, 'Magyarország'),
(25, 'Brazília'),
(26, 'Tanzánia'),
(27, 'Szíria'),
(28, 'Portugália'),
(29, 'Horvátország'),
(30, 'Venezuela'),
(31, 'Görögország'),
(32, 'Kína'),
(33, 'Hollandia'),
(34, 'Ausztrália'),
(35, 'Bahrein'),
(36, 'Belgium'),
(37, 'Ukrajna'),
(38, 'Elefántcsontpart'),
(39, 'Burundi'),
(40, 'Mexikó'),
(41, 'Kazahsztán'),
(42, 'Kuba'),
(43, 'Olaszország');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenyekszamok`
--

CREATE TABLE `versenyekszamok` (
  `Versenyszam` varchar(15) DEFAULT NULL,
  `Nem` enum('N','F') DEFAULT NULL,
  `NemzetKod` int(11) NOT NULL,
  `VersenyzoNev` varchar(25) DEFAULT NULL,
  `Eredmeny` varchar(7) DEFAULT NULL,
  `Csucs` enum('WR','CR','AR','NR','PB','WL','SB') DEFAULT NULL COMMENT 'WR – világrekord\r\nCR – világbajnoki rekord\r\nAR – kontinens rekord\r\nNR – országos rekord\r\nPB – egyéni rekord\r\nWL – az adott évben aktuálisan a világ legjobb eredménye\r\nSB – az adott évben aktuálisan az egyéni \r\nlegjobb eredmény',
  `Helyezes` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `versenyekszamok`
--

INSERT INTO `versenyekszamok` (`Versenyszam`, `Nem`, `NemzetKod`, `VersenyzoNev`, `Eredmeny`, `Csucs`, `Helyezes`) VALUES
('100 m', 'F', 1, 'Justin Gatlin', '9,92', 'SB', 1),
('200 m', 'F', 2, 'Ramil Guliyev', '20,09', 'SB', 1),
('400 m', 'F', 3, 'Wayde van Niekerk', '43,98', NULL, 1),
('800 m', 'F', 4, 'Pierre-Ambroise Bosse', '01:44,7', 'SB', 1),
('1500 m', 'F', 5, 'Elijah Manangoi', '03:33,6', NULL, 1),
('5000 m', 'F', 6, 'Muktar Edris', '13:32,8', NULL, 1),
('10 000 m', 'F', 7, 'Mo Farah', '26:49,5', NULL, 1),
('110 m gát', 'F', 8, 'Omar McLeod', '12:00,0', NULL, 1),
('400 m gát', 'F', 9, 'Karsten Warholm', '24:00,0', NULL, 1),
('3000 m akadály', 'F', 5, 'Conseslus Kipruto', '08:14,1', NULL, 1),
('20 km gyaloglás', 'F', 10, 'Éider Arévalo', '1:18:53', 'NR', 1),
('50 km gyaloglás', 'F', 4, 'Yohann Diniz', '3:33:12', 'CR', 1),
('maraton', 'F', 5, 'Geoffrey Kipkorir Kirui', '08:26,0', NULL, 1),
('magasugrás', 'F', 11, 'Mutaz Essa Barshim', '235 cm', NULL, 1),
('távolugrás', 'F', 3, 'Luvo Manyonga', '8,48 m', NULL, 1),
('hármasugrás', 'F', 1, 'Christian Taylor', '17,68 m', NULL, 1),
('rúdugrás', 'F', 1, 'Sam Kendricks', '595 cm', NULL, 1),
('diszkoszvetés', 'F', 12, 'Andrius Gudžius', '69,21', 'PB', 1),
('gerelyhajítás', 'F', 13, 'Johannes Vetter', '89,89 m', NULL, 1),
('súlylökés', 'F', 14, 'Tomas Walsh', '43:12,0', NULL, 1),
('kalapácsvetés', 'F', 15, 'Paweł Fajdek', '79,81 m', NULL, 1),
('tízpróba', 'F', 4, 'Kévin Mayer', '8768', 'WL', 1),
('100 m', 'F', 1, 'Christian Coleman', '9,94', NULL, 2),
('200 m', 'F', 3, 'Wayde van Niekerk', '20,11', NULL, 2),
('400 m', 'F', 16, 'Steven Gardiner', '44,41', NULL, 2),
('800 m', 'F', 15, 'Adam Kszczot', '01:45,0', 'SB', 2),
('1500 m', 'F', 5, 'Timothy Cheruiyot', '03:34,0', NULL, 2),
('5000 m', 'F', 7, 'Mo Farah', '13:33,2', NULL, 2),
('10 000 m', 'F', 17, 'Joshua Kiprui Cheptegei', '26:49,9', NULL, 2),
('110 m gát', 'F', 18, 'Szergej Subenkov', '13,14', NULL, 2),
('400 m gát', 'F', 2, 'Yasmani Copello', '48,49', NULL, 2),
('3000 m akadály', 'F', 19, 'Soufiane El Bakkali', '08:14,5', NULL, 2),
('20 km gyaloglás', 'F', 18, 'Sergey Shirobokov', '1:18:55', NULL, 2),
('50 km gyaloglás', 'F', 20, 'Arai Hirooki', '3:41:17', 'SB', 2),
('maraton', 'F', 6, 'Tamirat Tola', '2:09:48', NULL, 2),
('magasugrás', 'F', 18, 'Danil Lysenko', '232 cm', NULL, 2),
('távolugrás', 'F', 1, 'Jarrion Lawson', '8,44 m', NULL, 2),
('hármasugrás', 'F', 1, 'Will Claye', '17,63 m', NULL, 2),
('rúdugrás', 'F', 15, 'Piotr Lisek', '589 cm', NULL, 2),
('diszkoszvetés', 'F', 21, 'Daniel Stahl', '[value-', '', 0),
('gerelyhajítás', 'F', 22, 'Jakub Vadlejch', '89,73 m', 'PB', 2),
('súlylökés', 'F', 1, 'Joe Kovacs', '21,66', NULL, 2),
('kalapácsvetés', 'F', 18, 'Valerij Pronkin', '78,16 m', NULL, 2),
('tízpróba', 'F', 13, 'Rico Freimuth', '8564', NULL, 2),
('100 m', 'F', 8, 'Usain Bolt', '9,95', 'SB', 3),
('200 m', 'F', 23, 'Jereem Richards', '20,11', NULL, 3),
('400 m', 'F', 11, 'Abdalelah Haroun', '44,48', 'SB', 3),
('800 m', 'F', 5, 'Kipyegon Bett', '01:45,2', NULL, 3),
('1500 m', 'F', 9, 'Filip Ingebrigtsen', '03:34,5', NULL, 3),
('5000 m', 'F', 1, 'Paul Chelimo', '13:33,3', NULL, 3),
('10 000 m', 'F', 5, 'Paul Kipngetich Tanui', '26:50,6', NULL, 3),
('110 m gát', 'F', 24, 'Baji Balázs', '13,28', NULL, 3),
('400 m gát', 'F', 1, 'Kerron Clement', '48,52', NULL, 3),
('3000 m akadály', 'F', 1, 'Evan Jager', '08:15,5', NULL, 3),
('20 km gyaloglás', 'F', 25, 'Caio Bonfim', '1:19:04', 'NR', 3),
('50 km gyaloglás', 'F', 20, 'Kobajasi Kai', '3:41:19', 'PB', 3),
('maraton', 'F', 26, 'Aphonce Felix Simbu', '2:09:50', NULL, 3),
('magasugrás', 'F', 27, 'Majededdin Ghazal', '229 cm', NULL, 3),
('távolugrás', 'F', 3, 'Ruswahl Samaai', '8,32 m', NULL, 3),
('hármasugrás', 'F', 28, 'Nelson Évora', '17,19 m', NULL, 3),
('rúdugrás', 'F', 4, 'Renaud Lavillenie', '589 cm', 'SB', 3),
('diszkoszvetés', 'F', 1, 'Mason Finley', '68,03', 'PB', 3),
('gerelyhajítás', 'F', 22, 'Petr Frydrych', '88,32 m', 'PB', 3),
('súlylökés', 'F', 29, 'Stipe Žunić', '21,46', NULL, 3),
('kalapácsvetés', 'F', 15, 'Wojciech Nowicki', '78,03 m', NULL, 3),
('tízpróba', 'F', 13, 'Kai Kazmirek', '8488', 'SB', 3),
('magasugrás', 'N', 18, 'Marija Laszickene', '2,03 m', NULL, 1),
('távolugrás', 'N', 1, 'Brittney Reese', '7,02 m', NULL, 1),
('hármasugrás', 'N', 30, 'Yulimar Rojas', '14,91 m', NULL, 1),
('rúdugrás', 'N', 31, 'Katerína Sztefanídi', '4,91', NULL, 1),
('diszkoszvetés', 'N', 29, 'Sandra Perković', '70,31 m', NULL, 1),
('gerelyhajítás', 'N', 22, 'Barbora Špotáková', '66,76 m', NULL, 1),
('súlylökés', 'N', 32, 'Gong Lijiao', '19,94 m', NULL, 1),
('kalapácsvetés', 'N', 15, 'Anita Włodarczyk', '77,90 m', NULL, 1),
('100 m', 'N', 1, 'Tori Bowie', '10,85', 'SB', 1),
('200 m', 'N', 33, 'Dafne Schippers', '22,05', 'SB', 1),
('400 m', 'N', 1, 'Phyllis Francis', '49,92', 'PB', 1),
('800 m', 'N', 3, 'Caster Semenya', '01:55,2', NULL, 1),
('1500 m', 'N', 5, 'Faith Kipyegon', '04:02,6', NULL, 1),
('5000 m', 'N', 5, 'Hellen Obiri', '14:34,9', NULL, 1),
('10 000 m', 'N', 6, 'Almaz Ayana', '30:16,3', 'WL', 1),
('100 m gát', 'N', 34, 'Sally Pearson', '12,59', NULL, 1),
('400 m gát', 'N', 1, 'Kori Carter', '53,07', NULL, 1),
('3000 m akadály', 'N', 1, 'Emma Coburn', '09:02,6', 'CR', 1),
('20 km gyaloglás', 'N', 32, 'Yang Jiayu', '1:26:18', 'PB', 1),
('50 km gyaloglás', 'N', 28, 'Ines Henriques', '4:05:56', 'WR', 1),
('maraton', 'N', 35, 'Rose Chelimo', '2:27:11', NULL, 1),
('hétpróba', 'N', 36, 'Nafissatou Thiam', '6784', NULL, 1),
('magasugrás', 'N', 37, 'Julija Levcsenko', '2,01 m', 'PB', 2),
('távolugrás', 'N', 18, 'Darja Klisina', '7,00 m', 'SB', 2),
('hármasugrás', 'N', 10, 'Caterine Ibargüen', '14,89 m', 'SB', 2),
('rúdugrás', 'N', 1, 'Sandi Morris', '4,75', NULL, 2),
('diszkoszvetés', 'N', 34, 'Dani Stevens', '69,64 m', NULL, 2),
('gerelyhajítás', 'N', 32, 'Li Lingwei', '66,25 m', 'PB', 2),
('súlylökés', 'N', 24, 'Márton Anita', '19,49 m', NULL, 2),
('kalapácsvetés', 'N', 32, 'Vang Cseng', '75,98 m', NULL, 2),
('100 m', 'N', 38, 'Marie-Josée Ta Lou', '10,86', 'PB', 2),
('200 m', 'N', 38, 'Marie-Josée Ta Lou', '22,08', 'NR', 2),
('400 m', 'N', 35, 'Salwa Eid Naser', '50,06', 'NR', 2),
('800 m', 'N', 39, 'Francine Niyonsaba', '01:55,9', NULL, 2),
('1500 m', 'N', 1, 'Jennifer Simpson', '04:02,8', NULL, 2),
('5000 m', 'N', 6, 'Almaz Ayana', '14:40,4', 'SB', 2),
('10 000 m', 'N', 6, 'Tirunesh Dibaba', '31:02,7', 'SB', 2),
('100 m gát', 'N', 1, 'Dawn Harper-Nelson', '12,63', 'SB', 2),
('400 m gát', 'N', 1, 'Dalilah Muhammad', '53,5', NULL, 2),
('3000 m akadály', 'N', 1, 'Courtney Frerichs', '09:03,8', 'PB', 2),
('20 km gyaloglás', 'N', 40, 'Lupita González', '1:26:19', 'SB', 2),
('50 km gyaloglás', 'N', 32, 'Hang Yin', '4:08:58', 'AR', 2),
('maraton', 'N', 5, 'Edna Ngeringwony Kiplagat', '2:27:18', NULL, 2),
('hétpróba', 'N', 13, 'Carolin Schäfer', '6696', NULL, 2),
('magasugrás', 'N', 15, 'Kamila Lićwinko', '1,99 m', 'SB', 3),
('távolugrás', 'N', 1, 'Tianna Bartoletta', '6,97 m', NULL, 3),
('hármasugrás', 'N', 41, 'Olga Ripakova', '14,77 m', 'SB', 3),
('rúdugrás', 'N', 30, 'Robeilys Peinado', '4,65', 'NR', 3),
('rúdugrás', 'N', 42, 'Yarisley Silva', '4,65', NULL, 3),
('diszkoszvetés', 'N', 4, 'Mélina Robert-Michon', '66,21 m', 'SB', 3),
('gerelyhajítás', 'N', 32, 'Lu Huihui', '65,26 m', NULL, 3),
('súlylökés', 'N', 1, 'Michelle Carter', '19,14 m', NULL, 3),
('kalapácsvetés', 'N', 15, 'Malwina Kopron', '74,76 m', NULL, 3),
('100 m', 'N', 33, 'Dafne Schippers', '10,96', NULL, 3),
('200 m', 'N', 16, 'Shaunae Miller-Uibo', '22,15', NULL, 3),
('400 m', 'N', 1, 'Allyson Felix', '50,08', NULL, 3),
('800 m', 'N', 1, 'Ajee Wilson', '01:56,6', NULL, 3),
('1500 m', 'N', 3, 'Caster Semenya', '04:02,9', NULL, 3),
('5000 m', 'N', 33, 'Sifan Hassan', '14:42,7', NULL, 3),
('10 000 m', 'N', 5, 'Agnes Jebet Tirop', '31:03,5', 'PB', 3),
('100 m gát', 'N', 13, 'Pamela Dutkiewicz', '12,72', NULL, 3),
('400 m gát', 'N', 8, 'Ristananna Tracey', '53,74', 'PB', 3),
('3000 m akadály', 'N', 5, 'Hyvin Jepkemoi', '09:04,0', NULL, 3),
('20 km gyaloglás', 'N', 43, 'Antonella Palmisano', '1:26:36', 'PB', 3),
('50 km gyaloglás', 'N', 32, 'Shuqing Yang', '4:20:49', 'PB', 3),
('maraton', 'N', 1, 'Amy Cragg', '2:27:18', NULL, 3),
('hétpróba', 'N', 33, 'Anouk Vetter', '6636', NULL, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `nemzetek`
--
ALTER TABLE `nemzetek`
  ADD PRIMARY KEY (`NemzetId`);

--
-- A tábla indexei `versenyekszamok`
--
ALTER TABLE `versenyekszamok`
  ADD KEY `fk_nemzetek` (`NemzetKod`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `nemzetek`
--
ALTER TABLE `nemzetek`
  MODIFY `NemzetId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `versenyekszamok`
--
ALTER TABLE `versenyekszamok`
  ADD CONSTRAINT `fk_nemzetek` FOREIGN KEY (`NemzetKod`) REFERENCES `nemzetek` (`NemzetId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
