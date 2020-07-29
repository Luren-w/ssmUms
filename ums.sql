/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50067
 Source Host           : 127.0.0.1:3306
 Source Schema         : wut

 Target Server Type    : MySQL
 Target Server Version : 50067
 File Encoding         : 65001

 Date: 29/07/2020 16:44:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 12288 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, 'admin', 'admin');
INSERT INTO `tb_role` VALUES (2, 'user', 'user');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 12288 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'wuzexue', '123');
INSERT INTO `tb_user` VALUES (2, 'hanhan', '123');
INSERT INTO `tb_user` VALUES (3, 'lisi', '123');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` int(255) NOT NULL,
  `roleId` int(255) NOT NULL,
  INDEX `userid` USING BTREE(`userId`),
  INDEX `roleid` USING BTREE(`roleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `tb_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 12288 kB; (`userid`) REFER `wut/tb_user`(`id`); (`roleid`) REFER `w' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (1, 2);
INSERT INTO `user_role` VALUES (3, 1);
INSERT INTO `user_role` VALUES (3, 2);

SET FOREIGN_KEY_CHECKS = 1;
