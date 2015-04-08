-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 �?04 �?08 �?11
-- 服务器版本: 5.6.11
-- PHP 版本: 5.5.0RC1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `td_scrm_user`
--

CREATE TABLE IF NOT EXISTS `td_scrm_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `supplierid` varchar(40) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `registertime` varchar(40) NOT NULL,
  `source` varchar(40) NOT NULL,
  `state` varchar(40) NOT NULL,
  `authmobile` varchar(40) NOT NULL,
  `authmail` varchar(40) NOT NULL,
  `acclink_qty` int(10) NOT NULL,
  `identity_type` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL,
  `serviceid` varchar(30) NOT NULL,
  `sellerpunish` varchar(30) NOT NULL,
  `sellerstatus` varchar(30) NOT NULL,
  `firstuploadproductdate` varchar(50) NOT NULL,
  `first_order_date` varchar(50) NOT NULL,
  `cate1_pub_id` varchar(50) NOT NULL,
  `cate2_pub_name` varchar(50) NOT NULL,
  `dispute_rate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `dispute_rate_duty` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `refund_rate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `refund_rate_cause` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `good_feedback` int(10) NOT NULL DEFAULT '0',
  `feedback_rate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `comm_users` varchar(30) NOT NULL DEFAULT '0',
  `idcardconfirmdate` varchar(50) NOT NULL,
  `inquiry_qty` int(10) NOT NULL,
  `first_inquiry` varchar(40) NOT NULL,
  `first_started_order_date` varchar(30) NOT NULL,
  `descnotmatch_90d` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `descnotmatch_180d` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `notrecieved_90d` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `notrecieved_180d` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `orders` int(10) NOT NULL DEFAULT '0',
  `logincount_1d` int(10) NOT NULL,
  `logincount_1w` int(10) NOT NULL,
  `uploadprods` int(10) NOT NULL,
  `auditprods` int(10) NOT NULL,
  `livelisting` int(10) NOT NULL,
  `searchprodcount_1d` int(10) NOT NULL,
  `searchprodcount_1w` int(10) NOT NULL,
  `searchprodcount_7d` int(10) NOT NULL,
  `dayonlinetime_1d` int(10) NOT NULL,
  `dayonlinetime_1w` int(10) NOT NULL,
  `logincount_7d` int(10) NOT NULL,
  `dayonlinetime_7d` int(10) NOT NULL,
  `logincount_1m` int(10) NOT NULL,
  `dayonlinetime_1m` int(10) NOT NULL,
  `logincount_30d` int(10) NOT NULL,
  `dayonlinetime_30d` int(10) NOT NULL,
  `logincount_3m` int(10) NOT NULL,
  `dayonlinetime_3m` int(10) NOT NULL,
  `logincount_90d` int(10) NOT NULL,
  `dayonlinetime_90d` int(10) NOT NULL,
  `searchprodcount_1m` int(10) NOT NULL,
  `searchprodcount_30d` int(10) NOT NULL,
  `searchprodcount_3m` int(10) NOT NULL,
  `searchprodcount_90d` int(10) NOT NULL,
  `citystate` varchar(30) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `hpq` int(10) NOT NULL,
  `jgq` int(10) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `positive_last_2_month` int(10) NOT NULL,
  `neutral_last_2_month` int(10) NOT NULL,
  `negative_last_2_month` int(10) NOT NULL,
  `nofeedback_rate` decimal(16,4) NOT NULL,
  `confirmorder_1d` int(10) NOT NULL,
  `confirmorder_1w` int(10) NOT NULL,
  `confirmorder_7d` int(10) NOT NULL,
  `confirmorder_1m` int(10) NOT NULL,
  `clickprodcount_1d` int(10) NOT NULL,
  `clickprodcount_1w` int(11) NOT NULL,
  `clickprodcount_7d` int(11) NOT NULL,
  `clickprodcount_1m` int(11) NOT NULL,
  `clickprodcount_30d` int(11) NOT NULL,
  `clickprodcount_3m` int(11) NOT NULL,
  `clickprodcount_90d` int(11) NOT NULL,
  `solditem_1d` int(11) NOT NULL,
  `solditem_1w` int(11) NOT NULL,
  `solditem_7d` int(11) NOT NULL,
  `solditem_1m` int(11) NOT NULL,
  `solditem_30d` int(11) NOT NULL,
  `solditem_3m` int(11) NOT NULL,
  `solditem_90d` int(11) NOT NULL,
  `confirmorder_30d` int(11) NOT NULL,
  `confirmorder_3m` int(11) NOT NULL,
  `confirmorder_90d` int(11) NOT NULL,
  `confirmgmv_1d` int(11) NOT NULL,
  `confirmgmv_1w` int(11) NOT NULL,
  `confirmgmv_7d` int(11) NOT NULL,
  `confirmgmv_1m` int(11) NOT NULL,
  `confirmgmv_30d` int(11) NOT NULL,
  `confirmgmv_3m` int(11) NOT NULL,
  `confirmgmv_90d` int(11) NOT NULL,
  `recinyqty` int(11) NOT NULL,
  `inyresspeed` int(11) NOT NULL,
  `freeshippingpro` int(10) NOT NULL,
  `startorder_1d` int(11) NOT NULL,
  `startorder_1w` int(11) NOT NULL,
  `startorder_7d` int(11) NOT NULL,
  `startorder_1m` int(11) NOT NULL,
  `startorder_30d` int(11) NOT NULL,
  `startorder_3m` int(11) NOT NULL,
  `startorder_90d` int(11) NOT NULL,
  `startgmv_1d` int(11) NOT NULL,
  `startgmv_1w` int(11) NOT NULL,
  `startgmv_7d` int(11) NOT NULL,
  `startgmv_1m` int(11) NOT NULL,
  `startgmv_30d` int(11) NOT NULL,
  `startgmv_3m` int(11) NOT NULL,
  `startgmv_90d` int(11) NOT NULL,
  `repeatrate` int(11) NOT NULL,
  `allbuyer` int(11) NOT NULL,
  `newbuyer` int(11) NOT NULL,
  `newbuyerorder` int(11) NOT NULL,
  `newbuyergmv` int(11) NOT NULL,
  `pay_order_rate` decimal(16,2) NOT NULL DEFAULT '0.00',
  `refund_refundgmv` int(11) NOT NULL,
  `cause_refundgmv` int(11) NOT NULL,
  `deliver_time` decimal(16,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `td_scrm_user`
--

INSERT INTO `td_scrm_user` (`id`, `supplierid`, `nickname`, `fullname`, `registertime`, `source`, `state`, `authmobile`, `authmail`, `acclink_qty`, `identity_type`, `level`, `serviceid`, `sellerpunish`, `sellerstatus`, `firstuploadproductdate`, `first_order_date`, `cate1_pub_id`, `cate2_pub_name`, `dispute_rate`, `dispute_rate_duty`, `refund_rate`, `refund_rate_cause`, `good_feedback`, `feedback_rate`, `comm_users`, `idcardconfirmdate`, `inquiry_qty`, `first_inquiry`, `first_started_order_date`, `descnotmatch_90d`, `descnotmatch_180d`, `notrecieved_90d`, `notrecieved_180d`, `orders`, `logincount_1d`, `logincount_1w`, `uploadprods`, `auditprods`, `livelisting`, `searchprodcount_1d`, `searchprodcount_1w`, `searchprodcount_7d`, `dayonlinetime_1d`, `dayonlinetime_1w`, `logincount_7d`, `dayonlinetime_7d`, `logincount_1m`, `dayonlinetime_1m`, `logincount_30d`, `dayonlinetime_30d`, `logincount_3m`, `dayonlinetime_3m`, `logincount_90d`, `dayonlinetime_90d`, `searchprodcount_1m`, `searchprodcount_30d`, `searchprodcount_3m`, `searchprodcount_90d`, `citystate`, `user_type`, `hpq`, `jgq`, `company_name`, `positive_last_2_month`, `neutral_last_2_month`, `negative_last_2_month`, `nofeedback_rate`, `confirmorder_1d`, `confirmorder_1w`, `confirmorder_7d`, `confirmorder_1m`, `clickprodcount_1d`, `clickprodcount_1w`, `clickprodcount_7d`, `clickprodcount_1m`, `clickprodcount_30d`, `clickprodcount_3m`, `clickprodcount_90d`, `solditem_1d`, `solditem_1w`, `solditem_7d`, `solditem_1m`, `solditem_30d`, `solditem_3m`, `solditem_90d`, `confirmorder_30d`, `confirmorder_3m`, `confirmorder_90d`, `confirmgmv_1d`, `confirmgmv_1w`, `confirmgmv_7d`, `confirmgmv_1m`, `confirmgmv_30d`, `confirmgmv_3m`, `confirmgmv_90d`, `recinyqty`, `inyresspeed`, `freeshippingpro`, `startorder_1d`, `startorder_1w`, `startorder_7d`, `startorder_1m`, `startorder_30d`, `startorder_3m`, `startorder_90d`, `startgmv_1d`, `startgmv_1w`, `startgmv_7d`, `startgmv_1m`, `startgmv_30d`, `startgmv_3m`, `startgmv_90d`, `repeatrate`, `allbuyer`, `newbuyer`, `newbuyerorder`, `newbuyergmv`, `pay_order_rate`, `refund_refundgmv`, `cause_refundgmv`, `deliver_time`) VALUES
(19, 'ff8080814c49a7fe014c9019330b0e85', 'zjw123328', '', '2015-04-07 02:58:32', 'PPC', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(20, 'ff8080814c465910014c8fe79bda1626', 'shonine', '', '2015-04-07 02:04:22', 'SEO', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(21, 'ff8080814c49a7fe014c8fb77a1c0e78', 'wanton', '陈小波', '2015-04-07 01:11:48', 'PPC', '待审核', '否', '是', 0, '个人', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(22, 'ff8080814c49a796014c8fb5ba080f86', 'nihao121326', '', '2015-04-07 01:09:53', 'PPC', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(23, 'ff8080814c49a796014c8fa134460f80', 'roojans', '', '2015-04-07 00:47:28', 'Null', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(24, 'ff8080814c4658d6014c8f9e883d14ea', 'xiaojie80', '', '2015-04-07 00:44:33', 'Null', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(25, 'ff8080814c49a796014c8f9577930f77', 'yy911516515', '', '2015-04-07 00:34:39', 'PPC', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(26, 'ff8080814c465910014c8f7af8761603', 'xihang55795', '李蕴霞', '2015-04-07 00:05:43', 'Null', '待审核', '否', '是', 0, '个人', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000'),
(27, 'ff8080814c49a7fe014c8f77fa5f0e59', 'yongrui', '', '2015-04-07 00:02:27', 'Null', '待审核', '否', '是', 0, '', 'S', '', '', '正常', '', '', '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, '0.0000', '', '', 0, '', '', '0.0000', '0.0000', '0.0000', '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.0000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
