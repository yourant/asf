/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : asf

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 24/04/2021 22:16:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asf_account_post
-- ----------------------------
DROP TABLE IF EXISTS `asf_account_post`;
CREATE TABLE `asf_account_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL COMMENT '账户id',
  `post_id` bigint NOT NULL COMMENT '岗位id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_asf_account_post_account_id` (`account_id`),
  KEY `IX_asf_account_post_post_id` (`post_id`),
  CONSTRAINT `account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `asf_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `asf_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账户岗位中间表';

-- ----------------------------
-- Table structure for asf_account_role
-- ----------------------------
DROP TABLE IF EXISTS `asf_account_role`;
CREATE TABLE `asf_account_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL COMMENT '账户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_asf_account_role_account_id` (`account_id`),
  KEY `IX_asf_account_role_role_id` (`role_id`),
  CONSTRAINT `account_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `asf_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `asf_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账户角色中间表';

-- ----------------------------
-- Table structure for asf_accounts
-- ----------------------------
DROP TABLE IF EXISTS `asf_accounts`;
CREATE TABLE `asf_accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `department_id` bigint DEFAULT NULL COMMENT '部门id',
  `name` varchar(20) NOT NULL COMMENT '账户昵称',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '账户密码',
  `password_salt` varchar(255) NOT NULL COMMENT '密码加盐',
  `telphone` varchar(20) DEFAULT NULL COMMENT '账户手机号码',
  `email` varchar(30) DEFAULT NULL COMMENT '账户邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '账户头像',
  `status` tinyint DEFAULT '1' COMMENT '账户状态, 1允许登录， 0禁止登录',
  `is_deleted` tinyint DEFAULT '0' COMMENT '是否删除, 0 否, 1是',
  `sex` tinyint DEFAULT NULL COMMENT '性别 0 未知，1，男，2，女',
  `create_id` bigint DEFAULT '0' COMMENT '创建用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录ip',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_location` varchar(50) DEFAULT NULL COMMENT '最后登录位置',
  `token` varchar(1000) DEFAULT NULL COMMENT 'token',
  `refresh_token` varchar(1000) DEFAULT NULL COMMENT '刷新token',
  `expired` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `IX_asf_accounts_department_id` (`department_id`),
  KEY `IX_asf_accounts_email` (`email`),
  KEY `IX_asf_accounts_tenancy_id` (`tenancy_id`),
  KEY `IX_asf_accounts_username` (`username`),
  CONSTRAINT `FK_asf_accounts_asf_department_department_id` FOREIGN KEY (`department_id`) REFERENCES `asf_department` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_asf_accounts_asf_tenancy_tenancy_id` FOREIGN KEY (`tenancy_id`) REFERENCES `asf_tenancy` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账户表';

-- ----------------------------
-- Table structure for asf_apis
-- ----------------------------
DROP TABLE IF EXISTS `asf_apis`;
CREATE TABLE `asf_apis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission_id` bigint DEFAULT NULL COMMENT '权限id',
  `name` varchar(100) NOT NULL COMMENT 'api',
  `status` tinyint DEFAULT '1' COMMENT 'api状态',
  `type` tinyint DEFAULT NULL COMMENT 'api类型 1. openapi， 2, authapi',
  `path` varchar(500) DEFAULT NULL COMMENT 'api地址',
  `http_methods` varchar(100) DEFAULT NULL COMMENT 'http 方法',
  `is_logger` tinyint DEFAULT '0' COMMENT '是否记录日志',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  `is_system` tinyint DEFAULT '0' COMMENT '是否为系统权限 0 否， 1是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_asf_apis_path` (`path`),
  KEY `IX_asf_apis_name` (`name`),
  KEY `IX_asf_apis_permission_id` (`permission_id`),
  CONSTRAINT `api_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `asf_permission` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='api表';

-- ----------------------------
-- Table structure for asf_department
-- ----------------------------
DROP TABLE IF EXISTS `asf_department`;
CREATE TABLE `asf_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '父id',
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `enabled` tinyint DEFAULT '1' COMMENT '是否启用',
  `sort` int DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Table structure for asf_department_role
-- ----------------------------
DROP TABLE IF EXISTS `asf_department_role`;
CREATE TABLE `asf_department_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `department_id` bigint NOT NULL COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_asf_department_role_department_id` (`department_id`),
  KEY `IX_asf_department_role_role_id` (`role_id`),
  CONSTRAINT `dept_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `asf_department` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dept_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `asf_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门-角色中间表';

-- ----------------------------
-- Table structure for asf_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `asf_dictionary`;
CREATE TABLE `asf_dictionary` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(255) DEFAULT NULL COMMENT '字典编码',
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `key` varchar(255) DEFAULT NULL COMMENT '字典键',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `options` varchar(255) DEFAULT NULL COMMENT '字典额外配置',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_asf_dictionary_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典表';

-- ----------------------------
-- Table structure for asf_loginfos
-- ----------------------------
DROP TABLE IF EXISTS `asf_loginfos`;
CREATE TABLE `asf_loginfos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL COMMENT '账户id',
  `account_name` varchar(32) DEFAULT NULL COMMENT '账户名称',
  `type` tinyint NOT NULL COMMENT '日志类型，1： 登录日志， 2:操作日志,3 错误日志',
  `subject` varchar(200) NOT NULL COMMENT '登录方式',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `client_location` varchar(50) DEFAULT NULL COMMENT '客户端位置',
  `permission_id` bigint DEFAULT NULL COMMENT '权限id',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `api_address` varchar(500) DEFAULT NULL COMMENT 'api请求地址',
  `api_request` text COMMENT 'api请求数据',
  `api_response` text COMMENT 'api响应数据',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日志表';

-- ----------------------------
-- Table structure for asf_permission
-- ----------------------------
DROP TABLE IF EXISTS `asf_permission`;
CREATE TABLE `asf_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '权限代码',
  `parent_id` bigint DEFAULT '0' COMMENT '上级id',
  `name` varchar(100) NOT NULL COMMENT '权限名',
  `type` tinyint NOT NULL COMMENT '权限类型 1. 菜单条目权限， 2, 菜单目录,3 功能',
  `is_system` tinyint DEFAULT '0' COMMENT '是否为系统权限 0 否， 1是',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT '0' COMMENT '排序',
  `enable` tinyint DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_asf_permission_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';

