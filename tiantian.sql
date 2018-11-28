/*
Navicat MySQL Data Transfer

Source Server         : wsj1
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : tiantian

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-11-28 18:20:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user info', '7', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user info', '7', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user info', '7', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add good category', '8', 'add_goodcategory');
INSERT INTO `auth_permission` VALUES ('23', 'Can change good category', '8', 'change_goodcategory');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete good category', '8', 'delete_goodcategory');
INSERT INTO `auth_permission` VALUES ('25', 'Can add goods info', '9', 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change goods info', '9', 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete goods info', '9', 'delete_goodsinfo');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$E5mQfPPcYmcI$VJihm+FH25O60GyjbMFvEdRbgR13luJmeeism29vgLo=', '2018-11-09 06:29:11.722359', '1', 'sijie', '', '', 'nihao@163.com', '1', '1', '2018-10-26 04:24:23.996233');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `df_goods_goodcategory`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodcategory`;
CREATE TABLE `df_goods_goodcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_goodcategory
-- ----------------------------
INSERT INTO `df_goods_goodcategory` VALUES ('15', '新鲜水果', '0');
INSERT INTO `df_goods_goodcategory` VALUES ('16', '海鲜水产', '0');
INSERT INTO `df_goods_goodcategory` VALUES ('17', '猪牛羊肉', '0');
INSERT INTO `df_goods_goodcategory` VALUES ('18', '禽类蛋品', '0');
INSERT INTO `df_goods_goodcategory` VALUES ('19', '新鲜蔬菜', '0');
INSERT INTO `df_goods_goodcategory` VALUES ('20', '速冻食品', '0');

-- ----------------------------
-- Table structure for `df_goods_goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodsinfo`;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gpic` varchar(100) NOT NULL,
  `gprice` decimal(7,2) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int(11) NOT NULL,
  `gintro` varchar(200) NOT NULL,
  `ginventory` int(11) NOT NULL,
  `gcontent` longtext NOT NULL,
  `gadv` tinyint(1) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_goodcategory_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_goodcategory_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_goodcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_goodsinfo
-- ----------------------------
INSERT INTO `df_goods_goodsinfo` VALUES ('6', '大兴大棚草莓', 'df_goods/goods003.jpg', '16.80', '0', '500g', '31', '', '1000', '', '1', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('7', '玫瑰香葡萄', '', '18.80', '0', '500g', '30', '', '1000', '', '0', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('8', '进口柠檬', 'df_goods/goods001.jpg', '3.90', '0', '500g', '69', '', '1000', '', '1', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('9', '青岛野生海捕大青虾', '', '44.00', '0', '500g', '82', '', '1000', '', '1', '16');
INSERT INTO `df_goods_goodsinfo` VALUES ('10', '扇贝', 'df_goods/goods019.jpg', '44.00', '0', '500g', '200', '', '1000', '', '1', '16');
INSERT INTO `df_goods_goodsinfo` VALUES ('11', '冷冻秋刀鱼', '', '44.00', '0', '500g', '10', '', '20', '', '0', '16');
INSERT INTO `df_goods_goodsinfo` VALUES ('12', '牛肉', '', '33.00', '0', '500g', '40', '', '50', '', '1', '17');
INSERT INTO `df_goods_goodsinfo` VALUES ('13', '羊肉', '', '33.00', '0', '500g', '500', '', '60', '', '1', '17');
INSERT INTO `df_goods_goodsinfo` VALUES ('14', '鸡胸脯', '', '20.00', '0', '500g', '80', '', '500', '', '1', '17');
INSERT INTO `df_goods_goodsinfo` VALUES ('15', '鸡蛋', '', '2.00', '0', '50g', '500', '', '1000', '', '1', '18');
INSERT INTO `df_goods_goodsinfo` VALUES ('16', '鸭蛋', '', '2.00', '0', '60g', '60', '', '60', '', '1', '18');
INSERT INTO `df_goods_goodsinfo` VALUES ('17', '鹅蛋', '', '4.00', '0', '70g', '70', '', '70', '', '1', '18');
INSERT INTO `df_goods_goodsinfo` VALUES ('18', '菠菜', '', '3.00', '0', '', '0', '', '0', '', '1', '19');
INSERT INTO `df_goods_goodsinfo` VALUES ('19', '西红柿', '', '4.00', '0', '', '0', '', '0', '', '1', '19');
INSERT INTO `df_goods_goodsinfo` VALUES ('20', '山芋', '', '5.00', '0', '', '0', '', '0', '', '1', '19');
INSERT INTO `df_goods_goodsinfo` VALUES ('21', '饺子', '', '3.00', '0', '', '0', '', '0', '', '1', '20');
INSERT INTO `df_goods_goodsinfo` VALUES ('22', '包子', '', '1.00', '0', '', '0', '', '0', '', '1', '20');
INSERT INTO `df_goods_goodsinfo` VALUES ('23', '汤圆', '', '2.00', '0', '', '0', '', '0', '', '1', '20');
INSERT INTO `df_goods_goodsinfo` VALUES ('24', '海南香蕉', '', '3.30', '0', '500g', '15', '', '1000', '', '0', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('25', '青苹果', 'df_goods/goods010.jpg', '5.00', '0', '500g', '40', '', '1000', '', '1', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('26', '奇异果', 'df_goods/goods012.jpg', '25.70', '0', '500', '100', '', '1000', '', '1', '15');
INSERT INTO `df_goods_goodsinfo` VALUES ('27', '基围虾', '', '24.00', '0', '500g', '30', '', '300', '', '1', '16');
INSERT INTO `df_goods_goodsinfo` VALUES ('28', '螃蟹', 'df_goods/2018-03-21_170533.jpg', '70.00', '0', '500g', '200', '', '40', '', '1', '16');
INSERT INTO `df_goods_goodsinfo` VALUES ('29', '猪肉', '', '20.00', '0', '500g', '400', '', '400', '', '1', '17');
INSERT INTO `df_goods_goodsinfo` VALUES ('30', '鹌鹑蛋', '', '20.00', '0', '80g', '88', '', '88', '', '1', '18');

-- ----------------------------
-- Table structure for `df_user_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `df_user_userinfo`;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `umail` varchar(40) NOT NULL,
  `ushouhuo` varchar(20) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `upostcode` varchar(8) NOT NULL,
  `uphone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_userinfo
-- ----------------------------
INSERT INTO `df_user_userinfo` VALUES ('5', 'wsjwin0', '1bbd886460827015e5d605ed44252251', 'wsj973507837@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES ('6', 'wsjwin1', '1bbd886460827015e5d605ed44252251', '111111111@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES ('18', 'wsjwin', '1bbd886460827015e5d605ed44252251', '111111111@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES ('19', 'wsjwin2', '1bbd886460827015e5d605ed44252251', 'wsj9735078379989@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES ('20', 'vince', '7c497868c9e6d3e4cf2e87396372cd3b', 'vince@qq.com', '文思杰', '\r\n        mars                    ', '888888', '13208005777');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-11-09 06:18:36.885359', '13', '时令水果', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-11-09 06:20:35.369359', '14', '时令水果', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-11-09 06:21:28.644359', '15', '新鲜水果', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-11-09 06:22:20.659359', '15', '新鲜水果', '2', 'Added goods info \"草莓\". Added goods info \"葡萄\". Added goods info \"柠檬\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-11-09 06:23:12.835359', '16', '海鲜水产', '1', 'Added. Added goods info \"青岛野生海捕大青虾\". Added goods info \"扇贝\". Added goods info \"冷冻秋刀鱼\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-11-09 06:23:57.031359', '17', '猪牛羊肉', '1', 'Added. Added goods info \"维多利亚葡萄\". Added goods info \"维多利亚葡萄\". Added goods info \"维多利亚葡萄\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-11-09 06:24:36.815359', '18', '禽类蛋品', '1', 'Added. Added goods info \"鸡蛋\". Added goods info \"鸭蛋\". Added goods info \"鹅蛋\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-11-09 06:25:09.280359', '19', '新鲜蔬菜', '1', 'Added. Added goods info \"菠菜\". Added goods info \"西红柿\". Added goods info \"山芋\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-11-09 06:25:38.247359', '20', '速冻食品', '1', 'Added. Added goods info \"饺子\". Added goods info \"包子\". Added goods info \"汤圆\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-11-09 06:52:29.952359', '6', '大兴大棚草莓', '2', 'Changed gtitle, gprice, gunit, gclick and ginventory.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-11-09 06:56:36.036359', '15', '新鲜水果', '2', 'Added goods info \"海南香蕉\". Added goods info \"青苹果\". Added goods info \"奇异果\". Changed gadv for goods info \"大兴大棚草莓\". Changed gtitle, gprice, gunit, gclick and ginventory for goods info \"玫瑰香葡萄\". Changed gtitle, gprice, gunit, gclick, ginventory and gadv for goods info \"进口柠檬\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-11-09 06:59:24.783359', '16', '海鲜水产', '2', 'Added goods info \"基围虾\". Added goods info \"螃蟹\". Changed gunit, gclick, ginventory and gadv for goods info \"青岛野生海捕大青虾\". Changed gunit, gclick, ginventory and gadv for goods info \"扇贝\". Changed gunit, gclick and ginventory for goods info \"冷冻秋刀鱼\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-11-09 07:05:24.507359', '17', '猪牛羊肉', '2', 'Added goods info \"猪肉\". Changed gtitle, gunit, gclick, ginventory and gadv for goods info \"牛肉\". Changed gtitle, gunit, gclick, ginventory and gadv for goods info \"羊肉\". Changed gtitle, gprice, gunit, gclick, ginventory and gadv for goods info \"鸡胸脯\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-11-09 07:07:00.244359', '18', '禽类蛋品', '2', 'Added goods info \"鹌鹑蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鸡蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鸭蛋\". Changed gunit, gclick, ginventory and gadv for goods info \"鹅蛋\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-11-09 07:07:15.739359', '20', '速冻食品', '2', 'Changed gadv for goods info \"饺子\". Changed gadv for goods info \"包子\". Changed gadv for goods info \"汤圆\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-11-09 07:07:29.673359', '19', '新鲜蔬菜', '2', 'Changed gadv for goods info \"菠菜\". Changed gadv for goods info \"西红柿\". Changed gadv for goods info \"山芋\".', '8', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-11-09 09:34:14.102959', '26', '奇异果', '2', 'Changed gpic.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-11-09 09:35:22.452959', '8', '进口柠檬', '2', 'Changed gpic.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-11-09 09:35:34.296959', '25', '青苹果', '2', 'Changed gpic.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-11-09 09:35:56.066959', '6', '大兴大棚草莓', '2', 'Changed gpic.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-11-09 09:37:22.315959', '10', '扇贝', '2', 'Changed gpic.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-11-09 09:39:00.580959', '28', '螃蟹', '2', 'Changed gpic.', '9', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('8', 'df_goods', 'goodcategory');
INSERT INTO `django_content_type` VALUES ('9', 'df_goods', 'goodsinfo');
INSERT INTO `django_content_type` VALUES ('7', 'df_user', 'userinfo');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-10-24 06:22:03.759949');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-10-24 06:22:04.845949');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-10-24 06:22:05.071949');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-10-24 06:22:05.129949');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-10-24 06:22:05.368949');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-10-24 06:22:05.519949');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-10-24 06:22:05.632949');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-10-24 06:22:05.650949');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-10-24 06:22:05.737949');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-10-24 06:22:05.744949');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-10-24 06:22:05.759949');
INSERT INTO `django_migrations` VALUES ('12', 'df_user', '0001_initial', '2018-10-24 06:22:05.825949');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2018-10-24 06:22:05.903949');
INSERT INTO `django_migrations` VALUES ('14', 'df_goods', '0001_initial', '2018-11-08 06:02:35.256326');
INSERT INTO `django_migrations` VALUES ('15', 'df_user', '0002_auto_20181108_1402', '2018-11-08 06:02:35.461326');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('e4xhwca7n79tqt0jsp40t7kzxiur3cgl', 'MzVkNDc0NDQ3YmFhZThiYzE3YWJjNmE4MTRmZmQ5Yjc5M2RkZjc0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYjI5ZGI4MWQ2N2UwYjg5ZGJmNGJjMWQzMzkzZTdkYTg5YzA4NDEiLCJ1c2VyX25hbWUiOiJ2aW5jZSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwidXNlcl9pZCI6MjAsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-11-28 06:58:07.668342');
INSERT INTO `django_session` VALUES ('m4uolysuskxwnmss2coganpgl2frnqvy', 'MTAxYTU4ZmY4NjE3MjI0NTlmNGZmNjAzN2Q3YzhmMzdmYmQ1ZmJiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Y2IyOWRiODFkNjdlMGI4OWRiZjRiYzFkMzM5M2U3ZGE4OWMwODQxIn0=', '2018-11-23 05:55:57.468359');
INSERT INTO `django_session` VALUES ('wviaboz4nr8h75ib8ze8gkmxpranvpn3', 'YTNiMjJlMTkzNjQyYmM4ZGViMmJmZmMzMzYzN2U0YjQzMzJhOGE0ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1Y2IyOWRiODFkNjdlMGI4OWRiZjRiYzFkMzM5M2U3ZGE4OWMwODQxIn0=', '2018-11-09 04:24:42.006284');
