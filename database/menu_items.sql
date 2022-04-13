-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2022 at 08:58 PM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goodybase`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `category` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_img` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `category`, `label`, `icon_img`) VALUES
(2, 'food', 'Frites', 'frites.png'),
(3, 'food', 'Donut', 'donut.png'),
(4, 'food', 'Pizza', 'pizza.png'),
(5, 'art', 'Sculptures', NULL),
(6, 'art', 'Jewellery', NULL),
(7, 'art', 'Paintings', NULL),
(8, 'goods', 'Hifi', NULL),
(9, 'goods', 'Music instr', 'instruments.png'),
(10, 'goods', 'Computers', 'computer-retro.png'),
(11, 'software', 'Windows 8.4', NULL),
(12, 'software', 'Norton AV', 'norton_av.png'),
(13, 'software', 'Canon driver', NULL),
(14, 'software', 'Nero Burn', 'nero_burn.png'),
(15, 'software', 'Office Proff', '800px-Microsoft_Office_Visio_(2019).svg.png'),
(45, 'software', 'Visio', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
