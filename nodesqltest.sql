-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 08:53 AM
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
-- Database: `nodesqltest`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `group_id`, `amount`, `description`) VALUES
(1, 0, '$12', 'For paper'),
(2, 0, '$40', 'For electricity'),
(3, 0, '$500', 'For the car');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Our Trip to SF'),
(2, 'Our Trip to SF'),
(3, 'Our Trip to New York'),
(4, 'Our Trip to SF'),
(5, 'Our Trip to SF'),
(11, 'Our Trip to SF'),
(29, 'Our Trip to SF');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `reg_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `reg_timestamp`) VALUES
(4, 'Petraitis', 'Jonas@email.com', '$2a$10$J/Jnvo2YAEwG7Fo6r3W2i.7bh6P3AVQNsZg/DNsnWrIhe0ApunYSC', '2022-03-16 14:10:08'),
(8, 'Antanaitis', 'Antanas@email.com', '$2a$10$jW8sDsQ9vv8cD9Lf481fTuCO.j/oFQx.X1b2hG.TBu1t4cT93PGY2', '2022-03-16 22:34:33'),
(9, 'onamar', 'ona@email.com', '$2a$10$QRMgGjP7BrxPW/dk7WLPYOKuryk37PVAbMFc1xfKsSVC9cX4ihqI.', '2022-03-17 08:18:55'),
(10, 'bobas', 'bobas@gmail.com', '$2a$10$1F4VcGiBSaP/WEpfBL3LaeTXlQfFBdYsf66v1lWYP.oqWGoJjtq1a', '2022-03-17 08:32:23'),
(11, 'vacys', 'vacys@email.com', '$2a$10$0KpubNU9hpVXKGmulxBOwufMISE2CwlR513e80fhM7B51RHyhVtv6', '2022-03-17 08:39:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
