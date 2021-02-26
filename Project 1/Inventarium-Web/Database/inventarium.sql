-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 26, 2021 at 08:35 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventarium`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `cmp_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'company unique system id ',
  `cmp_name` varchar(30) NOT NULL COMMENT 'company name',
  `cmp_address` varchar(50) NOT NULL COMMENT 'company exact address',
  `cmp_subsidiary` varchar(20) NOT NULL COMMENT 'company owner',
  `cmp_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cmp_id`),
  UNIQUE KEY `unique_cmp_name` (`cmp_name`),
  UNIQUE KEY `unnique_cmp_address` (`cmp_address`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cmp_id`, `cmp_name`, `cmp_address`, `cmp_subsidiary`, `cmp_status`) VALUES
(1, 'Pyramid ', '7535 N Kendall Dr, Miami, FL 33156', 'Goe Michel Nicolas', 1),
(2, 'Chevron Corporation', '192 Hauck Port, West Trehaven, WA 98920', 'Michael Wirth', 1),
(3, 'Oil-Dri Corporation', '410 N Michigan Ave, Chicago, IL 60611', 'Daniel S. Jaffee', 1),
(4, 'True Oil', '152 Dadeland, Miami, FL 33657', 'Aviram Cohen', 0),
(5, 'Evergreen', '6511 Santona, Miami, FL 33180', 'Tony Battour', 0),
(6, 'ExxonMobil', '2900 Coral Way, Miami, FL 33145', 'Darren Woods', 0),
(7, 'Texaco', '6750th, South Dixie Hwy, Miami,F 33489', 'Ted Bund', 1),
(12, 'Kosher Inc', '5826 Bird Rd, Miami, FL 33155', 'Aviram Kneset', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `emp_ssn` int(11) NOT NULL,
  `emp_cmp_id` int(11) NOT NULL,
  `emp_name` varchar(10) NOT NULL,
  `emp_lname` varchar(15) NOT NULL,
  `emp_ph_nb` int(11) NOT NULL,
  `emp_address` varchar(50) NOT NULL,
  `emp_join_date` date NOT NULL,
  `emp_wrkst_id` tinyint(4) NOT NULL,
  `emp_rank_id` tinyint(4) NOT NULL,
  `emp_fouls` tinyint(4) NOT NULL,
  `emp_rfid` varchar(11) NOT NULL,
  `emp_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `unique_emp_ssd` (`emp_ssn`),
  UNIQUE KEY `unique_emp_ph_nb` (`emp_ph_nb`),
  UNIQUE KEY `unique_card_id` (`emp_rfid`),
  KEY `emp_rank_id` (`emp_rank_id`),
  KEY `FK_company_id` (`emp_cmp_id`),
  KEY `fk_wrkst` (`emp_wrkst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_ssn`, `emp_cmp_id`, `emp_name`, `emp_lname`, `emp_ph_nb`, `emp_address`, `emp_join_date`, `emp_wrkst_id`, `emp_rank_id`, `emp_fouls`, `emp_rfid`, `emp_status`) VALUES
(0, 321057992, 1, 'Moukhles', 'Nicolas', 786603872, '463 NE Simms Dr Lake City, Florida(FL), 32055', '2020-12-09', 3, 0, 0, '45', 1),
(1, 196220748, 1, 'Tony', 'Wehbe', 2025550150, '76194 Nathen Manors Suite 229 Ornside, NH 29990', '2020-12-21', 3, 1, 0, 'da fb 8f 08', 0),
(4, 5896445, 1, 'Jose', 'Felix', 652336987, ' 8350 S Dixie Hwy, Miami, FL 33143', '2020-12-26', 4, 1, 0, '4cda12d3', 1),
(5, 123456789, 1, 'Youssef', 'Nicolas', 78945625, '1148 S Dixie Hwy, Coral Gables, FL 33146', '2020-12-28', 3, 4, 0, '16a8b312', 1),
(6, 4569877, 1, 'Mohito', 'Nicolas', 15978, '6580 santona st. apt 25, 33146', '2020-12-28', 6, 1, 0, '49 00 ', 1),
(7, 338564, 3, 'Jean', 'Nicolas', 12345844, '6580 santona st., miami, florida 33416', '2021-01-26', 6, 2, 0, 'd381c71a', 1),
(8, 1234321, 1, 'Rafael', 'Guzman', 43242423, 'George Shalhoub bouliding, zgharta, lebanon 1304', '2021-02-07', 4, 4, 0, '45689', 1),
(13, 27651328, 1, 'Cesar', 'Videau', 5588744, '3275 NW 24th Street Rd', '2021-02-16', 3, 5, 0, '456987', 1),
(12, 561859254, 5, 'Oswaldo ', 'Boulton ', 58214782, 'hialeah, miami, florida', '2021-02-15', 4, 7, 0, '4589', 1),
(15, 1458693, 3, 'Georges', 'Abboudeh', 71202381, 'Anfeh, batroun, lebanon 1304', '2021-02-18', 6, 2, 0, 'd381c7', 1),
(16, 1234, 2, 'test', 'test', 1234, 'test', '2021-02-18', 3, 9, 0, '1234', 1),
(17, 12354789, 3, 'Georges', 'Abooudeh', 1235687, 'Anfeh, north lebanon 1304', '2021-02-18', 4, 2, 0, '490050a2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_rank`
--

DROP TABLE IF EXISTS `employee_rank`;
CREATE TABLE IF NOT EXISTS `employee_rank` (
  `emp_rank_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `emp_rank_name` varchar(25) NOT NULL,
  `emp_rank_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`emp_rank_id`),
  UNIQUE KEY `unique_rank_name` (`emp_rank_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_rank`
--

INSERT INTO `employee_rank` (`emp_rank_id`, `emp_rank_name`, `emp_rank_status`) VALUES
(0, 'admin', 1),
(1, 'Warehouse Manager', 0),
(2, 'Field Manager', 1),
(4, 'Driver', 1),
(3, 'Helper', 1),
(5, 'Operator ', 0),
(6, 'Civil Engineer', 1),
(7, 'Technical Engineer', 1),
(8, 'Industry Engineer', 1),
(9, 'TEST', 0),
(10, 'tesots', 0),
(11, 'Assistants', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(20) NOT NULL,
  `item_label` varchar(15) NOT NULL,
  `item_type_id` tinyint(4) NOT NULL,
  `item_reserve` tinyint(1) NOT NULL,
  `item_whs_id` tinyint(4) NOT NULL,
  `item_returnable` tinyint(1) NOT NULL,
  `item_lifespan` smallint(6) NOT NULL,
  `item_entry_date` date NOT NULL,
  `item_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_label` (`item_label`),
  KEY `item_whs_id` (`item_whs_id`),
  KEY `FK_itemtype` (`item_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_label`, `item_type_id`, `item_reserve`, `item_whs_id`, `item_returnable`, `item_lifespan`, `item_entry_date`, `item_status`) VALUES
(1, 'electric drill', 'drl-01', 3, 0, 1, 1, 500, '2020-12-21', 1),
(2, 'Wrench', 'wr-01', 1, 0, 4, 1, 500, '2021-01-24', 0),
(3, 'Silicon', 'slc-01', 2, 0, 4, 1, 555, '2021-01-24', 0),
(4, 'Padlock', 'pdl-01', 1, 0, 4, 1, 50, '2021-01-25', 0),
(5, 'Hammer', 'hmr-01', 1, 0, 4, 1, 400, '2021-01-25', 0),
(6, 'hammer', 'hmr-02', 2, 0, 4, 1, 20, '2021-01-25', 0),
(7, 'floor jack', 'jck-01', 1, 1, 1, 1, 4, '2021-01-25', 0),
(8, 'Screwdriver ', 'Scr-01', 2, 0, 4, 1, 100, '2021-02-16', 0),
(9, 'Elecrtrill Drill', 'eldrl-01', 3, 0, 4, 1, 500, '2021-02-17', 1),
(10, 'Drill black & decker', 'eldrl-02', 3, 0, 4, 1, 100, '2021-02-17', 1),
(11, 'shovel', 'sh-01', 2, 0, 4, 1, 500, '2021-02-17', 0),
(12, 'shovel', 'sh-02', 2, 0, 4, 1, 20, '2021-02-17', 1),
(13, 'shovel ', 'sh-03', 2, 0, 4, 1, 5002, '2021-02-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(25) NOT NULL,
  `item_type_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_type_id`),
  UNIQUE KEY `item_type_name` (`item_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`item_type_id`, `item_type_name`, `item_type_status`) VALUES
(1, 'Weightlift', 1),
(2, 'Handy', 1),
(3, 'Electrical', 1),
(4, 'Container', 1);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

DROP TABLE IF EXISTS `month`;
CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int(11) DEFAULT NULL,
  `month_name` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `rqst_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `rqst_user_id` tinyint(4) NOT NULL,
  `rqst_item_id` tinyint(4) NOT NULL,
  `rqst_wrkst_id` tinyint(4) NOT NULL,
  `rqst_res` tinyint(4) NOT NULL,
  `rqst_ret` tinyint(1) NOT NULL,
  `rqst_status` tinyint(4) NOT NULL,
  `rqst_date` date NOT NULL,
  `rqst_acc_date` date DEFAULT NULL,
  `rqst_handled_date` date DEFAULT NULL,
  `rqst_denied_date` date DEFAULT NULL,
  `rqst_returned_date` date DEFAULT NULL,
  `rqst_handler_id` tinyint(4) DEFAULT NULL,
  `rqst_returner_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rqst_id`),
  KEY `rqst_user_id` (`rqst_user_id`),
  KEY `rqst_item_id` (`rqst_item_id`),
  KEY `rqst_wrkst_id` (`rqst_wrkst_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`rqst_id`, `rqst_user_id`, `rqst_item_id`, `rqst_wrkst_id`, `rqst_res`, `rqst_ret`, `rqst_status`, `rqst_date`, `rqst_acc_date`, `rqst_handled_date`, `rqst_denied_date`, `rqst_returned_date`, `rqst_handler_id`, `rqst_returner_id`) VALUES
(1, 16, 6, 4, 0, 1, 0, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 12, NULL),
(2, 16, 3, 4, 0, 1, 0, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 14, NULL),
(3, 12, 8, 6, 0, 1, 3, '2021-02-17', '2021-02-17', '2021-02-17', NULL, '2021-02-17', 7, 7),
(4, 14, 3, 4, 0, 1, 3, '2021-02-17', '2021-02-17', '2021-02-17', NULL, '2021-02-17', 7, 7),
(5, 14, 3, 4, 0, 1, 1, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 4, NULL),
(6, 14, 3, 4, 0, 1, -1, '2021-02-17', '2021-02-17', '2021-02-17', '2021-02-17', NULL, 4, NULL),
(7, 12, 3, 6, 0, 1, 2, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 7, NULL),
(8, 14, 9, 4, 0, 1, -1, '2021-02-17', '2021-02-17', '2021-02-17', '2021-02-17', NULL, 4, NULL),
(9, 14, 6, 4, 0, 1, 2, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 7, NULL),
(10, 14, 3, 4, 0, 1, 0, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 4, NULL),
(11, 14, 4, 4, 0, 1, 3, '2021-02-17', '2021-02-17', '2021-02-17', NULL, '2021-02-17', 7, 7),
(12, 14, 5, 4, 0, 1, 2, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 7, NULL),
(13, 14, 2, 4, 0, 1, 1, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 4, NULL),
(14, 17, 4, 6, 0, 1, 0, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 6, NULL),
(15, 14, 8, 4, 0, 1, 0, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 4, NULL),
(16, 14, 11, 4, 0, 1, 1, '2021-02-17', '2021-02-17', '2021-02-17', NULL, NULL, 4, NULL),
(17, 14, 12, 4, 0, 1, 3, '2021-02-18', '2021-02-18', '2021-02-18', NULL, '2021-02-18', 17, 17),
(18, 14, 7, 4, 0, 1, 0, '2021-02-19', '2021-02-19', '2021-02-19', NULL, NULL, 4, NULL);

--
-- Triggers `request`
--
DROP TRIGGER IF EXISTS `requestItemInsert`;
DELIMITER $$
CREATE TRIGGER `requestItemInsert` AFTER INSERT ON `request` FOR EACH ROW BEGIN
    UPDATE
        item
    SET
        item.item_status = 0
    WHERE
        item.item_id = NEW.rqst_item_id ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `requestItemUpdate`;
DELIMITER $$
CREATE TRIGGER `requestItemUpdate` AFTER UPDATE ON `request` FOR EACH ROW BEGIN
        IF(NEW.rqst_status = 3 OR NEW.rqst_status = -1) THEN
    UPDATE
        item
    SET
        item.item_status = 1
    WHERE
        item.item_id = OLD.rqst_item_id ;
    END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_emp_id` tinyint(4) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_pwd` varchar(300) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  `user_status` tinyint(1) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_usrname` (`user_name`),
  KEY `user_emp_id` (`user_emp_id`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_emp_id`, `user_name`, `user_pwd`, `user_type`, `user_status`, `user_date`) VALUES
(0, 0, 'Admin', '$2y$10$7UfqWjU2uiyh.kaVJ1rFeetFaga2SBm7pE2Hgzgr5GW8QoRnFs4LW', 0, 1, '2020-12-22 03:51:27'),
(4, 1, 't800', '$2y$10$KqKlWUiFofiv/3gw3.7LIe0omVDo5W1EjShg84PnRLHIGg8hDjb0m', 1, 0, '2020-12-28 17:01:09'),
(9, 5, 'YoussefN', '$2y$10$dpBpArvOJb6dGxsc1VcCu.G53PmEFwX5Kkb4jvcYwhAT2iMC6E9Vm', 2, 0, '2020-12-28 17:34:11'),
(14, 4, 'JoseF', '$2y$10$Wp5sWdM8TVkFFHeEXlsqx.yCTz.4aTJ2HRpfrDUJZ1vZ0pwWTbCU6', 2, 1, '2021-02-11 23:14:26'),
(11, 7, 'JeanNK', '$2y$10$Kx2Dk9HCOVj35GsO/RrC6OGnNQKDPzcIyZ44wd9kSOo5/ROELJEQq', 1, 1, '2021-01-26 21:33:41'),
(12, 6, 'Mohito', '$2y$10$kkg5YXH3xEZD3vlzJ8h.Zu7Kz8luZu1kb4xvZe0.2BtYI5J9BaG6K', 1, 1, '2021-01-27 19:48:04'),
(15, 8, 'RGuzman', '$2y$10$eVe6TJSlNlQ1tAgeOweOFuFAnmIcKRHUzj0qqDDV.QpRuxMs2SW9.', 2, 1, '2021-02-16 08:51:44'),
(17, 15, 'Gabouddeh', '$2y$10$b8iKNpa4A4tSbb.OnDi1ruYGuFeAYppt8JPWFZfkaU8bdwNSUtUci', 2, 1, '2021-02-18 01:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `user_type_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(25) NOT NULL,
  `user_type_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type_name`, `user_type_active`) VALUES
(0, 'administrator', 1),
(1, 'Warehouse Manager', 1),
(2, 'Field Operator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `whs_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `whs_label` varchar(20) NOT NULL,
  `whs_mgr_id` tinyint(4) NOT NULL,
  `whs_address` varchar(60) NOT NULL,
  `whs_date` date NOT NULL,
  `whs_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`whs_id`,`whs_label`),
  UNIQUE KEY `whs_emp_id` (`whs_mgr_id`),
  UNIQUE KEY `whs_address` (`whs_address`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`whs_id`, `whs_label`, `whs_mgr_id`, `whs_address`, `whs_date`, `whs_status`) VALUES
(1, 'o-ph in-company', 4, '7535 N Kendall Dr, Miami, FL 33156', '2020-12-21', 1),
(4, 'Tools I', 12, '94 East Glendale Drive Miami, FL 33193', '2021-01-23', 1),
(5, 'Vehicles', 11, '61 Devonshire Dr. Hialeah, FL 33013', '2021-02-16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workstation`
--

DROP TABLE IF EXISTS `workstation`;
CREATE TABLE IF NOT EXISTS `workstation` (
  `wrkst_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `wrkst_name` varchar(25) NOT NULL,
  `wrkst_location` varchar(64) NOT NULL,
  `wrkst_mgr_id` tinyint(4) NOT NULL,
  `wrkst_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`wrkst_id`),
  UNIQUE KEY `wrkst_name` (`wrkst_name`),
  KEY `fk_mgr_id` (`wrkst_mgr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workstation`
--

INSERT INTO `workstation` (`wrkst_id`, `wrkst_name`, `wrkst_location`, `wrkst_mgr_id`, `wrkst_status`) VALUES
(3, 'GW-36', '985 Reed Summit Breitenbergland, GA 28909', 9, 1),
(4, 'Hughes-444', '9518 Camren Ford Suite 495 Funkborough, WV 36539', 4, 1),
(6, 'Pyramid engineering', '7535 N Kendall Dr, Miami, FL 33156', 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
