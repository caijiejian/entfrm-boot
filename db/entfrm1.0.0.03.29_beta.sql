/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : entfrm

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 29/03/2020 22:17:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dev_column
-- ----------------------------
DROP TABLE IF EXISTS `dev_column`;
CREATE TABLE `dev_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否必填（1是）',
  `is_add` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否为新增字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否查询字段（1是）',
  `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'eq' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 967 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dev_table
-- ----------------------------
DROP TABLE IF EXISTS `dev_table`;
CREATE TABLE `dev_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `oauth_client_details` VALUES ('test', NULL, '$2a$10$q0DT1hteQMt7LSdmR5GANekY.YYCpxHQh21OCyGDAamxHjiCJaa86', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_IBFK_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_IBFK_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_backup
-- ----------------------------
INSERT INTO `sys_backup` VALUES (1, '20200320222643', 'nullbackup/entfrm_20200320222643.sql', 'entfrm', '2020-03-20 22:26:45', NULL, '2020-03-20 22:29:01', '测试一下', '1');
INSERT INTO `sys_backup` VALUES (2, '20200320222908', 'F:/profile/backup/entfrm_20200320222908.sql', 'entfrm', '2020-03-20 22:29:08', NULL, NULL, '测试一下', '0');

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
  `alias` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_datasource
-- ----------------------------
INSERT INTO `sys_datasource` VALUES (1, 'entfrm', 'com.mysql.cj.jdbc.Driver', 'jdbc:mysql://127.0.0.1:3306/entfrm?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true', 'root', '123456Aa', 'mysql_entfrm_1', 'entfrm', '2020-02-21 11:37:30', 'entfrm', '2020-03-25 13:02:35', '', '0');

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '用户性别', 'user_sex', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:40', '用户性别列表', '0');
INSERT INTO `sys_dict` VALUES (2, '菜单状态', 'menu_status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:41', '菜单状态列表', '0');
INSERT INTO `sys_dict` VALUES (3, '是否', 'yes_no', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '是否列表', '0');
INSERT INTO `sys_dict` VALUES (4, '状态', 'status', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-17 14:19:42', '状态列表', '0');
INSERT INTO `sys_dict` VALUES (5, '成功失败', 'success_fail', '0', '0', 'admin', '2019-08-24 10:02:57', 'admin', '2020-03-17 14:19:43', '成功失败列表', '0');
INSERT INTO `sys_dict` VALUES (6, '文件类别', 'file_type', '0', '0', 'entfrm', '2020-03-17 13:57:44', 'entfrm', '2020-03-20 22:48:19', '文件类别列表', '0');
INSERT INTO `sys_dict` VALUES (7, '数据库类型', 'datasource_type', '0', '0', 'entfrm', '2020-03-21 11:33:14', 'entfrm', '2020-03-22 09:56:10', '数据库类型列表', '0');
INSERT INTO `sys_dict` VALUES (8, '任务类型', 'job_type', '0', '0', 'entfrm', '2020-03-21 21:21:46', NULL, NULL, '任务类型列表', '0');
INSERT INTO `sys_dict` VALUES (9, '登录类型', 'login_type', '0', '0', 'entfrm', '2020-03-22 09:55:59', NULL, NULL, '登录类型列表', '0');
INSERT INTO `sys_dict` VALUES (10, '快捷方式类型', 'shortcut_type', '0', '0', 'entfrm', '2020-03-27 09:48:05', 'entfrm', '2020-03-27 10:14:27', '快捷方式类型列表', '0');

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
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (11, NULL, 'file_type', '图片', 'image', 1, 'entfrm', '2020-03-20 22:48:39', NULL, '2020-03-28 16:27:48', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (12, NULL, 'file_type', '媒体', 'media', 2, 'entfrm', '2020-03-20 22:48:48', 'entfrm', '2020-03-28 16:28:32', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (13, NULL, 'file_type', '文档', 'file', 3, 'entfrm', '2020-03-20 22:49:03', NULL, '2020-03-28 16:28:21', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (14, NULL, 'datasource_type', 'Mysql', 'com.mysql.cj.jdbc.Driver', 1, 'entfrm', '2020-03-21 11:33:59', 'entfrm', '2020-03-21 11:33:59', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (15, NULL, 'datasource_type', 'Sqlserver', 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 2, 'entfrm', '2020-03-21 11:34:59', 'entfrm', '2020-03-21 11:34:58', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (16, NULL, 'datasource_type', 'Postgresql', 'org.postgresql.Driver', 3, 'entfrm', '2020-03-21 11:36:16', NULL, '2020-03-21 11:36:15', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (17, NULL, 'job_type', 'Java类', '1', 1, 'entfrm', '2020-03-21 21:22:35', NULL, '2020-03-21 21:22:35', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (18, NULL, 'job_type', 'Spring bean名称', '2', 2, 'entfrm', '2020-03-21 21:22:50', NULL, '2020-03-21 21:22:50', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (19, NULL, 'job_type', 'Rest调用', '3', 3, 'entfrm', '2020-03-21 21:23:06', NULL, '2020-03-21 21:23:05', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (20, NULL, 'job_type', 'Jar调用', '4', 4, 'entfrm', '2020-03-21 21:23:19', NULL, '2020-03-21 21:23:18', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (21, NULL, 'job_type', '其他', '5', 0, 'entfrm', '2020-03-21 21:23:24', NULL, '2020-03-21 21:23:24', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (22, NULL, 'login_type', '登录', '0', 1, 'entfrm', '2020-03-22 09:56:41', NULL, '2020-03-22 09:56:40', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (23, NULL, 'login_type', '退出', '1', 2, 'entfrm', '2020-03-22 09:56:51', NULL, '2020-03-22 09:56:51', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (24, NULL, 'shortcut_type', '顶部', '1', 1, 'entfrm', '2020-03-27 09:48:24', NULL, '2020-03-27 09:48:23', NULL, '0');
INSERT INTO `sys_dict_data` VALUES (25, NULL, 'shortcut_type', '首页', '2', 2, 'entfrm', '2020-03-27 09:48:38', NULL, '2020-03-27 09:48:38', NULL, '0');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
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
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `job_order` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组内执行顺利，值越大执行优先级越高，最大值9，最小值1',
  `job_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他',
  `execute_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'job_type=3时，rest调用地址，仅支持rest get协议,需要增加String返回值，0成功，1失败;job_type=4时，jar路径;其它值为空',
  `params_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '错误策略（1立即执行 2执行一次 3放弃执行）',
  `job_tenant_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '1、多租户任务;2、非多租户任务',
  `job_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（1、未发布;2、运行中;3、暂停;4、删除;）',
  `job_execute_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1异常）',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '初次执行时间',
  `previous_time` datetime(0) NULL DEFAULT NULL COMMENT '上次执行时间',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT '下次执行时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_id` int(11) NOT NULL COMMENT '任务id',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `job_order` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组内执行顺利，值越大执行优先级越高，最大值9，最小值1',
  `job_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他',
  `execute_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'job_type=3时，rest调用地址，仅支持post协议;job_type=4时，jar路径;其它值为空',
  `params_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `job_log_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `execute_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务执行日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `login_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录类型',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户代理',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (44, '文件管理', 1, NULL, 'C', 'fileInfo', 'system/fileInfo/index', NULL, 'zip', 8, '0', 'entfrm', '2020-03-17 17:56:28', 'entfrm', '2020-03-20 22:33:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (45, '终端管理', 1, NULL, 'C', 'clientDetails', 'system/clientDetails/index', NULL, 'phone', 9, '0', 'entfrm', '2020-03-17 17:57:46', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (46, '数据备份', 1, NULL, 'C', 'backup', 'system/backup/index', NULL, 'date-range', 11, '0', 'entfrm', '2020-03-17 18:02:21', NULL, '2020-03-18 22:20:28', NULL, '0');
INSERT INTO `sys_menu` VALUES (47, '令牌管理', 2, NULL, 'C', 'token', 'monitor/token/index', NULL, 'post', 1, '1', 'entfrm', '2020-03-17 17:59:55', 'entfrm', '2020-03-29 22:10:41', NULL, '1');
INSERT INTO `sys_menu` VALUES (48, '定时任务', 2, NULL, 'C', 'job', 'monitor/job/index', NULL, 'time-range', 2, '0', 'entfrm', '2020-03-17 18:08:23', NULL, '2020-03-18 22:20:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (49, '数据监控', 2, NULL, 'C', 'druid', 'monitor/druid/index', NULL, 'druid', 3, '0', 'entfrm', '2020-03-17 18:08:56', NULL, '2020-03-20 18:53:07', NULL, '0');
INSERT INTO `sys_menu` VALUES (50, '服务监控', 2, NULL, 'C', 'server', 'monitor/server/index', NULL, 'server', 4, '0', 'entfrm', '2020-03-17 18:09:39', 'entfrm', '2020-03-20 19:23:24', NULL, '0');
INSERT INTO `sys_menu` VALUES (51, 'API监控', 2, NULL, 'C', 'apiStat', 'monitor/apiStat/index', NULL, 'chart', 5, '0', 'entfrm', '2020-03-17 18:15:13', 'entfrm', '2020-03-20 22:57:03', NULL, '0');
INSERT INTO `sys_menu` VALUES (52, '日志监控', 2, NULL, 'M', 'log', '#', NULL, 'monitor', 6, '0', 'entfrm', '2020-03-17 18:12:01', NULL, '2020-03-18 23:00:39', NULL, '0');
INSERT INTO `sys_menu` VALUES (53, '登录日志', 52, NULL, 'C', 'loginLog', 'monitor/loginLog/index', NULL, 'logininfor', 1, '0', 'entfrm', '2020-03-17 18:12:56', NULL, '2020-03-18 22:31:53', NULL, '0');
INSERT INTO `sys_menu` VALUES (54, '操作日志', 52, NULL, 'C', 'operLog', 'monitor/operLog/index', NULL, 'log', 2, '0', 'entfrm', '2020-03-17 18:13:52', 'entfrm', '2020-03-18 22:31:36', NULL, '0');
INSERT INTO `sys_menu` VALUES (55, '数据管理', 3, NULL, 'M', 'data', '#', NULL, 'star', 1, '0', 'entfrm', '2020-03-17 18:18:38', 'entfrm', '2020-03-21 11:09:59', NULL, '0');
INSERT INTO `sys_menu` VALUES (56, 'API管理', 3, NULL, 'M', 'api', '#', NULL, 'drag', 2, '0', 'entfrm', '2020-03-17 18:19:52', 'entfrm', '2020-03-17 18:23:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (57, '智能表单', 3, NULL, 'M', 'form', '#', NULL, 'form', 3, '0', 'entfrm', '2020-03-17 18:21:32', 'entfrm', '2020-03-24 17:57:17', NULL, '0');
INSERT INTO `sys_menu` VALUES (58, '工作流', 3, NULL, 'M', 'activiti', '#', NULL, 'skill', 4, '0', 'entfrm', '2020-03-17 18:22:36', 'entfrm', '2020-03-20 23:09:48', NULL, '0');
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
INSERT INTO `sys_menu` VALUES (69, '备份新增', 46, NULL, 'F', NULL, '#', 'backup_add', NULL, 1, '0', 'entfrm', '2020-03-20 21:59:58', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (70, '备份还原', 46, NULL, 'F', NULL, '#', 'backup_restore', NULL, 2, '0', 'entfrm', '2020-03-20 22:00:23', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (71, '备份删除', 46, NULL, 'F', NULL, '#', 'backup_del', NULL, 3, '0', 'entfrm', '2020-03-20 22:00:41', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (72, '备份查看', 46, NULL, 'F', NULL, '#', 'backup_view', NULL, 4, '0', 'entfrm', '2020-03-20 22:44:05', NULL, '2020-03-20 22:44:39', NULL, '0');
INSERT INTO `sys_menu` VALUES (73, '文件上传', 44, NULL, 'F', NULL, '#', 'fileInfo_add', NULL, 1, '0', 'entfrm', '2020-03-20 22:41:42', NULL, '2020-03-20 22:44:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (74, '文件启用', 44, NULL, 'F', NULL, '#', 'fileInfo_edit', NULL, 2, '0', 'entfrm', '2020-03-20 22:42:07', 'entfrm', '2020-03-20 22:44:32', NULL, '0');
INSERT INTO `sys_menu` VALUES (75, '文件删除', 44, NULL, 'F', NULL, '#', 'fileInfo_del', NULL, 3, '0', 'entfrm', '2020-03-20 22:42:30', NULL, '2020-03-20 22:44:29', NULL, '0');
INSERT INTO `sys_menu` VALUES (76, '文件查看', 44, NULL, 'F', NULL, '#', 'fileInfo_view', NULL, 4, '0', 'entfrm', '2020-03-20 22:43:06', NULL, '2020-03-20 22:44:26', NULL, '0');
INSERT INTO `sys_menu` VALUES (77, '文件分享', 44, NULL, 'F', NULL, '#', 'fileInfo_share', NULL, 5, '0', 'entfrm', '2020-03-20 22:43:37', 'entfrm', '2020-03-20 22:44:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (78, '数据库管理', 55, NULL, 'C', 'datasource', 'devtool/datasource/index', NULL, 'druid', 1, '0', 'entfrm', '2020-03-21 11:05:47', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (79, '数据表管理', 55, NULL, 'C', 'datatable', 'devtool/datatable/index', NULL, 'table', 2, '0', 'entfrm', '2020-03-21 11:07:23', 'entfrm', '2020-03-21 12:04:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (80, '数据源管理', 55, NULL, 'C', 'dataset', 'devtool/dataset/index', NULL, 'row', 3, '0', 'entfrm', '2020-03-21 11:08:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (81, '数据库新增', 78, NULL, 'F', NULL, '#', 'datasource_add', NULL, 1, '0', 'entfrm', '2020-03-21 11:27:26', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (82, '数据库修改', 78, NULL, 'F', NULL, '#', 'datasource_edit', NULL, 2, '0', 'entfrm', '2020-03-21 11:27:46', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (83, '数据库删除', 78, NULL, 'F', NULL, '#', 'datasource_del', NULL, 3, '0', 'entfrm', '2020-03-21 11:27:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (84, '数据库查看', 78, NULL, 'F', NULL, '#', 'datasource_view', NULL, 4, '0', 'entfrm', '2020-03-21 11:28:11', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (85, '模型管理', 58, NULL, 'C', 'model', 'activiti/model/index', NULL, 'edit', 1, '0', 'entfrm', '2020-03-24 12:48:54', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (86, '模型新增', 85, NULL, 'F', NULL, '#', 'model_add', NULL, 1, '0', 'entfrm', '2020-03-24 12:52:47', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (87, '模型删除', 85, NULL, 'F', NULL, '#', 'model_del', NULL, 2, '0', 'entfrm', '2020-03-24 12:53:43', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (88, '模型查看', 85, NULL, 'F', NULL, '#', 'model_view', NULL, 3, '0', 'entfrm', '2020-03-24 12:53:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (89, '模型部署', 85, NULL, 'F', NULL, '#', 'model_deploy', NULL, 4, '0', 'entfrm', '2020-03-24 12:54:19', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (90, '表新增', 79, NULL, 'F', NULL, '#', 'datatable_add', NULL, 1, '0', 'entfrm', '2020-03-25 14:59:45', 'entfrm', '2020-03-25 15:00:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (91, '表修改', 79, NULL, 'F', NULL, '#', 'datatable_edit', NULL, 2, '0', 'entfrm', '2020-03-25 15:00:31', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (92, '表删除', 79, NULL, 'F', NULL, '#', 'datatable_del', NULL, 3, '0', 'entfrm', '2020-03-25 15:00:49', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (93, '表查看', 79, NULL, 'F', NULL, '#', 'datatable_view', NULL, 4, '0', 'entfrm', '2020-03-25 15:01:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (94, '表配置', 79, NULL, 'F', NULL, '#', 'datatable_config', NULL, 5, '0', 'entfrm', '2020-03-25 15:02:39', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (95, '代码生成', 79, NULL, 'F', NULL, '#', 'datatable_gen', NULL, 6, '0', 'entfrm', '2020-03-25 15:03:06', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (96, '任务新增', 48, NULL, 'F', NULL, '#', 'job_add', NULL, 1, '0', 'entfrm', '2020-03-26 15:34:44', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (97, '任务编辑', 48, NULL, 'F', NULL, '#', 'job_edit', NULL, 2, '0', 'entfrm', '2020-03-26 15:34:59', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (98, '任务删除', 48, NULL, 'F', NULL, '#', 'job_del', NULL, 3, '0', 'entfrm', '2020-03-26 15:35:17', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (99, '任务查看', 48, NULL, 'F', NULL, '#', 'job_view', NULL, 4, '0', 'entfrm', '2020-03-26 15:35:32', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (100, '任务暂定', 48, NULL, 'F', NULL, '#', 'job_stop', NULL, 5, '0', 'entfrm', '2020-03-26 15:37:16', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (101, '任务启动', 48, NULL, 'F', NULL, '#', 'job_start', NULL, 6, '0', 'entfrm', '2020-03-26 15:37:35', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (102, '任务重置', 48, NULL, 'F', NULL, '#', 'job_refresh', NULL, 7, '0', 'entfrm', '2020-03-26 15:37:56', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (103, '任务日志查看', 48, NULL, 'F', NULL, '#', 'jobLog_view', NULL, 8, '0', 'entfrm', '2020-03-26 15:38:19', 'entfrm', '2020-03-26 15:38:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (104, '任务日志删除', 48, NULL, 'F', NULL, '#', 'jobLog_del', NULL, 9, '0', 'entfrm', '2020-03-26 15:38:51', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (105, '快捷方式新增', 43, NULL, 'F', NULL, '#', 'shortcut_add', NULL, 1, '0', 'entfrm', '2020-03-27 09:44:13', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (106, '快捷方式修改', 43, NULL, 'F', NULL, '#', 'shortcut_edit', NULL, 2, '0', 'entfrm', '2020-03-27 09:44:36', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (107, '快捷方式删除', 43, NULL, 'F', NULL, '#', 'shortcut_del', NULL, 3, '0', 'entfrm', '2020-03-27 09:44:57', NULL, NULL, NULL, '0');
INSERT INTO `sys_menu` VALUES (108, '快捷方式查看', 43, NULL, 'F', NULL, '#', 'shortcut_view', NULL, 4, '0', 'entfrm', '2020-03-27 09:45:16', NULL, NULL, NULL, '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 73);
INSERT INTO `sys_role_menu` VALUES (1, 74);
INSERT INTO `sys_role_menu` VALUES (1, 75);
INSERT INTO `sys_role_menu` VALUES (1, 76);
INSERT INTO `sys_role_menu` VALUES (1, 77);
INSERT INTO `sys_role_menu` VALUES (1, 45);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 96);
INSERT INTO `sys_role_menu` VALUES (1, 97);
INSERT INTO `sys_role_menu` VALUES (1, 98);
INSERT INTO `sys_role_menu` VALUES (1, 99);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 50);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 63);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 66);
INSERT INTO `sys_role_menu` VALUES (1, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 78);
INSERT INTO `sys_role_menu` VALUES (1, 81);
INSERT INTO `sys_role_menu` VALUES (1, 82);
INSERT INTO `sys_role_menu` VALUES (1, 83);
INSERT INTO `sys_role_menu` VALUES (1, 84);
INSERT INTO `sys_role_menu` VALUES (1, 79);
INSERT INTO `sys_role_menu` VALUES (1, 90);
INSERT INTO `sys_role_menu` VALUES (1, 91);
INSERT INTO `sys_role_menu` VALUES (1, 92);
INSERT INTO `sys_role_menu` VALUES (1, 93);
INSERT INTO `sys_role_menu` VALUES (1, 94);
INSERT INTO `sys_role_menu` VALUES (1, 95);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 55);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_shortcut
-- ----------------------------
INSERT INTO `sys_shortcut` VALUES (1, '登录日志', '1', 'form', '/system/loginLog', 1, 'entfrm', '2020-03-27 10:09:11', '', '2020-03-27 10:12:39', '1', '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'entfrm', '管理员', '00', '$2a$10$N0EAFRVjSYipHK/HDqzuEuVJZBabVTD7Z.NrXrnas984.1wjkaLK.', 1, '重庆总公司', '111@qq.com', '15611111111', '0', 'http://localhost:8888/profile/avatar/avatar1585318399181.png', '0', '', NULL, 'entfrm', '2020-03-13 20:56:44', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (2, 'test01', '测试01', '00', '$2a$10$Yq7NRB8VO4n1AxcThlwJweM1WE8fwvFRl0krQkNihGxiCRW/Gfp/.', 1, '重庆总公司', '', '', '0', '', '0', '', NULL, 'entfrm', '2020-03-14 18:14:11', '', NULL, NULL, '0');
INSERT INTO `sys_user` VALUES (3, 'test02', '测试02', '00', '', 3, NULL, '222@qq.com', '15622222222', '0', '', '0', '', NULL, NULL, NULL, '', '2020-03-16 11:49:31', '123', '1');
INSERT INTO `sys_user` VALUES (4, 'test03', '测试03', '00', '$2a$10$9fdDK5mw3ruAoPiZMrDL9.pWvxJ/97NBAT3Gwbe3SG/BqPv8wyoa6', 3, NULL, '333@qq.com', '15633333333', '0', '', '1', '', NULL, 'entfrm', '2020-03-17 12:52:21', '', NULL, NULL, '1');
INSERT INTO `sys_user` VALUES (5, '测试03', 'test03', '00', '$2a$10$AfdE4AEdACZZMwMlpre/ueVAOTCJYGzaONKyp4iv4BId1jrljVI7q', 3, '昆明分公司', '333@qq.com', '15633333333', '0', '', '1', '', NULL, 'entfrm', '2020-03-19 17:47:31', '', '2020-03-19 18:32:46', NULL, '0');
INSERT INTO `sys_user` VALUES (7, 'test04', '测试04', '00', '$2a$10$44Iptk07l4Y26/67.etGROK3oQipGnEPRt8zeJejjt1m9I8zB6LCS', 3, '昆明分公司', '123', '156', '1', '', '0', '', NULL, 'entfrm', '2020-03-27 21:22:26', '', NULL, NULL, '0');

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
