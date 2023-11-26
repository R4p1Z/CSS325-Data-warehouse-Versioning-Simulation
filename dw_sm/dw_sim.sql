-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2023 at 10:17 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_sim`
--

-- --------------------------------------------------------

--
-- Table structure for table `branchdim`
--

CREATE TABLE `branchdim` (
  `Did` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branchdim`
--

INSERT INTO `branchdim` (`Did`, `Branch_ID`, `Name`, `Address`, `Country`) VALUES
(1, 101, 'Branch A', '123 Main St', 'Country A'),
(1, 102, 'Branch B', '456 Oak St', 'Country B');

-- --------------------------------------------------------

--
-- Table structure for table `change_tab`
--

CREATE TABLE `change_tab` (
  `id` int(11) NOT NULL,
  `Did` int(11) NOT NULL,
  `DLid` int(11) NOT NULL,
  `D_name` varchar(255) NOT NULL,
  `DL_name` varchar(255) NOT NULL,
  `inst` varchar(255) NOT NULL,
  `atb_type` varchar(255) NOT NULL,
  `time_stamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datedim`
--

CREATE TABLE `datedim` (
  `Did` int(11) NOT NULL,
  `Date_ID` int(11) NOT NULL,
  `Year` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Quarter` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datedim`
--

INSERT INTO `datedim` (`Did`, `Date_ID`, `Year`, `Month`, `Quarter`, `Date`) VALUES
(2, 201, 2023, 11, 'Q4', '2023-11-25'),
(2, 202, 2023, 12, 'Q4', '2023-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `Did` int(11) NOT NULL,
  `Dealer_ID` int(11) NOT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Country_ID` int(11) DEFAULT NULL,
  `Dealer_NM` varchar(255) DEFAULT NULL,
  `Dealer_CNTCT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`Did`, `Dealer_ID`, `Location_ID`, `Country_ID`, `Dealer_NM`, `Dealer_CNTCT`) VALUES
(3, 301, 401, 501, 'Dealer X', 'Contact X'),
(3, 302, 402, 502, 'Dealer Y', 'Contact Y');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Did` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Product_Name` varchar(255) DEFAULT NULL,
  `Model_ID` int(11) DEFAULT NULL,
  `Variant_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Did`, `Product_ID`, `Product_Name`, `Model_ID`, `Variant_ID`) VALUES
(4, 401, 'Product A', 501, 601),
(4, 402, 'Product B', 502, 602);

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `Revenue_ID` int(11) NOT NULL,
  `Dealer_ID` int(11) DEFAULT NULL,
  `Model_ID` int(11) DEFAULT NULL,
  `Branch_ID` int(11) DEFAULT NULL,
  `Date_ID` int(11) DEFAULT NULL,
  `Units_Sold` int(11) DEFAULT NULL,
  `Revenue` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`Revenue_ID`, `Dealer_ID`, `Model_ID`, `Branch_ID`, `Date_ID`, `Units_Sold`, `Revenue`) VALUES
(501, 301, 501, 101, 201, 50, '5000.00'),
(502, 302, 502, 102, 202, 40, '4000.00');

-- --------------------------------------------------------

--
-- Table structure for table `ver_tab`
--

CREATE TABLE `ver_tab` (
  `id` int(11) NOT NULL,
  `verNum` int(11) NOT NULL,
  `time_stamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ver_tab`
--

INSERT INTO `ver_tab` (`id`, `verNum`, `time_stamp`) VALUES
(1, 1, '2023-11-26 01:22:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branchdim`
--
ALTER TABLE `branchdim`
  ADD PRIMARY KEY (`Branch_ID`);

--
-- Indexes for table `change_tab`
--
ALTER TABLE `change_tab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_stamp` (`time_stamp`);

--
-- Indexes for table `datedim`
--
ALTER TABLE `datedim`
  ADD PRIMARY KEY (`Date_ID`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`Dealer_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Model_ID` (`Model_ID`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`Revenue_ID`),
  ADD KEY `Dealer_ID` (`Dealer_ID`),
  ADD KEY `Date_ID` (`Date_ID`),
  ADD KEY `Branch_ID` (`Branch_ID`),
  ADD KEY `Model_ID` (`Model_ID`);

--
-- Indexes for table `ver_tab`
--
ALTER TABLE `ver_tab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_stamp` (`time_stamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `change_tab`
--
ALTER TABLE `change_tab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ver_tab`
--
ALTER TABLE `ver_tab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `change_tab`
--
ALTER TABLE `change_tab`
  ADD CONSTRAINT `change_tab_ibfk_1` FOREIGN KEY (`time_stamp`) REFERENCES `ver_tab` (`time_stamp`);

--
-- Constraints for table `revenue`
--
ALTER TABLE `revenue`
  ADD CONSTRAINT `revenue_ibfk_1` FOREIGN KEY (`Dealer_ID`) REFERENCES `dealer` (`Dealer_ID`),
  ADD CONSTRAINT `revenue_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `branchdim` (`Branch_ID`),
  ADD CONSTRAINT `revenue_ibfk_3` FOREIGN KEY (`Date_ID`) REFERENCES `datedim` (`Date_ID`),
  ADD CONSTRAINT `revenue_ibfk_4` FOREIGN KEY (`Model_ID`) REFERENCES `product` (`Model_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
