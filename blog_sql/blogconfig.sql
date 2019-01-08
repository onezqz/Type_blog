/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2019-01-06 16:30:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blogconfig
-- ----------------------------
DROP TABLE IF EXISTS `blogconfig`;
CREATE TABLE `blogconfig` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `blogName` varchar(255) DEFAULT NULL,
  `blogKeywords` varchar(255) DEFAULT NULL,
  `blogDesc` text,
  `blogCommentTimeFormat` varchar(255) DEFAULT NULL,
  `blogCommentListNum` int(10) DEFAULT NULL,
  `blogCommentAvatarUrl` varchar(255) DEFAULT NULL,
  `blogArticleTimeFormat` varchar(255) DEFAULT NULL,
  `blogArticleNumEachPage` int(10) DEFAULT NULL,
  `blogArticleSub` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

