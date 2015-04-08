/*
Navicat MySQL Data Transfer

Source Server         : 172.30.100.12
Source Server Version : 50528
Source Host           : 172.30.100.12:3388
Source Database       : reportdb

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-04-08 19:48:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for scrm_seller_attribute
-- ----------------------------
DROP TABLE IF EXISTS `scrm_seller_attribute`;
CREATE TABLE `scrm_seller_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名',
  `fieldtype` varchar(50) NOT NULL DEFAULT 'varchar' COMMENT '字段类型：字符-varchar，数字-number，枚举-enum，日期-date',
  `tablename` varchar(50) NOT NULL DEFAULT 'Fact_seller' COMMENT '检索数据用的表名',
  `fieldname` varchar(50) NOT NULL DEFAULT '' COMMENT '被检索的数据源表中列名',
  `fieldkey` varchar(50) NOT NULL DEFAULT '' COMMENT '返回结果表中列名',
  `desc` varchar(200) DEFAULT '' COMMENT '字段描述信息',
  `created` datetime NOT NULL DEFAULT '2014-07-01 16:28:29' COMMENT '创建时间',
  `attrtype` tinyint(2) NOT NULL DEFAULT '1' COMMENT '属性分类 1.基本情况筛选集合; 2.登陆注册频次筛选集合; 3.产品信息筛选条件集合; 4.订单GMV筛选条件集合',
  `isdisplay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='卖家的属性字段表';

-- ----------------------------
-- Records of scrm_seller_attribute
-- ----------------------------
INSERT INTO `scrm_seller_attribute` VALUES ('1', '卖家ID', 'varchar', 'FACT_SELLER', 'SUPPLIERID', 'supplierid', '', '2014-07-01 13:00:00', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('2', '卖家昵称', 'varchar', 'FACT_SELLER', 'NICKNAME', 'nickname', '', '2014-07-01 13:00:00', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('3', '卖家姓名', 'varchar', 'FACT_SELLER', 'FULLNAME', 'fullname', '', '2014-07-01 13:00:00', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('4', '注册时间', 'date', 'FACT_SELLER', 'CREATEDON', 'createdon', '', '2014-07-01 13:00:00', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('5', '注册来源', 'enum', 'FACT_SELLER', 'SELLER_REG_SOURCE_ID', 'seller_reg_source_id', '', '2014-07-01 13:00:00', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('6', '认证状态', 'enum', 'FACT_SELLER', 'STATE', 'state', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('7', '是否通过手机验证', 'enum', 'FACT_SELLER', 'AUTHMOBILEDATE', 'authmobiledate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('8', '是否通过邮箱验证', 'enum', 'FACT_SELLER', 'AUTHMAILDATE', 'authmaildate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('9', '关联账号数量', 'number', 'FACT_SELLER', 'ACCLINK_QTY', 'acclink_qty', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('10', '卖家分类', 'enum', 'FACT_SELLER', 'IDENTITY_TYPE', 'identity_type', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('11', '商户评级', 'enum', 'FACT_SELLER', 'LEVEL_ID', 'level_id', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('12', '会员级别', 'enum', 'FACT_SELLER', 'SERVICEID', 'serviceid', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('13', '处罚状况', 'enum', 'FACT_SELLER', 'SELLERPUNISHID', 'sellerpunishid', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('14', '账户状态', 'enum', 'FACT_SELLER', 'SELLERSTATUS', 'sellerstatus', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('15', '第一次上传产品时间', 'date', 'FACT_SELLER', 'FIRSTUPLOADPRODUCTDATE', 'firstuploadproductdate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('16', '第一次订单confirm的时间', 'date', 'FACT_SELLER', 'FIRST_ORDER_DATE', 'first_order_date', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('17', '当前主营一级类目', 'enum', 'FACT_SELLER_EXT', 'CATE1_PUB_ID', 'cate1_pub_id', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('18', '热销二级类目', 'varchar', 'FACT_SELLER_EXT', 'CATE2_PUB_NAME', 'cate2_pub_name', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('19', '总纠纷率', 'number', 'FACT_SELLER_SERVICE', 'DISPUTE_RATE', 'dispute_rate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('20', '卖家责任纠纷率', 'number', 'FACT_SELLER_SERVICE', 'DISPUTE_RATE_DUTY', 'dispute_rate_duty', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('21', '总退款率', 'number', 'FACT_SELLER_SERVICE', 'REFUND_RATE', 'refund_rate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('22', '商户原因退款率', 'number', 'FACT_SELLER_SERVICE', 'REFUND_RATE_CAUSE', 'refund_rate_cause', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('23', '好评数量', 'number', 'FACT_SELLER_SERVICE', 'GOOD_FEEDBACK', 'good_feedback', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('24', '好评率', 'number', 'FACT_SELLER_SERVICE', 'FEEDBACK_RATE', 'feedback_rate', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('25', '前一天登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_1D', 'logincount_1d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('26', '前一周登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_1W', 'logincount_1w', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('27', '上传产品数量', 'number', 'FACT_SELLER_EXT', 'UPLOADPRODS', 'uploadprods', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('28', '审核通过的产品总数量', 'number', 'FACT_SELLER_EXT', 'AUDITPRODS', 'auditprods', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('29', '在线产品数量', 'number', 'FACT_SELLER_EXT', 'LIVELISTING', 'livelisting', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('30', '前一天产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_1D', 'searchprodcount_1d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('31', '前一周产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_1W', 'searchprodcount_1w', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('32', '最近7天产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_7D', 'searchprodcount_7d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('33', '前一天订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_1D', 'confirmorder_1d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('34', '前一周订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_1W', 'confirmorder_1w', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('35', '最近7天订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_7D', 'confirmorder_7d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('36', '前1月订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_1M', 'confirmorder_1m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('40', '前一天在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_1D', 'dayonlinetime_1d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('41', '前一周在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_1W', 'dayonlinetime_1w', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('42', '最近7天登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_7D', 'logincount_7d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('43', '最近7天在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_7D', 'dayonlinetime_7d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('44', '前一个月登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_1M', 'logincount_1m', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('45', '前一个月在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_1M', 'dayonlinetime_1m', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('46', '最近30天登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_30D', 'logincount_30d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('47', '最近30天在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_30D', 'dayonlinetime_30d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('48', '前3个月登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_3M', 'logincount_3m', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('49', '前3个月在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_3M', 'dayonlinetime_3m', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('50', '最近90天登录次数', 'number', 'FACT_SELLER_EXT', 'LOGINCOUNT_90D', 'logincount_90d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('51', '最近90天在线时长', 'number', 'FACT_SELLER_EXT', 'DAYONLINETIME_90D', 'dayonlinetime_90d', '', '2014-07-01 16:28:29', '2', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('52', '前一月产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_1M', 'searchprodcount_1m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('53', '最近30天产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_30D', 'searchprodcount_30d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('54', '前3月产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_3M', 'searchprodcount_3m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('55', '最近90天产品曝光次数', 'number', 'FACT_SELLER_EXT', 'SEARCHPRODCOUNT_90D', 'searchprodcount_90d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('56', '前一天产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_1D', 'clickprodcount_1d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('57', '前一周产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_1W', 'clickprodcount_1w', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('58', '最近7天产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_7D', 'clickprodcount_7d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('59', '前一月产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_1M', 'clickprodcount_1m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('60', '最近30天产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_30D', 'clickprodcount_30d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('61', '前3月产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_3M', 'clickprodcount_3m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('62', '最近90天产品点击次数', 'number', 'FACT_SELLER_EXT', 'CLICKPRODCOUNT_90D', 'clickprodcount_90d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('63', '前一天有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_1D', 'solditem_1d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('64', '前一周有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_1W', 'solditem_1w', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('65', '最近7天有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_7D', 'solditem_7d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('66', '前1个月有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_1M', 'solditem_1m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('67', '最近30天有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_30D', 'solditem_30d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('68', '前3个月有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_3M', 'solditem_3m', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('69', '最近90天有销售记录产品数量', 'number', 'FACT_SELLER_EXT', 'SOLDITEM_90D', 'solditem_90d', '', '2014-07-01 16:28:29', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('71', '最近30天订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_30D', 'confirmorder_30d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('72', '前3月订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_3M', 'confirmorder_3m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('73', '最近90天订单数量', 'number', 'FACT_SELLER_EXT', 'CONFIRMORDER_90D', 'confirmorder_90d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('74', '前一天订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_1D', 'confirmgmv_1d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('75', '前一周订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_1W', 'confirmgmv_1w', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('76', '最近7天订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_7D', 'confirmgmv_7d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('77', '前1月订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_1M', 'confirmgmv_1m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('78', '最近30天订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_30D', 'confirmgmv_30d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('79', '前3月订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_3M', 'confirmgmv_3m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('80', '最近90天订单GMV', 'number', 'FACT_SELLER_EXT', 'CONFIRMGMV_90D', 'confirmgmv_90d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('81', '前1天未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_1D', 'startorder_1d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('82', '前1周未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_1W', 'startorder_1w', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('83', '最近7天未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_7D', 'startorder_7d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('84', '前1月未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_1M', 'startorder_1m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('85', '最近30天未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_30D', 'startorder_30d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('86', '前3月未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_3M', 'startorder_3m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('87', '前90天未付款订单数量', 'number', 'FACT_SELLER_EXT', 'STARTORDER_90D', 'startorder_90d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('88', '前1天未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_1D', 'startgmv_1d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('89', '前1周未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_1W', 'startgmv_1w', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('90', '最近7天未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_7D', 'startgmv_7d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('91', '前1月未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_1M', 'startgmv_1m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('92', '最近30天未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_30D', 'startgmv_30d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('93', '前3月未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_3M', 'startgmv_3m', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('94', '最近90天未付款GMV', 'number', 'FACT_SELLER_EXT', 'STARTGMV_90D', 'startgmv_90d', '', '2014-07-01 16:28:29', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('95', '跟进人', 'varchar', 'FACT_SELLER_EXT', 'COMM_USERS', 'comm_users', '', '2014-07-01 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('97', '认证时间', 'date', 'FACT_SELLER', 'IDCARDCONFIRMDATE', 'idcardconfirmdate', '', '2014-12-29 13:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('98', '询盘数量', 'number', 'FACT_SELLER_EXT', 'INQUIRY_QTY', 'inquiry_qty', '', '2014-12-29 13:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('99', '第一次询盘时间', 'date', 'FACT_SELLER_EXT', 'FIRST_INQUIRY', 'first_inquiry', '', '2014-12-29 13:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('100', '第一次出单时间', 'date', 'FACT_SELLER', 'FIRST_STARTED_ORDER_DATE', 'first_started_order_date', '', '2014-12-29 13:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('101', '卖家描述不符率90天', 'number', 'FACT_SELLER_EXT', 'DESCNOTMATCH_90D', 'descnotmatch_90d', '', '2014-12-22 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('102', '卖家描述不符率180天', 'number', 'FACT_SELLER_EXT', 'DESCNOTMATCH_180D', 'descnotmatch_180d', '', '2014-12-22 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('103', '卖家未收到货率90天', 'number', 'FACT_SELLER_EXT', 'NOTRECEIVED_90D', 'notreceived_90d', '', '2014-12-22 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('104', '卖家未收到货率180天', 'number', 'FACT_SELLER_EXT', 'NOTRECEIVED_180D', 'notreceived_180d', '', '2014-12-22 16:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('105', '订单数', 'number', 'FACT_SELLER_EXT', 'ORDERS', 'orders', '', '2014-12-29 13:28:29', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('106', '好评率(数据)', 'percent', 'FACT_SELLER_SERVICE', 'FEEDBACK_RATE', 'feedback_rate', '', '2015-03-11 09:52:55', '5', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('107', '总纠纷率(数据)', 'percent', 'FACT_SELLER_SERVICE', 'DISPUTE_RATE', 'dispute_rate', '', '2015-03-11 09:52:55', '5', '0');
INSERT INTO `scrm_seller_attribute` VALUES ('108', '退款率(数据)', 'percent', 'FACT_SELLER_SERVICE', 'REFUND_RATE', 'refund_rate', '', '2015-03-11 09:52:55', '5', '0');
INSERT INTO `scrm_seller_attribute` VALUES ('109', 'GMV', 'percent', 'FACT_SELLER_SD_W', 'TOTALGMV', 'totalgmv', '', '2015-03-11 09:52:55', '5', '0');
INSERT INTO `scrm_seller_attribute` VALUES ('110', '发布类目', 'varchar', 'FACT_SELLER_CATE_PUB_LIST_D', 'CATE_PUB_ID', 'cate_pub_id', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('111', '城市', 'varchar', 'FACT_SELLER', 'CITYSTATE', 'citystate', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('112', 'repeatrate', 'number', 'FACT_SELLER_SD_W', 'REPEATRATE', 'repeatrate', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('113', '本周买家数量', 'number', 'FACT_SELLER_SD_W', 'ALLBUYER', 'allbuyer', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('114', '本周新买家数量', 'number', 'FACT_SELLER_SD_W', 'NEWBUYER', 'newbuyer', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('115', '本周新买家订单数', 'number', 'FACT_SELLER_SD_W', 'NEWBUYERORDER', 'newbuyerorder', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('116', '本周新买家GMV', 'number', 'FACT_SELLER_SD_W', 'NEWBUYERGMV', 'newbuyergmv', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('117', '本周付款订单比例', 'number', 'FACT_SELLER_SD_W', 'PAY_ORDER_RATE', 'pay_order_rate', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('118', '近90天退款金额', 'number', 'FACT_SELLER_SD_W', 'REFUND_REFUNDGMV', 'refund_refundgmv', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('119', '近90天商户原因退款金额', 'number', 'FACT_SELLER_SD_W', 'CAUSE_REFUNDGMV', 'cause_refundgmv', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('120', '本周询盘数', 'number', 'FACT_SELLER_SD_W', 'RECINYQTY', 'recinyqty', '', '2015-03-11 09:52:55', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('121', '本周询盘回复度', 'number', 'FACT_SELLER_SD_W', 'INYRESSPEED', 'inyresspeed', '', '2015-03-11 09:52:55', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('122', '本周发货时间', 'number', 'FACT_SELLER_SD_W', 'DELIVER_TIME', 'deliver_time', '', '2015-03-11 09:52:55', '4', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('123', '免运费产品数', 'number', 'FACT_SELLER_SD_W', 'FREESHIPPINGPRO', 'freeshippingpro', '', '2015-03-11 09:52:55', '3', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('124', '诚保类型', 'enum', 'FACT_SELLER_SD_W', 'USER_TYPE', 'user_type', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('125', '黄牌数量', 'number', 'FACT_SELLER_SD_W', 'HPQ', 'hpq', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('126', '警告数量', 'number', 'FACT_SELLER_SD_W', 'JGQ', 'jgq', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('127', '代理商名称', 'varchar', 'FACT_SELLER', 'COMPANY_NAME', 'company_name', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('128', '最近60天实际好评数量', 'number', 'TD_FEEDBACK_SCORE_SUPPLIER', 'POSITIVE_LAST_2_MONTH', 'positive_last_2_month', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('129', '最近60天中评数量', 'number', 'TD_FEEDBACK_SCORE_SUPPLIER', 'NEUTRAL_LAST_2_MONTH', 'neutral_last_2_month', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('130', '最近60天差数量', 'number', 'TD_FEEDBACK_SCORE_SUPPLIER', 'NEGATIVE_LAST_2_MONTH', 'negative_last_2_month', '', '2015-03-11 09:52:55', '1', '1');
INSERT INTO `scrm_seller_attribute` VALUES ('131', '最近60天的订单未评价率', 'number', 'FACT_SELLER_SERVICE', 'NOFEEDBACK_RATE', 'nofeedback_rate', '', '2015-03-11 09:52:55', '1', '1');
