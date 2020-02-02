/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50549
 Source Host           : localhost:3306
 Source Schema         : redoopbbs

 Target Server Type    : MySQL
 Target Server Version : 50549
 File Encoding         : 65001

 Date: 02/02/2020 15:07:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_action
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action`;
CREATE TABLE `tbl_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '状态，0正常，1禁用',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_action
-- ----------------------------
INSERT INTO `tbl_action` VALUES (1, '2017-11-27 17:24:32', '会员注册', '注册了账号', 0, '2018-04-19 11:21:08');
INSERT INTO `tbl_action` VALUES (2, '2017-11-27 17:24:32', '会员登录', '登录了账号', 0, '2018-04-19 11:21:12');
INSERT INTO `tbl_action` VALUES (3, '2017-11-27 17:24:32', '修改密码', '修改了密码', 0, '2018-04-19 11:21:15');
INSERT INTO `tbl_action` VALUES (4, '2017-11-27 17:24:32', '找回密码', '找回了密码', 0, '2018-04-19 11:21:19');
INSERT INTO `tbl_action` VALUES (5, '2017-11-27 17:24:32', '登录失败', '登录失败', 0, '2018-04-19 11:21:22');
INSERT INTO `tbl_action` VALUES (3001, '2017-11-27 17:24:32', '删除微博', '删除了微博', 1, '2018-03-01 17:00:45');
INSERT INTO `tbl_action` VALUES (3002, '2017-11-27 17:24:32', '删除微博评论', '删除了微博评论', 1, '2018-03-01 17:00:27');
INSERT INTO `tbl_action` VALUES (3003, '2017-11-27 17:24:32', '删除群组', '删除了主题', 0, '2018-04-19 11:22:00');
INSERT INTO `tbl_action` VALUES (3004, '2017-11-27 17:24:32', '删除群组帖子', '删除了主题帖子', 0, '2018-04-19 11:22:13');
INSERT INTO `tbl_action` VALUES (3005, '2017-11-27 17:24:32', '删除群组帖子评论', '删除了帖子评论', 0, '2018-04-19 11:21:26');
INSERT INTO `tbl_action` VALUES (3006, '2017-11-27 17:24:32', '删除文章', '删除文档\n', 0, '2018-04-19 11:22:22');
INSERT INTO `tbl_action` VALUES (3007, '2017-11-27 17:24:32', '删除文章评论', '删除了文档评论', 0, '2018-04-19 11:22:29');
INSERT INTO `tbl_action` VALUES (10001, '2017-11-27 17:24:32', '发布微博', '发布了微博', 1, '2018-03-01 17:01:35');
INSERT INTO `tbl_action` VALUES (10002, '2017-11-27 17:24:32', '群组发帖', '发布了主题帖子', 0, '2018-04-19 11:22:35');
INSERT INTO `tbl_action` VALUES (10003, '2017-11-27 17:24:32', '发布文章', '发布文档', 0, '2018-04-19 11:22:41');

-- ----------------------------
-- Table structure for tbl_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action_log`;
CREATE TABLE `tbl_action_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `action_id` int(11) NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(2) NULL DEFAULT 0,
  `foreign_id` int(11) NULL DEFAULT 0,
  `action_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_action_log_member`(`member_id`) USING BTREE,
  INDEX `fk_action_log_action`(`action_id`) USING BTREE,
  CONSTRAINT `tbl_action_log_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_action_log_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 626 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_action_log
-- ----------------------------
INSERT INTO `tbl_action_log` VALUES (610, '2020-02-02 14:34:46', NULL, 5, '登录用户名：admin，登录密码：admin123', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (611, '2020-02-02 14:35:09', NULL, 5, '登录用户名：admin，登录密码：RedoopAdmin', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (612, '2020-02-02 14:35:15', NULL, 5, '登录用户名：admin，登录密码：redoopadmin', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (613, '2020-02-02 14:36:24', NULL, 5, '登录用户名：huangtianhao，登录密码：huangtianhao', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (614, '2020-02-02 14:38:05', NULL, 5, '登录用户名：admin，登录密码：123456', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (615, '2020-02-02 14:38:09', NULL, 5, '登录用户名：admin，登录密码：admin', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (616, '2020-02-02 14:38:16', NULL, 5, '登录用户名：admin，登录密码：redoopAdmin', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (617, '2020-02-02 14:38:22', NULL, 5, '登录用户名：admin，登录密码：RedoopAdmin', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (618, '2020-02-02 14:38:28', NULL, 5, '登录用户名：admin，登录密码：huangtianhao', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (619, '2020-02-02 14:39:33', 1, 2, '', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (620, '2020-02-02 14:40:08', 1, 3, '', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (621, '2020-02-02 14:41:48', 1, 10002, '', 4, 85, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (622, '2020-02-02 14:43:51', 35, 1, '', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (623, '2020-02-02 14:44:02', 35, 2, '', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (624, '2020-02-02 14:48:39', 1, 2, '', 0, 0, '0:0:0:0:0:0:0:1');
INSERT INTO `tbl_action_log` VALUES (625, '2020-02-02 14:55:14', 1, 10002, '', 4, 86, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for tbl_ads
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ads`;
CREATE TABLE `tbl_ads`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1是图片链接，2是文字链接，3是代码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容，如果是图片链接，该内容为图片地址，如果是文字链接，改内容是文字描述信息，如果是代码，改内容是广告代码',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接，图片链接和文字链接类型时才有效',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_archive
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive`;
CREATE TABLE `tbl_archive`  (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` int(11) NULL DEFAULT 0 COMMENT '发布类型，1是普通文章，2是群组文章',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档标题',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述说明',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `view_rank` int(11) NULL DEFAULT 0 COMMENT '浏览权限，0不限制，1会员',
  `view_count` int(11) NULL DEFAULT 0 COMMENT '浏览次数',
  `writer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `source` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '来源',
  `pub_time` datetime NULL DEFAULT NULL COMMENT '发布日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `last_reply` datetime NULL DEFAULT NULL COMMENT '最后回复时间',
  `can_reply` int(1) NULL DEFAULT 0 COMMENT '是否可以回复，0可以回复，1不可以回复',
  `good_num` int(11) NULL DEFAULT 0 COMMENT '点赞数量',
  `bad_num` int(11) NULL DEFAULT 0 COMMENT '踩数量',
  `check_admin` int(11) NULL DEFAULT 0 COMMENT '审核管理员id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `favor` int(11) NULL DEFAULT 0 COMMENT '喜欢、点赞',
  `htmlcontent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`archive_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_archive
-- ----------------------------
INSERT INTO `tbl_archive` VALUES (92, 0, '第十届中国奶业大会暨2019中国奶业展览会开幕啦！', 1, '2020-02-02 14:41:48', '这是什么样的问题啊！！！', NULL, 0, 8, NULL, NULL, '2020-02-02 14:41:48', '2020-02-02 14:42:11', NULL, NULL, 0, 0, 0, 0, '###我也不知道\n![](/upload/images/20200202//35d01ea4-d25e-4682-8d99-4cb0a5fa9eb8.png)', 1, '<h3 id=\"h3-u6211u4E5Fu4E0Du77E5u9053\"><a name=\"我也不知道\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>我也不知道</h3><p><img src=\"/upload/images/20200202//35d01ea4-d25e-4682-8d99-4cb0a5fa9eb8.png\" alt=\"\"></p>\n');
INSERT INTO `tbl_archive` VALUES (93, 0, 'test02', 1, '2020-02-02 14:55:14', '嗷嗷', NULL, 0, 1, NULL, NULL, '2020-02-02 14:55:14', NULL, NULL, NULL, 0, 0, 0, 0, '``这是什么东东``\n**我也不知道什么东东**\n', 0, '<p><code>这是什么东东</code><br><strong>我也不知道什么东东</strong></p>\n');

-- ----------------------------
-- Table structure for tbl_archive_favor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_favor`;
CREATE TABLE `tbl_archive_favor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `archive_id` int(11) NULL DEFAULT 0,
  `member_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_archive_id_member_id`(`archive_id`, `member_id`) USING BTREE,
  INDEX `fk_archive_favor_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_archive_favor_ibfk_1` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_archive_favor_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_archive_favor
-- ----------------------------
INSERT INTO `tbl_archive_favor` VALUES (37, '2020-02-02 14:50:17', 92, 1);

-- ----------------------------
-- Table structure for tbl_article
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '栏目ID',
  `archive_id` int(11) NULL DEFAULT NULL COMMENT '文章ID',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态，0未审核，1已审核',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_archive`(`archive_id`) USING BTREE,
  INDEX `fk_article_cate`(`cate_id`) USING BTREE,
  CONSTRAINT `tbl_article_ibfk_1` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_article_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `tbl_article_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_cate`;
CREATE TABLE `tbl_article_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NULL DEFAULT 0 COMMENT '上级类目ID，顶级栏目为0',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目名称',
  `status` int(1) NULL DEFAULT 0 COMMENT '0正常，1隐藏',
  `sort` int(11) NULL DEFAULT 50 COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_comment`;