-- ----------------------------
-- Table structure for asf_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `asf_permission_menu`;
CREATE TABLE `asf_permission_menu` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission_id` bigint NOT NULL COMMENT '权限id',
  `title` varchar(20) DEFAULT NULL COMMENT '菜单标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '菜单副标题',
  `icon` varchar(250) DEFAULT NULL COMMENT '菜单图标',
  `menu_hidden` tinyint DEFAULT '0' COMMENT '是否隐藏, 0 否 1 是',
  `menu_url` varchar(250) DEFAULT NULL COMMENT '菜单地址',
  `external_link` varchar(250) DEFAULT NULL COMMENT '外部链接地址',
  `menu_redirect` varchar(250) DEFAULT NULL COMMENT '菜单重定向地址',
  `description` varchar(500) DEFAULT NULL COMMENT '菜单备注',
  `translate` varchar(500) DEFAULT NULL COMMENT '菜单多语言',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_asf_permission_menu_permission_id` (`permission_id`),
  UNIQUE KEY `IX_asf_permission_menu_menu_url` (`menu_url`),
  UNIQUE KEY `IX_asf_permission_menu_title` (`title`),
  CONSTRAINT `FK_asf_permission_menu_asf_permission_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `asf_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- ----------------------------
-- Table structure for asf_post
-- ----------------------------
DROP TABLE IF EXISTS `asf_post`;
CREATE TABLE `asf_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `name` varchar(255) NOT NULL COMMENT '岗位名称名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_id` bigint DEFAULT '0' COMMENT '创建者id',
  `description` varchar(255) DEFAULT NULL COMMENT '岗位名称名称',
  `enabled` tinyint DEFAULT '1' COMMENT '是否启用, 0 禁用 1 启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位表';

-- ----------------------------
-- Table structure for asf_role
-- ----------------------------
DROP TABLE IF EXISTS `asf_role`;
CREATE TABLE `asf_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  `enable` tinyint DEFAULT '1' COMMENT '是否启用',
  `create_id` bigint NOT NULL DEFAULT '0' COMMENT '创建用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- ----------------------------
-- Table structure for asf_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `asf_role_permission`;
CREATE TABLE `asf_role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission_id` bigint NOT NULL COMMENT '权限id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IX_asf_role_permission_permission_id` (`permission_id`),
  KEY `IX_asf_role_permission_role_id` (`role_id`),
  CONSTRAINT `permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `asf_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `asf_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限中间表';

-- ----------------------------
-- Table structure for asf_scheduled_task
-- ----------------------------
DROP TABLE IF EXISTS `asf_scheduled_task`;
CREATE TABLE `asf_scheduled_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '任务名称',
  `description` varchar(255) DEFAULT NULL COMMENT '调度任务描述',
  `url` varchar(255) DEFAULT NULL COMMENT '调度任务执行地址',
  `code` varchar(255) DEFAULT NULL COMMENT '调度任务执行代码只限于c#代码',
  `task_username` varchar(255) DEFAULT NULL COMMENT '任务负责人',
  `error_email` varchar(255) DEFAULT NULL COMMENT '告警通知邮箱',
  `cron` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `fail_stop` tinyint DEFAULT '0' COMMENT '失败后暂停执行, 0:失败后不停止，1,失败后停止',
  `task_status` tinyint DEFAULT '0' COMMENT '任务状态， 0:停止,1:启动',
  `params_content` varchar(255) DEFAULT NULL COMMENT '参数内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务调度表';

-- ----------------------------
-- Table structure for asf_security_token
-- ----------------------------
DROP TABLE IF EXISTS `asf_security_token`;
CREATE TABLE `asf_security_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint DEFAULT NULL COMMENT '账户id',
  `token` varchar(1000) DEFAULT NULL COMMENT '黑名单token',
  `token_expired` datetime DEFAULT NULL COMMENT '黑名单token过期时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='token黑名单表';

-- ----------------------------
-- Table structure for asf_tenancy
-- ----------------------------
DROP TABLE IF EXISTS `asf_tenancy`;
CREATE TABLE `asf_tenancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '租户名称',
  `sort` int DEFAULT '0' COMMENT '排序',
  `level` int DEFAULT '0' COMMENT '等级',
  `create_id` bigint DEFAULT '0' COMMENT '创建者id',
  `status` tinyint DEFAULT '1' COMMENT '租户状态 0禁用， 1启用',
  `is_deleted` tinyint DEFAULT '0' COMMENT '是否删除, 0 否, 1是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='多租户';

-- ----------------------------
-- Table structure for asf_translate
-- ----------------------------
DROP TABLE IF EXISTS `asf_translate`;
CREATE TABLE `asf_translate` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(250) DEFAULT NULL COMMENT '多语言名称',
  `tenancy_id` bigint DEFAULT NULL COMMENT '租户id',
  `key` varchar(500) DEFAULT NULL COMMENT '多语言key',
  `value` varchar(500) DEFAULT NULL COMMENT '多语言值',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_asf_translate_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='多语言表';

SET FOREIGN_KEY_CHECKS = 1;
