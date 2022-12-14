/*
Navicat MySQL Data Transfer

Source Server         : δΊε¨εε
Source Server Version : 50734
Source Host           : 112.126.72.86:3306
Source Database       : hd_iyeecare_com

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2022-04-19 13:11:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ims_core_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ims_core_sessions`;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_cron_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_cron_job`;
CREATE TABLE `ims_cron_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `runtime` double(8,2) NOT NULL,
  `cron_manager_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_cron_manager
-- ----------------------------
DROP TABLE IF EXISTS `ims_cron_manager`;
CREATE TABLE `ims_cron_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rundate` datetime NOT NULL,
  `runtime` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_decorate_diy_market_sync
-- ----------------------------
DROP TABLE IF EXISTS `ims_decorate_diy_market_sync`;
CREATE TABLE `ims_decorate_diy_market_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_id` int(11) NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:ε·²ζεοΌ0:ζͺζε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`sync_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ims_failed_jobs`;
CREATE TABLE `ims_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_jobs
-- ----------------------------
DROP TABLE IF EXISTS `ims_jobs`;
CREATE TABLE `ims_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_laravel_sms
-- ----------------------------
DROP TABLE IF EXISTS `ims_laravel_sms`;
CREATE TABLE `ims_laravel_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `temp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voice_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fail_times` mediumint(9) NOT NULL DEFAULT '0',
  `last_fail_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(10) unsigned NOT NULL DEFAULT '0',
  `result_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_mc_chats_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_chats_record`;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_fans_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_groups`;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_fans_tag_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_mapping_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`) USING BTREE,
  UNIQUE KEY `openid_2` (`openid`) USING BTREE,
  KEY `acid` (`acid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `updatetime` (`updatetime`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_mc_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_member_address`;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  `longitude` varchar(15) NOT NULL DEFAULT '',
  `latitude` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_mc_members
-- ----------------------------
DROP TABLE IF EXISTS `ims_mc_members`;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_migrations
-- ----------------------------
DROP TABLE IF EXISTS `ims_migrations`;
CREATE TABLE `ims_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_uploads
-- ----------------------------
DROP TABLE IF EXISTS `ims_uploads`;
CREATE TABLE `ims_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_account_open_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_account_open_config`;
CREATE TABLE `ims_yz_account_open_config` (
  `config_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `app_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity`;
CREATE TABLE `ims_yz_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `activity_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΄»ε¨εη§°',
  `start_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨εΌε§ζΆι΄',
  `end_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨η»ζζΆι΄',
  `pack_price` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'ζεδ»·ζ Ό',
  `goods_count` int(10) unsigned NOT NULL COMMENT 'εεζ°ι',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0-ζ­£εΈΈγ1-ε€±ζ',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε ι€οΌ0-ζͺε ι€γ1-ε·²ε ι€',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(10) unsigned NOT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `rule` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ε±η€Ίθ§εοΌ0-ι»θ?€ζζ‘γ1-θͺε?δΉθ§ε',
  `custom_thumb` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θͺε?δΉεΎη',
  `paid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζ―δ»θ?’εζ°',
  `paid_amount` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'ε?δ»ιι’',
  `extension_qrcode` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨εΉΏδΊη»΄η ',
  `extension_poster` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨εΉΏζ΅·ζ₯',
  `applets_qrcode` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊδΊη»΄η ',
  `applets_poster` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊζ΅·ζ₯',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_activity`;
CREATE TABLE `ims_yz_activity_apply_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `calssify_id` int(11) DEFAULT NULL COMMENT 'εη±»ID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT 'θ?²εΈID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `form_id` int(11) DEFAULT NULL COMMENT 'θ‘¨εID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `limit` int(11) DEFAULT NULL COMMENT 'ζ₯εδΊΊζ°',
  `cash` decimal(14,2) DEFAULT NULL COMMENT 'ζ΄»ε¨θ΄Ήη¨',
  `registration_time` int(11) DEFAULT NULL COMMENT 'εΌε§ζ₯εζΆι΄',
  `registration_end_time` int(11) DEFAULT NULL COMMENT 'η»ζζ₯εζΆι΄',
  `start_time` int(11) DEFAULT NULL COMMENT 'εΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εΎη',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bannerεΎη',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ΄»ε¨θ―¦ζ',
  `province_id` int(11) DEFAULT NULL COMMENT 'ηηΊ§ID',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηηΊ§εη§°',
  `city_id` int(11) DEFAULT '0' COMMENT 'εΈηΊ§ID',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΈηΊ§εη§°',
  `district_id` int(11) DEFAULT '0' COMMENT 'εΊηΊ§ID',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΊηΊ§εη§°',
  `street_id` int(11) DEFAULT '0' COMMENT 'θ‘ιηΊ§ID',
  `street_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘ιηΊ§εη§°',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'ε°ε',
  `status` tinyint(4) DEFAULT '0' COMMENT '0ζ΄»ε¨ζͺεΌε§',
  `is_premium` tinyint(1) DEFAULT NULL COMMENT 'εθ΄Ή0,ζΆθ΄Ή1',
  `is_open` tinyint(1) DEFAULT NULL COMMENT '0ε³ι­,1εΌε―',
  `is_recommand` tinyint(1) DEFAULT NULL COMMENT '0δΈζ¨θ,1ζ¨θ',
  `is_hot` tinyint(1) DEFAULT NULL COMMENT '0δΈη­ι¨,1η­ι¨',
  `is_discount` tinyint(1) DEFAULT NULL COMMENT '0δΈη²Ύι,1η²Ύι',
  `created_at` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζΆι΄',
  `updated_at` int(11) NOT NULL COMMENT 'ζεδΈζ¬‘δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'η§»ι€θ΄­η©θ½¦ζΆι΄',
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΅·ηΉη»ηΊ¬εΊ¦',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ηΉη»ηΊ¬εΊ¦',
  `initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε½ζ ',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«ζ ι’',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«εΎη',
  `share_describe` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«ζθΏ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_attention
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_attention`;
CREATE TABLE `ims_yz_activity_apply_attention` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `is_attention` tinyint(4) DEFAULT NULL COMMENT '0εζΆοΌ1ε³ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_calssify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_calssify`;
CREATE TABLE `ims_yz_activity_apply_calssify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `calssify_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη±»εη§°',
  `sort` int(11) DEFAULT NULL COMMENT 'εη±»ζεΊ',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη±»εΎη',
  `is_open` tinyint(1) DEFAULT NULL COMMENT 'ζ―ε¦δ½Ώη¨εη±»0η¦η¨,1ε―ε¨',
  `create_time` int(11) NOT NULL COMMENT 'εε»ΊηζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_give_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_give_coupon`;
CREATE TABLE `ims_yz_activity_apply_give_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_goods`;
CREATE TABLE `ims_yz_activity_apply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) DEFAULT NULL,
  `is_open` tinyint(4) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `plugins` text COLLATE utf8mb4_unicode_ci COMMENT 'ζδ»Άθ?Ύη½?',
  `profit` text COLLATE utf8mb4_unicode_ci COMMENT 'ζδ»ΆεηΊ’η»η?ζ―δΎ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_lantern_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_lantern_slide`;
CREATE TABLE `ims_yz_activity_apply_lantern_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηεη§°',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΎζ₯',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηε°ε',
  `display_order` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `is_open` int(11) NOT NULL COMMENT 'δΈζΎη€Ί0,ζΎη€Ί1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `app_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_order`;
CREATE TABLE `ims_yz_activity_apply_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨ID',
  `calssify_id` int(11) DEFAULT NULL COMMENT 'εη±»ID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT 'θ?²εΈID',
  `member_id` int(11) DEFAULT NULL COMMENT 'η¨ζ·ID',
  `form_id` int(11) DEFAULT NULL COMMENT 'θ‘¨εID',
  `activity_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΌε·',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯εδΊΊζ°',
  `cash` decimal(14,2) DEFAULT NULL COMMENT 'ιι’',
  `attention` tinyint(4) DEFAULT NULL COMMENT '0ζ²‘ε³ζ³¨,1ε³ζ³¨',
  `sign` tinyint(4) DEFAULT NULL COMMENT '0ζ²‘η­Ύε°,1η­Ύε°',
  `sign_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η­Ύε°ζΆι΄',
  `created_at` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζΆι΄',
  `updated_at` int(11) NOT NULL COMMENT 'ζεδΈζ¬‘δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'η§»ι€θ΄­η©θ½¦ζΆι΄',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―δ»ηΆζ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_order_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_order_log`;
CREATE TABLE `ims_yz_activity_apply_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨id',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `pay_status` int(11) DEFAULT NULL COMMENT 'ι©³εζ―δ»ηΆζ',
  `rejection_details` text COLLATE utf8mb4_unicode_ci COMMENT 'ι©³εδΏ‘ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_apply_relation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_apply_relation`;
CREATE TABLE `ims_yz_activity_apply_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `activity_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_data_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_activity_goods`;
CREATE TABLE `ims_yz_activity_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'εεID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0-ζ­£εΈΈγ1-ε€±ζ',
  `is_deleted` tinyint(1) NOT NULL COMMENT 'ζ―ε¦ε ι€οΌ0-ε¦γ1-ζ―',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `deleted_at` int(10) unsigned NOT NULL COMMENT 'ε ι€ζΆι΄',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_address`;
CREATE TABLE `ims_yz_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=659004547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_address_mgmt_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_address_mgmt_log`;
CREATE TABLE `ims_yz_address_mgmt_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `area_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°εεη§°',
  `after_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΉεε°ε',
  `before_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΉεε°ε',
  `operate_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδ½η±»ε',
  `level` tinyint(4) DEFAULT '0' COMMENT 'ε°εηΊ§ε«',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_logs`;
CREATE TABLE `ims_yz_admin_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `admin_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'η±»ε;1-η?‘ηεη¨ζ·ID',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ζ³¨',
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ip',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η»ε½θ΄¦ε·',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε³θηδΌεidοΌε?ζΆθ?°ε½οΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η?‘ηεη»ε½ζ₯εΏθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_operation_log`;
CREATE TABLE `ims_yz_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_uid` int(11) DEFAULT NULL COMMENT 'η?‘ηε',
  `table_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘¨ε',
  `table_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘¨ε',
  `before` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΉεε',
  `after` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΉεε',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζδ½θip',
  `before_identify` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'δΏ?ζΉεζ θ―',
  `after_identify` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΏ?ζΉεζ θ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_permission_role`;
CREATE TABLE `ims_yz_admin_permission_role` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_permissions`;
CREATE TABLE `ims_yz_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζιε',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζιθ§£ιεη§°',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζθΏ°δΈε€ζ³¨',
  `parent_id` tinyint(4) NOT NULL COMMENT 'ηΊ§ε«',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎζ ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_role_user`;
CREATE TABLE `ims_yz_admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_roles`;
CREATE TABLE `ims_yz_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ§θ²εη§°',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ζ³¨',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_admin_users`;
CREATE TABLE `ims_yz_admin_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'η?‘ηεη¨ζ·θ‘¨ID',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η¨ζ·ε',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε―η ',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'ηΆζ(0:θΆηΊ§η?‘ηε(admin); 1:ε?‘ζ Έ; 2:ζζ; 3:η¦η¨)',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'η±»ε(0:θΆηΊ§η?‘ηε(admin); 1:ζ?ιη¨ζ·; 3:εΊε)',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ζ³¨',
  `application_number` int(11) NOT NULL DEFAULT '0' COMMENT 'εΉ³ε°ζ°ι(0:δ»£θ‘¨δΈεθ?Έεε»Ί)',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT 'ε°ζζΆι΄(0:ζ°ΈδΉζζ)',
  `owner_uid` int(11) NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joinip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε ε₯ip',
  `lastvisit` int(11) NOT NULL COMMENT 'ζεθ?Ώι?',
  `lastip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζεθ?Ώι?ip',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `change_password_at` int(11) DEFAULT NULL,
  `change_remind` tinyint(4) NOT NULL DEFAULT '0',
  `login_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `yz_admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_adv`;
CREATE TABLE `ims_yz_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `advs` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_advertisement`;
CREATE TABLE `ims_yz_advertisement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ ι’',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΎη',
  `adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΉΏειΎζ₯',
  `sort_by` int(11) DEFAULT '0' COMMENT 'ζεΊ',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:δΈζΎη€Ί|1οΌζΎη€Ί',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_agent_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_agent_level`;
CREATE TABLE `ims_yz_agent_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `first_level` decimal(12,2) DEFAULT '0.00',
  `second_level` decimal(12,2) DEFAULT '0.00',
  `third_level` decimal(12,2) DEFAULT '0.00',
  `upgraded` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_manage` int(11) DEFAULT NULL,
  `additional_ratio` decimal(12,2) DEFAULT '0.00',
  `no_withdraw` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_agents
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_agents`;
CREATE TABLE `ims_yz_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `agent_level_id` int(11) DEFAULT '0',
  `is_black` tinyint(1) DEFAULT '0',
  `commission_total` decimal(14,2) DEFAULT '0.00',
  `agent_not_upgrade` tinyint(1) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `parent` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_pay` decimal(14,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_parent` (`uniacid`,`parent`),
  KEY `yz_agents_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_bing_bird_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_bing_bird_order`;
CREATE TABLE `ims_yz_aggregation_bing_bird_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `type` int(11) DEFAULT NULL COMMENT 'θ?’εη±»ε',
  `buyer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΄­δΉ°θ(ε€ι¨η¨ζ·ζ θ―)',
  `buyer_out_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΄­δΉ°θ(ε€ι¨η¨ζ·ζ θ―)',
  `parent_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΆθ?’εηΌε·',
  `sub_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε­θ?’εηΌε·',
  `pre_commission` decimal(12,2) DEFAULT NULL COMMENT 'θ?’εζ»ι’δΌ°δ½£ιοΌεοΌοΌε·²ζ£ι€ζζ―ζε‘θ΄Ή',
  `commission` decimal(12,2) DEFAULT NULL COMMENT 'θ?’εζ»η»η?δ½£ιοΌεοΌ',
  `pre_amount` decimal(12,2) DEFAULT NULL COMMENT 'η¨ζ·θ·εΎηι’δΌ°δ½£ιοΌεοΌ',
  `amount` decimal(12,2) DEFAULT NULL COMMENT 'η¨ζ·θ·εΎηη»η?δ½£ιοΌεοΌ',
  `user_out_uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δ½£ιθ·εΎθοΌε€ι¨η¨ζ·ζ θ―οΌ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεζ ι’',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεδΈ»εΎ',
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεid',
  `goods_count` int(11) DEFAULT NULL COMMENT 'θ΄­δΉ°ζ°ι',
  `goods_price` decimal(12,2) DEFAULT NULL COMMENT 'εεεδ»·',
  `pay_price` decimal(12,2) DEFAULT NULL COMMENT 'θ?’εζ―δ»ιι’',
  `deposite_price` decimal(12,2) DEFAULT NULL COMMENT 'ε?ιοΌδ»ζ·ε?θ?’εοΌ',
  `cpa_commission` decimal(12,2) DEFAULT NULL COMMENT 'ηΆζ 1:εΎζ―δ» 2:ε·²δ»ζ¬Ύ 3:η‘?θ?€ζΆθ΄§ 4:θηη»η? 5:ιθ΄§ 6:θΏθ§ 7:εΆδ»',
  `fl_commission` decimal(12,2) DEFAULT NULL,
  `point` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `love` decimal(12,2) DEFAULT NULL,
  `integral` decimal(12,2) DEFAULT NULL,
  `red_packet` decimal(12,2) DEFAULT NULL,
  `seller_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `special_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT 'δΈεζΆι΄',
  `receive_time` int(11) DEFAULT NULL COMMENT 'ε?ζζΆι΄',
  `settle_time` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `user_settle_time` int(11) DEFAULT NULL COMMENT 'Bη«―ε?’ζ·η»η?η»Cη«―η¨ζ·ηζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_bing_bird_order_types
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_bing_bird_order_types`;
CREATE TABLE `ims_yz_aggregation_bing_bird_order_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL COMMENT 'θ?’εη±»εοΌε―ΉεΊ θ?’εεζ­₯APIηtypeοΌ',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΈ­ζε',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ οΌε―εθδ½Ώη¨οΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_bing_bird_order_types_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_academy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_academy`;
CREATE TABLE `ims_yz_aggregation_cps_academy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `sort` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ η?εη§°',
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ η?εΎη',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄ε€ιΎζ₯',
  `is_show` int(11) DEFAULT NULL COMMENT 'ζ―ε¦ζΎη€Ί',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_app_version
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_app_version`;
CREATE TABLE `ims_yz_aggregation_cps_app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηζ¬ε·',
  `version_code` int(11) NOT NULL COMMENT 'ηζ¬δ»£η ',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε―η¨ηΆζ 0δΈε―η¨ 1ε―η¨',
  `log` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄ζ°ζ₯εΏ',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'appδΈθ½½ιΎζ₯',
  `apk_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'appεε',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'appεΎζ ιΎζ₯',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'appεΊη¨ε',
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζδ»Άε€§ε°',
  `upload_type` int(11) NOT NULL COMMENT 'δΈδΌ η±»ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--appηζ¬θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_content`;
CREATE TABLE `ims_yz_aggregation_cps_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `academy_id` int(11) DEFAULT NULL COMMENT 'ζ η?ID',
  `sort` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε?Ήεη§°',
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε?Ήε°ι’',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ·³θ½¬ιΎζ₯',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζΎη€Ί1ζ― 0ε¦',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_brand
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_brand`;
CREATE TABLE `ims_yz_aggregation_cps_equity_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `category_id` int(11) DEFAULT NULL COMMENT 'εηζε±ηη±»η?',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'logo',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζθΏ°',
  `is_hot` int(11) DEFAULT NULL COMMENT 'ζ―ε¦η­ι¨ 0ε¦ 1ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `show_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'εη«―ζ―ε¦ζΎη€Ί 1ζΎη€Ί 0ιθ',
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_brand_b_id_index` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_category`;
CREATE TABLE `ims_yz_aggregation_cps_equity_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_category_b_id_index` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_goods`;
CREATE TABLE `ims_yz_aggregation_cps_equity_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεεη§°',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεlogo',
  `brand_id` int(11) DEFAULT NULL COMMENT 'εηid',
  `category_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ1δΈζΆ2ε?η½',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `sell_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_goods_brand_id_index` (`brand_id`),
  KEY `yz_aggregation_cps_equity_goods_b_id_index` (`b_id`),
  KEY `yz_aggregation_cps_equity_goods_sell_count_index` (`sell_count`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_goods_sku`;
CREATE TABLE `ims_yz_aggregation_cps_equity_goods_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεεη§°',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεlogo',
  `brand_id` int(11) DEFAULT NULL COMMENT 'εηid',
  `category_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ1δΈζΆ2ε?η½',
  `face_price` decimal(10,2) DEFAULT '0.00',
  `sale_price` decimal(10,2) DEFAULT '0.00',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `use_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `equity_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `reward_point` decimal(10,2) DEFAULT '0.00',
  `reward_point1` decimal(10,2) DEFAULT '0.00',
  `reward_point2` decimal(10,2) DEFAULT '0.00',
  `reward_balance` decimal(10,2) DEFAULT '0.00',
  `reward_balance1` decimal(10,2) DEFAULT '0.00',
  `reward_balance2` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_goods_sku_brand_id_index` (`brand_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_equity_id_index` (`equity_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_goods_sku_b_id_index` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_pay_order`;
CREATE TABLE `ims_yz_aggregation_cps_equity_pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `member_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `sub_order_id` int(11) DEFAULT NULL COMMENT 'ε­θ?’εID',
  `sku_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `count` int(11) DEFAULT NULL COMMENT 'ζ°ι',
  `recharge_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΄εεζ°',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺε?δΉθ?’εηΌε·',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΏεΊιΈθ?’εηΌε·',
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεεη§°',
  `goods_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεηlogo',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT 'ε?δ»·',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT 'θ?’ειι’',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆζ―',
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΊ§εθ―΄ζ',
  `use_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δ½Ώη¨θ―΄ζ',
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆζ―',
  `coupon_info` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆζ―',
  `code` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `sku_type` int(11) DEFAULT NULL COMMENT 'skuηη±»εοΌ1η΄ε2ε‘εΈ',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζοΌ0ι»θ?€ηΆζ-1ε€±θ΄₯2ζε3ε€ηδΈ­οΌε¦ζδΈη΄ζ―ηΆζ3θ―·θη³»ε?’ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_pay_order_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_pay_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_equity_pay_order_member_id_index` (`member_id`),
  KEY `yz_aggregation_cps_equity_pay_order_sub_order_id_index` (`sub_order_id`),
  KEY `yz_aggregation_cps_equity_pay_order_sku_id_index` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_equity_place_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_equity_place_order`;
CREATE TABLE `ims_yz_aggregation_cps_equity_place_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `sku_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `count` int(11) DEFAULT NULL COMMENT 'ζ°ι',
  `face_price` decimal(10,2) DEFAULT NULL COMMENT 'ι’εΌ',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT 'ιε?δ»·ζ Ό',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT 'ζζ¬δ»·ζ Ό',
  `recharge_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌθ΄¦ζ·',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌθ΄¦ζ·',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌθ΄¦ζ·',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆζ―',
  `code` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_equity_place_order_goods_id_index` (`goods_id`),
  KEY `yz_aggregation_cps_equity_place_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_equity_place_order_member_id_index` (`member_id`),
  KEY `yz_aggregation_cps_equity_place_order_sku_id_index` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_link_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_link_category`;
CREATE TABLE `ims_yz_aggregation_cps_link_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εη±»ζ ι’',
  `level` tinyint(4) NOT NULL COMMENT 'εη±»ηΊ§ε«',
  `parent_id` int(11) NOT NULL COMMENT 'ηΆεη±»id',
  `need_login` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦η»ε½',
  `target_type` int(11) NOT NULL COMMENT 'θ·³θ½¬η±»εid 0εη±» -1ζ·ε? -2δΊ¬δΈ -3ζΌε€ε€ -4η½ι‘΅ -5APP -6ε°η¨εΊ',
  `target` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ·³θ½¬εζ°,εΊεε',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎζ ιΎζ₯',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊοΌεΌθΆε€§οΌδΌεεΊ¦θΆι«',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζΎη€Ί 0δΈζΎη€Ί 1ζΎη€Ί',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `image_state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_link_category_image_state_index` (`image_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--θͺε?δΉεη±»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order`;
CREATE TABLE `ims_yz_aggregation_cps_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΌε·',
  `sub_order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε­θ?’εηΌε·',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `order_type` int(11) DEFAULT NULL COMMENT 'η¬¬δΈζΉεΉ³ε°η±»ε',
  `price` decimal(12,2) DEFAULT NULL COMMENT 'η»η?ιι’',
  `statement_at` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `close_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_sub_order_sn_index` (`sub_order_sn`),
  KEY `yz_aggregation_cps_order_order_id_index` (`order_id`),
  KEY `yz_aggregation_cps_order_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order_request`;
CREATE TABLE `ims_yz_aggregation_cps_order_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret',
  `api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'api',
  `v` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηζ¬ε·',
  `t` int(11) DEFAULT NULL COMMENT 'θ―·ζ±ζΆι΄',
  `mode` int(11) DEFAULT NULL COMMENT 'θ―·ζ±η±»ε',
  `type` int(11) DEFAULT NULL COMMENT 'θ―·ζ±η±»ε',
  `time` int(11) DEFAULT NULL COMMENT 'ζΆι΄οΌ1-δΈεζΆι΄οΌ2-ζΆθ΄§ζΆι΄οΌ3-ζ΄ζ°ζΆι΄',
  `start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΌε§ζΆι΄οΌζ ΌεΌοΌ2020-09-12 ζ2020-09-12 11:05:24',
  `end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ζζΆι΄οΌζ ΌεΌοΌ2020-09-12 ζ2020-09-12 11:05:24',
  `min_id` int(11) DEFAULT NULL COMMENT 'ζε°IDοΌδΌ ε₯δΈδΈζ¬‘θ―·ζ±θΏεηζε€§ID',
  `page` int(11) DEFAULT NULL COMMENT 'ι‘΅η ',
  `page_size` int(11) DEFAULT NULL COMMENT 'ζ―ι‘΅ζ°ζ?ιοΌι»θ?€20οΌζε€§100',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_request_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=558587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_order_response
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_order_response`;
CREATE TABLE `ims_yz_aggregation_cps_order_response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `type` int(11) DEFAULT NULL COMMENT 'θ―·ζ±η±»ε',
  `api_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secret',
  `api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'api',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΏεη ',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆζ―',
  `has_next` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―ε¦ζδΈδΈι‘΅',
  `max_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε€§εΌ',
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ζ°ζ?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_aggregation_cps_order_response_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=558587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_activity`;
CREATE TABLE `ims_yz_aggregation_cps_plat_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εΌε―ηΆζ 0ε³ι­ 1εΌε―',
  `another_id` int(10) unsigned NOT NULL COMMENT 'εΏεΊιΈθ΅ζΊη±»εid',
  `another_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΏεΊιΈθ΅ζΊη±»εε',
  `web_poster_id` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·ζ΅·ζ₯id',
  `mini_poster_id` int(10) unsigned NOT NULL COMMENT 'ε°η¨εΊζ΅·ζ₯id',
  `bottom_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΊι¨ζζ¬',
  `top_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊι¨ζζ¬',
  `page_type` tinyint(4) NOT NULL DEFAULT '3' COMMENT 'ι‘΅ι’η±»ε 1H5 2ε°η¨εΊ 3H5+ε°η¨εΊ',
  `visit_count` int(11) NOT NULL COMMENT 'θ?Ώι?ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--ζ¨εΉΏθ΅ζΊθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_activity_code`;
CREATE TABLE `ims_yz_aggregation_cps_plat_activity_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯',
  `code_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΊη»΄η ζε°η¨εΊη εΎηιΎζ₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--ζ¨εΉΏζ΄»ε¨η θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_plat_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_plat_list`;
CREATE TABLE `ims_yz_aggregation_cps_plat_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `plat_id` int(11) NOT NULL COMMENT 'ζ¨εΉΏθ΅ζΊid',
  `state` tinyint(4) NOT NULL COMMENT '0ε€±ζ ζζ',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ΅ζΊε',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ΅ζΊlogo',
  `is_h5` tinyint(4) NOT NULL COMMENT 'ζ―ε¦ζ―ζh5',
  `is_mini` tinyint(4) NOT NULL COMMENT 'ζ―ε¦ζ―ζε°η¨εΊ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--ζ¨εΉΏθ΅ζΊθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_aggregation_cps_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_aggregation_cps_text`;
CREATE TABLE `ims_yz_aggregation_cps_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζ¬ι?ε',
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζ¬εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θεcps--ε―ζζ¬θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_alipay_order_settle_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_alipay_order_settle_log`;
CREATE TABLE `ims_yz_alipay_order_settle_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `royalty_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_out_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_in_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_request_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_alipay_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_alipay_pay_order`;
CREATE TABLE `ims_yz_alipay_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT NULL,
  `royalty` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_answer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_answer`;
CREATE TABLE `ims_yz_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `subject_id` int(11) DEFAULT NULL COMMENT 'ι’η?id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η­ζ‘εε?Ή',
  `answer` int(11) DEFAULT NULL COMMENT 'ζ­£η‘?η­ζ‘',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_answer_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_answer_reward_log`;
CREATE TABLE `ims_yz_answer_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `uid` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `parent_id` int(11) DEFAULT NULL COMMENT 'δΈηΊ§id',
  `answer_id` int(11) DEFAULT NULL COMMENT 'η­ζ‘id',
  `subject_id` int(11) DEFAULT NULL COMMENT 'ι’η?id',
  `video_id` int(11) DEFAULT NULL COMMENT 'θ§ι’id',
  `uid_reward_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε₯ε±η§―ε',
  `parent_reward_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε₯ε±η§―ε',
  `set_type` int(11) DEFAULT NULL COMMENT 'ε¨ε±/εη¬θ?Ύη½?: 0 ε¨ε± 1 εη¬',
  `uid_whole_value` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε¨ε±θ?Ύη½?εΊε?εΌ',
  `uid_alone_value` decimal(5,2) DEFAULT NULL COMMENT 'δΌεεη¬θ?Ύη½?εΊε?εΌ',
  `parent_whole_value` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε¨ε±θ?Ύη½?εΊε?εΌ',
  `parent_alone_value` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§εη¬θ?Ύη½?εΊε?εΌ',
  `uid_reward_c_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε₯ε±ζΆθ΄Ήη§―ε',
  `parent_reward_c_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε₯ε±ζΆθ΄Ήη§―ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_api_access_token
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_api_access_token`;
CREATE TABLE `ims_yz_api_access_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_api_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_api_refresh_token`;
CREATE TABLE `ims_yz_api_refresh_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_app_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_app_user`;
CREATE TABLE `ims_yz_app_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°id',
  `uid` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η¨ζ·θ§θ²(manager:η?‘ηε; operator: ζδ½ε; clerk:ζδ½ε)',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·εε°η¨εΊη½?ι‘ΆζεΊ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend`;
CREATE TABLE `ims_yz_area_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `area_level` tinyint(1) NOT NULL COMMENT 'εΊεη­ηΊ§',
  `agent_area` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δ»£ηεΊε',
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?’εε·',
  `order_amount` decimal(12,2) NOT NULL COMMENT 'θ?’ειι’',
  `amount` decimal(12,2) NOT NULL COMMENT 'εηΊ’η»η?ιι’',
  `dividend_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'εηΊ’ζ―δΎ',
  `lower_level_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'δΈηΊ§εηΊ’ζ―δΎ',
  `same_level_number` int(11) DEFAULT NULL COMMENT 'εηΊ§δΊΊζ°',
  `dividend_amount` decimal(12,2) NOT NULL COMMENT 'εηΊ’ιι’',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'εηΊ’ηΆζ 0:ζͺη»η? 1οΌε·²η»η?',
  `create_month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recrive_at` int(11) DEFAULT NULL COMMENT 'ζΆθ΄§ζΆι΄',
  `settle_days` int(11) NOT NULL DEFAULT '0' COMMENT 'η»η?ε€©ζ°',
  `statement_at` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_area_dividend_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_agent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_agent`;
CREATE TABLE `ims_yz_area_dividend_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `mobile` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θη³»ζΉεΌ',
  `province_id` int(11) DEFAULT NULL COMMENT 'ηηΊ§ID',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηηΊ§εη§°',
  `city_id` int(11) DEFAULT '0' COMMENT 'εΈηΊ§ID',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΈηΊ§εη§°',
  `district_id` int(11) DEFAULT '0' COMMENT 'εΊηΊ§ID',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΊηΊ§εη§°',
  `street_id` int(11) DEFAULT '0' COMMENT 'θ‘ιηΊ§ID',
  `street_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘ιηΊ§εη§°',
  `agent_level` tinyint(1) DEFAULT '0' COMMENT '0οΌζ ζοΌ1οΌηδ»£οΌ2οΌεΈδ»£οΌ3οΌεΊδ»£οΌ4οΌθ‘ιδ»£η',
  `status` tinyint(1) DEFAULT '0' COMMENT '0οΌεΎε?‘ζ ΈοΌ1οΌιθΏοΌ-1ι©³ε',
  `agent_at` int(11) DEFAULT NULL COMMENT 'ζδΈΊδ»£ηζΆι΄',
  `count_order_amount` decimal(14,2) DEFAULT '0.00' COMMENT 'εΊεθ?’εζΆθ΄Ήιι’',
  `count_settle_amount` decimal(14,2) DEFAULT '0.00' COMMENT 'η΄―θ?‘η»η?εηΊ’ιι’',
  `settle_dividend_amount` decimal(14,2) DEFAULT '0.00' COMMENT 'ε·²η»η?εηΊ’',
  `unsettled_dividend_amount` decimal(14,2) DEFAULT '0.00' COMMENT 'ζͺη»η?εηΊ’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `manage` int(11) DEFAULT '0',
  `ratio` decimal(10,2) DEFAULT NULL,
  `has_ratio` int(11) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεδΈεδΌεID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_lock
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_lock`;
CREATE TABLE `ims_yz_area_dividend_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_area_dividend_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_area_dividend_order`;
CREATE TABLE `ims_yz_area_dividend_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_article_pay_money
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_article_pay_money`;
CREATE TABLE `ims_yz_article_pay_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL COMMENT 'ζη« ID',
  `category_id` tinyint(4) NOT NULL COMMENT 'ζη« εη±»',
  `money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζη« δ»·ζ Ό',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT 'δ»ζ¬Ύζ¬‘ζ°',
  `pay_total` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'δ»ζ¬Ύιι’',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζ 0-ζ­£εΈΈ 1-ε ι€',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_article_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_article_pay_record`;
CREATE TABLE `ims_yz_article_pay_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL COMMENT 'ζη« ID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `pay_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'δ»ζ¬Ύιι’',
  `pay_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δ»ζ¬ΎζΉεΌID',
  `pay_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δ»ζ¬ΎζΉεΌ',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δ»ζ¬ΎηΆζ 0-ζͺδ»ζ¬Ύ  1-ε·²δ»ζ¬Ύ',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_audio_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_audio_notice`;
CREATE TABLE `ims_yz_audio_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `belong` int(11) NOT NULL DEFAULT '0' COMMENT 'ζε±θid',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ζͺζ­ζΎ|1οΌε·²ζ­ζΎ',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι’ηζ©ε±',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance`;
CREATE TABLE `ims_yz_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_money` decimal(14,2) DEFAULT NULL,
  `change_money` decimal(14,2) NOT NULL,
  `new_money` decimal(14,2) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `service_type` tinyint(11) NOT NULL,
  `serial_number` varchar(45) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL,
  `operator_id` varchar(45) NOT NULL DEFAULT '',
  `thirdStatus` varchar(255) DEFAULT '1',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_balance_serial_number_index` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8997 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_balance_covert_love
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_covert_love`;
CREATE TABLE `ims_yz_balance_covert_love` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `covert_amount` int(11) NOT NULL COMMENT 'θ½¬ειι’',
  `status` int(11) NOT NULL COMMENT 'θ½¬εηΆζ',
  `order_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?’εε·',
  `remark` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge`;
CREATE TABLE `ims_yz_balance_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_money` decimal(14,2) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `new_money` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `ordersn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge_activity`;
CREATE TABLE `ims_yz_balance_recharge_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `partake_count` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_balance_recharge_check
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_recharge_check`;
CREATE TABLE `ims_yz_balance_recharge_check` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `money` decimal(12,2) NOT NULL COMMENT 'εεΌδ½ι’',
  `type` int(11) NOT NULL COMMENT 'εεΌη±»ε',
  `operator_id` int(11) DEFAULT NULL COMMENT 'ζδ½θID',
  `operator` int(11) DEFAULT NULL COMMENT 'ζδ½θ',
  `source` int(11) NOT NULL COMMENT 'ζ₯ζΊ',
  `enclosure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιδ»Ά',
  `recharge_remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌζΆε‘«εηε€ζ³¨',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `explain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―΄ζ',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0εΎε?‘ζ Έ,1ιθΏ,2ι©³ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_balance_recharge_check_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δ½ι’εεΌε?‘ζ Έθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_balance_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_balance_transfer`;
CREATE TABLE `ims_yz_balance_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `transferor` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_bind_mobile_award_point
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_bind_mobile_award_point`;
CREATE TABLE `ims_yz_bind_mobile_award_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°ID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `point` decimal(14,2) NOT NULL COMMENT 'ε₯ε±η§―ε',
  `created_at` int(11) NOT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL COMMENT 'δΏ?ζΉζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_boss_audio_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_boss_audio_notice`;
CREATE TABLE `ims_yz_boss_audio_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT 'ζε±θid',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plugin_id` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL COMMENT '0:ζͺζ­ζΎ|1οΌε·²ζ­ζΎ',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι’ηζ©ε±',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_brand
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_brand`;
CREATE TABLE `ims_yz_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_broadcast_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_broadcast_config`;
CREATE TABLE `ims_yz_broadcast_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°id',
  `is_open` int(11) NOT NULL COMMENT 'ηΆζοΌ0-ε³ι­οΌ1-εΌε―',
  `broadcast_number` int(11) NOT NULL COMMENT 'ζ»ε¨ζ°ι',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θͺε?δΉζζ‘',
  `show_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-εεζζεεοΌ2-ε½εζ΅θ§εε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_browse_footprint
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_browse_footprint`;
CREATE TABLE `ims_yz_browse_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?Ώι?δΌεοΌ0-ζΈΈε?’',
  `page_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’η±»ε',
  `page_type_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι‘΅ι’η±»εID',
  `port_type` tinyint(4) NOT NULL COMMENT 'η«―ε£η±»ε:wap,ε¬δΌε·,εΎ?δΏ‘ε°η¨εΊη­',
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?Ώι?IPε°ε',
  `ip_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?Ώι?εΊεοΌε½εθ?°ε½ηδ»½οΌε½ε€θ?°ε½ε½ε?Ά',
  `cookie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?Ώι?ηζ΄ζ°ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ι‘΅ι’ε?ζ΄URL',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT 'εδΊ«θid',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_page_type` (`page_type`),
  KEY `idx_cookie` (`cookie`),
  KEY `inx_day` (`day`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=160619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_browse_footprint_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_browse_footprint_config`;
CREATE TABLE `ims_yz_browse_footprint_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°id',
  `is_open` int(11) NOT NULL COMMENT 'ηΆζοΌ0-ε³ι­οΌ1-εΌε―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card`;
CREATE TABLE `ims_yz_business_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `card_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηε€΄ε',
  `card_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηε§ε',
  `card_mobile` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηζζΊε·',
  `card_wechat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηεΎ?δΏ‘ε·',
  `role_id` int(11) DEFAULT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci COMMENT 'η?δ»',
  `voice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε½ι³',
  `card_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηιΎζ₯',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηδΊη»΄η ',
  `picture` text COLLATE utf8mb4_unicode_ci COMMENT 'εΎη',
  `areas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°εΊιζ©',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―¦η»ε°ε',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:δΈεΌε―οΌ1:εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `min_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊεηδΊη»΄η ',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε¬εΈεη§°',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΅·ζ₯εΎ',
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΅·ζ₯εΎurl',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_children
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_children`;
CREATE TABLE `ims_yz_business_card_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_collection
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_collection`;
CREATE TABLE `ims_yz_business_card_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `collect_member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:δΈζΆθοΌ1:ζΆθ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_goods`;
CREATE TABLE `ims_yz_business_card_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_reliable
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_reliable`;
CREATE TABLE `ims_yz_business_card_reliable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `reliable_member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:δΈι θ°±οΌ1:ι θ°±',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_card_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_card_statistics`;
CREATE TABLE `ims_yz_business_card_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `visit` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?Ώι?',
  `visitor_num` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?Ώι?δΊΊζ°',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΆθ',
  `reliable` int(11) NOT NULL DEFAULT '0' COMMENT 'ι θ°±',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT 'εδΊ«',
  `save` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏε­',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ°ε’δΌε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_business_department
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_department`;
CREATE TABLE `ims_yz_business_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι¨ι¨εη§°',
  `en_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι¨ι¨θ±ζεη§°',
  `level` int(11) NOT NULL COMMENT 'ε±ηΊ§',
  `parent_id` int(11) NOT NULL COMMENT 'δΈηΊ§ι¨ι¨id',
  `wechat_department_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘ι¨ι¨id',
  `order` int(11) NOT NULL COMMENT 'ι¨ι¨ζεΊ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_department_index_business_wechat` (`business_id`,`wechat_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-δΌδΈι¨ι¨θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_department_staff
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_department_staff`;
CREATE TABLE `ims_yz_business_department_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `staff_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεε·₯id,yz_business_staffθ‘¨id',
  `department_id` int(11) NOT NULL COMMENT 'ι¨ι¨id',
  `is_leader` int(11) NOT NULL COMMENT 'ζ―ε¦ι¨ι¨ι’ε―Ό',
  `sort` int(11) NOT NULL COMMENT 'ι¨ι¨ζεΊ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_department_staff_index_bds` (`business_id`,`department_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-δΌδΈεε·₯θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_manager_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_manager_list`;
CREATE TABLE `ims_yz_business_manager_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(11) NOT NULL COMMENT 'δΌεid',
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈid',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-η?‘ηεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_material
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_material`;
CREATE TABLE `ims_yz_business_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιδ»Άη±»ε',
  `file_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιδ»Άεη§°',
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιδ»Άε?ζ΄ε°ε',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΌδΈεΎ?δΏ‘εδΌ ηη΄ ζζ θ―οΌδΈε€©ζζοΌ',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BniId` (`uniacid`,`business_id`),
  KEY `ids_Type_FName` (`type`,`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘η΄ ζζ θ―η?‘ηθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_pc_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_pc_text`;
CREATE TABLE `ims_yz_business_pc_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζ¬ζ θ―',
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζ¬εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈpcη«―η?‘η--ε―ζζ¬θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_permission`;
CREATE TABLE `ims_yz_business_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨ι¨id',
  `staff_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εε·₯id',
  `type` tinyint(4) NOT NULL COMMENT '1ι¨ι¨εε·₯ζι 2ι¨ι¨ι’ε―Όζι 3η¨ζ·η¬η«ζι',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘εεζζδ»Άε,ε¦admin,frontend,yun-sign',
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ·―η±ε',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_permission_index_business_department_staff` (`business_id`,`department_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-ι¨ι¨εε·₯ζιθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_business_plat_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_plat_log`;
CREATE TABLE `ims_yz_business_plat_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(11) NOT NULL COMMENT 'δΌεid',
  `final_plat_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεη?‘ηηδΌδΈid',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_business_plat_log_uid_unique` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-δΌδΈη?‘ηθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_business_staff
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_business_staff`;
CREATE TABLE `ims_yz_business_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζεUserIDγε―ΉεΊη?‘ηη«―ηεΈε·',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζεεη§°',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζζΊε·',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θε‘',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζͺη₯ 1η· 2ε₯³',
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊθ―',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι?η?±ε°ε',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€΄ε',
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε«ε',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζͺε³θ 1=ε·²ζΏζ΄»οΌ2=ε·²η¦η¨οΌ4=ζͺζΏζ΄»οΌ5=ιεΊδΌδΈ',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε·₯δΈͺδΊΊδΊη»΄η ',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε·₯ε°ε',
  `open_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζεη¬¬δΈζΉε―δΈζ θ―δ»£η ',
  `main_department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΈ»ι¨ι¨',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `right_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζιη±»ε 0ι¨ι¨ζι 1ζεη¬η«ζι',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦η¦η¨ 0ζ­£εΈΈ 1η¦η¨',
  PRIMARY KEY (`id`),
  KEY `yz_business_staff_business_id_index` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈPCη«―-δΌδΈεε·₯θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_card_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_goods_history`;
CREATE TABLE `ims_yz_card_goods_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_history_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_history_statistics`;
CREATE TABLE `ims_yz_card_history_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num_sum` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_reward_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_reward_records`;
CREATE TABLE `ims_yz_card_reward_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `source_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(11) NOT NULL,
  `amount` decimal(14,2) NOT NULL COMMENT 'ε₯ε±ι’εΊ¦',
  `reward_type` int(11) NOT NULL COMMENT 'ε₯ε±η±»ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_save_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_save_records`;
CREATE TABLE `ims_yz_card_save_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `save_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_share_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_share_records`;
CREATE TABLE `ims_yz_card_share_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `share_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_card_visit_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_card_visit_records`;
CREATE TABLE `ims_yz_card_visit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `visitor_member_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_diy_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_diy_return`;
CREATE TABLE `ims_yz_cashier_diy_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `diy_total` int(11) DEFAULT NULL,
  `point_total` int(11) DEFAULT NULL,
  `finish_point_total` int(11) DEFAULT NULL,
  `cash_total` int(11) DEFAULT NULL,
  `finish_cash_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_goods`;
CREATE TABLE `ims_yz_cashier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―ζΆιΆε°',
  `shop_commission` decimal(10,5) DEFAULT '0.00000' COMMENT 'εΉ³ε°εζζ―δΎ',
  `settlement_day` int(11) DEFAULT '0' COMMENT 'η»η?ζ',
  `is_write_information` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'η¨ζ·δ»ζ¬Ύζ―ε¦ιθ¦ε‘«εδΏ‘ζ―',
  `is_cash_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦δ½Ώη¨η°ιζ―δ»',
  `plugins` text COLLATE utf8mb4_unicode_ci COMMENT 'ζδ»Άθ?Ύη½?',
  `shop_award_point` decimal(10,2) DEFAULT NULL COMMENT 'εε?Άε₯ε±η§―ε',
  `profit` text COLLATE utf8mb4_unicode_ci COMMENT 'ζδ»ΆεηΊ’η»η?ζ―δΎ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `payment_types` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shop_award_point1` decimal(10,2) DEFAULT NULL COMMENT 'δΈηΊ§εε?Άε₯ε±η§―ε',
  `shop_award_point2` decimal(10,2) DEFAULT NULL COMMENT 'δΊηΊ§εε?Άε₯ε±η§―ε',
  `audio_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ε³ι­|1οΌεΌε―',
  `pay_reward` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ―δ»ε₯ε±εΌ',
  `fixed_meney` decimal(14,2) DEFAULT NULL COMMENT 'η§―εζδ½ζ΅ζ£εΊε?ε€ε°ε',
  `max_pay_number` int(11) DEFAULT NULL COMMENT 'δΌεζε€δΈεζ¬‘ζ°',
  `every_min_money` decimal(14,2) DEFAULT NULL COMMENT 'ζ―ζ¬‘ζε€ζΆθ΄Ήιι’',
  `face_pay` int(11) DEFAULT '0' COMMENT 'δΊΊθΈζ―δ»',
  `is_open_member_discount` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌε―δΌεζζ£,0εΌε―οΌ1ε³ι­',
  `pay_reward_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ―δ»ε₯ε±εΌ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cashier_sale
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cashier_sale`;
CREATE TABLE `ims_yz_cashier_sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `max_point_deduct` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'η§―εζε€§ζζ£',
  `min_point_deduct` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'η§―εζε°ζζ£',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1ηΎεζ―οΌ2εΊε?εΌ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ι¨εΊζΆιΆε°η§―εζ΅ζ£';

-- ----------------------------
-- Table structure for ims_yz_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_category`;
CREATE TABLE `ims_yz_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `is_home` tinyint(1) DEFAULT '0',
  `adv_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `adv_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `level` tinyint(1) DEFAULT '0',
  `advimg_pc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `advurl_pc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `filter_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_ishome` (`is_home`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_category_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_category_discount`;
CREATE TABLE `ims_yz_category_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'εη±»id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_discount_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζζ£η±»ε',
  `discount_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζζ£ζΉεΌ',
  `discount_value` text COLLATE utf8mb4_unicode_ci COMMENT 'ζζ£εΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_change_mobile_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_change_mobile_log`;
CREATE TABLE `ims_yz_change_mobile_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `mobile_before` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉεζζΊε·',
  `mobile_after` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉεζζΊε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ckt_class
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_class`;
CREATE TABLE `ims_yz_ckt_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη±»εη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄εη±»';

-- ----------------------------
-- Table structure for ims_yz_ckt_colour
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_colour`;
CREATE TABLE `ims_yz_ckt_colour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colour_id` int(11) DEFAULT NULL COMMENT 'ι’θ²id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι’θ²εη§°',
  `colour_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ²ε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄ι’θ²';

-- ----------------------------
-- Table structure for ims_yz_ckt_industry
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_industry`;
CREATE TABLE `ims_yz_ckt_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) DEFAULT NULL COMMENT 'θ‘δΈid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘δΈεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄θ‘δΈ';

-- ----------------------------
-- Table structure for ims_yz_ckt_purpose
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_purpose`;
CREATE TABLE `ims_yz_ckt_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose_id` int(11) DEFAULT NULL COMMENT 'η¨ιid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¨ιεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄η¨ι';

-- ----------------------------
-- Table structure for ims_yz_ckt_scene
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_scene`;
CREATE TABLE `ims_yz_ckt_scene` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(11) DEFAULT NULL COMMENT 'εΊζ―id',
  `class_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `industry_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΊζ―ids',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊζ―εη§°',
  `width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε?½',
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι«',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄εΊζ―';

-- ----------------------------
-- Table structure for ims_yz_ckt_style
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ckt_style`;
CREATE TABLE `ims_yz_ckt_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` int(11) DEFAULT NULL COMMENT 'ι£ζ Όid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι£ζ Όεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εε?’θ΄΄ι£ζ Ό';

-- ----------------------------
-- Table structure for ims_yz_clock_continuity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_continuity`;
CREATE TABLE `ims_yz_clock_continuity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `clock_num` int(11) DEFAULT NULL,
  `last_clock_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_pay_log`;
CREATE TABLE `ims_yz_clock_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ζ―δ»ιι’',
  `pay_method` tinyint(1) DEFAULT NULL COMMENT 'ζ―δ»ζΉεΌ',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '0ζͺζ―δ»1ζ―δ»ζε',
  `clock_in_status` tinyint(1) DEFAULT NULL COMMENT 'ζε‘ηΆζ0ζͺζε‘1ε·²ζε‘',
  `clock_in_at` int(11) DEFAULT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_queue`;
CREATE TABLE `ims_yz_clock_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `day_before_amount` decimal(10,2) DEFAULT NULL COMMENT 'εδΈε€©ε₯ιζ± ζ»ι’',
  `rate` decimal(10,2) DEFAULT NULL COMMENT 'ε₯ιεζΎζ―δΎ',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ζ»εζΎιι’',
  `pay_num` int(11) DEFAULT NULL COMMENT 'εδΈε€©ζ―δ»δΊΊζ°',
  `clock_in_num` int(11) DEFAULT NULL COMMENT 'ζε‘δΊΊζ°',
  `not_clock_in_num` int(11) DEFAULT NULL COMMENT 'ζͺζε‘δΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_reward_log`;
CREATE TABLE `ims_yz_clock_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_clock_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_clock_rule`;
CREATE TABLE `ims_yz_clock_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `rule_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_comment`;
CREATE TABLE `ims_yz_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` tinyint(1) DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `comment_id` int(11) DEFAULT '0',
  `reply_id` int(11) DEFAULT '0',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(3) DEFAULT '1',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `plugin_table_id` int(11) DEFAULT NULL COMMENT 'θ―θ?Ίε½ε±id?εΉ³ε°/ι¨εΊ',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ζΎη€ΊοΌ1-ζΎη€Ί',
  `is_top` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦η½?ι‘ΆοΌ1-η½?ι‘Ά',
  `score_latitude` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―εηΊ¬εΊ¦',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε?‘ζ ΈηΆζοΌ0-δΈιθ¦ε?‘ζ ΈοΌ1-ιθΏοΌ-1 = ι©³εοΌ2-εΎε?‘ζ Έ',
  `additional_comment_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θΏ½θ―ID',
  `has_default_good_reputation` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ι»θ?€ε₯½θ―οΌ1-ζ―',
  `order_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εεεθ‘¨ID',
  `level_set` int(11) NOT NULL DEFAULT '0' COMMENT 'ζε¨θ?Ύη½?η­ηΊ§',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_orderid` (`order_id`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_openid` (`uid`),
  KEY `idx_createtime` (`created_at`),
  KEY `idx_is_show` (`is_show`),
  KEY `idx_is_top` (`is_top`),
  KEY `idx_audit_status` (`audit_status`),
  KEY `idx_order_goods_id` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_comment_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_comment_config`;
CREATE TABLE `ims_yz_comment_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `is_comment_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―θ?Ίε?‘ζ ΈοΌ1-εΌε―',
  `is_default_good_reputation` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ι»θ?€ε₯½θ―οΌ1-εΌε―',
  `is_order_comment_entrance` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εζΎη€Ίθ―θ?Ίε₯ε£οΌ1-εΌε―',
  `is_additional_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θΏ½θ―οΌ1-εΌε―',
  `is_score_latitude` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―εη»΄εΊ¦οΌ1-εΌε―',
  `top_sort` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'asc' COMMENT 'η½?ι‘ΆζεΊοΌascεεΊοΌdescεεΊ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_top_sort` (`top_sort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ?Ίθ?Ύη½?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_commission_edit_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_edit_log`;
CREATE TABLE `ims_yz_commission_edit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_log`;
CREATE TABLE `ims_yz_commission_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `before_level_id` int(11) NOT NULL DEFAULT '0',
  `after_level_id` int(11) NOT NULL DEFAULT '0',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_lose
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_lose`;
CREATE TABLE `ims_yz_commission_lose` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `award_id` int(11) DEFAULT NULL COMMENT 'ειε₯ε±id',
  `amount_seal` decimal(10,2) DEFAULT NULL COMMENT 'ε°ι‘Άιι’',
  `today_commission` decimal(10,2) DEFAULT NULL COMMENT 'δ»ζ₯ειδ½£ι',
  `today_team_dividend` decimal(10,2) DEFAULT NULL COMMENT 'δ»ζ₯η»ιεε₯ε±',
  `today_share` decimal(10,2) DEFAULT NULL COMMENT 'δ»ζ₯ε±δΊ«ε₯',
  `should_amount` decimal(10,2) DEFAULT NULL COMMENT 'εΊθ―₯θ·εΎε₯ε±ιι’',
  `reality_amount` decimal(10,2) DEFAULT NULL COMMENT 'ε?ιε₯ε±ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_manage`;
CREATE TABLE `ims_yz_commission_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'θ·ε₯θ',
  `subordinate_id` int(11) DEFAULT NULL COMMENT 'δΈηΊ§ειε',
  `subordinate_commission` decimal(12,2) DEFAULT NULL COMMENT 'δΈηΊ§δ½£ι',
  `hierarchy` int(11) DEFAULT NULL COMMENT 'δΈηΊ§ε±ηΊ§',
  `manage_rage` int(11) DEFAULT NULL COMMENT 'η?‘ηε₯ζ―δΎ',
  `manage_amount` decimal(12,2) DEFAULT NULL COMMENT 'η?‘ηε₯ιι’',
  `status` tinyint(1) DEFAULT '0' COMMENT 'η?‘ηε₯ηΆζ 0ζͺζη° 1ε·²ζη°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_operation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_operation`;
CREATE TABLE `ims_yz_commission_operation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `buy_uid` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `ratio` decimal(10,2) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_order`;
CREATE TABLE `ims_yz_commission_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `ordertable_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordertable_id` int(11) DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `commission_amount` decimal(14,2) DEFAULT '0.00',
  `formula` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hierarchy` int(11) DEFAULT '1',
  `commission_rate` decimal(14,2) DEFAULT '0.00',
  `commission` decimal(14,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT '0',
  `recrive_at` int(11) DEFAULT NULL,
  `settle_days` int(11) DEFAULT '0',
  `statement_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `withdraw` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_commission_order_ordertable_id_index` (`ordertable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_commission_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_commission_order_goods`;
CREATE TABLE `ims_yz_commission_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commission_order_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_commission` tinyint(1) DEFAULT NULL,
  `commission_rate` int(11) DEFAULT NULL,
  `commission_pay` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_conference_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_conference_activity`;
CREATE TABLE `ims_yz_conference_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL COMMENT 'θ‘¨εID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `max_limit` int(11) DEFAULT NULL COMMENT 'ζ₯εδΊΊζ°ζε€§ιεΆ',
  `starttime` int(11) DEFAULT NULL COMMENT 'εΌε§ζΆι΄',
  `endtime` int(11) DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εΎη',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ΄»ε¨δ»η»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδΊ«ζ ι’',
  `share_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδΊ«εΎζ ',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδΊ«ζθΏ°',
  `integral` int(11) DEFAULT NULL COMMENT 'η§―ε',
  `love` int(11) DEFAULT NULL COMMENT 'η±εΏεΌ',
  `send_level_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'ειζΆζ―ηδΌεids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_conference_enrol
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_conference_enrol`;
CREATE TABLE `ims_yz_conference_enrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_data_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_consume_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_consume_coupon_log`;
CREATE TABLE `ims_yz_consume_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `order_id` int(11) DEFAULT '0' COMMENT 'θ?’εid',
  `member_id` int(11) DEFAULT '0' COMMENT 'δΌεid',
  `type` tinyint(4) DEFAULT '0' COMMENT 'η±»ε1θ·εΎ2δ½Ώη¨',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT 'εεζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΈε‘ιζΆθ΄ΉεΈθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_converge_pay_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_bank_card`;
CREATE TABLE `ims_yz_converge_pay_bank_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `receiverAccountNoEnc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ¬ΎδΊΊιΆθ‘ε‘ε‘ε·',
  `receiverNameEnc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ¬ΎδΊΊιΆθ‘ε‘ζε‘δΊΊεη§°',
  `receiverAccountType` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ΄¦ζ·η±»ε, ε―Ήη§θ΄¦ζ·: 201;ε―Ήε¬θ΄¦ζ·: 204',
  `receiverBankChannelNo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ¬Ύθ΄¦ζ·θθ‘ε·, ε―Ήε¬θ΄¦ζ·εΏι‘»ε‘«εζ­€ε­ζ?΅',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_bank_card_member_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_bank_card_member_default`;
CREATE TABLE `ims_yz_converge_pay_bank_card_member_default` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'ιΆθ‘ε‘ε³θδΌε id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `default` int(11) NOT NULL COMMENT 'δΌει»θ?€ιΆθ‘ε‘ id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_withdraw_card_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_withdraw_card_log`;
CREATE TABLE `ims_yz_converge_pay_withdraw_card_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `card_id` int(11) NOT NULL COMMENT 'ιΆθ‘ε‘id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_pay_withdraw_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_pay_withdraw_log`;
CREATE TABLE `ims_yz_converge_pay_withdraw_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `withdraw_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εεζη°ε·',
  `merchantOrderNo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ±θθ―·ζ±ε·',
  `paidAmount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζη°ιι’',
  `status` tinyint(4) DEFAULT '0' COMMENT 'ζη°ηΆζ',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT 'ζη°θ―·ζ±ζ°ζ?',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT 'ζη°θΏεζ°ζ?',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ιθ――δΏ‘ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `withdraw_type` tinyint(4) DEFAULT '0' COMMENT 'ζη°η±»ε:0εε1δΎεΊε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_pay_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_pay_bank_card`;
CREATE TABLE `ims_yz_converge_quick_pay_bank_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `request_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―·ζ±ε·',
  `bank_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε±ιΆθ‘',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε±ιΆθ‘εη§°',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘ε·',
  `sign_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ε‘η­ΎηΊ¦ID',
  `payer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε‘δΊΊε§ε',
  `payer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘η»ε?ζζΊε·',
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε‘δΊΊθ―δ»Άε·',
  `expire_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'δΏ‘η¨ε‘ζζζ',
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'δΏ‘η¨ε‘CVVε?ε¨η ',
  `id_type` tinyint(4) DEFAULT NULL COMMENT 'ζε‘δΊΊθ―δ»Άη±»ε',
  `bank_type` tinyint(4) DEFAULT '0' COMMENT 'ιΆθ‘ε‘η±»ε',
  `status` tinyint(4) DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_pay_order`;
CREATE TABLE `ims_yz_converge_quick_pay_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `pay_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―·ζ±ε·',
  `jp_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ±θεΉ³ε°ζ΅ζ°΄ε·',
  `mch_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεζ―δ»θ?’εε·',
  `bank_trx_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΆθ‘ζ΅ζ°΄ε·',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘ε·',
  `sign_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ε‘η­ΎηΊ¦ID',
  `order_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ―δ»ιι’',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΆζ',
  `pay_type` tinyint(4) DEFAULT '0' COMMENT 'δΊ§εη±»εοΌ1οΌη΄ζ₯ 2οΌεθ??',
  `pay_at` int(11) DEFAULT NULL COMMENT 'ζ―δ»ε?ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’ειθ――η ',
  `err_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’ειθ――η ζθΏ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_converge_quick_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_converge_quick_refund_order`;
CREATE TABLE `ims_yz_converge_quick_refund_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `refund_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιζ¬Ύθ―·ζ±ε·',
  `refund_trx_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ±θιζ¬Ύζ΅ζ°΄ε·',
  `mch_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεζ―δ»θ?’εε·',
  `refund_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ιζ¬Ύιι’',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ιζ¬ΎηΆζ',
  `refund_at` int(11) DEFAULT NULL COMMENT 'ιζ¬Ύε?ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’ειθ――η ',
  `err_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’ειθ――η ζθΏ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_core_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_core_attachment`;
CREATE TABLE `ims_yz_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `module_upload_dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `upload_type` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT '0',
  `timeline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζΆιΏ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_core_attachment_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_core_attachment_tags`;
CREATE TABLE `ims_yz_core_attachment_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `source_type` int(11) NOT NULL COMMENT '1εΎη2ι³ι’3θ§ι’',
  `tag_type` int(11) NOT NULL COMMENT '1η³»η»εη»2θͺε?δΉεη»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `timeline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon`;
CREATE TABLE `ims_yz_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cat_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `get_type` tinyint(3) DEFAULT '0',
  `level_limit` int(11) NOT NULL DEFAULT '0',
  `get_max` int(11) DEFAULT '0',
  `get_limit_max` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―δΊΊζ―ζ₯ιι’ζ°ι',
  `get_limit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―δΊΊζ―ζ₯ιι’ηΆζ',
  `use_type` tinyint(3) unsigned DEFAULT '0',
  `return_type` tinyint(3) DEFAULT '0',
  `bgcolor` varchar(255) DEFAULT '',
  `enough` int(11) NOT NULL DEFAULT '0',
  `coupon_type` tinyint(3) DEFAULT '0',
  `time_limit` tinyint(3) DEFAULT '0',
  `time_days` int(11) DEFAULT '0',
  `time_start` int(11) DEFAULT '0',
  `time_end` int(11) DEFAULT '0',
  `coupon_method` tinyint(4) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `deduct` decimal(10,2) DEFAULT '0.00',
  `back_type` tinyint(3) DEFAULT '0',
  `back_money` varchar(50) DEFAULT '',
  `back_credit` varchar(50) DEFAULT '',
  `back_redpack` varchar(50) DEFAULT '',
  `back_when` tinyint(3) DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `desc` text,
  `total` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `resp_desc` text,
  `resp_thumb` varchar(255) DEFAULT '',
  `resp_title` varchar(255) DEFAULT '',
  `resp_url` varchar(255) DEFAULT '',
  `credit` int(11) DEFAULT '0',
  `usecredit2` tinyint(3) DEFAULT '0',
  `remark` varchar(1000) DEFAULT '',
  `descnoset` tinyint(3) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `supplier_uid` int(11) DEFAULT '0',
  `getcashier` tinyint(1) NOT NULL DEFAULT '0',
  `cashiersids` text,
  `cashiersnames` text,
  `category_ids` text,
  `categorynames` text,
  `goods_names` text,
  `goods_ids` text,
  `storeids` text,
  `storenames` text,
  `member_tags_ids` text COMMENT 'δΌεζ η­Ύidη»',
  `member_tags_names` text COMMENT 'δΌεζ η­Ύεη§°',
  `getstore` tinyint(1) NOT NULL DEFAULT '0',
  `getsupplier` tinyint(1) DEFAULT '0',
  `supplierids` text,
  `suppliernames` text,
  `createtime` int(11) DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `is_complex` tinyint(4) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `use_conditions` longtext COMMENT 'δ½Ώη¨ζ‘δ»Ά',
  `is_integral_exchange_coupon` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζΆθ΄Ήη§―εεζ’δΌζ εΈοΌ1-εΌε―οΌ0-ε³ι­',
  `exchange_coupon_integral` decimal(10,2) DEFAULT NULL COMMENT 'εζ’δΌζ εΈιθ¦ζΆθ΄Ήη§―ε',
  PRIMARY KEY (`id`),
  KEY `idx_catid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_category`;
CREATE TABLE `ims_yz_coupon_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `display_order` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_hotel`;
CREATE TABLE `ims_yz_coupon_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌζ εΈid',
  `hotel_id` int(11) DEFAULT NULL COMMENT 'ιεΊid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_increase_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_increase_records`;
CREATE TABLE `ims_yz_coupon_increase_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT 'ζ―ζ¬‘ζ°ε’ηζ°ι',
  `coupon_id` int(11) NOT NULL COMMENT 'δΌζ εΈid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_coupon_increase_records_id_unique` (`id`),
  KEY `yz_coupon_increase_records_coupon_id_index` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌζ εΈζ°ε’θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_log`;
CREATE TABLE `ims_yz_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `logno` varchar(255) DEFAULT '',
  `member_id` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `paystatus` tinyint(3) DEFAULT '0',
  `creditstatus` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `paytype` tinyint(3) DEFAULT '0',
  `getfrom` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_status` (`status`),
  KEY `idx_paystatus` (`paystatus`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_getfrom` (`getfrom`)
) ENGINE=InnoDB AUTO_INCREMENT=455074 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_contrast
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_contrast`;
CREATE TABLE `ims_yz_coupon_qr_contrast` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_coupon_id` int(11) DEFAULT NULL COMMENT 'δΌεδΌζ εΈid',
  `random_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιζΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεid',
  PRIMARY KEY (`id`),
  KEY `ids_qr_contrast_random_data` (`random_data`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_generate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_generate`;
CREATE TABLE `ims_yz_coupon_qr_generate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `coupon_type_id` int(11) DEFAULT NULL COMMENT 'δΌζ εΈη±»εid',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΌζ εΈη±»εεη§°',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΊη»΄η θ·―εΎ',
  `small` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊδΊη»΄η θ·―εΎ',
  `generation_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηζζΉεΌ 1-ε¬δΌε·  2-ε°η¨εΊ',
  `grant_num` int(11) NOT NULL DEFAULT '0' COMMENT 'εζΎζ°ι',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ·³θ½¬ιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_qr_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_qr_record`;
CREATE TABLE `ims_yz_coupon_qr_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `coupon_type_id` int(11) NOT NULL COMMENT 'δΌζ εΈη±»εid',
  `coupon_id` int(11) NOT NULL COMMENT 'δΌζ εΈid',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_slide_show
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_slide_show`;
CREATE TABLE `ims_yz_coupon_slide_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ ι’',
  `slide_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηεΎη',
  `slide_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΉ»η―ηθΏζ₯',
  `mini_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊθΏζ₯',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζΎη€Ί',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_store`;
CREATE TABLE `ims_yz_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌζ εΈid',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_coupon_use_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_coupon_use_log`;
CREATE TABLE `ims_yz_coupon_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―¦ζ',
  `coupon_id` int(11) NOT NULL COMMENT 'δΌζ εΈID',
  `member_coupon_id` int(11) NOT NULL COMMENT 'δΌεδΌζ εΈID',
  `type` int(11) NOT NULL COMMENT 'η±»ε',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`coupon_id`),
  KEY `idx_membercouponid` (`member_coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cps_sub_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_member`;
CREATE TABLE `ims_yz_cps_sub_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL COMMENT 'δΌεid',
  `another_id` int(10) unsigned NOT NULL COMMENT 'ζ»εΉ³ε°δΌεid',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΊη¨key',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--δΌεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_order`;
CREATE TABLE `ims_yz_cps_sub_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `amount` decimal(10,2) NOT NULL COMMENT 'θ?’ειι’',
  `bird_order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¬¬δΈζΉθ?’εε·',
  `order_id` int(10) unsigned NOT NULL COMMENT 'θ?’εid',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?’εε·',
  `bird_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¬¬δΈζΉεΉ³ε°ε',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εηΆζ 0εΎε?ζ 1ε·²η»η? -1ε·²ε€±ζ',
  `create_time` int(11) DEFAULT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `close_time` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `yun_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θΈθ?’εε·',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--θ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_plat_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_plat_activity`;
CREATE TABLE `ims_yz_cps_sub_plat_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εΌε―ηΆζ 0ε³ι­ 1εΌε―',
  `another_id` int(10) unsigned NOT NULL COMMENT 'εΏεΊιΈθ΅ζΊη±»εid',
  `another_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΏεΊιΈθ΅ζΊη±»εε',
  `web_poster_id` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·ζ΅·ζ₯id',
  `mini_poster_id` int(10) unsigned NOT NULL COMMENT 'ε°η¨εΊζ΅·ζ₯id',
  `bottom_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΊι¨ζζ¬',
  `top_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊι¨ζζ¬',
  `page_type` tinyint(4) NOT NULL DEFAULT '3' COMMENT 'ι‘΅ι’η±»ε 1H5 2ε°η¨εΊ 3H5+ε°η¨εΊ',
  `visit_count` int(11) NOT NULL COMMENT 'θ?Ώι?ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--ζ¨εΉΏθ΅ζΊθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_plat_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_plat_activity_code`;
CREATE TABLE `ims_yz_cps_sub_plat_activity_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯',
  `code_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΊη»΄η ζε°η¨εΊη εΎηιΎζ₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--ζ¨εΉΏζ΄»ε¨η θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_reward_log`;
CREATE TABLE `ims_yz_cps_sub_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `amount` decimal(10,2) NOT NULL COMMENT 'ε₯ε±ιι’',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΎε₯ε± 1ε₯ε±ε?ζ',
  `reward_type` tinyint(4) NOT NULL COMMENT '1δ½ι’ 2η§―ε',
  `level` tinyint(4) NOT NULL COMMENT 'ε±ηΊ§',
  `order_id` int(11) NOT NULL COMMENT 'θ?’εid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--ε₯ε±θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cps_sub_set_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cps_sub_set_log`;
CREATE TABLE `ims_yz_cps_sub_set_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `set_log` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?Ύη½?θ?°ε½',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='cpsε­εΉ³ε°--θ?Ύη½?θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_cr_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_activity`;
CREATE TABLE `ims_yz_cr_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `rule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_buyer_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_buyer_count`;
CREATE TABLE `ims_yz_cr_buyer_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `cr_goods_id` int(10) unsigned NOT NULL,
  `buyer_count` int(10) unsigned NOT NULL,
  `buyer_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_buyer_count_cr_goods_id_index` (`cr_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_goods`;
CREATE TABLE `ims_yz_cr_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_order`;
CREATE TABLE `ims_yz_cr_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `reward_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_order_pay_time_state_activity_id_index` (`pay_time`,`state`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_order_goods`;
CREATE TABLE `ims_yz_cr_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `cr_goods_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `cr_order_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_cr_order_goods_cr_order_id_index` (`cr_order_id`),
  KEY `yz_cr_order_goods_cr_goods_id_state_index` (`cr_goods_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_poster`;
CREATE TABLE `ims_yz_cr_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1ζ?ιδΊη»΄η   2ε°η¨εΊη   3ε¬δΌε·η ',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cr_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cr_reward_log`;
CREATE TABLE `ims_yz_cr_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `cr_order_id` int(10) unsigned NOT NULL,
  `coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζͺεζΎ 1ε·²εζΎ',
  `prize_type` tinyint(4) NOT NULL,
  `prize_num` int(11) NOT NULL,
  `reward_type` tinyint(4) NOT NULL,
  `reward_amount` decimal(10,2) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_cron_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_cron_heartbeat`;
CREATE TABLE `ims_yz_cron_heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_time` int(11) DEFAULT NULL COMMENT 'ζ§θ‘ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_decorate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate`;
CREATE TABLE `ims_yz_decorate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `member_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'ζ΅θ§ζιοΌδΌεη­ηΊ§οΌ0δΈΊε¨ι¨δΌεη­ηΊ§',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '0.δΈζΎη€Ί θͺε?δΉι‘Άι¨ε―Όθͺid',
  `foot_type` int(11) NOT NULL DEFAULT '1' COMMENT 'εΊι¨ε―Όθͺ 0.δΈζΎη€Ί 1.η³»η»ι»θ?€ 2.θͺε?δΉ',
  `foot_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θͺε?δΉεΊι¨ε―Όθͺid',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘΅ι’ζ°ζ?ιε',
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’εη§°',
  `page_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'ι‘΅ι’η±»ε 0.εΆδ» 1.ε¬δΌε· 2.ε°η¨εΊ 3.APP 4.ζ―δ»ε? 5.WAP',
  `page_sort` tinyint(4) NOT NULL DEFAULT '1' COMMENT ' 1.H5 2.ε°η¨εΊ',
  `page_scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ι‘΅ι’εΊζ― 1.ι¦ι‘΅ 2.δΌει‘΅ 3.εΊιΊ',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨',
  `datas` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘΅ι’η»δ»Άζ°ζ?ιε',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε ι€ 1.ε ι€ 0.ζ­£εΈΈ',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `cps_foot_type` int(11) NOT NULL DEFAULT '1' COMMENT 'cpsεΊι¨ε―Όθͺ 0.δΈζΎη€Ί 1.η³»η»ι»θ?€ 2.θͺε?δΉ',
  `cps_foot_id` int(11) NOT NULL DEFAULT '0' COMMENT 'cpsθͺε?δΉεΊι¨ε―Όθͺid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--θ£δΏ?εθ‘¨ε­ζΎι‘΅ι’θ£δΏ?ζ°ζ?';

-- ----------------------------
-- Table structure for ims_yz_decorate_advertising
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_advertising`;
CREATE TABLE `ims_yz_decorate_advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’ζ ι’',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΉΏεεΎ',
  `show_time` int(11) NOT NULL DEFAULT '0' COMMENT 'εΉΏεζΎη€ΊζΆι΄(η§)',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'εΉΏεη±»ε 1.εΌΉηͺεΉΏε 2.ε¨ε±εΉΏε',
  `show_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζΎη€Ίθ§ε0.ε¨ε±εΉΏε 1.ζ―ζ¬‘θΏε₯ι¦ι‘΅ζΆ 2.ζ―ζ₯ι¦ζ¬‘η»ιε°η¨εΊζΆ',
  `url_type` int(11) NOT NULL DEFAULT '0' COMMENT 'θ·³θ½¬ιΎζ₯η±»ε 1.h5,2.ε°η¨εΊ',
  `h_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'H5εΉΏεθ·³θ½¬ιΎζ₯',
  `s_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊεΉΏεθ·³θ½¬ιΎζ₯',
  `s_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊεε§id',
  `is_minapp` int(11) NOT NULL DEFAULT '0' COMMENT '1.θ·³θ½¬ι‘΅ι’οΌ2οΌθ·³θ½¬ε°η¨εΊ',
  `minapp_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊθ·³θ½¬ε°η¨εΊιΎζ₯',
  `minapp_sid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊθ·³θ½¬ε°η¨εΊιΎζ₯ηid',
  `minapp_link2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊθ·³θ½¬ι‘΅ι’',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `datas` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘΅ι’η»δ»Άζ°ζ?ιε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--ι¦ε±εΉΏε';

-- ----------------------------
-- Table structure for ims_yz_decorate_diy_market
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_diy_market`;
CREATE TABLE `ims_yz_decorate_diy_market` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `sync_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θΏη«―ζ¨‘ζΏid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ζΏεη§°',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η±»ε«',
  `page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η±»ε',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ζΏεΎη',
  `data` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:ε·²ζεοΌ0:ζͺζε',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--diyεΈεΊ';

-- ----------------------------
-- Table structure for ims_yz_decorate_footer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_footer`;
CREATE TABLE `ims_yz_decorate_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘΅ι’ζ°ζ?ιε',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’εη§°',
  `page_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 1.H5 2.ε°η¨εΊ',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨ 0.ζͺε―η¨ 1.ε―η¨',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--εΊι¨ε―Όθͺ';

-- ----------------------------
-- Table structure for ims_yz_decorate_templet
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_templet`;
CREATE TABLE `ims_yz_decorate_templet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ζΏεη§°',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ζΏεΎη',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ζΏηΌε·',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ¨‘ζΏη±»ε δΌεδΈ­εΏ=1 ζ¨εΉΏδΈ­εΏ=2 εη±»δΈ­εΏ=3 εεζ¨‘η=4 εεεθ‘¨=5',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--ζ¨‘ζΏη?‘η';

-- ----------------------------
-- Table structure for ims_yz_decorate_top
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_decorate_top`;
CREATE TABLE `ims_yz_decorate_top` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `page_info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘΅ι’ζ°ζ?ιε',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’εη§°',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨',
  `top_type` int(11) NOT NULL DEFAULT '1' COMMENT '1.h5 2.ε°η¨εΊ',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ι‘΅ι’θ£δΏ?--ι‘Άι¨ε―Όθͺ';

-- ----------------------------
-- Table structure for ims_yz_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_deduction`;
CREATE TABLE `ims_yz_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΅ζ£εη§°',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ΅ζ£εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch`;
CREATE TABLE `ims_yz_dispatch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `dispatch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιιζ¨‘ζΏεη§°',
  `display_order` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `enabled` tinyint(3) DEFAULT NULL COMMENT 'ζ―ε¦ζΎη€ΊοΌ1οΌζ―οΌ0οΌε¦οΌ',
  `is_default` tinyint(3) DEFAULT NULL COMMENT 'ζ―ε¦ι»θ?€ζ¨‘ζΏοΌ1οΌζ―οΌ0οΌε¦οΌ',
  `calculate_type` tinyint(3) DEFAULT NULL COMMENT 'θ?‘θ΄ΉζΉεΌ',
  `areas` text COLLATE utf8mb4_unicode_ci COMMENT 'ιιεΊε',
  `first_weight` int(11) DEFAULT NULL COMMENT 'ι¦ιεζ°',
  `another_weight` int(11) DEFAULT NULL COMMENT 'η»­ιεζ°',
  `first_weight_price` decimal(14,2) DEFAULT NULL COMMENT 'ι¦ιδ»·ζ Ό',
  `another_weight_price` decimal(14,2) DEFAULT NULL COMMENT 'η»­ιδ»·ζ Ό',
  `first_piece` int(11) DEFAULT NULL COMMENT 'ι¦δ»ΆδΈͺζ°',
  `another_piece` int(11) DEFAULT NULL COMMENT 'η»­δ»ΆδΈͺζ°',
  `first_piece_price` decimal(14,2) DEFAULT NULL COMMENT 'ι¦δ»Άδ»·ζ Ό',
  `another_piece_price` decimal(14,2) DEFAULT NULL COMMENT 'η»­δ»Άδ»·ζ Ό',
  `weight_data` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ζιιθ?‘θ΄Ήζ°ζ?',
  `piece_data` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ζζ°ιθ?‘θ΄Ήζ°ζ?',
  `is_plugin` tinyint(3) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch_classify
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_classify`;
CREATE TABLE `ims_yz_dispatch_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `dispatch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freight_type` tinyint(4) NOT NULL COMMENT 'θΏθ΄Ήη±»ε',
  `freight_value` int(11) DEFAULT NULL COMMENT 'εΊε?θΏθ΄ΉεΌ',
  `template_id` int(11) DEFAULT NULL COMMENT 'θΏθ΄Ήζ¨‘ζΏID',
  `is_cod` int(11) NOT NULL COMMENT 'ζ―ε¦ζ―ζθ²¨ε°δ»ζ¬Ύ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_dispatch_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_type`;
CREATE TABLE `ims_yz_dispatch_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `plugin` int(11) NOT NULL,
  `need_send` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_dispatch_type_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_dispatch_type_set`;
CREATE TABLE `ims_yz_dispatch_type_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `dispatch_type_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ιιζΉεΌID',
  `sort` tinyint(4) DEFAULT '0' COMMENT 'ζεΊ',
  `enable` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispatch_type_idx` (`dispatch_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ιιζΉεΌθ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_distribution_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_distribution_order`;
CREATE TABLE `ims_yz_distribution_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `commission_order_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ειθ?’εζ°',
  `commission_order_prices` decimal(65,2) NOT NULL DEFAULT '0.00' COMMENT 'ειθ?’εδΈη»©',
  `team_people_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιζ»δΊΊζ°',
  `team_commission_order_prices` decimal(65,2) NOT NULL DEFAULT '0.00' COMMENT 'ε’ιειθ?’εδΈη»©',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_cashier
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_cashier`;
CREATE TABLE `ims_yz_diy_queue_cashier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashier_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―θͺε?δΉιε',
  `is_independent` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―η¬η«θ§ε',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆι΄ζ?΅',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT 'ιεΆζ‘δ»Ά',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_hotel`;
CREATE TABLE `ims_yz_diy_queue_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―θͺε?δΉιε',
  `is_independent` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―η¬η«θ§ε',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆι΄ζ?΅',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT 'ιεΆζ‘δ»Ά',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `extract_ratio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diy_queue_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diy_queue_store`;
CREATE TABLE `ims_yz_diy_queue_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―θͺε?δΉιε',
  `is_independent` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―η¬η«θ§ε',
  `time` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆι΄ζ?΅',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§',
  `limit` text COLLATE utf8mb4_unicode_ci COMMENT 'ιεΆζ‘δ»Ά',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `extract_ratio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_data`;
CREATE TABLE `ims_yz_diyform_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `form_id` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `form_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_typeid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_order`;
CREATE TABLE `ims_yz_diyform_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_order_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_order_content`;
CREATE TABLE `ims_yz_diyform_order_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_type`;
CREATE TABLE `ims_yz_diyform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ‘¨εζ ι’',
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ‘¨εεε?Ή',
  `status` tinyint(1) DEFAULT '1' COMMENT 'ηΆζ',
  `success` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΊ€ζεζη€Ίζζ¬',
  `submit_number` int(11) DEFAULT NULL COMMENT 'εθ?ΈζδΊ€ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `share_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_diyform_type_member_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_diyform_type_member_data`;
CREATE TABLE `ims_yz_diyform_type_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `form_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `form_data_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_activity`;
CREATE TABLE `ims_yz_draw_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countdown_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_type` tinyint(4) DEFAULT NULL COMMENT 'εδΈδΊΊθΊ«δ»½',
  `member_type` tinyint(4) DEFAULT NULL COMMENT 'δΌε/ζ¨εΉΏε',
  `level_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΌεη­ηΊ§id',
  `draw_type` tinyint(4) DEFAULT NULL COMMENT 'ζ΄»ε¨ζ½ε₯ζΉεΌ0ζ ιεΆ/1η§―ε/2η±εΏεΌ',
  `use_point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆθη§―ε',
  `use_love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆθη±εΏεΌ',
  `partake_times` tinyint(4) DEFAULT NULL COMMENT 'εδΈζ¬‘ζ°η±»ε0ζ―ε€©/1ζ―δΊΊ',
  `days_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―ε€©ε―ζ½',
  `days_share_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―ε€©εδΊ«θ·εΎζ¬‘ζ°',
  `somebody_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―δΊΊε―ζ½',
  `somebody_share_times` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―δΊΊεδΊ«θ·εΎζ¬‘ζ°',
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε₯εidη»',
  `empty_prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η©Ίε₯εη§°',
  `empty_prize_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η©Ίε₯εΎη',
  `empty_prize_prompt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζη€Ίθ―­',
  `jump_type` tinyint(4) DEFAULT NULL COMMENT 'θ·³θ½¬η±»ε0ζ θ·³θ½¬/1ζθ·³θ½¬',
  `jump_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ·³θ½¬ιΎζ₯',
  `partake_point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΈιη§―ε',
  `partake_love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΈιη±εΏεΌ',
  `partake_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΈιδ½ι’',
  `partake_coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΈιδΌζ ε·',
  `limit` tinyint(4) DEFAULT NULL COMMENT 'εδΈε₯ιεΆ0ζͺδΈ­ε₯θ/1ζζδΊΊ',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θζ―εΎ',
  `background_colour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θζ―θ²',
  `is_logo` tinyint(4) DEFAULT NULL COMMENT 'εε?ΆlogoδΈε±η€Ί0/1ε±η€Ί',
  `is_roster` tinyint(4) DEFAULT NULL COMMENT 'δΈ­ε₯εεδΈε±η€Ί0/1ε±η€Ί',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ΄»ε¨θ―΄ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draw_times` int(11) DEFAULT '0' COMMENT 'ζ½ε₯δΊΊζ°',
  `member_draw_times` int(11) DEFAULT '0' COMMENT 'δΈ­ε₯δΊΊζ°',
  `success_app_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζεθ·³θ½¬ε¬δΌε·ιΎζ₯',
  `success_mini_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζεθ·³θ½¬ε°η¨εΊιΎζ₯',
  `describe_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨ζθΏ°',
  `prize_name` int(11) NOT NULL DEFAULT '1' COMMENT 'ε₯εεη§° (1=ε±η€Ί, 0=δΈε±η€Ί)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_by_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_by_member`;
CREATE TABLE `ims_yz_draw_by_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `log` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_prize
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_prize`;
CREATE TABLE `ims_yz_draw_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT 'η±»ε',
  `coupon_id` int(11) DEFAULT NULL COMMENT 'δΌζ ε·id',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT 'η§―ε',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT 'η±εΏεΌ',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT 'δ½ι’',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize_num` int(11) DEFAULT NULL COMMENT 'ε₯εζ°ι',
  `chance` double(14,2) DEFAULT NULL COMMENT 'δΈ­ε₯ζ¦η',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `coupon_num` int(11) NOT NULL DEFAULT '1' COMMENT 'δΌζ εΈζ°ι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_prize_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_prize_record`;
CREATE TABLE `ims_yz_draw_prize_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` decimal(14,2) DEFAULT NULL,
  `love` decimal(14,2) DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_draw_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_draw_share`;
CREATE TABLE `ims_yz_draw_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_order_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_order_package`;
CREATE TABLE `ims_yz_electronics_bill_order_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `order_id` int(11) NOT NULL COMMENT 'θ?’εid',
  `package_goods` text COLLATE utf8mb4_unicode_ci COMMENT 'εθ£Ήεε',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊID',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_electronics_bill_order_package_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΅ε­ι’ε----θ?’εεθ£Ήθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_panel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_panel`;
CREATE TABLE `ims_yz_electronics_bill_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `panel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εεη§°',
  `panel_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εε?’ζ·θ΄¦ε·',
  `panel_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εε―η ',
  `panel_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζη»ηΌη ',
  `panel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άη½ηΉζ θ―',
  `panel_style` int(11) NOT NULL COMMENT 'ζ¨‘ζΏζ ·εΌ',
  `exhelper_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΏ«ιη±»ε',
  `exhelper_type` int(11) NOT NULL DEFAULT '0' COMMENT 'εΏ«ι/εΏ«θΏδΈε‘η±»ε',
  `is_self` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιη₯εΏ«ιεδΈι¨ζ½δ»Ά',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL COMMENT 'εΏ«ιεζ½δ»Άζ₯ζ',
  `begin_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΏ«ιεζ½δ»ΆεΌε§ζΆι΄',
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΏ«ιεζ½δ»Άη»ζζΆι΄',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊID',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΅ε­ι’ε----η΅ε­ι’εζ¨‘ζΏθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_send_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_send_user`;
CREATE TABLE `ims_yz_electronics_bill_send_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΅ε­ι’ε----ζΆδ»ΆδΊΊδΏ‘ζ―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_sys`;
CREATE TABLE `ims_yz_electronics_bill_sys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζε°ζΊip',
  `port` int(11) DEFAULT '0' COMMENT 'ζε°ζΊη«―ε£',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζε°ζΊεη§°',
  `apikey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'APPID',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'APPSecret',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΅ε­ι’ε----ζε°δΏ‘ζ―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_electronics_bill_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_electronics_bill_template`;
CREATE TABLE `ims_yz_electronics_bill_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εid',
  `print_template` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι’εζε°ζ¨‘ζΏεε?Ή(htmlζ ΌεΌ)',
  `mark_destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€§ε€΄η¬',
  `logistic_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΏ«ιεε·',
  `shipper_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΏ«ιε¬εΈηΌη ',
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εηΌε·',
  `package_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιεηΌη ',
  `sorting_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εζ£ηΌη ',
  `sub_count` int(11) NOT NULL COMMENT 'ε­εζ°ι',
  `ebusiness_id` int(11) NOT NULL COMMENT 'η¨ζ·ID',
  `uniquer_request_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε―δΈζ θ―',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θΏεηΌη ',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€±θ΄₯εε ',
  `success` tinyint(4) NOT NULL COMMENT 'ζεδΈε¦(true/false)',
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_electronics_bill_template_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΅ε­ι’ε----ζε°ζ¨‘ζΏε­ζΎθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_embargoed_area_goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_embargoed_area_goods_goods`;
CREATE TABLE `ims_yz_embargoed_area_goods_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `area_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'εΊεids',
  `province_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'ηids',
  `areas` text COLLATE utf8mb4_unicode_ci COMMENT 'εΊεεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η¦θΏεΊε--εεζδ»Ά';

-- ----------------------------
-- Table structure for ims_yz_error_commission_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_error_commission_order`;
CREATE TABLE `ims_yz_error_commission_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_order_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `order_id` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci,
  `commission_amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_error_team_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_error_team_dividend`;
CREATE TABLE `ims_yz_error_team_dividend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_dividend_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `order_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci,
  `dividend_amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_excel_recharge_detail
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_excel_recharge_detail`;
CREATE TABLE `ims_yz_excel_recharge_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `recharge_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_excel_recharge_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_excel_recharge_records`;
CREATE TABLE `ims_yz_excel_recharge_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ»δΈͺζ°',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ»ζ°ι',
  `failure` int(11) NOT NULL DEFAULT '0' COMMENT 'ε€±θ΄₯ζ°',
  `success` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζεζ°',
  `source` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨δΏ‘ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_delivery`;
CREATE TABLE `ims_yz_exhelper_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `width` decimal(10,2) DEFAULT NULL COMMENT 'εζ?ε?½εΊ¦',
  `height` decimal(10,2) DEFAULT NULL COMMENT 'εζ?ι«εΊ¦',
  `supplier_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΎεΊεεη§°',
  `supplier_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΎεΊεη΅θ―',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€ζ³¨',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='εΏ«ιε©ζ--ιθ΄§εζ¨‘ζΏ';

-- ----------------------------
-- Table structure for ims_yz_exhelper_electronic_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_electronic_template`;
CREATE TABLE `ims_yz_exhelper_electronic_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_template` longtext COLLATE utf8mb4_unicode_ci,
  `mark_destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logistic_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipper_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdn_order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_count` int(11) NOT NULL,
  `ebusiness_id` int(11) NOT NULL,
  `uniquer_request_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_express`;
CREATE TABLE `ims_yz_exhelper_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `expressname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `expresscom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `express` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` decimal(10,2) DEFAULT '0.00',
  `datas` text COLLATE utf8mb4_unicode_ci,
  `height` decimal(10,2) DEFAULT '0.00',
  `bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_goods`;
CREATE TABLE `ims_yz_exhelper_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `short_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_order`;
CREATE TABLE `ims_yz_exhelper_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_panel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_panel`;
CREATE TABLE `ims_yz_exhelper_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `panel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εεη§°',
  `panel_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εε?’ζ·θ΄¦ε·',
  `panel_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΅ε­ι’εε―η ',
  `panel_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζη»ηΌη ',
  `panel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άη½ηΉζ θ―',
  `panel_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¨‘ζΏζ ·εΌ',
  `exhelper_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΏ«ιη±»ε',
  `isself` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιη₯εΏ«ιεδΈι¨ζ½δ»Ά',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `begin_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  `exhelper_type` int(11) DEFAULT '0' COMMENT 'εΏ«ι/εΏ«θΏδΈε‘η±»ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_print
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_print`;
CREATE TABLE `ims_yz_exhelper_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `express_print_status` tinyint(1) NOT NULL DEFAULT '0',
  `send_print_status` tinyint(1) NOT NULL DEFAULT '0',
  `panel_print_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_senduser
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_senduser`;
CREATE TABLE `ims_yz_exhelper_senduser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_code` int(11) DEFAULT NULL,
  `sender_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sender_province` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_area` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_street` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_sys
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_sys`;
CREATE TABLE `ims_yz_exhelper_sys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `port` int(11) DEFAULT '0',
  `apikey` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `merchant_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_exhelper_template_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_exhelper_template_log`;
CREATE TABLE `ims_yz_exhelper_template_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_express_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_express_company`;
CREATE TABLE `ims_yz_express_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΏ«ιε¬εΈεη§°',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΏ«ιε¬εΈηΌη ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups`;
CREATE TABLE `ims_yz_fight_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ζ ι’',
  `start_time` int(11) NOT NULL COMMENT 'εΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εε?Άθ―΄ζ',
  `menu_show` tinyint(1) DEFAULT '0' COMMENT 'ιθεΌε³',
  `hide_num` int(11) DEFAULT '0' COMMENT 'ε½εε’δΊΊζ°θΎΎε°ε€ε°ζΆεΌε’ζι?δΈζΎη€Ί',
  `is_integral` tinyint(1) DEFAULT '0' COMMENT 'ε’ιΏιη§―ε',
  `integral_num` decimal(14,2) DEFAULT '0.00' COMMENT 'ιε€ε°η§―ε',
  `is_lead` tinyint(1) DEFAULT '0' COMMENT 'θζζ°',
  `setting` int(11) DEFAULT '0' COMMENT 'ζΌε’θ?Ύη½?',
  `barrage` tinyint(1) DEFAULT '0' COMMENT 'εΌΉεΉθ?Ύη½?',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εδΊ«ζ ι’',
  `share_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εδΊ«εε?Ή',
  `desc_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ―¦ζζ ι’',
  `desc_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ―¦ζεε?Ή',
  `status` int(11) DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_love` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―η±εΏεΌ',
  `love` decimal(14,2) DEFAULT NULL COMMENT 'ε₯ε±η±εΏεΌ',
  `is_balance` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―δ½ι’',
  `balance` decimal(14,2) DEFAULT NULL COMMENT 'ε₯ε±δ½ι’',
  `is_coupon` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―δΌζ ε·',
  `coupon` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌζ ε·',
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  `plugin_id` int(11) DEFAULT '0' COMMENT 'εεη±»ε',
  `commissions` text COLLATE utf8mb4_unicode_ci COMMENT 'ειη­ηΊ§',
  `c_level` tinyint(4) DEFAULT NULL COMMENT 'ειι»θ?€η­ηΊ§',
  `is_consumption_points` int(11) DEFAULT '0' COMMENT 'ζ―ε¦εΌε―ε’ιΏθ΅ ιζΆθ΄Ήη§―ε:0δΈθ΅ ι 1θ΅ ι',
  `consumption_points` decimal(14,2) DEFAULT '0.00' COMMENT 'θ΅ ιε’ιΏζΆθ΄Ήη§―εεΌ',
  `is_join_number` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ιεΆεδΈζ΄»ε¨ζ¬‘ζ°',
  `join_number` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―δΊΊζ―ε€©εδΈζ΄»ε¨ζ»ζ¬‘ζ°',
  `parent_reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΌε’ζε’ε₯-δΈηΊ§θ·εΎε₯ε±οΌδ½ι’οΌ',
  `parent_every_group` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’ζε’ε₯-δΊΊ/η»',
  `parent_reward_max` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’ζε’ε₯-ε°ι‘Άε₯ε±ζ¬‘ζ°',
  `open_group_max` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’ζε’ε₯-ε’ιΏζ­£ε¨εΌε’δΈ­ηζ΄»ε¨ιεΆοΌζ¬‘ζ°οΌ',
  `is_team_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ιεΆεδΈζ΄»ε¨ζ¬‘ζ°',
  `balance_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ε’ιΏιδ½ι’ειη­ηΊ§ε₯ε±εΌε³',
  `commissions_num` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ειη­ηΊ§εΌε’ζ¬‘ζ°ιεΆθ§εθ?Ύη½?',
  `commissions_balance` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε’ιΏιδ½ι’ειη­ηΊ§η¬η«θ§εθ?Ύη½?',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_credit_line
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_credit_line`;
CREATE TABLE `ims_yz_fight_groups_credit_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `credit_score` tinyint(4) NOT NULL DEFAULT '100' COMMENT 'δΏ‘η¨ε',
  `blacklist_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ι»εεηΆζ,1-θΏε₯δΊι»εε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ζ΄»ε¨--δΏ‘η¨εΊ¦θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_level`;
CREATE TABLE `ims_yz_fight_groups_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `group_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨id',
  `level_num` int(11) NOT NULL COMMENT 'ε±ηΊ§',
  `member_num` int(11) NOT NULL COMMENT 'ζΌε’δΊΊζ°',
  `expire_in` double(14,1) NOT NULL COMMENT 'ζΌε’ζΆι΄',
  `status` int(11) DEFAULT '0' COMMENT 'ηΆζ',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηΆζδΏ‘ζ―,ε¦ζε¨η»ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery`;
CREATE TABLE `ims_yz_fight_groups_lottery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’θ‘¨fight_groupsηδΈ»ι?ID',
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―ζ½ε₯ 0.ε³ι­ 1.εΌε―',
  `is_separate_rules` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦η¬η«θ§ε 0.ε¦ 1.ζ―',
  `commander_set` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ½ε₯θ§ε ε’ιΏθ?Ύη½? 0.ζ ιεΆ 1.εΏδΈ­ 2.εΏδΈδΈ­',
  `first_set` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ½ε₯θ§ε ζ°δΌεθ?Ύη½? 0.ζ ιεΆ 1.εΏδΈ­ 2.εΏδΈδΈ­',
  `winning_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ½δΈ­δΌεε₯ε±',
  `loser_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζͺζ½δΈ­δΌεε₯ε±',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `is_old` int(11) NOT NULL DEFAULT '0' COMMENT '0ζ§ζ°ζ?δΈε€ηοΌ1ζ°ζ·»ε ζ°ζ?(εΌε?Ήζ§ηζ΄»ε¨)',
  `win_number` int(11) NOT NULL DEFAULT '1' COMMENT 'δΈ­ε₯δΊΊζ°',
  `loser_parent_reward` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζͺδΈ­ε₯δΈηΊ§ε₯ε±',
  `loser_credit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζͺδΈ­ε₯ε₯ε±η±»εοΌ0-εΉ³εε,1-ζ―δΊΊεΊε?ε₯ε±',
  `is_winning_thaw_love` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―δΈ­ε₯θ§£ε»η±εΏεΌ:1-εΌε―,0-ε³ι­',
  `winning_thaw_love_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'η΄―θ?‘δΈ­ε₯ζ¬‘ζ°',
  `winning_thaw_love_number` int(11) NOT NULL DEFAULT '0' COMMENT 'θ§£ε»η±εΏεΌδΈͺζ°',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_fight_groups_lottery_fight_groups_id_unique` (`fight_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ζ½ε₯--ζΌε’ζ½ε₯θ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’θ‘¨fight_groupsηδΈ»ι?ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιΏid',
  `is_refund` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιζ¬Ύζε0δΈζεοΌ1ζε',
  `is_win` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦δΈ­ε₯0δΈδΈ­ε₯οΌ1δΈ­ε₯',
  `team_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'FightGroupsTeamMemberθ‘¨ID',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η§―εε₯ε±',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η±εΏεΌε₯ε±',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'δ½ι’ε₯ε±',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΆθ΄Ήη§―εε₯ε±',
  `refund_type` int(11) NOT NULL DEFAULT '0' COMMENT 'ιζ¬Ύη±»ε1.εθ·―ιζ¬ΎοΌ2ιζ¬Ύε°δ½ι’',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ζ½ε₯--ζΌε’ζ½ε₯ε₯ε±θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_reward`;
CREATE TABLE `ims_yz_fight_groups_lottery_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’θ‘¨fight_groupsηδΈ»ι?ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιΏid',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εID',
  `order_sn` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εε·',
  `is_win` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦δΈ­ε₯0δΈδΈ­ε₯οΌ1δΈ­ε₯',
  `team_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'FightGroupsTeamMemberθ‘¨ID',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η§―εε₯ε±',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η±εΏεΌε₯ε±',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'δ½ι’ε₯ε±',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΆθ΄Ήη§―εε₯ε±',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `reward_status` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ε±εζΎηΆζοΌ0ζͺεζΎοΌ1ε·²η»εζΎ',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΆε₯',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_lottery_reward_order_id_index` (`order_id`),
  KEY `yz_fight_groups_lottery_reward_team_member_id_index` (`team_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ζ½ε₯--ζΌε’ζ½ε₯ε₯ε±';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_reward_auxiliary
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_reward_auxiliary`;
CREATE TABLE `ims_yz_fight_groups_lottery_reward_auxiliary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εID',
  `reward_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ε±δΌεid',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ½ε₯δΌεid',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ε±η±»ε1.δΌεδΈηΊ§ε₯ε±',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’id',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η§―εε₯ε±',
  `love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η±εΏεΌε₯ε±',
  `credit` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'δ½ι’ε₯ε±',
  `shop_integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΆθ΄Ήη§―εε₯ε±',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `reward_status` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ε±εζΎηΆζοΌ0ζͺεζΎοΌ1ε·²η»εζΎ',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ι€ζΆι΄',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζΆε₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ζ½ε₯--ε₯ε±θ?°ε½ε―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_winning_accumulate_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_winning_accumulate_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_winning_accumulate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’θ‘¨fight_groupsηδΈ»ι?ID',
  `winning_total` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―₯ζ΄»ε¨δΌεζ»η΄―η§―δΈ­ε₯ζ¬‘ζ°',
  `surplus_winning_total` int(11) NOT NULL DEFAULT '0' COMMENT 'ε©δ½δΈ­ε₯ζ¬‘ζ°',
  `love_activate_total` int(11) NOT NULL DEFAULT '0' COMMENT 'η±εΏεΌζΏζ΄»ζ¬‘ζ°',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ε₯ε±--δΌεδΈ­ε₯θ§£ε»η±εΏεΌη΄―θ?‘θ‘¨οΌδΊεΌθ§£ε»η±εΏεΌιζ±οΌ';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_lottery_winning_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_lottery_winning_log`;
CREATE TABLE `ims_yz_fight_groups_lottery_winning_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `fight_groups_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΌε’θ‘¨fight_groupsηδΈ»ι?ID(ζ΄»ε¨ID)',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’id',
  `activity_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'ι¨εζ΄»ε¨θ§ε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΌε’ε₯ε±--δΌεδΈ­ε₯θ§£ε»η±εΏεΌθ?°ε½θ‘¨οΌδΊεΌθ§£ε»η±εΏεΌιζ±οΌ';

-- ----------------------------
-- Table structure for ims_yz_fight_groups_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_option`;
CREATE TABLE `ims_yz_fight_groups_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `group_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨id',
  `option_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεθ§ζ Όid',
  `option_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'εθ§ζ Ό' COMMENT 'εεθ§ζ Όεη§°',
  `option_price` decimal(14,2) NOT NULL COMMENT 'εδ»·',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨εΊε­',
  `buy_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'ιθ΄­δ»Άζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_option_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_option_level`;
CREATE TABLE `ims_yz_fight_groups_option_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `groups_option_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨θ§ζ Όid',
  `level_id` int(11) NOT NULL COMMENT 'ε±ηΊ§id',
  `option_id` int(11) NOT NULL COMMENT 'εδ½,εεθ§ζ Όid',
  `group_price` decimal(14,2) NOT NULL COMMENT 'ζΌε’δ»·ζ Ό',
  `member_num` int(11) NOT NULL DEFAULT '0' COMMENT 'εδ½,ζΌε’δΊΊζ°',
  `group_id` int(11) NOT NULL COMMENT 'εδ½,ζ΄»ε¨id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_point_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_point_deduction`;
CREATE TABLE `ims_yz_fight_groups_point_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `point` decimal(8,2) DEFAULT NULL,
  `point_type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_team
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_team`;
CREATE TABLE `ims_yz_fight_groups_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `group_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨id',
  `level_id` int(11) NOT NULL COMMENT 'ε±ηΊ§id',
  `leader_id` int(11) NOT NULL COMMENT 'ε’ιΏid,ε―ΉεΊδΌεid',
  `start_time` int(11) DEFAULT NULL COMMENT 'εΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `status` int(11) DEFAULT '0' COMMENT 'ζΌε’ηΆζ',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζεζε€±θ΄₯ηδΏ‘ζ―,ε¦ε’ιΏζͺζ―δ»',
  `is_virtual` int(11) DEFAULT '0' COMMENT 'ζ―ε¦θζζε’',
  `success_time` int(11) DEFAULT NULL COMMENT 'ζε’ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_fight_groups_team_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_fight_groups_team_member`;
CREATE TABLE `ims_yz_fight_groups_team_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `group_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨id',
  `level_id` int(11) NOT NULL COMMENT 'ε±ηΊ§id',
  `team_id` int(11) NOT NULL COMMENT 'ε’id',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `option_id` int(11) DEFAULT '0' COMMENT 'θ§ζ Όid',
  `purchase_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ°ι',
  `price` decimal(14,2) NOT NULL COMMENT 'ζΌε’εδ»·',
  `total_price` decimal(14,2) NOT NULL COMMENT 'ζΌε’ζ»δ»·',
  `order_id` int(11) NOT NULL COMMENT 'θ?’εid',
  `status` int(11) DEFAULT '0' COMMENT 'εε’ηΆζ',
  `status_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηΆζδΏ‘ζ―,ε¦ζε¨η»ζ',
  `join_time` int(11) DEFAULT NULL COMMENT 'εε’ζΆι΄(ζ―δ»ζΆι΄)',
  `refund_time` int(11) DEFAULT NULL COMMENT 'ιζ¬ΎζΆι΄',
  `is_leader` tinyint(1) DEFAULT '0' COMMENT 'εδ½,ζ―ε¦ε’ιΏ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊid',
  `plugin_id` int(11) DEFAULT '0' COMMENT 'εεη±»ε',
  PRIMARY KEY (`id`),
  KEY `yz_fight_groups_team_member_team_id_index` (`team_id`),
  KEY `yz_fight_groups_team_member_order_id_index` (`order_id`),
  KEY `yz_fight_groups_team_member_member_id_index` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_first_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_first_order`;
CREATE TABLE `ims_yz_first_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `shop_order_set` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_flow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_flow`;
CREATE TABLE `ims_yz_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure`;
CREATE TABLE `ims_yz_forwarding_treasure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `start_datetime` datetime NOT NULL COMMENT 'εΌε§ζΆι΄',
  `end_datetime` datetime NOT NULL COMMENT 'η»ζζΆι΄',
  `not_start_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ζͺεΌε§ζη€Ίθ―­',
  `end_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ε·²η»ζζη€Ίθ―­',
  `activity_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ε³ι?ε­',
  `activity_type` tinyint(4) DEFAULT '1' COMMENT 'ζ΄»ε¨η±»ε 1εδΊ«ιΎζ₯2εδΊ«ζ΅·ζ₯',
  `rule_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨θ§εεεε€',
  `transpond_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ½¬ειΎζ₯',
  `transpond_link_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯ι‘΅ι’ζ ι’/εζ ·δΉζ―ιͺθ―δ½Ώη¨ηεε?Ή',
  `poster_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδΊ«ζ΅·ζ₯ζζ‘',
  `poster_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―΄ζζζ‘εΎη',
  `poster_image_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘θ΅ζΊid',
  `poster_id` int(11) NOT NULL COMMENT 'ζ΅·ζ₯idοΌζ°ζ΅·ζ₯ζδ»ΆοΌ',
  `number_astrict` int(11) NOT NULL COMMENT 'ιεΆζ‘δ»Ά εδΈδΊΊζ°',
  `number_astrict_type` tinyint(4) NOT NULL COMMENT 'ζ―ε¦ιεΆδΊΊζ° 1ζ―2ε¦',
  `area_type` tinyint(4) NOT NULL COMMENT 'ζ―ε¦ιεΆεΊε 1ζ―2ε¦',
  `area_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιεΆεΊε serializeε½ζ°',
  `share_type` tinyint(4) DEFAULT '1' COMMENT 'εδΊ«ζΈ ι 1ζεε 2εΎ?δΏ‘ηΎ€',
  `review_type` tinyint(4) DEFAULT '1' COMMENT 'ε?‘ζ Έη±»ε 1AIθ―ε« 2δΊΊε·₯ε?‘ζ Έ ',
  `time` int(11) NOT NULL COMMENT 'εδΊ«εηζΆι΄ 0δΈΊδΈιεΆ',
  `time_type` tinyint(4) DEFAULT '1' COMMENT 'εδΊ«εηζΆι΄εδ½ 1ει 2ε°ζΆ 3ε€©',
  `not_retention_time_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζͺθΎΎε°ηε­ζΆι΄ζη€Ίθ―­',
  `grouping_is_visible_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?Ύη½?δΊεη»ε―θ§ζη€Ίθ―­',
  `set_private_send_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?Ύη½?δΊη§ε―ειζη€Ίθ―­',
  `fail_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―ε«ε€±θ΄₯ζη€Ίθ―­',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ζ΅·ζ₯ε?£δΌ εΎηοΌη¨δΊηζζ΄»ε¨ζ΅·ζ₯οΌ',
  `propaganda_poster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?£δΌ ζ΅·ζ₯',
  `propaganda_poster_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?£δΌ ζ΅·ζ₯εΎ?δΏ‘θ΅ζΊid ε?£δΌ ζ΅·ζ₯εΎ?δΏ‘θ΅ζΊid θζ―ι’θ² εΉΏεθ―­ εδΈδΊΊζ°ε¦ζζ²‘ζεηζΉεεδΈι’ε€ηζζ΅·ζ₯',
  `participation` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΈζ¬‘ηζζ΅·ζ₯ηεζ°serializeε½ζ° η¨ζ₯ε―Ήζ―ε¦ζδΈδΈθ΄ειζ°ηζ',
  `qrcode_id` int(11) NOT NULL COMMENT 'ε¬δΌε·δΊη»΄η  δΊη»΄η δΈζ΄»ε¨ε³θ',
  `backgroundcolor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θζ―ι’θ²',
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉΏεθ―­',
  `thumb_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨ε?£δΌ ζ΅·ζ₯ε³ι?θ―',
  `num` int(11) NOT NULL COMMENT 'εδΊ«εΎ?δΏ‘ηΎ€δΊΊζ°θ¦ζ± 0δ»£θ‘¨δΈιεΆ',
  `group_num_not_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘ηΎ€δΊΊζ°δΈθΎΎζ ζη€Ίθ―­',
  `integral` int(11) NOT NULL COMMENT 'η§―ε',
  `balance` decimal(8,2) NOT NULL COMMENT 'δ½ι’',
  `wechat_red_racket` int(11) NOT NULL COMMENT 'εΎ?δΏ‘ηΊ’ε',
  `consumption_points` int(11) NOT NULL COMMENT 'ζΆθ΄Ήη§―ε',
  `award_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε₯ε±ιη₯',
  `advertising_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉΏεεΎη',
  `advertising_image_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉΏεεΎηεΎ?δΏ‘θ΅ζΊid',
  `is_lose_efficacy` tinyint(4) DEFAULT '2' COMMENT 'ζ―ε¦ε€±ζ 1ζ―2ε¦',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬εε?ζ΄»ε¨θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_coupon`;
CREATE TABLE `ims_yz_forwarding_treasure_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT 'θ½¬εε?ζ΄»ε¨id',
  `coupon_id` int(11) NOT NULL COMMENT 'δΌζ εΈid',
  `coupon_several` int(11) NOT NULL COMMENT 'εζΎδΈͺζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬εε?δΌζ εΈε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_image
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_image`;
CREATE TABLE `ims_yz_forwarding_treasure_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT 'θ½¬εε?ζ΄»ε¨id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎηε°ε',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘θ΅ζΊid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬εε?εδΊ«ζ΅·ζ₯εΎη(δΈζ―ζ΄»ε¨ζ΅·ζ₯)';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_log`;
CREATE TABLE `ims_yz_forwarding_treasure_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uniacid` int(11) NOT NULL,
  `forwarding_treasure_id` int(11) NOT NULL COMMENT 'θ½¬εε?ζ΄»ε¨id',
  `member_id` int(11) NOT NULL,
  `request_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―·ζ±δΏ‘ζ―',
  `return_param` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θΏεδΏ‘ζ―',
  `is_fee` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―₯θ?°ε½ζ―ε¦θ?‘θ΄ΉοΌ0δΈΊζͺθ?‘θ΄Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬εε?--θΈη­Ύζ₯ε£θ―·ζ±θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_forwarding_treasure_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_forwarding_treasure_member`;
CREATE TABLE `ims_yz_forwarding_treasure_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `forwarding_treasure_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨id',
  `status` tinyint(4) DEFAULT '1' COMMENT 'ηΆζ1ζͺθ½¬ε2ζͺιθΏ3ε·²ιθΏ',
  `count` int(11) NOT NULL COMMENT 'ε·²ιͺθ―ηζ¬‘ζ°οΌNζ¬‘δΉεε°±δΈε―δ»₯ειͺθ―δΊοΌ',
  `screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιͺθ―ηζͺεΎ',
  `integral` int(11) NOT NULL COMMENT 'η§―ε',
  `balance` decimal(8,2) NOT NULL COMMENT 'δ½ι’',
  `wechat_red_racket` int(11) NOT NULL COMMENT 'εΎ?δΏ‘ηΊ’ε',
  `consumption_points` int(11) NOT NULL COMMENT 'ζΆθ΄Ήη§―ε',
  `coupon` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εζΎηδΌζ εΈε₯ε± serializeε½ζ°',
  `reward_information` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε₯ε±δΏ‘ζ― οΌη¨ζ·ζΏζ’β{ε₯ε±δΏ‘ζ―}β δΈεζΎε?εε°ε₯ε±ζΎη€ΊοΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `group_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΎ€θδΊΊζ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬εε?η¨ζ·θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods`;
CREATE TABLE `ims_yz_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) DEFAULT '0',
  `title` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` text,
  `sku` varchar(5) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `content` longtext,
  `goods_sn` varchar(50) DEFAULT '',
  `product_sn` varchar(50) DEFAULT '',
  `market_price` decimal(14,2) DEFAULT '0.00',
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(14,2) DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `reduce_stock_method` int(11) DEFAULT '0',
  `show_sales` int(11) DEFAULT '0',
  `real_sales` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `has_option` int(11) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_discount` tinyint(1) DEFAULT '0',
  `is_recommand` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `virtual_sales` int(11) DEFAULT '0',
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦ε‘«εζΆθ΄§ε°ε 0:ζ―1:ε¦',
  `type2` tinyint(1) DEFAULT '1' COMMENT 'εεη±»ε2',
  `old_id` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT 'δ½η§―',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'εεε«ε',
  PRIMARY KEY (`id`,`is_deleted`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isnew` (`is_new`),
  KEY `idx_ishot` (`is_hot`),
  KEY `idx_isdiscount` (`is_discount`),
  KEY `idx_isrecommand` (`is_recommand`),
  KEY `idx_iscomment` (`is_comment`),
  KEY `idx_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1616 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_advertising
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_advertising`;
CREATE TABLE `ims_yz_goods_advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT 'εΉΏεε?£δΌ θ―­εΌε³',
  `copywriting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζζ‘',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `font_size` int(11) NOT NULL DEFAULT '0' COMMENT 'ε­δ½ε€§ε°',
  `font_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε­δ½ι’θ²',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιΎζ₯',
  `min_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`),
  KEY `yz_goods_advertising_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='εΉΏεε?£δΌ θ―­θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_area
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_area`;
CREATE TABLE `ims_yz_goods_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεδΈεεεΊεζδ»Άε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_area_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_area_dividend`;
CREATE TABLE `ims_yz_goods_area_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_dividend` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `has_dividend` tinyint(4) NOT NULL DEFAULT '3',
  `has_dividend_price` decimal(10,2) DEFAULT '0.00',
  `has_dividend_rate` decimal(10,2) DEFAULT '0.00',
  `alone_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨η¬η«θ§εοΌ0δΈε―η¨',
  `province_rate` decimal(8,2) DEFAULT NULL COMMENT 'ηζ―δΎ',
  `city_rate` decimal(8,2) DEFAULT NULL COMMENT 'εΈζ―δΎ',
  `area_rate` decimal(8,2) DEFAULT NULL COMMENT 'εΊ/εΏζ―δΎ',
  `street_rate` decimal(8,2) DEFAULT NULL COMMENT 'θ‘ιζ―δΎ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_bonus`;
CREATE TABLE `ims_yz_goods_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `bonus_money` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεδΈεηΊ’ε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_category`;
CREATE TABLE `ims_yz_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL COMMENT 'εη±»η»ε³θεεθ§ζ ΌID',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2224 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ims_yz_goods_commission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_commission`;
CREATE TABLE `ims_yz_goods_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_commission` int(11) DEFAULT NULL,
  `show_commission_button` tinyint(1) NOT NULL DEFAULT '0',
  `poster_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_commission` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=774 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_copy1
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_copy1`;
CREATE TABLE `ims_yz_goods_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) DEFAULT '0',
  `title` varchar(300) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` text,
  `sku` varchar(5) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `content` longtext,
  `goods_sn` varchar(50) DEFAULT '',
  `product_sn` varchar(50) DEFAULT '',
  `market_price` decimal(14,2) DEFAULT '0.00',
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(14,2) DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `reduce_stock_method` int(11) DEFAULT '0',
  `show_sales` int(11) DEFAULT '0',
  `real_sales` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `has_option` int(11) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_discount` tinyint(1) DEFAULT '0',
  `is_recommand` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `virtual_sales` int(11) DEFAULT '0',
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦ε‘«εζΆθ΄§ε°ε 0:ζ―1:ε¦',
  `type2` tinyint(1) DEFAULT '1' COMMENT 'εεη±»ε2',
  `old_id` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT 'δ½η§―',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'εεε«ε',
  PRIMARY KEY (`id`,`is_deleted`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isnew` (`is_new`),
  KEY `idx_ishot` (`is_hot`),
  KEY `idx_isdiscount` (`is_discount`),
  KEY `idx_isrecommand` (`is_recommand`),
  KEY `idx_iscomment` (`is_comment`),
  KEY `idx_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_coupon`;
CREATE TABLE `ims_yz_goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_give` tinyint(1) DEFAULT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `send_type` tinyint(1) DEFAULT NULL COMMENT 'ειζΆι΄',
  `send_num` int(11) DEFAULT NULL COMMENT 'εζΎζ¬‘ζ°',
  `shopping_share` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ΄­δΉ°εδΊ«δΌζ εΈεΌε³',
  `share_coupon` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«δΌζ εΈ',
  `no_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η¦ζ­’δ½Ώη¨δΌζ εΈ,1εΌε―οΌδΈε―δ½Ώη¨οΌοΌ0ε³ι­',
  `use_num` int(11) DEFAULT NULL COMMENT 'ε―δ½Ώη¨ζ°ι',
  `is_use_num` tinyint(4) DEFAULT '0' COMMENT 'ε―δ½Ώη¨ζ°ιεΌε³',
  PRIMARY KEY (`id`),
  KEY `goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_coupon_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_coupon_queue`;
CREATE TABLE `ims_yz_goods_coupon_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `uid` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `coupon_id` int(11) DEFAULT NULL COMMENT 'δΌζ εΈID',
  `send_num` int(11) DEFAULT NULL COMMENT 'εζΎζ°ι',
  `end_send_num` int(11) DEFAULT NULL COMMENT 'ε·²εζΎ',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ 0 οΌζͺε?ζ 1οΌε·²ε?ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_discount`;
CREATE TABLE `ims_yz_goods_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `level_discount_type` tinyint(1) NOT NULL,
  `discount_method` tinyint(1) NOT NULL,
  `level_id` int(11) NOT NULL,
  `discount_value` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_discount_detail
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_discount_detail`;
CREATE TABLE `ims_yz_goods_discount_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_discountid` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεζζ£δΈεεζζ£ζη»ε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_dispatch`;
CREATE TABLE `ims_yz_goods_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `dispatch_type` tinyint(1) NOT NULL DEFAULT '1',
  `dispatch_price` decimal(14,2) DEFAULT '0.00',
  `dispatch_id` int(11) DEFAULT NULL,
  `is_cod` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `dispatch_type_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=980 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_div_from
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_div_from`;
CREATE TABLE `ims_yz_goods_div_from` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_diyform
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_diyform`;
CREATE TABLE `ims_yz_goods_diyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `diyform_id` int(11) DEFAULT NULL,
  `diyform_enable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεδΈθͺε?δΉθ‘¨εε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_edit_disable
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_edit_disable`;
CREATE TABLE `ims_yz_goods_edit_disable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζη€ΊδΏ‘ζ―οΌη?θΏ°η¦ζ­’ηΌθΎεεηεε ,ε¦:εεε·²εε XXζ΄»ε¨οΌδΈε―ηΌθΎοΌθ―·η­εΎXXζ΄»ε¨η»ζ!',
  `edit_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε³ι?ε­,ιθΏθ―₯ε­ζ?΅ε―εΊεδΈζ‘θ?°ε½!',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_filtering
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_filtering`;
CREATE TABLE `ims_yz_goods_filtering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `filtering_id` int(11) DEFAULT '0' COMMENT 'θΏζ»€id',
  PRIMARY KEY (`id`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_level_returns
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_level_returns`;
CREATE TABLE `ims_yz_goods_level_returns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_return_id` int(11) NOT NULL,
  `level_type` tinyint(3) NOT NULL DEFAULT '1',
  `level_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_return_id` (`good_return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεη­ηΊ§θΏη°θ§εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_limitbuy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_limitbuy`;
CREATE TABLE `ims_yz_goods_limitbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ιζΆθ΄­' COMMENT 'θͺε?δΉεη«―ε½ε',
  PRIMARY KEY (`id`),
  KEY `yz_goods_limitbuy_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_material
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_material`;
CREATE TABLE `ims_yz_goods_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ ι’',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ¨θζζ‘',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎη',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζΎη€Ί 1ζΎη€Ί 0δΈζΎη€Ί',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT 'εδΊ«δΊΊζ°',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈθ½½ζ¬‘ζ°',
  `collect` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΆθζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `videos` text COLLATE utf8mb4_unicode_ci COMMENT 'θ§ι’ε°ι’/θ§ι’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_micro
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_micro`;
CREATE TABLE `ims_yz_goods_micro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `independent_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `set` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_notices
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_notices`;
CREATE TABLE `ims_yz_goods_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_option`;
CREATE TABLE `ims_yz_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT '0.00',
  `market_price` decimal(10,2) DEFAULT '0.00',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `display_order` int(11) DEFAULT '0',
  `specs` text,
  `skuId` varchar(255) DEFAULT '',
  `goods_sn` varchar(255) DEFAULT '',
  `product_sn` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  `red_price` varchar(50) DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `volume` decimal(14,3) DEFAULT NULL COMMENT 'δ½η§―',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package`;
CREATE TABLE `ims_yz_goods_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `on_sale_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `limit_time_status` tinyint(1) NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `other_package_status` tinyint(1) NOT NULL DEFAULT '0',
  `other_package_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_package_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package_carousel`;
CREATE TABLE `ims_yz_goods_package_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `carousel_package_id` int(11) NOT NULL,
  `carousel_sort` int(11) NOT NULL,
  `carousel_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `carousel_open_status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_package_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_package_category`;
CREATE TABLE `ims_yz_goods_package_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `category_package_id` int(11) NOT NULL,
  `category_sort` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_goods_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_param
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_param`;
CREATE TABLE `ims_yz_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=38971 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_partner_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_partner_reward`;
CREATE TABLE `ims_yz_goods_partner_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL,
  `partner_reward_amount` decimal(10,2) DEFAULT '0.00',
  `same_level_amount` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_point_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_point_activity`;
CREATE TABLE `ims_yz_goods_point_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `status` tinyint(4) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_price_authority
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_price_authority`;
CREATE TABLE `ims_yz_goods_price_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_jurisdiction_widgets` int(11) DEFAULT NULL,
  `supplier_vip_level_widgets` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_jurisdiction_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_vip_level_widgets` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_jurisdiction_word` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_privilege
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_privilege`;
CREATE TABLE `ims_yz_goods_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `show_levels` text COLLATE utf8mb4_unicode_ci,
  `show_groups` text COLLATE utf8mb4_unicode_ci,
  `buy_levels` text COLLATE utf8mb4_unicode_ci,
  `buy_groups` text COLLATE utf8mb4_unicode_ci,
  `once_buy_limit` int(11) DEFAULT '0',
  `total_buy_limit` int(11) DEFAULT '0',
  `day_buy_limit` int(11) DEFAULT '0',
  `week_buy_limit` int(11) DEFAULT '0',
  `month_buy_limit` int(11) DEFAULT '0',
  `time_begin_limit` int(11) DEFAULT NULL,
  `time_end_limit` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `enable_time_limit` tinyint(4) DEFAULT '0',
  `min_buy_limit` int(11) DEFAULT '0' COMMENT 'δΌεθ΅·θ΄­ζ°ι',
  `day_buy_total_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'εεζ―ζ₯ιθ΄­ζ»ι',
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_rank_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_rank_category`;
CREATE TABLE `ims_yz_goods_rank_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ε―η¨οΌ0-ε¦γ1-ζ―',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking`;
CREATE TABLE `ims_yz_goods_ranking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `banner` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'εη±»ID',
  `goods_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε?εεid',
  `goods_category_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε?εεεη±»id',
  `goods_filtering_ids` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε?εεζ η­Ύid',
  `show_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζΎη€Ίζ°ι',
  `rank_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζθ‘ε¨ζοΌ1-ε€©γ2-ε¨γ3-ζγ4-ε­£εΊ¦',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_day
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_day`;
CREATE TABLE `ims_yz_goods_ranking_day` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ιι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_month
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_month`;
CREATE TABLE `ims_yz_goods_ranking_month` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ιι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_quarter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_quarter`;
CREATE TABLE `ims_yz_goods_ranking_quarter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ιι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_ranking_week
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_ranking_week`;
CREATE TABLE `ims_yz_goods_ranking_week` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ιι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_return`;
CREATE TABLE `ims_yz_goods_return` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `is_level_return` tinyint(3) NOT NULL DEFAULT '0',
  `level_return_type` tinyint(3) NOT NULL DEFAULT '1',
  `is_order_return` tinyint(3) NOT NULL DEFAULT '0',
  `is_queue_return` tinyint(3) NOT NULL DEFAULT '0',
  `add_pool_amount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='εεδΈε¨θΏε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_return_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_return_address`;
CREATE TABLE `ims_yz_goods_return_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `address_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `province_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `city_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `district_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_id` int(11) DEFAULT NULL,
  `street_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugins_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_room_dividend
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_room_dividend`;
CREATE TABLE `ims_yz_goods_room_dividend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `is_dividend` int(11) DEFAULT NULL,
  `has_dividend` tinyint(4) NOT NULL DEFAULT '3',
  `has_dividend_price` decimal(10,2) DEFAULT '0.00',
  `has_dividend_rate` decimal(10,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule` text COLLATE utf8mb4_unicode_ci,
  `open_anchor_commerce` int(11) DEFAULT '0' COMMENT 'ζ―ε¦εΌε―δΈ»ζ­εΈ¦θ΄§ 0-ζ― 1-ε¦',
  PRIMARY KEY (`id`),
  KEY `idx_gid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_sale
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_sale`;
CREATE TABLE `ims_yz_goods_sale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `max_balance_deduct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'δ½ι’ζδ½ζ΅ζ£',
  `is_sendfree` int(11) DEFAULT '0',
  `ed_num` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ed_money` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ed_areas` text COLLATE utf8mb4_unicode_ci,
  `ed_areaids` text COLLATE utf8mb4_unicode_ci,
  `bonus` int(11) DEFAULT '0',
  `max_point_deduct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ed_full` decimal(10,2) DEFAULT '0.00',
  `ed_reduction` decimal(10,2) DEFAULT '0.00',
  `is_push` tinyint(4) NOT NULL DEFAULT '0',
  `push_goods_ids` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `award_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `min_point_deduct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point_type` tinyint(1) DEFAULT '0',
  `max_once_point` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `all_point_deduct` decimal(10,2) DEFAULT NULL,
  `has_all_point_deduct` int(11) DEFAULT NULL,
  `balance_deduct` int(11) NOT NULL DEFAULT '1' COMMENT 'δ½ι’ζ΅ζ£εΌε³',
  `pay_reward_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ―δ»ε₯ε±εΌ',
  `min_balance_deduct` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δ½ι’ζδ½ζ΅ζ£',
  PRIMARY KEY (`id`),
  KEY `idx_good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=980 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_service
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_service`;
CREATE TABLE `ims_yz_goods_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `is_automatic` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θͺε¨δΈδΈζΆ 1οΌζ―',
  `on_shelf_time` int(11) DEFAULT NULL,
  `lower_shelf_time` int(11) DEFAULT NULL,
  `is_refund` tinyint(4) DEFAULT '1' COMMENT 'ζ―ε¦ζ―ζιθ΄§ 1οΌζ―',
  `serviceFee` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_setting`;
CREATE TABLE `ims_yz_goods_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_month_sales` tinyint(4) NOT NULL COMMENT 'ζιε?ιεΌε³οΌ1-εΌε―οΌ0-ε³ι­',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `is_member_enter` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'δΌεδΈ­εΏεΌε³οΌ1-εΌε―οΌ0-ε³ι­',
  `detail_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εεθ―¦ζι‘΅-εεθ―¦ζοΌ1-ι»θ?€ζΎη€ΊοΌ0-ι»θ?€δΈζΎη€Ί',
  `is_price_desc` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δ»·ζ Όθ―΄ζεΌε³οΌ1-εΌε―οΌ0-ε³ι­',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θͺε?δΉθ‘¨ι’',
  `explain` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―΄ζεε?Ή',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_share`;
CREATE TABLE `ims_yz_goods_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `need_follow` tinyint(1) DEFAULT NULL,
  `no_follow_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `follow_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `share_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goodid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_small_code_url
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_small_code_url`;
CREATE TABLE `ims_yz_goods_small_code_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `collect_small_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε°η¨εΊδΊη»΄η ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec`;
CREATE TABLE `ims_yz_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `display_type` tinyint(3) DEFAULT '0',
  `content` text,
  `display_order` int(11) DEFAULT '0',
  `propId` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goods_id`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=18758 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_spec_info
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec_info`;
CREATE TABLE `ims_yz_goods_spec_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `info_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎη',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εε?Ή',
  `goods_option_id` int(11) DEFAULT NULL COMMENT 'θ§ζ ΌID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='εεθ§ζ ΌδΏ‘ζ―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_goods_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_spec_item`;
CREATE TABLE `ims_yz_goods_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `show` int(11) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `valueId` varchar(255) DEFAULT NULL,
  `virtual` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_specid` (`specid`),
  KEY `idx_show` (`show`),
  KEY `idx_displayorder` (`display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=44895 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_goods_video
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_goods_video`;
CREATE TABLE `ims_yz_goods_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `goods_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `video_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_grade_change_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_grade_change_record`;
CREATE TABLE `ims_yz_grade_change_record` (
  `uid` int(11) NOT NULL COMMENT 'δΌεid',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ’«ε ι€ηη­ηΊ§id',
  `new_level_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ°ηη­ηΊ§id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'δΏ?ζΉη±»εοΌ1ζεδΈ­εΏ 2ζεε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_group_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code`;
CREATE TABLE `ims_yz_group_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εε»Ίηη¨ζ·idοΌ0δΈΊεε°εε»Ί',
  `code_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηΎ€ζ΄»η εη§°',
  `code_guide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΌε―Όθ―­',
  `auth_visit` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?Ώι?ζζοΌ0ε³ι­οΌ1εΌε―',
  `join_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θΏηΎ€ζΉεΌοΌ0ι»θ?€θΏηΎ€οΌ1ζ η­ΎθΏηΎ€',
  `explain` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―΄ζοΌ0ε³ι­οΌ1εΌε―',
  `explain_content` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―΄ζεε?Ή',
  `customer_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?’ζδΊη»΄η ',
  `customer_service_guide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?’ζεΌε―Όθ―­',
  `label_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ η­ΎbannerοΌζ η­ΎθΏηΎ€εΌε―οΌ',
  `label_data` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ η­Ύζ°ζ?οΌζ η­ΎθΏηΎ€εΌε―οΌ',
  `in_number` int(11) NOT NULL DEFAULT '0' COMMENT 'ι»θ?€εδΈδΊΊζ°οΌζ η­ΎθΏηΎ€εΌε―οΌ',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0ε³ι­οΌ1εΌε―',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ¨θοΌ0ε³ι­οΌ1εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_data` longtext COLLATE utf8mb4_unicode_ci COMMENT 'θ?Ώι?ζιζ°ζ?',
  `code_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δΊη»΄η η±»εοΌ0ζε¨δΈδΌ οΌ1θͺε¨ηζ',
  `join_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θΏηΎ€ζιοΌ0ε³οΌ1εΌ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€ζ΄»η θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_group_code_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_data`;
CREATE TABLE `ims_yz_group_code_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT 'ε³θηηΎ€ζ΄»η id',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ η­Ύ',
  `code_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΊη»΄η url',
  `expire` int(11) NOT NULL COMMENT 'θΏζζΆι΄',
  `upper_limit` int(11) NOT NULL COMMENT 'δΈιδΊΊζ°',
  `status` tinyint(4) NOT NULL COMMENT 'ηΆζοΌ0ε³ι­οΌ1εΌε―',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `code_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δΊη»΄η η±»εοΌ0ζε¨δΈδΌ οΌ1θͺε¨ηζ',
  `select_group` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ιζ©ηηΎ€θCHAT_IDοΌjson',
  `generate_group` longtext COLLATE utf8mb4_unicode_ci COMMENT 'θͺε¨ηζηηΎ€θIDοΌjson',
  `auto_generate` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦θͺε¨ηζηΎ€θοΌ0ε³οΌ1εΌ',
  `config_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιη½?id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€δΊη»΄η θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_group_code_data_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_data_log`;
CREATE TABLE `ims_yz_group_code_data_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `group_id` int(11) NOT NULL COMMENT 'η¨ζ·ζ₯ηηηΎ€ζ΄»η id',
  `code_id` int(11) NOT NULL COMMENT 'η¨ζ·ζ₯ηηδΊη»΄η id',
  `date_day` date NOT NULL COMMENT 'ε½ζ₯ζ₯ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€δΊη»΄η θ?Ώι?θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_group_code_day_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_day_log`;
CREATE TABLE `ims_yz_group_code_day_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT 'ηΎ€ζ΄»η id',
  `date_day` date NOT NULL COMMENT 'ε½ζ₯ζ₯ζ',
  `total_count` int(11) NOT NULL COMMENT 'ε½ζ₯ζ«η δΊΊζ°',
  `new_count` int(11) NOT NULL COMMENT 'ε½ζ₯ζ°δΌεδΊΊζ°',
  `cumulative` int(11) NOT NULL COMMENT 'ζͺζ­’ε½ζ₯η΄―θ?‘ζ«η δΊΊζ°',
  `cumulative_new` int(11) NOT NULL COMMENT 'ζͺζ­’ε½ζ₯η΄―θ?‘ζ°δΌεδΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_group_code_day_log_uniacid_index` (`uniacid`),
  KEY `yz_group_code_day_log_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€ζ΄»η ζ₯ζ°ζ?η»θ?‘θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_group_code_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_goods`;
CREATE TABLE `ims_yz_group_code_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―η¬η«θ?Ύη½?',
  `citation_copy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΌε―Όζζ‘',
  `group_code_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε?ηΎ€ζ΄»η ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€ζ΄»η εεζδ»Άθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_group_code_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_group_code_log`;
CREATE TABLE `ims_yz_group_code_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL COMMENT 'η¨ζ·ζ₯ηηηΎ€ζ΄»η id',
  `member_id` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η¨ζ·ζ―ε¦ζ°δΌεοΌ0ε¦οΌ1ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `date_day` date NOT NULL COMMENT 'ε½ζ₯ζ₯ζ',
  PRIMARY KEY (`id`),
  KEY `yz_group_code_log_uniacid_index` (`uniacid`),
  KEY `yz_group_code_log_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζ΄»η --ηΎ€ζ΄»η θ?Ώι?δΊΊζ°θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_help_center_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_help_center_content`;
CREATE TABLE `ims_yz_help_center_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel`;
CREATE TABLE `ims_yz_hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `banner_thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `star_rated` int(11) NOT NULL DEFAULT '0',
  `entrance_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_uid` int(11) NOT NULL DEFAULT '0',
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salers` text COLLATE utf8mb4_unicode_ci,
  `hotel_introduce` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL COMMENT 'ζΆιΆε°id',
  `collect_money_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ε°η¨εΊδΊη»΄η ε°ε',
  `hotel_index_mini_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιεΊι¦ι‘΅ε°η¨εΊη ε°ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_apply`;
CREATE TABLE `ims_yz_hotel_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_auto_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_auto_log`;
CREATE TABLE `ims_yz_hotel_auto_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_carousel`;
CREATE TABLE `ims_yz_hotel_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_cashier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_cashier_goods`;
CREATE TABLE `ims_yz_hotel_cashier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL,
  `is_write_information` tinyint(4) NOT NULL,
  `shop_commission` decimal(10,2) NOT NULL,
  `settlement_day` int(11) NOT NULL,
  `plugins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `profit` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_award_point` decimal(10,2) NOT NULL,
  `shop_award_point1` decimal(10,2) NOT NULL,
  `shop_award_point2` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_category`;
CREATE TABLE `ims_yz_hotel_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_details
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_details`;
CREATE TABLE `ims_yz_hotel_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_dispatch`;
CREATE TABLE `ims_yz_hotel_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_facilities
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_facilities`;
CREATE TABLE `ims_yz_hotel_facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `network` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_network` tinyint(4) DEFAULT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_parking` tinyint(4) DEFAULT NULL,
  `traffic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_traffic` tinyint(4) DEFAULT NULL,
  `recreation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_recreation` tinyint(4) DEFAULT NULL,
  `reception` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_reception` tinyint(4) DEFAULT NULL,
  `restaurant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_restaurant` tinyint(4) DEFAULT NULL,
  `business` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_business` tinyint(4) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_currency` tinyint(4) DEFAULT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_other` tinyint(4) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_give_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_give_reward`;
CREATE TABLE `ims_yz_hotel_give_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `is_hotel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0δΈΊθ΄­δΉ°θ1δΈΊι¨εΊ',
  `reward_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0δΈΊη§―ε1δΈΊη±εΏεΌ',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods`;
CREATE TABLE `ims_yz_hotel_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods_category`;
CREATE TABLE `ims_yz_hotel_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_goods_date
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_goods_date`;
CREATE TABLE `ims_yz_hotel_goods_date` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT 'εεεδ»·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer`;
CREATE TABLE `ims_yz_hotel_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer_set`;
CREATE TABLE `ims_yz_hotel_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_printer_temp`;
CREATE TABLE `ims_yz_hotel_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_hotel_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_hotel_setting`;
CREATE TABLE `ims_yz_hotel_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_import_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_import_order`;
CREATE TABLE `ims_yz_import_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_income_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_income_log`;
CREATE TABLE `ims_yz_income_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `income_id` int(11) NOT NULL COMMENT 'ζΆε₯θ‘¨id',
  `before` text COLLATE utf8mb4_unicode_ci COMMENT 'δΏ?ζΉεεε?Ή',
  `after` text COLLATE utf8mb4_unicode_ci COMMENT 'δΏ?ζΉεεε?Ή',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_company`;
CREATE TABLE `ims_yz_insurance_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `sort` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΏι©ε¬εΈεη§°',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ζΎη€Ί',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_goods`;
CREATE TABLE `ims_yz_insurance_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_pdf
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_pdf`;
CREATE TABLE `ims_yz_insurance_pdf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `pdf` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_insurance_policy
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_insurance_policy`;
CREATE TABLE `ims_yz_insurance_policy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `supplier_id` int(11) DEFAULT NULL COMMENT 'δΎεΊεID',
  `serial_number` int(11) DEFAULT NULL COMMENT 'εΊε·',
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊι’εη§°',
  `insured` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ’«δΏδΊΊ',
  `identification_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―δ»Άε·η ',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θη³»ζΉεΌ',
  `province_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η',
  `city_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΈ',
  `district_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊ',
  `street_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―¦η»ε°ε',
  `insured_property` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΏθ΄’δΊ§',
  `customer_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΏη±»ε',
  `insured_amount` int(11) DEFAULT NULL COMMENT 'δΏι’',
  `guarantee_period` int(11) DEFAULT NULL COMMENT 'δΏζ',
  `premium` int(11) DEFAULT NULL COMMENT 'δΏθ΄Ή',
  `insurance_company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΏι©ε¬εΈ',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `insurance_coverage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΏι©η§',
  `additional_glass_risk` int(11) DEFAULT NULL COMMENT 'ιε η»ηι©',
  `is_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ―δ»',
  `company_id` tinyint(4) DEFAULT NULL COMMENT 'δΏι©ε¬εΈid',
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―δ»ζΉεΌ',
  `pay_time` int(11) DEFAULT NULL COMMENT 'ζ―δ»ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_currency_withdrawal_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_currency_withdrawal_address`;
CREATE TABLE `ims_yz_integral_currency_withdrawal_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `address` varchar(62) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `qr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_integral_currency_withdrawal_address_address_unique` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_deduction_return_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_deduction_return_record`;
CREATE TABLE `ims_yz_integral_deduction_return_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `change_value` int(11) NOT NULL,
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θΏθΏεε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_goods`;
CREATE TABLE `ims_yz_integral_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `deduction_set` tinyint(1) NOT NULL DEFAULT '0',
  `deduction_set_min` decimal(14,2) NOT NULL DEFAULT '0.00',
  `deduction_set_max` decimal(14,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `parent_award` tinyint(1) NOT NULL,
  `parent_award_fixed` decimal(14,2) NOT NULL DEFAULT '0.00',
  `parent_award_proportion` decimal(14,2) NOT NULL DEFAULT '0.00',
  `second_award_fixed` decimal(14,2) NOT NULL DEFAULT '0.00',
  `second_award_proportion` decimal(14,2) NOT NULL DEFAULT '0.00',
  `commission_level_award` text COLLATE utf8mb4_unicode_ci,
  `is_self_reward` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―θ΄­η©θ΅ ι',
  `self_reward_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ζ―δΎ1οΌεΊε?εΌ',
  `self_award` decimal(14,2) DEFAULT NULL COMMENT 'ε₯ε±εΌ',
  `give_integral` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§θ΄­δΉ°εεθ΅ ιζΆθ΄Ήη§―ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_manual_cash_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_manual_cash_withdrawal`;
CREATE TABLE `ims_yz_integral_manual_cash_withdrawal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `address` varchar(62) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `audit_at` int(11) DEFAULT NULL,
  `pay_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `qr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_member`;
CREATE TABLE `ims_yz_integral_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_integral_member_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_recharge`;
CREATE TABLE `ims_yz_integral_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εεΌεε·',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εεΌvalue',
  `pay_way` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―δ»ζΉεΌ',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'εεΌηΆζ',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εεΌε€ζ³¨',
  `value_type` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `certificates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_records`;
CREATE TABLE `ims_yz_integral_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_id` int(11) NOT NULL,
  `original` decimal(14,2) NOT NULL DEFAULT '0.00',
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `present` decimal(14,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_transfer`;
CREATE TABLE `ims_yz_integral_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` int(11) NOT NULL,
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage` decimal(14,2) NOT NULL DEFAULT '0.00',
  `poundage_rate` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `transformation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ½¬εη±»εοΌ0-εζ°ζ?δΈεΊεη±»εοΌ1-θ½¬εη±εΏοΌ2-θ½¬εη§―εοΌ3-ζη»­θ΄Ή',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_integral_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_integral_withdraw`;
CREATE TABLE `ims_yz_integral_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `change` decimal(14,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_invite_page
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_invite_page`;
CREATE TABLE `ims_yz_invite_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_auto_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_auto_category`;
CREATE TABLE `ims_yz_jd_supply_cloud_auto_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `local_first` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ¬ε°δΈηΊ§εη±»',
  `local_second` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ¬ε°δΊηΊ§εη±»',
  `local_third` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ¬ε°δΈηΊ§εη±»',
  `cloud_first` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊδ»δΈηΊ§εη±»',
  `cloud_second` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊδ»δΊηΊ§εη±»',
  `cloud_third` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊδ»δΈηΊ§εη±»',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0θͺε¨εΉιοΌ1ζε¨εΉι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_goods`;
CREATE TABLE `ims_yz_jd_supply_cloud_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0' COMMENT 'εεid',
  `cloud_goods_id` int(11) DEFAULT '0' COMMENT 'δΊδ»εεid',
  `is_update` tinyint(4) DEFAULT '0' COMMENT 'εεεεζ΄ζ°ε­ζ?΅',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT 'εεεεε ι€ε­ζ?΅',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_cloud_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_cloud_message`;
CREATE TABLE `ims_yz_jd_supply_cloud_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'ζ¨ιη±»ε',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ¨ιεε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_error
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_error`;
CREATE TABLE `ims_yz_jd_supply_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιθ――ζθΏ°',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―·ζ±η±»ε',
  `error_data` text COLLATE utf8mb4_unicode_ci COMMENT 'θΏειθ――',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―·ζ±ζ°ζ?',
  `response_data` text COLLATE utf8mb4_unicode_ci COMMENT 'θΏεζ°ζ?',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι’ηε­ζ?΅',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods`;
CREATE TABLE `ims_yz_jd_supply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0' COMMENT 'εεID',
  `jd_goods_id` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεεID',
  `shop_id` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεΊιΊID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `source` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεεζ₯ζΊη±»ε',
  `uniacid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `jd_goods_idx` (`jd_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods_control
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods_control`;
CREATE TABLE `ims_yz_jd_supply_goods_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_goods_option`;
CREATE TABLE `ims_yz_jd_supply_goods_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0' COMMENT 'εεID',
  `option_id` int(11) DEFAULT '0' COMMENT 'εεεεθ§ζ Όid',
  `jd_goods_id` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεεID',
  `jd_option_id` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεεθ§ζ Όid',
  `shop_goods_specs` text COLLATE utf8mb4_unicode_ci COMMENT 'εεθ§ζ Όι‘Ήids',
  `spec_value_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'η¬¬δΈζΉθ§ζ ΌεΌids',
  `spec_value_names` text COLLATE utf8mb4_unicode_ci COMMENT 'η¬¬δΈζΉθ§ζ Όεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `goods_option_idx` (`option_id`),
  KEY `jd_goods_idx` (`jd_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_order_goods`;
CREATE TABLE `ims_yz_jd_supply_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εid',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεid',
  `jd_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'η¬¬δΈζΉεεid',
  `jd_option_id` int(11) NOT NULL DEFAULT '0' COMMENT 'η¬¬δΈζΉθ§ζ Όid',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT 'εεζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_push_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_push_message`;
CREATE TABLE `ims_yz_jd_supply_push_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'ζ¨ιη±»ε',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεid',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_supply_topic_import
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_supply_topic_import`;
CREATE TABLE `ims_yz_jd_supply_topic_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈι’id',
  `diy_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ£δΏ?id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_refund_order`;
CREATE TABLE `ims_yz_jd_take_parts_refund_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εηΌε·',
  `refund_id` int(11) NOT NULL COMMENT 'θ?’ειζ¬Ύθ‘¨ID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `pick_up_address_complete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?ζ΄εδ»Άε°ε(η-εΈ-εΊ-εΆδ»δΏ‘ζ―)',
  `pick_up_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδ»Άε°ε(εΆδ»δΏ‘ζ―)',
  `pick_up_street` int(11) DEFAULT NULL COMMENT 'εδ»Άε°ε(θ‘ιID)',
  `pick_up_district` int(11) NOT NULL COMMENT 'εδ»Άε°ε(εΊ/ιID)',
  `pick_up_city` int(11) NOT NULL COMMENT 'εδ»Άε°ε(εΈID)',
  `pick_up_province` int(11) NOT NULL COMMENT 'εδ»Άε°ε(ηID)',
  `pick_up_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδ»Άθη³»δΊΊ',
  `pick_up_tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εδ»Άθη³»η΅θ―',
  `receive_address_complete` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(η-εΈ-εΊ-εΆδ»δΏ‘ζ―)',
  `receive_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(εΆδ»δΏ‘ζ―)',
  `receive_street` int(11) DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(θ‘ιID)',
  `receive_district` int(11) DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(εΊ/ιID)',
  `receive_city` int(11) DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(εΈID)',
  `receive_province` int(11) DEFAULT NULL COMMENT 'ζΆδ»Άε°ε(ηID)',
  `receive_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άθη³»δΊΊ',
  `receive_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»Άθη³»η΅θ―',
  `product_count` int(11) NOT NULL COMMENT 'εεζ°ιοΌε€§δΊ0οΌδΈδΈΊζ΄ζ°',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εεεε­',
  `jd_weight` decimal(11,2) NOT NULL COMMENT 'ιι',
  `jd_length` decimal(11,2) NOT NULL COMMENT 'ιΏ',
  `jd_width` decimal(11,2) NOT NULL COMMENT 'ε?½',
  `jd_height` decimal(11,2) NOT NULL COMMENT 'ι«',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζͺε€ηοΌ1ε·²ηζεδ»Άε-1ε·²ε€±ζ',
  `is_message` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζͺεζΆζ―οΌ1ε·²εζΆζ―,2ζ ιεζΆζ―',
  `start_time` int(11) DEFAULT NULL COMMENT 'εδ»ΆεΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'εδ»Άη»ζζΆι΄',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `pick_up_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδ»Άεε·',
  `way_bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΏεε·',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_jd_take_parts_refund_order_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΊ¬δΈδΈι¨εδ»Ά--δΈι¨εδ»Άθ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_request`;
CREATE TABLE `ims_yz_jd_take_parts_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `take_parts_refund_id` int(11) NOT NULL COMMENT 'δΈι¨εδ»Άθ?’εθ‘¨ID',
  `request_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―·ζ±εζ°',
  `request_res` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ―·ζ±η»ζ',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΊ¬δΈδΈι¨εδ»Ά--εδ»ΆεδΈεθ―·ζ±θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_jd_take_parts_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_jd_take_parts_set`;
CREATE TABLE `ims_yz_jd_take_parts_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL,
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'appSecret',
  `customer_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εε?ΆηΌη ',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'accessToken',
  `default_weight` decimal(12,2) NOT NULL COMMENT 'ι»θ?€ιι/εε',
  `default_length` decimal(12,2) NOT NULL COMMENT 'ι»θ?€ιΏ/cm',
  `default_width` decimal(12,2) NOT NULL COMMENT 'ι»θ?€ε?½/cm',
  `default_height` decimal(12,2) NOT NULL COMMENT 'δ½η§―ι»θ?€ι«/cm',
  `take_parts_message` int(11) DEFAULT NULL COMMENT 'εδ»ΆδΏ‘ζ―εΏ«ιειη₯',
  `take_parts_fail_message` int(11) DEFAULT NULL COMMENT 'εδ»ΆεδΈεε€±θ΄₯ιη₯',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΊ¬δΈδΈι¨εδ»Ά--θ?Ύη½?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_job_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_job_heartbeat`;
CREATE TABLE `ims_yz_job_heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_time` int(11) DEFAULT NULL COMMENT 'ζ§θ‘ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_cogradient_level_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_cogradient_level_set`;
CREATE TABLE `ims_yz_level_cogradient_level_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT 'θ?Ύη½?ι¦δ½ζδ»ΆεηΊ§ζ‘δ»Ά',
  `type_comment` text COLLATE utf8mb4_unicode_ci COMMENT 'ζδ»Άη­ηΊ§εηΊ§ζ‘δ»Ά',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηΊ§ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_cogradient_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_cogradient_record`;
CREATE TABLE `ims_yz_level_cogradient_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT 'ι¦δ½ζδ»ΆεηΊ§ζ‘δ»Ά',
  `level_id` int(11) DEFAULT NULL COMMENT 'ι¦δ½η­ηΊ§ζ‘δ»Ά',
  `plugin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι¦δ½ζδ»Άεη§°ζ‘δ»Ά',
  `plugin_level_id` int(11) DEFAULT NULL COMMENT 'ζ¬‘δ½ζδ»ΆεηΊ§ζ‘δ»Ά',
  `type_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¬‘δ½ζδ»Άεη§°ζ‘δ»Ά',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηΊ§ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_level_deletion_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_level_deletion_record`;
CREATE TABLE `ims_yz_level_deletion_record` (
  `level_id` int(11) NOT NULL COMMENT 'ε ι€η­ηΊ§ηεid',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§εη§°',
  `level_weight` int(11) NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§ζι',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'η­ηΊ§ζ―δΎ',
  `upgrade_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§ζ‘δ»Ά',
  `become` text COLLATE utf8mb4_unicode_ci COMMENT 'η­ηΊ§ζ‘δ»Ά',
  `count` int(11) DEFAULT NULL COMMENT 'η­ηΊ§δΊΊζ°',
  `type` int(11) DEFAULT NULL COMMENT 'η­ηΊ§η±»εοΌ1ζεδΈ­εΏ 2ζεε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_link_tool
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_link_tool`;
CREATE TABLE `ims_yz_link_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊεε§ID',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι‘΅ι’θ·―εΎ',
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι‘΅ι’εζ°',
  `end_time` int(11) DEFAULT NULL COMMENT 'ε°ζζΆι΄',
  `validity` int(11) DEFAULT NULL COMMENT '1ζζι0ζ ιζ',
  `remark` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `browse` int(11) DEFAULT NULL COMMENT 'θ?Ώι?ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_logistics_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_logistics_set`;
CREATE TABLE `ims_yz_logistics_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'η±»ε',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'θ?Ύη½?ζ°ζ?',
  `status` int(11) DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love`;
CREATE TABLE `ims_yz_love` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `old_value` decimal(14,2) DEFAULT NULL,
  `change_value` decimal(14,2) NOT NULL,
  `new_value` decimal(14,2) NOT NULL,
  `value_type` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `source` tinyint(1) NOT NULL,
  `relation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_activation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_activation`;
CREATE TABLE `ims_yz_love_activation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `first_order_money` decimal(14,2) DEFAULT NULL,
  `first_proportion` decimal(10,2) NOT NULL,
  `first_activation_love` decimal(14,2) NOT NULL,
  `second_three_order_money` decimal(14,2) NOT NULL,
  `second_three_proportion` decimal(10,2) NOT NULL,
  `last_upgrade_team_leve_award` decimal(14,2) NOT NULL,
  `second_three_fetter_proportion` decimal(10,2) NOT NULL,
  `second_three_activation_love` decimal(14,2) DEFAULT NULL,
  `sum_activation_love` decimal(14,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `actual_activation_love` decimal(14,2) DEFAULT NULL,
  `fixed_proportion` decimal(10,2) NOT NULL,
  `fixed_activation_love` decimal(10,2) NOT NULL,
  `member_froze_love` decimal(10,2) NOT NULL,
  `surplus_froze_love` decimal(10,2) NOT NULL,
  `team_proportion` decimal(10,2) NOT NULL,
  `team_activation_love` decimal(10,2) NOT NULL,
  `team_order_money` decimal(10,2) NOT NULL,
  `day_time` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `froze_total` decimal(14,2) NOT NULL,
  `profit_proportion` decimal(14,2) NOT NULL,
  `cycle_order_profit` decimal(14,2) NOT NULL,
  `profit_activation_love` decimal(14,2) NOT NULL,
  `income_proportion` decimal(14,2) NOT NULL COMMENT 'ζΆε₯ε¨ζζΏζ΄»ζ―δΎ',
  `member_income` decimal(14,2) NOT NULL COMMENT 'δΌεε¨ζζΆε₯ιι’',
  `income_activation_love` decimal(14,2) NOT NULL COMMENT 'ζΆε₯ε¨ζζΏζ΄»εΌ',
  `self_order_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θͺθ΄­ε¨ζθ?’ειι’',
  `self_proportion` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θͺθ΄­ε¨ζθ?’ειι’ζΏζ΄»ζ―δΎ',
  `self_activation_love` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θͺθ΄­ε¨ζθ?’ειι’ζΏζ΄»εΌ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_deduction_integral
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_deduction_integral`;
CREATE TABLE `ims_yz_love_deduction_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_uid` int(11) NOT NULL COMMENT 'ι¨εΊεΊιΏδΌεid',
  `uid` int(11) NOT NULL COMMENT 'δΌεid',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εηΌε·',
  `love_value` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ΅ ιηη±εΏεΌ',
  `integral` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ¦ζ£ι€ηζΆθ΄Ήη§―ε',
  `reward_rules` int(11) NOT NULL DEFAULT '0' COMMENT 'η±εΏεΌε₯ε±θ§εοΌη°δ»·οΌζζ¬δ»·οΌε?ιδ»·,ε©ζΆ¦',
  `reward_ratio` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ε±ζ―δΎ',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT 'ε₯ε±ζθ?’εζ―δ»εζε?ζε',
  `reward_time` int(11) DEFAULT NULL COMMENT 'ε₯ε±ζΆι΄',
  `love_conversion_ratio` int(11) DEFAULT NULL COMMENT 'η±εΏεΌθ½¬ζ’ζ―δΎ',
  `integral_conversion_ratio` int(11) DEFAULT NULL COMMENT 'ζΆθ΄Ήη§―εθ½¬ζ’ζ―δΎ',
  `reward_type` int(11) DEFAULT NULL COMMENT 'ε₯ε±η±»εοΌε»η»ζε―η¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_dividend_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_dividend_log`;
CREATE TABLE `ims_yz_love_dividend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `shop_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεθ₯δΈι’',
  `love` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΈͺδΊΊη±εΏεΌ',
  `love_all` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ»η±εΏεΌ',
  `dividend_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηΊ’ζ―δΎ',
  `dividend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηΊ’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_goods`;
CREATE TABLE `ims_yz_love_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `award` tinyint(1) NOT NULL,
  `deduction` tinyint(1) NOT NULL,
  `award_proportion` decimal(10,2) NOT NULL,
  `deduction_proportion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `parent_award` tinyint(1) NOT NULL,
  `parent_award_proportion` decimal(10,2) NOT NULL,
  `second_award_proportion` decimal(10,2) NOT NULL,
  `third_award_proportion` decimal(10,2) NOT NULL,
  `parent_award_fixed` decimal(10,2) NOT NULL,
  `second_award_fixed` decimal(10,2) NOT NULL,
  `third_award_fixed` decimal(10,2) NOT NULL,
  `love_accelerate` int(11) NOT NULL DEFAULT '0',
  `activation_state` int(11) NOT NULL DEFAULT '0',
  `deduction_proportion_low` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `commission` text COLLATE utf8mb4_unicode_ci,
  `commission_level_give` tinyint(4) NOT NULL DEFAULT '0',
  `award_fixed` decimal(14,2) NOT NULL,
  `is_activation` tinyint(1) NOT NULL COMMENT 'εεζ―ε¦εδΈζΏζ΄»οΌ0εΌε―οΌ1ε³ι­',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_member`;
CREATE TABLE `ims_yz_love_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `usable` decimal(14,2) DEFAULT '0.00',
  `froze` decimal(14,2) DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_member_group`;
CREATE TABLE `ims_yz_love_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open_love_member_group` tinyint(4) NOT NULL COMMENT 'ζ―ε¦εΌε―δΌεη»θ½¬θ?©',
  `love_member_no_group_id` int(11) DEFAULT NULL COMMENT 'ζ εη»θ½¬θ?©',
  `love_member_group_id` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη»θ½¬θ?©id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_order`;
CREATE TABLE `ims_yz_love_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_order_goods`;
CREATE TABLE `ims_yz_love_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_goods_id` int(11) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_ozy_goods_update
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_ozy_goods_update`;
CREATE TABLE `ims_yz_love_ozy_goods_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εID',
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `original_love` decimal(14,2) DEFAULT '0.00' COMMENT 'ζ¬ζ₯ηη±εΏεΌζ°η?',
  `modified_love` decimal(14,2) DEFAULT '0.00' COMMENT 'δΏ?ζΉθΏεηη±εΏεΌζ°η?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_ozy_order_update
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_ozy_order_update`;
CREATE TABLE `ims_yz_love_ozy_order_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεID',
  `love_reward` decimal(14,2) DEFAULT '0.00' COMMENT 'ε₯ε±ηη±εΏεΌζ°η?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_recharge`;
CREATE TABLE `ims_yz_love_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `change_value` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_type` int(11) DEFAULT '1',
  `money` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_return_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_return_log`;
CREATE TABLE `ims_yz_love_return_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_timing_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_timing_log`;
CREATE TABLE `ims_yz_love_timing_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `recharge_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_timing_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_timing_queue`;
CREATE TABLE `ims_yz_love_timing_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `change_value` decimal(10,2) DEFAULT NULL,
  `timing_days` int(11) DEFAULT NULL,
  `timing_rate` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `recharge_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_trading
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_trading`;
CREATE TABLE `ims_yz_love_trading` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'εΊεδΊΊID',
  `buy_id` int(11) DEFAULT NULL COMMENT 'θ΄­δΉ°δΊΊID',
  `status` tinyint(1) DEFAULT NULL COMMENT 'ηΆζοΌ0οΌεΊε?δΈ­ 1οΌε·²ε?ζ',
  `type` tinyint(1) DEFAULT NULL COMMENT 'η±»εοΌ0οΌδΊ€ζ 1οΌε¬εΈεθ΄­',
  `amount` decimal(12,2) DEFAULT NULL COMMENT 'ζ°ι',
  `poundage` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_transfer`;
CREATE TABLE `ims_yz_love_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `transfer` int(11) NOT NULL,
  `change_value` decimal(14,2) NOT NULL,
  `recipient` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poundage` decimal(14,2) DEFAULT NULL,
  `proportion` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_withdrawal_rcord
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_withdrawal_rcord`;
CREATE TABLE `ims_yz_love_withdrawal_rcord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `love_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η±εΏεΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_love_withdrawal_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_love_withdrawal_record`;
CREATE TABLE `ims_yz_love_withdrawal_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `love_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η±εΏεΌ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_fee_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_sn` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζη°εε·',
  `state` int(11) NOT NULL DEFAULT '2' COMMENT '1:η³θ―·οΌ2ζε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_manual_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_manual_bonus`;
CREATE TABLE `ims_yz_manual_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `bonus_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εηΊ’εη§°',
  `bonus_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εηΊ’ιι’',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT 'εηΊ’δΊΊζ°',
  `unit_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εδ»·',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ζ³¨',
  `role_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εηΊ’η±»ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_manual_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_manual_bonus_log`;
CREATE TABLE `ims_yz_manual_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `manual_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εηΊ’id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `bonus_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εηΊ’εη§°',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εηΊ’ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_material_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_material_category`;
CREATE TABLE `ims_yz_material_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη±»εη§°',
  `parent_id` int(11) DEFAULT '0' COMMENT 'δΈηΊ§id',
  `display_order` tinyint(1) DEFAULT '0' COMMENT 'ζεΊ',
  `enabled` tinyint(1) DEFAULT '1' COMMENT 'ζ―ε¦εΌε―',
  `level` tinyint(1) DEFAULT '0' COMMENT 'εη±»ηΊ§ε«',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `idx_displayorder` (`display_order`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_material_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_material_goods_category`;
CREATE TABLE `ims_yz_material_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mc_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mc_groups`;
CREATE TABLE `ims_yz_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  KEY `uniacid` (`uniacid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for ims_yz_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member`;
CREATE TABLE `ims_yz_member` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `inviter` int(11) DEFAULT '0',
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `province_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `area_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `area` int(11) DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci,
  `referralsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_agent` tinyint(1) DEFAULT '0',
  `alipayname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '0',
  `child_time` int(11) DEFAULT '0',
  `agent_time` int(11) DEFAULT '0',
  `apply_time` int(11) DEFAULT '0',
  `relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `custom_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity` int(11) DEFAULT NULL COMMENT 'η­ηΊ§ζζζ',
  `member_form` text COLLATE utf8mb4_unicode_ci,
  `pay_password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wechat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yz_openid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `invite_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upgrade_at` int(11) DEFAULT NULL COMMENT 'εηΊ§ζΆι΄',
  `downgrade_at` int(11) DEFAULT NULL COMMENT 'ιηΊ§ζΆι΄',
  `access_token_1` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access_expires_in_1` int(11) NOT NULL DEFAULT '0',
  `refresh_token_1` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `refresh_expires_in_1` int(11) NOT NULL DEFAULT '0',
  `access_token_2` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access_expires_in_2` int(11) NOT NULL DEFAULT '0',
  `refresh_token_2` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `refresh_expires_in_2` int(11) NOT NULL DEFAULT '0',
  `is_old` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θζ°ζ?ε€ζ­',
  `mark_member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ θ?°δΌεid',
  `system_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login_time` int(11) DEFAULT '0',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `un_member_id` (`member_id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_parentid` (`parent_id`),
  KEY `yz_member_invite_code_index` (`invite_code`),
  KEY `yz_member_access_token_1_member_id_index` (`access_token_1`,`member_id`),
  KEY `yz_member_yz_openid_index` (`yz_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_address`;
CREATE TABLE `ims_yz_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isdefault` tinyint(1) NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_aggregation_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_aggregation_app`;
CREATE TABLE `ims_yz_member_aggregation_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId_create_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_alipay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_alipay`;
CREATE TABLE `ims_yz_member_alipay` (
  `alipay_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_student_certified` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_certified` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`alipay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_app_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_app_wechat`;
CREATE TABLE `ims_yz_member_app_wechat` (
  `app_wechat_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_wechat_id`),
  UNIQUE KEY `un_openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_bank_card`;
CREATE TABLE `ims_yz_member_bank_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `member_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_card` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `bank_province` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_city` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_cancel_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cancel_record`;
CREATE TABLE `ims_yz_member_cancel_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'ε?‘ζ ΈηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ΄¦ε·ζ³¨ιε?‘ζ Έθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_member_cancel_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cancel_set`;
CREATE TABLE `ims_yz_member_cancel_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `tel_status` tinyint(4) DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ι’',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ΄¦ε·ζ³¨ιε?‘ζ Έθ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_cart`;
CREATE TABLE `ims_yz_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid_index` (`uniacid`),
  KEY `goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_certified
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_certified`;
CREATE TABLE `ims_yz_member_certified` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?id',
  `realname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηε?ε§ε',
  `idcard` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL COMMENT 'ε³θδΌεid',
  `order_id` int(11) DEFAULT '0' COMMENT 'ε³θθ?’εid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_change_log`;
CREATE TABLE `ims_yz_member_change_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `member_id_after` int(11) NOT NULL COMMENT 'εζ΄εδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_children
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_children`;
CREATE TABLE `ims_yz_member_children` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'ε±ηΊ§',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_member_children_member_id_level_index` (`member_id`,`level`),
  KEY `yz_member_children_child_id_index` (`child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=822 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_coupon`;
CREATE TABLE `ims_yz_member_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `get_type` tinyint(3) DEFAULT '0',
  `used` int(11) DEFAULT '0',
  `use_time` int(11) DEFAULT '0',
  `get_time` int(11) DEFAULT '0',
  `send_uid` int(11) DEFAULT '0',
  `order_sn` varchar(255) DEFAULT '',
  `back` tinyint(3) DEFAULT '0',
  `back_time` int(11) DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `is_member_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_expired` int(11) NOT NULL DEFAULT '0',
  `near_expiration` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε³ε°θΏζ',
  `expired_at` varchar(100) DEFAULT '',
  `coupon_qr` varchar(180) NOT NULL COMMENT 'δΌζ εΈδΊη»΄η ζδ»Άid',
  `small_qr` varchar(255) NOT NULL COMMENT 'ε°η¨εΊδΊη»΄η ε°ε',
  `coupon_qr_sn` varchar(180) NOT NULL COMMENT 'δΌζ εΈδΊη»΄η ηΌη ',
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`coupon_id`),
  KEY `idx_gettype` (`get_type`),
  KEY `idx_isexpired` (`is_expired`),
  KEY `yz_member_coupon_uid_index` (`uid`),
  KEY `ids_member_coupon_qr_sn` (`coupon_qr_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=455092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_member_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_customer`;
CREATE TABLE `ims_yz_member_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨ε?’ζ·userid',
  `unionid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ·εΌζΎεΉ³ε°ε³θηunionid',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΆζ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘εζ­₯δΌεε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_member_del_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_del_log`;
CREATE TABLE `ims_yz_member_del_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `del_uid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_douyin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_douyin`;
CREATE TABLE `ims_yz_member_douyin` (
  `douyin_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`douyin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_favorite`;
CREATE TABLE `ims_yz_member_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_goods_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_goods_invite_log`;
CREATE TABLE `ims_yz_member_goods_invite_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `parent_id` int(11) DEFAULT NULL COMMENT 'ηΆid',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'ιθ―·η ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_group`;
CREATE TABLE `ims_yz_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `group_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_history`;
CREATE TABLE `ims_yz_member_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_income
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_income`;
CREATE TABLE `ims_yz_member_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `dividend_code` int(11) DEFAULT NULL COMMENT 'εηΊ’ζδ»Ά',
  `incometable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `incometable_id` int(11) DEFAULT NULL,
  `type_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `create_month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `separate` text COLLATE utf8mb4_unicode_ci,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’εε·',
  PRIMARY KEY (`id`),
  KEY `yz_member_income_member_id_dividend_code_incometable_id_index` (`member_id`,`dividend_code`,`incometable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_invitation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_invitation_log`;
CREATE TABLE `ims_yz_member_invitation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'ιθ―·η ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL COMMENT 'δΌεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_level`;
CREATE TABLE `ims_yz_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `level_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_money` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_count` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  `validity` int(11) DEFAULT NULL COMMENT 'η­ηΊ§ζζζ',
  `freight_reduction` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΏθ΄Ήεε',
  `interests_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεζηη»ε',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'ζηθ―΄ζ',
  `team_performance` decimal(10,2) DEFAULT NULL COMMENT 'ε’ιδΈη»©',
  `balance_recharge` decimal(14,2) NOT NULL COMMENT 'δΈζ¬‘ζ§εεΌδ½ι’εΌ',
  `give_integral` decimal(12,2) DEFAULT NULL COMMENT 'θ΄­δΉ°εεθ΅ ιζΆθ΄Ήη§―εζ―δΎ',
  `give_point_today` int(11) DEFAULT NULL COMMENT 'ζ―ε€©ζι«ε―θ·η§―εζ°ι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_count`;
CREATE TABLE `ims_yz_member_lower_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `first_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏζ»ζ°',
  `second_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊηΊ§δΈηΊΏζ»ζ°',
  `third_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏζ»ζ°',
  `team_total` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιζ»ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_group_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_group_order`;
CREATE TABLE `ims_yz_member_lower_group_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `team_count` int(11) NOT NULL DEFAULT '0',
  `goods_count` int(11) NOT NULL DEFAULT '0',
  `pay_count` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_lower_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_lower_order`;
CREATE TABLE `ims_yz_member_lower_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `first_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ°',
  `first_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’ειι’',
  `second_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊηΊ§δΈηΊΏθ?’εζ°',
  `second_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊηΊ§δΈηΊΏθ?’ειι’',
  `third_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ°',
  `third_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’ειι’',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιδΈηΊΏθ?’εζ°',
  `team_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιδΈηΊΏθ?’ειι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `pay_count` int(11) DEFAULT '0' COMMENT 'ε’ιζ―δ»δΊΊζ°',
  `team_count` int(11) DEFAULT '0' COMMENT 'ε’ιζ»δΊΊζ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_merge_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_merge_log`;
CREATE TABLE `ims_yz_member_merge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `member_id` int(11) NOT NULL COMMENT 'δΏηδΌεid',
  `mark_member_id` int(11) NOT NULL COMMENT 'θ’«ζ θ?°δΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_mini_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_mini_app`;
CREATE TABLE `ims_yz_member_mini_app` (
  `mini_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId_create_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`mini_app_id`),
  UNIQUE KEY `un_openid` (`openid`),
  KEY `yz_member_mini_app_openid_index` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_mini_formid
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_mini_formid`;
CREATE TABLE `ims_yz_member_mini_formid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addtime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_month_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_month_order`;
CREATE TABLE `ims_yz_member_month_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εζ°ι',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’εζ»ι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_month_rank
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_month_rank`;
CREATE TABLE `ims_yz_member_month_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'δΈδΊηΊ§ε’ιδΈη»©ζ»ι’',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_order_operation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_order_operation`;
CREATE TABLE `ims_yz_member_order_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_parent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_parent`;
CREATE TABLE `ims_yz_member_parent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΆid',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'ε±ηΊ§',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_member_parent_member_id_level_index` (`member_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_position
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_position`;
CREATE TABLE `ims_yz_member_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `province_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η',
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΈ',
  `district_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊ',
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η»εΊ¦',
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΊ¬εΊ¦',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌεε?δ½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_member_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_poster`;
CREATE TABLE `ims_yz_member_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `job_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_price_independent
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_price_independent`;
CREATE TABLE `ims_yz_member_price_independent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `is_member_price_independent` tinyint(4) DEFAULT NULL COMMENT 'εεεη¬θ?Ύη½?  1-ε³ι­ 2-εΌε―',
  `price_level` tinyint(4) DEFAULT NULL COMMENT 'εεδΌεη­ηΊ§δ»·ζ Όθ?Ύη½?  1-ε½εδΌεη­ηΊ§δ»·ζ Ό 2-ε½εδΌεδΈδΈη­ηΊ§δ»·ζ Ό',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_qq
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_qq`;
CREATE TABLE `ims_yz_member_qq` (
  `qq_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_qq_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `figureurl_qq_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `is_yellow_year_vip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vip` int(11) NOT NULL DEFAULT '0',
  `yellow_vip_level` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `is_yellow_vip` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`qq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_record`;
CREATE TABLE `ims_yz_member_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `after_parent_id` int(11) DEFAULT '0' COMMENT 'δΏ?ζΉεηΆηΊ§id',
  `status` int(11) DEFAULT '1' COMMENT '0δΏ?ζΉδΈ­οΌ1δΏ?ζΉζεοΌ2δΏ?ζΉε€±θ΄₯',
  `time` int(11) DEFAULT '0' COMMENT 'θζΆ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation`;
CREATE TABLE `ims_yz_member_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `become` tinyint(1) NOT NULL DEFAULT '0',
  `become_order` tinyint(1) NOT NULL DEFAULT '0',
  `become_child` tinyint(1) NOT NULL DEFAULT '0',
  `become_ordercount` int(11) DEFAULT '0',
  `become_moneycount` decimal(15,2) DEFAULT '0.00',
  `become_goods_id` text COLLATE utf8mb4_unicode_ci,
  `become_info` tinyint(1) NOT NULL DEFAULT '1',
  `become_check` tinyint(1) NOT NULL DEFAULT '1',
  `share_page` tinyint(1) NOT NULL DEFAULT '1',
  `become_selfmoney` decimal(15,2) NOT NULL DEFAULT '0.00',
  `become_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `become_goods` text COLLATE utf8mb4_unicode_ci,
  `share_page_deail` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ζΎη€Ί1:δΈζΎη€Ί',
  `reward_points` int(11) NOT NULL DEFAULT '0',
  `maximum_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation_order_statistics`;
CREATE TABLE `ims_yz_member_relation_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `first_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ»ζ°',
  `first_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ»ι’',
  `second_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊηΊ§δΈηΊΏθ?’εζ»ζ°',
  `second_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'δΊηΊ§δΈηΊΏθ?’εζ»ι’',
  `third_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ»ζ°',
  `third_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'δΈηΊ§δΈηΊΏθ?’εζ»ι’',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιθ?’εζ»ζ°',
  `team_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'ε’ιθ?’εζ»ι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_relation_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_relation_statistics`;
CREATE TABLE `ims_yz_member_relation_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `first_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏζ»ζ°',
  `second_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΊηΊ§δΈηΊΏζ»ζ°',
  `third_total` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§δΈηΊΏζ»ζ°',
  `team_total` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιζ»δΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_synchro_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_synchro_log`;
CREATE TABLE `ims_yz_member_synchro_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_member` int(11) NOT NULL,
  `new_member` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_tags`;
CREATE TABLE `ims_yz_member_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`),
  KEY `tagid` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_unique
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_unique`;
CREATE TABLE `ims_yz_member_unique` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `unionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`unique_id`),
  UNIQUE KEY `un_unionid` (`unionid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_member_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_member_wechat`;
CREATE TABLE `ims_yz_member_wechat` (
  `wechat_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`wechat_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_membership_infomattion_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_membership_infomattion_log`;
CREATE TABLE `ims_yz_membership_infomattion_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `old_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¨ζ·δΏ?ζΉεδΏ‘ζ―',
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'session_id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `new_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¨ζ·δΏ?ζΉεδΏ‘ζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_menu`;
CREATE TABLE `ims_yz_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url_params` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `permit` tinyint(1) NOT NULL DEFAULT '0',
  `menu` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant`;
CREATE TABLE `ims_yz_merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `staff_level_id` int(11) NOT NULL DEFAULT '0',
  `change_time` int(11) DEFAULT NULL COMMENT 'ζδΈΊζεδΈ­εΏζΆι΄',
  `user_uid` int(11) DEFAULT '0' COMMENT 'yz_user.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_apply`;
CREATE TABLE `ims_yz_merchant_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_black
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_black`;
CREATE TABLE `ims_yz_merchant_black` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_bonus_log`;
CREATE TABLE `ims_yz_merchant_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `is_center` tinyint(1) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_base` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_status` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `create_month` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settle_days` int(11) DEFAULT NULL,
  `lower_level_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `store_detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι¨εΊη¬η«εηΊ’θ―¦ζ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_goods`;
CREATE TABLE `ims_yz_merchant_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_open_bonus_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_open_bonus_center` tinyint(1) NOT NULL DEFAULT '0',
  `staff_bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `set` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `staff_levels` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_level`;
CREATE TABLE `ims_yz_merchant_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000',
  `upgrade_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `become` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `condition` int(11) NOT NULL DEFAULT '1' COMMENT '1δΈοΌ0ζ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_log`;
CREATE TABLE `ims_yz_merchant_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_log_id` int(11) DEFAULT NULL COMMENT 'ζεεηΊ’θ?°ε½ID',
  `boss_uid` int(11) DEFAULT NULL COMMENT 'θζΏUID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_merchant_staff_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_merchant_staff_level`;
CREATE TABLE `ims_yz_merchant_staff_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0',
  `bonus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000',
  `upgrate` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '1' COMMENT '1δΈοΌ0ζ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_message_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_message_template`;
CREATE TABLE `ims_yz_message_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first` text COLLATE utf8mb4_unicode_ci,
  `first_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `remark_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `notice_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `news_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_category`;
CREATE TABLE `ims_yz_micro_communities_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `see_major` int(11) DEFAULT NULL,
  `see_subordinate` text COLLATE utf8mb4_unicode_ci,
  `release_major` int(11) DEFAULT NULL,
  `release_subordinate` text COLLATE utf8mb4_unicode_ci,
  `is_show` tinyint(4) DEFAULT '1',
  `is_examine` tinyint(4) DEFAULT '1',
  `is_del` tinyint(4) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL COMMENT 'η§―ε',
  `integral_num` int(11) DEFAULT NULL COMMENT 'η§―εζ¬‘ζ°',
  `love` text COLLATE utf8mb4_unicode_ci COMMENT 'η±εΏεΌ',
  `love_num` text COLLATE utf8mb4_unicode_ci COMMENT 'η±εΏεΌζ¬‘ζ°',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΆηΊ§εη±»ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT 'εη±»ηΊ§ε« 1-δΈ»εη±» 2-ζ¬‘εη±»',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_category_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_category_reward`;
CREATE TABLE `ims_yz_micro_communities_category_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `category_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `stick_id` int(11) DEFAULT NULL COMMENT 'εΈε­id',
  `integral` int(11) DEFAULT NULL COMMENT 'ε₯ε±η§―ε',
  `love` int(11) DEFAULT NULL COMMENT 'ε₯ε±η±εΏεΌ',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_search_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_search_log`;
CREATE TABLE `ims_yz_micro_communities_search_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_set`;
CREATE TABLE `ims_yz_micro_communities_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick`;
CREATE TABLE `ims_yz_micro_communities_stick` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `uname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments_num` int(11) NOT NULL DEFAULT '0',
  `browse_num` int(11) NOT NULL,
  `browse_user` int(11) NOT NULL,
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `reward_num` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `is_recommend` tinyint(4) DEFAULT '0',
  `is_top` tinyint(4) DEFAULT '0',
  `is_show` tinyint(4) DEFAULT '0',
  `is_del` tinyint(4) DEFAULT '0',
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ylng` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `ylat` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `order_sn` int(11) DEFAULT NULL COMMENT 'ζ―δ»ζΉεΌID',
  `order_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εε°ε',
  `wish_goods_id` int(11) DEFAULT NULL COMMENT 'εΏζΏεεID',
  `is_store` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ι¨εΊεεΈοΌ1ζ―',
  `is_pc` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ―PCη«―εεΈοΌ1ζ―',
  `audio` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ι³ι’ιΎζ₯',
  `is_crm` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦crmζ¨ιοΌ0ε¦1ζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_browse`;
CREATE TABLE `ims_yz_micro_communities_stick_browse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_comments
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_comments`;
CREATE TABLE `ims_yz_micro_communities_stick_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_cm_id` int(11) DEFAULT '0',
  `less_cm_id` int(11) DEFAULT '0',
  `praise_num` int(11) DEFAULT '0',
  `is_del` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci COMMENT 'ηΆηΊ§εη±»ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10765 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_follow`;
CREATE TABLE `ims_yz_micro_communities_stick_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `attention_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_images
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_images`;
CREATE TABLE `ims_yz_micro_communities_stick_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stick_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_praise
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_praise`;
CREATE TABLE `ims_yz_micro_communities_stick_praise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_communities_stick_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_communities_stick_reward`;
CREATE TABLE `ims_yz_micro_communities_stick_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `stick_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `stick_user_id` int(11) DEFAULT NULL,
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT NULL,
  `money` decimal(8,2) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `pay_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_status` tinyint(4) DEFAULT NULL,
  `reward_user_id` int(11) DEFAULT NULL,
  `is_del` tinyint(4) DEFAULT '0',
  `sync_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―θ?ΊID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop`;
CREATE TABLE `ims_yz_micro_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `shop_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `shop_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `signature` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `shop_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `is_ban` int(11) DEFAULT '0' COMMENT '1η¦η¨οΌ0ζ­£εΈΈ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_bonus_log`;
CREATE TABLE `ims_yz_micro_shop_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `level_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_buyer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) DEFAULT '0.00',
  `goods_cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `goods_total` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `pay_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `complete_time` int(11) NOT NULL DEFAULT '0',
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_time` int(11) NOT NULL DEFAULT '0',
  `refund_time` int(11) NOT NULL DEFAULT '0',
  `is_lower` int(11) NOT NULL DEFAULT '0',
  `lower_level_shop_id` int(11) NOT NULL DEFAULT '0',
  `lower_level_member_id` int(11) NOT NULL DEFAULT '0',
  `lower_level_nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `lower_level_bonus_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `agent_bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_carousel`;
CREATE TABLE `ims_yz_micro_shop_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `slide_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_carousel` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(10) unsigned NOT NULL DEFAULT '0',
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_goods`;
CREATE TABLE `ims_yz_micro_shop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_level`;
CREATE TABLE `ims_yz_micro_shop_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `level_weight` int(11) NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§ζι',
  `level_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§εη§°',
  `bonus_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εηΊ’ζ―δΎ',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_micro_shop_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_micro_shop_withdraw`;
CREATE TABLE `ims_yz_micro_shop_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `log_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_min_app_urlscheme
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_min_app_urlscheme`;
CREATE TABLE `ims_yz_min_app_urlscheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι‘΅ι’θ·―εΎ',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΎζ₯',
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊεε§ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mini_app_template_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mini_app_template_message`;
CREATE TABLE `ims_yz_mini_app_template_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `is_default` int(11) DEFAULT NULL,
  `is_open` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `small_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ°ζ¨‘ζΏζ θ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_mini_template_corresponding
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_mini_template_corresponding`;
CREATE TABLE `ims_yz_mini_template_corresponding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `small_type` int(11) DEFAULT NULL COMMENT 'η±»εid',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎ?δΏ‘ζ¨‘ζΏid',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎ?δΏ‘ζ¨‘ζΏεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer`;
CREATE TABLE `ims_yz_more_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ukey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `printer_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `times` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer_setting`;
CREATE TABLE `ims_yz_more_printer_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `printer_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_more_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_more_printer_temp`;
CREATE TABLE `ims_yz_more_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε°εε?ΉζΎε€§δΈε',
  `print_style_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε°εζ ΌεΌζΎε€§δΈε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_activity`;
CREATE TABLE `ims_yz_new_member_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΌε§ζΆι΄',
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `activity_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨ζΈ ι',
  `receive_type` tinyint(4) DEFAULT NULL COMMENT 'ι’εζ‘δ»Ά',
  `receive_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ‘δ»Άεε?Ή',
  `prize_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε₯εid',
  `background_type` tinyint(4) DEFAULT NULL COMMENT 'ζ ·εΌ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ι’',
  `receive_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι’εδΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_poster`;
CREATE TABLE `ims_yz_new_member_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT 'δΌεid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηζηΆζ',
  `job_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_prize
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_prize`;
CREATE TABLE `ims_yz_new_member_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε₯εεη§°',
  `prize_type` tinyint(4) DEFAULT NULL COMMENT 'ε₯εη±»ε',
  `coupon_id` int(11) DEFAULT NULL COMMENT 'δΌζ εΈid',
  `coupon_num` int(11) DEFAULT NULL COMMENT 'δΌζ εΈζ°ι',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT 'η§―ε',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT 'η±εΏεΌ',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT 'δ½ι’',
  `prize_num` int(11) DEFAULT NULL COMMENT 'ε₯εζ°ι',
  `received_num` int(11) DEFAULT '0' COMMENT 'ε·²εζΎ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_member_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_member_record`;
CREATE TABLE `ims_yz_new_member_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨id',
  `coupon_id` int(11) DEFAULT NULL COMMENT 'δΌζ εΈid',
  `point` decimal(14,2) DEFAULT '0.00' COMMENT 'η§―ε',
  `love` decimal(14,2) DEFAULT '0.00' COMMENT 'η±εΏεΌ',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT 'δ½ι’',
  `receive_type` int(11) DEFAULT NULL COMMENT 'ι’εζ‘δ»Ά',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΌζ εΈεη§°',
  `coupon_num` int(11) DEFAULT NULL COMMENT 'δΌζ εΈζ°ι',
  `prize_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε₯εεη§°',
  `prize_id` int(11) DEFAULT NULL COMMENT 'ε₯εid',
  `prize_type` int(11) DEFAULT NULL COMMENT 'ε₯εη±»ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_post_by_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_post_by_wechat`;
CREATE TABLE `ims_yz_new_post_by_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΅·ζ₯ε?ζ΄θ·―εΎ',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘θΏεmediaId',
  `compare_at` int(11) NOT NULL COMMENT 'ζ―θΎζ΄ζ°ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster`;
CREATE TABLE `ims_yz_new_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΅·ζ₯εη§°',
  `poster_type` tinyint(4) NOT NULL COMMENT 'ζ΅·ζ₯η±»ε',
  `type` tinyint(4) NOT NULL COMMENT 'ζ΅·ζ₯ζιη±»ε',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε³ι?ε­',
  `time_start` int(10) unsigned DEFAULT '0' COMMENT 'εΌε§ζΆι΄',
  `time_end` int(10) unsigned DEFAULT '0' COMMENT 'η»ζζΆι΄',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θζ―θ²',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θζ―εΎ',
  `background_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θζ―εΎurl',
  `short_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `label_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ η­Ύid',
  `style_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΅·ζ₯ζ°ζ?',
  `response_status` tinyint(4) NOT NULL COMMENT 'ζ¨ιεΌε³',
  `response_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ¨ιη±»ε',
  `response_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'ζ¨ιζ ι’',
  `response_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨ιεΎη',
  `response_thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨ιεΎηurl',
  `response_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨ιζθΏ°',
  `response_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨ιιΎζ₯',
  `response_text` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ¨ιζζ¬',
  `is_open` tinyint(4) DEFAULT '0' COMMENT 'εΌζΎζι',
  `auto_sub` tinyint(4) DEFAULT '1' COMMENT 'ζ«η ε³ζ³¨ζδΈΊδΈηΊΏ',
  `status` tinyint(4) DEFAULT '1' COMMENT 'ζ―ε¦ε―η¨',
  `center_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'δΌεδΈ­εΏζΎη€Ί',
  `app_share_show` tinyint(4) DEFAULT '0' COMMENT 'appεδΊ«ι‘΅ι’ζΎη€Ί',
  `is_ago` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦η±εη«―ηζζ΅·ζ₯',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_award
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_award`;
CREATE TABLE `ims_yz_new_poster_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT 'ζ΅·ζ₯id',
  `subscriber_memberid` int(10) unsigned NOT NULL COMMENT 'ε³ζ³¨θδΌεid',
  `recommender_memberid` int(10) unsigned NOT NULL COMMENT 'ζ¨θθδΌεid',
  `recommender_credit` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎη§―ε',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ζ¨θθθ·εΎιι’',
  `recommender_wechat_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ζ¨θθθ·εΎεΎ?δΏ‘ιι’',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎδΌζ εΈid',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎδΌζ εΈζ°ι',
  `subscriber_credit` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎη§―ε',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ε³ζ³¨θθ·εΎιι’',
  `subscriber_wechat_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ε³ζ³¨θθ·εΎεΎ?δΏ‘ιι’',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎδΌζ εΈid',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎδΌζ εΈζ°ι',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `poster_id` (`poster_id`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_label
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_label`;
CREATE TABLE `ims_yz_new_poster_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ η­Ύεη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_qrcode`;
CREATE TABLE `ims_yz_new_poster_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT 'ζ΅·ζ₯id',
  `qrcode_id` int(10) unsigned NOT NULL COMMENT 'δΊη»΄η id',
  `member_id` int(10) unsigned NOT NULL COMMENT 'δΌεid',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_qrcodeid` (`qrcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_record`;
CREATE TABLE `ims_yz_new_poster_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ΅·ζ₯url',
  `poster_type` tinyint(4) DEFAULT NULL COMMENT 'ζ΅·ζ₯η±»ε',
  `poster_id` int(10) unsigned NOT NULL COMMENT 'ζ΅·ζ₯id',
  `member_id` int(10) unsigned NOT NULL COMMENT 'δΌεid',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_scan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_scan`;
CREATE TABLE `ims_yz_new_poster_scan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL COMMENT 'ζ΅·ζ₯id',
  `subscriber_memberid` int(10) unsigned NOT NULL COMMENT 'ε³ζ³¨θδΌεid',
  `recommender_memberid` int(10) unsigned NOT NULL COMMENT 'ζ¨θθδΌεid',
  `event_type` tinyint(1) NOT NULL COMMENT 'δΊδ»Άη±»ε',
  `sign_up_this_time` tinyint(1) NOT NULL COMMENT 'ζ¬ζ¬‘ζ«η ζ³¨ε',
  `is_register` tinyint(1) NOT NULL COMMENT 'ζ«η ζΆζ―ε¦ε·²ζ³¨εθΏ',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_new_poster_supplement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_new_poster_supplement`;
CREATE TABLE `ims_yz_new_poster_supplement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int(10) unsigned NOT NULL,
  `not_start_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `finish_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wait_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηζζΆη­εΎζε­',
  `disable_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η¦η¨ζΆεε€ζε­',
  `not_open_reminder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζͺεΌζΎζιζη€Ί',
  `not_open_reminder_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζͺεΌζΎζιζη€Ίurl',
  `recommender_credit` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎη§―ε',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ζ¨θθθ·εΎιι’',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎδΌζ εΈid',
  `recommender_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨θθθ·εΎδΌζ εΈεη§°',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0' COMMENT 'ζ¨θθθ·εΎδΌζ εΈζ°ι',
  `subscriber_credit` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎη§―ε',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00' COMMENT 'ε³ζ³¨θθ·εΎιι’',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎδΌζ εΈid',
  `subscriber_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε³ζ³¨θθ·εΎδΌζ εΈεη§°',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0' COMMENT 'ε³ζ³¨θθ·εΎδΌζ εΈζ°ι',
  `bonus_method` tinyint(1) DEFAULT '1' COMMENT 'ε₯ε±η°ιζΉεΌ',
  `recommender_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨θθε₯ε±ιη₯ζ ι’',
  `subscriber_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε³ζ³¨θε₯ε±ιη₯ζ ι’',
  `recommender_award_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨θθε₯ε±ιη₯',
  `subscriber_award_notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε³ζ³¨θε₯ε±ιη₯',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_poster_id` (`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_member_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_member_data`;
CREATE TABLE `ims_yz_official_website_member_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?id',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'ε§ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_multiple
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_multiple`;
CREATE TABLE `ims_yz_official_website_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `theme_id` int(11) NOT NULL COMMENT 'δΈ»ι’ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εη§°',
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ θ―',
  `mul_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ ι’',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε³ι?θ―',
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζθΏ°',
  `detail` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―¦ζ',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯',
  `article` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ζη« ι¨ε',
  `helper` longtext COLLATE utf8mb4_unicode_ci COMMENT 'εΈ?ε©ι¨ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_official_website_theme_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_official_website_theme_set`;
CREATE TABLE `ims_yz_official_website_theme_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?id',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΈ»ι’εη§°',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ι»θ?€ 1-ζ― 0-ε¦',
  `basic` text COLLATE utf8mb4_unicode_ci COMMENT 'εΊη‘',
  `top` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€΄ι¨',
  `tail` text COLLATE utf8mb4_unicode_ci COMMENT 'ε°Ύι¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'common' COMMENT 'ζ θ―οΌη¨δΊεη«―ζΎη€ΊζΆεΊε«ζ ι’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_operation_log`;
CREATE TABLE `ims_yz_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζδ½δΊΊid',
  `user_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζδ½δΊΊ',
  `modules` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘ε',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ¨‘εη±»ε«',
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζδ½δΊΊIP',
  `old_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΏ?ζΉεεε?Ή',
  `new_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΏ?ζΉεεε?Ή',
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε­ζ?΅εη§°',
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΏ?ζΉηε­ζ?΅',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΏ?ζΉζε±ηid',
  `input` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:θ?°ε½ζε|1οΌθ?°ε½ε€±θ΄₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=21015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_options
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_options`;
CREATE TABLE `ims_yz_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `top_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order`;
CREATE TABLE `ims_yz_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `order_sn` varchar(23) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_total` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `is_member_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `finish_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `send_time` int(11) NOT NULL DEFAULT '0',
  `cancel_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `cancel_pay_time` int(11) NOT NULL DEFAULT '0',
  `cancel_send_time` int(11) NOT NULL DEFAULT '0',
  `dispatch_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `order_goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `is_plugin` int(11) NOT NULL DEFAULT '0',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_status` tinyint(2) NOT NULL DEFAULT '0',
  `order_pay_id` varchar(23) NOT NULL DEFAULT '',
  `is_virtual` tinyint(4) NOT NULL DEFAULT '0',
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `mark` varchar(100) DEFAULT '' COMMENT 'ζε­ζ θ―',
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  `note` text,
  `cost_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `shop_name` varchar(255) DEFAULT NULL,
  `no_refund` tinyint(4) NOT NULL DEFAULT '0',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦ε‘«εζΆθ΄§ε°ε 0:ζ―1:ε¦',
  `invoice_type` int(11) DEFAULT NULL,
  `rise_type` int(11) DEFAULT NULL,
  `collect_name` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `auto_receipt` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦θͺε¨ζΆθ΄§ 0:ζ―1:ε¦',
  `fee_amount` decimal(14,2) NOT NULL DEFAULT '0.00',
  `service_fee_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’εζε‘θ΄Ήιι’',
  `is_all_send_goods` int(11) DEFAULT '0' COMMENT '0 ζ­£εΈΈε¨ι¨εθ΄§ 1ι¨εεθ΄§ 2ε€εθ£Ήε¨ι¨εθ΄§',
  `close_reason` text COMMENT 'ε³ι­εε ',
  `vip_order_goods_price` decimal(14,2) DEFAULT NULL COMMENT 'δΌεδ»·ιι’',
  PRIMARY KEY (`id`),
  KEY `yz_order_uniacid_index` (`uniacid`),
  KEY `yz_order_uid_index` (`uid`),
  KEY `yz_order_order_sn_index` (`order_sn`),
  KEY `yz_order_plugin_id_index` (`plugin_id`),
  KEY `yz_order_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_address`;
CREATE TABLE `ims_yz_order_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηid',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΈid',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΊid',
  `note` text,
  `street_id` int(11) DEFAULT '0',
  `zipcode` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL DEFAULT '' COMMENT 'η»εΊ¦',
  `latitude` varchar(15) NOT NULL DEFAULT '' COMMENT 'ηΊ¬εΊ¦',
  PRIMARY KEY (`id`),
  KEY `yz_order_address_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_address_update_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_address_update_log`;
CREATE TABLE `ims_yz_order_address_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΉ³ε°ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `user_id` int(11) DEFAULT NULL COMMENT 'ζδ½εid',
  `province_id` int(11) DEFAULT '0' COMMENT 'ηID',
  `city_id` int(11) DEFAULT '0' COMMENT 'εΈID',
  `district_id` int(11) DEFAULT '0' COMMENT 'εΊID',
  `street_id` int(11) DEFAULT '0' COMMENT 'θ‘ιID',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆδ»ΆδΊΊε§ε',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θη³»ζΉεΌ',
  `new_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ°ε°ε',
  `old_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ§ε°ε',
  `old_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ§εη§°',
  `old_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ§ζζΊε·',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’ε--θ?’εε°εδΏ?ζΉθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_behalf_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_behalf_pay_record`;
CREATE TABLE `ims_yz_order_behalf_pay_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `order_ids` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?’εε·ει',
  `order_pay_id` int(11) NOT NULL COMMENT 'θ?’εζ―δ»θ‘¨id',
  `pay_sn` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ―δ»εε·',
  `member_id` int(11) NOT NULL COMMENT 'θ?’εδΌεid',
  `behalf_id` int(11) NOT NULL COMMENT 'δ»£δ»δΊΊid',
  `behalf_type` int(11) NOT NULL DEFAULT '1' COMMENT '1ζ―ζΎδΊΊδ»£δ»οΌ2ζ―δΈηΊ§δ»£δ»',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δ»£δ»θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_order_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_change_log`;
CREATE TABLE `ims_yz_order_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `new_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_price` decimal(10,2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `change_dispatch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `clerk_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'ζ Έιεζ₯ζΊ',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ ΈιεID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_coin_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coin_exchange`;
CREATE TABLE `ims_yz_order_coin_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coin` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_coin_exchange_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_count`;
CREATE TABLE `ims_yz_order_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΆID',
  `total_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εζ»ζ°ι',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'θ?’εζ»ιι’',
  `total_pay_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ε·²ζ―δ»θ?’εζ»ζ°ι',
  `total_pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'ε·²ζ―δ»θ?’εζ»ιι’',
  `total_complete_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ε·²ε?ζθ?’εζ»ζ°ι',
  `total_complete_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'ε·²ε?ζθ?’εζ»ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coupon`;
CREATE TABLE `ims_yz_order_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `member_coupon_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_coupon_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_coupon_return`;
CREATE TABLE `ims_yz_order_coupon_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εδΌζ εΈid',
  `return_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_created_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_created_job`;
CREATE TABLE `ims_yz_order_created_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_deduction`;
CREATE TABLE `ims_yz_order_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΅ζ£εη§°',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ιι’',
  `coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ζ°εΌ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_deliver`;
CREATE TABLE `ims_yz_order_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL,
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_discount`;
CREATE TABLE `ims_yz_order_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `discount_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζζ£δ»£η ',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ιι’',
  `is_indirect` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ι΄ζ₯θ?‘η?εΊ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―₯δΌζ ι‘Ήη?δΈε¨ι’δΈεζΎη€ΊοΌ0ε¦1ζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_expediting_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_expediting_delivery`;
CREATE TABLE `ims_yz_order_expediting_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΌε·',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_express`;
CREATE TABLE `ims_yz_order_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_fee`;
CREATE TABLE `ims_yz_order_fee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `fee_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζη»­θ΄Ήη ',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ιι’',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods`;
CREATE TABLE `ims_yz_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pay_sn` varchar(23) NOT NULL DEFAULT '',
  `total` int(11) NOT NULL DEFAULT '1',
  `create_at` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_sn` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_option_id` int(11) NOT NULL DEFAULT '0',
  `goods_option_title` varchar(50) NOT NULL DEFAULT '',
  `product_sn` varchar(23) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_status` tinyint(3) NOT NULL DEFAULT '0',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `goods_market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vip_price` decimal(10,2) DEFAULT '0.00',
  `coupon_price` decimal(10,2) DEFAULT '0.00',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `need_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦ε‘«εζΆθ΄§ε°ε 0:ζ―1:ε¦',
  `order_express_id` int(11) DEFAULT NULL COMMENT 'order_expressθ‘¨id  εεε±δΊεͺδΈͺεθ£Ή',
  `is_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιζ¬Ύ 1ζ― 0ε¦',
  PRIMARY KEY (`id`),
  KEY `yz_order_goods_order_id_index` (`order_id`),
  KEY `yz_order_goods_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1564 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_goods_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_change_log`;
CREATE TABLE `ims_yz_order_goods_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_change_log_id` int(11) DEFAULT NULL,
  `order_goods_id` int(11) NOT NULL,
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `new_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_goods_coin_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_coin_exchange`;
CREATE TABLE `ims_yz_order_goods_coin_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_goods_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `coin` decimal(14,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_goods_coin_exchange_order_goods_id_index` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_coupon`;
CREATE TABLE `ims_yz_order_goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_goods_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_several` int(11) NOT NULL DEFAULT '1',
  `send_type` tinyint(4) NOT NULL DEFAULT '1',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT 'εζΎζ°ιγε­ζ?΅εεεζ΅η¨δΈθ΄',
  `end_send_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ε·²εζΎγε­ζ?΅εεεζ΅η¨δΈθ΄',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊεε εΌ εε?εε εΌ δΈδΈθ΄ζΆεε ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_goods_id_coupon_id` (`order_goods_id`,`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_deduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_deduction`;
CREATE TABLE `ims_yz_order_goods_deduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `order_goods_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΅ζ£εη§°',
  `usable_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ιι’',
  `usable_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ζ°εΌ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `used_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ζ°εΌ',
  `used_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ΅ζ£ιι’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_discount`;
CREATE TABLE `ims_yz_order_goods_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_goods_id` int(11) NOT NULL,
  `discount_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζζ£δ»£η ',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ιι’',
  `is_indirect` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ι΄ζ₯θ?‘η?εΊ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_diy_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_diy_form`;
CREATE TABLE `ims_yz_order_goods_diy_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `diyform_data_id` int(11) DEFAULT NULL,
  `order_goods_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_goods_expansion
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_goods_expansion`;
CREATE TABLE `ims_yz_order_goods_expansion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_goods_id` int(11) NOT NULL,
  `plugin_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_income_count
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_income_count`;
CREATE TABLE `ims_yz_order_income_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL COMMENT 'θ΄­δΉ°θid',
  `buy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΄­δΉ°θζ΅η§°',
  `parent_id` int(11) NOT NULL COMMENT 'ζ¨θθid',
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¨θθζ΅η§°',
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε?Άεη§°',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εε·',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εε·',
  `price` decimal(14,2) DEFAULT NULL COMMENT 'θ?’ειι’',
  `cost_price` decimal(14,2) DEFAULT NULL COMMENT 'θ?’εζζ¬δ»·',
  `dispatch_price` decimal(14,2) DEFAULT NULL COMMENT 'θ?’εθΏθ΄Ή',
  `undividend` decimal(14,2) DEFAULT NULL COMMENT 'ζͺθ’«εηΊ’ε©ζΆ¦',
  `supplier` decimal(14,2) DEFAULT NULL COMMENT 'δΎεΊεε©ζΆ¦',
  `cashier` decimal(14,2) DEFAULT NULL COMMENT 'ζΆιΆε°ε©ζΆ¦',
  `store` decimal(14,2) DEFAULT NULL COMMENT 'ι¨εΊε©ζΆ¦',
  `point` decimal(14,2) DEFAULT NULL COMMENT 'θ·εΎη§―ε',
  `love` decimal(14,2) DEFAULT NULL COMMENT 'θ·εΎη±εΏεΌ',
  `micro_shop` decimal(14,2) DEFAULT NULL COMMENT 'εΎ?εΊεηΊ’',
  `team_dividend` decimal(14,2) DEFAULT NULL COMMENT 'η»ιεζζ',
  `area_dividend` decimal(14,2) DEFAULT NULL COMMENT 'εΊεεηΊ’',
  `merchant` decimal(14,2) DEFAULT NULL COMMENT 'ζεεεηΊ’',
  `merchant_center` decimal(14,2) DEFAULT NULL COMMENT 'ζεδΈ­εΏεηΊ’',
  `commission` decimal(14,2) DEFAULT NULL COMMENT 'ειεηΊ’',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°ε',
  `status` int(11) DEFAULT NULL COMMENT 'θ?’εηΆζ',
  `plugin_id` int(11) DEFAULT NULL COMMENT 'ζδ»Άid',
  `day_time` int(11) NOT NULL COMMENT 'θ΄­δΉ°ζ₯ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `room` decimal(14,2) DEFAULT NULL COMMENT 'δΈ»ζ­εηΊ’',
  PRIMARY KEY (`id`),
  KEY `yz_order_income_count_order_id_index` (`order_id`),
  KEY `yz_order_income_count_uniacid_index` (`uniacid`),
  KEY `yz_order_income_count_uid_index` (`uid`),
  KEY `yz_order_income_count_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_invoice`;
CREATE TABLE `ims_yz_order_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `order_id` int(11) NOT NULL COMMENT 'θ?’εid',
  `need_invoice` int(11) NOT NULL COMMENT 'ζ―ε¦εΌεη₯¨ 0ε¦1ζ―',
  `invoice_type` int(11) DEFAULT NULL COMMENT 'εη₯¨η±»ε(0η΅ε­1ηΊΈθ΄¨)',
  `rise_type` int(11) DEFAULT NULL COMMENT 'εη₯¨ζ¬ε€΄(1δΈͺδΊΊ0εδ½)',
  `collect_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¬ε€΄ζεδ½εη§°',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η΅ε­ι?η?±',
  `company_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδ½θ―ε«η ',
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εη₯¨εΎηιΎζ₯',
  `preview_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εη₯¨ι’θ§ιΎζ₯',
  `invoice_date` int(11) DEFAULT NULL COMMENT 'εΌη₯¨ζΆι΄',
  `state` tinyint(4) DEFAULT '0' COMMENT '0ζͺεΌη₯¨γ1εΌη₯¨ζεγ2εΌη₯¨δΈ­γ3εΌη₯¨ε€±θ΄₯',
  `invoice_fail_msg` text COLLATE utf8mb4_unicode_ci COMMENT 'εΌη₯¨ε€±θ΄₯εε ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `enterprise_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΌδΈε―δΈζ θ―',
  `invoice_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη₯¨θ―·ζ±ζ΅ζ°΄ε· (ε¨ε±ε―δΈ)',
  `equipment_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¨ζ§θ?Ύε€ε·',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌη₯¨η±»εοΌ0-θε­εη₯¨οΌ1-ηΊ’ε­εη₯¨',
  `special_type` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΉζ?η₯¨η§οΌ0-δΈζ―οΌ1-εδΊ§ειε?οΌ2-εδΊ§εζΆθ΄­(ζΆθ΄­η₯¨)',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎζΆζΉεΌοΌ0- δΈζ?η₯¨οΌ1-εζθ?‘ε’οΌ2-ε·?ι’εΎζΆ',
  `list_identification` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΈεζ θ―οΌ0- ιζΈεοΌ1- ζΈε',
  `xsf_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιε?ζΉεη§°',
  `xsf_taxpayer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιε?ζΉηΊ³η¨δΊΊθ―ε«ε·',
  `xsf_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιε?ζΉε°ε',
  `xsf_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιε?ζΉη΅θ―',
  `xsf_bank_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιε?ζΉιΆθ‘θ΄¦ζ·',
  `gmf_taxpayer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ΄­δΉ°ζΉηΊ³η¨δΊΊθ―ε«ε·',
  `gmf_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ³¨εε°ε',
  `gmf_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΌζ·ιΆθ‘',
  `gmf_bank_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ΄­δΉ°ζΉιΆθ‘θ΄¦ζ·',
  `gmf_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ³¨εη΅θ―',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη₯¨εε?Ή',
  `drawer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΌη₯¨δΊΊ',
  `payee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζΆζ¬ΎδΊΊ',
  `reviewer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ζ ΈδΊΊ',
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ζ³¨',
  `notice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιη₯εηΌε·',
  `applicant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η³θ―·δΊΊ',
  `is_audit` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦θͺε¨ε?‘ζ ΈοΌ0-ιθͺε¨ε?‘ζ ΈοΌ1-θͺε¨ε?‘ζ Έ',
  `detail_param` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζη»εζ°',
  `tax_rate` int(11) NOT NULL DEFAULT '0' COMMENT 'η¨η',
  `zero_tax_rate` int(11) NOT NULL DEFAULT '0' COMMENT 'ιΆη¨ηζ θ―οΌ0-ζ­£εΈΈη¨ηοΌ1-εη¨οΌ2-δΈεΎη¨οΌ3-ζ?ιιΆη¨η',
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη₯¨ηΌε·',
  `invoice_nature` int(11) NOT NULL DEFAULT '0' COMMENT 'εη₯¨θ‘ζ§θ΄¨: 0-ζ­£εΈΈθ‘;1-ζζ£θ‘ (ζζ£η₯¨ιι’ζ­£);2-θ’«ζζ£θ‘''(ζζ£η₯¨ιι’θ΄)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌη₯¨ηΆζ 0-ζͺεΌη₯¨οΌ1-εΌη₯¨ζεοΌ2-εΌη₯¨δΈ­',
  `invoice_time` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌη₯¨ζΆι΄',
  `invoice_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη₯¨εΎηε°ε',
  `apply` int(11) NOT NULL DEFAULT '0' COMMENT 'η³θ―·εΌη₯¨οΌ0=ζͺη³θ―·οΌ1=ε·²η³θ―·οΌ',
  `col_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζΆη₯¨ε°ε',
  `col_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζΆη₯¨δΊΊε§ε',
  `col_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζΆη₯¨δΊΊη΅θ―',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'uid',
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’ε--εη₯¨θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_mapping`;
CREATE TABLE `ims_yz_order_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_order_id` int(11) NOT NULL,
  `new_order_id` int(11) NOT NULL,
  `old_openid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_merge_create
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_merge_create`;
CREATE TABLE `ims_yz_order_merge_create` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΈεεε»Ίηθ?’εIDοΌιε·ζΌζ₯',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’εεεΉΆεε»Ίθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_order_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_operation_log`;
CREATE TABLE `ims_yz_order_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `before_operation_status` tinyint(1) DEFAULT '0',
  `after_operation_status` tinyint(1) DEFAULT '0',
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `operation_time` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_package`;
CREATE TABLE `ims_yz_order_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εθ‘¨id',
  `order_goods_id` int(11) NOT NULL COMMENT 'θ?’εεεθ‘¨id',
  `total` int(11) NOT NULL COMMENT 'ζ°ι',
  `order_express_id` int(11) NOT NULL COMMENT 'θ?’εη©ζ΅θ‘¨id',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Oid_OGid` (`order_id`,`order_goods_id`),
  KEY `ids_OEid` (`order_express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’εεθ£Ήθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_order_paid_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_paid_job`;
CREATE TABLE `ims_yz_order_paid_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pay`;
CREATE TABLE `ims_yz_order_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn` varchar(23) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `pay_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_time` int(11) DEFAULT NULL,
  `refund_time` int(11) DEFAULT NULL,
  `order_ids` varchar(500) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uid` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_order_pay_pay_sn_index` (`pay_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pay_order`;
CREATE TABLE `ims_yz_order_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_pay_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_order_pay_id` (`order_pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_pending`;
CREATE TABLE `ims_yz_order_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_model_id` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_plugin`;
CREATE TABLE `ims_yz_order_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εplugin_id',
  `main_plugin_id` int(11) NOT NULL COMMENT 'θ?’εplugin_id',
  `sub_plugin_id` int(11) NOT NULL COMMENT 'θ?’εεεplugin_idοΌζ³¨οΌδΈεplugin_idηεεδΌεεοΌδΈε­ε¨δΈδΈͺθ?’ειζε€δΈͺδΈεplugin_idηεε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_order_plugin_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’εεεζδ»Άθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_order_plugin_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_plugin_bonus`;
CREATE TABLE `ims_yz_order_plugin_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ids` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `undividend` decimal(14,2) NOT NULL DEFAULT '0.00',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(14,2) NOT NULL DEFAULT '0.00',
  `member_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_received_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_received_job`;
CREATE TABLE `ims_yz_order_received_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund`;
CREATE TABLE `ims_yz_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `refund_sn` varchar(255) NOT NULL,
  `refund_type` tinyint(1) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `images` text NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `reply` text,
  `reject_reason` text,
  `refund_way_type` tinyint(3) DEFAULT '0',
  `apply_price` decimal(10,2) DEFAULT '0.00',
  `order_price` decimal(10,2) DEFAULT '0.00',
  `refund_proof_imgs` text,
  `refund_time` int(11) DEFAULT NULL,
  `refund_address` text,
  `remark` text,
  `operate_time` int(11) DEFAULT NULL,
  `send_time` int(11) DEFAULT NULL,
  `return_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT '0',
  `alipay_batch_sn` varchar(255) DEFAULT '',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(1) DEFAULT NULL,
  `receive_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζΆθ΄§ηΆζ 0ζͺζΆθ΄§ 1ε·²ζΆθ΄§',
  `part_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’ει¨ειζ¬Ύ 0ε¦ 1ζ―',
  `freight_price` decimal(10,2) DEFAULT '0.00' COMMENT 'θΏθ΄Ήιι’',
  `other_price` decimal(10,2) DEFAULT '0.00' COMMENT 'εΆδ»θ΄Ήη¨ιι’',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_shop_id` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_refund_change_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_change_log`;
CREATE TABLE `ims_yz_order_refund_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `refund_id` int(11) DEFAULT NULL COMMENT 'ιζ¬Ύθ?°ε½id',
  `old_price` decimal(14,2) DEFAULT '0.00' COMMENT 'ζ§ιι’',
  `new_price` decimal(14,2) DEFAULT '0.00' COMMENT 'ζ°ιι’',
  `change_price` decimal(14,2) DEFAULT '0.00' COMMENT 'ζΉδ»·ιι’',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζδ½εεη§°',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'ε ι€ζΆι΄',
  `change_freight_price` decimal(10,2) DEFAULT '0.00' COMMENT 'δΏ?ζΉθΏθ΄Ήιι’',
  `change_other_price` decimal(10,2) DEFAULT '0.00' COMMENT 'δΏ?ζΉεΆδ»θ΄Ήη¨ιι’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’ε--ιζ¬Ύιι’δΏ?ζΉθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_refund_goods_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_goods_log`;
CREATE TABLE `ims_yz_order_refund_goods_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εID',
  `refund_id` int(11) NOT NULL COMMENT 'ιζ¬ΎID',
  `order_goods_id` int(11) NOT NULL COMMENT 'θ?’εεεID',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT 'εθ΄§ζ°ι',
  `refund_total` int(11) NOT NULL DEFAULT '0' COMMENT 'ιζ¬Ύεεζ°ι',
  `refund_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ιζ¬Ύεειι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `refund_idx` (`refund_id`),
  KEY `order_goods_idx` (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε·²ιζ¬Ύθ?’εεεθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_refund_process_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_refund_process_log`;
CREATE TABLE `ims_yz_order_refund_process_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'θ?’εID',
  `refund_id` int(11) NOT NULL COMMENT 'ιζ¬ΎID',
  `operator` int(11) NOT NULL DEFAULT '0' COMMENT 'ζδ½εη±»ε',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζδ½εID',
  `operate_type` int(11) DEFAULT NULL COMMENT 'ζδ½η±»ε',
  `detail` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―¦ζζθΏ°',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€η¨ε­ζ?΅',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `refund_idx` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε?εεεθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_remark
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_remark`;
CREATE TABLE `ims_yz_order_remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `remark` char(255) NOT NULL,
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_order_request
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_request`;
CREATE TABLE `ims_yz_order_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―·ζ±εζ°',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_sent_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_sent_job`;
CREATE TABLE `ims_yz_order_sent_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('waiting','finished','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_service_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_service_fee`;
CREATE TABLE `ims_yz_order_service_fee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε‘θ΄Ήη ',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ιι’',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’ε--ζε‘θ΄Ήθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_setting`;
CREATE TABLE `ims_yz_order_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_statistics`;
CREATE TABLE `ims_yz_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `total_quantity` int(11) DEFAULT '0' COMMENT 'εεζ»θ?’εζ°',
  `total_amount` int(11) DEFAULT '0' COMMENT 'εεζ»θ?’ειι’',
  `total_pay_quantity` int(11) DEFAULT '0' COMMENT 'εεε·²ζ―δ»θ?’εζ°',
  `total_pay_amount` int(11) DEFAULT '0' COMMENT 'εεε·²ζ―δ»θ?’ειι’',
  `total_complete_quantity` int(11) DEFAULT '0' COMMENT 'εεε·²ε?ζθ?’εζ°',
  `total_complete_amount` int(11) DEFAULT '0' COMMENT 'εεε·²ε?ζθ?’ειι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_order_status
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_order_status`;
CREATE TABLE `ims_yz_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_outside_app_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_app_setting`;
CREATE TABLE `ims_yz_outside_app_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊη¨AppID',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊη¨secret',
  `black_list` text COLLATE utf8mb4_unicode_ci COMMENT 'IPι»εε',
  `white_list` text COLLATE utf8mb4_unicode_ci COMMENT 'IPη½εε',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT 'εΆδ»θ?Ύη½?',
  `sign_required` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ¦η­Ύε 0ιθ¦1δΈιθ¦',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `app_idx` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε―Ήε€εΊη¨θ?Ύη½?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_outside_order_has_many_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_order_has_many_order`;
CREATE TABLE `ims_yz_outside_order_has_many_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `outside_order_id` int(11) NOT NULL COMMENT 'ε€ι¨θ?’εθ?°ε½id',
  `order_id` int(11) DEFAULT NULL COMMENT 'εεθ?’εid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ?’εδΈη¬¬δΈζΉθ?’εε³η³»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_outside_order_trade
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_outside_order_trade`;
CREATE TABLE `ims_yz_outside_order_trade` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'εεθ?’εidη»',
  `outside_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¬¬δΈζΉθ?’εηΌε·',
  `trade_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εεθ?’εηΌε·',
  `total_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’εε?δ»ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η¬¬δΈζΉδΈεε³η³»θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_package_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver`;
CREATE TABLE `ims_yz_package_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_uid` int(11) DEFAULT NULL COMMENT 'ims_users.uid',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺζηΉεη§°',
  `deliver_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺζηΉη΅θ―',
  `province_id` int(11) DEFAULT NULL COMMENT 'η',
  `city_id` int(11) DEFAULT NULL COMMENT 'εΈ',
  `district_id` int(11) DEFAULT NULL COMMENT 'εΊ',
  `street_id` int(11) DEFAULT NULL COMMENT 'θ‘ι',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―¦η»ε°ε',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ¬εΊ¦',
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»εΊ¦',
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ₯δΈζΆι΄',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ₯δΈζΆι΄',
  `aptitute` text COLLATE utf8mb4_unicode_ci COMMENT 'θ΅θ΄¨',
  `id_card_front` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―ζ­£ι’',
  `id_card_side` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―θι’',
  `thumb` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺζηΉεΎη',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦η¦η¨',
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεδΈεδΌεID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_apply`;
CREATE TABLE `ims_yz_package_deliver_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΄¦ε·',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε―η ',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺζηΉεη§°',
  `province_id` int(11) DEFAULT NULL COMMENT 'η',
  `city_id` int(11) DEFAULT NULL COMMENT 'εΈ',
  `district_id` int(11) DEFAULT NULL COMMENT 'εΊ',
  `street_id` int(11) DEFAULT NULL COMMENT 'θ‘ι',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―¦η»ε°ε',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ¬εΊ¦',
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»εΊ¦',
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ₯δΈζΆι΄',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ₯δΈζΆι΄',
  `aptitute` text COLLATE utf8mb4_unicode_ci COMMENT 'θ΅θ΄¨',
  `id_card_front` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―ζ­£ι’',
  `id_card_side` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―θι’',
  `thumb` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺζηΉεΎη',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `investor_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεδΈεδΌεID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_band_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_band_member`;
CREATE TABLE `ims_yz_package_deliver_band_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `deliver_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θͺζηΉID',
  `band_type` tinyint(4) DEFAULT NULL COMMENT 'η»ε?ζΉεΌ:1-ι¦ζ¬‘θΏε₯η»ε?οΌ2-ιζ©εΆδ»θͺζηΉοΌ3-δΈεζ΄ζΉοΌ4-δ»δΊΊεδΊ«(δΌεηΊ§ζι«)',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊεε³θθͺζηΉ--δΌεη»ε?θͺζηΉθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_bonus`;
CREATE TABLE `ims_yz_package_deliver_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pd_id` int(11) DEFAULT NULL COMMENT 'package_deliver.id',
  `order_id` int(11) DEFAULT NULL COMMENT 'yz_order.id',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΌε·',
  `original_amount` decimal(14,2) DEFAULT '0.00' COMMENT 'ζζζ»ιι’',
  `dividend_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'ζζζ―η',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'ε?ιζζιι’',
  `status` int(11) DEFAULT NULL COMMENT 'ζζηΆζ',
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε»ΊζΆι΄η¨δΊεη»',
  `amount_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεζη¬η«θ?Ύη½?,ζζη?ζ³θ?°ε½',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_clerk`;
CREATE TABLE `ims_yz_package_deliver_clerk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pd_id` int(11) DEFAULT NULL COMMENT 'package_deliver.id',
  `uid` int(11) DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups`;
CREATE TABLE `ims_yz_package_deliver_community_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι’θ²',
  `share_img` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«εΎη',
  `start_time` int(11) DEFAULT NULL COMMENT 'εΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'η»ζζΆι΄',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'ζθΏ°θ―΄ζ',
  `is_all_area` int(11) DEFAULT '1' COMMENT 'ζ―ε¦ε¨ι¨εΊεθͺζηΉ',
  `condition_status` int(11) DEFAULT NULL COMMENT 'ζε’ζ‘δ»Ά 0ζ  1ζδ½θ?’εζ° 2ζδ½δΊΊζ° 3ζδ½ιι’',
  `min_order_count` int(11) DEFAULT NULL COMMENT '1ζδ½θ?’εζ°',
  `min_person_count` int(11) DEFAULT NULL COMMENT '2ζδ½δΊΊζ°',
  `min_total_count` int(11) DEFAULT NULL COMMENT '3ζδ½ιι’',
  `status` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_area
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_area`;
CREATE TABLE `ims_yz_package_deliver_community_groups_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `community_groups_id` int(11) NOT NULL COMMENT 'ζ η­Ύid',
  `area_id` int(11) NOT NULL COMMENT 'ε°εΊID',
  `level` tinyint(1) NOT NULL COMMENT 'ε°εΊη­ηΊ§',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_cart`;
CREATE TABLE `ims_yz_package_deliver_community_groups_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `uniacid` int(11) NOT NULL COMMENT 'ζε±ε¬δΌε·id',
  `group_id` int(11) DEFAULT NULL COMMENT 'ε’θ΄­id',
  `deliver_id` int(11) NOT NULL COMMENT 'θͺζηΉid',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `total` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζ°ι',
  `option_id` int(11) NOT NULL COMMENT 'εεθ§ζ Όid',
  `created_at` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζΆι΄',
  `updated_at` int(11) NOT NULL COMMENT 'ζεδΈζ¬‘δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'η§»ι€θ΄­η©θ½¦ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_groups_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods_statistic`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `deliver_id` int(11) DEFAULT NULL COMMENT 'θͺζηΉid',
  `group_id` int(11) DEFAULT '0' COMMENT 'ζ΄»ε¨id',
  `order_id` int(11) DEFAULT '0' COMMENT 'θ?’εid',
  `order_goods_id` int(11) DEFAULT '0' COMMENT 'θ?’εεεid',
  `goods_id` int(11) DEFAULT '0' COMMENT 'εεid',
  `option_id` int(11) DEFAULT '0' COMMENT 'εεθ§ζ Όid',
  `total` int(11) DEFAULT '0' COMMENT 'θ΄­δΉ°ζ°ι',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'εεζ»ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `order_goods_idx` (`order_goods_id`),
  KEY `goods_idx` (`goods_id`),
  KEY `option_idx` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_goods_with_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_goods_with_deliver`;
CREATE TABLE `ims_yz_package_deliver_community_groups_goods_with_deliver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_order`;
CREATE TABLE `ims_yz_package_deliver_community_groups_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `community_groups_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_poster`;
CREATE TABLE `ims_yz_package_deliver_community_groups_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1ζ?ιδΊη»΄η   2ε°η¨εΊη   3ε¬δΌε·η ',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_community_groups_street
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_community_groups_street`;
CREATE TABLE `ims_yz_package_deliver_community_groups_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `community_groups_id` int(11) NOT NULL COMMENT 'ζ η­Ύid',
  `area_id` int(11) NOT NULL COMMENT 'ε°εΊID',
  `level` tinyint(1) NOT NULL COMMENT 'ε°εΊη­ηΊ§',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_goods`;
CREATE TABLE `ims_yz_package_deliver_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `has_independent` int(11) DEFAULT NULL COMMENT 'ζ―ε¦ε―η¨η¬η«ε₯ε±θ§ε',
  `ratio` decimal(10,2) DEFAULT NULL COMMENT 'ζ―δΎ',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'εΊε?ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `assign` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εεζε?θͺζηΉοΌ0ε¨ι¨1ζε?',
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺζηΉ--εεζδ»Ά';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_goods_assign
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_goods_assign`;
CREATE TABLE `ims_yz_package_deliver_goods_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT 'yz_goods.id',
  `package_deliver_id` int(11) DEFAULT NULL COMMENT 'θͺζηΉid',
  `stock_sum` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊε­ζ°ι',
  `used_sum` int(11) DEFAULT '0' COMMENT 'δ»₯εεεεΊε­ζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_idx` (`goods_id`),
  KEY `package_deliver_idx` (`package_deliver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺζηΉ--εεζε?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_package_deliver_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_order`;
CREATE TABLE `ims_yz_package_deliver_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL,
  `deliver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `click_status` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε°εΊ 0-ε¦ 1-ζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_package_deliver_polymorphism
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_package_deliver_polymorphism`;
CREATE TABLE `ims_yz_package_deliver_polymorphism` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `deliver_id` int(11) DEFAULT NULL COMMENT 'θͺζηΉID',
  `polymorphism` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺζηΉη±»ε',
  `polymorphism_id` int(11) DEFAULT NULL COMMENT 'η±»εID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `deliver_id` (`deliver_id`),
  KEY `polymorphism_id` (`polymorphism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺζηΉ-- ε€ζη±»εε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_page_share_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_page_share_record`;
CREATE TABLE `ims_yz_page_share_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?id',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) DEFAULT NULL,
  `share_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_parking_print_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_parking_print_template`;
CREATE TABLE `ims_yz_parking_print_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL COMMENT 'ι¨εΊid',
  `owner_id` int(11) DEFAULT NULL COMMENT 'ι¨εΊid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¨‘ζΏεη§°',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ:0ε³ι­ 1εΌε―',
  `print_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€΄ι¨',
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζθΏ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζε°ζΊ--θ½¦εΊζε°ζ¨‘ζΏ';

-- ----------------------------
-- Table structure for ims_yz_partner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_partner`;
CREATE TABLE `ims_yz_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `partner_reward_total` int(11) DEFAULT NULL,
  `same_level_total` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_partner_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_partner_reward_log`;
CREATE TABLE `ims_yz_partner_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `amount` decimal(10,2) DEFAULT '0.00',
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `receive_at` int(11) DEFAULT NULL,
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settle_days` int(11) DEFAULT NULL,
  `statement_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_access_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_access_log`;
CREATE TABLE `ims_yz_pay_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_log`;
CREATE TABLE `ims_yz_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price` decimal(14,2) NOT NULL,
  `operation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(135) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(13) NOT NULL DEFAULT '0',
  `updated_at` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_order`;
CREATE TABLE `ims_yz_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(14,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_order_no` (`out_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_refund_order`;
CREATE TABLE `ims_yz_pay_refund_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `out_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` decimal(14,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_request_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_request_data`;
CREATE TABLE `ims_yz_pay_request_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_response_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_response_data`;
CREATE TABLE `ims_yz_pay_response_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type`;
CREATE TABLE `ims_yz_pay_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `plugin_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `setting_key` varchar(255) DEFAULT NULL,
  `need_password` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_pay_type_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type_group`;
CREATE TABLE `ims_yz_pay_type_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_pay_type_manage
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_type_manage`;
CREATE TABLE `ims_yz_pay_type_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `pay_type_id` int(11) NOT NULL COMMENT 'ζ―δ»η±»εid',
  `plugin_id` int(11) DEFAULT NULL COMMENT 'ζδ»ΆεΊε',
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ―δ»ε«ε',
  `enable` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacidx` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ―δ»ε«ε';

-- ----------------------------
-- Table structure for ims_yz_pay_withdraw_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_pay_withdraw_order`;
CREATE TABLE `ims_yz_pay_withdraw_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `int_order_no` varchar(32) DEFAULT NULL,
  `out_order_no` varchar(32) NOT NULL DEFAULT '',
  `trade_no` varchar(255) DEFAULT NULL,
  `price` decimal(14,2) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `created_at` int(13) NOT NULL DEFAULT '0',
  `updated_at` int(13) NOT NULL DEFAULT '0',
  `deleted_at` int(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ζ―δ»ζη°ε';

-- ----------------------------
-- Table structure for ims_yz_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_permission`;
CREATE TABLE `ims_yz_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `item_id` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78789 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_attribution
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_attribution`;
CREATE TABLE `ims_yz_phone_attribution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `province` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΈ',
  `sp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θΏθ₯ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_goods`;
CREATE TABLE `ims_yz_phone_bill_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `option_id` int(11) DEFAULT NULL COMMENT 'θ§ζ Όid',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0ε³ι­ 1εΌε―',
  `type` int(11) DEFAULT NULL COMMENT '1=50εοΌ2=100εοΌ3=200ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_order`;
CREATE TABLE `ims_yz_phone_bill_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εid',
  `order_goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `type` int(11) DEFAULT NULL COMMENT '1=50,2=100,3=200',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `status` int(11) DEFAULT NULL COMMENT '1=ζͺεεΌοΌ2=εεΌδΈ­οΌ3=εεΌζε, 4=εεΌε€±θ΄₯, 5 = ιζ¬Ύ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pre_call_back
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pre_call_back`;
CREATE TABLE `ims_yz_phone_bill_pre_call_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_pre_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΊ€η»η¬¬δΈζΉηid',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉθ?’εε·',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'εεΌι’εΊ¦',
  `actualAmount` decimal(14,2) DEFAULT NULL COMMENT 'ε?ιζ£ι€ιι’',
  `createdAt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΈεζΆι΄',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SUCCESSζε FAILε€±θ΄₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'εθ°εε ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pre_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pre_order`;
CREATE TABLE `ims_yz_phone_bill_pre_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εid',
  `order_pre_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΊ€η»η¬¬δΈζΉηid',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'εεΌι’εΊ¦',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `return_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεcode',
  `return_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεmsg',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεcode',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ₯ε£θΏεζ°ζ?ε?δ½',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_phone_bill_pre_order_order_pre_id_index` (`order_pre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_call_back
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_call_back`;
CREATE TABLE `ims_yz_phone_bill_pro_call_back` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδΊ€η»η¬¬δΈζΉηid',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉθ?’εε·',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'εεΌι’εΊ¦',
  `actualAmount` decimal(14,2) DEFAULT NULL COMMENT 'ε?ιζ£ι€ιι’',
  `createdAt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΈεζΆι΄',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SUCCESSζε FAILε€±θ΄₯',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'εθ°εε ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `all_data` text COLLATE utf8mb4_unicode_ci COMMENT 'εθ°ζζεζ°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--εεΌεθ°θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_charge_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_charge_order`;
CREATE TABLE `ims_yz_phone_bill_pro_charge_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εid',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εηΌε·οΌδΉζδΊ€η»η¬¬δΈζΉ',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'εεΌι’εΊ¦',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζ’ε 1εΏ«ε',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `return_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεcode',
  `return_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεmsg',
  `result_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θΏεcode',
  `data` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ₯ε£θΏεζ°ζ?ε?δ½',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌιι',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--εεΌθ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_goods`;
CREATE TABLE `ims_yz_phone_bill_pro_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'εΉ³ε°ID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `goods_option_id` int(11) DEFAULT NULL COMMENT 'θ§ζ Όid',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺε?δΉζζ‘',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζ’ε 1εΏ«ε',
  `type` tinyint(4) DEFAULT NULL COMMENT '1=50εοΌ2=100εοΌ3=200ε',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ε³ι­ 1εΌε―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `bingbird_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε³θεΏεΊιΈεεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--εεδΏ‘ζ―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_goods_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_goods_set`;
CREATE TABLE `ims_yz_phone_bill_pro_goods_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'εΉ³ε°ID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε―η¨εεΌ',
  `banner` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'banner',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--εεθ?Ύη½?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_order`;
CREATE TABLE `ims_yz_phone_bill_pro_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εid',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `goods_option_id` int(11) DEFAULT NULL COMMENT 'θ§ζ Όid',
  `type` int(11) DEFAULT NULL COMMENT '1=50,2=100,3=200',
  `charge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ζ’ε 1εΏ«ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `status` int(11) DEFAULT NULL COMMENT '1=ζͺεεΌοΌ2=εεΌδΈ­οΌ3=εεΌζε, 4=εεΌε€±θ΄₯, 5 = ιζ¬Ύ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--θ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_phone_bill_pro_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_phone_bill_pro_set`;
CREATE TABLE `ims_yz_phone_bill_pro_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζδ»ΆεΌε―:0ε³ι­,1εΌε―',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'appKey',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'appSecret',
  `is_default_address` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ι»θ?€δΈεε°ε:0ε³ι­,1εΌε―',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι»θ?€δΈεη¨ζ·ε§ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι»θ?€δΈεη¨ζ·ζζΊε·',
  `province_id` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΈεηID',
  `city_id` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΈεεΈID',
  `district_id` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΈεεΊID',
  `street_id` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΈεθ‘ιID',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι»θ?€δΈεθ―¦η»ε°ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `notify_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εθ°ε°ε',
  `channel_list` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιιεθ‘¨',
  `is_strategy` int(11) NOT NULL COMMENT 'ιιη­η₯',
  `priority` int(11) NOT NULL COMMENT '36ι²ΈιιδΌεηΊ§',
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΌιι',
  `is_no_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εεΌε€±θ΄₯ζ―ε¦δΈιζ¬Ύ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ―θ΄ΉεεΌPro--θ?Ύη½?δΏ‘ζ―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_picture_album
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album`;
CREATE TABLE `ims_yz_picture_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_peo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_background` tinyint(4) DEFAULT NULL,
  `background_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `is_open` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_picture_album_image
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album_image`;
CREATE TABLE `ims_yz_picture_album_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `picture_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `delete_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_picture_album_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_picture_album_thumb`;
CREATE TABLE `ims_yz_picture_album_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article`;
CREATE TABLE `ims_yz_plugin_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `desc` text,
  `thumb` text,
  `content` longtext NOT NULL,
  `virtual_created_at` int(11) DEFAULT NULL,
  `author` varchar(20) NOT NULL DEFAULT '',
  `virtual_read_num` int(11) DEFAULT NULL,
  `read_num` int(11) NOT NULL DEFAULT '0',
  `virtual_like_num` int(11) DEFAULT NULL,
  `like_num` int(11) NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `per_person_per_day` int(11) DEFAULT NULL,
  `total_per_person` int(11) DEFAULT NULL,
  `point` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `bonus_total` decimal(10,2) DEFAULT '0.00',
  `bonus_total_now` int(11) DEFAULT NULL,
  `no_copy_url` tinyint(1) DEFAULT NULL,
  `no_share` tinyint(1) DEFAULT NULL,
  `no_share_to_friend` tinyint(1) DEFAULT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `report_enabled` tinyint(1) DEFAULT NULL,
  `advs_type` tinyint(1) DEFAULT NULL,
  `advs_title` varchar(255) DEFAULT NULL,
  `advs_title_footer` varchar(255) DEFAULT NULL,
  `advs_link` varchar(255) DEFAULT NULL,
  `advs` text,
  `state` tinyint(1) DEFAULT NULL,
  `state_wechat` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `advs_img` varchar(255) DEFAULT NULL,
  `reward_mode` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT '0' COMMENT 'ζη« η±»ε',
  `display_order` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `audio_link` varchar(255) DEFAULT NULL COMMENT 'ι³ι’ιΎζ₯',
  `show_levels` text COMMENT 'δΌεη­ηΊ§ζ΅θ§ζι',
  `small_link` varchar(255) DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  `min_app_advs_link` varchar(255) DEFAULT NULL COMMENT 'ε°η¨εΊεΉΏειΎζ₯',
  `article_logo` varchar(255) DEFAULT '' COMMENT 'ζεζεΏζδ»Ά--ζη« logo',
  `manager_id` int(11) NOT NULL DEFAULT '0' COMMENT 'η?‘ηεID',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_state` (`uniacid`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_category`;
CREATE TABLE `ims_yz_plugin_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `member_level_limit` int(11) DEFAULT NULL,
  `commission_level_limit` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `member_level_id_limit` int(11) DEFAULT NULL,
  `cate_desc` longtext COMMENT 'ζθΏ°',
  `cate_img` varchar(255) DEFAULT NULL COMMENT 'εΎζ ',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_comment`;
CREATE TABLE `ims_yz_plugin_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―θ?Ίζ΅η§°',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―θ?Ίε€΄ε',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε?Ή',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT 'εΎη',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―θ?ΊID',
  `reply_id` int(11) DEFAULT '0' COMMENT 'εη­εͺδΈͺδΌεID',
  `reply_comment_id` int(11) DEFAULT NULL COMMENT 'εη­εͺδΈͺθ―θ?Ί',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη­εͺδΈͺζ΅η§°',
  `manager_id` int(11) DEFAULT NULL COMMENT 'η?‘ηεID',
  `type` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ε?‘ζ ΈιθΏ',
  PRIMARY KEY (`id`),
  KEY `idx_articleid` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζη« θ―θ?Ίθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_plugin_article_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_log`;
CREATE TABLE `ims_yz_plugin_article_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `read_num` int(11) DEFAULT NULL,
  `like_num` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `liked` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_articleid` (`uniacid`,`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1382 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_manager
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_manager`;
CREATE TABLE `ims_yz_plugin_article_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `uid` int(11) NOT NULL COMMENT 'η?‘ηεid',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΅η§°',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η»ιθ΄¦ε·',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε―η ',
  `mobile` int(11) DEFAULT NULL COMMENT 'η΅θ―',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζη« θ₯ιη?‘ηεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_plugin_article_report
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_report`;
CREATE TABLE `ims_yz_plugin_article_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_article_share
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_article_share`;
CREATE TABLE `ims_yz_plugin_article_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `share_uid` int(11) DEFAULT NULL,
  `click_uid` int(11) DEFAULT NULL,
  `click_time` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `credit` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_balance_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_balance_order`;
CREATE TABLE `ims_yz_plugin_balance_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `balance_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_cashier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_cashier_order`;
CREATE TABLE `ims_yz_plugin_cashier_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ε·²ζη°',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `pay_type_id` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_mode` int(11) DEFAULT '0',
  `settle_time` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `split_time` int(11) DEFAULT NULL COMMENT 'εθ΄¦ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_goods_assistant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_goods_assistant`;
CREATE TABLE `ims_yz_plugin_goods_assistant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `itemid` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_cashier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_cashier_order`;
CREATE TABLE `ims_yz_plugin_hotel_cashier_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `has_withdraw` tinyint(4) NOT NULL,
  `has_settlement` tinyint(4) NOT NULL,
  `settlement_days` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `fee_percentage` decimal(10,2) NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_type_id` tinyint(4) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_order`;
CREATE TABLE `ims_yz_plugin_hotel_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(4) NOT NULL DEFAULT '0',
  `has_settlement` tinyint(4) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `verification_clerk_id` int(11) NOT NULL DEFAULT '0',
  `pay_type_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `enter_at` int(11) DEFAULT NULL,
  `leave_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_hotel_self_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_hotel_self_delivery`;
CREATE TABLE `ims_yz_plugin_hotel_self_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `hotel_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hotel_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_jd_supply_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_jd_supply_order`;
CREATE TABLE `ims_yz_plugin_jd_supply_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εid',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’εε·',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεID',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `status` tinyint(4) DEFAULT '0' COMMENT 'θ?’εηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags`;
CREATE TABLE `ims_yz_plugin_member_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `update_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '1ζε¨ 2θͺε¨',
  `group_condition_type` int(11) DEFAULT '0' COMMENT '1δΈ2ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_condition
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_condition`;
CREATE TABLE `ims_yz_plugin_member_tags_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_type` int(11) DEFAULT '0' COMMENT '1δΈ2ζ',
  `conditions` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_exec_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_exec_history`;
CREATE TABLE `ims_yz_plugin_member_tags_exec_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `member_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_member_tags_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_member_tags_group`;
CREATE TABLE `ims_yz_plugin_member_tags_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_pack_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_pack_member_cart`;
CREATE TABLE `ims_yz_plugin_pack_member_cart` (
  `created_at` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'η§»ι€θ΄­η©θ½¦ζΆι΄',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `option_id` int(11) NOT NULL COMMENT 'εεθ§ζ Όid',
  `activity_id` int(11) NOT NULL COMMENT 'ζ΄»ε¨ID',
  `total` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζ°ι',
  `uniacid` int(11) NOT NULL COMMENT 'ζε±ε¬δΌε·id',
  `updated_at` int(11) NOT NULL COMMENT 'ζεδΈζ¬‘δΏ?ζΉζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_member_cart`;
CREATE TABLE `ims_yz_plugin_store_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `uniacid` int(11) NOT NULL COMMENT 'ζε±ε¬δΌε·id',
  `store_id` int(11) NOT NULL COMMENT 'ι¨εΊid',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `total` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζ°ι',
  `option_id` int(11) NOT NULL COMMENT 'εεθ§ζ Όid',
  `created_at` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ζΆι΄',
  `updated_at` int(11) NOT NULL COMMENT 'ζεδΈζ¬‘δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'η§»ι€θ΄­η©θ½¦ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_order`;
CREATE TABLE `ims_yz_plugin_store_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `verification_clerk_id` int(11) NOT NULL DEFAULT '0',
  `pay_type_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―δ»ζΉεΌid',
  `withdraw_mode` int(11) DEFAULT '0',
  `settle_time` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `split_time` int(11) DEFAULT NULL COMMENT 'εθ΄¦ζΆι΄',
  `hidden_type` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθ 0ζ­£εΈΈζΎη€Ί 1ιθ(δΈι¨ε?θ£)',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_self_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_self_delivery`;
CREATE TABLE `ims_yz_plugin_store_self_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_plugin_store_store_delivery
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_plugin_store_store_delivery`;
CREATE TABLE `ims_yz_plugin_store_store_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `member_realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_id` int(11) DEFAULT '0',
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity`;
CREATE TABLE `ims_yz_point_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `point` decimal(12,2) DEFAULT '0.00' COMMENT 'θ΅ ιη§―ε',
  `used` decimal(12,2) DEFAULT '0.00' COMMENT 'ε·²ι’εη§―ε',
  `stock` decimal(12,2) DEFAULT '0.00' COMMENT 'ε©δ½η§―ε',
  `average` decimal(12,2) DEFAULT '0.00' COMMENT 'η§―ε/ζ―δΊΊ',
  `total` int(11) DEFAULT '0' COMMENT 'θ΅ ιδΈͺζ°',
  `receive` int(11) DEFAULT '0' COMMENT 'ε·²ι’εδΈͺζ°',
  `remain` int(11) DEFAULT '0' COMMENT 'ε©δ½δΈͺζ°',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:θΏθ‘δΈ­οΌ1:ι’εε?οΌ2:ε·²θΏζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `validity_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity_award_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity_award_log`;
CREATE TABLE `ims_yz_point_activity_award_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `give_member_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `money` decimal(12,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_activity_receive_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_activity_receive_log`;
CREATE TABLE `ims_yz_point_activity_receive_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨ID',
  `member_id` int(11) DEFAULT NULL,
  `point` decimal(12,2) DEFAULT '0.00' COMMENT 'ι’εη§―εεΌ',
  `used` decimal(12,2) DEFAULT '0.00',
  `stock` decimal(12,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0:ε·²ι’εοΌ1:δ½Ώη¨δΈ­οΌ2:ε·²δ½Ώη¨οΌ3ε·²θΏζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `validity_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_log`;
CREATE TABLE `ims_yz_point_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point_income_type` tinyint(2) NOT NULL DEFAULT '0',
  `point_mode` tinyint(5) NOT NULL DEFAULT '0',
  `before_point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `after_point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(255) NOT NULL DEFAULT '0',
  `thirdStatus` varchar(255) DEFAULT '1',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `relation_id` int(11) DEFAULT NULL,
  `order_goods_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εεεid,ιζ¬ΎθΏθΏη§―εδ½Ώη¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_point_love_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_love_set`;
CREATE TABLE `ims_yz_point_love_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ζε±ε¬δΌε·',
  `member_id` int(11) NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_love` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transfer_integral` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_goods`;
CREATE TABLE `ims_yz_point_mall_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `point` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'ε¨ζ΅ζιη§―εζ°',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_point_mall_goods_goods_id_uniacid_index` (`goods_id`,`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η§―εεε--εεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_point_mall_goods_options
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_goods_options`;
CREATE TABLE `ims_yz_point_mall_goods_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `goods_option_id` int(11) NOT NULL COMMENT 'εεθ§ζ ΌID',
  `goods_option_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εεθ§ζ Όζ ι’',
  `goods_point` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'ε¨ζ΅ζιη§―εζ°',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η§―εεε--εεθ§ζ Όθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_point_mall_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_mall_set`;
CREATE TABLE `ims_yz_point_mall_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζδ»Άζ―ε¦εΌε―οΌ0-ε¦οΌ1-ζ―',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `change_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εεθ§ζ ΌδΏ‘ζ―εε¨οΌη§―εεεηΈεΊεε¨θ§ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η§―εεε--θ?Ύη½?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_point_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_queue`;
CREATE TABLE `ims_yz_point_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT 'δΌεID',
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `point_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'θ΅ ιη§―εζ»ζ°',
  `finish_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ε?ζζ°ι',
  `surplus_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ε©δ½ζ°ι',
  `once_unit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζ―ζ¬‘θ΅ ιζ°ι',
  `last_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ζεδΈζ¬‘θ΅ ιζ°ι',
  `status` tinyint(1) DEFAULT '0' COMMENT '1ε·²ε?ζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_queue_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_queue_log`;
CREATE TABLE `ims_yz_point_queue_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT 'δΌεID',
  `queue_id` int(11) NOT NULL COMMENT 'η§―ειεID',
  `amount` decimal(14,2) NOT NULL COMMENT 'θ΅ ιζ°ι',
  `point_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'θ΅ ιη§―εζ»ζ°',
  `finish_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ε?ζζ°ι',
  `surplus_point` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ε©δ½ζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_recharge`;
CREATE TABLE `ims_yz_point_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `money` decimal(14,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_point_transfer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_point_transfer`;
CREATE TABLE `ims_yz_point_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?',
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `transferor` int(11) DEFAULT NULL COMMENT 'θ½¬θ?©θ',
  `recipient` int(11) DEFAULT NULL COMMENT 'θ’«θ½¬θ?©θ',
  `value` decimal(14,2) DEFAULT NULL COMMENT 'θ½¬θ?©εΌ',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `status` tinyint(1) DEFAULT NULL COMMENT '-1ε€±θ΄₯οΌ1ζε',
  `updated_at` int(11) NOT NULL,
  `order_sn` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poundage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_post_by_wechat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_post_by_wechat`;
CREATE TABLE `ims_yz_post_by_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΅·ζ₯ε?ζ΄θ·―εΎ',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘θΏεmediaId',
  `compare_at` int(11) NOT NULL COMMENT 'ζ―θΎζ΄ζ°ζΆι΄',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_postage_included_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_postage_included_category`;
CREATE TABLE `ims_yz_postage_included_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `sort` int(11) NOT NULL COMMENT 'ζεΊ',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εη±»ε',
  `is_display` tinyint(4) NOT NULL COMMENT 'ζ―ε¦ε±η€Ί',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ει?εη±»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_postage_included_category_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_postage_included_category_goods`;
CREATE TABLE `ims_yz_postage_included_category_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `postage_included_category_id` int(11) NOT NULL COMMENT 'ει?εη±»ID',
  `goods_id` int(11) NOT NULL COMMENT 'εεID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postage_included_category_id` (`postage_included_category_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ει?εη±»εεε³η³»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster`;
CREATE TABLE `ims_yz_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_start` int(10) unsigned DEFAULT '0',
  `time_end` int(10) unsigned DEFAULT '0',
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `style_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `response_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_open` tinyint(1) DEFAULT '0',
  `auto_sub` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `center_show` tinyint(1) DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `short_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `app_share_show` tinyint(1) DEFAULT NULL,
  `is_ago` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εη«―ηζζ΅·ζ₯ 0εη«―ηζ 1εη«―ηζ',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_award
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_award`;
CREATE TABLE `ims_yz_poster_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `subscriber_memberid` int(10) unsigned NOT NULL,
  `recommender_memberid` int(10) unsigned NOT NULL,
  `recommender_credit` int(10) unsigned DEFAULT '0',
  `recommender_bonus` int(10) unsigned DEFAULT '0',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0',
  `subscriber_credit` int(10) unsigned DEFAULT '0',
  `subscriber_bonus` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `poster_id` (`poster_id`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_qrcode`;
CREATE TABLE `ims_yz_poster_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `qrcode_id` int(10) unsigned NOT NULL,
  `memberid` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_qrcodeid` (`qrcode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_record`;
CREATE TABLE `ims_yz_poster_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `poster_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_scan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_scan`;
CREATE TABLE `ims_yz_poster_scan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `poster_id` int(10) unsigned NOT NULL,
  `subscriber_memberid` int(10) unsigned NOT NULL,
  `recommender_memberid` int(10) unsigned NOT NULL,
  `event_type` tinyint(1) NOT NULL,
  `sign_up_this_time` tinyint(1) NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  `is_register` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posterid` (`poster_id`),
  KEY `idx_subscriber_memberid` (`subscriber_memberid`),
  KEY `idx_recommender_memberid` (`recommender_memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_poster_supplement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_poster_supplement`;
CREATE TABLE `ims_yz_poster_supplement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster_id` int(10) unsigned NOT NULL,
  `not_start_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `finish_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wait_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `not_open_reminder` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `not_open_reminder_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_credit` int(10) unsigned DEFAULT '0',
  `recommender_bonus` decimal(14,2) unsigned DEFAULT '0.00',
  `recommender_coupon_id` int(10) unsigned DEFAULT '0',
  `recommender_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_coupon_num` int(10) unsigned DEFAULT '0',
  `subscriber_credit` int(10) unsigned DEFAULT '0',
  `subscriber_bonus` decimal(14,2) unsigned DEFAULT '0.00',
  `subscriber_coupon_id` int(10) unsigned DEFAULT '0',
  `subscriber_coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subscriber_coupon_num` int(10) unsigned DEFAULT '0',
  `bonus_method` tinyint(1) DEFAULT '1',
  `recommender_award_notice` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subscriber_award_notice` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `recommender_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriber_award_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_poster_id` (`poster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_print_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_print_setting`;
CREATE TABLE `ims_yz_print_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `printer_id` int(11) NOT NULL DEFAULT '0',
  `print_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '1',
  `owner_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `print_order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1,2' COMMENT 'ζ·»ε ζε°θ?’εη±»ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_print_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_print_template`;
CREATE TABLE `ims_yz_print_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `print_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `owner` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε°εε?ΉζΎε€§δΈε',
  `print_style_enlarge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε°εζ ΌεΌζΎε€§δΈε',
  `line_feed` int(11) NOT NULL DEFAULT '0' COMMENT 'ζε°ζ’θ‘',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_printed_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_printed_log`;
CREATE TABLE `ims_yz_printed_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `print_id` int(11) NOT NULL DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `result` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_printer`;
CREATE TABLE `ims_yz_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ukey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `printer_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `times` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '1',
  `owner_id` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_privilege_merlevel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_privilege_merlevel`;
CREATE TABLE `ims_yz_privilege_merlevel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΉζid',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεη­ηΊ§id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privilege_idx` (`privilege_id`),
  KEY `level_idx` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_process
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_process`;
CREATE TABLE `ims_yz_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flow_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `state` enum('processing','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_promotion_assistant
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_promotion_assistant`;
CREATE TABLE `ims_yz_promotion_assistant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `content_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε?ΉιΎζ₯',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θη³»ζΉεΌοΌε§ε',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θη³»ζΉεΌοΌζζΊε·',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'θ·³θ½¬ιΎζ₯η±»ε 1.εει¦ι‘΅ 2.εεεη±» 3.εε',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'type=3ηζΆεζδΌζοΌεεid',
  `share_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εδΊ«ζ ι’',
  `share_desc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εδΊ«ζθΏ°',
  `share_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εδΊ«εΎη',
  `browse_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΉε»ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_protocol
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_protocol`;
CREATE TABLE `ims_yz_protocol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0ε³ι­1εΌε―',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT 'εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ι’',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qq_config
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qq_config`;
CREATE TABLE `ims_yz_qq_config` (
  `config_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `app_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qrcode`;
CREATE TABLE `ims_yz_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `extra` int(11) DEFAULT '0',
  `qrcid` int(11) DEFAULT '0',
  `scene_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `model` int(11) DEFAULT '0',
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `expire` int(11) DEFAULT '0',
  `subnum` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_qrcode_stat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_qrcode_stat`;
CREATE TABLE `ims_yz_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `acid` int(11) DEFAULT '0',
  `qid` int(11) DEFAULT '0',
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` int(11) DEFAULT '0',
  `qrcid` int(11) DEFAULT '0',
  `scene_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire`;
CREATE TABLE `ims_yz_questionnaire` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ§ι’εεid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ι’',
  `number` int(11) DEFAULT NULL COMMENT 'ζ―ε€©ε‘«εζ¬‘ζ°',
  `total` int(11) DEFAULT NULL COMMENT 'ε‘«εζ»ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL COMMENT 'η­ι’η»ζζΆι΄',
  `start_time` int(11) DEFAULT NULL COMMENT 'η­ι’εΌε§ζΆι΄',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_choice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_choice`;
CREATE TABLE `ims_yz_questionnaire_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT 'ι?ε·id',
  `type` int(11) DEFAULT NULL COMMENT 'ει1οΌε€ι2',
  `sort` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `required` int(11) DEFAULT NULL COMMENT '0ιεΏε‘«οΌ1εΏε‘«',
  `choice_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `answer` text COLLATE utf8mb4_unicode_ci COMMENT 'η­ζ‘ιε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_programme
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_programme`;
CREATE TABLE `ims_yz_questionnaire_programme` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT 'ι?ε·id',
  `min_grade` int(11) DEFAULT NULL COMMENT 'minεζ°',
  `max_grade` int(11) DEFAULT NULL COMMENT 'maxεζ°',
  `required` int(11) DEFAULT NULL COMMENT '0ιεΏε‘«οΌ1εΏε‘«',
  `programme` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ζ¨θζΉζ‘',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_programme_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_programme_reward`;
CREATE TABLE `ims_yz_questionnaire_programme_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT 'ι?ε·id',
  `min_grade` int(11) DEFAULT NULL COMMENT 'minεζ°',
  `max_grade` int(11) DEFAULT NULL COMMENT 'maxεζ°',
  `reward` int(11) DEFAULT NULL COMMENT 'ε₯ε±η§―ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_questionnaire_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_questionnaire_record`;
CREATE TABLE `ims_yz_questionnaire_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `questionnaire_id` int(11) DEFAULT NULL COMMENT 'ι?ε·id',
  `score` int(11) DEFAULT NULL COMMENT 'εΎε',
  `integral` int(11) DEFAULT NULL COMMENT 'η§―ε',
  `answers` longtext COLLATE utf8mb4_unicode_ci COMMENT 'η­ζ‘ιε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `problem` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ι?ι’ιε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ranking_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ranking_log`;
CREATE TABLE `ims_yz_ranking_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·id',
  `setting_log` text COLLATE utf8mb4_unicode_ci COMMENT 'θ?Ύη½?ζ₯εΏ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_real_name_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_real_name_auth`;
CREATE TABLE `ims_yz_real_name_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε­',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `auth_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?€θ―ζζΊε·',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―',
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΆθ‘ε‘',
  `flow_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?€θ―ζ΅η¨id',
  `account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?€θ―id',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT 'θ?€θ―ζΉεΌ',
  `auth_status` tinyint(4) DEFAULT '0' COMMENT 'θ?€θ―ηΆζ',
  `finish_time` int(11) DEFAULT NULL COMMENT 'θ?€θ―ε?ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_real_name_auth_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_real_name_auth_set`;
CREATE TABLE `ims_yz_real_name_auth_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εΌε³',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'key',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'secretε―ι₯',
  `auth_scene` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?€θ―εΊζ―',
  `auth_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?€θ―ζΉεΌ',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£ιΎζ₯',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'θ?€θ―εθ??',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_recharge_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_recharge_code`;
CREATE TABLE `ims_yz_recharge_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `code_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `end_time` (`end_time`),
  KEY `code_key` (`code_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_recharge_code_bind_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_recharge_code_bind_log`;
CREATE TABLE `ims_yz_recharge_code_bind_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `code_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `bind_time` int(11) NOT NULL DEFAULT '0',
  `code_information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_bonus_create_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_bonus_create_logs`;
CREATE TABLE `ims_yz_red_packet_bonus_create_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL COMMENT 'ηζηε₯ε±ζ»ι’',
  `number_sum` int(11) NOT NULL COMMENT 'ηζηι’ε€ε₯ε±ηΊ’εζ°ι',
  `create_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηζηι’ε€ε₯ε±ιι’η±»ε,1-εΊε?οΌ2-ηΊ’εζ± ηΎεζ―',
  `create_amount` double(10,2) NOT NULL COMMENT 'ηζηι’ε€ε₯ε±ηΊ’εεδΈͺε₯ε±',
  `red_packet_logs_id` int(11) NOT NULL COMMENT 'ε³θηΊ’εθ‘¨ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ―ζ₯ηΊ’ε-ι’ε€ε₯ε±ηζθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_red_packet_bonus_receive_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_bonus_receive_logs`;
CREATE TABLE `ims_yz_red_packet_bonus_receive_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `receive_amount` double(10,2) DEFAULT NULL COMMENT 'ι’ειι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ―ζ₯ηΊ’ε-ι’ε€ε₯ε±ι’εθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_red_packet_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_goods`;
CREATE TABLE `ims_yz_red_packet_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT '0ζ²‘εΌε―,1εΌε―',
  `scale` int(11) DEFAULT NULL COMMENT 'ζ―δΎ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_cashier` int(11) DEFAULT NULL COMMENT 'ζΆιΆε°θ?Ύη½?εΌε³',
  `cashier_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ηΊ’εζ»ι’ζ―δΎ',
  `cashier_scale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ζΆθ΄ΉηΊ’εζ―δΎ',
  `is_cps` int(11) DEFAULT NULL COMMENT 'CPSθ?Ύη½?εΌε³',
  `cps_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CPSηΊ’εζ»ι’ζ―δΎ',
  `cps_scale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CPSζΆθ΄ΉηΊ’εζ―δΎ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_import_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_import_records`;
CREATE TABLE `ims_yz_red_packet_import_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL COMMENT 'ζδ½ε',
  `admin_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδ½εIP',
  `total` int(11) DEFAULT NULL COMMENT 'ζ»ζ°',
  `failure` int(11) DEFAULT NULL COMMENT 'ε€±θ΄₯ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ―ζ₯ηΊ’ει’εΊ¦ε―Όε₯θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_red_packet_link_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_link_logs`;
CREATE TABLE `ims_yz_red_packet_link_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `red_packet_id` int(11) DEFAULT NULL COMMENT 'ηΊ’εζ± id',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `is_browse` int(11) DEFAULT NULL COMMENT 'ζ―ε¦ζ΅θ§',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ηεΉΏεθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_red_packet_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_logs`;
CREATE TABLE `ims_yz_red_packet_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `percentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ’εζ―δΎ',
  `results_amount` decimal(14,2) DEFAULT NULL COMMENT 'δΈη»©εΊζ°',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'ηΊ’εζ»ι’',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT 'ε·²ι’ειι’',
  `number_sum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ’εζ°ι',
  `receive` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε·²ι’εζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_quota_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_quota_logs`;
CREATE TABLE `ims_yz_red_packet_quota_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `order_id` int(11) DEFAULT NULL COMMENT '1',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?’εε·',
  `quota_proportion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιι’ζ―δΎ',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'η»η?ιι’',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT 'ηΊ’ει’εΊ¦',
  `amount_sum` decimal(14,2) DEFAULT NULL COMMENT 'η΄―θ?‘ζ»ι’εΊ¦',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_quota_management
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_quota_management`;
CREATE TABLE `ims_yz_red_packet_quota_management` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'ηΊ’εζ»ι’',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT 'ι’ειι’',
  `balance` decimal(14,2) DEFAULT NULL COMMENT 'δ½ι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_red_packet_receive_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_red_packet_receive_logs`;
CREATE TABLE `ims_yz_red_packet_receive_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `red_packet_id` int(11) DEFAULT NULL COMMENT 'ζ―ζ₯ηΊ’εID',
  `amount` decimal(14,2) DEFAULT NULL COMMENT 'ηΊ’εζ»ι’',
  `receive_amount` decimal(14,2) DEFAULT NULL COMMENT 'ι’ειι’',
  `balance` decimal(14,2) DEFAULT NULL COMMENT 'δ½ι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity`;
CREATE TABLE `ims_yz_redpack_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εη§°',
  `countdown_time` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨ζΆι΄',
  `bg_color` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θζ―ι’θ²',
  `top_img` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι‘Άι¨εΎη',
  `audio_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι³ι’ιΎζ₯',
  `send_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εζ·εη§°',
  `wishing` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ’εη₯η¦θ―­',
  `brand_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηεη§°',
  `brand_logo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εηlogo',
  `service_qr` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε?’ζδΊη»΄η ',
  `service_mobile` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε?’ζη΅θ―',
  `word` text COLLATE utf8mb4_unicode_ci COMMENT 'ε£δ»€',
  `withdraw_code` int(11) DEFAULT NULL COMMENT 'ε₯ε±η±»ε:1εΎ?δΏ‘ηΊ’ε,2δ½ι’,3η§―ε,4η±εΏεΌ',
  `default_challenge_number` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΌεζζζ¬‘ζ°',
  `withdraw_count` int(11) DEFAULT NULL COMMENT 'ε₯ε±ζ»δΊΊζ°',
  `withdraw_total` decimal(10,2) DEFAULT NULL COMMENT 'ε₯ε±ιι’ζ»ζ°',
  `min_withdraw` decimal(10,2) DEFAULT NULL COMMENT 'ζε°ε₯ε±ιι’',
  `max_withdraw` decimal(10,2) DEFAULT NULL COMMENT 'ζε€§ε₯ε±ιι’',
  `verify_mobile` int(11) DEFAULT NULL COMMENT 'ζ―ε¦ιͺθ―ζζΊε·',
  `invite_people` int(11) DEFAULT NULL COMMENT 'ιθ―·ε δΊΊθ·εΎδΈζ¬‘ζζζΊδΌ',
  `max_challenge_number` int(11) DEFAULT NULL COMMENT 'δΌεζε€θ·εΎxζ¬‘ε₯ε±',
  `agreement` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ΄»ε¨δΏ‘ζ―',
  `share_title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«ζ ι’',
  `share_thumb` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«εΎη',
  `share_content` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«εε?Ή',
  `status` int(11) DEFAULT NULL COMMENT 'ι»θ?€δΈΊ1,ε°ζδΏ?ζΉζ0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `exchange_rule` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζζ¬‘ζ°εζ’θ§ε,εΊεεζ°η»',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨εΌε§ζΆι΄',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ΄»ε¨η»ζζΆι΄',
  `scene_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊζ―id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_browse`;
CREATE TABLE `ims_yz_redpack_activity_browse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_challenge
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_challenge`;
CREATE TABLE `ims_yz_redpack_activity_challenge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε£δ»€',
  `challenge_number` int(11) DEFAULT NULL,
  `invite_people` int(11) DEFAULT NULL COMMENT 'ιθ―·ε δΈͺδΊΊθ·εΎδΈζ¬‘ζζζΊδΌ',
  `share_have_number` int(11) DEFAULT NULL COMMENT 'ιθ―·ζε€θ·εΎε€ε°ζ¬‘ζζζΊδΌ',
  `share_finish_number` int(11) DEFAULT NULL COMMENT 'ε·²η»θ·εΎε ζ¬‘',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `sum_consume` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'η΄―θ?‘ζΆθ΄Ήιι’',
  `settle_consume` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'ε·²η»η?ιι’',
  `sum_recommend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'η΄―θ?‘η΄ζ¨δΊΊζ°',
  `settle_recommend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ε·²η»η?η΄ζ¨δΊΊζ°',
  `sum_goods` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'η΄―θ?‘θ΄­δΉ°ζε?εεζ°ι',
  `settle_goods` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ε·²η»η?εεζ°ι',
  `consume_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT 'η΄―θ?‘ζΆθ΄Ήεζ’ηζζζ¬‘ζ°',
  `point_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT 'η§―εεζ’ηζζζ¬‘ζ°',
  `recommend_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT 'η΄ζ¨ε₯ε±ηζζζ¬‘ζ°',
  `goods_reward_number` int(11) NOT NULL DEFAULT '0' COMMENT 'θ΄­δΉ°εεε₯ε±ηζζζ¬‘ζ°',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_redpack_activity_challenge_activity_id_uid_unique` (`activity_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_challenge_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_challenge_log`;
CREATE TABLE `ims_yz_redpack_activity_challenge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL COMMENT 'redpack_item.id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ε₯ε±ιι’',
  `status` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εδΈζζζ΄»ε¨',
  `send_listid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΊ’εθ?’εηεΎ?δΏ‘εε·',
  `errno_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιθ――δ»£η ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_activity_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_activity_thumb`;
CREATE TABLE `ims_yz_redpack_activity_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_invite_log`;
CREATE TABLE `ims_yz_redpack_invite_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'ζ―ε¦ζζζε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_statistic` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_item`;
CREATE TABLE `ims_yz_redpack_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_order`;
CREATE TABLE `ims_yz_redpack_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL COMMENT 'η¨ζ·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'θ?’εid',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ?’εε·',
  `goods_count` int(11) NOT NULL DEFAULT '0' COMMENT 'θ΄­δΉ°ηζε?εεζ°ι',
  `order_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_redpack_order_activity_id_order_id_uid_unique` (`activity_id`,`order_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε£δ»€ηΊ’ε--εζ’ζζζ¬‘ζ°θ?’εε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_redpack_point_exchange_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_point_exchange_log`;
CREATE TABLE `ims_yz_redpack_point_exchange_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL COMMENT 'η¨ζ·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `exchange_times` int(10) unsigned NOT NULL COMMENT 'εζ’ζ¬‘ζ°',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εζ’ηΆζ 0εΎεζ’  1εζ’ζε  2εζ’ε€±θ΄₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε£δ»€ηΊ’ε--η¨ζ·η΄ζ¨θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_redpack_recommend_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_recommend_log`;
CREATE TABLE `ims_yz_redpack_recommend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `uid` int(10) unsigned NOT NULL COMMENT 'η¨ζ·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `child_id` int(10) unsigned NOT NULL COMMENT 'δΈηΊ§id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_redpack_word
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_redpack_word`;
CREATE TABLE `ims_yz_redpack_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `word` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ½εηε£δ»€',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_remittance_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_remittance_record`;
CREATE TABLE `ims_yz_remittance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_pay_id` int(11) NOT NULL,
  `report_url` text COLLATE utf8mb4_unicode_ci,
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_resend_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_resend_express`;
CREATE TABLE `ims_yz_resend_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `pack_goods` text COMMENT 'εθ΄§εεζ°ζ?εδ½',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_return_express
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_return_express`;
CREATE TABLE `ims_yz_return_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` int(11) NOT NULL DEFAULT '0',
  `express_company_name` varchar(50) NOT NULL DEFAULT '0',
  `express_sn` varchar(50) NOT NULL DEFAULT '0',
  `express_code` varchar(20) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `images` text COMMENT 'εΎηοΌtextη±»εδΈΊδΊδ»₯εε€εΎ',
  `way_id` varchar(255) DEFAULT NULL COMMENT 'ιθ΄§ζΉεΌε―δΈηΌε·',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_rich_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_rich_text`;
CREATE TABLE `ims_yz_rich_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η»',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι?',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT 'ε―ζζ¬',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε―ζζ¬ε­ε¨θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_role`;
CREATE TABLE `ims_yz_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room`;
CREATE TABLE `ims_yz_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°ι’',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¨ͺεΉ',
  `goods` text COLLATE utf8mb4_unicode_ci COMMENT 'η΄ζ­εε',
  `live_time` int(11) DEFAULT NULL COMMENT 'η΄ζ­ζΆι΄',
  `status` tinyint(4) DEFAULT NULL COMMENT '1εΎε?‘ζ ΈοΌ2η­εΎη΄ζ­οΌ3η΄ζ­δΈ­οΌ4ε·²η»ζ',
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ¨ζ΅ip',
  `ban` tinyint(4) DEFAULT '0' COMMENT 'η¦η¨',
  `role_id` tinyint(4) DEFAULT '0',
  `shop_id` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `start_time` int(11) DEFAULT '0',
  `end_time` int(11) DEFAULT '0',
  `bandwidth` decimal(8,2) DEFAULT '0.00',
  `flux` decimal(8,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `virtual` int(11) DEFAULT '0',
  `recommend` int(11) DEFAULT '2',
  `recommend_time` int(11) DEFAULT NULL,
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `live_type` int(11) NOT NULL DEFAULT '0',
  `is_purview` int(11) DEFAULT '0',
  `purview` text COLLATE utf8mb4_unicode_ci,
  `close_reward` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΌε―ζθ΅οΌ1ε³ι­ζθ΅',
  `close_chat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΌε―θ―θ?ΊοΌ1ε³ι­θ―θ?Ί',
  `mode_button` int(11) NOT NULL DEFAULT '0' COMMENT '1ζ¨ͺε±οΌ0η«ε±',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity`;
CREATE TABLE `ims_yz_room_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨ζ ι’',
  `room_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'η΄ζ­ι΄ids',
  `anchor_reward` text COLLATE utf8mb4_unicode_ci COMMENT 'δΈ»ζ­ε₯ε±',
  `member_reward` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεθ§ηε₯ε±',
  `room_member_reward` text COLLATE utf8mb4_unicode_ci COMMENT 'η΄ζ­ι΄δΌεε₯ε±',
  `packet_set` text COLLATE utf8mb4_unicode_ci COMMENT 'ηΊ’εθ?Ύη½?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_draw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_draw`;
CREATE TABLE `ims_yz_room_activity_draw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1δΈ»ζ­ε₯ε±οΌ2δΌεθ§ηε₯ε±οΌ3η΄ζ­ι΄δΌεε₯ε±',
  `coupon` text COLLATE utf8mb4_unicode_ci,
  `point` decimal(8,2) DEFAULT '0.00',
  `love` decimal(8,2) DEFAULT '0.00',
  `balance` decimal(8,2) DEFAULT '0.00',
  `packet` decimal(8,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`activity_id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_one
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_one`;
CREATE TABLE `ims_yz_room_activity_one` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`activity_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_activity_room_condition
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_activity_room_condition`;
CREATE TABLE `ims_yz_room_activity_room_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor`;
CREATE TABLE `ims_yz_room_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_black` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `level_id` int(11) NOT NULL DEFAULT '0',
  `virtual_quantity` int(11) DEFAULT '0',
  `synopsis` text COLLATE utf8mb4_unicode_ci COMMENT 'η?δ»',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_apply`;
CREATE TABLE `ims_yz_room_anchor_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_level`;
CREATE TABLE `ims_yz_room_anchor_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `award_rate` int(11) DEFAULT '0',
  `upgraded` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `code_level_id` int(11) DEFAULT NULL COMMENT 'η­ηΊ§',
  `code_num` int(11) DEFAULT NULL COMMENT 'ζζη ζ°ι',
  `up_condition` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0ε?ζοΌ1ζ―δ»',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_anchor_upgrate_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_anchor_upgrate_log`;
CREATE TABLE `ims_yz_room_anchor_upgrate_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `befor_level_id` int(11) DEFAULT NULL,
  `after_level_id` int(11) DEFAULT NULL,
  `up_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_ups` text COLLATE utf8mb4_unicode_ci,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_member`;
CREATE TABLE `ims_yz_room_authorization_code_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `code_level_id` int(11) DEFAULT NULL COMMENT 'δΈ»ζ­η­ηΊ§',
  `code_num` int(11) DEFAULT NULL COMMENT 'ζζη ζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­--δΌεζζη ';

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_member_change
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_member_change`;
CREATE TABLE `ims_yz_room_authorization_code_member_change` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `level_id` int(11) DEFAULT NULL COMMENT 'η­ηΊ§ID',
  `type` int(11) NOT NULL COMMENT 'εε¨η±»ε 1-εε°δΏ?ζΉ 2-εΊε? 3-εηΊ§θ΅ ι',
  `old_num` int(11) DEFAULT NULL COMMENT 'ζΉεεηζ°ι',
  `change_num` int(11) DEFAULT NULL COMMENT 'εε¨ζ°ι',
  `new_num` int(11) DEFAULT NULL COMMENT 'ζΉεεηζ°ι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­--ζζη εζ΄θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_room_authorization_code_used_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_authorization_code_used_log`;
CREATE TABLE `ims_yz_room_authorization_code_used_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL COMMENT 'εΊε?δΊΊID',
  `buyer` int(11) DEFAULT NULL COMMENT 'θ΄­δΉ°δΊΊID',
  `level` int(11) DEFAULT NULL COMMENT 'η­ηΊ§',
  `type` int(11) DEFAULT '1' COMMENT 'ηΆζ 1-ζͺζΏζ΄» 2-ζΏζ΄»',
  `is_sold` int(11) DEFAULT '1' COMMENT 'ηΆζ 1-ζͺε?εΊ 2-ε·²ε?εΊ',
  `money` decimal(14,2) NOT NULL COMMENT 'ιι’',
  `buy_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΄­δΉ°ζΆι΄',
  `activation_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΏζ΄»ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_seller` (`seller`),
  KEY `idx_buyer` (`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­--ζζη δ½Ώη¨';

-- ----------------------------
-- Table structure for ims_yz_room_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_banner`;
CREATE TABLE `ims_yz_room_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_bonus_log`;
CREATE TABLE `ims_yz_room_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `order_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ?’εε·',
  `amount` decimal(12,2) NOT NULL COMMENT 'εηΊ’η»η?ιι’',
  `bonus_ratio` decimal(10,2) DEFAULT '0.00' COMMENT 'εηΊ’ζ―δΎ',
  `bonus_amount` decimal(12,2) NOT NULL COMMENT 'εηΊ’ιι’',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'εηΊ’ηΆζ 0:ζͺη»η? 1οΌε·²η»η?',
  `recrive_at` int(11) DEFAULT NULL COMMENT 'ζΆθ΄§ζΆι΄',
  `settle_days` int(11) NOT NULL DEFAULT '0' COMMENT 'η»η?ε€©ζ°',
  `statement_at` int(11) DEFAULT NULL COMMENT 'η»η?ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_osn` (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_category`;
CREATE TABLE `ims_yz_room_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_code_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_code_pay_log`;
CREATE TABLE `ims_yz_room_code_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δ»ζ¬ΎδΊΊID',
  `code_log_id` int(11) DEFAULT NULL COMMENT 'εΊε?θ?°ε½ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηζηθ?’εε·',
  `type` int(11) DEFAULT '1' COMMENT 'ηΆζ 1-ζͺζ―δ» 2-ε·²ζ―δ»',
  `money` decimal(14,2) DEFAULT NULL COMMENT 'ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_seller` (`code_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­--ζζη ζ―δ»θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_room_diy_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_diy_menu`;
CREATE TABLE `ims_yz_room_diy_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_diy_option
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_diy_option`;
CREATE TABLE `ims_yz_room_diy_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_show` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_explain_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_explain_goods`;
CREATE TABLE `ims_yz_room_explain_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(14,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_gid` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_fan
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_fan`;
CREATE TABLE `ims_yz_room_fan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_member_id` int(11) DEFAULT NULL,
  `anchor_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_amid` (`anchor_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_goods`;
CREATE TABLE `ims_yz_room_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦ζ¨θ 1-ζ― 0-ε¦',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_gid` (`goods_id`),
  KEY `idx_gt` (`goods_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_goods_check
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_goods_check`;
CREATE TABLE `ims_yz_room_goods_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_launch_certification
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_launch_certification`;
CREATE TABLE `ims_yz_room_launch_certification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεID',
  `anchor_id` int(11) DEFAULT NULL COMMENT 'δΈ»ζ­ID',
  `realName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·η ',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΊ«δ»½θ―',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'ε°ε',
  `full_face_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ­£ι’η§',
  `reverse_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ει’η§',
  `hand_held_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζη§',
  `is_adopt` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦ιθΏ 0-ιͺθ―δΈ­ 1-ιθΏ 2-ζη»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­--ι¦ζ­ιͺθ―';

-- ----------------------------
-- Table structure for ims_yz_room_like
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_like`;
CREATE TABLE `ims_yz_room_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_online_num
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_online_num`;
CREATE TABLE `ims_yz_room_online_num` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_order`;
CREATE TABLE `ims_yz_room_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ?’εid',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’εε·',
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ΄­δΉ°δΌεID',
  `room_id` int(11) NOT NULL DEFAULT '0' COMMENT 'η΄ζ­ι΄ID',
  `anchor_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈ»ζ­ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈ»ζ­δΌεID',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `status` tinyint(4) DEFAULT '0' COMMENT 'θ?’εηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_idx` (`order_id`),
  KEY `idx_osn` (`order_sn`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_play_notice
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_play_notice`;
CREATE TABLE `ims_yz_room_play_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_app` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_popularize_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_popularize_code`;
CREATE TABLE `ims_yz_room_popularize_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'ζ¨εΉΏδΌεID',
  `room_id` int(11) NOT NULL COMMENT 'η΄ζ­ι΄ID',
  `guest_nums` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌζ΅δΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­ζ¨εΉΏη θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_room_popularize_code_logs
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_popularize_code_logs`;
CREATE TABLE `ims_yz_room_popularize_code_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'εΌζ΅δΌεID',
  `code_id` int(11) NOT NULL COMMENT 'ζ¨εΉΏη ID',
  `view_time` int(11) NOT NULL DEFAULT '0' COMMENT 'θ§ηζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`member_id`),
  KEY `idx_codeid` (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η΄ζ­ζ¨εΉΏη θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_room_record_file
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_record_file`;
CREATE TABLE `ims_yz_room_record_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `file_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `file_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `recommend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT '0',
  `recommend_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`member_id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_report
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_report`;
CREATE TABLE `ims_yz_room_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `anchor_member_id` int(11) DEFAULT NULL,
  `room_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_reward_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_reward_list`;
CREATE TABLE `ims_yz_room_reward_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit1_number` decimal(8,2) DEFAULT NULL,
  `credit2_number` decimal(8,2) DEFAULT NULL,
  `love_number` decimal(8,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `show_effect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1εΌε―ηΉζοΌ0ε³ι­ηΉζ',
  `effect_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ­ζΎη±»ε 0δΈεε±οΌ1δΈεε±οΌ2ε¨ε±',
  `effect_gif` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηΉζεΎ',
  `effect_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΉζζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_reward_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_reward_record`;
CREATE TABLE `ims_yz_room_reward_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1η§―εοΌ2δ½ι’οΌ3η±εΏεΌ',
  `transfer` int(11) DEFAULT NULL,
  `number` decimal(8,2) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `reward_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_view
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_view`;
CREATE TABLE `ims_yz_room_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `room_ban` int(11) DEFAULT '0',
  `chat_ban` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`room_id`),
  KEY `idx_mid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_room_voice_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_room_voice_record`;
CREATE TABLE `ims_yz_room_voice_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `send_member_id` int(11) DEFAULT NULL COMMENT 'εθ΅·δΊΊδΌεid',
  `receive_member_id` int(11) DEFAULT NULL COMMENT 'ζ₯ζΆδΊΊδΌεid',
  `send_room_id` int(11) DEFAULT NULL COMMENT 'ειδΊΊη΄ζ­ι΄id',
  `receive_room_id` int(11) DEFAULT NULL COMMENT 'ζ₯ζΆδΊΊη΄ζ­ι΄id',
  `status` int(11) NOT NULL COMMENT 'θΏιΊ¦ηΆζ',
  `start_time` int(11) DEFAULT NULL COMMENT 'θΏιΊ¦εΌε§ζΆι΄',
  `end_time` int(11) DEFAULT NULL COMMENT 'θΏιΊ¦η»ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θΏιΊ¦θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_search_filtering
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_search_filtering`;
CREATE TABLE `ims_yz_search_filtering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θΏζ»€εη§°',
  `parent_id` int(11) DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'εΌ',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT 'η­ηΊ§',
  `is_show` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_front_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'εη«―ζ―ε¦ζΎη€Ί',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_service_fee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_service_fee`;
CREATE TABLE `ims_yz_service_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goods_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_open` int(11) DEFAULT '0',
  `fee` decimal(14,2) DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_setting`;
CREATE TABLE `ims_yz_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shop',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group_uniacid` (`group`,`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity`;
CREATE TABLE `ims_yz_share_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `diyform_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_background` tinyint(4) DEFAULT NULL,
  `button` tinyint(4) DEFAULT NULL,
  `audio_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_qr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_list` tinyint(4) DEFAULT NULL,
  `award_list` tinyint(4) DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countdown_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_content` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `poster_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ΅·ζ₯εΌε―:0ε³ι­1εΌε―',
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΅·ζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity_browse
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity_browse`;
CREATE TABLE `ims_yz_share_activity_browse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_activity_thumb
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_activity_thumb`;
CREATE TABLE `ims_yz_share_activity_thumb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_share_coupon_records
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_share_coupon_records`;
CREATE TABLE `ims_yz_share_coupon_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `mark_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η¨δΊζ₯ζΎηζ θ―',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `recipient_id` int(11) DEFAULT NULL COMMENT 'ζ₯εθid',
  `member_coupon_id` int(11) NOT NULL COMMENT 'ε³θid',
  `coupon_id` int(11) NOT NULL COMMENT 'δΌζ εΈid',
  `is_combine` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ―εεΉΆζ°ζ?',
  `num` int(11) NOT NULL COMMENT 'εδΊ«ζ°ι',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζ 1οΌε·²ι’ε',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_company_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_company_account`;
CREATE TABLE `ims_yz_shop_esign_company_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θΈη­ΎδΌδΈθ?€θ―id',
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε¬εΈεη§°',
  `flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε?εζ΅η¨id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?€θ―ηΆζοΌ0γζͺθ?€θ―οΌ1γε·²θ?€θ―',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `org_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'η»η»δ»£η η±»ε',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract`;
CREATE TABLE `ims_yz_shop_esign_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεεη§°',
  `sign_end_date` int(11) NOT NULL DEFAULT '0' COMMENT 'η­Ύη½²ζͺζ­’ζ₯ζ',
  `contract_end_date` int(11) NOT NULL DEFAULT '0' COMMENT 'εεε°ζζ₯ζ',
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ¨‘ζΏid',
  `uid` int(11) NOT NULL DEFAULT '0',
  `yq_contract_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θΈη­Ύεεζ΅η¨id',
  `account_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εθ΅·δΊΊε§εοΌεΏ«η§δΏε­',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηΆζοΌ0ε·²εθ΅·οΌ1η­Ύη½²δΈ­οΌ2γε·²ε?ζοΌ3γε·²ζ€εοΌ4γε·²θΆζΆ',
  `contract_order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεθ?’εid',
  `origin_contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεζζ‘£εζδ»Άε°ε',
  `contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεζζ‘£ε°ε',
  `contract_doc_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεζζ‘£εη§°',
  `contract_attach` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εειδ»Άε°ε',
  `pdf_width` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdfε?½',
  `pdf_height` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdfι«',
  `scene_id` int(11) NOT NULL DEFAULT '1' COMMENT 'δ½Ώη¨εΊζ―οΌ1ιη¨η­Ύη½²;2η»ε?ζζΊε·;3ι¨εΊε₯ι©»;4δΎεΊεε₯ι©»;5ζη°η³θ―·',
  `sign_role_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η­Ύη½²δΈ»δ½οΌ1δΈͺδΊΊοΌ2γδΌδΈ',
  `platform_role_id` int(11) NOT NULL DEFAULT '1' COMMENT 'εΉ³ε°θ§θ²ID:1-η²;2-δΉ;3-δΈη­η­',
  `variable_data` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εειδ»Άε°ε',
  `evid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ―ζ?ιΎID',
  `spot_evid` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεη­Ύη½²θ―ζ?ηΉID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL COMMENT 'ζ΄»ε¨id',
  `plugin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδ»Άεη§°',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_form`;
CREATE TABLE `ims_yz_shop_esign_contract_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `contract_id` int(11) NOT NULL DEFAULT '0',
  `form_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζζ¬εη±»εοΌ1γζζ¬;2γη­Ύη« ',
  `form_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζζ¬εεη§°',
  `form_value` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζζ¬εεΌ',
  `is_require` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΏε‘«οΌ0ε¦οΌ1ζ―',
  `pos_x` double(8,2) NOT NULL COMMENT 'xεζ ',
  `pos_y` double(8,2) NOT NULL COMMENT 'yεζ ',
  `pdf_pos_x` double(8,2) NOT NULL COMMENT 'pdf xεζ οΌεδ½ζ―«η±³οΌ',
  `pdf_pos_y` double(8,2) NOT NULL COMMENT 'pdf yεζ οΌεδ½ζ―«η±³οΌ',
  `doc_page` int(11) NOT NULL DEFAULT '1' COMMENT 'ζε¨ζζ‘£ι‘΅ζ°',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT 'ε?½εΊ¦',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT 'ι«εΊ¦',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζδ½θ§θ²ID:1-η²;2-δΉ;3-δΈη­η­',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ιθοΌ0ε¦οΌ1ζ―',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_role`;
CREATE TABLE `ims_yz_shop_esign_contract_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ§θ²ID:1-η²;2-δΉ;3-δΈη­η­',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'θ§θ²uid',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε§ε',
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η΅θ―',
  `sign_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η­Ύη½²δΈ»δ½οΌ0γδΈͺδΊΊοΌ1γδΌδΈ',
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈζδΈͺδΊΊηaccount_id',
  `company_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η­Ύη½²ε¬εΈε',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεid',
  `sign_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η­Ύη½²ηΆζοΌ0ζͺη­Ύη½²οΌ1η­Ύη½²',
  `sign_service_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Eη­Ύε?η­Ύη½²θ?°ε½id',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_template
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_template`;
CREATE TABLE `ims_yz_shop_esign_contract_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ¨‘ζΏεη§°',
  `contract_doc_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεζζ‘£ε°ε',
  `contract_doc_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εεζζ‘£εη§°',
  `contract_attach` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εειδ»Άε°ε',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηΆζοΌ0η¦η¨οΌ1ζ­£εΈΈ',
  `scene_id` int(11) NOT NULL DEFAULT '1' COMMENT 'δ½Ώη¨εΊζ―οΌ1ιη¨η­Ύη½²;2η»ε?ζζΊε·;3ι¨εΊε₯ι©»;4δΎεΊεε₯ι©»;5ζη°η³θ―·',
  `sign_role_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η­Ύη½²δΈ»δ½οΌ0γδΈͺδΊΊοΌ1γδΌδΈ',
  `sign_end_day` int(11) NOT NULL DEFAULT '0' COMMENT 'εεεθ΅·ε ε€©εε°ζ',
  `platform_role_id` int(11) NOT NULL DEFAULT '1' COMMENT 'εΉ³ε°θ§θ²ID:1-η²;2-δΉ;3-δΈη­η­',
  `variable_data` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εειδ»Άε°ε',
  `pdf_width` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdfε?½',
  `pdf_height` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'pdfι«',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_template_form
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_template_form`;
CREATE TABLE `ims_yz_shop_esign_contract_template_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `template_id` int(11) NOT NULL DEFAULT '0',
  `form_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζζ¬εη±»εοΌ1γζζ¬;2γη­Ύη« εοΌ',
  `form_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζζ¬εεη§°',
  `form_value` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζζ¬ει»θ?€εΌ',
  `is_require` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΏε‘«οΌ0ε¦οΌ1ζ―',
  `doc_page` int(11) NOT NULL DEFAULT '1' COMMENT 'ζε¨ζζ‘£ι‘΅ζ°',
  `pos_x` double(8,2) NOT NULL COMMENT 'xεζ ',
  `pos_y` double(8,2) NOT NULL COMMENT 'yεζ ',
  `pdf_pos_x` double(8,2) NOT NULL COMMENT 'pdf xεζ οΌεδ½ζ―«η±³οΌ',
  `pdf_pos_y` double(8,2) NOT NULL COMMENT 'pdf yεζ οΌεδ½ζ―«η±³οΌ',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT 'ε?½εΊ¦',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT 'ι«εΊ¦',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζδ½θ§θ²ID:1-η²;2-δΉ;3-δΈη­η­',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_contract_will_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_contract_will_auth`;
CREATE TABLE `ims_yz_shop_esign_contract_will_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `contract_id` int(11) DEFAULT NULL COMMENT 'εεid',
  `seal_id` int(11) DEFAULT NULL COMMENT 'ε°η« id',
  `sign_type` int(11) DEFAULT NULL COMMENT 'η­Ύη« η±»ε',
  `doc_page` int(11) DEFAULT NULL COMMENT 'η­Ύη½²ι‘΅η ',
  `total_page` int(11) DEFAULT NULL COMMENT 'ζ»ι‘΅ζ°',
  `pos_x` int(11) DEFAULT NULL COMMENT 'xθ½΄',
  `pos_y` int(11) DEFAULT NULL COMMENT 'yθ½΄',
  `width` int(11) DEFAULT NULL COMMENT 'ε?½εΊ¦',
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tokenιͺθ―',
  `expires_at_time_str` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε½ζΆζΆι΄',
  `expires_at` int(11) DEFAULT NULL COMMENT 'θͺε?δΉtokenζζζ',
  `bizId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε·θΈζζΏid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_goods`;
CREATE TABLE `ims_yz_shop_esign_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `use_contract` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―δ»εζ―ε¦ιθ¦η­Ύη½²η΅ε­εεοΌ0γε¦οΌ1γζ―',
  `template_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_order`;
CREATE TABLE `ims_yz_shop_esign_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT 'yz_goodsθ‘¨id',
  `order_id` int(11) NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?’εε·',
  `contract_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_osn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_esign_person_account
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_esign_person_account`;
CREATE TABLE `ims_yz_shop_esign_person_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ?€θ―ζζΊε·εΏ«η§δΏε­',
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θΈη­ΎδΈͺδΊΊθ?€θ―id',
  `flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε?εζ΅η¨id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?€θ―ηΆζοΌ0γζͺθ?€θ―οΌ1γε·²θ?€θ―',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_face` tinyint(4) DEFAULT '0' COMMENT 'ε·θΈθ?€θ―',
  `auth_tel` tinyint(4) DEFAULT '0' COMMENT 'ζζΊε·θ?€θ―',
  `auth_bank` tinyint(4) DEFAULT '0' COMMENT 'ιΆθ‘ε‘θ?€θ―',
  `has_face` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦ε·θΈ',
  `face_flow_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε·θΈζ΅η¨id',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_statistics_goods_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_statistics_goods_statistic`;
CREATE TABLE `ims_yz_shop_statistics_goods_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°id',
  `statistic_date` int(11) NOT NULL COMMENT 'η»θ?‘ζ°ζ?ζ₯οΌζΆι΄ζ³οΌδ»₯η»θ?‘ηζ°ζ?ζ₯ζη0ζΆ0εζΆι΄ζ³',
  `goods_total` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ηεεζ°ι',
  `goods_count` int(11) NOT NULL COMMENT 'ε ε₯θ΄­η©θ½¦ηεεη§η±»ζ°ι',
  `pay_goods_count` int(11) NOT NULL COMMENT 'ζ―δ»ζεηεεζ°ι',
  `moving_goods_count` int(11) NOT NULL COMMENT 'ε¨ιεεζ°ιοΌιιδΈδΈΊ0οΌ',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shop_statistics_member_statistic
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shop_statistics_member_statistic`;
CREATE TABLE `ims_yz_shop_statistics_member_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'εΉ³ε°id',
  `statistic_date` int(11) NOT NULL COMMENT 'η»θ?‘ζ°ζ?ζ₯οΌζΆι΄ζ³οΌδ»₯η»θ?‘ηζ°ζ?ζ₯ζη0ζΆ0εζΆι΄ζ³',
  `member_total` int(11) NOT NULL COMMENT 'δΌεζ»ζ°',
  `member_new` int(11) NOT NULL COMMENT 'δΌεζ°ε’ζ°',
  `member_man` int(11) NOT NULL COMMENT 'η·ζ§δΌεζ°ι',
  `member_female` int(11) NOT NULL COMMENT 'ε₯³ζ§δΌεζ°ι',
  `member_unknown` int(11) NOT NULL COMMENT 'ζͺη₯ζ§ε«δΌεζ°ι',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shopping_share_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shopping_share_coupon`;
CREATE TABLE `ims_yz_shopping_share_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0' COMMENT 'εδΊ«θδΌεid',
  `order_id` int(11) DEFAULT '0' COMMENT 'θ?’εid',
  `share_coupon` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«δΌζ ε·ιε',
  `receive_coupon` text COLLATE utf8mb4_unicode_ci COMMENT 'ι’εδΌζ ε·ιε',
  `obtain_restriction` tinyint(4) DEFAULT '0' COMMENT 'ι’ειεΆ',
  `status` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦δ»₯ι’ε?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_shopping_share_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_shopping_share_coupon_log`;
CREATE TABLE `ims_yz_shopping_share_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `share_uid` int(11) DEFAULT '0' COMMENT 'εδΊ«θδΌεid',
  `receive_uid` int(11) DEFAULT '0' COMMENT 'ι’εθδΌεid',
  `share_coupon_id` int(11) DEFAULT '0' COMMENT 'δΌζ ε·εδΊ«θ‘¨id',
  `order_id` int(11) DEFAULT '0' COMMENT 'θ?’εID',
  `coupon_id` int(11) DEFAULT '0' COMMENT 'δΌζ ε·id',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΌζ ε·εη§°',
  `log` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ₯εΏθ―¦η»',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε­ζ?΅ι’η',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sign
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sign`;
CREATE TABLE `ims_yz_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `cumulative_point` decimal(11,2) DEFAULT '0.00',
  `cumulative_coupon` int(11) DEFAULT '0',
  `cumulative_number` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `cumulative_love` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sign_log`;
CREATE TABLE `ims_yz_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `award_point` decimal(11,2) DEFAULT '0.00',
  `award_coupon` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `award_love` int(11) DEFAULT '0',
  `day_love_return` decimal(14,2) DEFAULT '0.00' COMMENT 'η­Ύε°η±εΏεΌθΏη°-ε€©',
  `continuous_love_return` decimal(14,2) DEFAULT '0.00' COMMENT 'η­Ύε°η±εΏεΌθΏη°-θΏη»­',
  `total_love_return` decimal(14,2) DEFAULT '0.00' COMMENT 'η­Ύε°η±εΏεΌθΏη°-ζ»εΌ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_site_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_site_setting`;
CREATE TABLE `ims_yz_site_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_slide`;
CREATE TABLE `ims_yz_slide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `slide_name` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  `enabled` tinyint(3) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_sms_send_limit
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sms_send_limit`;
CREATE TABLE `ims_yz_sms_send_limit` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sql_install_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sql_install_log`;
CREATE TABLE `ims_yz_sql_install_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?θ£η»ε―Ήθ·―εΎ',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζ°ζ?εΊε?θ£θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_status
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_status`;
CREATE TABLE `ims_yz_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL,
  `plugin_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store`;
CREATE TABLE `ims_yz_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `street_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_introduce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `template_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `salers` text COLLATE utf8mb4_unicode_ci,
  `cashier_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `business_hours_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `business_hours_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `aptitude_imgs` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dispatch_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `affiche` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `user_uid` int(11) NOT NULL DEFAULT '0',
  `information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_black` tinyint(1) NOT NULL DEFAULT '0',
  `banner_thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ζΎη€Ί/1:ιθ',
  `specify_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ι¦ι‘΅/1:εει‘΅...',
  `operating_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0οΌη»θ₯/1:δΌζ―',
  `boss_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'θζΏuid',
  `audio_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ε³ι­|1οΌεΌε―',
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `validity` int(11) DEFAULT '0',
  `validity_status` tinyint(1) DEFAULT '0' COMMENT '1ε€±ζ',
  `id_card_imgs` text COLLATE utf8mb4_unicode_ci,
  `other_imgs` text COLLATE utf8mb4_unicode_ci,
  `yun_horn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΊεε­iemiεΌ',
  `zkc_pay` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'zkcζ―δ»iemiεΌ',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_store_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι¦ι‘΅ε°η¨εΊδΊη»΄η ε°ε',
  `goods_store_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εει‘΅ε°η¨εΊδΊη»΄η ε°ε',
  `collect_money_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ε°η¨εΊδΊη»΄η ε°ε',
  `payment_jump_minapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ζ―δ»θ·³θ½¬ε°η¨εΊιΎζ₯--ζ»εε°θ?Ύη½?',
  `payment_jump_h5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ζ―δ»θ·³θ½¬h5ιΎζ₯--ζ»εε°θ?Ύη½?',
  `is_open_jump` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―η¬η«εε°ζ―δ»θ·³θ½¬',
  `separate_payment_jump_minapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ζ―δ»θ·³θ½¬ε°η¨εΊιΎζ₯--η¬η«εε°θ?Ύη½?',
  `separate_payment_jump_h5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆιΆε°ζ―δ»θ·³θ½¬h5ιΎζ₯--η¬η«εε°θ?Ύη½?',
  `balance_id` int(11) DEFAULT '0' COMMENT 'ι¨εΊδ½ι’εεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_advertisement`;
CREATE TABLE `ims_yz_store_advertisement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ζ ι’',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΎη',
  `adv_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΉΏειΎζ₯',
  `sort_by` int(11) DEFAULT '0' COMMENT 'ζεΊ',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:εΎε?‘ζ Έ|1οΌιθΏ',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_advertisement_uniacid` (`uniacid`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_alipay_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_alipay_setting`;
CREATE TABLE `ims_yz_store_alipay_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_auth_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `auth_app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `expires_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `app_refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `re_expires_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_authorized_royalty` tinyint(4) DEFAULT NULL,
  `royalty` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_apply`;
CREATE TABLE `ims_yz_store_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT '0',
  `validity` int(11) DEFAULT '0',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_auto_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_auto_log`;
CREATE TABLE `ims_yz_store_auto_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_award_point
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_award_point`;
CREATE TABLE `ims_yz_store_award_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `calculate_type` int(11) DEFAULT NULL COMMENT 'θ?’εθ?‘η?ζΉεΌ',
  `award_store_type` int(11) DEFAULT NULL COMMENT 'θ?‘η?ζΉεΌ(ι¨εΊ)',
  `award_cashier_type` int(11) DEFAULT NULL COMMENT 'θ?‘η?ζΉεΌ(ζΆιΆε°)',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT 'ι¨εΊηζεθ?Ύη½?',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆιΆε°ηζεθ?Ύη½?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss`;
CREATE TABLE `ims_yz_store_boss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss_order`;
CREATE TABLE `ims_yz_store_boss_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT 'θζΏuid',
  `store_id` int(11) DEFAULT NULL COMMENT 'ι¨εΊid',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εid',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT 'θ?’ειι’',
  `store_order_id` int(11) DEFAULT NULL COMMENT 'ι¨εΊθ?’εid',
  `cashier_order_id` int(11) DEFAULT NULL COMMENT 'ζΆιΆε°θ?’εid',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ζΆε₯ιι’',
  `status` tinyint(1) DEFAULT NULL COMMENT '0ζͺζη°1ε·²ζη°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_boss_stores
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_boss_stores`;
CREATE TABLE `ims_yz_store_boss_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `boss_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_boss_id` (`boss_id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_carousel
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_carousel`;
CREATE TABLE `ims_yz_store_carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `min_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_deduct_love_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_deduct_love_log`;
CREATE TABLE `ims_yz_store_cashier_deduct_love_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `manager_uid` int(11) NOT NULL COMMENT 'εΊιΏδΌεID',
  `shall_be_deduct` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εΊζ£ι€',
  `actual_deduction` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ε?ιζ£ι€',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_give_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_give_coupon`;
CREATE TABLE `ims_yz_store_cashier_give_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_give_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_give_reward`;
CREATE TABLE `ims_yz_store_cashier_give_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `is_store` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0δΈΊθ΄­δΉ°θ1δΈΊι¨εΊ',
  `reward_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0δΈΊη§―ε1δΈΊη±εΏεΌ',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_cashier_order_import
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_cashier_order_import`;
CREATE TABLE `ims_yz_store_cashier_order_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_option_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_category`;
CREATE TABLE `ims_yz_store_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_collection_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_collection_code`;
CREATE TABLE `ims_yz_store_collection_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT 'ι¨εΊid',
  `qr_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΊη»΄η ιΎζ₯',
  `collection_code_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζΆζ¬Ύη ιΎζ₯',
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η«ηΉεη§°',
  `custom_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θͺε?δΉζε­',
  `icon_link_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ ιΎζ₯1',
  `icon_link_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ ιΎζ₯2',
  `icon_link_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ ιΎζ₯3',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ι’θ²(ι’θ?Ύ) ',
  `type` int(11) DEFAULT NULL COMMENT 'η±»ε:1ε¬δΌε· 2ε°η¨εΊ',
  `ico_one_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ 1ζε­',
  `ico_two_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ 2ζε­',
  `ico_three_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎζ 3ζε­',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ι¨εΊζΆιΆε°--ι¨εΊζΆζ¬Ύη ';

-- ----------------------------
-- Table structure for ims_yz_store_consumer_reward
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_consumer_reward`;
CREATE TABLE `ims_yz_store_consumer_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `calculate_type` int(11) DEFAULT NULL COMMENT 'θ?’εθ?‘η?ζΉεΌ',
  `award_store_type` int(11) DEFAULT NULL COMMENT 'θ?‘η?ζΉεΌ(ι¨εΊ)',
  `award_cashier_type` int(11) DEFAULT NULL COMMENT 'θ?‘η?ζΉεΌ(ζΆιΆε°)',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT 'ι¨εΊηζεθ?Ύη½?',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆιΆε°ηζεθ?Ύη½?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ι¨εΊζΆιΆε°--ζΆθ΄Ήε₯ε±θ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_store_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_dispatch`;
CREATE TABLE `ims_yz_store_dispatch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_diy_return
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_diy_return`;
CREATE TABLE `ims_yz_store_diy_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `diy_total` int(11) DEFAULT NULL,
  `point_total` int(11) DEFAULT NULL,
  `finish_point_total` int(11) DEFAULT NULL,
  `cash_total` int(11) DEFAULT NULL,
  `finish_cash_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_face_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_face_setting`;
CREATE TABLE `ims_yz_store_face_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `wx_sub_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `wx_sub_mchid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `no_profit_sharing` tinyint(4) DEFAULT NULL,
  `wx_sub_mini_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_full_package
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_full_package`;
CREATE TABLE `ims_yz_store_full_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_open` int(11) NOT NULL DEFAULT '0',
  `enough` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ»‘ε€ε°εει?',
  `province_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηid',
  `city_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΈid',
  `cities` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΈ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_full_reduction`;
CREATE TABLE `ims_yz_store_full_reduction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_cashier` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ«η δΉ°ε',
  `is_store` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊηΊΏδΈεειε?',
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT 'εΌε―δΌζ ',
  `rule` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ§ε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_geo_fence
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_geo_fence`;
CREATE TABLE `ims_yz_store_geo_fence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `store_id` int(11) NOT NULL,
  `geo_fence` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `geo_fence_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods`;
CREATE TABLE `ims_yz_store_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `goods_gift` tinyint(4) DEFAULT '0',
  `customer_development` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods_category`;
CREATE TABLE `ims_yz_store_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_goods_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_goods_setting`;
CREATE TABLE `ims_yz_store_goods_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―ι¨εΊη¬η«ζζθ?‘η?',
  `commission_type` tinyint(1) DEFAULT NULL COMMENT '1:ζ―δΎ2:εΊε?ιι’',
  `value` decimal(10,2) DEFAULT NULL COMMENT 'ζζζ―δΎζεΊε?ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_homepage_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_homepage_history`;
CREATE TABLE `ims_yz_store_homepage_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storeid` (`store_id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_member`;
CREATE TABLE `ims_yz_store_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊδΌεη­ηΊ§id',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.θΏεΊδΌε',
  `expired_time` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεθΏζζΆι΄',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ι¨εΊζΆιΆε°--ι¨εΊδΌεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_store_nearby_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_nearby_goods`;
CREATE TABLE `ims_yz_store_nearby_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer`;
CREATE TABLE `ims_yz_store_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_pos
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_pos`;
CREATE TABLE `ims_yz_store_printer_pos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_set`;
CREATE TABLE `ims_yz_store_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_printer_temp`;
CREATE TABLE `ims_yz_store_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_privilege_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_privilege_discount`;
CREATE TABLE `ims_yz_store_privilege_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `store_id` int(11) NOT NULL COMMENT 'ι¨εΊid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΄»ε¨ζ ι’',
  `discount_type` tinyint(4) DEFAULT '0' COMMENT 'ζζ£ζΆι΄η±»ε',
  `discount_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζε€©ζζ£',
  `discount_weeks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζζζζ£',
  `discount_value` decimal(3,1) DEFAULT NULL COMMENT 'ζζ£',
  `is_open` tinyint(4) DEFAULT '0' COMMENT 'ζ―ε¦εΌε― 0:ε³ι­ 1:εΌε―',
  `member_level` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§idιε',
  `use_scene` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'δ½Ώη¨εΊζ―ιε',
  `use_cashier` tinyint(4) DEFAULT '0' COMMENT 'ζΆιΆε°',
  `use_store` tinyint(4) DEFAULT '0' COMMENT 'ι¨εΊεε',
  `usage_count` int(11) DEFAULT '0' COMMENT 'δ½Ώη¨ζ¬‘ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_privilege_use_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_privilege_use_log`;
CREATE TABLE `ims_yz_store_privilege_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `order_id` int(11) DEFAULT '0' COMMENT 'θ?’εid',
  `member_id` int(11) DEFAULT '0' COMMENT 'δΌεid',
  `privilege_id` int(11) DEFAULT '0' COMMENT 'ηΉζζζ£id',
  `privilege_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηΉζζ ι’',
  `privilege_discount` decimal(3,1) DEFAULT NULL COMMENT 'ηΉδ»·ζζ£',
  `privilege_amount` decimal(12,2) DEFAULT NULL COMMENT 'ζζ£ιι’',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_idx` (`store_id`),
  KEY `privilege_idx` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_rewards_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_rewards_set`;
CREATE TABLE `ims_yz_store_rewards_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT 'yz_store.id',
  `cashier_id` int(11) DEFAULT NULL COMMENT 'cashier_id.id',
  `store` text COLLATE utf8mb4_unicode_ci COMMENT 'ι¨εΊε₯ε±θ?Ύη½?',
  `cashier` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆιΆε°ηεΊε₯ε±θ?Ύη½?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζΆιΆε°ηεΊε₯ε±θ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_store_service
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_service`;
CREATE TABLE `ims_yz_store_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `mini_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊε?’ζθ·―εΎ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_setting`;
CREATE TABLE `ims_yz_store_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_share_chain
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_share_chain`;
CREATE TABLE `ims_yz_store_share_chain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―ε±δΊ«ιΎ',
  `member_levels` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§',
  `lucky_draw_type` int(11) DEFAULT NULL COMMENT 'ζ½ε₯ 0 εΊε? 1 εΊι΄',
  `award_ladder` text COLLATE utf8mb4_unicode_ci COMMENT 'θ?’εη΄―θ?‘ιι’ε₯ε±',
  `award_rights` decimal(10,2) DEFAULT NULL COMMENT 'ζεζ―δΎ',
  `award_ratio` decimal(10,2) DEFAULT NULL COMMENT 'η¬η«ε₯ε±ζ―δΎ',
  `fixed_award_ratio` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊε?ζ―δΎ',
  `section_award_ratio_start` decimal(10,2) DEFAULT NULL COMMENT 'εΊι΄ζ―δΎ',
  `section_award_ratio_end` decimal(10,2) DEFAULT NULL COMMENT 'εΊι΄ζ―δΎ',
  `start_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΌε§ζΆι΄[03:40]',
  `end_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η»ζζΆι΄[09:25]',
  `everyone_everyday_award_num` int(11) DEFAULT NULL COMMENT 'ζ―δΊΊζ―ε€©ε₯ε±ιεΆ',
  `everyone_award_total` int(11) DEFAULT NULL COMMENT 'ζ―δΊΊζ»ε₯ε±ιεΆ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `random_return_is_open` int(11) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―ιζΊθΏ',
  PRIMARY KEY (`id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_store_verification_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_store_verification_clerk`;
CREATE TABLE `ims_yz_store_verification_clerk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `realname` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_street
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_street`;
CREATE TABLE `ims_yz_street` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(255) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=654328149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_subject
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_subject`;
CREATE TABLE `ims_yz_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `uid_reward_value` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε₯ε±εΌθ?Ύη½?',
  `uid_reward_ratio` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε₯ε±ζ―δΎθ?Ύη½?',
  `parent_reward_value` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε₯ε±εΌθ?Ύη½?',
  `parent_reward_ratio` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε₯ε±ζ―δΎθ?Ύη½?',
  `uid_reward_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΌεε₯ε±ζΆθ΄Ήη§―εθ?Ύη½?',
  `parent_reward_integral` decimal(5,2) DEFAULT NULL COMMENT 'δΈηΊ§ε₯ε±ζΆθ΄Ήη§―εθ?Ύη½?',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier`;
CREATE TABLE `ims_yz_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `realname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `apply_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `product` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `uid` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_bank` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_ali` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ali` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wechat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `diyform_data_id` int(11) NOT NULL DEFAULT '0',
  `bank_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bank_of_accounts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `opening_branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company_ali_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ali_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηηΊ§εη§°',
  `city_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΈηΊ§εη§°',
  `district_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'εΊηΊ§εη§°',
  `grade` tinyint(4) DEFAULT '0' COMMENT '0οΌζ ζοΌ1οΌηηΊ§οΌ2οΌεΈηΊ§οΌ3οΌεΊηΊ§',
  `shop_commission` decimal(14,2) DEFAULT '0.00',
  `lng` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'η»εΊ¦',
  `lat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ηΊ¬εΊ¦',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ηηΊ§id',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΈηΊ§id',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΊηΊ§id',
  `street_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ‘ιid',
  `street_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ‘ιεη§°',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ―¦η»ε°ε',
  `insurance_status` int(11) NOT NULL DEFAULT '1' COMMENT 'δΏεεΌε³',
  `certificate` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δΎεΊεθ΅θ΄¨',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εη»id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ‘δΈid',
  `shop_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εΉ³ε°ζ£ηΉ',
  `settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ι©»ζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_adv`;
CREATE TABLE `ims_yz_supplier_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `advs` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉΏεδ½εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `supplier_uid` int(11) DEFAULT '0' COMMENT 'δΎεΊεθΎε©ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_aptitude`;
CREATE TABLE `ims_yz_supplier_aptitude` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `aptitude` text COLLATE utf8mb4_unicode_ci COMMENT 'θ΅θ΄¨εΎηη»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `identity` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΈδΌ θΊ«δ»½θ―εΎη',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊε-δΎεΊεθ΅θ΄¨θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_category`;
CREATE TABLE `ims_yz_supplier_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ§ζ Όid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊε-δΎεΊεθ‘δΈθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_supplier_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_dispatch`;
CREATE TABLE `ims_yz_supplier_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispatch_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_goods`;
CREATE TABLE `ims_yz_supplier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_group`;
CREATE TABLE `ims_yz_supplier_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'θ§ζ Όid',
  `up_aptitude` int(11) DEFAULT '0' COMMENT '1εΏι‘»δΈδΌ θ΅θ΄¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_identity` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦δΈδΌ θΊ«δ»½θ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊε-δΎεΊεεη»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_supplier_insurance_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_insurance_order`;
CREATE TABLE `ims_yz_supplier_insurance_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `ins_id` int(11) NOT NULL COMMENT 'δΏεid',
  `supplier_id` int(11) DEFAULT NULL,
  `has_withdraw` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ε·²ζη°',
  `has_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `settlement_days` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_order`;
CREATE TABLE `ims_yz_supplier_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_profit` decimal(14,2) NOT NULL DEFAULT '0.00',
  `order_goods_information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT NULL,
  `is_settlement` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ε―δ»₯η»η?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_order_ratio_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_order_ratio_log`;
CREATE TABLE `ims_yz_supplier_order_ratio_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'θ?’εηΌε·',
  `is_open_ratio_range` int(11) DEFAULT '0' COMMENT 'ζ―ε¦εΌε―εΊι΄ζ£ηΉ',
  `shop_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'εΉ³ε°ζ£ηΉ',
  `culate_method` int(11) DEFAULT '0' COMMENT 'ζζθ?‘η?ζΉεΌ',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊε-δΎεΊεθ?’εζ£ηΉθ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_supplier_printer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer`;
CREATE TABLE `ims_yz_supplier_printer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_printer_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer_set`;
CREATE TABLE `ims_yz_supplier_printer_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_set.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_printer_temp
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_printer_temp`;
CREATE TABLE `ims_yz_supplier_printer_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) NOT NULL DEFAULT '0' COMMENT 'more_printer_temp.id',
  `user_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?ζδΌεid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_relevance_package_deliver
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_relevance_package_deliver`;
CREATE TABLE `ims_yz_supplier_relevance_package_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0' COMMENT 'ε¬δΌε·id',
  `supplier_id` int(11) DEFAULT '0' COMMENT 'δΎεΊεid',
  `package_deliver_id` int(11) DEFAULT '0' COMMENT 'θͺζηΉid',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΎεΊεε³θθͺζηΉ-δΎεΊεε³θθͺζηΉθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_supplier_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_slide`;
CREATE TABLE `ims_yz_supplier_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `slide_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηεη§°',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηιΎζ₯',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηεΎη',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζΎη€Ί',
  `supplier_uid` int(11) DEFAULT '0' COMMENT 'δΎεΊεθΎε©ID',
  `pc_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηPCηεΎη',
  `pc_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΉ»η―ηPCηιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_supplier_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_supplier_withdraw`;
CREATE TABLE `ims_yz_supplier_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `money` decimal(14,2) NOT NULL DEFAULT '0.00',
  `order_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `deleted_at` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `apply_sn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `pay_time` int(11) DEFAULT '0',
  `apply_money` decimal(14,2) NOT NULL DEFAULT '0.00',
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `service_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_synchronized_binder
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_synchronized_binder`;
CREATE TABLE `ims_yz_synchronized_binder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `old_uid` int(11) DEFAULT '0' COMMENT 'fansθ‘¨δΏ?ζΉεηuid',
  `new_uid` int(11) DEFAULT '0' COMMENT 'fansθ‘¨δΏ?ζΉεηuid',
  `old_credit1` int(11) DEFAULT '0' COMMENT 'ε’ε εηη§―ε',
  `old_credit2` int(11) DEFAULT '0' COMMENT 'ε’ε εηδ½ι’',
  `add_credit1` int(11) DEFAULT '0' COMMENT 'ε’ε ηη§―ε',
  `add_credit2` int(11) DEFAULT '0' COMMENT 'ε’ε ηδ½ι’',
  `old_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'δΏ?ζΉεηmobile',
  `new_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'δΏ?ζΉεηmobile',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `setting_data` text COLLATE utf8mb4_unicode_ci COMMENT 'ε½εδΌεθ?Ύη½?',
  `save_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'δΏε­η±»ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sys_msg_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sys_msg_log`;
CREATE TABLE `ims_yz_sys_msg_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type_id` int(11) NOT NULL COMMENT 'ζΆζ―η±»εid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ―ζ ι’',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ―εε?Ή',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ―ηΉε»θ·³θ½¬url',
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ―»εηΆζοΌ0ζͺθ―»οΌ1ε·²θ―»',
  `msg_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΆζ―θ―¦ζζ°ζ?',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `read_at` int(11) DEFAULT NULL COMMENT 'ιθ―»ζΆι΄',
  `redirect_param` text COLLATE utf8mb4_unicode_ci COMMENT 'ζΆζ―θ·³θ½¬ζιεζ°',
  PRIMARY KEY (`id`),
  KEY `yz_sys_msg_log_uniacid_type_id_created_at_index` (`uniacid`,`type_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_sys_msg_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_sys_msg_type`;
CREATE TABLE `ims_yz_sys_msg_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η±»εεη§°',
  `icon_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η±»εεΎζ ε°ε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_system_setting`;
CREATE TABLE `ims_yz_system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_system_white_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_system_white_list`;
CREATE TABLE `ims_yz_system_white_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ipε°ε',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ε―η¨:0ε¦1ε―η¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='η¬η«εε°η»ε½η½εεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_task_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_activity`;
CREATE TABLE `ims_yz_task_reward_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨ζ ι’',
  `starttime` int(11) DEFAULT NULL COMMENT 'ζΆι΄εΌε―',
  `endtime` int(11) DEFAULT NULL COMMENT 'ζΆι΄η»ζ',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ΄»ε¨εΎη',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ΄»ε¨δ»η»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«ζ ι’',
  `share_content` text COLLATE utf8mb4_unicode_ci COMMENT 'εδΊ«εε?Ή',
  `share_pictures` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εδΊ«εΎη',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_task_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_log`;
CREATE TABLE `ims_yz_task_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_ci,
  `reward` text COLLATE utf8mb4_unicode_ci,
  `reward_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_task_reward_task
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_task_reward_task`;
CREATE TABLE `ims_yz_task_reward_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_order` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_ci,
  `reward` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_team_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_team_order_statistics`;
CREATE TABLE `ims_yz_team_order_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `team_order_quantity` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιδΈηΊΏθ?’εζ°',
  `team_order_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'ε’ιδΈηΊΏθ?’ειι’',
  `pay_count` int(11) DEFAULT '0' COMMENT 'ε’ιζ―δ»δΊΊζ°',
  `team_count` int(11) DEFAULT '0' COMMENT 'ε’ιζ»δΊΊζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message`;
CREATE TABLE `ims_yz_template_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_item` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id_short` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `example` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message_default
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message_default`;
CREATE TABLE `ims_yz_template_message_default` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id_short` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_template_message_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_template_message_record`;
CREATE TABLE `ims_yz_template_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `top_color` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `send_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `msgid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `wechat_send_at` int(11) NOT NULL DEFAULT '0',
  `sended_count` tinyint(1) NOT NULL DEFAULT '1',
  `extend_data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_uniacid_app
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_uniacid_app`;
CREATE TABLE `ims_yz_uniacid_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΊη¨εΎη',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΊη¨εη§°',
  `kind` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ‘δΈεη±»',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊη¨ζ ι’',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΊη¨ζθΏ°',
  `version` double(8,2) DEFAULT NULL COMMENT 'εΊη¨ηζ¬',
  `validity_time` int(11) NOT NULL COMMENT 'ζζζ',
  `type` tinyint(4) NOT NULL COMMENT 'εΊη¨η±»ε,1ζε‘ε· 2θ?’ιε· 3δΌδΈε· 4ε°η¨εΊ5 PCεΊη¨6 APPεΊη¨ 7ε°ζΈΈζ',
  `status` tinyint(4) DEFAULT '1' COMMENT 'εΊη¨ηΆζ 0η¦η¨1ε―η¨',
  `creator` int(11) DEFAULT NULL COMMENT 'εΉ³ε°εε»Ίθ',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_support` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encodingaeskey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_top` tinyint(4) DEFAULT '0' COMMENT '0δΈη½?ι‘ΆοΌ 1η½?ι‘Ά',
  `topped_at` int(11) DEFAULT '0' COMMENT 'η½?ι‘ΆζΆι΄',
  `admin_is_top` tinyint(4) DEFAULT '0' COMMENT '0δΈη½?ι‘ΆοΌ 1θΆηΊ§η?‘ηεη½?ι‘Ά',
  `admin_topped_at` int(11) DEFAULT '0' COMMENT 'θΆηΊ§η?‘ηεη½?ι‘ΆζΆι΄',
  PRIMARY KEY (`id`),
  KEY `yz_uniacid_app_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_universal_card_consume_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_universal_card_consume_coupon`;
CREATE TABLE `ims_yz_universal_card_consume_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δ½ι’ηΆζ0ζ ζ1ε―η¨2ε»η»',
  `amount` decimal(12,2) DEFAULT '0.00',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΈε‘ιζΆθ΄ΉεΈ';

-- ----------------------------
-- Table structure for ims_yz_universal_card_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_universal_card_level`;
CREATE TABLE `ims_yz_universal_card_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_level_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_spec` text COLLATE utf8mb4_unicode_ci,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `consume_coupon_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_update_auth
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_update_auth`;
CREATE TABLE `ims_yz_update_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_update_withdraw_address
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_update_withdraw_address`;
CREATE TABLE `ims_yz_update_withdraw_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `old_address` varchar(42) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `new_address` varchar(42) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_user_role`;
CREATE TABLE `ims_yz_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_users_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_users_permission`;
CREATE TABLE `ims_yz_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ims_yz_users_profile
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_users_profile`;
CREATE TABLE `ims_yz_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε§ε',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€΄ε',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζζΊε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_variety_member_cart
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_variety_member_cart`;
CREATE TABLE `ims_yz_variety_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_cart_id` int(11) NOT NULL COMMENT 'δΌεθ΄­η©θ½¦id',
  `member_cart_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΌεθ΄­η©θ½¦η±»ε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `yz_variety_member_cart_member_cart_id_index` (`member_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌεθ΄­η©θ½¦ε³η³»θ‘¨(ε€ζ)';

-- ----------------------------
-- Table structure for ims_yz_video_answer_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_answer_record`;
CREATE TABLE `ims_yz_video_answer_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `uid` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `video_id` int(11) DEFAULT NULL COMMENT 'θ§ι’id',
  `subject_id` int(11) DEFAULT NULL COMMENT 'ι’η?id',
  `status` int(11) DEFAULT NULL COMMENT 'ηΆζ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_big_chapter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_big_chapter`;
CREATE TABLE `ims_yz_video_big_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `course_goods_id` int(11) DEFAULT '0' COMMENT 'εεθ§ι’ιθ‘¨id',
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€§η« εη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_goods_idx` (`course_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_comment_support
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_comment_support`;
CREATE TABLE `ims_yz_video_comment_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:δΈηΉθ΅οΌ1:ηΉθ΅',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_commentid` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’εδΊ«θ―θ?ΊηΉθ΅θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_course_chapter`;
CREATE TABLE `ims_yz_video_course_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL COMMENT 'θ―Ύη¨ID',
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η« θεη§°',
  `video_address` text COLLATE utf8mb4_unicode_ci COMMENT 'θ§ι’ε°ε',
  `is_audition` tinyint(1) DEFAULT NULL COMMENT 'ζ―ε¦θ―ε¬',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `dig_chapter_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζε±ε€§η« id',
  `video_cover_address` text COLLATE utf8mb4_unicode_ci COMMENT 'ε°ι’ε°ε',
  PRIMARY KEY (`id`),
  KEY `dig_chapter_idx` (`dig_chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_course_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_course_goods`;
CREATE TABLE `ims_yz_video_course_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεεη§°',
  `is_course` tinyint(1) DEFAULT NULL COMMENT 'ζ―ε¦εΌε―θ―Ύη¨',
  `lecturer_id` int(11) DEFAULT NULL,
  `lecturer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ?²εΈε§ε',
  `is_reward` tinyint(1) DEFAULT NULL COMMENT 'ζ―ε¦ζθ΅',
  `see_levels` text COLLATE utf8mb4_unicode_ci COMMENT 'δΌεη­ηΊ§ζι οΌδΌεη­ηΊ§IDοΌ 0ε¨ι¨η­ηΊ§ ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `live_channel` int(11) DEFAULT NULL COMMENT 'η΄ζ­ι’ι',
  `live_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η΄ζ­ζ ι’',
  `is_try` tinyint(4) DEFAULT '0' COMMENT 'θ―ηεΌε³οΌ0ε³1εΌ',
  `try_time` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―ηζΆιΏοΌεδ½οΌη§',
  `questionnaire_is_open` tinyint(4) DEFAULT NULL COMMENT 'ι?ε·εΌε―οΌ0ε³1εΌ',
  `questionnaire_time` int(11) DEFAULT NULL COMMENT 'θΏε₯ι‘΅ι’ζΆιΏοΌεδ½οΌη§',
  `is_lecturer_dividend` tinyint(4) DEFAULT '0' COMMENT 'θ?²εΈεηΊ’οΌ0εΌ1ε³',
  `course_aging` int(11) DEFAULT NULL COMMENT 'θ―Ύη¨ζζζοΌε€©δΈΊεδ½',
  `not_permit_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ζιιΎζ₯θ·³θ½¬',
  `mini_not_permit_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊζ ζιιΎζ₯θ·³θ½¬',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_historical
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_historical`;
CREATE TABLE `ims_yz_video_historical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL COMMENT 'θ―Ύη¨ID',
  `course_chapter_id` int(11) DEFAULT NULL COMMENT 'η« θID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_lecturer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_lecturer`;
CREATE TABLE `ims_yz_video_lecturer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `real_name` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηε?ε§ε',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `blacklist` int(11) DEFAULT '0' COMMENT 'ι»εε',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_lecturer_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_lecturer_reward_log`;
CREATE TABLE `ims_yz_video_lecturer_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL COMMENT 'θ?²εΈID',
  `course_id` int(11) DEFAULT NULL COMMENT 'θ―Ύη¨ID',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε·',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT 'θ?’ειι’',
  `reward_type` tinyint(1) DEFAULT NULL COMMENT 'ε₯ε±η±»ε0οΌεηΊ’1οΌζθ΅',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ε₯ε±ιι’',
  `status` tinyint(1) DEFAULT NULL COMMENT 'ηΆζ0οΌζͺη»η? 1οΌε·²η»η?',
  `settle_days` int(11) DEFAULT NULL COMMENT 'η»η?ε€©ζ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT '0' COMMENT 'θ΄­δΉ°/ζθ΅δΊΊID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_live_room
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_live_room`;
CREATE TABLE `ims_yz_video_live_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·',
  `is_open` int(11) NOT NULL COMMENT 'ζδ»ΆεΌε³',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζδ»Άεη§°',
  `hover_icon` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ¬ζ΅?εΎζ ',
  `display_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζΎη€Ίι‘΅ι’',
  `position` int(11) NOT NULL COMMENT 'ζ¬ζ΅?εΎζ δ½η½?',
  `position_top` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι‘Άθ·',
  `video_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ§ι’id',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  `updated_at` int(11) DEFAULT NULL COMMENT 'δΏ?ζΉζΆι΄',
  `deleted_at` int(11) DEFAULT NULL COMMENT 'ε ι€ζΆι΄',
  PRIMARY KEY (`id`),
  KEY `yz_video_live_room_uniacid_index` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ε·η΄ζ­ι΄';

-- ----------------------------
-- Table structure for ims_yz_video_member_course
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_member_course`;
CREATE TABLE `ims_yz_video_member_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `course_expiration_time` int(11) DEFAULT NULL COMMENT 'θ―Ύη¨θΏζζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_navigation
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_navigation`;
CREATE TABLE `ims_yz_video_navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `navigation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΎζ₯',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎη',
  `display_order` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `status` tinyint(1) DEFAULT NULL COMMENT 'ζΎη€Ί0οΌε¦1οΌζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_redpack_activity
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_activity`;
CREATE TABLE `ims_yz_video_redpack_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `sort` int(10) unsigned NOT NULL DEFAULT '10' COMMENT 'ζεΊ',
  `activity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ΄»ε¨εη§°',
  `activity_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ΄»ε¨ηΆζ 0ε³ι­  1ζ­£εΈΈ',
  `redpack_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΊ’εεΌΉηͺθζ―εΎιΎζ₯',
  `logo_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΊ’εεΌΉηͺlogoεΎιΎζ₯',
  `redpack_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΊ’εεΌΉηͺζζ‘',
  `rule_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'ε₯ε±θ§εεΌε―ηΆζη΄―ε εΌ 0ζͺεΌε― 1εͺεΌε―δΊζΆιΏ 2εͺεΌε―δΊηε?θ§ι’ 3ζΆιΏ+ηε?θ§ι’',
  `rule_detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηΊ’εθ§εθ―¦ζ,ζ°η»εΊεε',
  `redpack_store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εζ·εη§°',
  `redpack_blessing_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΊ’εη₯η¦θ―­',
  `reward_type` tinyint(3) unsigned NOT NULL COMMENT 'ε₯ε±ζΉεΌ 1εΊε?ε₯ε± 2εΊι΄ε₯ε±',
  `max_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εδΈͺεΊι΄ηΊ’εζι«ιι’',
  `min_money` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εδΈͺεΊι΄ηΊ’εζδ½ιι’',
  `redpack_amount` decimal(14,2) NOT NULL COMMENT 'ηΊ’εζ»εζΎιι’',
  `redpack_number` int(10) unsigned NOT NULL COMMENT 'ηΊ’εζ»εζΎζ°ι',
  `rest_amount` decimal(14,2) unsigned NOT NULL COMMENT 'ηΊ’εε©δ½ιι’',
  `rest_number` int(10) unsigned NOT NULL COMMENT 'ηΊ’εε©δ½ζ°ι',
  `people_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ζ―δΊΊιι’ε ζ¬‘ηΊ’εοΌ0δΈΊδΈιεΆ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `pic_list` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ηΊ’ε--ζ΄»ε¨θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_item
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_item`;
CREATE TABLE `ims_yz_video_redpack_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `redpack_amount` decimal(8,2) unsigned NOT NULL COMMENT 'ηΊ’ειι’',
  `state` int(10) unsigned NOT NULL COMMENT 'εζΎηΆζ 0ζͺι’ε 1ε·²ι’ε 2ε€±ζ',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'ι’εηΊ’εηη¨ζ·id',
  `received_at` int(11) DEFAULT NULL COMMENT 'ι’εζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ηΊ’ε--ζ΄»ε¨θ§ι’θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_log`;
CREATE TABLE `ims_yz_video_redpack_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `redpack_id` int(10) unsigned NOT NULL COMMENT 'ηΊ’εid',
  `redpack_amount` decimal(8,2) unsigned NOT NULL COMMENT 'ηΊ’ειι’',
  `uid` int(10) unsigned NOT NULL COMMENT 'η¨ζ·id',
  `state` int(10) unsigned NOT NULL COMMENT 'εζΎηΆζ 0ζͺεζΎ 1εζΎδΈ­ 2εζΎζε 3εζΎε€±θ΄₯',
  `err_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎ?δΏ‘η°ιηΊ’εεθ°ιθ――δ»£η ',
  `err_code_des` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘η°ιηΊ’εεθ°ιθ――ζθΏ°',
  `mch_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘η°ιηΊ’εεζ·θ?’εε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `rule_type` tinyint(4) NOT NULL,
  `rule_value` int(11) NOT NULL,
  `old_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_video_redpack_log_activity_id_uid_index` (`activity_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ηΊ’ε--ηΊ’εεζΎθ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_video
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_video`;
CREATE TABLE `ims_yz_video_redpack_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `activity_id` int(10) unsigned NOT NULL COMMENT 'ζ΄»ε¨id',
  `video_id` int(10) unsigned NOT NULL COMMENT 'θ§ι’id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_video_redpack_video_activity_id_index` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_redpack_view_length
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_view_length`;
CREATE TABLE `ims_yz_video_redpack_view_length` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `video_id` int(10) unsigned NOT NULL COMMENT 'θ§ι’id',
  `uid` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `length` int(11) DEFAULT NULL COMMENT 'θ§ι’ζΆιΏ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_video_redpack_view_length_video_id_unique` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ηΊ’ε--θ§ι’ζΆιΏθ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_redpack_view_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_redpack_view_log`;
CREATE TABLE `ims_yz_video_redpack_view_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `video_id` int(10) unsigned NOT NULL COMMENT 'θ§ι’id',
  `uid` int(11) NOT NULL COMMENT 'η¨ζ·id',
  `refresh_at` int(11) DEFAULT NULL COMMENT 'ζεδΈζ¬‘ηθ―₯θ§ι’ηεΌε§ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `video_length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_video_redpack_view_log_video_id_uid_unique` (`video_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’ηΊ’ε--θ§ι’θ§ηθ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_reward_log`;
CREATE TABLE `ims_yz_video_reward_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'ζθ΅δΊΊID',
  `goods_id` int(11) DEFAULT NULL COMMENT 'εεID',
  `lecturer_id` int(11) DEFAULT NULL COMMENT 'θ?²εΈID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT 'ζθ΅ιι’',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε·',
  `pay_method` tinyint(1) DEFAULT NULL COMMENT 'ζ―δ»ζΉεΌ',
  `pay_status` tinyint(1) DEFAULT NULL COMMENT 'ζ―δ»ηΆζ0οΌζͺζ―δ»1οΌε·²ζ―δ»',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_bonus`;
CREATE TABLE `ims_yz_video_share_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `ratio` decimal(10,2) DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_category`;
CREATE TABLE `ims_yz_video_share_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `is_show` tinyint(4) DEFAULT NULL COMMENT 'ζ―ε¦ζΎη€Ί 1-ζΎη€Ί 2-ιθ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’εδΊ«--εη±»';

-- ----------------------------
-- Table structure for ims_yz_video_share_comment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_comment`;
CREATE TABLE `ims_yz_video_share_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεid',
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―θ?Ίζ΅η§°',
  `head_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―θ?Ίε€΄ε',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε?Ή',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT 'εΎη',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―θ?ΊID',
  `reply_id` int(11) DEFAULT NULL COMMENT 'εη­εͺδΈͺδΌεID',
  `reply_comment_id` int(11) DEFAULT NULL COMMENT 'εη­εͺδΈͺθ―θ?Ί',
  `reply_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη­εͺδΈͺζ΅η§°',
  `support_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΉθ΅ζ°',
  `type` tinyint(4) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_videoid` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’εδΊ«θ―θ?Ίθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_video_share_follow
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_follow`;
CREATE TABLE `ims_yz_video_share_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'θ’«ε³ζ³¨ηη¨ζ·ID',
  `follow_member_id` int(11) DEFAULT NULL COMMENT 'ε³ζ³¨θηη¨ζ·ID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ§ι’εδΊ«--ε³ζ³¨';

-- ----------------------------
-- Table structure for ims_yz_video_share_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_goods`;
CREATE TABLE `ims_yz_video_share_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `cover` text COLLATE utf8mb4_unicode_ci,
  `video` text COLLATE utf8mb4_unicode_ci,
  `share_num` int(11) DEFAULT NULL,
  `like_num` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `amount_total` decimal(10,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'εη±»ID',
  `is_recommend` int(11) DEFAULT NULL COMMENT 'ζ¨θ 0-ε³ι­ 1-εΌε―',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ι¨εΊid',
  `is_crm` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦crmζ¨ιοΌ0ε¦1ζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_like_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_like_log`;
CREATE TABLE `ims_yz_video_share_like_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_share_watch_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_share_watch_record`;
CREATE TABLE `ims_yz_video_share_watch_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberid` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_slide
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_slide`;
CREATE TABLE `ims_yz_video_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `slide_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εη§°',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΎζ₯',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎη',
  `display_order` int(11) DEFAULT NULL COMMENT 'ζεΊ',
  `status` tinyint(1) DEFAULT NULL COMMENT 'ηΆζ0οΌη¦η¨1οΌε―η¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `small_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε°η¨εΊιΎζ₯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_video_subject
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_video_subject`;
CREATE TABLE `ims_yz_video_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `video_id` int(11) DEFAULT NULL COMMENT 'θ§ι’id',
  `subject_id` int(11) DEFAULT NULL COMMENT 'ι’η?id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_coin
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_coin`;
CREATE TABLE `ims_yz_virtual_coin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'θζεΈ',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exchange_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT 'ζ±η',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_data`;
CREATE TABLE `ims_yz_virtual_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usetime` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_idx` (`type_id`),
  KEY `owner_idx` (`owner_id`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_goods`;
CREATE TABLE `ims_yz_virtual_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `module_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `type_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_song` tinyint(4) DEFAULT '0',
  `the_way` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `goods_idx` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_module
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_module`;
CREATE TABLE `ims_yz_virtual_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_order`;
CREATE TABLE `ims_yz_virtual_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `order_sn` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_price` decimal(12,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_virtual_type
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_virtual_type`;
CREATE TABLE `ims_yz_virtual_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `field_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_virtual_type_uniacid_parent_id_index` (`uniacid`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_website_info
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_website_info`;
CREATE TABLE `ims_yz_website_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'η«ηΉ',
  `founder_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'εε§δΊΊθ΄¦ε·',
  `founder_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'εε§δΊΊε―η ',
  `server_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ζε‘ε¨IP',
  `root_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ζε‘ε¨rootε―η ',
  `ssh_port` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ssh η«―ε£',
  `database_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ζ°ζ?εΊθ?Ώι?ε°ε',
  `database_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ζ°ζ?εΊη¨ζ·ε',
  `database_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'ζ°ζ?εΊε―η ',
  `root_directory` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'η½η«ζ Ήη?ε½',
  `qq` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'θη³»qq',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'θη³»ζζΊε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `root_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζε‘ε¨θ΄¦ε·',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_attachment`;
CREATE TABLE `ims_yz_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `acid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `module_upload_dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_basic_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_basic_reply`;
CREATE TABLE `ims_yz_wechat_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_image_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_image_reply`;
CREATE TABLE `ims_yz_wechat_image_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_menu`;
CREATE TABLE `ims_yz_wechat_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `client_platform_type` int(11) NOT NULL DEFAULT '0',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_music_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_music_reply`;
CREATE TABLE `ims_yz_wechat_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hqurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news`;
CREATE TABLE `ims_yz_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `attach_id` int(11) NOT NULL DEFAULT '0',
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `digest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show_cover_pic` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `need_open_comment` int(11) NOT NULL DEFAULT '0',
  `only_fans_can_comment` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_news_examine
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_examine`;
CREATE TABLE `ims_yz_wechat_news_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΎε?‘ζ Έ 1ζε -1ε€±θ΄₯',
  `examine_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'εΎ?δΏ‘ε?‘ζ ΈηΆζ 0:ζε, 1:εεΈδΈ­οΌ2:εεε€±θ΄₯, 3: εΈΈθ§ε€±θ΄₯, 4:εΉ³ε°ε?‘ζ ΈδΈιθΏ, 5:ζεεη¨ζ·ε ι€ζζζη« , 6: ζεεη³»η»ε°η¦ζζζη« ',
  `publish_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘ε?‘ζ Έid',
  `article_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘εΎζid',
  `examine_time` int(11) DEFAULT NULL COMMENT 'ε?‘ζ ΈζΆι΄',
  `update_time` int(11) DEFAULT NULL COMMENT 'ζ΄ζ°ζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_wechat_news_examine_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε¬δΌε·-εΎζε?‘ζ Έθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_news_examine_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_examine_article`;
CREATE TABLE `ims_yz_wechat_news_examine_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `examine_id` int(11) NOT NULL COMMENT 'ε?‘ζ Έθ‘¨ID',
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎη',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ ι’',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δ½θ',
  `digest` text COLLATE utf8mb4_unicode_ci COMMENT 'ζθ¦',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εε?Ή',
  `content_source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εζε°ειΎζ₯',
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°ι’εΎηη΄ ζID',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ζΎη€Ίε°ι’',
  `need_open_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζεΌθ―θ?Ί',
  `only_fans_can_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦η²δΈζε―θ―θ?Ί',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎζζΆζ―ηurl',
  `displayorder` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_wechat_news_examine_article_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε¬δΌε·-εΎζη΄ ζε?‘ζ Έζη« ';

-- ----------------------------
-- Table structure for ims_yz_wechat_news_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_news_reply`;
CREATE TABLE `ims_yz_wechat_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `incontent` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζη« ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_pay_order`;
CREATE TABLE `ims_yz_wechat_pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_fee` decimal(14,2) NOT NULL,
  `profit_sharing` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_profit_sharing_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_profit_sharing_log`;
CREATE TABLE `ims_yz_wechat_profit_sharing_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `mch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_mch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_appid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_qrcode_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_qrcode_fans`;
CREATE TABLE `ims_yz_wechat_qrcode_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_rule
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_rule`;
CREATE TABLE `ims_yz_wechat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `containtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reply_type` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_rule_keyword
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_rule_keyword`;
CREATE TABLE `ims_yz_wechat_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_sidebar
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_sidebar`;
CREATE TABLE `ims_yz_wechat_sidebar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯',
  `link_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ιΎζ₯εη§°',
  `user_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζεuserid',
  `department_ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ι¨ι¨id',
  `business_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈid',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uk_openid` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_category_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_category_apply`;
CREATE TABLE `ims_yz_wechat_trade_category_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `third_cat_id` int(11) NOT NULL COMMENT 'δΈηΊ§εη±»id',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θ΅θ΄¨εΎηοΌεΊεε',
  `callback` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εθ°ζ°ζ?οΌεΊεε',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΎε?‘ζ Έ 1ζε 2ε€±θ΄₯',
  `apply_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η³θ―·εε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--η±»η?η³θ―·θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_delivery_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_delivery_company`;
CREATE TABLE `ims_yz_wechat_trade_delivery_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--εΎ?δΏ‘εΏ«ιε¬εΈθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods`;
CREATE TABLE `ims_yz_wechat_trade_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(11) NOT NULL COMMENT 'εεεεid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εεεη§°',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε°η¨εΊθ·―εΎ',
  `product_qualification_pics` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εεθ΅θ΄¨εΎηζ°η»οΌεΊεε',
  `wechat_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘η«―εεζ°ζ?οΌεΊεεζ°ζ?',
  `brand_id` int(11) NOT NULL DEFAULT '2100000000' COMMENT 'εεεηid',
  `third_cat_id` int(11) NOT NULL COMMENT 'δΈηΊ§η±»η?id',
  `edit_status` tinyint(4) NOT NULL COMMENT 'ε?‘ζ ΈηΆζ -1ε·²εζΆ 1ζͺε?‘ζ Έ 2ε?‘ζ ΈδΈ­ 3ε?‘ζ Έε€±θ΄₯ 4ε?‘ζ Έζε',
  `wechat_status` tinyint(3) unsigned NOT NULL COMMENT 'εΎ?δΏ‘εεηΆζ 0εε§εΌ 5δΈζΆ 11θͺδΈ»δΈζΆ 13θΏθ§δΈζΆ/ι£ζ§η³»η»δΈζΆ',
  `wechat_create_time` int(11) DEFAULT NULL,
  `wechat_update_time` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `info_version` int(11) NOT NULL DEFAULT '1' COMMENT 'ηζ¬ζΆι΄ζ³',
  `wechat_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?δΏ‘εεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--εεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_category`;
CREATE TABLE `ims_yz_wechat_trade_goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `level` tinyint(4) NOT NULL COMMENT 'η±»η?ηΊ§ε«',
  `cat_id` int(10) unsigned NOT NULL COMMENT 'εΎ?δΏ‘εη±»id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'ηΆεΎ?δΏ‘εη±»id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εΎ?δΏ‘εη±»εη§°',
  `open_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε―η¨ηΆζ 0ε³ι­ 1ε―η¨',
  `apply_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η³θ―·ηΆζ 0ζͺη³θ―· 1ε·²η³θ―·ζδΈιθ¦η³θ―·',
  `qualification_type` tinyint(4) NOT NULL COMMENT 'η±»η?θ΅θ΄¨η±»ε,0:δΈιθ¦,1:εΏε‘«,2:ιε‘«',
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζιη±»η?θ΅θ΄¨',
  `product_qualification_type` tinyint(4) NOT NULL COMMENT 'εεθ΅θ΄¨η±»ε,0:δΈιθ¦,1:εΏε‘«,2:ιε‘«',
  `product_qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζιεεθ΅θ΄¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `can_apply` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'δΈδΊηΊ§εη±»δΈε±ζ―ε¦ε­ε¨ιθ¦η³θ―·ηδΈηΊ§εη±»',
  PRIMARY KEY (`id`),
  KEY `yz_wechat_trade_goods_category_cat_id_index` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--η±»η?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_examine
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_examine`;
CREATE TABLE `ims_yz_wechat_trade_goods_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `goods_id` int(11) NOT NULL COMMENT 'εεεεid',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εεεη§°',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε°η¨εΊθ·―εΎ',
  `examine_callback` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?‘ζ Έεθ°ζ°ζ?',
  `product_qualification_pics` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζιεεθ΅θ΄¨εΎηζ°η»οΌεΊεε',
  `examine_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'η³θ―·ε?‘ζ Έζ°ζ?οΌεΊεεζ°ζ?',
  `brand_id` int(11) NOT NULL DEFAULT '2100000000' COMMENT 'εεεηid',
  `third_cat_id` int(11) NOT NULL COMMENT 'δΈηΊ§η±»η?id',
  `edit_status` tinyint(4) NOT NULL COMMENT 'ε?‘ζ ΈηΆζ -1ε·²εζΆ 1ζͺε?‘ζ Έ 2ε?‘ζ ΈδΈ­ 3ε?‘ζ Έε€±θ΄₯ 4ε?‘ζ Έζε',
  `finish_time` int(11) DEFAULT NULL COMMENT 'ε?‘ζ Έη»ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `info_version` int(11) NOT NULL DEFAULT '1' COMMENT 'ηζ¬ζΆι΄ζ³',
  `wechat_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?δΏ‘εεid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--εεθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_goods_id_connection
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_goods_id_connection`;
CREATE TABLE `ims_yz_wechat_trade_goods_id_connection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `wechat_goods_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wechat_trade_goods_id_con_index` (`wechat_goods_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--εεidε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_order`;
CREATE TABLE `ims_yz_wechat_trade_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `order_id` int(11) NOT NULL COMMENT 'θ?’εid',
  `pay_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ―δ»εε·',
  `pay_type` int(11) NOT NULL COMMENT 'ζ―δ»ζΉεΌ 0εΎ?δΏ‘ 1θ΄§ε°δ»ζ¬Ύ 2δ½ι’ζ―δ»',
  `delivery_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ιιζΉεΌ 1: ζ­£εΈΈεΏ«ι, 2: ζ ιεΏ«ι, 3: ηΊΏδΈιι, 4: η¨ζ·θͺζ',
  `pay_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―δ»ηΆζ 0ζͺζ―δ» 1ε·²ζ―δ»',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εηΆζ -1ε³ι­ 0εΎζ―δ» 1ε·²ζ―δ» 2ε·²εθ΄§ 3ε·²ε?ζ',
  `close_time` int(11) DEFAULT NULL COMMENT 'ε³ι­ζΆι΄',
  `pay_time` int(11) DEFAULT NULL COMMENT 'ζ―δ»ζΆι΄',
  `delivery_time` int(11) DEFAULT NULL COMMENT 'εθ΄§ζΆι΄',
  `finish_time` int(11) DEFAULT NULL COMMENT 'ε?ζζΆι΄',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΉ°ε?Άuid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--θ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_qualification
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_qualification`;
CREATE TABLE `ims_yz_wechat_trade_qualification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT 'ε¬δΌε·id',
  `third_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εΎ?δΏ‘δΈηΊ§εη±»id',
  `goods_id` int(11) NOT NULL COMMENT 'εεid',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εηε',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ε­θ―η±»ε 1εεε­θ― 2εη±»ε­θ― 3εηε­θ―',
  `pic_arr` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε­θ―εΎηζ°η»οΌεΊεε',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--ε­θ―θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_trade_test_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_trade_test_order`;
CREATE TABLE `ims_yz_wechat_trade_test_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θͺε?δΉδΊ€ζη»δ»Ά--ζ₯ε₯ζ΅θ―θ?’εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wechat_userapi_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_userapi_reply`;
CREATE TABLE `ims_yz_wechat_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `apiurl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_text` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cachetime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_video_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_video_reply`;
CREATE TABLE `ims_yz_wechat_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wechat_voice_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wechat_voice_reply`;
CREATE TABLE `ims_yz_wechat_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw`;
CREATE TABLE `ims_yz_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_sn` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` text COLLATE utf8mb4_unicode_ci,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amounts` decimal(14,2) DEFAULT NULL,
  `poundage` decimal(14,2) DEFAULT NULL,
  `poundage_rate` decimal(11,2) DEFAULT NULL,
  `poundage_type` tinyint(4) DEFAULT '0' COMMENT 'ζη»­θ΄Ήη±»ε 0:ζ―δΎ 1:εΊε?',
  `pay_way` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `audit_at` int(11) DEFAULT NULL,
  `pay_at` int(11) DEFAULT NULL,
  `arrival_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `actual_amounts` decimal(14,2) NOT NULL,
  `actual_poundage` decimal(14,2) NOT NULL,
  `servicetax` decimal(12,2) DEFAULT NULL COMMENT 'ε³ε‘η¨',
  `servicetax_rate` decimal(11,2) DEFAULT NULL COMMENT 'ε³ε‘η¨ζ―δΎ',
  `actual_servicetax` decimal(12,2) DEFAULT NULL COMMENT 'ζη»ε³ε‘η¨',
  `manual_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_income
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_income`;
CREATE TABLE `ims_yz_withdraw_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `withdraw_id` int(11) NOT NULL COMMENT 'ζη°id',
  `income_id` int(11) NOT NULL COMMENT 'ζΆε₯id',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_withdraw_income_income_id_unique` (`income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_income_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_income_apply`;
CREATE TABLE `ims_yz_withdraw_income_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·id',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `withdraw_id` int(11) NOT NULL COMMENT 'ζη°id',
  `income_id` int(11) NOT NULL COMMENT 'ζΆε₯id',
  `status` int(11) NOT NULL COMMENT 'ζη°ηΆζ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_withdraw_income_apply_income_id_index` (`income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_merge_servicetax_rate
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_merge_servicetax_rate`;
CREATE TABLE `ims_yz_withdraw_merge_servicetax_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'δΈ»ι?ID',
  `uniacid` int(11) NOT NULL COMMENT 'ε¬δΌε·ID',
  `withdraw_id` int(11) NOT NULL COMMENT 'ζη°θ?°ε½id',
  `servicetax_rate` decimal(10,2) NOT NULL COMMENT 'εεΉΆε³ε‘θ΄Ήζ―δΎ',
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζζ 0ζζ 1ε€±ζ',
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='εεΉΆζη°ε³ε‘θ΄Ήζ―δΎθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_withdraw_relation_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_relation_order`;
CREATE TABLE `ims_yz_withdraw_relation_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT '0',
  `updated_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_withdraw_rich_text
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_rich_text`;
CREATE TABLE `ims_yz_withdraw_rich_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yz_withdraw_rich_text_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ζη°θ―΄ζε―ζζ¬';

-- ----------------------------
-- Table structure for ims_yz_withdraw_set_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_withdraw_set_log`;
CREATE TABLE `ims_yz_withdraw_set_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_id` int(11) DEFAULT NULL COMMENT 'ID',
  `poundage_type` tinyint(1) DEFAULT '0' COMMENT 'ζη°ζη»­θ΄Ήη±»ε  0ζ―δΎθ?‘η? οΌ1εΊε?ιι’οΌ',
  `poundage` decimal(14,2) DEFAULT NULL COMMENT 'ζη»­θ΄Ή poundage_tpyeδΈΊ0οΌεδΈΊζ―δΎοΌδΈΊ1εδΈΊεΊε?ιι’οΌ',
  `poundage_full_cut` decimal(14,2) DEFAULT NULL COMMENT 'ζ»‘ι’εεζη»­θ΄Ή',
  `withdraw_fetter` decimal(14,2) DEFAULT NULL COMMENT 'ζη°ιεΆοΌζη°ζε°ι’',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL COMMENT 'εε»ΊζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_work_wechat_allocate_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_allocate_customer`;
CREATE TABLE `ims_yz_work_wechat_allocate_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `takeover_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ₯ζΏζεηuserid',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊηuserid',
  `handover_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εθ·θΏζεηuserid',
  `status` int(11) NOT NULL DEFAULT '2' COMMENT 'ζ₯ζΏηΆζοΌ 1-ζ₯ζΏε?ζ― 2-η­εΎζ₯ζΏ 3-ε?’ζ·ζη» 4-ζ₯ζΏζεε?’ζ·θΎΎε°δΈι',
  `fail_reason` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ₯ζΏε€±θ΄₯ηεε ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘η¦»θειηε?’ζ·θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer`;
CREATE TABLE `ims_yz_work_wechat_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊηuserid',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊηεη§°',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊε€΄ε',
  `external_type` int(11) NOT NULL DEFAULT '0' COMMENT 'ε€ι¨θη³»δΊΊηη±»εοΌ1θ‘¨η€Ίθ―₯ε€ι¨θη³»δΊΊζ―εΎ?δΏ‘η¨ζ·οΌ2θ‘¨η€Ίθ―₯ε€ι¨θη³»δΊΊζ―δΌδΈεΎ?δΏ‘η¨ζ·',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT 'ε€ι¨θη³»δΊΊζ§ε« 0-ζͺη₯ 1-η·ζ§ 2-ε₯³ζ§',
  `unionid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊε¨εΎ?δΏ‘εΌζΎεΉ³ε°ηε―δΈθΊ«δ»½ζ θ―οΌεΎ?δΏ‘unionidοΌ',
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊηθδ½',
  `corp_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊζε¨δΌδΈηη?η§°οΌδ»ε½θη³»δΊΊη±»εζ―δΌδΈεΎ?δΏ‘η¨ζ·ζΆζζ­€ε­ζ?΅',
  `corp_full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊζε¨δΌδΈηδΈ»δ½εη§°οΌδ»ε½θη³»δΊΊη±»εζ―δΌδΈεΎ?δΏ‘η¨ζ·ζΆζζ­€ε­ζ?΅',
  `external_profile` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε€ι¨θη³»δΊΊηθͺε?δΉε±η€ΊδΏ‘ζ―οΌδ»ε½θη³»δΊΊη±»εζ―δΌδΈεΎ?δΏ‘η¨ζ·ζΆζζ­€ε­ζ?΅',
  `is_member` int(11) DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε€ι¨θη³»δΊΊδΏ‘ζ―';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_follow_user`;
CREATE TABLE `ims_yz_work_wechat_customer_follow_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε·₯ηuserid',
  `external_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊηuserid',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯εε·₯ε―Ήζ­€ε€ι¨θη³»δΊΊηε€ζ³¨',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯εε·₯ε―Ήζ­€ε€ι¨θη³»δΊΊηζθΏ°',
  `customer_create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ·»ε ζ­€ε€ι¨θη³»δΊΊηζΆι΄',
  `remark_corp_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯εε·₯ε―Ήζ­€ε?’ζ·ε€ζ³¨ηδΌδΈεη§°',
  `remark_mobiles` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯εε·₯ε―Ήζ­€ε?’ζ·ε€ζ³¨ηζζΊε·η ',
  `oper_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εθ΅·ζ·»ε ηuseridοΌε¦ζζεδΈ»ε¨ζ·»ε οΌδΈΊζεηuseridοΌε¦ζζ―ε?’ζ·δΈ»ε¨ζ·»ε οΌεδΈΊε?’ζ·ηε€ι¨θη³»δΊΊuseridοΌε¦ζζ―ει¨ζεε±δΊ«/η?‘ηεειοΌεδΈΊε―ΉεΊηζε/η?‘ηεuserid\n',
  `tag_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯ζεζ·»ε ζ­€ε€ι¨θη³»δΊΊζζδΌδΈζ η­ΎηidοΌδ»δΌδΈθ?Ύη½?οΌtypeδΈΊ1οΌηζ η­ΎθΏε',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT 'θ―₯ζεζ·»ε ζ­€ε€ι¨θη³»δΊΊηζΆι΄',
  `add_way` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ―₯ζεζ·»ε ζ­€ε?’ζ·ηζ₯ζΊοΌε·δ½ε«δΉθ―¦θ§model',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΌδΈθͺε?δΉηstateεζ°',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'ηΆζ:1ζ­£εΈΈ -1θ’«ε ι€οΌ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_customer_follow_user_external_userid_index` (`external_userid`),
  KEY `yz_work_wechat_customer_follow_user_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘δΌδΈεε·₯εζ·»ε ε?’ζ·ηε³η³»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_follow_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_follow_user_tag`;
CREATE TABLE `ims_yz_work_wechat_customer_follow_user_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `tag_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ η­Ύid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'ζ η­Ύε',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'create_time',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `group_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη»ζ η­Ύid',
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη»ζ η­Ύε',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `shop_tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεζ η­ΎID',
  `shop_tag_group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεζ η­Ύη»ID',
  `group_order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ η­Ύη»ζεΊ',
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_customer_follow_user_tag_shop_tag_id_index` (`shop_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ζ·»ε ε?’ζ·ηεε·₯εζ η­Ύε³η³»θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_refresh_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_refresh_log`;
CREATE TABLE `ims_yz_work_wechat_customer_refresh_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈid',
  `start_time` int(11) NOT NULL COMMENT 'εΌε§ζΆι΄',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΎθ―·ζ± 1ε·²θ―·ζ±',
  `ids` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εε·₯ID',
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε?’ζ·ζ°ζ?',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈε?’ζ·η?‘η-ζ΄ζ°ζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_customer_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_customer_tag`;
CREATE TABLE `ims_yz_work_wechat_customer_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `tag_group` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ η­Ύζ°ζ?',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ζ η­Ύθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_department
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_department`;
CREATE TABLE `ims_yz_work_wechat_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `dep_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘εε»Ίηι¨ι¨id',
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_en` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι¨ι¨θ±ζε',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘ηΆι¨ι¨id',
  `dep_order` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘ε¨ηΆι¨ι¨δΈ­ηζ¬‘εΊεΌ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ι¨ι¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_employee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_employee`;
CREATE TABLE `ims_yz_work_wechat_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΌδΈεΎ?δΏ‘userid',
  `avatar_mediaid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€΄εε°ε',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¨ζ·εη§°',
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¨ζ·ζ΅η§°',
  `gender` int(11) NOT NULL DEFAULT '1' COMMENT 'ζ§ε«γ1θ‘¨η€Ίη·ζ§οΌ2θ‘¨η€Ίε₯³ζ§',
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζζΊε·',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'email',
  `department` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'η¨ζ·ζε±ι¨ι¨,δ½Ώη¨ιε·ιεΌ,ε­η¬¦δΈ²ζ ΌεΌε­ε¨',
  `position` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θε‘δΏ‘ζ―',
  `is_leader_in_dept` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '1θ‘¨η€ΊδΈΊδΈηΊ§,0θ‘¨η€Ίζ?ιζε(ιδΈηΊ§)',
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΊ§ζΊ',
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ε°ε',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΏζ΄»ηΆζ: -1=ε·²ε ι€οΌ1=ε·²ζΏζ΄»οΌ2=ε·²η¦η¨οΌ4=ζͺζΏζ΄»οΌ5=ιεΊδΌδΈ',
  `extattr` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'θͺε?δΉε­ζ?΅',
  `external_profile` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζεε―Ήε€ε±ζ§',
  `external_position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε―Ήε€θε‘',
  `main_department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΈ»ι¨ι¨',
  `active_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ζΏζ΄»ζΆι΄',
  `is_allocate` int(11) NOT NULL DEFAULT '0' COMMENT 'η¦»θζ―ε¦ει(1:ε·²ει;0:ζͺει;)',
  `dimission_time` int(11) NOT NULL DEFAULT '0' COMMENT 'η¦»θζΆι΄',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ιθ?―ε½ζεδΏ‘ζ―';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat`;
CREATE TABLE `ims_yz_work_wechat_group_chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `chat_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '	ε?’ζ·ηΎ€ID',
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΎ€ε',
  `owner_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΎ€δΈ»userId',
  `owner_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'ιε?’δΌεuid',
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΎ€ε¬ε',
  `qrcode_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΎ€δΊη»΄η ε°ε',
  `group_created_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΎ€εε»ΊζΆι΄',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-ζζεθ‘¨;1-η¦»θεΎη»§ζΏ;2-η¦»θη»§ζΏδΈ­;3-η¦»θη»§ζΏε?ζ,-99-ε·²θ§£ζ£',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `bind_type` int(11) NOT NULL DEFAULT '1' COMMENT 'ε₯ηΎ€δΌεη»ε?ζΉεΌ 1ιε?’δΌε 2ιθ―·δΌε',
  `is_extra` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦εΌε―η¬η«θ?Ύη½? 0δΈεΌε― 1εΌε―',
  `invite_poster_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘ε₯ηΎ€η ζ΅·ζ₯ID',
  `shop_poster_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εεηΎ€ζε?’ι‘΅ι’δΊη»΄η ζ΅·ζ₯ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε?’ζ·ηΎ€δΏ‘ζ―';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_member`;
CREATE TABLE `ims_yz_work_wechat_group_chat_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `chat_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '	ε?’ζ·ηΎ€ID',
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΎ€ζεid',
  `invitor_userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιθ―·θηuserid',
  `unionid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€ι¨θη³»δΊΊε¨εΎ?δΏ‘εΌζΎεΉ³ε°ηε―δΈθΊ«δ»½ζ θ―οΌεΎ?δΏ‘unionidοΌ',
  `join_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ε ηΎ€ζΆι΄',
  `join_scene` int(11) NOT NULL DEFAULT '0' COMMENT 'ε₯ηΎ€ζΉεΌ:1-η±ζειθ―·ε₯ηΎ€οΌη΄ζ₯ιθ―·ε₯ηΎ€οΌ2 - η±ζειθ―·ε₯ηΎ€οΌιθΏιθ―·ιΎζ₯ε₯ηΎ€οΌ3 - ιθΏζ«ζηΎ€δΊη»΄η ε₯ηΎ€',
  `member_type` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεη±»ε:1 - δΌδΈζε;2 - ε€ι¨θη³»δΊΊ',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηΆζ:0-ιηΎ€,1-ζ­£εΈΈ',
  `withdraw_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ζθΏδΈζ¬‘ιεΊζΆι΄',
  `withdraw_scene` int(11) NOT NULL DEFAULT '-1' COMMENT 'ι»θ?€-1ζ²‘ιηΎ€οΌιηΎ€ζΉεΌ0-θͺε·±ιηΎ€,1-ηΎ€δΈ»/ηΎ€η?‘ηεη§»εΊ',
  `we_nickname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εΎ?δΏ‘εε­,δΈ΄ζΆε­ζΎ,εε»ΊδΌεεε°±ζ²‘η¨δΊ',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_old` int(11) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦θδΌε 1ζ― 0δΈζ―',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε?’ζ·ηΎ€ζεδΏ‘ζ―';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ η­Ύε',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ η­ΎζεΊοΌεΌθΆε°δΌεηΊ§θΆι«',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ζΎη€ΊοΌ0ε¦1ζ―',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'εη»id',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BnsId` (`uniacid`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε?’ζ·ηΎ€ζ η­Ύ(ιδΌδΈεΎ?δΏ‘tag_id)';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag_bind
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag_bind`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_chat_id` int(11) NOT NULL COMMENT 'ε?’ζ·ηΎ€id',
  `tag_id` int(11) NOT NULL COMMENT 'ηΎ€ζ η­Ύid(ιδΌδΈεΎ?δΏ‘tag_id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε?’ζ·ηΎ€ζ η­Ύ';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_chat_tag_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_chat_tag_group`;
CREATE TABLE `ims_yz_work_wechat_group_chat_tag_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εη»εη§°',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊοΌεΌθΆε°δΌεηΊ§θΆι«',
  `is_show` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'ζ―ε¦ζΎη€Ί',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ids_Uni_BnsId` (`uniacid`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε?’ζ·ηΎ€ζ η­Ύη»οΌιδΌδΈεΎ?δΏ‘ζ η­ΎοΌ';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_code`;
CREATE TABLE `ims_yz_work_wechat_group_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θͺε?δΉεζ°',
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΌδΈεΎ?δΏ‘ηΎ€ID',
  `uid` int(11) NOT NULL COMMENT 'ιθ―·δΊΊδΌεIDοΌ0δΈΊεε°ηζδΈζ ζε?ηΎ€η»ε?δΌε',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0εΎη‘?θ?€ 1ζ­£εΈΈ -1εΎε ι€ -2ε·²ε ι€',
  `config_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΌδΈεΎ?δΏ‘ε₯ηΎ€η ID',
  `code_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ε₯ηΎ€η ιΎζ₯',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_group_code_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζε?’-ε₯ηΎ€ιθ―·η εθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_member_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_member_log`;
CREATE TABLE `ims_yz_work_wechat_group_member_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `unionid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionID',
  `userid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηΎ€ζεID',
  `invite_userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ιθ―·δΊΊζεIDοΌδ»ε½ει¨ζεζΆε­ε¨',
  `uid` int(11) NOT NULL COMMENT 'ηΎ€δΌεδΌεID',
  `invite_uid` int(11) NOT NULL COMMENT 'ιθ―·δΊΊε³θδΌεID,δ»ε½ιθΏδΊη»΄η θΏε₯δΈε­ε¨stateζΆε­ε¨',
  `join_time` int(11) NOT NULL COMMENT 'ε₯ηΎ€ζΆι΄',
  `chat_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ηΎ€ID',
  `join_scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ε₯ηΎ€ζΉεΌ 0ζͺη₯ 1ηΎ€ζεη΄ζ₯ιθ―· 2ηΎ€ζειθ―·ιΎζ₯ 3δΊη»΄η ',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε₯ηΎ€ζ θ―',
  `type` tinyint(4) NOT NULL COMMENT 'θ?°ε½ζΉεΌ 1εθ° 2εε°εζ­₯',
  `is_build` tinyint(4) NOT NULL COMMENT 'ζ―ε¦η¬¬δΈζ¬‘θΏηΎ€ 0δΈζ― 1ζ―',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_member_unique` (`chat_id`,`join_time`,`userid`),
  KEY `yz_work_wechat_group_member_log_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζε?’-ε₯ηΎ€θ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_group_poster
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_group_poster`;
CREATE TABLE `ims_yz_work_wechat_group_poster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL COMMENT 'δΌδΈID',
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΅·ζ₯ιΎζ₯',
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζ΅·ζ₯θ·―εΎ',
  `code_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌδΈεΎ?δΏ‘ε₯ηΎ€η ID',
  `uid` int(11) NOT NULL COMMENT 'δΌεID',
  `chat_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'δΌδΈεΎ?δΏ‘ηΎ€ID',
  `group_id` int(11) NOT NULL COMMENT 'ηΎ€ID',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yz_work_wechat_group_poster_uniacid_index` (`uniacid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηΎ€ζε?’-ζ΅·ζ₯θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_platform_crop
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_platform_crop`;
CREATE TABLE `ims_yz_work_wechat_platform_crop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'η?‘ηεuid',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `logo_img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'ηΆζοΌ1ζ­£εΈΈοΌ-1εη¨',
  `member_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεuid',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `auth_plugins` text COLLATE utf8mb4_unicode_ci COMMENT 'ζζεΊη¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ε¬εΈεΊη¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_platform_crop_apply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_platform_crop_apply`;
CREATE TABLE `ims_yz_work_wechat_platform_crop_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'η?‘ηεuid',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `logo_img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0εΎε?‘ζ ΈοΌ1ιθΏοΌ2ε?‘ζ Έε€±θ΄₯',
  `finish_time` int(11) DEFAULT NULL COMMENT 'ε?‘ζ Έε€ηζΆι΄',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΉ³ε°η?‘η-ε?‘ζ Έη³θ―·θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role`;
CREATE TABLE `ims_yz_work_wechat_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'θ§θ²εη§°',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:ε―η¨οΌ-1:η¦η¨',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘θ§θ²η?‘η';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role_data_permission`;
CREATE TABLE `ims_yz_work_wechat_role_data_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `permission_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζιkey',
  `permission_val` int(11) NOT NULL DEFAULT '0' COMMENT 'ζιvalue:0-ζ οΌ1-θͺε·±οΌ2-θͺε·±εδΈε±οΌ3-ι¨ι¨οΌ101-ε¨ι¨',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘θ§θ²ζ°ζ?ζιζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_role_permission`;
CREATE TABLE `ims_yz_work_wechat_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζιkey',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘θ§θ²εθ½ζιζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user`;
CREATE TABLE `ims_yz_work_wechat_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'εη«―ζδ½εθ‘¨uid',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ζδ½εζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user_data_permission`;
CREATE TABLE `ims_yz_work_wechat_user_data_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `permission_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζιkey',
  `permission_val` int(11) NOT NULL DEFAULT '0' COMMENT 'ζιvalue:0-ζ οΌ1-θͺε·±οΌ2-θͺε·±εδΈε±οΌ3-ι¨ι¨οΌ101-ε¨ι¨',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ζδ½εζ°ζ?ζιζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_work_wechat_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_work_wechat_user_permission`;
CREATE TABLE `ims_yz_work_wechat_user_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `uid` int(11) NOT NULL DEFAULT '0',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ζιkey',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='δΌδΈεΎ?δΏ‘ζδ½εεθ½ζιζ°ζ?θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_wq_version_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wq_version_log`;
CREATE TABLE `ims_yz_wq_version_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ζ§θ‘θΏηηζ¬ε·',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_card_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_card_ticket`;
CREATE TABLE `ims_yz_wx_card_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¬δΌε·',
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘εΈid',
  `card_type` tinyint(4) DEFAULT '1' COMMENT 'ε‘εΈη±»ε',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘εΈlogo',
  `wx_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎ?δΏ‘ε‘εΈlogo',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εε?Άεη§°',
  `background_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘εΈε°ι’εΎη',
  `wx_background_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εΎ?δΏ‘ε‘εΈε°ι’εΎη',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε‘εΈε°ι’ι’θ²',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ ι’',
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδ½ζι',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'δ½Ώη¨θ―΄ζ',
  `prerogative` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ηΉζθ―΄ζ',
  `date_info` tinyint(4) DEFAULT NULL COMMENT 'ζζζΆι΄',
  `time_limit` tinyint(4) DEFAULT NULL COMMENT 'ε―η¨ζΆζ?΅',
  `service_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε?’ζη΅θ―',
  `text_image_list` text COLLATE utf8mb4_unicode_ci COMMENT 'εΎζδ»η»',
  `custom_cell1` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺε?δΉε₯ε£1',
  `custom_cell2` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺε?δΉε₯ε£2',
  `custom_cell3` text COLLATE utf8mb4_unicode_ci COMMENT 'θͺε?δΉε₯ε£3',
  `custom_entry` text COLLATE utf8mb4_unicode_ci COMMENT 'ε?’ζ·θͺε?δΉε₯ε£',
  `promotion_entry` text COLLATE utf8mb4_unicode_ci COMMENT 'θ₯ιθͺε?δΉε₯ε£',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_video_like_set
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_video_like_set`;
CREATE TABLE `ims_yz_wx_video_like_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `power_type` int(11) NOT NULL DEFAULT '1',
  `power_textarea` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open_relation` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_template_type` int(11) NOT NULL DEFAULT '1',
  `in_host` int(11) NOT NULL DEFAULT '1',
  `send_member_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_wx_video_link_list
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_wx_video_link_list`;
CREATE TABLE `ims_yz_wx_video_link_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '1',
  `member_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_media_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb_media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `news_media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '1',
  `article_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `msg_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `msg_data_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_ys_system_assets_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_assets_log`;
CREATE TABLE `ims_yz_ys_system_assets_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) NOT NULL COMMENT 'δΌεid',
  `income_type` int(11) DEFAULT NULL COMMENT 'ζΆε₯η±»εοΌ1ζΆε₯-1ζ―εΊ',
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΈε‘η±»ε',
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ηΌε·',
  `change_value` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εε¨εΌ',
  `before_assets` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εε¨εθ΅δΊ§',
  `after_assets` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'εε¨εθ΅δΊ§',
  `assets_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ΅δΊ§η±»ε',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―΄ζ',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'θ―·ζ±ιθ――',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ιη₯ηΆζοΌ0ζͺιη₯γ1ε·²ιη₯γ-1ιη₯ε€±θ΄₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `member_id_idx` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26038 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--θ΅δΊ§εε¨θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_ys_system_category_import_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_category_import_log`;
CREATE TABLE `ims_yz_ys_system_category_import_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `category_id` int(11) DEFAULT NULL COMMENT 'εη±»id',
  `ys_category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉεη±»idζ θ―',
  `ys_category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉεη±»εη§°',
  `level` int(11) DEFAULT NULL COMMENT 'εη±»ηΊ§ε«',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--εη±»ε―Όε₯θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_ys_system_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_goods`;
CREATE TABLE `ims_yz_ys_system_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `goods_id` int(11) DEFAULT '0' COMMENT 'εεID',
  `ys_goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'η¬¬δΈζΉεεID',
  `shop_id` int(11) DEFAULT '0' COMMENT 'η¬¬δΈζΉεΊιΊID',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `goods_idx` (`goods_id`),
  KEY `ys_goods_idx` (`ys_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--εεε³θθ‘¨';

-- ----------------------------
-- Table structure for ims_yz_ys_system_help_edit_data
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_help_edit_data`;
CREATE TABLE `ims_yz_ys_system_help_edit_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `plugin_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζδ»Άη±»ε',
  `crm_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉid',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ιΎζ₯',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT 'δ»£ηΌθΎεε?Ή',
  `member_id` int(11) DEFAULT NULL COMMENT 'ε½ε±δΌεid',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT 'ζθΏ°',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ηΆζοΌ0ζͺε½ε±1ε·²ε½ε±',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--δ»£ηΌθΎδΏ‘ζ―θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_ys_system_history_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_history_order`;
CREATE TABLE `ims_yz_ys_system_history_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `ys_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉθ?’εζ θ―',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εηΆζ',
  `parameter` text COLLATE utf8mb4_unicode_ci COMMENT 'θ―·ζ±ε―Όε₯εζ°',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT 'ζθΏ°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `status_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εε²θ?’εηΆζ',
  `logistic` text COLLATE utf8mb4_unicode_ci COMMENT 'η©ζ΅εΏ«ιδΏ‘ζ―',
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`),
  KEY `ys_order_idx` (`ys_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--ε―Όε₯εε²θ?’ε';

-- ----------------------------
-- Table structure for ims_yz_ys_system_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_member`;
CREATE TABLE `ims_yz_ys_system_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `member_id` int(11) DEFAULT NULL COMMENT 'δΌεid',
  `ys_member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉδΌεζ θ―',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζζΊε·',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `member_id_idx` (`member_id`),
  KEY `ys_member_id_idx` (`ys_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--δΌεε³θθ?°ε½θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_ys_system_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_member_level`;
CREATE TABLE `ims_yz_ys_system_member_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΌεη­ηΊ§id',
  `ys_level_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉδΌεη­ηΊ§ζ θ―',
  `ys_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉδΌεη­ηΊ§ηΊ§ε«',
  `ys_level_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉδΌεη­ηΊ§εη§°',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `level_id_idx` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--δΌεη­ηΊ§θ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_ys_system_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_order`;
CREATE TABLE `ims_yz_ys_system_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `order_id` int(11) DEFAULT NULL COMMENT 'θ?’εID',
  `ys_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'η¬¬δΈζΉθ?’εζ θ―',
  `order_price` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT 'θ?’ειι’',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'θ?’εηΆζ',
  `mark` text COLLATE utf8mb4_unicode_ci COMMENT 'ε€ζ³¨',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `refund_order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ’θ΄§θ?’εid',
  `refund_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ’θ΄§ε?εid',
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`),
  KEY `order_idx` (`order_id`),
  KEY `ys_order_idx` (`ys_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--θ?’εε―θ‘¨';

-- ----------------------------
-- Table structure for ims_yz_ys_system_push_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_ys_system_push_record`;
CREATE TABLE `ims_yz_ys_system_push_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL COMMENT 'ε¬δΌε·ID',
  `record_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ζ₯ε£θ―·ζ±ε°ε',
  `parameter` text COLLATE utf8mb4_unicode_ci COMMENT 'ζ¨ιζ°ζ?',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'εεΊιθ――',
  `push_num` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ζ¨ιηΆζοΌ500γ1ε·²θ―·ζ±γ-1ζ¨ιε€±θ΄₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid_idx` (`uniacid`)
) ENGINE=InnoDB AUTO_INCREMENT=1336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ηηη³»η»--ζ¨ιθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_chats
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_chats`;
CREATE TABLE `ims_yz_yun_chat_chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-ζε­,1-εΎη,2-εε,3-θ?’ε,4-θ½¬εζΆζ―',
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-ζͺθ―»,1-ε·²θ―»',
  `direction_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-ειη»η¨ζ·,1-ειη»ε?’ζ',
  `is_system_send` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ―η³»η»δ»£ζΏε?’ζειοΌ0-ε¦,1-ζ―',
  `is_system_opt` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ―η³»η»ζδ½ηζΆζ―οΌ0-ε¦,1-ζ―',
  `is_backed` int(11) NOT NULL DEFAULT '0' COMMENT 'ζ―ε¦ζ€εζ―οΌ0-ε¦,1-ζ―',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT 'queueθ‘¨id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_common_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_common_reply`;
CREATE TABLE `ims_yz_yun_chat_common_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `employee_id` int(11) NOT NULL DEFAULT '0' COMMENT '0-ιη¨εε€,ε€§δΊ0ζ―ε?’ζδΈͺδΊΊη',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_crop_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_crop_settings`;
CREATE TABLE `ims_yz_yun_chat_crop_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `agent_limit` int(11) NOT NULL DEFAULT '-1' COMMENT 'ιεΆεεΈ­ζ°οΌι»θ?€-1δΈιεΆ',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `free_agent_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'εθ΄ΉεεΈ­ιεΆζ°',
  `agent_alloc_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'εεΈ­ιεΆζ°ζΉεΌ:0-ζΆθ΄ΉεεΈ­δΌε;1-εθ΄ΉεεΈ­δΌε',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT 'εεΈ­ε°ζζΆι΄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε?’ζδΌδΈθ?Ύη½?';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_employee
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_employee`;
CREATE TABLE `ims_yz_yun_chat_employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `leader_id` int(11) NOT NULL DEFAULT '0' COMMENT 'δΈηΊ§ι’ε―ΌID',
  `work_wechat_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_employeeθ‘¨id',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ε?’ζη»Id',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε€΄ε',
  `agent_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εεΈ­ID',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'ηΆζοΌ1-ζ­£εΈΈ,0εη¨',
  `online_status` int(11) NOT NULL DEFAULT '0' COMMENT 'ε¨ηΊΏηΆζοΌ0-η¦»ηΊΏ,1-ε¨ηΊΏ',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT 'δ»η»',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-δΈζ¨θοΌ1-ζ¨θ',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `work_wechat_userid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'δΌδΈεΎ?δΏ‘userid,δ»₯εδΈδ½Ώη¨work_wechat_employee_idε­ζ?΅',
  `agent_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'εεΈ­η±»ε:0-εθ΄ΉεεΈ­;1-ζΆθ΄ΉεεΈ­',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_employee_settings
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_employee_settings`;
CREATE TABLE `ims_yz_yun_chat_employee_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_group`;
CREATE TABLE `ims_yz_yun_chat_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_queue
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_queue`;
CREATE TABLE `ims_yz_yun_chat_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-ζ­£εΈΈ,1-ε·²ε?ζ,2-ι»εε',
  `user_complate` int(11) NOT NULL DEFAULT '0' COMMENT 'ε?’ζ·ε³ι­:0-ζͺε³ι­,1-ε³ι­',
  `employee_complate` int(11) NOT NULL DEFAULT '0' COMMENT 'ε?’ζε³ι­:0-ζͺε³ι­,1-ε³ι­',
  `last_msg_time` int(11) DEFAULT NULL COMMENT 'ζθΏζΆζ―ζΆι΄οΌεδ½οΌζΉδΎΏεη«―ζΎη€Ί',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ims_yz_yun_chat_reply_key_words
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_reply_key_words`;
CREATE TABLE `ims_yz_yun_chat_reply_key_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `words_reply_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_yun_chat_words_replyθ‘¨id',
  `key_word` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε³ι?θ―',
  `match_type` int(11) NOT NULL DEFAULT '2' COMMENT 'εΉιζΉεΌοΌ1-ι¨εεΉι,2-ε?ε¨εΉι',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε³ι?θ―εε€ε³ι?θ―θ‘¨,θΎε©ε³ι?θ―ζ₯ι';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_tool_bar
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_tool_bar`;
CREATE TABLE `ims_yz_yun_chat_tool_bar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `display_order` int(11) NOT NULL DEFAULT '0' COMMENT 'ζεΊ',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'ηΆζοΌ1-ζ­£εΈΈ,0εη¨',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'η±»εοΌ0-ε³ι?θ―εε€,1-ιΎζ₯θ·³θ½¬',
  `key_word_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_yun_chat_reply_key_wordsθ‘¨id',
  `h5_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ι‘΅ι’ιΎζ₯',
  `mini_app_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε°η¨εΊιΎζ₯',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θε€©ε·₯ε·ζ ';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_transfer_log`;
CREATE TABLE `ims_yz_yun_chat_transfer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT 'queueθ‘¨id',
  `from_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ½¬ζ₯δΊΊemployee_id',
  `to_employee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'θ’«θ½¬ζ₯δΊΊemployee_id',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='θ½¬ζ₯ε?’ζθ?°ε½';

-- ----------------------------
-- Table structure for ims_yz_yun_chat_words_reply
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_chat_words_reply`;
CREATE TABLE `ims_yz_yun_chat_words_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `crop_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yz_work_wechat_cropθ‘¨id',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'εη§°',
  `reply_type` int(11) NOT NULL DEFAULT '0' COMMENT 'εε€ζΉεΌοΌ0-ιζΊδΈζ‘,1-ε¨ι¨',
  `key_words` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε³ι?θ―,ιε·εε²',
  `key_words_rule` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ε³ι?θ―θ§ε',
  `reply_contents` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'εε€εε?Ή',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_crop_id` (`crop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ε³ι?θ―εε€';

-- ----------------------------
-- Table structure for ims_yz_yun_sign_switch
-- ----------------------------
DROP TABLE IF EXISTS `ims_yz_yun_sign_switch`;
CREATE TABLE `ims_yz_yun_sign_switch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `switch_platform` tinyint(4) DEFAULT '0' COMMENT 'εΌε³',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='εΉ³ε°εΌε³θ?Ύη½?θ‘¨';
SET FOREIGN_KEY_CHECKS=1;
