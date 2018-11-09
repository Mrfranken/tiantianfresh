/*
Navicat MySQL Data Transfer

Source Server         : wsj1
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : tiantian

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-11-09 17:40:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`codename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`, `codename`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=28

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add user', '4', 'add_user'), ('11', 'Can change user', '4', 'change_user'), ('12', 'Can delete user', '4', 'delete_user'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session'), ('19', 'Can add user info', '7', 'add_userinfo'), ('20', 'Can change user info', '7', 'change_userinfo'), ('21', 'Can delete user info', '7', 'delete_userinfo'), ('22', 'Can add good category', '8', 'add_goodcategory'), ('23', 'Can change good category', '8', 'change_goodcategory'), ('24', 'Can delete good category', '8', 'delete_goodcategory'), ('25', 'Can add goods info', '9', 'add_goodsinfo'), ('26', 'Can change goods info', '9', 'change_goodsinfo'), ('27', 'Can delete goods info', '9', 'delete_goodsinfo');
COMMIT;

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_login`  datetime(6) NULL DEFAULT NULL ,
`is_superuser`  tinyint(1) NOT NULL ,
`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`first_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_staff`  tinyint(1) NOT NULL ,
`is_active`  tinyint(1) NOT NULL ,
`date_joined`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$E5mQfPPcYmcI$VJihm+FH25O60GyjbMFvEdRbgR13luJmeeism29vgLo=', '2018-11-09 06:29:11.722359', '1', 'sijie', '', '', 'nihao@163.com', '1', '1', '2018-10-26 04:24:23.996233');
COMMIT;

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq` (`user_id`, `group_id`) USING BTREE ,
INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`, `permission_id`) USING BTREE ,
INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `df_goods_goodcategory`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodcategory`;
CREATE TABLE `df_goods_goodcategory` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`category`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_delete`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of df_goods_goodcategory
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_goodcategory` VALUES ('15', '新鲜水果', '0'), ('16', '海鲜水产', '0'), ('17', '猪牛羊肉', '0'), ('18', '禽类蛋品', '0'), ('19', '新鲜蔬菜', '0'), ('20', '速冻食品', '0');
COMMIT;

-- ----------------------------
-- Table structure for `df_goods_goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodsinfo`;
CREATE TABLE `df_goods_goodsinfo` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`gtitle`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gpic`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gprice`  decimal(7,2) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL ,
`gunit`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gclick`  int(11) NOT NULL ,
`gintro`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ginventory`  int(11) NOT NULL ,
`gcontent`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gadv`  tinyint(1) NOT NULL ,
`gtype_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_goodcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_goodcategory_id` (`gtype_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=31

;

-- ----------------------------
-- Records of df_goods_goodsinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_goodsinfo` VALUES ('6', '大兴大棚草莓', 'df_goods/goods003.jpg', '16.80', '0', '500g', '30', '', '1000', '', '1', '15'), ('7', '玫瑰香葡萄', '', '18.80', '0', '500g', '30', '', '1000', '', '0', '15'), ('8', '进口柠檬', 'df_goods/goods001.jpg', '3.90', '0', '500g', '69', '', '1000', '', '1', '15'), ('9', '青岛野生海捕大青虾', '', '44.00', '0', '500g', '82', '', '1000', '', '1', '16'), ('10', '扇贝', 'df_goods/goods019.jpg', '44.00', '0', '500g', '200', '', '1000', '', '1', '16'), ('11', '冷冻秋刀鱼', '', '44.00', '0', '500g', '10', '', '20', '', '0', '16'), ('12', '牛肉', '', '33.00', '0', '500g', '40', '', '50', '', '1', '17'), ('13', '羊肉', '', '33.00', '0', '500g', '500', '', '60', '', '1', '17'), ('14', '鸡胸脯', '', '20.00', '0', '500g', '80', '', '500', '', '1', '17'), ('15', '鸡蛋', '', '2.00', '0', '50g', '500', '', '1000', '', '1', '18'), ('16', '鸭蛋', '', '2.00', '0', '60g', '60', '', '60', '', '1', '18'), ('17', '鹅蛋', '', '4.00', '0', '70g', '70', '', '70', '', '1', '18'), ('18', '菠菜', '', '3.00', '0', '', '0', '', '0', '', '1', '19'), ('19', '西红柿', '', '4.00', '0', '', '0', '', '0', '', '1', '19'), ('20', '山芋', '', '5.00', '0', '', '0', '', '0', '', '1', '19'), ('21', '饺子', '', '3.00', '0', '', '0', '', '0', '', '1', '20'), ('22', '包子', '', '1.00', '0', '', '0', '', '0', '', '1', '20'), ('23', '汤圆', '', '2.00', '0', '', '0', '', '0', '', '1', '20'), ('24', '海南香蕉', '', '3.30', '0', '500g', '13', '', '1000', '', '0', '15'), ('25', '青苹果', 'df_goods/goods010.jpg', '5.00', '0', '500g', '40', '', '1000', '', '1', '15'), ('26', '奇异果', 'df_goods/goods012.jpg', '25.70', '0', '500', '100', '', '1000', '', '1', '15'), ('27', '基围虾', '', '24.00', '0', '500g', '30', '', '300', '', '1', '16'), ('28', '螃蟹', 'df_goods/2018-03-21_170533.jpg', '70.00', '0', '500g', '200', '', '40', '', '1', '16'), ('29', '猪肉', '', '20.00', '0', '500g', '400', '', '400', '', '1', '17'), ('30', '鹌鹑蛋', '', '20.00', '0', '80g', '88', '', '88', '', '1', '18');
COMMIT;

-- ----------------------------
-- Table structure for `df_user_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `df_user_userinfo`;
CREATE TABLE `df_user_userinfo` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`uname`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`upwd`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`umail`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ushouhuo`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`uaddress`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`upostcode`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`uphone`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of df_user_userinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_user_userinfo` VALUES ('5', 'wsjwin0', '1bbd886460827015e5d605ed44252251', 'wsj973507837@163.com', '', '', '', ''), ('6', 'wsjwin1', '1bbd886460827015e5d605ed44252251', '111111111@163.com', '', '', '', ''), ('18', 'wsjwin', '1bbd886460827015e5d605ed44252251', '111111111@163.com', '', '', '', ''), ('19', 'wsjwin2', '1bbd886460827015e5d605ed44252251', 'wsj9735078379989@163.com', '', '', '', ''), ('20', 'vince', '7c497868c9e6d3e4cf2e87396372cd3b', 'vince@qq.com', '文思杰', '\r\n        mars                    ', '888888', '13208005777');
COMMIT;

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime(6) NOT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  smallint(5) UNSIGNED NOT NULL ,
`change_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES ('1', '2018-11-09 06:18:36.885359', '13', '时令水果', '1', 'Added.', '8', '1'), ('2', '2018-11-09 06:20:35.369359', '14', '时令水果', '1', 'Added.', '8', '1'), ('3', '2018-11-09 06:21:28.644359', '15', '新鲜水果', '1', 'Added.', '8', '1'), ('4', '2018-11-09 06:22:20.659359', '15', '新鲜水果', '2', 'Added goods info \"草莓\". Added goods info \"葡萄\". Added goods info \"柠檬\".', '8', '1'), ('5', '2018-11-09 06:23:12.835359', '16', '海鲜水产', '1', 'Added. Added goods info \"青岛野生海捕大青虾\". Added goods info \"扇贝\". Added goods info \"冷冻秋刀鱼\".', '8', '1'), ('6', '2018-11-09 06:23:57.031359', '17', '猪牛羊肉', '1', 'Added. Added goods info \"维多利亚葡萄\". Added goods info \"维多利亚葡萄\". Added goods info \"维多利亚葡萄\".', '8', '1'), ('7', '2018-11-09 06:24:36.815359', '18', '禽类蛋品', '1', 'Added. Added goods info \"鸡蛋\". Added goods info \"鸭蛋\". Added goods info \"鹅蛋\".', '8', '1'), ('8', '2018-11-09 06:25:09.280359', '19', '新鲜蔬菜', '1', 'Added. Added goods info \"菠菜\". Added goods info \"西红柿\". Added goods info \"山芋\".', '8', '1'), ('9', '2018-11-09 06:25:38.247359', '20', '速冻食品', '1', 'Added. Added goods info \"饺子\". Added goods info \"包子\". Added goods info \"汤圆\".', '8', '1'), ('10', '2018-11-09 06:52:29.952359', '6', '大兴大棚草莓', '2', 'Changed gtitle, gprice, gunit, gclick and ginventory.', '9', '1'), ('11', '2018-11-09 06:56:36.036359', '15', '新鲜水果', '2', 'Added goods info \"海南香蕉\". Added goods info \"青苹果\". Added goods info \"奇异果\". Changed gadv for goods info \"大兴大棚草莓\". Changed gtitle, gprice, gunit, gclick and ginventory for goods info \"玫瑰香葡萄\". Changed gtitle, gprice, gunit, gclick, ginventory and gadv for goods info \"进口柠檬\".', '8', '1'), ('12', '2018-11-09 06:59:24.783359', '16', '海鲜水产', '2', 'Added goods info \"基围虾\". Added goods info \"螃蟹\". Changed gunit, gclick, ginventory and gadv for goods info \"青岛野生海捕大青虾\". Changed gunit, gclick, ginventory and gadv for goods info \"扇贝\". Changed gunit, gclick and ginventory for goods info \"冷冻秋刀鱼\".', '8', '1'), ('13', '2018-11-09 07:05:24.507359', '17', '猪牛羊肉', '2', 'Added goods info \"猪肉\". Changed gtitle, gunit, gclick, ginventory and gadv for goods info \"牛肉\". Changed gtitle, gunit, gclick, ginventory and gadv for goods info \"羊肉\". Changed gtitle, gprice, gunit, gclick, ginventory and gadv for goods info \"鸡胸脯\".', '8', '1'), ('14', '2018-11-09 07:07:00.244359', '18', '禽类蛋品', '2', 'Added goods info \"鹌鹑蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鸡蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鸭蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鹅蛋\".', '8', '1'), ('15', '2018-11-09 07:07:15.739359', '20', '速冻食品', '2', 'Changed gadv for goods info \"饺子\". Changed gadv for goods info \"包子\". Changed gadv for goods info \"汤圆\".', '8', '1'), ('16', '2018-11-09 07:07:29.673359', '19', '新鲜蔬菜', '2', 'Changed gadv for goods info \"菠菜\". Changed gadv for goods info \"西红柿\". Changed gadv for goods info \"山芋\".', '8', '1'), ('17', '2018-11-09 09:34:14.102959', '26', '奇异果', '2', 'Changed gpic.', '9', '1'), ('18', '2018-11-09 09:35:22.452959', '8', '进口柠檬', '2', 'Changed gpic.', '9', '1'), ('19', '2018-11-09 09:35:34.296959', '25', '青苹果', '2', 'Changed gpic.', '9', '1'), ('20', '2018-11-09 09:35:56.066959', '6', '大兴大棚草莓', '2', 'Changed gpic.', '9', '1'), ('21', '2018-11-09 09:37:22.315959', '10', '扇贝', '2', 'Changed gpic.', '9', '1'), ('22', '2018-11-09 09:39:00.580959', '28', '螃蟹', '2', 'Changed gpic.', '9', '1');
COMMIT;

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`model`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('4', 'auth', 'user'), ('5', 'contenttypes', 'contenttype'), ('8', 'df_goods', 'goodcategory'), ('9', 'df_goods', 'goodsinfo'), ('7', 'df_user', 'userinfo'), ('6', 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`applied`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-10-24 06:22:03.759949'), ('2', 'auth', '0001_initial', '2018-10-24 06:22:04.845949'), ('3', 'admin', '0001_initial', '2018-10-24 06:22:05.071949'), ('4', 'admin', '0002_logentry_remove_auto_add', '2018-10-24 06:22:05.129949'), ('5', 'contenttypes', '0002_remove_content_type_name', '2018-10-24 06:22:05.368949'), ('6', 'auth', '0002_alter_permission_name_max_length', '2018-10-24 06:22:05.519949'), ('7', 'auth', '0003_alter_user_email_max_length', '2018-10-24 06:22:05.632949'), ('8', 'auth', '0004_alter_user_username_opts', '2018-10-24 06:22:05.650949'), ('9', 'auth', '0005_alter_user_last_login_null', '2018-10-24 06:22:05.737949'), ('10', 'auth', '0006_require_contenttypes_0002', '2018-10-24 06:22:05.744949'), ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-10-24 06:22:05.759949'), ('12', 'df_user', '0001_initial', '2018-10-24 06:22:05.825949'), ('13', 'sessions', '0001_initial', '2018-10-24 06:22:05.903949'), ('14', 'df_goods', '0001_initial', '2018-11-08 06:02:35.256326'), ('15', 'df_user', '0002_auto_20181108_1402', '2018-11-08 06:02:35.461326');
COMMIT;

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
`session_key`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`session_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expire_date`  datetime(6) NOT NULL ,
PRIMARY KEY (`session_key`),
INDEX `django_session_de54fa62` (`expire_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('e4xhwca7n79tqt0jsp40t7kzxiur3cgl', 'ZmRiNDc5MTc2ZjE3ZmNmM2VlMmMxNmM3MjlmNDRjOGEwMmMzOTFhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWNiMjlkYjgxZDY3ZTBiODlkYmY0YmMxZDMzOTNlN2RhODljMDg0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-11-23 06:18:27.216359'), ('m4uolysuskxwnmss2coganpgl2frnqvy', 'MTAxYTU4ZmY4NjE3MjI0NTlmNGZmNjAzN2Q3YzhmMzdmYmQ1ZmJiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Y2IyOWRiODFkNjdlMGI4OWRiZjRiYzFkMzM5M2U3ZGE4OWMwODQxIn0=', '2018-11-23 05:55:57.468359'), ('wviaboz4nr8h75ib8ze8gkmxpranvpn3', 'YTNiMjJlMTkzNjQyYmM4ZGViMmJmZmMzMzYzN2U0YjQzMzJhOGE0ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1Y2IyOWRiODFkNjdlMGI4OWRiZjRiYzFkMzM5M2U3ZGE4OWMwODQxIn0=', '2018-11-09 04:24:42.006284');
COMMIT;

-- ----------------------------
-- Auto increment value for `auth_group`
-- ----------------------------
ALTER TABLE `auth_group` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_group_permissions`
-- ----------------------------
ALTER TABLE `auth_group_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_permission`
-- ----------------------------
ALTER TABLE `auth_permission` AUTO_INCREMENT=28;

-- ----------------------------
-- Auto increment value for `auth_user`
-- ----------------------------
ALTER TABLE `auth_user` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `auth_user_groups`
-- ----------------------------
ALTER TABLE `auth_user_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_user_user_permissions`
-- ----------------------------
ALTER TABLE `auth_user_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `df_goods_goodcategory`
-- ----------------------------
ALTER TABLE `df_goods_goodcategory` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `df_goods_goodsinfo`
-- ----------------------------
ALTER TABLE `df_goods_goodsinfo` AUTO_INCREMENT=31;

-- ----------------------------
-- Auto increment value for `df_user_userinfo`
-- ----------------------------
ALTER TABLE `df_user_userinfo` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `django_admin_log`
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for `django_content_type`
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `django_migrations`
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=16;
