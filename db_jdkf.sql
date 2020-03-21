/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_jdkf
Target Host: localhost
Target Database: db_jdkf
Date: 2012-08-30 16:35:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) default NULL,
  `userPw` varchar(50) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(50) default NULL,
  `catelog_del` varchar(50) default NULL,
  PRIMARY KEY  (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_gonggao
-- ----------------------------
CREATE TABLE `t_gonggao` (
  `gonggao_id` int(11) NOT NULL,
  `gonggao_title` varchar(50) default NULL,
  `gonggao_content` varchar(5000) default NULL,
  `gonggao_data` varchar(50) default NULL,
  `gonggao_fabuzhe` varchar(255) default NULL,
  `gonggao_del` varchar(50) default NULL,
  `gonggao_one1` varchar(50) default NULL,
  `gonggao_one2` varchar(50) default NULL,
  `gonggao_one3` varchar(50) default NULL,
  `gonggao_one4` varchar(50) default NULL,
  `gonggao_one5` datetime default NULL,
  `gonggao_one6` datetime default NULL,
  `gonggao_one7` int(11) default NULL,
  `gonggao_one8` int(11) default NULL,
  PRIMARY KEY  (`gonggao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_kefang
-- ----------------------------
CREATE TABLE `t_kefang` (
  `id` int(11) NOT NULL,
  `fangjianhao` varchar(50) default NULL,
  `area` varchar(500) default NULL,
  `jieshao` varchar(50) default NULL,
  `fujian` varchar(50) default NULL,
  `qianshu` int(11) default NULL,
  `catelog_id` int(11) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL,
  `liuyan_title` varchar(50) default NULL,
  `liuyan_content` varchar(5000) default NULL,
  `liuyan_date` varchar(50) default NULL,
  `liuyan_user` varchar(50) default NULL,
  PRIMARY KEY  (`liuyan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_pinglun
-- ----------------------------
CREATE TABLE `t_pinglun` (
  `id` int(11) NOT NULL,
  `kefang_id` int(11) default NULL,
  `content` varchar(50) default NULL,
  `shijian` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ruzhu
-- ----------------------------
CREATE TABLE `t_ruzhu` (
  `id` int(11) NOT NULL default '0',
  `kefang_id` int(11) default NULL,
  `kehuming` varchar(255) default NULL,
  `kehuzheng` varchar(255) default NULL,
  `rushijian` varchar(255) default NULL,
  `lishijian` varchar(255) default NULL,
  `feiyong` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) default NULL,
  `user_pw` varchar(50) default NULL,
  `user_realname` varchar(50) default NULL,
  `user_address` varchar(50) default NULL,
  `user_sex` varchar(50) default NULL,
  `user_tel` varchar(50) default NULL,
  `user_email` varchar(50) default NULL,
  `user_qq` varchar(50) default NULL,
  `fujian` varchar(50) default NULL,
  `user_type` varchar(255) default NULL,
  `user_del` varchar(50) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_yuding
-- ----------------------------
CREATE TABLE `t_yuding` (
  `id` int(11) NOT NULL,
  `userId` int(11) default NULL,
  `kefangId` int(11) default NULL,
  `tianshu` int(11) default NULL,
  `yudingzheTel` varchar(50) default NULL,
  `shijian` varchar(50) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');
INSERT INTO `t_catelog` VALUES ('2', '双人房', 'no');
INSERT INTO `t_catelog` VALUES ('3', '单人房', 'no');
INSERT INTO `t_catelog` VALUES ('4', '标准房', 'no');
INSERT INTO `t_catelog` VALUES ('5', '商务房', 'no');
INSERT INTO `t_gonggao` VALUES ('1', '本酒店部分豪华房8.8折。欢迎预订', '<strong>本酒店部分豪华房8.8折。欢迎预订</strong>', '2012-05-12 10 14:11:23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_gonggao` VALUES ('2', '欢迎预订本酒店客房。预订送大礼', '<strong>欢迎预订本酒店客房。预订送大礼</strong>', '2012-05-12 10 14:11:23', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_kefang` VALUES ('3', '2001', '66', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318250906171.jpg', '200', '3', 'no');
INSERT INTO `t_kefang` VALUES ('4', '2002', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318250996640.jpg', '150', '3', 'no');
INSERT INTO `t_kefang` VALUES ('5', '3001', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251030750.jpg', '300', '4', 'no');
INSERT INTO `t_kefang` VALUES ('6', '3002', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251051078.jpg', '150', '4', 'no');
INSERT INTO `t_kefang` VALUES ('7', '4001', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251154531.jpg', '480', '5', 'no');
INSERT INTO `t_kefang` VALUES ('8', '4002', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251176875.jpg', '150', '5', 'no');
INSERT INTO `t_kefang` VALUES ('9', '5001', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251203312.jpg', '160', '5', 'no');
INSERT INTO `t_kefang` VALUES ('10', '5002', '100', '环境优雅，美国原装进口音响系统，一流点歌系统', '/upload/1318251228437.jpg', '150', '5', 'no');
INSERT INTO `t_ruzhu` VALUES ('1', '3', '刘三', '3713231980', '2012-08-29 16:25', '2012-08-30 16:25', '100');
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '刘三', '北京路', '男', '1355555555', 'liusan@yahoo.cn', '2222', '/upload/1336708799437.jpg', '普通会员', 'no');
INSERT INTO `t_yuding` VALUES ('1', '1', '4', '2', '13555555555', '2012-08-30 16:24', 'yes');
