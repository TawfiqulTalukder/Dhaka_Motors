/*
MySQL Data Transfer
Source Host: localhost
Source Database: dhaka_motors
Target Host: localhost
Target Database: dhaka_motors
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nid` varchar(15) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dealers
-- ----------------------------
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE `dealers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dealerName` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_from` date NOT NULL,
  `d_to` date NOT NULL,
  `percentage` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `distribution_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `dealer_id` int(11) NOT NULL,
  PRIMARY KEY (`distribution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for motorcycle_info
-- ----------------------------
DROP TABLE IF EXISTS `motorcycle_info`;
CREATE TABLE `motorcycle_info` (
  `mID` int(11) NOT NULL AUTO_INCREMENT,
  `mType` varchar(30) NOT NULL,
  `mName` varchar(30) NOT NULL,
  `model` varchar(100) NOT NULL,
  `engineNo` varchar(30) NOT NULL,
  `chassisNo` varchar(30) NOT NULL,
  `cc` int(10) NOT NULL,
  `color` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `sID` int(11) DEFAULT NULL,
  `saleID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `warranty` date NOT NULL,
  `reg` varchar(50) NOT NULL,
  PRIMARY KEY (`mID`),
  KEY `stock` (`sID`),
  KEY `sale` (`saleID`),
  KEY `customer` (`cID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for motorcycle_model
-- ----------------------------
DROP TABLE IF EXISTS `motorcycle_model`;
CREATE TABLE `motorcycle_model` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `miModel` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for motorcycle_name
-- ----------------------------
DROP TABLE IF EXISTS `motorcycle_name`;
CREATE TABLE `motorcycle_name` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `miName` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for motorcycle_type
-- ----------------------------
DROP TABLE IF EXISTS `motorcycle_type`;
CREATE TABLE `motorcycle_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `miType` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for parts_info
-- ----------------------------
DROP TABLE IF EXISTS `parts_info`;
CREATE TABLE `parts_info` (
  `parts_id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_type` varchar(20) NOT NULL,
  `parts_name` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(5) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`parts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for parts_sale
-- ----------------------------
DROP TABLE IF EXISTS `parts_sale`;
CREATE TABLE `parts_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `qnt` int(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for pre_booking
-- ----------------------------
DROP TABLE IF EXISTS `pre_booking`;
CREATE TABLE `pre_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) NOT NULL,
  `model` varchar(10) NOT NULL,
  `book_date` date NOT NULL,
  `book_time` time NOT NULL,
  `h_date` varchar(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sale_info
-- ----------------------------
DROP TABLE IF EXISTS `sale_info`;
CREATE TABLE `sale_info` (
  `saleID` int(11) NOT NULL AUTO_INCREMENT,
  `sale_date` date DEFAULT NULL,
  `sale_time` time DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `staff_ID` int(11) DEFAULT NULL,
  `pre_book_status` int(11) NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY (`saleID`),
  KEY `stafftosale` (`staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_date` date NOT NULL,
  `s_time` date NOT NULL,
  `type_id` int(11) NOT NULL,
  `mID` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  `fee` int(30) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info` (
  `staff_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `level` varchar(15) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info` (
  `sID` int(11) NOT NULL AUTO_INCREMENT,
  `stock_date` date NOT NULL,
  `stock_time` time NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sID`),
  KEY `staffID` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
