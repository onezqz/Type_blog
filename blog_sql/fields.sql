/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2019-01-06 16:31:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fields
-- ----------------------------
DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `strValue` text,
  `intValue` int(10) DEFAULT '0',
  `floatValue` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`intValue`),
  KEY `float_value` (`floatValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fields
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
