-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2022 at 09:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fr_dropdown`
--

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(11) NOT NULL,
  `b_current` tinyint(1) DEFAULT NULL,
  `label_txt` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'language',
  `s_action` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'a0 = add\r\ne0 = edit\r\nl0 = list\r\nt0 = tabs\r\n',
  `s_category` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'generated: s_category + s_action + branche + productgroup',
  `body_layout` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'body_design.layout_name (lookup)',
  `action` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_img` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `i_cont_01` tinyint(4) DEFAULT NULL COMMENT 'copy data from body_design.cont_01',
  `i_cont_02` tinyint(11) DEFAULT NULL,
  `i_cont_03` tinyint(11) DEFAULT NULL,
  `i_cont_04` tinyint(4) DEFAULT NULL,
  `i_cont_05` tinyint(4) DEFAULT NULL COMMENT ' 	copy data from body_design.cont_05',
  `s_cont_01` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'copy data from: body_content.cont_01 ',
  `s_cont_02` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_cont_03` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_cont_04` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_cont_05` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b_deactive` tinyint(1) DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `b_hide` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_menu`
--

INSERT INTO `main_menu` (`id`, `b_current`, `label_txt`, `s_action`, `s_category`, `layout_code`, `body_layout`, `action`, `icon_action`, `icon_img`, `i_cont_01`, `i_cont_02`, `i_cont_03`, `i_cont_04`, `i_cont_05`, `s_cont_01`, `s_cont_02`, `s_cont_03`, `s_cont_04`, `s_cont_05`, `b_deactive`, `sort`, `b_hide`) VALUES
(1, NULL, 'HARDWARE', '', '1h', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(2, 1, 'FOOD', '', '1f', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, NULL, 'CARE', '', '1c', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(11, NULL, 'ADD hardware', 'a0', '1h', 'a0_1h_1h0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(12, NULL, 'EDIT hardware', 'e0', '1h', 'e0_1h_1h0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(13, NULL, 'TABS hardware', 't0', '1h', 't0_1h_1h0', 'tabs', '', '', NULL, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(14, NULL, 'LIST hardware', 'l0', '1h', 'l0_1h_1h0', 'tableview', '', '', NULL, 2, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(21, NULL, 'ADD food', 'a0', '1f', 'a0_1f_1f0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(22, 1, 'EDIT food', 'e0', '1f', 'e0_1f_1f0', '3boxes', '', '', NULL, 4, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(23, 1, 'TABS food', 't0', '1f', 't0_1f_1f0', 'filter1', '', '', NULL, 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(24, 1, 'LIST food', 'l0', '1f', 'l0_1f_1f0', 'tableview', '', '', NULL, 2, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(31, NULL, 'ADD care', 'a0', '1c', 'a0_1c_1c0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(32, NULL, 'EDIT care', 'e0', '1c', 'e0_1c_1c0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(33, NULL, 'TABS soap', 't0', '1c', 't0_1c_1c0', 'tabs', '', '', NULL, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(34, NULL, 'LIST soap', 'l0', '1c', 'l0_1c_1c0', 'tableview', '', '', NULL, 2, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1001, 1, 'ADD drinks', 'a0', '1f', 'a0_1f_d_0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1002, NULL, 'ADD limonate', 'a0', '1f', 'a0_1f_dl0', '3boxes', '', '', NULL, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `main_menu`
--
ALTER TABLE `main_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
