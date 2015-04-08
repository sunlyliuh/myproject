-- phpMyAdmin SQL Dump
-- version 2.11.0-rc1
-- http://www.phpmyadmin.net
--
-- 主机: localhost

-- 生成日期: 2015 年 04 月 08 日 22:45
-- 服务器版本: 5.0.23
-- PHP 版本: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `td_scrm_user`
--

CREATE TABLE IF NOT EXISTS `td_scrm_user` (
  `id` int(10) NOT NULL auto_increment,
  `supplierid` varchar(40) NOT NULL,
  `nickname` varchar(40) default NULL,
  `fullname` varchar(30) default NULL,
  `registertime` varchar(40) default NULL,
  `source` varchar(40) default NULL,
  `state` varchar(40) default NULL,
  `authmobile` varchar(40) default NULL,
  `authmail` varchar(40) default NULL,
  `acclink_qty` int(10) default NULL,
  `identity_type` varchar(30) default NULL,
  `level` varchar(30) default NULL,
  `serviceid` varchar(30) default NULL,
  `sellerpunish` varchar(30) default NULL,
  `sellerstatus` varchar(30) default NULL,
  `firstuploadproductdate` varchar(50) default NULL,
  `first_order_date` varchar(50) default NULL,
  `cate1_pub_id` varchar(50) default NULL,
  `cate2_pub_name` varchar(50) default NULL,
  `dispute_rate` decimal(16,4) NOT NULL default '0.0000',
  `dispute_rate_duty` decimal(16,4) NOT NULL default '0.0000',
  `refund_rate` decimal(16,4) NOT NULL default '0.0000',
  `refund_rate_cause` decimal(16,4) NOT NULL default '0.0000',
  `good_feedback` int(10) NOT NULL default '0',
  `feedback_rate` decimal(16,4) NOT NULL default '0.0000',
  `comm_users` varchar(30) NOT NULL default '0',
  `idcardconfirmdate` varchar(50) default NULL,
  `inquiry_qty` int(10) default NULL,
  `first_inquiry` varchar(40) default NULL,
  `first_started_order_date` varchar(30) default NULL,
  `descnotmatch_90d` decimal(16,4) NOT NULL default '0.0000',
  `descnotmatch_180d` decimal(16,4) NOT NULL default '0.0000',
  `notrecieved_90d` decimal(16,4) NOT NULL default '0.0000',
  `notrecieved_180d` decimal(16,4) NOT NULL default '0.0000',
  `orders` int(10) NOT NULL default '0',
  `logincount_1d` int(10) default NULL,
  `logincount_1w` int(10) default NULL,
  `uploadprods` int(10) default NULL,
  `auditprods` int(10) default NULL,
  `livelisting` int(10) default NULL,
  `searchprodcount_1d` int(10) default NULL,
  `searchprodcount_1w` int(10) default NULL,
  `searchprodcount_7d` int(10) default NULL,
  `dayonlinetime_1d` decimal(16,2) NOT NULL default '0.00',
  `dayonlinetime_1w` decimal(16,2) default '0.00',
  `logincount_7d` int(10) default NULL,
  `dayonlinetime_7d` decimal(16,2) NOT NULL default '0.00',
  `logincount_1m` int(10) default NULL,
  `dayonlinetime_1m` decimal(16,2) NOT NULL default '0.00',
  `logincount_30d` int(10) default NULL,
  `dayonlinetime_30d` decimal(16,2) NOT NULL default '0.00',
  `logincount_3m` int(10) default NULL,
  `dayonlinetime_3m` decimal(16,2) NOT NULL default '0.00',
  `logincount_90d` int(10) default NULL,
  `dayonlinetime_90d` decimal(16,2) NOT NULL default '0.00',
  `searchprodcount_1m` int(10) default NULL,
  `searchprodcount_30d` int(10) default NULL,
  `searchprodcount_3m` int(10) default NULL,
  `searchprodcount_90d` int(10) default NULL,
  `citystate` varchar(30) default NULL,
  `user_type` varchar(30) default NULL,
  `hpq` int(10) default NULL,
  `jgq` int(10) default NULL,
  `company_name` varchar(100) default NULL,
  `positive_last_2_month` int(10) default NULL,
  `neutral_last_2_month` int(10) default NULL,
  `negative_last_2_month` int(10) default NULL,
  `nofeedback_rate` decimal(16,4) default NULL,
  `confirmorder_1d` int(10) default NULL,
  `confirmorder_1w` int(10) default NULL,
  `confirmorder_7d` int(10) default NULL,
  `confirmorder_1m` int(10) default NULL,
  `clickprodcount_1d` int(10) default NULL,
  `clickprodcount_1w` int(11) default NULL,
  `clickprodcount_7d` int(11) default NULL,
  `clickprodcount_1m` int(11) default NULL,
  `clickprodcount_30d` int(11) default NULL,
  `clickprodcount_3m` int(11) default NULL,
  `clickprodcount_90d` int(11) default NULL,
  `solditem_1d` int(11) default NULL,
  `solditem_1w` int(11) default NULL,
  `solditem_7d` int(11) default NULL,
  `solditem_1m` int(11) default NULL,
  `solditem_30d` int(11) default NULL,
  `solditem_3m` int(11) default NULL,
  `solditem_90d` int(11) default NULL,
  `confirmorder_30d` int(11) default NULL,
  `confirmorder_3m` int(11) default NULL,
  `confirmorder_90d` int(11) default NULL,
  `confirmgmv_1d` int(11) default NULL,
  `confirmgmv_1w` int(11) default NULL,
  `confirmgmv_7d` int(11) default NULL,
  `confirmgmv_1m` int(11) default NULL,
  `confirmgmv_30d` int(11) default NULL,
  `confirmgmv_3m` int(11) default NULL,
  `confirmgmv_90d` int(11) default NULL,
  `recinyqty` int(11) default NULL,
  `inyresspeed` int(11) default NULL,
  `freeshippingpro` int(10) default NULL,
  `startorder_1d` int(11) default NULL,
  `startorder_1w` int(11) default NULL,
  `startorder_7d` int(11) default NULL,
  `startorder_1m` int(11) default NULL,
  `startorder_30d` int(11) default NULL,
  `startorder_3m` int(11) default NULL,
  `startorder_90d` int(11) default NULL,
  `startgmv_1d` int(11) default NULL,
  `startgmv_1w` int(11) default NULL,
  `startgmv_7d` int(11) default NULL,
  `startgmv_1m` int(11) default NULL,
  `startgmv_30d` int(11) default NULL,
  `startgmv_3m` int(11) default NULL,
  `startgmv_90d` int(11) default NULL,
  `repeatrate` int(11) default NULL,
  `allbuyer` int(11) default NULL,
  `newbuyer` int(11) default NULL,
  `newbuyerorder` int(11) default NULL,
  `newbuyergmv` int(11) default NULL,
  `pay_order_rate` decimal(16,2) NOT NULL default '0.00',
  `refund_refundgmv` int(11) default NULL,
  `cause_refundgmv` int(11) default NULL,
  `deliver_time` decimal(16,5) NOT NULL default '0.00000',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `td_scrm_user`
--

