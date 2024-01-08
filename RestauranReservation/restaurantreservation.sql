-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 05:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantreservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` char(5) NOT NULL,
  `EmployeeName` varchar(20) NOT NULL,
  `EmployeeLocation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MenuID` char(5) NOT NULL,
  `MenuName` varchar(20) NOT NULL,
  `MenuPrice` int(11) NOT NULL,
  `MenuNarrative` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` char(5) NOT NULL,
  `ReservationID` char(5) NOT NULL,
  `MenuID` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` char(5) NOT NULL,
  `EmployeeID` char(5) NOT NULL,
  `CustomerName` varchar(20) NOT NULL,
  `RestaurantID` char(5) NOT NULL,
  `TableTypeID` char(5) NOT NULL,
  `NumTables` int(11) DEFAULT NULL,
  `NumPeople` int(11) DEFAULT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `RestaurantID` char(5) NOT NULL,
  `RestaurantLocation` varchar(20) NOT NULL,
  `SpecialMenu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speciallocation`
--

CREATE TABLE `speciallocation` (
  `SpecialLocationID` char(5) NOT NULL,
  `SpecialLocationLocation` varchar(20) NOT NULL,
  `SpecialLocationNarratives` varchar(200) NOT NULL,
  `MenuID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabletype`
--

CREATE TABLE `tabletype` (
  `TableTypeID` char(5) NOT NULL,
  `TypeName` varchar(20) NOT NULL,
  `MaxCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ReservationID` (`ReservationID`),
  ADD KEY `MenuID` (`MenuID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `TableTypeID` (`TableTypeID`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`RestaurantID`);

--
-- Indexes for table `speciallocation`
--
ALTER TABLE `speciallocation`
  ADD PRIMARY KEY (`SpecialLocationID`),
  ADD KEY `MenuID` (`MenuID`);

--
-- Indexes for table `tabletype`
--
ALTER TABLE `tabletype`
  ADD PRIMARY KEY (`TableTypeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`TableTypeID`) REFERENCES `tabletype` (`TableTypeID`);

--
-- Constraints for table `speciallocation`
--
ALTER TABLE `speciallocation`
  ADD CONSTRAINT `speciallocation_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
