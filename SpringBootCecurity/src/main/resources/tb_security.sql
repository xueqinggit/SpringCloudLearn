/*
 Navicat Premium Data Transfer

 Source Server         : MySQL王学卿
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : tb_security

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 11/09/2018 17:10:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT 0,
  `user_agent` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器标识',
  `ip_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP地址',
  `type` int(11) NULL DEFAULT 1 COMMENT '1：网页登录\r\n2：OpenId登录',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `modified_time` datetime NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1 COMMENT '1：正常',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '资源图标',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '资源名字',
  `authority` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '资源路径',
  `type` int(11) NULL DEFAULT 0 COMMENT '资源类型（1:一级菜单，2:二级菜单，3:链接）',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父资源ID',
  `sort` int(11) NULL DEFAULT 0 COMMENT '资源顺序',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '1：正常',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 814018011839979521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '', 'Spring Security', 'index', '/index', 1, 0, 1, '2016-12-02 19:57:40', '2016-12-02 19:57:41', 1, 0);
INSERT INTO `menu` VALUES (3, '', '会员列表', 'user_list', '/user/list', 2, 1, 1, '2016-12-23 15:40:27', '2016-12-23 15:40:27', 1, 0);
INSERT INTO `menu` VALUES (4, '', '角色列表', 'role_list', '/role/list', 2, 1, 2, '2016-12-23 15:44:02', '2016-12-23 15:44:02', 1, 0);
INSERT INTO `menu` VALUES (5, '', '菜单列表', 'menu_list', '/menu/list', 2, 1, 3, '2016-12-23 15:45:30', '2016-12-23 15:45:30', 1, 0);
INSERT INTO `menu` VALUES (6, '', '添加用户', 'user_add', '/user/add', 3, 3, 1, '2016-12-28 11:38:26', '2016-12-28 11:38:26', 1, 0);
INSERT INTO `menu` VALUES (7, '', '修改用户', 'user_edit', '/user/update', 3, 3, 2, '2016-12-28 11:39:06', '2016-12-28 11:39:06', 1, 0);
INSERT INTO `menu` VALUES (10, '', '删除用户', 'user_del', '/user/del', 3, 3, 5, '2016-12-28 11:41:24', '2016-12-28 11:41:24', 1, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '角色名字(英文）',
  `name_remark` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '角色描述',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '1：正常',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'super_admin', '超级管理员', '2016-12-02 12:10:07', '2016-12-02 12:10:08', 1, 0);
INSERT INTO `role` VALUES (2, 'general_user', '普通用户', '2018-09-11 15:02:20', '2018-09-11 15:02:22', 1, 0);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT 0 COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT 0 COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 814018126336090118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 1);
INSERT INTO `role_menu` VALUES (2, 1, 10);
INSERT INTO `role_menu` VALUES (3, 1, 3);
INSERT INTO `role_menu` VALUES (4, 1, 4);
INSERT INTO `role_menu` VALUES (5, 1, 5);
INSERT INTO `role_menu` VALUES (6, 1, 6);
INSERT INTO `role_menu` VALUES (7, 1, 7);
INSERT INTO `role_menu` VALUES (8, 2, 1);
INSERT INTO `role_menu` VALUES (9, 2, 3);
INSERT INTO `role_menu` VALUES (10, 2, 4);
INSERT INTO `role_menu` VALUES (11, 2, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名字',
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `admin` int(11) NULL DEFAULT 1 COMMENT '1：普通\r\n2：管理员',
  `create_date` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `modified_time` datetime NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1 COMMENT '1：正常\r\n2：停用',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '许许', 'admin', 'admin', 2, '2016-12-23 16:18:38', '2016-12-28 16:02:55', 1, 0);
INSERT INTO `user` VALUES (2, '多多', 'user', 'user', 1, '2018-09-11 15:00:33', '2018-09-11 15:00:34', 1, 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT 0 COMMENT '角色ID',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '1：正常',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, '2016-12-02 12:10:19', '2016-12-25 17:11:15', 1, 0);
INSERT INTO `user_role` VALUES (2, 2, 2, '2018-09-11 16:12:14', '2018-09-11 16:12:15', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