CREATE TABLE `tbl_article_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `article_id` int(11) NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_comment_member`(`member_id`) USING BTREE,
  INDEX `fk_article_comment_article`(`article_id`) USING BTREE,
  CONSTRAINT `tbl_article_comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `tbl_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_article_comment_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_config`;
CREATE TABLE `tbl_config`  (
  `jkey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `jvalue` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`jkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_config
-- ----------------------------
INSERT INTO `tbl_config` VALUES ('cms_post', '1', 'cms会员文章投稿，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('cms_post_review', '1', 'cms投稿审核，0需要审核，1不需要审核');
INSERT INTO `tbl_config` VALUES ('group_alias', '群组', '群组别名');
INSERT INTO `tbl_config` VALUES ('group_apply', '1', '群组是否可以申请，0不可以，1可以');
INSERT INTO `tbl_config` VALUES ('group_apply_review', '1', '群组申请是否需要审核，0需要审核，1不需要审核');
INSERT INTO `tbl_config` VALUES ('member_email_valid', '1', '邮箱验证，0不需要验证，1需要验证');
INSERT INTO `tbl_config` VALUES ('member_login_open', '1', '会员登录开关，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('member_register_open', '1', '会员注册开关，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('site_copyright', 'Copyright © 2013 - 2017.', '版权说明');
INSERT INTO `tbl_config` VALUES ('site_description', '红象大数据社区(Redoop Community)', '网站描述');
INSERT INTO `tbl_config` VALUES ('site_domain', 'www.redoop.com', '网站域名');
INSERT INTO `tbl_config` VALUES ('site_icp', '京ICP备17046370号', '备案号');
INSERT INTO `tbl_config` VALUES ('site_keys', 'Redoop,HDFS,MapReduce,HBase,Hive,Zookeeper,Pig,Ambari,Sqoop,java,Hadoop,CRH,CRF,SPACEP,Cloud,BigData|CASES,CRS,OpenStack,Storm,OpenPower,ARM,Rasie', '网站关键词');
INSERT INTO `tbl_config` VALUES ('site_logo', '/res/common/images/RedoopLogo.png', '网站LOGO');
INSERT INTO `tbl_config` VALUES ('site_name', 'Redoop', '网站名称');
INSERT INTO `tbl_config` VALUES ('site_send_email_account', '787501374@qq.com', '发送邮箱账号');
INSERT INTO `tbl_config` VALUES ('site_send_email_password', 'hth19940511', '发送邮箱密码');
INSERT INTO `tbl_config` VALUES ('site_send_email_smtp', 'smtp.exmail.qq.com', '发送邮箱SMTP服务器地址');
INSERT INTO `tbl_config` VALUES ('site_seo_title', '红象大数据社区', 'SEO标题');
INSERT INTO `tbl_config` VALUES ('site_tongji', '<script>var _hmt = _hmt || [];(function() {var hm = document.createElement(\"script\");hm.src = \"https://hm.baidu.com/hm.js?6e79d941db914e4195f4a839b06f2567\";var s = document.getElementsByTagName(\"script\")[0]; s.parentNode.insertBefore(hm, s);})();</script>', '统计代码');
INSERT INTO `tbl_config` VALUES ('weibo_alias', '微博', '微博别名');
INSERT INTO `tbl_config` VALUES ('weibo_post', '0', '微博发布，0不可以发布，1可以发布');
INSERT INTO `tbl_config` VALUES ('weibo_post_maxcontent', '140', '微博内容字数');

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组名字',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组logo',
  `creator` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `managers` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员',
  `tags` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `can_post` int(11) NULL DEFAULT 0 COMMENT '是否能发帖，0不可以，1可以',
  `topic_review` int(11) NULL DEFAULT 0 COMMENT '帖子是否需要审核，0不需要，1需要',
  `status` int(11) NULL DEFAULT 0 COMMENT '0未审核，1已审核，-1审核不通过',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_group_member`(`creator`) USING BTREE,
  CONSTRAINT `tbl_group_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_group
-- ----------------------------
INSERT INTO `tbl_group` VALUES (11, '2020-02-02 14:41:07', 'testGroup', '/upload/images/20200202/8b767326-ae4a-4b35-8eb5-95e15ee2d2b1.png', 1, '1', '', '简单', 1, 0, 1);

-- ----------------------------
-- Table structure for tbl_group_fans
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_fans`;
CREATE TABLE `tbl_group_fans`  (
  `create_time` datetime NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `uk_group_id_member_id`(`group_id`, `member_id`) USING BTREE,
  INDEX `fk_group_fans_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_group_fans_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_group_fans_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_group_fans
-- ----------------------------
INSERT INTO `tbl_group_fans` VALUES ('2020-02-02 14:41:07', 11, 1);

-- ----------------------------
-- Table structure for tbl_group_topic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_topic`;
CREATE TABLE `tbl_group_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  `archive_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '状态，0未审核，1已审核',
  `is_essence` int(11) NULL DEFAULT 0 COMMENT '精华，0不加精，1加精',
  `is_top` int(11) NULL DEFAULT 0 COMMENT '置顶，0不置顶，1置顶，2超级置顶',
  `groupstatus` int(11) NULL DEFAULT NULL COMMENT 'GroupStatus',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_group_topic_group`(`group_id`) USING BTREE,
  INDEX `fk_group_topic_archive`(`archive_id`) USING BTREE,
  CONSTRAINT `tbl_group_topic_ibfk_1` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_group_topic_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_group_topic
-- ----------------------------
INSERT INTO `tbl_group_topic` VALUES (85, '2020-02-02 14:41:48', 11, 92, 1, 0, 0, 0);
INSERT INTO `tbl_group_topic` VALUES (86, '2020-02-02 14:55:14', 11, 93, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for tbl_group_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_topic_comment`;
CREATE TABLE `tbl_group_topic_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `group_topic_id` int(11) NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `comment_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_group_topic_comment_member`(`member_id`) USING BTREE,
  INDEX `fk_group_topic_comment_group_topic`(`group_topic_id`) USING BTREE,
  CONSTRAINT `tbl_group_topic_comment_ibfk_1` FOREIGN KEY (`group_topic_id`) REFERENCES `tbl_group_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_group_topic_comment_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_group_topic_comment
-- ----------------------------
INSERT INTO `tbl_group_topic_comment` VALUES (14, '2020-02-02 14:49:53', 85, 1, NULL, 'aa');
INSERT INTO `tbl_group_topic_comment` VALUES (15, '2020-02-02 14:50:05', 85, 1, 14, 'qq');

-- ----------------------------
-- Table structure for tbl_link
-- ----------------------------
DROP TABLE IF EXISTS `tbl_link`;
CREATE TABLE `tbl_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前',
  `recomment` int(11) NOT NULL DEFAULT 0 COMMENT '推荐，0不推荐，1推荐',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT 0 COMMENT '分组ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册IP',
  `login_count` int(11) NULL DEFAULT 0 COMMENT '登录次数',
  `curr_login_time` datetime NULL DEFAULT NULL COMMENT '本次登录时间',
  `curr_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本次登录IP',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录IP',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新资料时间',
  `money` double(11, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `score` int(11) NULL DEFAULT 0 COMMENT '积分',
  `is_active` int(1) NULL DEFAULT 0 COMMENT '是否已激活，0未激活，1已激活',
  `status` int(2) NULL DEFAULT 0 COMMENT '-1禁用，0启用',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `addprovince` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '居住省份',
  `addcity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '居住城市',
  `addarea` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '居住地区',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '居住地址',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'QQ',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信',
  `contact_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系手机号',
  `contact_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系邮箱',
  `website` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '个人网站',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '个人介绍',
  `is_admin` int(11) NULL DEFAULT 0 COMMENT '是否管理员，0不是，1是普通管理员，2是超级管理员',
  `follows` int(11) NULL DEFAULT 0 COMMENT '关注会员数量',
  `fans` int(11) NULL DEFAULT 0 COMMENT '粉丝数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_member
-- ----------------------------
INSERT INTO `tbl_member` VALUES (1, 0, 'admin', 'hth_swp@163.com', '13800138000', '46600abaec8f726c05a2c023c7e114d2', '女', '/res/common/images/default-avatar.png', '2020-02-02 14:37:49', '', 2, '2020-02-02 14:48:39', '0:0:0:0:0:0:0:1', '2020-02-02 14:39:33', '0:0:0:0:0:0:0:1', NULL, 0.00, -4, 1, 0, '1971-12-20', '', '', '', '', '8888888', 'admin', '13800138000', 'huangtianhao@redoop.com', 'www.redoop.com', '', 2, 0, 0);
INSERT INTO `tbl_member` VALUES (35, 0, 'huangtianhao', 'swp_hth@163.com', '', '46600abaec8f726c05a2c023c7e114d2', NULL, '/res/common/images/default-avatar.png', '2020-02-02 14:43:51', '0:0:0:0:0:0:0:1', 1, '2020-02-02 14:44:02', '0:0:0:0:0:0:0:1', '2020-02-02 14:43:51', '0:0:0:0:0:0:0:1', NULL, 0.00, 101, 0, 0, NULL, '', '', '', '', '', '', '', '', '', '', 0, 0, 0);

-- ----------------------------
-- Table structure for tbl_member_fans
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_fans`;
CREATE TABLE `tbl_member_fans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `follow_who` int(11) NULL DEFAULT 0,
  `who_follow` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_follow_who_who_follow`(`follow_who`, `who_follow`) USING BTREE,
  INDEX `fk_member_fans_who_follow`(`who_follow`) USING BTREE,
  CONSTRAINT `tbl_member_fans_ibfk_1` FOREIGN KEY (`follow_who`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_member_fans_ibfk_2` FOREIGN KEY (`who_follow`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_member_fans
-- ----------------------------
INSERT INTO `tbl_member_fans` VALUES (1, '2018-01-12 10:15:47', 12, 15);

-- ----------------------------
-- Table structure for tbl_member_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_token`;
CREATE TABLE `tbl_member_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT 0 COMMENT '会员ID',
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `expire_time` datetime NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '状态，0是正常，1是失效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_member_token_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_member_token_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_memgroup
-- ----------------------------
DROP TABLE IF EXISTS `tbl_memgroup`;
CREATE TABLE `tbl_memgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isadmin` int(1) NULL DEFAULT 0 COMMENT '是否是管理组，0不是，1是',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分组名称',
  `fid` int(11) NULL DEFAULT 0 COMMENT '上级分组ID，默认0，0是顶级分组',
  `rankid` int(11) NULL DEFAULT 0 COMMENT '权限ID，0-99是会员权限，100以上是管理员权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `from_member_id` int(11) NULL DEFAULT 0,
  `to_member_id` int(11) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_tag` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `relate_key_id` int(11) NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isread` int(1) NULL DEFAULT 0 COMMENT '是否已读，0未读，1已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_message_from_member`(`from_member_id`) USING BTREE,
  INDEX `fk_message_to_member`(`to_member_id`) USING BTREE,
  INDEX `fk_message_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`from_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_message_ibfk_3` FOREIGN KEY (`to_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_picture
-- ----------------------------
DROP TABLE IF EXISTS `tbl_picture`;
CREATE TABLE `tbl_picture`  (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1是文章图片，2是群组帖子图片，3是微博图片',
  `foreign_id` int(11) NULL DEFAULT NULL COMMENT '外键ID',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `thumbnail_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩小的图片路径',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `width` int(11) NULL DEFAULT 0,
  `height` int(11) NULL DEFAULT 0,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`picture_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_score_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score_detail`;
CREATE TABLE `tbl_score_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT 0 COMMENT '会员ID',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型，0是普通积分增加，1是奖励，2是撤销奖励',
  `score` int(11) NULL DEFAULT 0 COMMENT '变化积分',
  `balance` int(11) NULL DEFAULT 0 COMMENT '账户剩余积分',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `foreign_id` int(11) NULL DEFAULT 0 COMMENT '外键ID',
  `score_rule_id` int(11) NULL DEFAULT 0 COMMENT '积分规则ID',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态，1是成功，0是取消',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_score_detail_member`(`member_id`) USING BTREE,
  INDEX `fk_score_detail_score_rule`(`score_rule_id`) USING BTREE,
  CONSTRAINT `tbl_score_detail_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_score_detail_ibfk_2` FOREIGN KEY (`score_rule_id`) REFERENCES `tbl_score_rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 632 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_score_detail
-- ----------------------------
INSERT INTO `tbl_score_detail` VALUES (41, '2017-11-30 16:29:02', 1, 1, 1, 100001, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (44, '2017-12-01 17:11:40', 1, 1, 1, 100002, '文章投稿 #4', 4, 4, 0);
INSERT INTO `tbl_score_detail` VALUES (48, '2017-12-01 19:50:19', 1, 1, 1, 100003, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (49, '2017-12-01 21:43:25', 1, 2, -1, 100002, '撤销积分奖励 #44', 4, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (50, '2017-12-01 21:47:07', 1, 1, 1, 100003, '文章投稿 #5', 5, 4, 0);
INSERT INTO `tbl_score_detail` VALUES (51, '2017-12-01 21:47:22', 1, 1, 1, 100004, '文章收到喜欢 #5', 5, 6, 1);
INSERT INTO `tbl_score_detail` VALUES (56, '2017-12-05 14:58:15', 1, 1, 1, 100005, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (59, '2017-12-08 09:37:16', 1, 1, 1, 100006, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (60, '2017-12-08 15:08:58', 1, 2, -1, 100005, '撤销积分奖励 #50', 5, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (61, '2017-12-08 15:11:35', 1, 1, 1, 100006, '文章投稿 #6', 6, 4, 0);
INSERT INTO `tbl_score_detail` VALUES (62, '2017-12-08 15:12:02', 1, 1, 1, 100007, '文章投稿 #7', 7, 4, 0);
INSERT INTO `tbl_score_detail` VALUES (63, '2017-12-08 15:13:03', 1, 1, -10, 99997, '申请群组 #1', 1, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (64, '2017-12-08 15:13:37', 1, 1, 1, 99998, '群组发帖 #1', 1, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (65, '2017-12-08 15:14:00', 1, 1, 1, 99999, '群组发帖 #2', 2, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (66, '2017-12-08 15:20:55', 7, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (67, '2017-12-08 15:21:12', 7, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (70, '2017-12-08 15:25:57', 7, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (72, '2017-12-08 15:48:23', 7, 1, 1, 103, '群组发帖 #3', 3, 11, 0);
INSERT INTO `tbl_score_detail` VALUES (73, '2017-12-08 15:49:09', 7, 1, 1, 104, '群组帖子收到喜欢 #3', 3, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (74, '2017-12-08 15:49:11', 7, 2, -1, 103, '撤销积分奖励 #73', 3, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (75, '2017-12-08 15:49:11', 7, 1, 1, 104, '群组帖子收到喜欢 #3', 3, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (76, '2017-12-08 15:49:12', 7, 2, -1, 103, '撤销积分奖励 #75', 3, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (77, '2017-12-08 16:50:16', 1, 1, 1, 100000, '文章投稿 #8', 8, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (78, '2017-12-08 17:00:52', 1, 1, 1, 100001, '文章投稿 #9', 9, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (79, '2017-12-08 17:50:48', 1, 1, 1, 100002, '文章评论 #3', 3, 5, 1);
INSERT INTO `tbl_score_detail` VALUES (80, '2017-12-08 17:51:52', 1, 2, -1, 100001, '撤销积分奖励 #61', 6, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (81, '2017-12-11 08:29:51', 1, 1, 1, 100002, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (82, '2017-12-11 08:42:17', 1, 1, 1, 100003, '文章投稿 #10', 10, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (83, '2017-12-11 10:30:37', 1, 2, -1, 100002, '撤销积分奖励 #62', 7, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (84, '2017-12-11 16:55:59', 1, 1, 1, 100003, '文章投稿 #11', 11, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (85, '2017-12-12 08:40:23', 1, 1, 1, 100004, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (86, '2017-12-12 10:12:34', 1, 1, 1, 100005, '文章投稿 #12', 12, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (87, '2017-12-12 13:37:12', 7, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (88, '2017-12-12 14:08:24', 7, 2, -1, 103, '撤销积分奖励 #72', 3, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (89, '2017-12-12 15:18:08', 7, 1, 1, 104, '群组发帖 #4', 4, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (90, '2017-12-14 10:33:09', 1, 1, 1, 100006, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (91, '2017-12-14 14:20:00', 1, 1, 1, 100007, '群组帖子收到喜欢 #4', 4, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (92, '2017-12-14 14:21:31', 7, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (93, '2017-12-14 15:31:03', 1, 1, 1, 100008, '文章投稿 #13', 13, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (94, '2017-12-14 15:50:30', 1, 1, 1, 100009, '文章投稿 #14', 14, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (95, '2017-12-15 10:35:11', 1, 1, 1, 100010, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (96, '2017-12-15 11:25:22', 1, 1, 1, 100011, '文章投稿 #15', 15, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (97, '2017-12-15 16:06:57', 7, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (98, '2017-12-15 16:11:48', 7, 1, 1, 107, '群组发帖 #5', 5, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (99, '2017-12-15 16:13:27', 7, 1, 1, 108, '群组帖子评论 #1', 1, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (100, '2017-12-18 09:16:27', 1, 1, 1, 100012, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (101, '2017-12-18 10:02:35', 1, 1, 1, 100013, '文章投稿 #16', 16, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (102, '2017-12-18 15:58:35', 1, 1, 1, 100014, '文章收到喜欢 #16', 16, 6, 1);
INSERT INTO `tbl_score_detail` VALUES (103, '2017-12-25 22:59:31', 8, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (104, '2017-12-25 22:59:38', 8, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (105, '2017-12-25 23:00:16', 8, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (106, '2017-12-25 23:03:04', 8, 1, 1, 103, '文章收到喜欢 #10', 10, 6, 1);
INSERT INTO `tbl_score_detail` VALUES (107, '2017-12-27 11:08:23', 1, 1, 1, 100015, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (108, '2017-12-27 20:54:35', 8, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (109, '2018-01-02 14:40:11', 1, 1, 1, 100016, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (110, '2018-01-02 15:39:40', 8, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (111, '2018-01-02 15:57:35', 8, 1, 1, 106, '群组发帖 #6', 6, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (112, '2018-01-04 14:56:36', 1, 1, 1, 100017, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (113, '2018-01-05 09:45:56', 1, 1, 1, 100018, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (114, '2018-01-05 09:46:11', 7, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (115, '2018-01-05 15:47:26', 9, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (116, '2018-01-05 15:47:43', 9, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (117, '2018-01-05 15:48:03', 9, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (118, '2018-01-05 16:49:12', 10, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (119, '2018-01-05 16:49:25', 10, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (120, '2018-01-05 16:51:02', 10, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (121, '2018-01-05 17:00:09', 11, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (122, '2018-01-05 17:00:19', 11, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (123, '2018-01-05 17:00:54', 11, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (124, '2018-01-06 11:55:33', 1, 1, 1, 100019, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (125, '2018-01-06 11:55:58', 1, 1, 1, 100020, '文章投稿 #17', 17, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (126, '2018-01-06 11:56:05', 1, 1, 1, 100021, '文章投稿 #18', 18, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (127, '2018-01-06 15:13:47', 1, 1, 1, 100022, '群组发帖 #7', 7, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (128, '2018-01-06 15:27:34', 7, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (129, '2018-01-06 15:28:36', 7, 1, 1, 111, '群组发帖 #8', 8, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (130, '2018-01-06 15:43:53', 1, 1, 1, 100023, '群组发帖 #9', 9, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (131, '2018-01-06 16:42:02', 1, 1, 1, 100024, '群组发帖 #10', 10, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (132, '2018-01-06 16:43:04', 1, 1, 1, 100025, '群组发帖 #11', 11, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (133, '2018-01-06 16:48:22', 1, 1, 1, 100026, '群组发帖 #12', 12, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (134, '2018-01-06 16:49:07', 1, 1, 1, 100027, '群组发帖 #13', 13, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (135, '2018-01-06 17:05:18', 1, 1, 1, 100028, '群组发帖 #14', 14, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (136, '2018-01-06 17:10:03', 1, 1, 1, 100029, '群组发帖 #15', 15, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (137, '2018-01-06 17:14:27', 1, 1, 1, 100030, '群组发帖 #16', 16, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (138, '2018-01-06 17:17:04', 1, 1, 1, 100031, '群组发帖 #17', 17, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (139, '2018-01-06 17:29:55', 1, 1, 1, 100032, '群组发帖 #18', 18, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (140, '2018-01-06 19:14:16', 1, 1, 1, 100033, '群组发帖 #19', 19, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (141, '2018-01-06 19:27:20', 1, 1, 1, 100034, '群组发帖 #20', 20, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (142, '2018-01-07 15:19:36', 1, 1, 1, 100035, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (143, '2018-01-07 15:19:47', 1, 1, 1, 100036, '群组发帖 #21', 21, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (144, '2018-01-07 16:08:38', 1, 1, 1, 100037, '群组发帖 #22', 22, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (145, '2018-01-07 16:15:47', 1, 1, 1, 100038, '群组发帖 #23', 23, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (146, '2018-01-07 16:31:49', 7, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (147, '2018-01-07 16:31:57', 7, 1, 1, 113, '群组发帖 #24', 24, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (148, '2018-01-07 16:40:06', 1, 1, 1, 100039, '群组发帖 #25', 25, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (149, '2018-01-07 16:57:09', 1, 1, 1, 100040, '群组发帖 #26', 26, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (150, '2018-01-07 17:06:38', 1, 1, 1, 100041, '群组发帖 #27', 27, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (151, '2018-01-07 17:47:01', 1, 1, 1, 100042, '群组发帖 #28', 28, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (152, '2018-01-07 18:12:32', 1, 1, 1, 100043, '群组发帖 #29', 29, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (153, '2018-01-08 08:31:46', 1, 1, 1, 100044, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (154, '2018-01-08 10:11:54', 12, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (155, '2018-01-08 10:12:07', 12, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (156, '2018-01-08 10:12:39', 12, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (157, '2018-01-08 10:14:02', 12, 1, 1, 103, '群组发帖 #3', 3, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (158, '2018-01-08 10:15:24', 13, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (159, '2018-01-08 10:15:37', 13, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (160, '2018-01-08 10:16:03', 13, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (161, '2018-01-08 10:16:14', 14, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (162, '2018-01-08 10:16:34', 14, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (163, '2018-01-08 10:17:26', 14, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (164, '2018-01-08 10:59:41', 15, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (165, '2018-01-08 10:59:56', 15, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (166, '2018-01-08 11:00:23', 15, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (167, '2018-01-08 11:21:39', 16, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (168, '2018-01-08 11:21:52', 16, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (169, '2018-01-08 11:23:44', 16, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (170, '2018-01-08 11:28:56', 8, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (171, '2018-01-08 11:49:19', 17, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (172, '2018-01-08 11:49:40', 17, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (173, '2018-01-08 13:14:33', 1, 1, 1, 100045, '群组发帖 #4', 4, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (174, '2018-01-08 13:17:55', 1, 1, 1, 100046, '群组发帖 #5', 5, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (175, '2018-01-08 14:00:20', 1, 1, 1, 100047, '群组发帖 #6', 6, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (176, '2018-01-08 16:05:40', 10, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (177, '2018-01-08 16:20:43', 18, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (178, '2018-01-08 16:20:58', 18, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (179, '2018-01-08 16:21:52', 18, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (180, '2018-01-08 17:23:44', 8, 1, -10, 97, '申请群组 #2', 2, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (181, '2018-01-09 09:12:41', 15, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (182, '2018-01-09 16:13:00', 19, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (183, '2018-01-09 16:13:12', 19, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (184, '2018-01-09 16:14:14', 19, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (185, '2018-01-10 08:40:03', 20, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (186, '2018-01-10 08:40:12', 20, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (187, '2018-01-10 08:40:39', 20, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (188, '2018-01-10 09:28:22', 21, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (189, '2018-01-10 09:28:32', 21, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (190, '2018-01-10 09:34:49', 21, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (191, '2018-01-10 09:38:47', 21, 1, -10, 92, '申请群组 #3', 3, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (192, '2018-01-11 11:20:21', 1, 1, 1, 100048, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (193, '2018-01-11 11:29:00', 22, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (194, '2018-01-11 11:29:11', 22, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (195, '2018-01-11 11:29:53', 22, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (196, '2018-01-11 11:30:19', 22, 1, -10, 92, '申请群组 #4', 4, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (197, '2018-01-11 21:19:11', 12, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (198, '2018-01-11 21:27:32', 12, 1, 1, 105, '群组发帖 #7', 7, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (199, '2018-01-11 21:35:24', 12, 1, 1, 106, '群组发帖 #8', 8, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (200, '2018-01-11 21:37:29', 12, 1, 1, 107, '群组发帖 #9', 9, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (201, '2018-01-12 08:45:05', 1, 1, 1, 100049, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (202, '2018-01-12 10:15:34', 15, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (203, '2018-01-12 10:16:39', 15, 1, 1, 105, '群组帖子收到喜欢 #9', 9, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (204, '2018-01-12 10:17:09', 15, 1, 1, 106, '群组帖子收到喜欢 #8', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (205, '2018-01-13 11:56:15', 1, 1, 1, 100050, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (206, '2018-01-13 23:44:12', 8, 1, 1, 98, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (207, '2018-01-15 08:51:07', 1, 1, 1, 100051, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (208, '2018-01-16 11:27:38', 22, 1, 1, 93, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (209, '2018-01-16 11:27:48', 22, 1, 1, 94, '群组帖子评论 #1', 1, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (210, '2018-01-16 11:39:56', 22, 1, 1, 95, '群组帖子收到喜欢 #8', 8, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (211, '2018-01-16 11:41:48', 22, 2, -1, 94, '撤销积分奖励 #210', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (212, '2018-01-16 11:41:49', 22, 1, 1, 95, '群组帖子收到喜欢 #8', 8, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (213, '2018-01-16 11:41:54', 22, 2, -1, 94, '撤销积分奖励 #212', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (214, '2018-01-16 11:43:03', 22, 1, 1, 95, '群组帖子收到喜欢 #8', 8, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (215, '2018-01-16 11:43:05', 22, 2, -1, 94, '撤销积分奖励 #214', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (216, '2018-01-16 12:28:25', 22, 1, 1, 95, '群组帖子评论 #2', 2, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (217, '2018-01-16 13:07:15', 22, 1, 1, 96, '群组帖子收到喜欢 #8', 8, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (218, '2018-01-16 13:07:18', 22, 2, -1, 95, '撤销积分奖励 #217', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (219, '2018-01-16 13:07:21', 22, 1, 1, 96, '群组帖子收到喜欢 #8', 8, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (220, '2018-01-16 17:34:58', 1, 1, 1, 100052, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (221, '2018-01-16 17:35:28', 12, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (222, '2018-01-17 09:36:10', 8, 1, 1, 99, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (223, '2018-01-17 10:43:30', 15, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (224, '2018-01-17 10:46:14', 12, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (225, '2018-01-17 20:28:56', 8, 1, 1, 100, '群组帖子评论 #1', 1, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (226, '2018-01-17 20:35:54', 1, 1, 1, 100053, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (227, '2018-01-18 08:27:59', 18, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (228, '2018-01-18 11:09:32', 8, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (229, '2018-01-19 16:19:20', 14, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (230, '2018-01-21 13:12:25', 8, 1, 1, 102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (231, '2018-01-21 13:12:40', 1, 1, 1, 100054, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (232, '2018-01-22 08:40:52', 1, 1, 1, 100055, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (233, '2018-01-22 11:05:03', 13, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (234, '2018-01-22 11:07:26', 14, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (235, '2018-01-22 11:27:16', 22, 1, 1, 97, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (236, '2018-01-22 11:33:19', 13, 1, 1, 104, '群组帖子评论 #1', 1, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (237, '2018-01-22 13:50:33', 1, 1, 1, 100056, '群组帖子评论 #2', 2, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (238, '2018-01-22 18:33:16', 8, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (239, '2018-01-22 19:19:00', 8, 1, 1, 104, '群组帖子收到喜欢 #3', 3, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (240, '2018-01-22 19:19:02', 8, 2, -1, 103, '撤销积分奖励 #239', 3, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (241, '2018-01-22 20:33:04', 8, 1, 1, 104, '群组帖子收到喜欢 #4', 4, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (242, '2018-01-23 16:08:57', 13, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (243, '2018-01-23 17:16:04', 14, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (244, '2018-01-24 08:22:45', 14, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (245, '2018-01-24 15:00:28', 1, 1, -10, 100046, '申请群组 #4', 4, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (246, '2018-01-24 15:04:02', 8, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (247, '2018-01-24 15:10:01', 1, 1, 1, 100047, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (248, '2018-01-25 08:43:04', 22, 1, 1, 98, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (249, '2018-01-25 08:44:17', 1, 1, 1, 100048, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (250, '2018-01-25 10:18:15', 23, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (251, '2018-01-25 10:18:34', 23, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (252, '2018-01-25 10:19:26', 23, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (253, '2018-01-25 10:23:20', 24, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (254, '2018-01-25 10:23:36', 24, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (255, '2018-01-25 10:24:02', 24, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (256, '2018-01-25 10:42:00', 10, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (257, '2018-01-25 13:21:25', 18, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (258, '2018-01-25 13:48:27', 19, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (259, '2018-01-26 09:54:45', 1, 1, 1, 100049, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (260, '2018-01-26 10:16:18', 25, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (261, '2018-01-26 10:16:33', 25, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (262, '2018-01-26 10:16:53', 1, 1, -10, 100039, '申请群组 #5', 5, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (263, '2018-01-26 10:16:57', 25, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (264, '2018-01-26 11:00:34', 18, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (265, '2018-01-26 11:01:00', 18, 1, 1, 106, '群组帖子收到喜欢 #13', 13, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (266, '2018-01-26 11:12:07', 13, 1, 1, 106, '群组帖子收到喜欢 #13', 13, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (267, '2018-01-26 11:12:08', 13, 2, -1, 105, '撤销积分奖励 #266', 13, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (268, '2018-01-26 11:12:10', 13, 1, 1, 106, '群组帖子收到喜欢 #13', 13, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (269, '2018-01-26 11:13:41', 18, 2, -1, 105, '撤销积分奖励 #265', 13, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (270, '2018-01-26 11:13:43', 18, 1, 1, 106, '群组帖子收到喜欢 #13', 13, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (271, '2018-01-26 11:18:07', 12, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (272, '2018-01-26 11:19:15', 1, 1, 1, 100040, '群组帖子收到喜欢 #10', 10, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (273, '2018-01-26 11:20:21', 1, 2, -1, 100039, '撤销积分奖励 #272', 10, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (274, '2018-01-26 11:20:22', 1, 1, 1, 100040, '群组帖子收到喜欢 #10', 10, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (275, '2018-01-26 11:21:23', 21, 1, 1, 93, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (276, '2018-01-26 11:28:04', 15, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (277, '2018-01-26 11:43:18', 8, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (278, '2018-01-26 14:22:51', 19, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (279, '2018-01-27 11:06:30', 8, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (280, '2018-01-28 00:02:28', 8, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (281, '2018-01-29 11:24:26', 15, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (282, '2018-01-30 11:24:48', 7, 1, 1, 114, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (283, '2018-01-30 14:36:44', 1, 1, 1, 100041, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (284, '2018-01-31 09:41:23', 14, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (285, '2018-01-31 17:20:29', 22, 1, 1, 99, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (286, '2018-01-31 17:20:39', 1, 1, 1, 100042, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (287, '2018-02-02 09:44:20', 15, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (288, '2018-02-02 11:37:01', 14, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (289, '2018-02-02 15:06:33', 1, 1, 1, 100043, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (290, '2018-02-02 16:33:07', 25, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (291, '2018-02-03 10:17:35', 22, 1, 1, 100, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (292, '2018-02-03 10:20:52', 25, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (293, '2018-02-03 10:25:48', 19, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (294, '2018-02-03 16:54:27', 1, 1, 1, 100044, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (295, '2018-02-03 21:04:48', 8, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (296, '2018-02-03 21:05:19', 8, 1, 1, 110, '群组帖子评论 #3', 3, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (297, '2018-02-04 19:47:38', 1, 1, 1, 100045, '群组帖子评论 #4', 4, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (298, '2018-02-04 23:30:40', 1, 1, 1, 100046, '群组帖子评论 #5', 5, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (299, '2018-02-05 16:05:06', 1, 1, 1, 100047, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (300, '2018-02-05 16:40:28', 22, 1, 1, 101, '群组帖子收到喜欢 #17', 17, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (301, '2018-02-05 16:58:20', 25, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (302, '2018-02-06 11:37:14', 1, 1, 1, 100048, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (303, '2018-02-08 08:46:53', 25, 1, 1, 106, '群组帖子收到喜欢 #17', 17, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (304, '2018-02-08 08:59:13', 25, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (305, '2018-02-09 11:36:01', 1, 1, 1, 100049, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (306, '2018-02-09 15:21:43', 25, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (307, '2018-02-09 19:14:31', 8, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (308, '2018-02-09 19:42:37', 8, 1, 1, 112, '群组帖子收到喜欢 #19', 19, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (309, '2018-02-14 18:22:47', 8, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (310, '2018-02-22 12:45:01', 8, 1, 1, 114, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (311, '2018-02-24 13:16:14', 8, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (312, '2018-02-25 13:09:26', 8, 1, 1, 116, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (313, '2018-02-25 13:19:44', 25, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (314, '2018-02-25 14:20:28', 11, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (315, '2018-02-25 14:31:43', 15, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (316, '2018-02-25 14:49:11', 1, 1, 1, 100050, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (317, '2018-02-26 08:32:00', 15, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (318, '2018-02-26 08:55:19', 26, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (319, '2018-02-26 08:57:19', 26, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (320, '2018-02-26 09:44:07', 24, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (321, '2018-02-26 14:25:59', 15, 1, 1, 113, '群组帖子收到喜欢 #19', 19, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (322, '2018-02-26 14:26:02', 15, 2, -1, 112, '撤销积分奖励 #321', 19, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (323, '2018-02-26 14:26:02', 15, 1, 1, 113, '群组帖子收到喜欢 #19', 19, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (324, '2018-02-26 14:26:20', 15, 1, 1, 114, '群组帖子收到喜欢 #17', 17, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (325, '2018-02-27 08:58:11', 15, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (326, '2018-02-27 09:06:52', 26, 1, 1, 102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (327, '2018-02-27 09:07:07', 22, 1, 1, 102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (328, '2018-02-27 09:08:31', 16, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (331, '2018-02-27 09:21:46', 11, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (332, '2018-02-27 09:23:11', 1, 1, 1, 100051, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (333, '2018-02-27 09:58:00', 19, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (334, '2018-02-27 10:46:50', 24, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (335, '2018-02-27 10:54:06', 18, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (336, '2018-02-27 11:27:17', 15, 1, 1, 116, '群组帖子收到喜欢 #20', 20, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (337, '2018-02-27 16:33:21', 10, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (338, '2018-02-28 08:57:24', 15, 1, 1, 117, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (339, '2018-02-28 11:18:29', 16, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (340, '2018-02-28 13:24:01', 9, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (341, '2018-02-28 15:25:35', 1, 1, 1, 100052, '群组帖子收到喜欢 #28', 28, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (342, '2018-02-28 15:25:41', 1, 1, 1, 100053, '群组帖子收到喜欢 #26', 26, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (343, '2018-02-28 15:30:50', 1, 1, 1, 100054, '群组帖子收到喜欢 #23', 23, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (344, '2018-02-28 15:30:57', 1, 1, 1, 100055, '群组帖子收到喜欢 #25', 25, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (345, '2018-02-28 15:30:59', 1, 2, -1, 100054, '撤销积分奖励 #344', 25, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (346, '2018-02-28 15:31:00', 1, 1, 1, 100055, '群组帖子收到喜欢 #25', 25, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (347, '2018-02-28 15:31:30', 1, 1, 1, 100056, '群组帖子收到喜欢 #21', 21, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (348, '2018-02-28 16:49:14', 23, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (349, '2018-03-01 08:33:08', 15, 1, 1, 118, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (350, '2018-03-01 08:34:37', 1, 1, 1, 100057, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (351, '2018-03-01 14:25:20', 14, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (352, '2018-03-02 09:05:56', 15, 1, 1, 119, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (353, '2018-03-02 10:11:08', 22, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (354, '2018-03-02 14:25:27', 24, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (355, '2018-03-02 15:59:02', 19, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (356, '2018-03-02 16:12:10', 19, 1, 1, 108, '群组帖子收到喜欢 #23', 23, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (357, '2018-03-02 16:12:11', 19, 2, -1, 107, '撤销积分奖励 #356', 23, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (358, '2018-03-02 16:12:12', 19, 1, 1, 108, '群组帖子收到喜欢 #23', 23, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (359, '2018-03-02 17:16:32', 1, 1, 1, 100058, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (360, '2018-03-04 05:29:02', 28, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (361, '2018-03-04 05:30:30', 28, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (362, '2018-03-04 05:30:55', 28, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (363, '2018-03-04 05:32:54', 28, 1, 1, 103, '群组帖子评论 #6', 6, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (364, '2018-03-05 10:38:59', 19, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (365, '2018-03-05 18:31:15', 1, 1, 1, 100059, '群组帖子收到喜欢 #32', 32, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (366, '2018-03-06 09:12:07', 15, 1, 1, 120, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (367, '2018-03-06 14:49:33', 29, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (368, '2018-03-06 14:49:45', 29, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (369, '2018-03-06 15:03:41', 29, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (370, '2018-03-07 09:28:50', 15, 1, 1, 121, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (371, '2018-03-07 11:47:15', 13, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (372, '2018-03-07 14:32:38', 23, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (373, '2018-03-07 15:45:48', 30, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (374, '2018-03-07 15:45:57', 30, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (375, '2018-03-07 15:46:32', 30, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (376, '2018-03-07 19:18:53', 1, 1, 1, 100060, '群组帖子评论 #7', 7, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (377, '2018-03-07 19:19:10', 8, 1, 1, 117, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (378, '2018-03-08 08:53:19', 15, 1, 1, 122, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (379, '2018-03-08 09:15:52', 14, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (380, '2018-03-08 16:33:47', 25, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (381, '2018-03-09 08:55:02', 15, 1, 1, 123, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (382, '2018-03-09 09:08:05', 25, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (383, '2018-03-09 14:31:16', 24, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (384, '2018-03-09 18:04:23', 24, 1, 1, 107, '群组帖子收到喜欢 #29', 29, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (385, '2018-03-09 18:04:24', 24, 2, -1, 106, '撤销积分奖励 #384', 29, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (386, '2018-03-09 18:04:25', 24, 1, 1, 107, '群组帖子收到喜欢 #29', 29, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (387, '2018-03-10 08:45:29', 15, 1, 1, 124, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (388, '2018-03-10 11:21:31', 25, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (389, '2018-03-10 16:30:01', 1, 1, 1, 100061, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (390, '2018-03-10 18:41:38', 8, 1, -10, 107, '申请群组 #6', 6, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (391, '2018-03-10 18:43:07', 8, 1, -10, 97, '申请群组 #7', 7, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (392, '2018-03-10 18:43:56', 8, 1, 1, 98, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (393, '2018-03-10 18:45:50', 8, 1, 1, 99, '群组帖子评论 #8', 8, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (394, '2018-03-12 08:53:47', 11, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (395, '2018-03-12 09:03:52', 15, 1, 1, 125, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (396, '2018-03-12 09:31:08', 13, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (397, '2018-03-12 17:12:18', 8, 1, 1, 100, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (398, '2018-03-13 10:33:41', 15, 1, 1, 126, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (399, '2018-03-13 10:34:26', 24, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (400, '2018-03-13 10:49:25', 1, 1, 1, 100062, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (401, '2018-03-13 16:11:25', 11, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (402, '2018-03-14 08:48:00', 15, 1, 1, 127, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (403, '2018-03-14 16:20:02', 31, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (404, '2018-03-14 16:20:10', 31, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (405, '2018-03-14 16:29:01', 31, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (406, '2018-03-14 19:55:02', 8, 1, 1, 101, '群组帖子评论 #9', 9, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (407, '2018-03-15 10:41:45', 15, 1, 1, 128, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (408, '2018-03-16 09:18:26', 15, 1, 1, 129, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (409, '2018-03-16 10:29:27', 24, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (410, '2018-03-16 13:50:00', 32, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (411, '2018-03-16 13:50:10', 32, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (412, '2018-03-19 08:50:04', 15, 1, 1, 130, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (413, '2018-03-20 11:34:09', 15, 1, 1, 131, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (414, '2018-03-20 18:52:28', 11, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (415, '2018-03-21 08:58:13', 15, 1, 1, 132, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (416, '2018-03-21 15:09:16', 18, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (417, '2018-03-21 18:53:55', 11, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (418, '2018-03-22 09:11:13', 15, 1, 1, 133, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (419, '2018-03-22 10:57:35', 25, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (420, '2018-03-22 14:22:46', 11, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (421, '2018-03-23 08:36:13', 18, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (422, '2018-03-23 08:58:41', 15, 1, 1, 134, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (423, '2018-03-23 15:40:47', 11, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (424, '2018-03-23 17:01:07', 25, 1, 1, 114, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (425, '2018-03-23 17:01:16', 25, 2, -1, 113, '撤销积分奖励 #303', 17, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (426, '2018-03-23 17:01:18', 25, 1, 1, 114, '群组帖子收到喜欢 #17', 17, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (427, '2018-03-25 17:47:44', 11, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (428, '2018-03-26 08:56:49', 26, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (429, '2018-03-26 08:56:58', 26, 1, 1, 104, '群组帖子收到喜欢 #39', 39, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (430, '2018-03-26 09:02:55', 15, 1, 1, 135, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (431, '2018-03-26 18:41:04', 11, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (432, '2018-03-27 09:52:28', 15, 1, 1, 136, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (433, '2018-03-27 10:01:41', 19, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (434, '2018-03-28 09:02:43', 15, 1, 1, 137, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (435, '2018-03-28 09:40:04', 19, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (436, '2018-03-29 09:26:09', 15, 1, 1, 138, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (437, '2018-03-29 09:51:31', 26, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (438, '2018-03-29 11:30:32', 24, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (439, '2018-03-29 13:58:04', 1, 1, 1, 100063, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (440, '2018-03-29 14:06:34', 22, 1, 1, 104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (441, '2018-03-29 14:33:06', 8, 1, 1, 102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (442, '2018-03-30 08:47:48', 15, 1, 1, 139, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (443, '2018-03-30 15:56:02', 16, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (444, '2018-03-30 16:06:36', 1, 1, 1, 100064, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (445, '2018-03-30 17:09:16', 8, 1, 1, 103, '群组帖子评论 #10', 10, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (446, '2018-03-30 17:09:32', 25, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (447, '2018-04-03 09:30:48', 16, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (448, '2018-04-03 09:54:24', 15, 1, 1, 140, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (449, '2018-04-04 09:09:18', 15, 1, 1, 141, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (450, '2018-04-04 14:48:17', 1, 1, 1, 100065, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (451, '2018-04-04 16:25:15', 22, 1, 1, 105, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (452, '2018-04-04 16:32:54', 25, 1, 1, 116, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (453, '2018-04-06 14:08:20', 8, 1, -10, 93, '申请群组 #8', 8, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (454, '2018-04-06 14:08:49', 1, 1, 1, 100066, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (455, '2018-04-08 09:19:32', 22, 1, 1, 106, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (456, '2018-04-08 10:38:22', 19, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (457, '2018-04-08 10:56:24', 25, 1, 1, 117, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (458, '2018-04-08 15:17:00', 16, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (459, '2018-04-09 08:34:56', 22, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (460, '2018-04-09 11:07:49', 25, 1, 1, 118, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (461, '2018-04-09 11:38:48', 22, 2, -1, 106, '撤销积分奖励 #300', 17, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (462, '2018-04-09 11:38:49', 22, 1, 1, 107, '群组帖子收到喜欢 #17', 17, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (463, '2018-04-11 09:17:42', 25, 1, 1, 119, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (464, '2018-04-11 09:19:15', 22, 1, 1, 108, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (465, '2018-04-11 11:37:10', 1, 1, 1, 100067, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (466, '2018-04-11 12:32:24', 8, 1, 1, 94, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (467, '2018-04-12 08:57:21', 25, 1, 1, 120, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (468, '2018-04-12 10:23:21', 1, 1, 1, 100068, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (469, '2018-04-12 10:23:48', 1, 1, 1, 100069, '文章投稿 #1', 1, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (470, '2018-04-12 11:40:45', 8, 1, 1, 95, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (471, '2018-04-13 09:25:50', 1, 1, 1, 100070, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (472, '2018-04-13 11:17:42', 25, 1, 1, 121, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (473, '2018-04-13 21:04:26', 1, 1, 1, 100071, '文章投稿 #2', 2, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (474, '2018-04-15 12:19:28', 1, 1, 1, 100072, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (475, '2018-04-16 08:24:55', 22, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (476, '2018-04-16 11:44:50', 1, 1, 1, 100073, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (477, '2018-04-16 13:02:03', 25, 1, 1, 122, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (478, '2018-04-16 14:45:24', 25, 1, 1, 123, '群组发帖 #48', 48, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (479, '2018-04-18 14:54:59', 1, 1, 1, 100074, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (480, '2018-04-19 11:17:33', 1, 1, 1, 100075, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (481, '2018-04-20 17:03:08', 1, 1, 1, 100076, '文章投稿 #3', 3, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (482, '2018-04-20 17:09:48', 1, 1, 1, 100077, '文章投稿 #4', 4, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (483, '2018-04-20 17:13:42', 22, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (484, '2018-04-20 17:16:02', 1, 1, 1, 100078, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (485, '2018-04-20 19:05:56', 8, 1, 1, 96, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (486, '2018-04-23 09:12:41', 25, 1, 1, 124, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (487, '2018-04-24 11:31:52', 25, 1, 1, 125, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (488, '2018-04-24 11:33:46', 25, 1, 1, 126, '群组发帖 #49', 49, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (489, '2018-04-24 13:15:28', 13, 1, 1, 109, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (490, '2018-04-24 13:16:00', 13, 1, 1, 110, '群组发帖 #50', 50, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (491, '2018-04-25 08:49:01', 1, 1, 1, 100079, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (492, '2018-04-25 08:50:57', 7, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (493, '2018-04-25 13:44:30', 25, 1, 1, 127, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (494, '2018-04-25 13:56:03', 25, 1, 1, 128, '群组发帖 #51', 51, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (495, '2018-04-27 11:21:27', 8, 1, 1, 97, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (496, '2018-04-27 11:30:09', 25, 1, 1, 129, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (497, '2018-04-27 14:16:45', 1, 1, 1, 100080, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (498, '2018-04-27 15:50:29', 25, 1, 1, 130, '文章投稿 #3', 3, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (499, '2018-04-28 09:26:11', 25, 1, 1, 131, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (500, '2018-04-28 14:51:14', 1, 1, 1, 100081, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (501, '2018-04-28 15:34:03', 25, 1, 1, 132, '群组发帖 #52', 52, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (502, '2018-04-28 16:15:35', 8, 1, 1, 98, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (503, '2018-04-28 16:19:42', 14, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (504, '2018-04-28 16:24:11', 14, 1, 1, 112, '文章投稿 #4', 4, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (505, '2018-04-28 17:14:42', 13, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (506, '2018-04-28 17:15:41', 13, 1, 1, 112, '文章投稿 #5', 5, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (507, '2018-04-29 22:14:23', 8, 1, 1, 99, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (508, '2018-04-29 22:14:57', 1, 1, 1, 100082, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (509, '2018-04-29 22:15:16', 1, 1, 1, 100083, '群组帖子评论 #11', 11, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (510, '2018-04-30 10:40:50', 8, 1, 1, 100, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (511, '2018-05-02 08:59:53', 1, 1, 1, 100084, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (512, '2018-05-02 11:09:30', 8, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (513, '2018-05-03 08:49:42', 25, 1, 1, 133, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (514, '2018-05-08 10:08:04', 13, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (515, '2018-05-09 14:15:56', 13, 1, 1, 114, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (516, '2018-05-09 14:18:49', 13, 1, 1, 115, '群组发帖 #53', 53, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (517, '2018-05-17 16:19:20', 1, 1, 1, 100085, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (518, '2018-05-21 11:19:56', 8, 1, 1, 102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (519, '2018-05-21 15:33:12', 25, 1, 1, 134, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (520, '2018-05-28 10:34:50', 1, 1, 1, 100086, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (521, '2018-05-31 11:30:37', 1, 1, 1, 100087, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (522, '2018-06-01 09:37:25', 1, 1, 1, 100088, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (523, '2018-06-05 14:41:39', 24, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (524, '2018-06-05 15:09:55', 24, 1, 1, 112, '群组发帖 #54', 54, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (525, '2018-06-08 13:54:20', 25, 1, 1, 135, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (526, '2018-06-09 18:22:47', 8, 1, 1, 103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (527, '2018-06-09 18:23:50', 8, 1, 1, 104, '群组发帖 #55', 55, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (528, '2018-06-10 16:24:42', 8, 1, 1, 105, '群组发帖 #56', 56, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (529, '2018-06-10 22:17:59', 8, 1, 1, 106, '群组帖子收到喜欢 #56', 56, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (530, '2018-06-12 09:11:48', 8, 1, 1, 107, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (531, '2018-06-12 10:43:44', 24, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (532, '2018-06-13 18:06:31', 8, 1, 1, 108, '群组发帖 #57', 57, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (533, '2018-06-13 22:46:30', 8, 1, 1, 109, '群组帖子评论 #12', 12, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (534, '2018-06-22 10:17:33', 25, 1, 1, 136, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (535, '2018-06-25 10:12:45', 1, 1, 1, 100089, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (536, '2018-07-04 14:12:00', 19, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (537, '2018-07-11 15:45:07', 18, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (538, '2018-07-18 16:58:29', 1, 1, 1, 100090, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (539, '2018-07-19 18:49:37', 8, 1, 1, 110, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (540, '2018-07-24 15:54:35', 1, 1, 1, 100091, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (541, '2018-07-26 14:41:02', 1, 1, 1, 100092, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (542, '2018-08-22 17:23:22', 1, 1, 1, 100093, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (543, '2018-09-04 10:23:49', 1, 1, 1, 100094, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (544, '2018-09-04 10:24:59', 22, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (545, '2018-09-13 19:25:02', 8, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (546, '2018-09-13 19:36:07', 8, 1, 1, 112, '群组发帖 #58', 58, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (547, '2018-09-20 13:47:29', 8, 1, 1, 113, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (548, '2018-09-20 13:49:16', 8, 1, 1, 114, '群组发帖 #59', 59, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (549, '2018-09-26 15:19:35', 8, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (550, '2018-09-26 18:31:23', 33, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (551, '2018-09-26 18:31:29', 33, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (552, '2018-09-26 18:31:52', 33, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (553, '2018-09-28 10:04:33', 25, 1, 1, 137, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (554, '2018-09-28 10:30:05', 25, 1, 1, 138, '群组发帖 #60', 60, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (555, '2018-10-11 14:42:58', 8, 1, 1, 116, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (556, '2018-10-17 11:49:50', 18, 1, 1, 111, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (557, '2018-10-23 10:06:37', 1, 1, 1, 100095, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (558, '2018-10-26 12:57:07', 25, 1, 1, 139, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (559, '2018-11-02 11:11:09', 34, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (560, '2018-11-02 11:11:19', 34, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (561, '2018-11-02 11:12:00', 34, 1, 1, 102, '邮箱认证', 0, 2, 1);
INSERT INTO `tbl_score_detail` VALUES (562, '2018-11-30 18:40:33', 8, 1, 1, 117, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (563, '2018-11-30 18:41:16', 8, 1, 1, 118, '群组发帖 #61', 61, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (564, '2018-12-05 11:06:44', 1, 1, 1, 100096, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (565, '2018-12-05 11:07:37', 1, 1, 1, 100097, '文章投稿 #6', 6, 4, 1);
INSERT INTO `tbl_score_detail` VALUES (566, '2018-12-11 18:22:56', 1, 1, 1, 100098, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (567, '2019-01-03 13:37:49', 25, 1, 1, 140, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (568, '2019-01-03 13:58:34', 25, 1, 1, 141, '群组发帖 #62', 62, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (569, '2019-01-05 19:32:26', 8, 1, 1, 119, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (570, '2019-01-05 19:34:25', 8, 1, 1, 120, '群组发帖 #63', 63, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (571, '2019-01-05 21:18:16', 8, 1, 1, 121, '群组发帖 #64', 64, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (572, '2019-01-06 20:05:47', 8, 1, 1, 122, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (573, '2019-01-09 15:06:34', 8, 1, 1, 123, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (574, '2019-01-09 15:10:45', 8, 1, 1, 124, '群组帖子收到喜欢 #18', 18, 13, 0);
INSERT INTO `tbl_score_detail` VALUES (575, '2019-01-09 15:10:49', 8, 2, -1, 123, '撤销积分奖励 #574', 18, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (576, '2019-01-09 15:10:50', 8, 1, 1, 124, '群组帖子收到喜欢 #18', 18, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (577, '2019-01-09 15:12:03', 22, 1, 1, 112, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (578, '2019-01-09 15:18:09', 22, 1, 1, 113, '群组发帖 #65', 65, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (579, '2019-01-09 22:20:33', 8, 1, 1, 125, '群组发帖 #66', 66, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (580, '2019-01-09 22:53:26', 8, 1, 1, 126, '群组发帖 #67', 67, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (581, '2019-01-10 04:30:51', 8, 1, 1, 127, '群组发帖 #68', 68, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (582, '2019-01-10 12:09:00', 1, 1, 1, 100099, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (583, '2019-01-14 17:01:47', 1, 1, 1, 100100, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (584, '2019-01-15 11:03:12', 1, 1, 1, 100101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (585, '2019-01-15 17:14:43', 22, 1, 1, 114, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (586, '2019-01-16 00:30:12', 8, 1, 1, 128, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (587, '2019-01-16 15:17:07', 1, 1, 1, 100102, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (588, '2019-01-19 15:44:01', 8, 1, 1, 129, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (589, '2019-01-19 15:51:30', 8, 1, 1, 130, '群组发帖 #69', 69, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (590, '2019-01-24 13:54:58', 8, 1, 1, 131, '群组发帖 #70', 70, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (591, '2019-01-24 16:54:57', 8, 1, 1, 132, '群组发帖 #71', 71, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (592, '2019-01-24 17:43:46', 8, 1, 1, 133, '群组发帖 #72', 72, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (593, '2019-01-24 17:53:40', 8, 1, 1, 134, '群组发帖 #73', 73, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (594, '2019-01-24 18:08:57', 8, 1, 1, 135, '群组帖子收到喜欢 #73', 73, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (595, '2019-01-24 18:09:37', 8, 1, 1, 136, '群组帖子收到喜欢 #72', 72, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (596, '2019-01-24 18:09:43', 8, 1, 1, 137, '群组帖子收到喜欢 #70', 70, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (597, '2019-01-24 18:09:48', 8, 1, 1, 138, '群组帖子收到喜欢 #67', 67, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (598, '2019-01-24 22:35:58', 8, 1, 1, 139, '群组发帖 #74', 74, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (599, '2019-01-24 23:10:41', 8, 1, 1, 140, '群组发帖 #75', 75, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (600, '2019-01-27 13:26:00', 8, 1, 1, 141, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (601, '2019-02-11 19:36:57', 8, 1, 1, 142, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (602, '2019-02-11 19:38:05', 8, 1, 1, 143, '群组发帖 #76', 76, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (603, '2019-02-12 18:42:38', 8, 1, 1, 144, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (604, '2019-02-12 18:44:21', 8, 1, -10, 134, '申请群组 #9', 9, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (605, '2019-02-12 18:46:25', 8, 1, -10, 124, '申请群组 #10', 10, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (606, '2019-02-12 18:47:23', 8, 1, 1, 125, '群组发帖 #77', 77, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (607, '2019-02-18 13:20:38', 1, 1, 1, 100103, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (608, '2019-02-19 14:03:38', 25, 1, 1, 142, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (609, '2019-02-19 14:04:06', 25, 1, 1, 143, '群组帖子评论 #13', 13, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (610, '2019-02-19 16:18:02', 8, 1, 1, 126, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (611, '2019-02-19 18:04:17', 8, 1, 1, 127, '群组发帖 #78', 78, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (612, '2019-02-20 01:01:46', 8, 1, 1, 128, '群组发帖 #79', 79, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (613, '2019-02-20 10:59:22', 8, 1, 1, 129, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (614, '2019-02-21 23:45:53', 8, 1, 1, 130, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (615, '2019-02-22 00:01:56', 8, 1, 1, 131, '群组发帖 #80', 80, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (616, '2019-02-22 00:29:35', 8, 1, 1, 132, '群组发帖 #81', 81, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (617, '2019-02-22 00:33:37', 8, 1, 1, 133, '群组发帖 #82', 82, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (618, '2019-02-22 00:35:42', 8, 1, 1, 134, '群组发帖 #83', 83, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (619, '2019-02-22 00:41:35', 8, 1, 1, 135, '群组发帖 #84', 84, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (620, '2019-02-26 16:14:47', 22, 1, 1, 115, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (621, '2019-02-26 16:16:30', 1, 1, 1, 100104, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (622, '2019-02-28 09:22:06', 22, 1, 1, 116, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (623, '2020-02-02 14:39:33', 1, 1, 1, 1, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (624, '2020-02-02 14:41:07', 1, 1, -10, -9, '申请群组 #11', 11, 10, 1);
INSERT INTO `tbl_score_detail` VALUES (625, '2020-02-02 14:41:48', 1, 1, 1, -8, '群组发帖 #85', 85, 11, 1);
INSERT INTO `tbl_score_detail` VALUES (626, '2020-02-02 14:43:51', 35, 1, 100, 100, '注册奖励', 0, 1, 1);
INSERT INTO `tbl_score_detail` VALUES (627, '2020-02-02 14:44:02', 35, 1, 1, 101, '每天登陆奖励', 0, 3, 1);
INSERT INTO `tbl_score_detail` VALUES (628, '2020-02-02 14:49:53', 1, 1, 1, -7, '群组帖子评论 #14', 14, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (629, '2020-02-02 14:50:05', 1, 1, 1, -6, '群组帖子评论 #15', 15, 12, 1);
INSERT INTO `tbl_score_detail` VALUES (630, '2020-02-02 14:50:17', 1, 1, 1, -5, '群组帖子收到喜欢 #85', 85, 13, 1);
INSERT INTO `tbl_score_detail` VALUES (631, '2020-02-02 14:55:14', 1, 1, 1, -4, '群组发帖 #86', 86, 11, 1);

-- ----------------------------
-- Table structure for tbl_score_rule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score_rule`;
CREATE TABLE `tbl_score_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '规则名称',
  `score` int(11) NULL DEFAULT 0 COMMENT '变化积分',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'unlimite' COMMENT '奖励次数类型，day每天一次，week每周一次，month每月一次，year每年一次，one只有一次，unlimite不限次数',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_score_rule
-- ----------------------------
INSERT INTO `tbl_score_rule` VALUES (1, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '注册奖励', 100, '注册奖励', 'one', 0);
INSERT INTO `tbl_score_rule` VALUES (2, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '邮箱认证', 1, '邮箱认证奖励积分，只有一次', 'one', 1);
INSERT INTO `tbl_score_rule` VALUES (3, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '每天登陆奖励', 1, '每天登陆奖励积分，一天仅限一次', 'day', 0);
INSERT INTO `tbl_score_rule` VALUES (4, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章投稿', 1, '文章投稿奖励积分，如需审核，审核之后奖励', 'unlimite', 0);
INSERT INTO `tbl_score_rule` VALUES (5, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章评论', 1, '评论文章奖励积分', 'unlimite', 0);
INSERT INTO `tbl_score_rule` VALUES (6, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章收到喜欢', 1, '文章收到喜欢，作者奖励积分', 'unlimite', 0);
INSERT INTO `tbl_score_rule` VALUES (7, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '发布微博', 1, '发布微博奖励积分', 'unlimite', 1);
INSERT INTO `tbl_score_rule` VALUES (8, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '评论微博', 1, '评论微博奖励积分', 'unlimite', 1);
INSERT INTO `tbl_score_rule` VALUES (9, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '微博收到点赞', 1, '微博收到点赞，作者奖励积分', 'unlimite', 1);
INSERT INTO `tbl_score_rule` VALUES (10, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '申请群组', -10, '申请群组扣除/奖励积分，如需要扣除积分，请填写负数', 'unlimite', 1);
INSERT INTO `tbl_score_rule` VALUES (11, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组发帖', 1, '群组发帖奖励积分，如需审核，审核之后奖励', 'unlimite', 0);
INSERT INTO `tbl_score_rule` VALUES (12, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组帖子评论', 1, '群组帖子评论奖励积分', 'unlimite', 0);
INSERT INTO `tbl_score_rule` VALUES (13, '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组帖子收到喜欢', 1, '群组帖子收到喜欢奖励积分', 'unlimite', 0);

-- ----------------------------
-- Table structure for tbl_validate_code
-- ----------------------------
DROP TABLE IF EXISTS `tbl_validate_code`;
CREATE TABLE `tbl_validate_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 0,
  `type` int(1) NULL DEFAULT 0 COMMENT '1是重置密码，2会员激活',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_validate_code
-- ----------------------------
INSERT INTO `tbl_validate_code` VALUES (1, '2017-12-08 15:24:51', '787501374@qq.com', '140006', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (2, '2017-12-08 15:25:13', 'haowenju@redoop.com', '221916', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (3, '2017-12-08 15:46:25', '787501374@qq.com', '274433', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (4, '2017-12-25 22:59:42', 'tongxiaojun@redoop.com', '114737', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (5, '2018-01-05 15:47:49', 'pangxinyou@redoop.com', '385369', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (6, '2018-01-05 16:50:20', 'niuhaisheng@redoop.com', '348850', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (7, '2018-01-05 17:00:24', 'zhangxing@redoop.com', '580595', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (8, '2018-01-08 10:12:20', 'sundafei@redoop.com', '807650', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (9, '2018-01-08 10:15:48', 'xingweidong@redoop.com', '152288', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (10, '2018-01-08 10:17:03', 'niuxin@redoop.com', '359770', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (11, '2018-01-08 11:00:01', 'wangchunli@redoop.com', '512312', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (12, '2018-01-08 11:21:57', 'sunweijian@redoop.com', '554548', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (13, '2018-01-08 16:21:03', 'zhaoshuai@redoop.com', '897090', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (14, '2018-01-09 16:13:27', 'sulongfei@redoop.com', '248278', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (15, '2018-01-10 08:40:16', 'liuxin@redoop.com', '790339', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (16, '2018-01-10 09:28:40', 'panbo@redoop.com', '485145', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (17, '2018-01-11 11:29:13', 'HTH_SWP@163.com', '763927', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (18, '2018-01-25 10:19:03', 'houjinxia@redoop.com', '261086', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (19, '2018-01-25 10:23:42', 'songxiaolei@redoop.com', '680210', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (20, '2018-01-26 10:16:37', 'mazeteng@redoop.com', '920727', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (21, '2018-01-26 11:27:03', 'wangchunli@redoop.com', 'e71b6e1bf0364a26b3cb4dc90990c8fa', 1, 1);
INSERT INTO `tbl_validate_code` VALUES (22, '2018-02-05 16:57:07', 'mazeteng@redoop.com', '0e38a33b8cdf4096b79499f34f97dcc8', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (23, '2018-02-05 16:57:13', 'mazeteng@redoop.com', '572b6af138e94588b82c05eb30febb56', 1, 1);
INSERT INTO `tbl_validate_code` VALUES (24, '2018-02-25 17:05:59', 'songxiaolei@redoop.com', '9617bb82f0044c578e490642755540cc', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (25, '2018-02-25 17:06:22', 'songxiaolei@redoop.com', 'b534ad544e1d4b63866e8d20a66a74de', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (26, '2018-02-25 17:30:59', 'songxiaolei@redoop.com', '2ac5de969cee46d9b0fe60284d904492', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (27, '2018-02-26 09:01:19', 'wangyabin@redoop.com', '543321', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (28, '2018-02-26 09:05:08', 'wangyabin@redoop.com', '130275', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (29, '2018-02-26 09:05:37', 'wangyabin@redoop.com', '993394', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (30, '2018-02-26 09:08:09', 'wangyabin@redoop.com', '357929', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (31, '2018-02-26 09:09:12', 'wangyabin@redoop.com', '352806', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (32, '2018-02-26 09:11:27', 'wangyabin@redoop.com', '280426', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (33, '2018-02-26 09:17:51', 'songxiaolei@redoop.com', 'e15b98792b8b4b14b080eb8487c0ecaf', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (34, '2018-02-26 09:23:02', 'songxiaolei@redoop.com', 'a430764a2e804cafa5a5cf8926b6108c', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (35, '2018-02-26 13:54:59', 'wangyabin@redoop.com', '225127', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (36, '2018-02-27 09:06:54', 'wangyabin@redoop.com', '606847', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (37, '2018-02-27 09:09:09', 'wangyabin@redoop.com', '651252', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (38, '2018-02-27 09:12:19', 'wangyabin@redoop.com', '966533', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (39, '2018-02-27 09:20:45', '787501374@qq.com', '981808', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (40, '2018-02-27 09:44:26', '787501374@qq.com', '914466', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (41, '2018-02-27 09:45:07', '787501374@qq.com', '910904', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (42, '2018-02-27 09:45:45', '787501374@qq.com', '329832', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (43, '2018-02-27 09:46:06', 'wangyabin@redoop.com', '317956', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (44, '2018-02-27 09:49:47', 'wangyabin@redoop.com', '172151', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (45, '2018-02-27 09:50:14', 'wangyabin@redoop.com', '230571', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (46, '2018-02-27 10:25:46', 'wangyabin@redoop.com', '790156', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (47, '2018-02-27 10:37:24', 'wangyabin@redoop.com', '784061', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (48, '2018-02-27 10:44:00', 'wangyabin@redoop.com', '443214', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (49, '2018-02-27 15:39:28', '787501374@qq.com', '977a937c47244ed791365b9c78c58bc8', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (50, '2018-03-02 10:10:15', 'hth_swp@163.com', '4cfa34189b7a4011b97a610c853f3817', 1, 1);
INSERT INTO `tbl_validate_code` VALUES (51, '2018-03-04 05:30:35', '747146282@qq.com', '918990', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (52, '2018-03-06 15:03:10', 'leixianp@163.com', '227232', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (53, '2018-03-07 15:46:07', '2993001710@qq.com', '752548', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (54, '2018-03-14 16:28:11', 'guoxiaopei@redoop.com', '140409', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (55, '2018-03-16 13:50:15', 'silver@163.com', '538448', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (56, '2018-04-25 08:50:26', 'haowenju@redoop.com', '786d09bf90bb42fc8681bfb28c336b67', 1, 1);
INSERT INTO `tbl_validate_code` VALUES (57, '2018-09-26 18:31:32', '303064157@qq.com', '480399', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (58, '2018-11-02 11:11:24', '526107212@qq.com', '335619', 1, 2);
INSERT INTO `tbl_validate_code` VALUES (59, '2019-02-26 16:15:29', 'huangtianhao@redoop.com', '4d9bbbfa465c4fc38e518cd8f5166908', 1, 1);
INSERT INTO `tbl_validate_code` VALUES (60, '2020-02-02 14:38:53', 'hth_swp@163.com', 'c02e3bc9ce394a9597ad615c99443382', 0, 1);
INSERT INTO `tbl_validate_code` VALUES (61, '2020-02-02 14:44:04', 'swp_hth@163.com', '227266', 0, 2);
INSERT INTO `tbl_validate_code` VALUES (62, '2020-02-02 14:44:23', 'swp_hth@163.com', '267896', 0, 2);

-- ----------------------------
-- Table structure for tbl_weibo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo`;
CREATE TABLE `tbl_weibo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` int(11) NULL DEFAULT 0 COMMENT '0为普通文本,1为图片',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `favor` int(11) NULL DEFAULT 0 COMMENT '赞',
  `status` tinyint(11) NULL DEFAULT 0 COMMENT '0未审核，1已审核，-1审核不通过',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_weibo_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_weibo_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_weibo_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo_comment`;
CREATE TABLE `tbl_weibo_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT 0,
  `weibo_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论的id',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0正常，1禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_weibo_comment_member`(`member_id`) USING BTREE,
  INDEX `fk_weibo_comment_weibo`(`weibo_id`) USING BTREE,
  CONSTRAINT `tbl_weibo_comment_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_weibo_comment_ibfk_2` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_weibo_favor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo_favor`;
CREATE TABLE `tbl_weibo_favor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `weibo_id` int(11) NULL DEFAULT 0,
  `member_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_weibo_id_member_id`(`weibo_id`, `member_id`) USING BTREE,
  INDEX `fk_weibo_favor_member`(`member_id`) USING BTREE,
  CONSTRAINT `tbl_weibo_favor_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_weibo_favor_ibfk_2` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
