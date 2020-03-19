/*
 Navicat Premium Data Transfer

 Source Server         : 47.100.3.58
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 47.100.3.58:3306
 Source Schema         : entfrm

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 19/03/2020 23:16:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('entfrm', '', '$2a$10$IYtF5Qg/TBtau1pT.q4LLu8OdtutvopkxCc4nnV4n.KaadVmeodKK', 'server', 'password,refresh_token', '', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `oauth_client_details` VALUES ('test', NULL, '$2a$10$joT5fWb8.BD48hdde7WdqOhqx1SviO1VDP8tPgmobEznKX3Ovv/I6', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL,
  `ancestors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `sort` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_backup
-- ----------------------------
DROP TABLE IF EXISTS `sys_backup`;
CREATE TABLE `sys_backup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `is_sys` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '系统内置 0-是|1-否',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '初始密码', 'user.initPassword', '123456', '0', 'entfrm', '2020-03-15 21:51:13', '', NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sys_datasource`;
CREATE TABLE `sys_datasource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `driver_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据驱动',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父级编号',
  `ancestors` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '祖级列表',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序',
  `contacts` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '100001', '重庆总公司', 0, '0', 1, 'entfrm', '15688888888', NULL, NULL, '0', 'entfrm', '2020-02-13 20:55:57', NULL, '2020-03-19 20:49:29', NULL, '0');
INSERT INTO `sys_dept` VALUES (2, '10000101', '北京分公司', 1, '0,1', 1, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2020-03-15 20:22:11', NULL, '0');
INSERT INTO `sys_dept` VALUES (3, '10000102', '昆明分公司', 1, '0,1', 2, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2020-03-15 20:37:02', NULL, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `is_sys` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0-是|1-否',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '用户性别', 'user_sex', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:40', '用户性别列表', '0');
INSERT INTO `sys_dict` VALUES (2, '菜单状态', 'menu_status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:41', '菜单状态列表', '0');
INSERT INTO `sys_dict` VALUES (3, '是否', 'yes_no', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '是否列表', '0');
INSERT INTO `sys_dict` VALUES (4, '状态', 'status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '状态列表', '0');
INSERT INTO `sys_dict` VALUES (5, '成功失败', 'success_fail', '0', '0', 'admin', '2019-08-24 10:02:57', 'admin', '2020-03-17 14:19:43', '成功失败列表', '0');
INSERT INTO `sys_dict` VALUES (6, '测试', 'sys_test', '1', '0', 'entfrm', '2020-03-17 13:57:44', 'entfrm', '2020-03-19 18:34:00', 'test', '1');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NULL DEFAULT NULL COMMENT '字典编号',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, 'user_sex', '男', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-13 18:33:40', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (2, 1, 'user_sex', '女', '1', 2, NULL, '2019-08-13 18:34:03', NULL, '2019-08-13 18:34:07', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (3, 2, 'menu_status', '隐藏', '1', 2, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:29', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (4, 2, 'menu_status', '显示', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:28', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (5, 3, 'yes_no', '是', '0', 1, NULL, '2019-08-13 18:33:37', 'admin', '2020-03-17 12:05:05', '', '0');
INSERT INTO `sys_dict_data` VALUES (6, 3, 'yes_no', '否', '1', 2, NULL, '2019-08-13 18:33:37', 'admin', '2020-03-17 12:05:06', '', '0');
INSERT INTO `sys_dict_data` VALUES (7, 4, 'status', '停用', '1', 2, NULL, '2019-08-13 18:34:03', 'admin', '2019-08-19 15:43:00', '', '0');
INSERT INTO `sys_dict_data` VALUES (8, 4, 'status', '正常', '0', 1, NULL, '2019-08-13 18:33:37', NULL, '2019-08-19 15:42:59', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (9, NULL, 'success_fail', '成功', '0', 10, 'admin', '2019-08-24 11:48:18', 'entfrm', '2019-08-24 11:48:17', '', '0');
INSERT INTO `sys_dict_data` VALUES (10, NULL, 'success_fail', '失败', '1', 20, 'admin', '2019-08-24 11:48:27', NULL, '2019-08-24 11:48:26', '', '0');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `obj_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象编号',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件格式',
  `size` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件保存路径',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构编号',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户代理',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 14:59:30');
INSERT INTO `sys_login_log` VALUES (2, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 14:59:30');
INSERT INTO `sys_login_log` VALUES (3, 'admin', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '1', '登录失败，异常：用户名或密码错误', '2020-03-19 14:59:34');
INSERT INTO `sys_login_log` VALUES (4, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:05:34');
INSERT INTO `sys_login_log` VALUES (5, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:05:34');
INSERT INTO `sys_login_log` VALUES (6, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:05:34');
INSERT INTO `sys_login_log` VALUES (7, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:05:35');
INSERT INTO `sys_login_log` VALUES (8, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:05:35');
INSERT INTO `sys_login_log` VALUES (9, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:06:03');
INSERT INTO `sys_login_log` VALUES (10, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:06:03');
INSERT INTO `sys_login_log` VALUES (11, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:06:14');
INSERT INTO `sys_login_log` VALUES (12, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:06:14');
INSERT INTO `sys_login_log` VALUES (13, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:03');
INSERT INTO `sys_login_log` VALUES (14, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:03');
INSERT INTO `sys_login_log` VALUES (15, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:10');
INSERT INTO `sys_login_log` VALUES (16, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:11');
INSERT INTO `sys_login_log` VALUES (17, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:14');
INSERT INTO `sys_login_log` VALUES (18, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:07:14');
INSERT INTO `sys_login_log` VALUES (19, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:23');
INSERT INTO `sys_login_log` VALUES (20, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:23');
INSERT INTO `sys_login_log` VALUES (21, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:23');
INSERT INTO `sys_login_log` VALUES (22, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:23');
INSERT INTO `sys_login_log` VALUES (23, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:23');
INSERT INTO `sys_login_log` VALUES (24, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:38:56');
INSERT INTO `sys_login_log` VALUES (25, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:02');
INSERT INTO `sys_login_log` VALUES (26, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:02');
INSERT INTO `sys_login_log` VALUES (27, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:02');
INSERT INTO `sys_login_log` VALUES (28, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:03');
INSERT INTO `sys_login_log` VALUES (29, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:03');
INSERT INTO `sys_login_log` VALUES (30, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 16:39:03');
INSERT INTO `sys_login_log` VALUES (31, 'admin', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '1', '登录失败，异常：用户名或密码错误', '2020-03-19 16:59:21');
INSERT INTO `sys_login_log` VALUES (32, 'admin', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '1', '登录失败，异常：用户名或密码错误', '2020-03-19 17:02:49');
INSERT INTO `sys_login_log` VALUES (33, 'entfrm', '192.168.1.3', 'XX XX', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '0', '', '2020-03-19 17:02:51');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单IDS',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型 ',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT 'VUE页面',
  `perms` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `icon` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序值',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, NULL, 'M', 'system', '#', '', 'system', 10, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2020-03-16 20:45:21', '系统管理模块', '0');
INSERT INTO `sys_menu` VALUES (2, '运维监控', 0, NULL, 'M', 'monitor', '#', '', 'monitor', 20, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2020-03-17 19:14:27', '运维监控模块', '0');
INSERT INTO `sys_menu` VALUES (3, '开发工具', 0, NULL, 'M', 'devtool', '#', '', 'tool', 30, '0', 'admin', '2019-03-16 11:33:00', 'admin', '2020-03-17 19:14:33', '开发工具模块', '0');
INSERT INTO `sys_menu` VALUES (4, '机构管理', 1, NULL, 'C', 'dept', 'system/dept/index', '', 'tree', 1, '0', NULL, '2020-03-13 19:31:20', NULL, '2020-03-14 20:55:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, NULL, 'C', 'role', 'system/role/index', '', 'peoples', 2, '0', NULL, '2020-03-13 19:32:09', NULL, '2020-03-16 22:11:57', NULL, '0');
INSERT INTO `sys_menu` VALUES (6, '用户管理', 1, NULL, 'C', 'user', 'system/user/index', '', 'user', 3, '0', NULL, '2020-03-13 19:32:30', NULL, '2020-03-16 22:11:59', NULL, '0');
INSERT INTO `sys_menu` VALUES (7, '菜单管理', 1, NULL, 'C', 'menu', 'system/menu/index', '', 'tree-table', 4, '0', NULL, '2020-03-13 19:33:24', NULL, '2020-03-16 22:12:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (8, '机构新增', 4, NULL, 'F', NULL, '#', 'dept_add', NULL, 1, '0', NULL, '2020-03-12 20:42:47', NULL, '2020-03-16 20:42:51', NULL, '0');
INSERT INTO `sys_menu` VALUES (9, '机构修改', 4, NULL, 'F', NULL, '#', 'dept_edit', NULL, 2, '0', NULL, '2020-03-12 20:42:52', NULL, '2020-03-16 20:42:56', NULL, '0');
INSERT INTO `sys_menu` VALUES (10, '机构删除', 4, NULL, 'F', NULL, '#', 'dept_del', NULL, 3, '0', NULL, '2020-03-12 20:42:57', NULL, '2020-03-16 20:43:02', NULL, '0');
INSERT INTO `sys_menu` VALUES (11, '机构查看', 4, NULL, 'F', NULL, '#', 'dept_view', NULL, 4, '0', NULL, '2020-03-12 20:43:03', NULL, '2020-03-16 20:43:06', NULL, '0');
INSERT INTO `sys_menu` VALUES (12, '机构导入', 4, NULL, 'F', NULL, '#', 'dept_import', NULL, 5, '0', 'entfrm', '2020-03-16 20:40:08', 'entfrm', '2020-03-16 20:42:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (13, '角色新增', 5, NULL, 'F', NULL, '#', 'role_add', NULL, 1, '0', 'entfrm', '2020-03-16 11:50:24', NULL, '2020-03-16 20:41:51', NULL, '0');
INSERT INTO `sys_menu` VALUES (14, '角色修改', 5, NULL, 'F', NULL, '#', 'role_edit', NULL, 2, '0', 'entfrm', '2020-03-16 11:51:05', NULL, '2020-03-16 20:41:44', NULL, '0');
INSERT INTO `sys_menu` VALUES (15, '角色删除', 5, NULL, 'F', NULL, '#', 'role_del', NULL, 3, '0', 'entfrm', '2020-03-16 11:51:21', NULL, '2020-03-16 20:41:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (16, '角色查看', 5, NULL, 'F', NULL, '#', 'role_view', NULL, 4, '0', 'entfrm', '2020-03-16 11:51:40', NULL, '2020-03-16 20:41:37', NULL, '0');
INSERT INTO `sys_menu` VALUES (17, '数据权限', 5, NULL, 'F', NULL, '#', 'role_data', NULL, 5, '0', 'entfrm', '2020-03-16 12:15:50', NULL, '2020-03-16 20:41:34', NULL, '0');
INSERT INTO `sys_menu` VALUES (18, '用户添加', 6, NULL, 'F', NULL, '#', 'user_add', NULL, 1, '0', 'entfrm', '2020-03-16 20:31:15', NULL, '2020-03-16 20:41:31', NULL, '0');
INSERT INTO `sys_menu` VALUES (19, '用户修改', 6, NULL, 'F', NULL, '#', 'user_edit', NULL, 2, '0', 'entfrm', '2020-03-16 20:32:19', 'entfrm', '2020-03-16 20:41:28', NULL, '0');
INSERT INTO `sys_menu` VALUES (20, '用户删除', 6, NULL, 'F', NULL, '#', 'user_del', NULL, 3, '0', 'entfrm', '2020-03-16 20:32:41', NULL, '2020-03-16 20:41:25', NULL, '0');
INSERT INTO `sys_menu` VALUES (21, '用户查看', 6, NULL, 'F', NULL, '#', 'user_view', NULL, 4, '0', 'entfrm', '2020-03-16 20:33:11', NULL, '2020-03-16 20:41:20', NULL, '0');
INSERT INTO `sys_menu` VALUES (22, '重置密码', 6, NULL, 'F', NULL, '#', 'user_reset', NULL, 5, '0', 'entfrm', '2020-03-16 20:34:22', 'entfrm', '2020-03-16 20:41:17', NULL, '0');
INSERT INTO `sys_menu` VALUES (23, '用户导入', 6, NULL, 'F', NULL, '#', 'user_import', NULL, 6, '0', 'entfrm', '2020-03-16 20:34:49', NULL, '2020-03-16 20:41:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (24, '用户导出', 6, NULL, 'F', NULL, '#', 'user_export', NULL, 7, '0', 'entfrm', '2020-03-16 20:35:12', NULL, '2020-03-16 20:41:12', NULL, '0');
INSERT INTO `sys_menu` VALUES (25, '菜单新增', 7, NULL, 'F', NULL, '#', 'menu_add', NULL, 1, '0', 'entfrm', '2020-03-16 20:38:18', NULL, '2020-03-16 20:41:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (26, '菜单修改', 7, NULL, 'F', NULL, '#', 'menu_edit', NULL, 2, '0', 'entfrm', '2020-03-16 20:38:41', 'entfrm', '2020-03-16 20:41:07', NULL, '0');
INSERT INTO `sys_menu` VALUES (27, '菜单删除', 7, NULL, 'F', NULL, '#', 'menu_del', NULL, 3, '0', 'entfrm', '2020-03-16 20:39:04', NULL, '2020-03-16 20:41:04', NULL, '0');
INSERT INTO `sys_menu` VALUES (28, '菜单查看', 7, NULL, 'F', NULL, '#', 'menu_view', NULL, 4, '0', 'entfrm', '2020-03-16 20:39:39', NULL, '2020-03-16 20:41:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (29, '字典管理', 1, '6', 'C', 'dict', 'system/dict/index', '', 'dict', 5, '0', 'entfrm', '2020-03-16 11:33:00', '', '2020-03-16 11:33:00', '字典管理菜单', '0');
INSERT INTO `sys_menu` VALUES (30, '字典新增', 29, NULL, 'F', NULL, '#', 'dict_add', NULL, 1, '0', 'entfrm', '2020-03-16 20:50:45', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (31, '字典修改', 29, NULL, 'F', NULL, '#', 'dict_edit', NULL, 2, '0', 'entfrm', '2020-03-16 20:51:01', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (32, '字典删除', 29, NULL, 'F', NULL, '#', 'dict_del', NULL, 3, '0', 'entfrm', '2020-03-16 20:52:18', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (33, '字典查看', 29, NULL, 'F', NULL, '#', 'dict_view', NULL, 4, '0', 'entfrm', '2020-03-16 20:52:38', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (34, '数据增加', 29, NULL, 'F', NULL, '#', 'dictData_add', NULL, 5, '0', 'entfrm', '2020-03-16 21:49:18', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (35, '数据修改', 29, NULL, 'F', NULL, '#', 'dictData_edit', NULL, 6, '0', 'entfrm', '2020-03-16 21:49:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (36, '数据删除', 29, NULL, 'F', NULL, '#', 'dictData_del', NULL, 7, '0', 'entfrm', '2020-03-16 21:50:00', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (37, '数据查看', 29, NULL, 'F', NULL, '#', 'dictData_view', NULL, 8, '0', 'entfrm', '2020-03-16 21:50:19', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (38, '参数管理', 1, NULL, 'C', 'config', 'system/config/index', NULL, 'list', 6, '0', 'entfrm', '2020-03-16 22:06:52', NULL, '2020-03-16 22:11:13', NULL, '0');
INSERT INTO `sys_menu` VALUES (39, '参数新增', 38, NULL, 'F', NULL, '#', 'config_add', NULL, 1, '0', 'entfrm', '2020-03-16 22:07:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (40, '参数修改', 38, NULL, 'F', NULL, '#', 'config_edit', NULL, 2, '0', 'entfrm', '2020-03-16 22:07:30', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (41, '参数删除', 38, NULL, 'F', NULL, '#', 'config_del', NULL, 3, '0', 'entfrm', '2020-03-16 22:07:43', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (42, '参数查看', 38, NULL, 'F', NULL, '#', 'config_view', NULL, 4, '0', 'entfrm', '2020-03-16 22:08:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (43, '快捷方式', 1, NULL, 'C', 'shortcut', 'system/shortcut/index', NULL, 'link', 7, '0', 'entfrm', '2020-03-17 17:53:08', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (44, '文件管理', 1, NULL, 'C', 'fileinfo', 'system/fileinfo/index', NULL, 'zip', 8, '0', 'entfrm', '2020-03-17 17:56:28', 'entfrm', '2020-03-17 17:57:54', NULL, '0');
INSERT INTO `sys_menu` VALUES (45, '终端管理', 1, NULL, 'C', 'clientDetails', 'system/clientDetails/index', NULL, 'phone', 9, '0', 'entfrm', '2020-03-17 17:57:46', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (46, '数据备份', 1, NULL, 'C', 'backup', 'system/backup/index', NULL, 'date-range', 11, '0', 'entfrm', '2020-03-17 18:02:21', NULL, '2020-03-18 22:20:28', NULL, '0');
INSERT INTO `sys_menu` VALUES (47, '令牌管理', 2, NULL, 'C', 'token', 'system/token/index', NULL, 'post', 1, '0', 'entfrm', '2020-03-17 17:59:55', 'entfrm', '2020-03-18 22:20:24', NULL, '0');
INSERT INTO `sys_menu` VALUES (48, '定时任务', 2, NULL, 'C', 'job', 'monitor/job/index', NULL, 'time-range', 2, '0', 'entfrm', '2020-03-17 18:08:23', NULL, '2020-03-18 22:20:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (49, '数据监控', 2, NULL, 'C', 'druid', '#', NULL, 'druid', 3, '0', 'entfrm', '2020-03-17 18:08:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (50, '服务监控', 2, NULL, 'C', 'server', '#', NULL, 'server', 4, '0', 'entfrm', '2020-03-17 18:09:39', 'entfrm', '2020-03-17 18:25:12', NULL, '0');
INSERT INTO `sys_menu` VALUES (51, 'API监控', 2, NULL, 'C', 'api', '#', NULL, 'chart', 5, '0', 'entfrm', '2020-03-17 18:15:13', 'entfrm', '2020-03-17 18:17:34', NULL, '0');
INSERT INTO `sys_menu` VALUES (52, '日志监控', 2, NULL, 'M', 'log', '#', NULL, 'monitor', 6, '0', 'entfrm', '2020-03-17 18:12:01', NULL, '2020-03-18 23:00:39', NULL, '0');
INSERT INTO `sys_menu` VALUES (53, '登录日志', 52, NULL, 'C', 'loginLog', 'monitor/loginLog/index', NULL, 'logininfor', 1, '0', 'entfrm', '2020-03-17 18:12:56', NULL, '2020-03-18 22:31:53', NULL, '0');
INSERT INTO `sys_menu` VALUES (54, '操作日志', 52, NULL, 'C', 'operLog', 'monitor/operLog/index', NULL, 'log', 2, '0', 'entfrm', '2020-03-17 18:13:52', 'entfrm', '2020-03-18 22:31:36', NULL, '0');
INSERT INTO `sys_menu` VALUES (55, '数据源管理', 3, NULL, 'C', 'datasource', '#', NULL, 'star', 1, '0', 'entfrm', '2020-03-17 18:18:38', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (56, 'API管理', 3, NULL, 'C', 'api', '#', NULL, 'drag', 2, '0', 'entfrm', '2020-03-17 18:19:52', 'entfrm', '2020-03-17 18:23:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (57, '智能表单', 3, NULL, 'C', 'form', '#', NULL, 'form', 3, '0', 'entfrm', '2020-03-17 18:21:32', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (58, '工作流', 3, NULL, 'C', 'work', '#', NULL, 'skill', 4, '0', 'entfrm', '2020-03-17 18:22:36', 'entfrm', '2020-03-19 11:18:45', NULL, '0');
INSERT INTO `sys_menu` VALUES (59, '终端新增', 45, NULL, 'F', NULL, '#', 'clientDetails_add', NULL, 1, '0', 'entfrm', '2020-03-18 15:18:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (60, '终端修改', 45, NULL, 'F', NULL, '#', 'clientDetails_edit', NULL, 2, '0', 'entfrm', '2020-03-18 15:18:53', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (61, '终端删除', 45, NULL, 'F', NULL, '#', 'clientDetails_del', NULL, 3, '0', 'entfrm', '2020-03-18 15:19:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (62, '终端查看', 45, NULL, 'F', NULL, '#', 'clientDetails_view', NULL, 4, '0', 'entfrm', '2020-03-18 15:19:29', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (63, '登录日志删除', 53, NULL, 'F', NULL, '#', 'loginLog_del', NULL, 1, '0', 'entfrm', '2020-03-19 11:50:34', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (64, '登录日志查看', 53, NULL, 'F', NULL, '#', 'loginLog_view', NULL, 2, '0', 'entfrm', '2020-03-19 11:50:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (65, '登录日志导出', 53, NULL, 'F', NULL, '#', 'loginLog_export', NULL, 3, '0', 'entfrm', '2020-03-19 11:52:05', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (66, '操作日志删除', 54, NULL, 'F', NULL, '#', 'operLog_del', NULL, 1, '0', 'entfrm', '2020-03-19 11:52:25', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (67, '操作日志查看', 54, NULL, 'F', NULL, '#', 'operLog_view', NULL, 2, '0', 'entfrm', '2020-03-19 11:52:45', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (68, '操作日志导出', 54, NULL, 'F', NULL, '#', 'operLog_export', NULL, 3, '0', 'entfrm', '2020-03-19 11:53:09', NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_msginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_msginfo`;
CREATE TABLE `sys_msginfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `files` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接',
  `dept_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属机构',
  `extend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展字段',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_msginfo_push
-- ----------------------------
DROP TABLE IF EXISTS `sys_msginfo_push`;
CREATE TABLE `sys_msginfo_push`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `msginfo_id` int(11) NOT NULL COMMENT '消息编号',
  `receive_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接受人',
  `is_read` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否阅读',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_msginfo_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_msginfo_template`;
CREATE TABLE `sys_msginfo_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板类型',
  `tpl_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板键值',
  `tpl_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户代理',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `client_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '终端',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误消息',
  `execute_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '1', '终端删除', 'DELETE', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/clientDetails/remove/test', '192.168.1.3', 'XX XX', '', 0, '', '362', '2020-03-18 21:25:13');
INSERT INTO `sys_oper_log` VALUES (2, '1', '终端新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', NULL, '/system/clientDetails/save', '192.168.1.3', 'XX XX', '', 0, '', '117', '2020-03-18 21:54:19');
INSERT INTO `sys_oper_log` VALUES (3, '1', '终端新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/clientDetails/save', '192.168.1.3', 'XX XX', '', 0, '', '181', '2020-03-18 22:10:10');
INSERT INTO `sys_oper_log` VALUES (4, '1', '终端删除', 'DELETE', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/clientDetails/remove/test', '192.168.1.3', 'XX XX', '', 0, '', '13', '2020-03-19 09:52:32');
INSERT INTO `sys_oper_log` VALUES (5, '1', '终端新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/clientDetails/save', '192.168.1.3', 'XX XX', '', 0, '', '108', '2020-03-19 10:00:05');
INSERT INTO `sys_oper_log` VALUES (6, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '18', '2020-03-19 11:50:34');
INSERT INTO `sys_oper_log` VALUES (7, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 11:50:58');
INSERT INTO `sys_oper_log` VALUES (8, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '8', '2020-03-19 11:52:04');
INSERT INTO `sys_oper_log` VALUES (9, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '8', '2020-03-19 11:52:24');
INSERT INTO `sys_oper_log` VALUES (10, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '8', '2020-03-19 11:52:45');
INSERT INTO `sys_oper_log` VALUES (11, '1', '菜单新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/save', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 11:53:09');
INSERT INTO `sys_oper_log` VALUES (12, '1', '角色修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/role/update', '192.168.1.3', 'XX XX', '', 0, '', '82', '2020-03-19 11:53:21');
INSERT INTO `sys_oper_log` VALUES (13, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '0', '2020-03-19 12:47:24');
INSERT INTO `sys_oper_log` VALUES (14, '1', '用户状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '319', '2020-03-19 12:50:11');
INSERT INTO `sys_oper_log` VALUES (15, '1', '用户状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 12:50:16');
INSERT INTO `sys_oper_log` VALUES (16, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 12:50:22');
INSERT INTO `sys_oper_log` VALUES (17, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 13:25:01');
INSERT INTO `sys_oper_log` VALUES (18, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 13:25:51');
INSERT INTO `sys_oper_log` VALUES (19, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '0', '2020-03-19 13:29:13');
INSERT INTO `sys_oper_log` VALUES (20, '1', '菜单修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/update', '192.168.1.3', 'XX XX', '', 0, '', '18', '2020-03-19 13:30:06');
INSERT INTO `sys_oper_log` VALUES (21, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '8447', '2020-03-19 13:31:06');
INSERT INTO `sys_oper_log` VALUES (22, '1', '用户状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '38169', '2020-03-19 13:32:05');
INSERT INTO `sys_oper_log` VALUES (23, '1', '用户密码重置', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/resetPwd', '192.168.1.3', 'XX XX', '', 0, '', '128', '2020-03-19 13:32:35');
INSERT INTO `sys_oper_log` VALUES (24, '1', '用户状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '10488', '2020-03-19 13:32:51');
INSERT INTO `sys_oper_log` VALUES (25, '1', '用户删除', 'DELETE', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/remove/4', '192.168.1.3', 'XX XX', '', 0, '', '9', '2020-03-19 17:46:59');
INSERT INTO `sys_oper_log` VALUES (26, '1', '用户新增', 'POST', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/save', '192.168.1.3', 'XX XX', '', 0, '', '126', '2020-03-19 17:47:30');
INSERT INTO `sys_oper_log` VALUES (27, '1', '用户修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/update', '192.168.1.3', 'XX XX', '', 0, '', '69', '2020-03-19 18:32:45');
INSERT INTO `sys_oper_log` VALUES (28, '1', '用户修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/update', '192.168.1.3', 'XX XX', '', 0, '', '14', '2020-03-19 18:32:51');
INSERT INTO `sys_oper_log` VALUES (29, '1', '用户状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '16', '2020-03-19 18:32:57');
INSERT INTO `sys_oper_log` VALUES (30, '1', '角色状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/role/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '10', '2020-03-19 18:33:08');
INSERT INTO `sys_oper_log` VALUES (31, '1', '角色状态更改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/role/changeStatus', '192.168.1.3', 'XX XX', '', 0, '', '7', '2020-03-19 18:33:17');
INSERT INTO `sys_oper_log` VALUES (32, '1', '字典删除', 'DELETE', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/dict/remove/6', '192.168.1.3', 'XX XX', '', 0, '', '6', '2020-03-19 18:34:00');
INSERT INTO `sys_oper_log` VALUES (33, '1', '用户修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/update', '192.168.1.3', 'XX XX', '', 0, '', '15', '2020-03-19 19:19:50');
INSERT INTO `sys_oper_log` VALUES (34, '1', '用户修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/update', '192.168.1.3', 'XX XX', '', 0, '', '13', '2020-03-19 19:20:06');
INSERT INTO `sys_oper_log` VALUES (35, '1', '用户密码修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/user/updatePwd', '183.228.190.231', 'XX XX', 'password=%5B123123%5D&newPassword=%5B123456%5D', 0, '', '280', '2020-03-19 22:54:02');
INSERT INTO `sys_oper_log` VALUES (36, '1', '角色修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/role/update', '183.228.190.231', 'XX XX', '', 0, '', '215', '2020-03-19 22:55:20');
INSERT INTO `sys_oper_log` VALUES (37, '1', '菜单修改', 'PUT', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'entfrm', 'entfrm', '/system/menu/update', '183.228.190.231', 'XX XX', '', 0, '', '54', '2020-03-19 23:05:10');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色代码',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限范围',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '1', 1, '0', 'entfrm', '2020-03-13 20:54:34', 'entfrm', '2020-03-13 20:54:50', NULL, '0');
INSERT INTO `sys_role` VALUES (2, '测试角色', 'test', '2', 1, '0', 'entfrm', '2020-03-14 18:15:51', 'entfrm', '2020-03-19 18:33:17', NULL, '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 50);
INSERT INTO `sys_role_menu` VALUES (1, 51);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 63);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 66);
INSERT INTO `sys_role_menu` VALUES (1, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 45);

-- ----------------------------
-- Table structure for sys_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `sys_shortcut`;
CREATE TABLE `sys_shortcut`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `region` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '机构ID',
  `dept_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'entfrm', '管理员', '00', '$2a$10$TQCf5Y3KTyuffHodYZTqIO7yNu/m8qePm/mVxw9Bp6nssL30pmYB6', 1, '重庆总公司', '111@qq.com', '15611111111', '0', '', '0', '', NULL, 'entfrm', '2020-03-13 20:56:44', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (2, 'test01', '测试01', '00', '$2a$10$Yq7NRB8VO4n1AxcThlwJweM1WE8fwvFRl0krQkNihGxiCRW/Gfp/.', 1, '重庆总公司', '', '', '0', '', '0', '', NULL, 'entfrm', '2020-03-14 18:14:11', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (3, 'test02', '测试02', '00', '', 3, NULL, '222@qq.com', '15622222222', '0', '', '0', '', NULL, NULL, NULL, '', '2020-03-16 11:49:31', '123', '0');
INSERT INTO `sys_user` VALUES (4, 'test03', '测试03', '00', '$2a$10$9fdDK5mw3ruAoPiZMrDL9.pWvxJ/97NBAT3Gwbe3SG/BqPv8wyoa6', 3, NULL, '333@qq.com', '15633333333', '0', '', '1', '', NULL, 'entfrm', '2020-03-17 12:52:21', '', NULL, NULL, '1');
INSERT INTO `sys_user` VALUES (5, '测试03', 'test03', '00', '', 3, '昆明分公司', '333@qq.com', '15633333333', '0', '', '1', '', NULL, 'entfrm', '2020-03-19 17:47:31', '', '2020-03-19 18:32:46', NULL, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);

SET FOREIGN_KEY_CHECKS = 1;
