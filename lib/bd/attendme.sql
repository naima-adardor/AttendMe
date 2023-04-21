-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2023 at 02:11 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendme`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_elevator`
--

CREATE TABLE `assignment_elevator` (
  `id_assignment_elevator` int(11) NOT NULL,
  `id_elevator` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_day` time NOT NULL,
  `end_day` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `elevator`
--

CREATE TABLE `elevator` (
  `id_elevator` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_location` int(11) NOT NULL,
  `qr_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `cin` varchar(255) NOT NULL,
  `birthday_date` date NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `ville` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `presence`
--

CREATE TABLE `presence` (
  `id_presence` int(11) NOT NULL,
  `id_elevator` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `check_in` time NOT NULL,
  `check_out` time NOT NULL,
  `attendance_day` date NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `selfie` varchar(255) NOT NULL,
  `status` enum('OnTime','Late') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `presence_regulation`
--

CREATE TABLE `presence_regulation` (
  `id_presence_regulation` int(11) NOT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `check_out` timestamp NULL DEFAULT NULL,
  `attendance_day` timestamp NOT NULL DEFAULT current_timestamp(),
  `issue_type` enum('Forget To Punch','Technical Problem') NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sanitary_regulation`
--

CREATE TABLE `sanitary_regulation` (
  `id_sanitary` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `regulation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `report` text NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `assignment_elevator`
--
ALTER TABLE `assignment_elevator`
  ADD PRIMARY KEY (`id_assignment_elevator`);

--
-- Indexes for table `elevator`
--
ALTER TABLE `elevator`
  ADD PRIMARY KEY (`id_elevator`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Indexes for table `presence`
--
ALTER TABLE `presence`
  ADD PRIMARY KEY (`id_presence`);

--
-- Indexes for table `sanitary_regulation`
--
ALTER TABLE `sanitary_regulation`
  ADD PRIMARY KEY (`id_sanitary`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_elevator`
--
ALTER TABLE `assignment_elevator`
  MODIFY `id_assignment_elevator` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elevator`
--
ALTER TABLE `elevator`
  MODIFY `id_elevator` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presence`
--
ALTER TABLE `presence`
  MODIFY `id_presence` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sanitary_regulation`
--
ALTER TABLE `sanitary_regulation`
  MODIFY `id_sanitary` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
