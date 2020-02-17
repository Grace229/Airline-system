-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2020 at 04:14 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_reservation_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Seat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `Cabin` enum('Business','Economy') DEFAULT NULL,
  `Departure_date` date NOT NULL,
  `takeoff_time` time NOT NULL,
  `landing_time` time NOT NULL,
  `Amount` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Seat_id`, `id`, `Cabin`, `Departure_date`, `takeoff_time`, `landing_time`, `Amount`) VALUES
(1, 1, 'Business', '2020-02-20', '08:00:00', '09:00:00', '68000.00'),
(2, 2, 'Economy', '2020-02-29', '04:00:00', '05:30:00', '30000.00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_information`
--

CREATE TABLE `contact_information` (
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `First_name` varchar(32) NOT NULL,
  `Last_name` varchar(32) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `Current_location` varchar(35) NOT NULL,
  `Destination` varchar(35) NOT NULL,
  `Flight_type` enum('Round-trip','One-way') NOT NULL,
  `Departure_date` date NOT NULL,
  `Person` enum('Adult','Child','Infant') NOT NULL,
  `no_of_passenger` enum('1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`user_id`, `id`, `Current_location`, `Destination`, `Flight_type`, `Departure_date`, `Person`, `no_of_passenger`) VALUES
(1, 1, 'lagos', 'Abuja', 'One-way', '2020-02-20', 'Adult', '1'),
(2, 2, 'Benin', 'Akwa-ibom', 'Round-trip', '2020-02-25', 'Adult', '1');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `First_name` varchar(32) NOT NULL,
  `Last_name` varchar(32) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `Address` varchar(120) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `id`, `First_name`, `Last_name`, `dob`, `nationality`, `email`, `phone_number`, `Address`, `password`) VALUES
(2, 1, 'Musa', 'Ibrahim', '2020-02-17', 'Nigeria', 'musaibrahim@gmail.com ', '0814563809', 'penthouse estate', 'ghj00000'),
(3, 2, 'Xavier', 'Francis', '2020-02-27', 'Nigeria', 'xavierfrancis@gmail.com', '0903746899', 'suleja Abuja', 'fff0900000');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL,
  `Title` enum('ALH','HAJJ','MR','MRS','MISTER','MISS') NOT NULL,
  `First_name` varchar(32) NOT NULL,
  `Last_name` varchar(32) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Dob` date NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `Phone_number` varchar(15) NOT NULL,
  `Member_id` varchar(20) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id`, `Title`, `First_name`, `Last_name`, `Gender`, `Dob`, `Email`, `Country`, `Phone_number`, `Member_id`, `Password`) VALUES
(1, 'ALH', 'Musa', 'Ibrahim', 'Male', '2020-02-03', 'ibrahimmusa@gmail.com', 'Nigeria', '08144895649', '322222222', 'dfdg33444'),
(2, 'MISTER', 'Xavier', 'Francis', 'Female', '2020-02-25', 'francisxavier@gmail.com', 'Nigeria', '0905678499', '455556575', 'fgh334455'),
(3, 'MISS', 'Grace', 'Itiung', 'Female', '2020-02-19', 'itiunggrace@gmail.com', 'American', '08144275082', '465646757', 'ghj3532678'),
(4, 'MR', 'David', 'Itiung', 'Male', '2020-02-29', 'daviditiung@gmail.com', 'Nigeria', '08028412972', '60999122', 'fgk458990');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cuv` int(3) NOT NULL,
  `expiry_date` date NOT NULL,
  `amount` decimal(28,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`user_id`, `id`, `currency`, `card_no`, `cuv`, `expiry_date`, `amount`, `date`) VALUES
(1, 1, 'naira', '759045763245', 456, '2022-02-27', '68000.00', '2020-02-17 16:12:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Seat_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `contact_information`
--
ALTER TABLE `contact_information`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_information`
--
ALTER TABLE `contact_information`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`id`);

--
-- Constraints for table `contact_information`
--
ALTER TABLE `contact_information`
  ADD CONSTRAINT `contact_information_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
