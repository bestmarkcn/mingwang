-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: Dec 30, 2015, 10:13 AM
-- 伺服器版本: 5.1.73
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `b15b0335`
--

-- --------------------------------------------------------

--
-- 資料表格式： `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'hong', 'junxiang', 'OZCHAMP', '3661000', '1111', '海定區', '', '北京市區', '100', 5, 72);

-- --------------------------------------------------------

--
-- 資料表格式： `affiliate`
--

DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `affiliate`
--


-- --------------------------------------------------------

--
-- 資料表格式： `affiliate_transaction`
--

DROP TABLE IF EXISTS `affiliate_transaction`;
CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `affiliate_transaction`
--


-- --------------------------------------------------------

--
-- 資料表格式： `anjian`
--

DROP TABLE IF EXISTS `anjian`;
CREATE TABLE IF NOT EXISTS `anjian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `caseid` int(5) NOT NULL,
  `casename` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `regtime` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 列出以下資料庫的數據： `anjian`
--

INSERT INTO `anjian` (`id`, `caseid`, `casename`, `picture`, `regtime`) VALUES
(1, 1, 'dawei', NULL, '2015-09-15'),
(2, 2, 'dawei2', NULL, '2015-09-15');

-- --------------------------------------------------------

--
-- 資料表格式： `ask`
--

DROP TABLE IF EXISTS `ask`;
CREATE TABLE IF NOT EXISTS `ask` (
  `ask_id` int(11) NOT NULL AUTO_INCREMENT,
  `ask_type_id` int(11) DEFAULT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `download` text,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ask_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 列出以下資料庫的數據： `ask`
--

INSERT INTO `ask` (`ask_id`, `ask_type_id`, `bottom`, `sort_order`, `status`, `download`, `year`) VALUES
(17, 7, 0, 3, 1, 'a:5:{i:0;a:3:{s:4:"name";s:12:"公司章程";s:5:"order";s:1:"5";s:3:"url";s:14:"1450335028.pdf";}i:1;a:3:{s:4:"name";s:33:"取得或處分資產處理程序";s:5:"order";s:1:"4";s:3:"url";s:14:"1450072181.gif";}i:2;a:3:{s:4:"name";s:30:"資金貸予他人管理辦法";s:5:"order";s:1:"3";s:3:"url";s:0:"";}i:3;a:3:{s:4:"name";s:36:"背書保證作業程序管理辦法";s:5:"order";s:1:"2";s:3:"url";s:14:"1450072185.gif";}i:4;a:3:{s:4:"name";s:39:"從事衍生性商品交易處理程序";s:5:"order";s:1:"1";s:3:"url";s:0:"";}}', ''),
(16, 8, 0, 0, 1, 'a:1:{i:0;a:3:{s:4:"name";s:39:"薪資報酬委員會實際運作情形";s:5:"order";s:0:"";s:3:"url";s:14:"1450072100.pdf";}}', '薪資報酬委員會'),
(13, 9, 0, 1, 1, 'a:4:{i:0;a:3:{s:4:"name";s:28:"2014年董事會決議事項";s:5:"order";s:1:"4";s:3:"url";s:14:"1450244966.pdf";}i:1;a:3:{s:4:"name";s:28:"2013年董事會決議事項";s:5:"order";s:1:"3";s:3:"url";s:14:"1450244962.pdf";}i:2;a:3:{s:4:"name";s:28:"2012年董事會決議事項";s:5:"order";s:1:"2";s:3:"url";s:14:"1450244958.pdf";}i:3;a:3:{s:4:"name";s:28:"2011年董事會決議事項";s:5:"order";s:1:"1";s:3:"url";s:14:"1450244951.pdf";}}', ''),
(22, 10, 0, 1, 1, 'a:3:{i:0;a:3:{s:4:"name";s:37:"民國104年第3季合併財務報告";s:5:"order";s:1:"3";s:3:"url";s:14:"1450335516.pdf";}i:1;a:3:{s:4:"name";s:37:"民國104年第2季合併財務報告";s:5:"order";s:1:"2";s:3:"url";s:14:"1450335508.pdf";}i:2;a:3:{s:4:"name";s:37:"民國104年第1季合併財務報告";s:5:"order";s:1:"1";s:3:"url";s:14:"1450335495.pdf";}}', '2015'),
(24, 11, 0, 2, 1, 'a:2:{i:0;a:3:{s:4:"name";s:31:"2014年股東常會議事手冊";s:5:"order";s:1:"2";s:3:"url";s:14:"1450335642.pdf";}i:1;a:3:{s:4:"name";s:25:"2014年股東會議事錄";s:5:"order";s:1:"1";s:3:"url";s:14:"1450335652.pdf";}}', '2014'),
(25, 11, 0, 1, 1, 'a:1:{i:0;a:3:{s:4:"name";s:12:"102年年報";s:5:"order";s:0:"";s:3:"url";s:14:"1450072431.gif";}}', '2013'),
(26, 12, 0, 3, 1, 'a:2:{i:0;a:3:{s:4:"name";s:47:"2013/05/23 櫃買業績發表會影音檔５５";s:5:"order";s:1:"5";s:3:"url";s:0:"";}i:1;a:3:{s:4:"name";s:41:"2013/05/23 櫃買業績發表會簡報檔";s:5:"order";s:1:"2";s:3:"url";s:14:"1450072546.gif";}}', '2013'),
(27, 12, 0, 2, 1, 'a:2:{i:0;a:3:{s:4:"name";s:35:"2012/11/01 業績發表會簡報檔";s:5:"order";s:1:"2";s:3:"url";s:14:"1450072512.gif";}i:1;a:3:{s:4:"name";s:35:"2012/11/01 業績發表會影音檔";s:5:"order";s:1:"1";s:3:"url";s:14:"1450072516.gif";}}', '2012'),
(28, 13, 0, 2, 1, 'a:12:{i:0;a:3:{s:4:"name";s:24:"2013年12月營收報告";s:5:"order";s:2:"12";s:3:"url";s:14:"1451383255.pdf";}i:1;a:3:{s:4:"name";s:24:"2013年11月營收報告";s:5:"order";s:2:"11";s:3:"url";s:14:"1451383245.pdf";}i:2;a:3:{s:4:"name";s:24:"2013年10月營收報告";s:5:"order";s:2:"10";s:3:"url";s:14:"1451383237.pdf";}i:3;a:3:{s:4:"name";s:23:"2013年9月營收報告";s:5:"order";s:1:"9";s:3:"url";s:14:"1451383227.pdf";}i:4;a:3:{s:4:"name";s:23:"2013年8月營收報告";s:5:"order";s:1:"8";s:3:"url";s:14:"1451383216.pdf";}i:5;a:3:{s:4:"name";s:23:"2013年7月營收報告";s:5:"order";s:1:"7";s:3:"url";s:14:"1451383204.pdf";}i:6;a:3:{s:4:"name";s:23:"2013年6月營收報告";s:5:"order";s:1:"6";s:3:"url";s:14:"1451383194.pdf";}i:7;a:3:{s:4:"name";s:23:"2013年5月營收報告";s:5:"order";s:1:"5";s:3:"url";s:14:"1451383184.pdf";}i:8;a:3:{s:4:"name";s:23:"2013年4月營收報告";s:5:"order";s:1:"4";s:3:"url";s:14:"1451383174.pdf";}i:9;a:3:{s:4:"name";s:23:"2013年3月營收報告";s:5:"order";s:1:"3";s:3:"url";s:14:"1451383163.pdf";}i:10;a:3:{s:4:"name";s:23:"2013年2月營收報告";s:5:"order";s:1:"2";s:3:"url";s:14:"1451383151.pdf";}i:11;a:3:{s:4:"name";s:23:"2013年1月營收報告";s:5:"order";s:1:"1";s:3:"url";s:14:"1451383136.pdf";}}', '2013'),
(29, 13, 0, 1, 1, 'a:2:{i:0;a:3:{s:4:"name";s:25:"2014年二月營收報告";s:5:"order";s:1:"2";s:3:"url";s:0:"";}i:1;a:3:{s:4:"name";s:25:"2014年一月營收報告";s:5:"order";s:1:"1";s:3:"url";s:14:"1450072262.pdf";}}', '2014'),
(32, 13, 0, 0, 1, 'a:3:{i:0;a:3:{s:4:"name";s:25:"2015年二月營收報告";s:5:"order";s:1:"2";s:3:"url";s:0:"";}i:1;a:3:{s:4:"name";s:25:"2015年一月營收報告";s:5:"order";s:1:"1";s:3:"url";s:14:"1450088366.pdf";}i:2;a:3:{s:4:"name";s:24:"2015年11月營收報告";s:5:"order";s:0:"";s:3:"url";s:14:"1450335227.pdf";}}', '2015'),
(36, 12, 0, 0, 1, 'a:1:{i:0;a:3:{s:4:"name";s:27:"2015/5/19-20海外法說會";s:5:"order";s:1:"1";s:3:"url";s:14:"1450335786.pdf";}}', '2015');

-- --------------------------------------------------------

--
-- 資料表格式： `ask_description`
--

DROP TABLE IF EXISTS `ask_description`;
CREATE TABLE IF NOT EXISTS `ask_description` (
  `ask_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`ask_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `ask_description`
--

INSERT INTO `ask_description` (`ask_id`, `language_id`, `title`, `description`) VALUES
(16, 1, '2015年功能性委員會', ''),
(17, 1, '公司內部規章', ''),
(25, 1, '102年股東會資料', ''),
(36, 1, '2015法人說明會資料', ''),
(22, 1, '2015年財務報表', ''),
(32, 1, '2015年月營收報告', ''),
(24, 1, '2014年股東會資料', ''),
(26, 1, '103年法人說明會資料', ''),
(27, 1, '102年法人說明會資料', ''),
(29, 1, '2014年月營收報告', ''),
(28, 1, '2013年月營收報告', ''),
(13, 1, '董事會決議事項', '');

-- --------------------------------------------------------

--
-- 資料表格式： `ask_to_store`
--

DROP TABLE IF EXISTS `ask_to_store`;
CREATE TABLE IF NOT EXISTS `ask_to_store` (
  `ask_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`ask_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `ask_to_store`
--

INSERT INTO `ask_to_store` (`ask_id`, `store_id`) VALUES
(13, 0),
(16, 0),
(17, 0),
(22, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(32, 0),
(36, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `ask_type`
--

DROP TABLE IF EXISTS `ask_type`;
CREATE TABLE IF NOT EXISTS `ask_type` (
  `ask_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ask_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 列出以下資料庫的數據： `ask_type`
--

INSERT INTO `ask_type` (`ask_type_id`, `bottom`, `sort_order`, `status`) VALUES
(8, 0, 7, 1),
(7, 0, 6, 1),
(9, 0, 8, 1),
(10, 0, 4, 1),
(11, 0, 3, 1),
(12, 0, 0, 1),
(13, 0, 5, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `ask_type_description`
--

DROP TABLE IF EXISTS `ask_type_description`;
CREATE TABLE IF NOT EXISTS `ask_type_description` (
  `ask_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`ask_type_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `ask_type_description`
--

INSERT INTO `ask_type_description` (`ask_type_id`, `language_id`, `title`, `description`) VALUES
(7, 1, '公司內部規章', ''),
(8, 1, '功能性委員會', ''),
(9, 1, '董事會決議事項', ''),
(10, 1, '財務報表', ''),
(11, 1, '股東會資料', ''),
(12, 1, '法人說明會資料', ''),
(13, 1, '月營收報告', '');

-- --------------------------------------------------------

--
-- 資料表格式： `ask_type_to_store`
--

DROP TABLE IF EXISTS `ask_type_to_store`;
CREATE TABLE IF NOT EXISTS `ask_type_to_store` (
  `ask_type_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`ask_type_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `ask_type_to_store`
--

INSERT INTO `ask_type_to_store` (`ask_type_id`, `store_id`) VALUES
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 列出以下資料庫的數據： `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(17, 3, 0),
(16, 3, 0),
(15, 3, 0),
(14, 3, 0),
(13, 3, 0),
(12, 3, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `attribute_description`
--

DROP TABLE IF EXISTS `attribute_description`;
CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(17, 1, 'XXXL'),
(16, 1, 'XXL'),
(15, 1, 'XL'),
(14, 1, 'X'),
(13, 1, 'M'),
(12, 1, 'S');

-- --------------------------------------------------------

--
-- 資料表格式： `attribute_group`
--

DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 列出以下資料庫的數據： `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- 資料表格式： `attribute_group_description`
--

DROP TABLE IF EXISTS `attribute_group_description`;
CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, '供應尺寸');

-- --------------------------------------------------------

--
-- 資料表格式： `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 列出以下資料庫的數據： `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(1, '首頁輪播產品小圖（120*70）', 1);

-- --------------------------------------------------------

--
-- 資料表格式： `banner_image`
--

DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- 列出以下資料庫的數據： `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(125, 2, '', 'data/demo/img06.jpg', 1),
(124, 2, '', 'data/demo/img05.jpg', 2),
(134, 1, 'index.php', 'data/demo/slider-02.jpg', 0),
(113, 4, '', 'data/demo/img12.jpg', 0),
(111, 4, '', 'data/demo/194x48.gif', 0),
(112, 4, '', 'data/demo/img13.jpg', 0),
(110, 4, '', 'data/demo/img13.jpg', 0),
(127, 3, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=5', 'data/demo/img07.jpg', 2),
(126, 3, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=8', 'data/demo/img08.jpg', 0),
(123, 2, '', 'data/demo/img04.jpg', 3),
(122, 2, '', 'data/demo/img02.jpg', 5),
(121, 2, '', 'data/demo/img03.jpg', 4),
(109, 4, '', 'data/demo/img12.jpg', 0),
(120, 2, 'http://ozchamp.com', 'data/demo/img01.jpg', 6),
(133, 1, 'http://ozchamp.com', 'data/demo/slider-01.jpg', 0),
(135, 1, '', 'data/demo/slider-03.jpg', 0);

-- --------------------------------------------------------

--
-- 資料表格式： `banner_image_description`
--

DROP TABLE IF EXISTS `banner_image_description`;
CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `banner_image_description`
--

INSERT INTO `banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`, `subtitle`) VALUES
(110, 1, 4, '廣告2', ''),
(109, 1, 4, '廣告1', ''),
(127, 1, 3, '左邊', ''),
(126, 1, 3, '右邊', ''),
(125, 1, 2, '提袋', 'BAG'),
(124, 1, 2, '其他周邊商品', 'OTHERS'),
(123, 1, 2, '抱枕', 'PILLOW'),
(122, 1, 2, '外套背心', 'JACKET VEST'),
(121, 1, 2, 'POLO 衫', 'POLO SHIRT'),
(120, 1, 2, 'T恤', 'T shirt'),
(111, 1, 4, '廣告3', ''),
(112, 1, 4, '廣告4', ''),
(113, 1, 4, '廣5', ''),
(135, 1, 1, '抱枕', ''),
(134, 1, 1, '廣告1', ''),
(133, 1, 1, '廣告2', '');

-- --------------------------------------------------------

--
-- 資料表格式： `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `icon` varchar(255) DEFAULT NULL,
  `file_ai` varchar(255) DEFAULT NULL,
  `file_jpg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 列出以下資料庫的數據： `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`, `icon`, `file_ai`, `file_jpg`) VALUES
(60, 'data/demo/img08.jpg', 59, 0, 1, 4, 1, '2015-01-21 16:50:06', '2015-05-04 15:52:02', '', '1421906249.jpg', '1421906193.doc'),
(59, '', 0, 0, 1, 4, 1, '2015-01-21 16:24:01', '2015-05-04 15:52:09', 'data/icon/icon-prod1.png', '', ''),
(61, '', 59, 0, 0, 0, 1, '2015-01-22 06:24:20', '2015-02-11 13:32:49', 'data/icon/icon-prod1.png', '', ''),
(62, '', 0, 0, 0, 1, 1, '2015-01-22 06:25:39', '2015-02-09 06:08:57', 'data/icon/icon-prod2.png', '', ''),
(63, 'data/uploads/img41.png', 62, 0, 0, 0, 1, '2015-01-22 06:27:14', '2015-02-09 06:09:19', '', '1421908021.png', '1421908030.png'),
(64, '', 0, 0, 0, 2, 1, '2015-01-22 06:28:08', '2015-02-09 06:09:54', 'data/icon/icon-prod3.png', '', ''),
(65, 'data/uploads/img41.png', 64, 0, 0, 0, 1, '2015-01-22 06:30:02', '2015-02-09 06:10:14', '', '1421908159.jpg', '1421908198.xls'),
(66, 'data/uploads/img41.png', 64, 0, 0, 2, 1, '2015-01-22 06:47:39', '2015-02-11 13:32:41', '', '1421909329.jpg', '1422510841.jpg'),
(68, NULL, 66, 0, 0, 0, 1, '2015-05-04 17:25:18', '2015-05-04 17:25:18', '', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `category_description`
--

DROP TABLE IF EXISTS `category_description`;
CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_special` text,
  `wear_report` text,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_special`, `wear_report`) VALUES
(59, 1, '水用', '&lt;p&gt;&lt;strong&gt;分為&lt;span style=&quot;color:rgb(0, 170, 241)&quot;&gt;【美國純棉筒T】&lt;/span&gt;&lt;span style=&quot;color:rgb(242, 146, 0)&quot;&gt;【標準純棉T】&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 90, 38)&quot;&gt;【排汗&lt;/span&gt;T】三大類，各類的尺寸大小稍有不同。&lt;/strong&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:rgb(68, 68, 68); font-family:arial,microsoft jhenghei,helvetica,sans-serif; font-size:13px&quot;&gt;以下圖示丈量說明：平放測量，單位為公分。&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:rgb(68, 68, 68); font-family:arial,microsoft jhenghei,helvetica,sans-serif; font-size:13px&quot;&gt;(1)胸寬&amp;rarr;腋下兩端的直線距離。&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:rgb(68, 68, 68); font-family:arial,microsoft jhenghei,helvetica,sans-serif; font-size:13px&quot;&gt;(2)衣長&amp;rarr;肩線最高點到下襬的距離。&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(60, 1, 'HG', '&lt;p&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; font-weight: 700; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;分為&lt;span style=&quot;box-sizing: border-box; color: rgb(0, 170, 241);&quot;&gt;【美國純棉筒T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(242, 146, 0);&quot;&gt;【標準純棉T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(255, 90, 38);&quot;&gt;【排汗&lt;/span&gt;T】三大類，各類的尺寸大小稍有不同。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;以下圖示丈量說明：平放測量，單位為公分。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(1)胸寬&amp;rarr;腋下兩端的直線距離。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(2)衣長&amp;rarr;肩線最高點到下襬的距離。&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(61, 1, 'HG2', '&lt;p&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; font-weight: 700; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;分為&lt;span style=&quot;box-sizing: border-box; color: rgb(0, 170, 241);&quot;&gt;【美國純棉筒T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(242, 146, 0);&quot;&gt;【標準純棉T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(255, 90, 38);&quot;&gt;【排汗&lt;/span&gt;T】三大類，各類的尺寸大小稍有不同。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;以下圖示丈量說明：平放測量，單位為公分。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(1)胸寬&amp;rarr;腋下兩端的直線距離。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(2)衣長&amp;rarr;肩線最高點到下襬的距離&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(62, 1, '抽水機', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;彈性修身女T&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;彈性修身女T&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;彈性修身女T&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(63, 1, 'HG', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉質修身女T&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉質修身女T&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉質修身女T&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉質修身女T&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉質修身女T&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(68, 1, '333', '', '', '', '', ''),
(64, 1, '引擎發電機', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;POLO衫 / 專櫃款&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;POLO衫 / 專櫃款&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;POLO衫 / 專櫃款&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;POLO衫 / 專櫃款&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(65, 1, 'HG', '&lt;p&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; font-weight: 700; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;分為&lt;span style=&quot;box-sizing: border-box; color: rgb(0, 170, 241);&quot;&gt;【美國純棉筒T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(242, 146, 0);&quot;&gt;【標準純棉T】&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; color: rgb(255, 90, 38);&quot;&gt;【排汗&lt;/span&gt;T】三大類，各類的尺寸大小稍有不同。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;以下圖示丈量說明：平放測量，單位為公分。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(1)胸寬&amp;rarr;腋下兩端的直線距離。&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box; color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot; /&gt;\r\n	&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; line-height: 19.5px;&quot;&gt;(2)衣長&amp;rarr;肩線最高點到下襬的距離。&lt;/span&gt;&lt;/p&gt;\r\n', '&lt;p&gt;\r\n	備註：◎ 衣服尺寸&amp;plusmn;5%內均為正常範圍，需要參考尺寸建議嗎? &amp;nbsp;&lt;/p&gt;\r\n', '&lt;p style=&quot;box-sizing: border-box; margin: 0px; color: rgb(51, 51, 51); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; font-weight: bold; line-height: 20px; padding-left: 15px; background: url(http://localhost/yinlewang/html/images/uploads/icon-square-grey.png) 0px 6px / 8px no-repeat;&quot;&gt;\r\n	網版絹印成本低，適合中大量印製。由於必須開版(印樂網免收版費)，每一處一色必須使用不同的版，歡迎您將圖案寄來讓我們為您計算如何節省印工成本唷!&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; font-weight: bold; line-height: 20px; color: rgb(242, 146, 0); padding-left: 15px; background: url(http://localhost/yinlewang/html/images/uploads/icon-square-orange.png) 0px 6px / 8px no-repeat;&quot;&gt;\r\n	另有修身女T可選擇，每件只要加30元。&lt;/p&gt;\r\n', '&lt;p&gt;\r\n	&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; font-weight: bold; line-height: 20px;&quot;&gt;另提供多款優惠的T-shirt供活動使用，絕對符合您的預算所需，歡迎來電洽詢報價喔。&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; font-weight: bold; line-height: 20px; color: rgb(242, 146, 0);&quot;&gt;\r\n	公司客服 0800-221772&lt;/p&gt;\r\n', '&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; microsoft=&quot;&quot; style=&quot; font-size:13px; color:#444; line-height:20px; font-family:Arial, &quot; width=&quot;700px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;th style=&quot;background:#eee; text-align:center; color:#000; font-weight:bold; border:1px solid #999; padding:5px 0;&quot; width=&quot;33%&quot;&gt;\r\n				身高&lt;/th&gt;\r\n			&lt;th style=&quot;background:#eee; text-align:center; color:#000; font-weight:bold; border:1px solid #999; padding:5px 0;&quot; width=&quot;33%&quot;&gt;\r\n				試穿人員&lt;/th&gt;\r\n			&lt;th style=&quot;background:#eee; text-align:center; color:#000; font-weight:bold; border:1px solid #999; padding:5px 0;&quot; width=&quot;33%&quot;&gt;\r\n				建議尺寸&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;2&quot; style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				151-155&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				A&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				S&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				B&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				M&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;2&quot; style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				156-160&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				C&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				S&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				D&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				L&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;2&quot; style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				161-65&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				E&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				XL&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				F&lt;/td&gt;\r\n			&lt;td style=&quot;padding:5px 0; text-align:center; border:1px solid #999; border-top:none;&quot;&gt;\r\n				L&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n'),
(66, 1, 'HG2', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉Polo衫&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉Polo衫&lt;/span&gt;&lt;span style=&quot;font-family: Consolas, ''Lucida Console'', monospace; white-space: pre-wrap;&quot;&gt;棉Polo衫&lt;/span&gt;&lt;/p&gt;\r\n', '&lt;p&gt;\r\n	適合亞洲人體形，在日本、香港&lt;span style=&quot;box-sizing: border-box; font-family: Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; font-size: 13px; font-weight: bold; line-height: 15.6000003814697px; color: rgb(255, 127, 0);&quot;&gt;每年熱銷900萬件！&lt;/span&gt;&lt;/p&gt;\r\n', '', '', ''),
(0, 1, '123', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 資料表格式： `category_filter`
--

DROP TABLE IF EXISTS `category_filter`;
CREATE TABLE IF NOT EXISTS `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `category_filter`
--


-- --------------------------------------------------------

--
-- 資料表格式： `category_path`
--

DROP TABLE IF EXISTS `category_path`;
CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(60, 59, 1),
(60, 0, 0),
(66, 64, 1),
(66, 0, 0),
(65, 0, 0),
(65, 64, 1),
(64, 0, 0),
(63, 0, 0),
(63, 62, 1),
(62, 0, 0),
(61, 59, 1),
(61, 0, 0),
(59, 0, 0),
(68, 66, 2),
(68, 64, 1),
(68, 0, 0),
(0, 0, 0),
(59, 59, 1),
(60, 60, 2),
(61, 61, 2),
(62, 62, 1),
(63, 63, 2),
(64, 64, 1),
(65, 65, 2),
(66, 66, 2),
(68, 68, 3);

-- --------------------------------------------------------

--
-- 資料表格式： `category_to_layout`
--

DROP TABLE IF EXISTS `category_to_layout`;
CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `category_to_layout`
--


-- --------------------------------------------------------

--
-- 資料表格式： `category_to_store`
--

DROP TABLE IF EXISTS `category_to_store`;
CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(0, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(68, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `color` varchar(128) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `sort_order` int(11) DEFAULT '0',
  PRIMARY KEY (`color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- 列出以下資料庫的數據： `color`
--

INSERT INTO `color` (`color_id`, `name`, `color`, `image`, `date_added`, `sort_order`) VALUES
(1, '米黃', '#fbaf5a', '', '2015-01-23 07:50:16', 0),
(2, '淺黑色', '#000', '', '2015-01-23 07:53:50', 3),
(3, '灰色', '', 'data/uploads/icon-square-grey.png', '2015-01-23 07:54:12', 0),
(4, '紅色', '#ee1d24', '', '2015-01-23 08:27:37', NULL),
(5, '黑色', '', 'data/uploads/img37.jpg', '2015-01-23 08:27:37', NULL),
(6, '白色', '#fff', '', '2015-01-23 08:27:37', NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `phone_ext` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `enquiry` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact` text,
  `company` varchar(100) DEFAULT NULL,
  `juese` varchar(255) DEFAULT NULL,
  `contactor` varchar(255) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=207 ;

--
-- 列出以下資料庫的數據： `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `phone`, `phone_ext`, `address`, `postcode`, `email`, `mobile`, `sex`, `type`, `enquiry`, `status`, `date_added`, `date_modified`, `contact`, `company`, `juese`, `contactor`, `comments`) VALUES
(195, 'Manufacturers', '0922222222', NULL, NULL, NULL, 'panicbox@yahoo.com.tw', NULL, '女', NULL, '', 0, '2015-12-15 15:36:52', '0000-00-00 00:00:00', NULL, NULL, '投資者', 'YOULY', 'TEST測試留言留言TEST測試留言留言ㄒ'),
(190, 'mark', '86001133', NULL, NULL, NULL, 'test@163.com', NULL, '男', NULL, '', 0, '2015-12-09 17:21:17', '0000-00-00 00:00:00', NULL, NULL, '員工', 'mark', '123'),
(191, 'mark測試公司', '86001133', NULL, NULL, NULL, 'test@163.com', NULL, NULL, NULL, '', 0, '2015-12-09 17:37:34', '0000-00-00 00:00:00', NULL, NULL, '選擇角色', 'mark', '123'),
(192, 'mark11', '1111111111', NULL, NULL, NULL, '123@qq.com', NULL, '男', NULL, '', 0, '2015-12-09 17:43:57', '0000-00-00 00:00:00', NULL, NULL, '員工', '123', '22222222222'),
(193, '總管理員', '86001133', NULL, NULL, NULL, 'caosjay@163.com', NULL, '男', NULL, '', 0, '2015-12-10 09:08:56', '0000-00-00 00:00:00', NULL, NULL, '客戶', 'mark', 'aaaaaaaa'),
(194, 'markceshi', '86001133', NULL, NULL, NULL, '419326086@qq.com', NULL, '男', NULL, '', 0, '2015-12-10 09:50:17', '0000-00-00 00:00:00', NULL, NULL, '員工', 'mark', 'aaaaaaaaaaaa'),
(196, '元伸', '0922222222', NULL, NULL, NULL, 'panicbox@yahoo.com.tw', NULL, '女', NULL, '', 0, '2015-12-15 15:38:20', '0000-00-00 00:00:00', NULL, NULL, '員工', '陳尤力', 'TEST測試留言留言TEST測試留言留言'),
(197, '元伸', '0922222222', NULL, NULL, NULL, 'panicbox@yahoo.com.tw', NULL, '女', NULL, '', 0, '2015-12-15 16:52:18', '0000-00-00 00:00:00', NULL, NULL, '投資者', '陳尤力', '0922222222092222222209222222220922222222'),
(198, 'hakers', '0289769056', NULL, NULL, NULL, 'sally.lin@haksport.com', NULL, '女', NULL, '', 0, '2015-12-17 15:11:24', '0000-00-00 00:00:00', NULL, NULL, '員工', 'sally', '測試'),
(199, 'hakers', '8976', NULL, '13', NULL, 'sally.lin@haksport.com', NULL, NULL, NULL, '', 0, '2015-12-28 17:36:43', '0000-00-00 00:00:00', NULL, NULL, '', '林', 'test'),
(200, '元伸', '0922222222', NULL, '介壽路280號', NULL, 'panicbox@yahoo.com.tw', NULL, '小姐 ', NULL, '', 0, '2015-12-28 18:04:34', '0000-00-00 00:00:00', NULL, NULL, '員工', '陳尤力', 'ㄘrsdhbdsdhdhndhdh'),
(201, '元伸', 'afdsf', NULL, '', NULL, 'panicbox@yahoo.com.tw', NULL, NULL, NULL, '', 0, '2015-12-28 18:07:08', '0000-00-00 00:00:00', NULL, NULL, '', 'ffaffa', 'faffffafaf'),
(202, 'mark測試', '86001133', NULL, '台北市内湖区瑞光路206号3楼', NULL, '419326086@qq.com', NULL, '先生', NULL, '', 0, '2015-12-29 09:21:39', '0000-00-00 00:00:00', NULL, NULL, '員工', 'mark測試', 'markzzzzz'),
(203, 'ha', '8976', NULL, '12345', NULL, 'sally.lin@haksport.com', NULL, NULL, NULL, '', 0, '2015-12-29 10:31:14', '0000-00-00 00:00:00', NULL, NULL, '', '林', 'test'),
(204, '元伸', '0922222222', NULL, '', NULL, 'panicbox@yahoo.com.tw', NULL, '小姐 ', NULL, '', 0, '2015-12-29 15:53:48', '0000-00-00 00:00:00', NULL, NULL, '客戶', '晴美國際', '晴美國際晴美國際晴美國際晴美國際'),
(205, 'HAKERS', '8976', NULL, '123456', NULL, 'sally.lin@haksport.com', NULL, '小姐 ', NULL, '', 0, '2015-12-30 10:02:46', '0000-00-00 00:00:00', NULL, NULL, '員工', 'LIN', 'TEST'),
(206, 'HAKERS', '8976', NULL, '123456', NULL, 'sally.lin@haksport.com', NULL, '小姐 ', NULL, '', 0, '2015-12-30 10:03:41', '0000-00-00 00:00:00', NULL, NULL, '員工', 'LIN', 'TEST');

-- --------------------------------------------------------

--
-- 資料表格式： `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_group_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) NOT NULL DEFAULT '',
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='縣市' AUTO_INCREMENT=26 ;

--
-- 列出以下資料庫的數據： `country`
--

INSERT INTO `country` (`country_id`, `country_group_id`, `sort_order`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 1, 25, '基隆市', '', '', '', NULL, 1),
(2, 1, 24, '新北市', '', '', '', NULL, 1),
(3, 1, 23, '台北市', '', '', '', NULL, 1),
(4, 1, 22, '桃園市', '', '', '', 0, 1),
(5, 1, 21, '新竹縣', '', '', '', NULL, 1),
(6, 1, 20, '新竹市', '', '', '', NULL, 1),
(7, 1, 19, '苗栗縣', '', '', '', NULL, 1),
(8, 1, 18, '台中市', '', '', '', NULL, 1),
(10, 1, 16, '彰化縣', '', '', '', NULL, 1),
(11, 1, 15, '南投縣', '', '', '', 0, 1),
(12, 1, 14, '雲林縣', '', '', '', NULL, 1),
(13, 1, 13, '嘉義縣', '', '', '', NULL, 1),
(14, 1, 12, '嘉義市', '', '', '', NULL, 1),
(15, 1, 11, '台南市', '', '', '', NULL, 1),
(17, 1, 9, '高雄市', '', '', '', NULL, 1),
(19, 1, 7, '屏東縣', '', '', '', NULL, 1),
(20, 1, 6, '宜蘭縣', '', '', '', NULL, 1),
(21, 1, 5, '花蓮縣', '', '', '', NULL, 1),
(22, 1, 4, '台東縣', '', '', '', NULL, 1),
(23, 2, 3, '澎湖縣', '', '', '', NULL, 1),
(24, 2, 2, '金門縣', '', '', '', NULL, 1),
(25, 2, 1, '連江縣', '', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `coupon`
--

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 列出以下資料庫的數據： `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- 資料表格式： `coupon_category`
--

DROP TABLE IF EXISTS `coupon_category`;
CREATE TABLE IF NOT EXISTS `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `coupon_category`
--


-- --------------------------------------------------------

--
-- 資料表格式： `coupon_history`
--

DROP TABLE IF EXISTS `coupon_history`;
CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `coupon_history`
--


-- --------------------------------------------------------

--
-- 資料表格式： `coupon_product`
--

DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `coupon_product`
--


-- --------------------------------------------------------

--
-- 資料表格式： `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(2, '新台幣', 'NTD', '$', '', '1', 1.00000000, 1, '2015-02-08 23:34:07');

-- --------------------------------------------------------

--
-- 資料表格式： `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'hong', 'junxiang', '50742787@qq.com', '02-87562131', '3661000', '8f8d1167412069394db217e87223d302655693f8', 'be3118521', 'a:0:{}', '', 0, 1, 1, '127.0.0.1', 1, 1, '', '2014-12-18 01:35:27');

-- --------------------------------------------------------

--
-- 資料表格式： `customer_ban_ip`
--

DROP TABLE IF EXISTS `customer_ban_ip`;
CREATE TABLE IF NOT EXISTS `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `customer_ban_ip`
--


-- --------------------------------------------------------

--
-- 資料表格式： `customer_field`
--

DROP TABLE IF EXISTS `customer_field`;
CREATE TABLE IF NOT EXISTS `customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `customer_field`
--


-- --------------------------------------------------------

--
-- 資料表格式： `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `customer_group_description`
--

DROP TABLE IF EXISTS `customer_group_description`;
CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- 資料表格式： `customer_history`
--

DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE IF NOT EXISTS `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `customer_history`
--


-- --------------------------------------------------------

--
-- 資料表格式： `customer_ip`
--

DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2014-12-18 01:35:29');

-- --------------------------------------------------------

--
-- 資料表格式： `customer_online`
--

DROP TABLE IF EXISTS `customer_online`;
CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `customer_online`
--


-- --------------------------------------------------------

--
-- 資料表格式： `customer_reward`
--

DROP TABLE IF EXISTS `customer_reward`;
CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `customer_reward`
--


-- --------------------------------------------------------

--
-- 資料表格式： `customer_transaction`
--

DROP TABLE IF EXISTS `customer_transaction`;
CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `customer_transaction`
--


-- --------------------------------------------------------

--
-- 資料表格式： `custom_field`
--

DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `custom_field`
--


-- --------------------------------------------------------

--
-- 資料表格式： `custom_field_description`
--

DROP TABLE IF EXISTS `custom_field_description`;
CREATE TABLE IF NOT EXISTS `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `custom_field_description`
--


-- --------------------------------------------------------

--
-- 資料表格式： `custom_field_to_customer_group`
--

DROP TABLE IF EXISTS `custom_field_to_customer_group`;
CREATE TABLE IF NOT EXISTS `custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `custom_field_to_customer_group`
--


-- --------------------------------------------------------

--
-- 資料表格式： `custom_field_value`
--

DROP TABLE IF EXISTS `custom_field_value`;
CREATE TABLE IF NOT EXISTS `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `custom_field_value`
--


-- --------------------------------------------------------

--
-- 資料表格式： `custom_field_value_description`
--

DROP TABLE IF EXISTS `custom_field_value_description`;
CREATE TABLE IF NOT EXISTS `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `custom_field_value_description`
--


-- --------------------------------------------------------

--
-- 資料表格式： `download`
--

DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `download`
--


-- --------------------------------------------------------

--
-- 資料表格式： `download_description`
--

DROP TABLE IF EXISTS `download_description`;
CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `download_description`
--


-- --------------------------------------------------------

--
-- 資料表格式： `extension`
--

DROP TABLE IF EXISTS `extension`;
CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=428 ;

--
-- 列出以下資料庫的數據： `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow');

-- --------------------------------------------------------

--
-- 資料表格式： `filter`
--

DROP TABLE IF EXISTS `filter`;
CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `filter`
--


-- --------------------------------------------------------

--
-- 資料表格式： `filter_description`
--

DROP TABLE IF EXISTS `filter_description`;
CREATE TABLE IF NOT EXISTS `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `filter_description`
--


-- --------------------------------------------------------

--
-- 資料表格式： `filter_group`
--

DROP TABLE IF EXISTS `filter_group`;
CREATE TABLE IF NOT EXISTS `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `filter_group`
--


-- --------------------------------------------------------

--
-- 資料表格式： `filter_group_description`
--

DROP TABLE IF EXISTS `filter_group_description`;
CREATE TABLE IF NOT EXISTS `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `filter_group_description`
--


-- --------------------------------------------------------

--
-- 資料表格式： `geo_zone`
--

DROP TABLE IF EXISTS `geo_zone`;
CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 列出以下資料庫的數據： `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- 資料表格式： `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 列出以下資料庫的數據： `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `information_description`
--

DROP TABLE IF EXISTS `information_description`;
CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(4, 1, '集團架構', '&lt;div class=&quot;main&quot; role=&quot;main&quot;&gt;\r\n&lt;div class=&quot;content full&quot; id=&quot;content&quot;&gt;&lt;!-- Mission --&gt;\r\n&lt;div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n&lt;h2&gt;關係企業組織圖&lt;/h2&gt;\r\n\r\n&lt;p class=&quot;center-block text-align-center&quot;&gt;&lt;img src=&quot;images/about/base-01.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;div class=&quot;spacer-50&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;h2&gt;關係企業基本資料&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;table-responsive&quot;&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;&amp;nbsp;&lt;/th&gt;\r\n			&lt;th width=&quot;100&quot;&gt;設立日期&lt;/th&gt;\r\n			&lt;th width=&quot;100&quot;&gt;主要營業或&lt;br /&gt;\r\n			生產項目&lt;/th&gt;\r\n			&lt;th&gt;地區&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;CHIA MOON GARMENTS (MALAYSIA)SDN. BHD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;1987.04.23&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣加工及&lt;br /&gt;\r\n				銷售等業務&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;馬來西亞 檳城 &lt;br /&gt;\r\n				(Penang , Malaysia)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;CARLTEX CO., LTD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2007.01.08&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;投資控股&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;英屬維京群島 &lt;br /&gt;\r\n				(British Virgin Islands)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;銘旺越南製衣責任有限公司&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2007.06.06&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣加工&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;越南 胡志明市 &lt;br /&gt;\r\n				(Ho Chi Minh City , Vietnam)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;HAKERS ENTERPRISE(MALAYSIA) SDN.BHD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2013.01.25&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣銷售&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;馬來西亞 檳城 &lt;br /&gt;\r\n				(Penang , Malaysia)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;HAKERS ENTERPRISE(MYANMAR) CO.,LTD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2013.03.11&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣加工&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;緬甸 勃生 &lt;br /&gt;\r\n				(Pathein , Myanmar)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;HAKERS ENTERPRISE (LAO) CO., LTD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2014.09.25&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣加工&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;寮國 永珍 &lt;br /&gt;\r\n				(Vientiane , Lao)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;HAKERS NTERNATIONAL (SAMOA) CO.,LTD.&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2014.11.19&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;投資控股&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;薩摩亞 &lt;br /&gt;\r\n				(Samoa)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;哈克士戶外(南京)有限公司&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;2015.04.13&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成衣銷售&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;中國 南京 &lt;br /&gt;\r\n				(Nanjing , China)&lt;/td&gt;\r\n			&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(3, 1, '公司沿革', '&lt;div class=&quot;main&quot; role=&quot;main&quot;&gt;\r\n&lt;div class=&quot;content full&quot; id=&quot;content&quot;&gt;&lt;!-- Mission --&gt;\r\n&lt;div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n&lt;div id=&quot;about-history&quot;&gt;\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2014年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;因應本公司日漸成長之業務而擬於拓充產能，選定於寮國設立新廠。&lt;/li&gt;\r\n		&lt;li&gt;辦理盈餘轉增資發行新股，增資後實收資本額為481,800千元。&lt;/li&gt;\r\n		&lt;li&gt;為貫徹自有品牌「哈克士」業務策略及加速中國地區自有品牌之發展，透過Hakers International (Samoa) Co., Ltd. 轉投資大陸地區設立哈克士戶外(南京)有限公司。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2013年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;開創自有品牌哈克士Hakers，以直營店或百貨公司設櫃方式拓展業務。&lt;/li&gt;\r\n		&lt;li&gt;為開拓馬來西亞市場透過CHIA MOON GARMENTS (MALAYSIA) SDN. BHD.再轉投資HAKERS ENTERPRISE (MALAYSIA) SDN. BHD.進行銷售。&lt;/li&gt;\r\n		&lt;li&gt;為擴充產能於緬甸設廠透過CHIA MOON GARMENTS (MALAYSIA) SDN. BHD.再轉投資HAKERS ENTERPRISE (MYANMAR) CO., LTD。&lt;/li&gt;\r\n		&lt;li&gt;8月辦理現金增資50,000千元，增資後實收資本額為438,000千元。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2012年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;9月獲證券櫃檯買賣中心審議通過上櫃。&lt;/li&gt;\r\n		&lt;li&gt;11月辦理上櫃前現金增資38,000千元，增資後實收資本額為388,000千元。&lt;/li&gt;\r\n		&lt;li&gt;11月26日正式於證券櫃檯買賣中心上櫃掛牌(股票代號：4432)。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2011年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;6月辦理現金增資50,000千元，增資後實收資本額為350,000千元。&lt;/li&gt;\r\n		&lt;li&gt;8月經金融監督管理委員會核准股票首次公開發行。&lt;/li&gt;\r\n		&lt;li&gt;8月經財團法人中華民國證券櫃檯買賣中心同意登錄為興櫃股票。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2010年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;子公司CARLTEX CO., LTD. 收購CHIA MOON GARMENTS (MALAYSIA) SDN.BHD. 其餘51%股權，強化本集團股權架構。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2007年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;設立子公司CARLTEX CO., LTD. 再轉投資銘旺越南製衣責任有限公司。&lt;/li&gt;\r\n		&lt;li&gt;成功拓展海外寮國區生產據點。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2006年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資100,000千元，增資後實收資本額300,000千元。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2005年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資100,000千元，增資後實收資本額200,000千元。&lt;/li&gt;\r\n		&lt;li&gt;取得歐洲知名成衣品牌訂單，因產品之卓越品質深獲客戶信賴不斷追加訂單，成為本公司前十大之客戶。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2002年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;榮獲美國知名品牌REEBOK及FOOTJOY等成衣公司之品質認證，並取得其訂單。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;2000年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資59,000千元，增資後實收資本額100,000千元。&lt;/li&gt;\r\n		&lt;li&gt;成功拓展海外緬甸區生產據點。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;1998年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資30,000千元，增資後實收資本額41,000千元。&lt;/li&gt;\r\n		&lt;li&gt;轉投資CHIA MOON GARMENTS (MALAYSIA) SDN. BHD.收購49%股權並引進電腦打版馬克系統，將成衣打版全面電腦化，節省生產時間、人工成本及布料耗損以提高生產量。&lt;/li&gt;\r\n		&lt;li&gt;榮獲世界知名品牌ADIDAS之品質認證通過，獲得大量訂單。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;1996年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資6,000千元，增資後實收資本額11,000千元。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;1991年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;辦理現金增資4,000千元，增資後實收資本額5,000千元。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n\r\n&lt;dl&gt;\r\n	&lt;dt&gt;1986年&lt;/dt&gt;\r\n	&lt;dd&gt;\r\n	&lt;ul class=&quot;chevrons&quot;&gt;\r\n		&lt;li&gt;成立銘旺實業股份有限公司，實收資本額為1,000千元。&lt;/li&gt;\r\n	&lt;/ul&gt;\r\n	&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(1, 1, '關於我們', '&lt;div class=&quot;main&quot; role=&quot;main&quot;&gt;\r\n&lt;div class=&quot;content full&quot; id=&quot;content&quot;&gt;&lt;!-- Mission --&gt;\r\n&lt;div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-4 appear-animation fadeInLeft appear-animation-visible&quot; data-appear-animation=&quot;fadeInLeft&quot; data-appear-animation-delay=&quot;1&quot;&gt;&lt;img src=&quot;images/about/about-01.png&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;col-md-8 appear-animation fadeInRight appear-animation-visible&quot; data-appear-animation=&quot;fadeInRight&quot; data-appear-animation-delay=&quot;1&quot;&gt;\r\n&lt;p class=&quot;lead&quot;&gt;創立於民國75年的銘旺實業股份有限公司(以下簡稱銘旺公司或本公司)從事成衣製品及其他相關紡織品的研發、生產及行銷業務為主。&lt;/p&gt;\r\n\r\n&lt;p&gt;成立初期，主要以世界知名品牌Adidas、Reebok等運動服飾代工，包括泳褲、短褲、夾克、長褲為主要銷售之成衣公司。經由本公司以卓越的品質及如期交貨之信用讓業務與訂單不斷拓展，為因應客戶多元化之產品需求，在董事長帶領業務及產品開發部門持續研發下，掌握最新加工技術及新產品改良、效率生產管理與國際分工整合調度，成為全系列之運動休閒服飾公司。為有效提升本公司的競爭力、分散整體經營風險及擴大營業規模的雙重考量之下，目前主要擁有四大海外生產據點，本公司於馬來西亞和越南兩地設立子公司，主要銷售出口地區為美國客戶。另於緬甸和寮國地區，由銘旺公司直接派駐專業技術人員輔導當地供應鏈代工廠配合生產，其主要銷售出口至零關稅優勢的歐盟國家。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;spacer-50&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-12&quot;&gt;\r\n&lt;h2 class=&quot;appear-animation fadeInDown appear-animation-visible&quot; data-appear-animation=&quot;fadeInDown&quot; data-appear-animation-delay=&quot;10&quot;&gt;主要海外生產基地簡介如下:&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;table-responsive&quot;&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th align=&quot;center&quot; valign=&quot;middle&quot;&gt;廠別區分&lt;/th&gt;\r\n			&lt;th align=&quot;center&quot; colspan=&quot;4&quot; valign=&quot;middle&quot;&gt;自有廠&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;20%&quot;&gt;生產據點&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;20%&quot;&gt;馬來西亞&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;20%&quot;&gt;越南&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;20%&quot;&gt;緬甸勃生廠&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;20%&quot;&gt;寮國&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;設立時間&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;1998&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2007&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2013&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2015&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;產&amp;nbsp;&amp;nbsp;&amp;nbsp; 能&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;3.6萬件/月&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;12萬件/月&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;30萬件/月&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;24萬件/月&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;人&amp;nbsp;&amp;nbsp;&amp;nbsp; 數&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;400&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;660&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;1500&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;700&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;特&amp;nbsp;&amp;nbsp; 色&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;ISO/WRAP&lt;br /&gt;\r\n			認證通過&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;WRAP&lt;br /&gt;\r\n			認證通過&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;WRAP認證通過&lt;br /&gt;\r\n			出口歐盟免關稅&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;WRAP認證通過&lt;br /&gt;\r\n			出口歐盟免關稅&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;table-responsive&quot;&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;廠別區分&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; colspan=&quot;3&quot; valign=&quot;middle&quot;&gt;委外代工廠&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;25%&quot;&gt;生產據點&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;25%&quot;&gt;緬甸仰光廠&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;25%&quot;&gt;中國&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;25%&quot;&gt;寮國&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;設立時間&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2000&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2004&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2009&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;產&amp;nbsp;&amp;nbsp;&amp;nbsp; 能&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;30萬件/月&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;2.5萬件/月&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;24萬件/月&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;人&amp;nbsp;&amp;nbsp;&amp;nbsp; 數&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;1500&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;370&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;700&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;特&amp;nbsp;&amp;nbsp; 色&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;出口歐盟免關稅&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;ISO/WRAP認證通過&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot;&gt;出口歐盟免關稅&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;spacer-50&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-12&quot;&gt;\r\n&lt;p class=&quot;lead&quot;&gt;本公司經過多年來辛勤耕耘，已蛻變為具有國際觀，實施國際分工運籌管理及整合生產、行銷、管理一條龍作業的紡織業者。未來，在產業競爭中將持續以下三大發展主軸，朝向更穩健成長、靈活調度與成本控制的永續發展企業。&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;透過馬來西亞子公司之研發中心深耕機能紡織產品開發，以因應歐美時尚、功能、環保之綠色市場發展與成長趨勢潮流。&lt;/li&gt;\r\n	&lt;li&gt;強化東南亞各據點供應鏈之國際分工與整合，掌握歐盟零關稅貿易優勢，並提供客戶一次購足及超越OEM之服務，持續拓展歐盟市場規模。&lt;/li&gt;\r\n	&lt;li&gt;積極研究開發自創品牌創造大陸內需市場成長。&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(2, 1, '公司簡介', '&lt;div class=&quot;main&quot; role=&quot;main&quot;&gt;\r\n&lt;div class=&quot;content full&quot; id=&quot;content&quot;&gt;&lt;!-- Mission --&gt;\r\n&lt;div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n&lt;h2 class=&quot;appear-animation fadeInRight appear-animation-visible&quot; data-appear-animation=&quot;fadeInRight&quot; data-appear-animation-delay=&quot;1&quot;&gt;公司組織架構&lt;/h2&gt;\r\n\r\n&lt;p class=&quot;center-block&quot;&gt;&lt;img src=&quot;images/about/brief-01.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;div class=&quot;spacer-50&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-12&quot;&gt;\r\n&lt;h2 class=&quot;appear-animation fadeInDown appear-animation-visible&quot; data-appear-animation=&quot;fadeInDown&quot; data-appear-animation-delay=&quot;10&quot;&gt;各主要部門所營業務&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;table-responsive&quot;&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th width=&quot;80&quot;&gt;部　　門&lt;/th&gt;\r\n			&lt;th&gt;所　營　業　務&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;稽核室&lt;/th&gt;\r\n			&lt;td&gt;\r\n			&lt;ul class=&quot;chevrons&quot;&gt;\r\n				&lt;li&gt;查核公司內部控制制度是否持續有效運作，營運活動是否近既定計畫執行，法令規章是否確實遵循並提出改善建議。&lt;/li&gt;\r\n				&lt;li&gt;協助建立公司營運執行及內部控制可靠性及有效性，促進有效營運。&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;業務部&lt;/th&gt;\r\n			&lt;td&gt;\r\n			&lt;ul class=&quot;chevrons&quot;&gt;\r\n				&lt;li&gt;執行公司年度營業目標及計畫。&lt;/li&gt;\r\n				&lt;li&gt;新舊客戶開發與維繫、輔助客戶產品開發並提供客戶售後服務與各項事宜。&lt;/li&gt;\r\n				&lt;li&gt;產銷協調、外發代工管理及產品品質管理。&lt;/li&gt;\r\n				&lt;li&gt;原物料規劃及負責國內外主料採購事項暨供應商之管理等事項。&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;哈克士&lt;/th&gt;\r\n			&lt;td&gt;\r\n			&lt;ul class=&quot;chevrons&quot;&gt;\r\n				&lt;li&gt;市場調查開發、分析預測及規劃行銷通路。&lt;/li&gt;\r\n				&lt;li&gt;負責產品企劃、開發產品款式及產品價格之訂定。&lt;/li&gt;\r\n				&lt;li&gt;負責哈克士品牌市場銷售及推廣開發等業務。&lt;/li&gt;\r\n				&lt;li&gt;商品進出物流管理。&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;行政部&lt;/th&gt;\r\n			&lt;td&gt;\r\n			&lt;ul class=&quot;chevrons&quot;&gt;\r\n				&lt;li&gt;行政制度規章訂定及執行。&lt;/li&gt;\r\n				&lt;li&gt;人力規劃管理及人員招募任用、薪資獎酬規劃、教育訓練等人力資源業務。&lt;/li&gt;\r\n				&lt;li&gt;總務庶物設施維護及請購。&lt;/li&gt;\r\n				&lt;li&gt;股務作業執行。&lt;/li&gt;\r\n				&lt;li&gt;負責設備及雜項等採購事項。&lt;/li&gt;\r\n				&lt;li&gt;存貨盤點及進出口管理。&lt;/li&gt;\r\n				&lt;li&gt;資訊管理系統之發展及維護。&lt;/li&gt;\r\n				&lt;li&gt;合約之撰擬審核與管理，法律問題諮詢解答、訴訟調解案件之處理、法令搜集與專題研究。&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;財會部&lt;/th&gt;\r\n			&lt;td&gt;\r\n			&lt;ul class=&quot;chevrons&quot;&gt;\r\n				&lt;li&gt;公司財務管理及資金調度業務。&lt;/li&gt;\r\n				&lt;li&gt;普會及成會之會計帳務處理。&lt;/li&gt;\r\n				&lt;li&gt;稅務規劃執行。&lt;/li&gt;\r\n				&lt;li&gt;財物報表及年度預算編製。&lt;/li&gt;\r\n				&lt;li&gt;海外轉投資事業營運成果之審核。&lt;/li&gt;\r\n				&lt;li&gt;公司股票上市櫃檯後相關作業之維護執行與協調事宜。&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;spacer-50&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;h2 class=&quot;appear-animation fadeInDown appear-animation-visible&quot; data-appear-animation=&quot;fadeInDown&quot; data-appear-animation-delay=&quot;10&quot;&gt;經理人之職稱及職權範圍&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;table-responsive&quot;&gt;\r\n&lt;table class=&quot;table table-bordered&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th width=&quot;120&quot;&gt;職　　稱&lt;/th&gt;\r\n			&lt;th width=&quot;80&quot;&gt;姓　　名&lt;/th&gt;\r\n			&lt;th&gt;主　要　職　責&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;總經理&lt;/th&gt;\r\n			&lt;td align=&quot;center&quot;&gt;呂清裕&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;ol&gt;\r\n				&lt;li&gt;發展中長期目標、策略及投資發展計畫，並展開至各子公司及功能單位，領導公司整體組織運作持續成長及獲利。&lt;/li&gt;\r\n				&lt;li&gt;領導經營管理團隊鰲定營運目標及策略，督導計畫及執行以促使達成既定的經營方針，並整合共同資源，確保共同資源投入成本最低並創造綜效。&lt;/li&gt;\r\n				&lt;li&gt;公司重大決策之議定與審理。&lt;/li&gt;\r\n				&lt;li&gt;養成經營管理人才，因應公司發展需要。&lt;/li&gt;\r\n				&lt;li&gt;事業單位領導幹部任免與考核。&lt;/li&gt;\r\n			&lt;/ol&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;副總經理&lt;/th&gt;\r\n			&lt;td align=&quot;center&quot;&gt;陳孟耀&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;ol&gt;\r\n				&lt;li&gt;領導及負責事業單位營運目標及策略督導計畫及執行。&lt;/li&gt;\r\n				&lt;li&gt;訂定事業單位工作目標與督導進展及評核。&lt;/li&gt;\r\n				&lt;li&gt;事業單位重要幹部任免與考核。&lt;/li&gt;\r\n			&lt;/ol&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;行政部經理&lt;/th&gt;\r\n			&lt;td align=&quot;center&quot;&gt;陳彥百&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;ol&gt;\r\n				&lt;li&gt;負責公司行政、從事、資訊、法務等管理業務。&lt;/li&gt;\r\n				&lt;li&gt;經營方針、經營計畫、經營狀況及經營管理策略之議定。&lt;/li&gt;\r\n				&lt;li&gt;公司重大決定決策之督導及執行。&lt;/li&gt;\r\n			&lt;/ol&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;財務部經理&lt;/th&gt;\r\n			&lt;td align=&quot;center&quot;&gt;陳靜怡&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;ol&gt;\r\n				&lt;li&gt;領導集團財務、會計、稅務等功能單位作業之策略擬定與執行。&lt;/li&gt;\r\n				&lt;li&gt;配合集團營運方向與計畫，提供相關財會之分析及資金風險管理。&lt;/li&gt;\r\n				&lt;li&gt;配合集團經營佈局、制定稅務規劃方向並與會計師配合相關查核之作業。&lt;/li&gt;\r\n				&lt;li&gt;管理與擬定短、中、長期資金之取得與運用、調度等相關事宜。&lt;/li&gt;\r\n				&lt;li&gt;會計帳務及稅務之處理、審核及編製財務報表供經營資料分析及比較。&lt;/li&gt;\r\n				&lt;li&gt;年度預算編製總、差異分析及控制。&lt;/li&gt;\r\n			&lt;/ol&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n');

-- --------------------------------------------------------

--
-- 資料表格式： `information_to_layout`
--

DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `information_to_layout`
--


-- --------------------------------------------------------

--
-- 資料表格式： `information_to_store`
--

DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE IF NOT EXISTS `inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_no` varchar(30) DEFAULT NULL,
  `num` int(1) DEFAULT '1',
  `name` varchar(64) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `enquiry` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `service_type` varchar(30) DEFAULT NULL,
  `shop_area` varchar(20) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `order_qty` varchar(10) DEFAULT NULL,
  `order_time` varchar(30) DEFAULT NULL,
  `shipping_month` varchar(2) DEFAULT NULL,
  `shipping_day` varchar(2) DEFAULT NULL,
  `other_type` varchar(50) DEFAULT NULL,
  `sub_total` float(11,1) DEFAULT NULL,
  `total` float(11,1) DEFAULT NULL,
  `tax` float(11,1) DEFAULT NULL,
  `vaccount` varchar(40) DEFAULT NULL,
  `comment` text,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `union_no` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`inquiry_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- 列出以下資料庫的數據： `inquiry`
--

INSERT INTO `inquiry` (`inquiry_id`, `inquiry_no`, `num`, `name`, `company`, `phone`, `email`, `upload_file`, `enquiry`, `status`, `service_type`, `shop_area`, `product_type`, `order_qty`, `order_time`, `shipping_month`, `shipping_day`, `other_type`, `sub_total`, `total`, `tax`, `vaccount`, `comment`, `date_added`, `address`, `fax`, `union_no`, `user_id`, `date_modified`) VALUES
(42, '2015020342-1', 2, 'OZCHAMP junxiang', '', '86001133', '50742787@qq.com', '', 'color_imagecolor_imagecolor_imagecolor_imagecolor_image', 1, 'email', '電話網路服務', '帽子', '456', '正常出貨即可', '2', '22', '產品', 2000.0, 2100.0, 100.0, NULL, '', '2015-02-03 04:25:35', NULL, NULL, NULL, 1, '2015-02-04 02:08:14'),
(41, '2015020241-8', 9, 'OZCHAMP junxiang', 'OZCHAMP', '86001133', '50742787@qq.com', '', '詢 問 內 容詢 問 內 容詢 問 內 容詢 問 內 容詢 問 內 容', 1, 'email', '電話網路服務', 'cxz', '456', '正常出貨即可', '2', '22', 'cxz', 1100.0, 1155.0, 55.0, '81081502000417', 'commentcommentcommentcomment', '2015-02-02 16:04:15', '福建省福州市鼓楼区工业路548号', '3661000', NULL, 1, '2015-02-04 06:59:47');

-- --------------------------------------------------------

--
-- 資料表格式： `inquiry_price`
--

DROP TABLE IF EXISTS `inquiry_price`;
CREATE TABLE IF NOT EXISTS `inquiry_price` (
  `inquiry_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `size` varchar(15) NOT NULL DEFAULT '0.0000',
  `color_name` varchar(255) NOT NULL DEFAULT '0.0000',
  `color_id` int(11) DEFAULT NULL,
  `upload_file` text NOT NULL,
  `design_image` varchar(255) DEFAULT NULL,
  `feature` varchar(100) DEFAULT NULL,
  `quantity` int(4) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_added` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inquiry_price_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=212 ;

--
-- 列出以下資料庫的數據： `inquiry_price`
--

INSERT INTO `inquiry_price` (`inquiry_price_id`, `inquiry_id`, `product_id`, `name`, `model`, `size`, `color_name`, `color_id`, `upload_file`, `design_image`, `feature`, `quantity`, `price`, `total`, `date_added`, `sort_order`, `user_id`) VALUES
(211, 41, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 4, 100, 400.0000, '2015-02-04 06:59:47', 0, NULL),
(210, 41, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 1, 100, 100.0000, '2015-02-04 06:59:47', 0, NULL),
(209, 41, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 2, 100, 200.0000, '2015-02-04 06:59:47', 0, NULL),
(208, 41, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 3, 100, 300.0000, '2015-02-04 06:59:47', 0, NULL),
(207, 41, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 1, 100, 100.0000, '2015-02-04 06:59:47', 0, NULL),
(195, 42, 53, 'United Athle 中性T桖', '', 'M', '紅色', 4, '', NULL, '供應材質與特色2', 1, 1000, 1000.0000, '2015-02-04 02:08:09', 0, NULL),
(196, 42, 53, 'United Athle 中性T桖', '', 'L', '灰色', 3, '', NULL, '供應材質與特色1', 1, 1000, 1000.0000, '2015-02-04 02:08:09', 0, NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `inquiry_product`
--

DROP TABLE IF EXISTS `inquiry_product`;
CREATE TABLE IF NOT EXISTS `inquiry_product` (
  `inquiry_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `size` varchar(15) NOT NULL DEFAULT '0.0000',
  `color_name` varchar(255) NOT NULL DEFAULT '0.0000',
  `color_id` int(11) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `upload_file` text NOT NULL,
  `design_image` varchar(255) DEFAULT NULL,
  `feature` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inquiry_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=232 ;

--
-- 列出以下資料庫的數據： `inquiry_product`
--

INSERT INTO `inquiry_product` (`inquiry_product_id`, `inquiry_id`, `product_id`, `name`, `model`, `quantity`, `size`, `color_name`, `color_id`, `total`, `upload_file`, `design_image`, `feature`) VALUES
(215, 42, 53, 'United Athle 中性T桖', '', 0, 'M', '紅色', 4, 0.0000, 'N;', 'http://localhost/yinlewang/download/user/1422937365.png', '供應材質與特色2'),
(216, 42, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, 'N;', 'http://localhost/yinlewang/download/user/1422937365.png', '供應材質與特色1'),
(44, 43, 53, 'United Athle 中性T桖', '', 1, 'L', '灰色', 3, 0.0000, 'N;', 'http://localhost/yinlewang/download/user/1422937365.png', '供應材質與特色1'),
(45, 43, 53, 'United Athle 中性T桖', '', 1, 'M', '紅色', 4, 0.0000, 'N;', 'http://localhost/yinlewang/download/user/1422937365.png', '供應材質與特色2'),
(231, 41, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, '', 'http://localhost/yinlewang/download/user/1422891882.png', '供應材質與特色1'),
(230, 41, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, '', 'http://localhost/yinlewang/download/user/1422891882.png', '供應材質與特色1'),
(229, 41, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, 'a:1:{i:0;s:55:&quot;http://localhost/yinlewang/download/temp/1422891870.jpg&quot;;}', 'http://localhost/yinlewang/download/user/1422891882.png', '供應材質與特色1'),
(228, 41, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, '', 'http://localhost/yinlewang/download/user/1422891882.png', '供應材質與特色1'),
(227, 41, 53, 'United Athle 中性T桖', '', 0, 'L', '灰色', 3, 0.0000, '', 'http://localhost/yinlewang/download/user/1422891882.png', '供應材質與特色1');

-- --------------------------------------------------------

--
-- 資料表格式： `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, '繁體中文', 'zh-TW', 'zh_HK.UTF-8,zh_HK,zh-hk,hongkong,zh_TW.UTF-8,zh_TW,zh_tw', 'tw.png', 'tchinese', 'tchinese', 0, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `layout`
--

DROP TABLE IF EXISTS `layout`;
CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- 資料表格式： `layout_route`
--

DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 列出以下資料庫的數據： `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(35, 3, 0, 'product/category'),
(36, 3, 0, 'product/size'),
(37, 3, 0, 'product/price');

-- --------------------------------------------------------

--
-- 資料表格式： `length_class`
--

DROP TABLE IF EXISTS `length_class`;
CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- 資料表格式： `length_class_description`
--

DROP TABLE IF EXISTS `length_class_description`;
CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- 資料表格式： `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `description` text,
  `home` int(1) DEFAULT '0',
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 列出以下資料庫的數據： `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `logo`, `sort_order`, `description`, `home`) VALUES
(5, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」 被Yahoo的產業成功案例報導了呢', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 0, '&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-size:13px; color:#444; font-family:Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; line-height:150%; margin:0&quot; width=&quot;100%&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n				&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n					口碑一流，受到顧客愛戴的團體服品牌「印樂網」​&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」是一間專門提供多元與超值的團體服印製公司，長年經營的好口碑深得客戶信賴，服務項目包含網版絹印、電腦刺繡、數位膠膜、昇華彩印等，並承接系服、團體服、班服、訂做團體服、印T恤、訂做抱枕、制服訂做等各式業務。舉凡T恤、Polo衫、頭巾、活動T、棒球帽、班系服、公司制服、活動禮品等各種需求「印樂網」皆能保證完美呈現!&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」對客戶的承諾是全程台灣印製、SGS檢驗合格，且還有1000萬責任險+ISO 9001國際品質保證+美國棉，至今已累積超過3000多名客戶的真心推薦，不僅品質滿意，交件準時，印製數量彈性又大，不論是少量或是多達萬件的需求，「印樂網」一律來者不拒，最重要的是都能交出令客戶滿意的衣服。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					為了服務更廣大的民眾，「印樂網」設有全台北中南共5支客服專線，甚至更走出台灣，在馬來西亞、上海、香港都設有辦事處來服務各地的華人朋友。而且在網站上完全公開透明的價目表，更是讓新客戶感受到「印樂網」的誠意與保障。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n					「印樂網」透過最划算的「關鍵字廣告」將優質服務傳播出去&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					現今，網路幾乎已成為所有企業不可或缺的宣傳管道，而如何透過網路讓最多人能最快速地找到「印樂網」呢? 台灣最大的入口網站「Yahoo!奇摩」成為最佳的選擇，曝光免費、點擊才計費的關鍵字廣告，則是最適合中小企業的網路行銷方式。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」加入Yahoo!奇摩關鍵字廣告之後，訂單量扶搖直上，因為藉由專業顧問與編輯的操作，充分發揮了精準行銷的優勢。顧問將「印樂網」所提供的全部服務列出來，根據長年觀察的搜尋量來挑選衍生關鍵字，再分門別類為不同的廣告群組觀察成效。除此之外，為了提升廣告精準度還增加了地區字組，以此過濾掉非服務地區的網友進入官網，影響成效。所以，當網友想訂製團體工作服時，只要上網搜尋相關字，第一眼就能看到「印樂網」是符合其需求的最佳選擇，如此關鍵字廣告很快地替「印樂網」得到了一筆潛在訂單，且因為文案內容100%地符合網友需求，因此大大的提升了交易成功率，讓作生意變得超有效率!&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					曾經服務過各大知名企業的「印樂網」與台灣最知名的「Yahoo!奇摩關鍵字廣告」攜手發揮一加一大於二的綜效，讓生意天天開紅盤，業績量一年比一年更亮眼!&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', 1),
(6, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」 被Yahoo的產業成功案例報導了呢', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 0, '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; border=&quot;0&quot; width=&quot;100%&quot; style=&quot;font-size:13px; color:#444; font-family:Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; line-height:150%; margin:0&quot;&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;口碑一流，受到顧客愛戴的團體服品牌「印樂網」​&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」是一間專門提供多元與超值的團體服印製公司，長年經營的好口碑深得客戶信賴，服務項目包含網版絹印、電腦刺繡、數位膠膜、昇華彩印等，並承接系服、團體服、班服、訂做團體服、印T恤、訂做抱枕、制服訂做等各式業務。舉凡T恤、Polo衫、頭巾、活動T、棒球帽、班系服、公司制服、活動禮品等各種需求「印樂網」皆能保證完美呈現!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」對客戶的承諾是全程台灣印製、SGS檢驗合格，且還有1000萬責任險+ISO 9001國際品質保證+美國棉，至今已累積超過3000多名客戶的真心推薦，不僅品質滿意，交件準時，印製數量彈性又大，不論是少量或是多達萬件的需求，「印樂網」一律來者不拒，最重要的是都能交出令客戶滿意的衣服。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n為了服務更廣大的民眾，「印樂網」設有全台北中南共5支客服專線，甚至更走出台灣，在馬來西亞、上海、香港都設有辦事處來服務各地的華人朋友。而且在網站上完全公開透明的價目表，更是讓新客戶感受到「印樂網」的誠意與保障。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n「印樂網」透過最划算的「關鍵字廣告」將優質服務傳播出去\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n現今，網路幾乎已成為所有企業不可或缺的宣傳管道，而如何透過網路讓最多人能最快速地找到「印樂網」呢? 台灣最大的入口網站「Yahoo!奇摩」成為最佳的選擇，曝光免費、點擊才計費的關鍵字廣告，則是最適合中小企業的網路行銷方式。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」加入Yahoo!奇摩關鍵字廣告之後，訂單量扶搖直上，因為藉由專業顧問與編輯的操作，充分發揮了精準行銷的優勢。顧問將「印樂網」所提供的全部服務列出來，根據長年觀察的搜尋量來挑選衍生關鍵字，再分門別類為不同的廣告群組觀察成效。除此之外，為了提升廣告精準度還增加了地區字組，以此過濾掉非服務地區的網友進入官網，影響成效。所以，當網友想訂製團體工作服時，只要上網搜尋相關字，第一眼就能看到「印樂網」是符合其需求的最佳選擇，如此關鍵字廣告很快地替「印樂網」得到了一筆潛在訂單，且因為文案內容100%地符合網友需求，因此大大的提升了交易成功率，讓作生意變得超有效率!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n曾經服務過各大知名企業的「印樂網」與台灣最知名的「Yahoo!奇摩關鍵字廣告」攜手發揮一加一大於二的綜效，讓生意天天開紅盤，業績量一年比一年更亮眼!\r\n&lt;/p&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/table&gt;', 0),
(7, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」 被Yahoo的產業成功案例報導了呢', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 0, '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; border=&quot;0&quot; width=&quot;100%&quot; style=&quot;font-size:13px; color:#444; font-family:Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; line-height:150%; margin:0&quot;&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;口碑一流，受到顧客愛戴的團體服品牌「印樂網」​&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」是一間專門提供多元與超值的團體服印製公司，長年經營的好口碑深得客戶信賴，服務項目包含網版絹印、電腦刺繡、數位膠膜、昇華彩印等，並承接系服、團體服、班服、訂做團體服、印T恤、訂做抱枕、制服訂做等各式業務。舉凡T恤、Polo衫、頭巾、活動T、棒球帽、班系服、公司制服、活動禮品等各種需求「印樂網」皆能保證完美呈現!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」對客戶的承諾是全程台灣印製、SGS檢驗合格，且還有1000萬責任險+ISO 9001國際品質保證+美國棉，至今已累積超過3000多名客戶的真心推薦，不僅品質滿意，交件準時，印製數量彈性又大，不論是少量或是多達萬件的需求，「印樂網」一律來者不拒，最重要的是都能交出令客戶滿意的衣服。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n為了服務更廣大的民眾，「印樂網」設有全台北中南共5支客服專線，甚至更走出台灣，在馬來西亞、上海、香港都設有辦事處來服務各地的華人朋友。而且在網站上完全公開透明的價目表，更是讓新客戶感受到「印樂網」的誠意與保障。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n「印樂網」透過最划算的「關鍵字廣告」將優質服務傳播出去\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n現今，網路幾乎已成為所有企業不可或缺的宣傳管道，而如何透過網路讓最多人能最快速地找到「印樂網」呢? 台灣最大的入口網站「Yahoo!奇摩」成為最佳的選擇，曝光免費、點擊才計費的關鍵字廣告，則是最適合中小企業的網路行銷方式。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」加入Yahoo!奇摩關鍵字廣告之後，訂單量扶搖直上，因為藉由專業顧問與編輯的操作，充分發揮了精準行銷的優勢。顧問將「印樂網」所提供的全部服務列出來，根據長年觀察的搜尋量來挑選衍生關鍵字，再分門別類為不同的廣告群組觀察成效。除此之外，為了提升廣告精準度還增加了地區字組，以此過濾掉非服務地區的網友進入官網，影響成效。所以，當網友想訂製團體工作服時，只要上網搜尋相關字，第一眼就能看到「印樂網」是符合其需求的最佳選擇，如此關鍵字廣告很快地替「印樂網」得到了一筆潛在訂單，且因為文案內容100%地符合網友需求，因此大大的提升了交易成功率，讓作生意變得超有效率!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n曾經服務過各大知名企業的「印樂網」與台灣最知名的「Yahoo!奇摩關鍵字廣告」攜手發揮一加一大於二的綜效，讓生意天天開紅盤，業績量一年比一年更亮眼!\r\n&lt;/p&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/table&gt;', 0),
(8, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」 被Yahoo的產業成功案例報導了呢！', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 3, '&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-size:13px; color:#444; font-family:Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; line-height:150%; margin:0&quot; width=&quot;100%&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n				&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n					口碑一流，受到顧客愛戴的團體服品牌「印樂網」​&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」是一間專門提供多元與超值的團體服印製公司，長年經營的好口碑深得客戶信賴，服務項目包含網版絹印、電腦刺繡、數位膠膜、昇華彩印等，並承接系服、團體服、班服、訂做團體服、印T恤、訂做抱枕、制服訂做等各式業務。舉凡T恤、Polo衫、頭巾、活動T、棒球帽、班系服、公司制服、活動禮品等各種需求「印樂網」皆能保證完美呈現!&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」對客戶的承諾是全程台灣印製、SGS檢驗合格，且還有1000萬責任險+ISO 9001國際品質保證+美國棉，至今已累積超過3000多名客戶的真心推薦，不僅品質滿意，交件準時，印製數量彈性又大，不論是少量或是多達萬件的需求，「印樂網」一律來者不拒，最重要的是都能交出令客戶滿意的衣服。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					為了服務更廣大的民眾，「印樂網」設有全台北中南共5支客服專線，甚至更走出台灣，在馬來西亞、上海、香港都設有辦事處來服務各地的華人朋友。而且在網站上完全公開透明的價目表，更是讓新客戶感受到「印樂網」的誠意與保障。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n					「印樂網」透過最划算的「關鍵字廣告」將優質服務傳播出去&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					現今，網路幾乎已成為所有企業不可或缺的宣傳管道，而如何透過網路讓最多人能最快速地找到「印樂網」呢? 台灣最大的入口網站「Yahoo!奇摩」成為最佳的選擇，曝光免費、點擊才計費的關鍵字廣告，則是最適合中小企業的網路行銷方式。&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					「印樂網」加入Yahoo!奇摩關鍵字廣告之後，訂單量扶搖直上，因為藉由專業顧問與編輯的操作，充分發揮了精準行銷的優勢。顧問將「印樂網」所提供的全部服務列出來，根據長年觀察的搜尋量來挑選衍生關鍵字，再分門別類為不同的廣告群組觀察成效。除此之外，為了提升廣告精準度還增加了地區字組，以此過濾掉非服務地區的網友進入官網，影響成效。所以，當網友想訂製團體工作服時，只要上網搜尋相關字，第一眼就能看到「印樂網」是符合其需求的最佳選擇，如此關鍵字廣告很快地替「印樂網」得到了一筆潛在訂單，且因為文案內容100%地符合網友需求，因此大大的提升了交易成功率，讓作生意變得超有效率!&lt;/p&gt;\r\n				&lt;br /&gt;\r\n				&lt;p&gt;\r\n					曾經服務過各大知名企業的「印樂網」與台灣最知名的「Yahoo!奇摩關鍵字廣告」攜手發揮一加一大於二的綜效，讓生意天天開紅盤，業績量一年比一年更亮眼!&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', 0),
(9, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」 被Yahoo的產業成功案例報導了呢', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 0, NULL, 0),
(10, '口碑一流，受到顧客愛戴的團體服品牌「印樂網」', 'data/demo/img10.jpg', 'data/uploads/img66.jpg', 0, '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; border=&quot;0&quot; width=&quot;100%&quot; style=&quot;font-size:13px; color:#444; font-family:Arial, ''Microsoft JhengHei'', Helvetica, sans-serif; line-height:150%; margin:0&quot;&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;口碑一流，受到顧客愛戴的團體服品牌「印樂網」​&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」是一間專門提供多元與超值的團體服印製公司，長年經營的好口碑深得客戶信賴，服務項目包含網版絹印、電腦刺繡、數位膠膜、昇華彩印等，並承接系服、團體服、班服、訂做團體服、印T恤、訂做抱枕、制服訂做等各式業務。舉凡T恤、Polo衫、頭巾、活動T、棒球帽、班系服、公司制服、活動禮品等各種需求「印樂網」皆能保證完美呈現!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」對客戶的承諾是全程台灣印製、SGS檢驗合格，且還有1000萬責任險+ISO 9001國際品質保證+美國棉，至今已累積超過3000多名客戶的真心推薦，不僅品質滿意，交件準時，印製數量彈性又大，不論是少量或是多達萬件的需求，「印樂網」一律來者不拒，最重要的是都能交出令客戶滿意的衣服。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n為了服務更廣大的民眾，「印樂網」設有全台北中南共5支客服專線，甚至更走出台灣，在馬來西亞、上海、香港都設有辦事處來服務各地的華人朋友。而且在網站上完全公開透明的價目表，更是讓新客戶感受到「印樂網」的誠意與保障。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p style=&quot;font-size:15px; color:#000; font-weight:bold&quot;&gt;\r\n「印樂網」透過最划算的「關鍵字廣告」將優質服務傳播出去\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n現今，網路幾乎已成為所有企業不可或缺的宣傳管道，而如何透過網路讓最多人能最快速地找到「印樂網」呢? 台灣最大的入口網站「Yahoo!奇摩」成為最佳的選擇，曝光免費、點擊才計費的關鍵字廣告，則是最適合中小企業的網路行銷方式。\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n「印樂網」加入Yahoo!奇摩關鍵字廣告之後，訂單量扶搖直上，因為藉由專業顧問與編輯的操作，充分發揮了精準行銷的優勢。顧問將「印樂網」所提供的全部服務列出來，根據長年觀察的搜尋量來挑選衍生關鍵字，再分門別類為不同的廣告群組觀察成效。除此之外，為了提升廣告精準度還增加了地區字組，以此過濾掉非服務地區的網友進入官網，影響成效。所以，當網友想訂製團體工作服時，只要上網搜尋相關字，第一眼就能看到「印樂網」是符合其需求的最佳選擇，如此關鍵字廣告很快地替「印樂網」得到了一筆潛在訂單，且因為文案內容100%地符合網友需求，因此大大的提升了交易成功率，讓作生意變得超有效率!\r\n&lt;/p&gt;\r\n&lt;br&gt;\r\n&lt;p&gt;\r\n曾經服務過各大知名企業的「印樂網」與台灣最知名的「Yahoo!奇摩關鍵字廣告」攜手發揮一加一大於二的綜效，讓生意天天開紅盤，業績量一年比一年更亮眼!\r\n&lt;/p&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/table&gt;', 1);

-- --------------------------------------------------------

--
-- 資料表格式： `manufacturer_to_store`
--

DROP TABLE IF EXISTS `manufacturer_to_store`;
CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_type_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime DEFAULT NULL,
  `download` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 列出以下資料庫的數據： `news`
--

INSERT INTO `news` (`news_id`, `news_type_id`, `image`, `bottom`, `sort_order`, `status`, `date_added`, `download`) VALUES
(14, 1, 'data/icon/title-activity.png', 0, 50, 1, '2015-02-09 00:00:00', '1449456352.pdf'),
(15, 1, '', 0, 3, 1, '2015-12-25 00:00:00', '1449456303.gif'),
(24, 11, 'data/IMG_6396.JPG', 0, 15, 1, '2015-12-29 00:00:00', '1451402696.pdf'),
(19, 11, '', 0, 10, 1, '2015-12-31 00:00:00', '1449455354.gif'),
(20, 11, 'data/最新消息/20151229174855.png', 0, 1, 1, '2015-12-08 00:00:00', '1451382594.pdf'),
(22, 11, '', 0, 0, 1, '2015-12-15 16:07:06', ''),
(23, 1, 'data/20151216114450.png', 0, 1, 1, '2015-12-16 11:45:25', '1450237514.pdf');

-- --------------------------------------------------------

--
-- 資料表格式： `news_description`
--

DROP TABLE IF EXISTS `news_description`;
CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`news_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `news_description`
--

INSERT INTO `news_description` (`news_id`, `language_id`, `title`, `description`) VALUES
(14, 1, '2015/9/4 櫃買業績發表會', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 128, 128); line-height: 20.8px;&quot;&gt;本公司受邀參加2015年9月4日之櫃買業績發表會&lt;/span&gt;&lt;/p&gt;\r\n'),
(15, 1, '董事長傳承訊息', '&lt;p&gt;本公司責任董事長陳國雄先生，一手創立銘旺實業，即將屆滿30週年之前夕，以薪火相傳的理念，將董事長之重責大任傳承予新任董事長陳盈镟小姐..&lt;span style=&quot;line-height: 20.8px;&quot;&gt;本公司責任董事長陳國雄先生，一手創立銘旺實業，即將屆滿30週年之前夕，以薪火相傳的理念，將董事長之重責大任傳承予新任董事長陳盈镟小姐..本公司責任董事長陳國雄先生，一手創立銘旺實業，即將屆滿30週年之前夕，以薪火相傳的理念，將董事長之重責大任傳承予新任董事長陳盈镟小姐..本公司責任董事長陳國雄先生，一手創立銘旺實業，即將屆滿30週年之前夕，以薪火相傳的理念，將董事長之重責大任傳承予新任董事長陳盈镟小姐..本公司責任董事長陳國雄先生，一手創立銘旺實業，即將屆滿30週年之前夕，以薪火相傳的理念，將董事長之重責大任傳承予新任董事長陳盈镟小姐..&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/demo/media-01.png&quot; style=&quot;width: 310px; height: 206px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(24, 1, '元伸測試1229', '&lt;p&gt;測試文字內容&lt;span style=&quot;line-height: 20.8px;&quot;&gt;測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容測試文字內容&lt;/span&gt;&lt;/p&gt;\r\n'),
(23, 1, '2015/5/19-20海外法說會', '&lt;p&gt;&lt;span style=&quot;color:#008080;&quot;&gt;本公司受邀參加2015年5月19日~20日之海外法說會&lt;/span&gt;&lt;/p&gt;\r\n'),
(20, 1, '商業周刊1385期報導', '&lt;p&gt;兩場災難 &amp;nbsp;讓它擠身台成衣三雄&lt;/p&gt;\r\n'),
(19, 1, '11111', '&lt;p&gt;11111&lt;/p&gt;\r\n'),
(22, 1, 'test', '&lt;p&gt;testtesttesttesttesttesttesttest&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- 資料表格式： `news_image`
--

DROP TABLE IF EXISTS `news_image`;
CREATE TABLE IF NOT EXISTS `news_image` (
  `news_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2396 ;

--
-- 列出以下資料庫的數據： `news_image`
--


-- --------------------------------------------------------

--
-- 資料表格式： `news_to_store`
--

DROP TABLE IF EXISTS `news_to_store`;
CREATE TABLE IF NOT EXISTS `news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `news_to_store`
--

INSERT INTO `news_to_store` (`news_id`, `store_id`) VALUES
(14, 0),
(15, 0),
(19, 0),
(20, 0),
(22, 0),
(23, 0),
(24, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `news_type`
--

DROP TABLE IF EXISTS `news_type`;
CREATE TABLE IF NOT EXISTS `news_type` (
  `news_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`news_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 列出以下資料庫的數據： `news_type`
--

INSERT INTO `news_type` (`news_type_id`, `bottom`, `sort_order`, `status`) VALUES
(1, 0, 0, 1),
(11, 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `news_type_description`
--

DROP TABLE IF EXISTS `news_type_description`;
CREATE TABLE IF NOT EXISTS `news_type_description` (
  `news_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`news_type_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `news_type_description`
--

INSERT INTO `news_type_description` (`news_type_id`, `language_id`, `title`, `description`) VALUES
(1, 1, '最新消息', ''),
(1, 2, 'News', ''),
(1, 3, 'News', ''),
(11, 1, '媒體報導', '');

-- --------------------------------------------------------

--
-- 資料表格式： `news_type_to_store`
--

DROP TABLE IF EXISTS `news_type_to_store`;
CREATE TABLE IF NOT EXISTS `news_type_to_store` (
  `news_type_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_type_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `news_type_to_store`
--

INSERT INTO `news_type_to_store` (`news_type_id`, `store_id`) VALUES
(1, 0),
(11, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 列出以下資料庫的數據： `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(13, 'image', 0);

-- --------------------------------------------------------

--
-- 資料表格式： `option_description`
--

DROP TABLE IF EXISTS `option_description`;
CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(13, 1, '顏色');

-- --------------------------------------------------------

--
-- 資料表格式： `option_value`
--

DROP TABLE IF EXISTS `option_value`;
CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 列出以下資料庫的數據： `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(51, 13, '', 0),
(50, 13, 'data/uploads/img37.jpg', 0),
(49, 13, '', 0);

-- --------------------------------------------------------

--
-- 資料表格式： `option_value_description`
--

DROP TABLE IF EXISTS `option_value_description`;
CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(51, 1, 13, '藍色'),
(50, 1, 13, '黑色'),
(49, 1, 13, '白色30N');

-- --------------------------------------------------------

--
-- 資料表格式： `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_download`
--

DROP TABLE IF EXISTS `order_download`;
CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_download`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_field`
--

DROP TABLE IF EXISTS `order_field`;
CREATE TABLE IF NOT EXISTS `order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `order_field`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_fraud`
--

DROP TABLE IF EXISTS `order_fraud`;
CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `order_fraud`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_history`
--

DROP TABLE IF EXISTS `order_history`;
CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_history`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_option`
--

DROP TABLE IF EXISTS `order_option`;
CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_option`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_product`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_recurring`
--

DROP TABLE IF EXISTS `order_recurring`;
CREATE TABLE IF NOT EXISTS `order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_recurring`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_recurring_transaction`
--

DROP TABLE IF EXISTS `order_recurring_transaction`;
CREATE TABLE IF NOT EXISTS `order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_recurring_transaction`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 列出以下資料庫的數據： `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- 資料表格式： `order_total`
--

DROP TABLE IF EXISTS `order_total`;
CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_total`
--


-- --------------------------------------------------------

--
-- 資料表格式： `order_voucher`
--

DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `order_voucher`
--


-- --------------------------------------------------------

--
-- 資料表格式： `print`
--

DROP TABLE IF EXISTS `print`;
CREATE TABLE IF NOT EXISTS `print` (
  `print_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `type` varchar(4) NOT NULL,
  PRIMARY KEY (`print_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 列出以下資料庫的數據： `print`
--

INSERT INTO `print` (`print_id`, `title`, `type`) VALUES
(1, '網印', 'A'),
(2, '數位膠膜', 'B'),
(3, '印刷膠膜', 'C'),
(4, '昇華', 'D'),
(5, '刺繡', 'E'),
(6, '直噴', 'F');

-- --------------------------------------------------------

--
-- 資料表格式： `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `download` varchar(255) NOT NULL,
  `ishome` int(1) NOT NULL DEFAULT '0',
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `design` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `other_size` varchar(255) DEFAULT NULL,
  `other_size_link` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `print` varchar(255) DEFAULT NULL,
  `min_qty` varchar(100) DEFAULT NULL,
  `min_qty_text` varchar(255) DEFAULT NULL,
  `max_qty` varchar(100) DEFAULT NULL,
  `max_qty_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- 列出以下資料庫的數據： `product`
--

INSERT INTO `product` (`product_id`, `model`, `download`, `ishome`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `design`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`, `other_size`, `other_size_link`, `size`, `print`, `min_qty`, `min_qty_text`, `max_qty`, `max_qty_text`) VALUES
(67, '', '', 0, '', '', '', '', '', 0, 0, 'data/demo/big_img1.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-08', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 5, 1, '2015-12-09 01:49:07', '2015-12-09 01:49:07', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(68, '', '', 0, '', '', '', '', '', 0, 0, 'data/demo/big_img2.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-08', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 4, 1, '2015-12-09 01:50:22', '2015-12-09 01:50:22', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(69, '', '', 0, '', '', '', '', '', 0, 0, 'data/demo/big_img3.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-08', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 3, 1, '2015-12-09 01:50:56', '2015-12-09 01:50:56', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(70, '', '', 0, '', '', '', '', '', 0, 0, 'data/demo/big_img4.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-08', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 2, 1, '2015-12-09 01:51:42', '2015-12-09 01:52:31', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(71, '', '', 0, '', '', '', '', '', 0, 0, 'data/demo/big_img5.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-08', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 1, 1, '2015-12-09 01:52:10', '2015-12-09 01:53:07', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(72, '', '', 0, '', '', '', '', '', 0, 0, 'data/products/20151211163553.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-10', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 0, 1, '2015-12-11 16:36:03', '2015-12-11 16:36:03', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL),
(73, '', '', 0, '', '', '', '', '', 0, 0, 'data/products/20151211163843.jpg', NULL, 0, 1, 0.0000, 0, 0, '2015-12-10', 0.00000000, 0, 0.00000000, 0.00000000, 0.00000000, 0, 1, 1, 10, 1, '2015-12-11 16:39:28', '2015-12-11 16:39:28', 0, NULL, NULL, 'N;', 'N;', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT '0',
  `language_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` varchar(100) DEFAULT NULL,
  `field10` varchar(100) DEFAULT NULL,
  `field11` varchar(100) DEFAULT NULL,
  `field12` varchar(100) DEFAULT NULL,
  `field13` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `field14` varchar(100) DEFAULT NULL,
  `field15` varchar(100) DEFAULT NULL,
  `field16` varchar(100) DEFAULT NULL,
  `field17` varchar(100) DEFAULT NULL,
  `field18` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=464 ;

--
-- 列出以下資料庫的數據： `product_attribute`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_description`
--

DROP TABLE IF EXISTS `product_description`;
CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `name_en`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(67, 1, 'Suede lined Collar', '', 'Gentle feel against the skin during full range of motion.', 'Lightest-weight long sleeve with thumb loops &amp; moisture wicking fabric than breathes even as it adds a bit warmth. It’s great shown off on it’s own or layered underneath. (*seams not sealed)', '&lt;br /&gt;\r\n&lt;font size=''1''&gt;&lt;table class=''xdebug-error'' dir=''ltr'' border=''1'' cellspacing=''0'' cellpadding=''1''&gt;\r\n&lt;tr&gt;&lt;th align=''left'' bgcolor=''#f57900'' colspan=&quot;5&quot;&gt;&lt;span style=''background-color: #cc0000; color: #fce94f;', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(68, 1, 'Suede lined Collar', '', 'Gentle feel against the skin during full range of motion.', 'This fabric combined with polyester this keeps you looking and feeling cool and dry throughout the workout (*seams not sealed)', '&lt;br /&gt;\r\n&lt;font size=''1''&gt;&lt;table class=''xdebug-error'' dir=''ltr'' border=''1'' cellspacing=''0'' cellpadding=''1''&gt;\r\n&lt;tr&gt;&lt;th align=''left'' bgcolor=''#f57900'' colspan=&quot;5&quot;&gt;&lt;span style=''background-color: #cc0000; color: #fce94f;', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(69, 1, 'Hooded Collar', '', 'Our hooded tops are the perfect option for those days when you need extra protection from the weather.', 'This fabric is light, breathable . (*seams not sealed)', '&lt;br /&gt;\r\n&lt;font size=''1''&gt;&lt;table class=''xdebug-error'' dir=''ltr'' border=''1'' cellspacing=''0'' cellpadding=''1''&gt;\r\n&lt;tr&gt;&lt;th align=''left'' bgcolor=''#f57900'' colspan=&quot;5&quot;&gt;&lt;span style=''background-color: #cc0000; color: #fce94f;', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(70, 1, '', '', '', 'Water repellent –special finishing on fabric surface, provided excellent water repellence\r\nEasy care/clean, suitable outdoor apparel.', '&lt;br /&gt;\r\n&lt;font size=''1''&gt;&lt;table class=''xdebug-error'' dir=''ltr'' border=''1'' cellspacing=''0'' cellpadding=''1''&gt;\r\n&lt;tr&gt;&lt;th align=''left'' bgcolor=''#f57900'' colspan=&quot;5&quot;&gt;&lt;span style=''background-color: #cc0000; color: #fce94f;', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(71, 1, '', '', 'Comfortable with the movement you need for enhance performance in a wide range of activities and weather condition.', 'Abrasion resistant and water resistant garment. Soft, comfortable and easy to handle.', '&lt;br /&gt;\r\n&lt;font size=''1''&gt;&lt;table class=''xdebug-error'' dir=''ltr'' border=''1'' cellspacing=''0'' cellpadding=''1''&gt;\r\n&lt;tr&gt;&lt;th align=''left'' bgcolor=''#f57900'' colspan=&quot;5&quot;&gt;&lt;span style=''background-color: #cc0000; color: #fce94f;', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(72, 1, '', '', '', '', 'Notice: Undefined index: 1 in /oz/works/vhosts/15B0335/admin/view/template/catalog/product_form.tpl on line 40\r\n', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;'),
(73, 1, 'Breahable Shell Fabric', '', 'Back Vent\r\n\r\nThis cool shell has mesh vents for added breathability\r\n\r\nAdjustable Bottom Band\r\n\r\nA stretch drawcord at the hem for custom fit.', 'The fabric is light,breathable and water-resistant.(*seams not sealed)', 'Notice: Undefined index: 1 in /oz/works/vhosts/15B0335/admin/view/template/catalog/product_form.tpl on line 40\r\n', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/data/uploads/img40.jpg&quot; style=&quot;width: 750px; height: 420px;&quot; /&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 資料表格式： `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

--
-- 列出以下資料庫的數據： `product_discount`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_filter`
--

DROP TABLE IF EXISTS `product_filter`;
CREATE TABLE IF NOT EXISTS `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_filter`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2791 ;

--
-- 列出以下資料庫的數據： `product_image`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_option`
--

DROP TABLE IF EXISTS `product_option`;
CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- 列出以下資料庫的數據： `product_option`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 列出以下資料庫的數據： `product_option_value`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_price`
--

DROP TABLE IF EXISTS `product_price`;
CREATE TABLE IF NOT EXISTS `product_price` (
  `product_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` varchar(100) DEFAULT NULL,
  `field10` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_price_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=386 ;

--
-- 列出以下資料庫的數據： `product_price`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_profile`
--

DROP TABLE IF EXISTS `product_profile`;
CREATE TABLE IF NOT EXISTS `product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_profile`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_recurring`
--

DROP TABLE IF EXISTS `product_recurring`;
CREATE TABLE IF NOT EXISTS `product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_recurring`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_related`
--

DROP TABLE IF EXISTS `product_related`;
CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_related`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_reward`
--

DROP TABLE IF EXISTS `product_reward`;
CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=686 ;

--
-- 列出以下資料庫的數據： `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(620, 0, 1, 0),
(623, 0, 1, 0),
(622, 0, 1, 0),
(621, 0, 1, 0),
(616, 0, 1, 0),
(615, 0, 1, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `product_special`
--

DROP TABLE IF EXISTS `product_special`;
CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- 列出以下資料庫的數據： `product_special`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_to_category`
--

DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(0, 65);

-- --------------------------------------------------------

--
-- 資料表格式： `product_to_download`
--

DROP TABLE IF EXISTS `product_to_download`;
CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_to_download`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_to_layout`
--

DROP TABLE IF EXISTS `product_to_layout`;
CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_to_layout`
--


-- --------------------------------------------------------

--
-- 資料表格式： `product_to_store`
--

DROP TABLE IF EXISTS `product_to_store`;
CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(0, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 列出以下資料庫的數據： `profile`
--

INSERT INTO `profile` (`profile_id`, `sort_order`, `status`, `price`, `frequency`, `duration`, `cycle`, `trial_status`, `trial_price`, `trial_frequency`, `trial_duration`, `trial_cycle`) VALUES
(1, 0, 0, 0.0000, 'day', 0, 1, 0, 0.0000, 'day', 0, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `profile_description`
--

DROP TABLE IF EXISTS `profile_description`;
CREATE TABLE IF NOT EXISTS `profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `profile_description`
--

INSERT INTO `profile_description` (`profile_id`, `language_id`, `name`) VALUES
(1, 1, '222');

-- --------------------------------------------------------

--
-- 資料表格式： `return`
--

DROP TABLE IF EXISTS `return`;
CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `return`
--


-- --------------------------------------------------------

--
-- 資料表格式： `return_action`
--

DROP TABLE IF EXISTS `return_action`;
CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- 資料表格式： `return_history`
--

DROP TABLE IF EXISTS `return_history`;
CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `return_history`
--


-- --------------------------------------------------------

--
-- 資料表格式： `return_reason`
--

DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 列出以下資料庫的數據： `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- 資料表格式： `return_status`
--

DROP TABLE IF EXISTS `return_status`;
CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 列出以下資料庫的數據： `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- 資料表格式： `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `review`
--


-- --------------------------------------------------------

--
-- 資料表格式： `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5405 ;

--
-- 列出以下資料庫的數據： `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(38, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:10:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"-1";}}', 1),
(39, 0, 'featured', 'featured_product', '43,40,42,49,46,47,28', 0),
(40, 0, 'featured', 'featured_module', 'a:1:{i:0;a:8:{s:5:"limit";s:1:"6";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(57, 0, 'category', 'category_module', 'a:2:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:5:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(108, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:8:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"980";s:6:"height";s:3:"280";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(109, 0, 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"182";s:6:"height";s:3:"182";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(5397, 0, 'config', 'config_file_mime_allowed', 'image/gif\r\napplication/pdf', NULL),
(5396, 0, 'config', 'config_file_extension_allowed', 'pdf\r\ngif', NULL),
(5395, 0, 'config', 'config_seo_url', '0', NULL),
(5394, 0, 'config', 'config_robots', '', NULL),
(5392, 0, 'config', 'config_secure', '0', NULL),
(5393, 0, 'config', 'config_shared', '0', NULL),
(5391, 0, 'config', 'config_fraud_score', '', NULL),
(5390, 0, 'config', 'config_fraud_key', '', NULL),
(5389, 0, 'config', 'config_fraud_detection', '0', NULL),
(5388, 0, 'config', 'config_google_analytics', '', NULL),
(5387, 0, 'config', 'config_alert_emails', 'IR@haksport.com,youly@ozchamp.net', NULL),
(5386, 0, 'config', 'config_account_mail', '0', NULL),
(5384, 0, 'config', 'config_smtp_timeout', '5', NULL),
(5385, 0, 'config', 'config_alert_mail', '0', NULL),
(5383, 0, 'config', 'config_smtp_port', '465', NULL),
(5381, 0, 'config', 'config_smtp_username', 'bestmarkcn@gmail.com', NULL),
(5382, 0, 'config', 'config_smtp_password', '87585548', NULL),
(5380, 0, 'config', 'config_smtp_host', 'ssl://smtp.gmail.com', NULL),
(5378, 0, 'config', 'config_mail_protocol', 'smtp', NULL),
(5379, 0, 'config', 'config_mail_parameter', '', NULL),
(5375, 0, 'config', 'config_ftp_password', '', NULL),
(5376, 0, 'config', 'config_ftp_root', '', NULL),
(5377, 0, 'config', 'config_ftp_status', '0', NULL),
(5373, 0, 'config', 'config_ftp_port', '21', NULL),
(5374, 0, 'config', 'config_ftp_username', '', NULL),
(5372, 0, 'config', 'config_ftp_host', 'localhost', NULL),
(5371, 0, 'config', 'config_image_cart_height', '', NULL),
(5370, 0, 'config', 'config_image_cart_width', '', NULL),
(5369, 0, 'config', 'config_image_wishlist_height', '', NULL),
(5368, 0, 'config', 'config_image_wishlist_width', '', NULL),
(5367, 0, 'config', 'config_image_compare_height', '', NULL),
(5365, 0, 'config', 'config_image_related_height', '', NULL),
(5366, 0, 'config', 'config_image_compare_width', '', NULL),
(5364, 0, 'config', 'config_image_related_width', '', NULL),
(5363, 0, 'config', 'config_image_additional_height', '', NULL),
(5362, 0, 'config', 'config_image_additional_width', '', NULL),
(5361, 0, 'config', 'config_image_product_height', '', NULL),
(5360, 0, 'config', 'config_image_product_width', '', NULL),
(5359, 0, 'config', 'config_image_popup_height', '', NULL),
(5358, 0, 'config', 'config_image_popup_width', '', NULL),
(5357, 0, 'config', 'config_image_thumb_height', '', NULL),
(5356, 0, 'config', 'config_image_thumb_width', '', NULL),
(5355, 0, 'config', 'config_image_category_height', '', NULL),
(5354, 0, 'config', 'config_image_category_width', '', NULL),
(5353, 0, 'config', 'config_icon', '', NULL),
(5352, 0, 'config', 'config_logo', '', NULL),
(5351, 0, 'config', 'config_return_status_id', '2', NULL),
(5350, 0, 'config', 'config_return_id', '0', NULL),
(5349, 0, 'config', 'config_commission', '5.00', NULL),
(5348, 0, 'config', 'config_affiliate_id', '0', NULL),
(5347, 0, 'config', 'config_stock_checkout', '0', NULL),
(5346, 0, 'config', 'config_stock_warning', '0', NULL),
(5345, 0, 'config', 'config_stock_display', '0', NULL),
(5344, 0, 'config', 'config_invoice_prefix', 'INV-2015-00', NULL),
(5343, 0, 'config', 'config_order_edit', '7', NULL),
(5342, 0, 'config', 'config_checkout_id', '0', NULL),
(5341, 0, 'config', 'config_guest_checkout', '0', NULL),
(5339, 0, 'config', 'config_account_id', '0', NULL),
(5340, 0, 'config', 'config_cart_weight', '0', NULL),
(5338, 0, 'config', 'config_customer_price', '0', NULL),
(5337, 0, 'config', 'config_customer_group_id', '1', NULL),
(5336, 0, 'config', 'config_customer_online', '0', NULL),
(5335, 0, 'config', 'config_tax_customer', '', NULL),
(5334, 0, 'config', 'config_tax_default', '', NULL),
(5333, 0, 'config', 'config_vat', '0', NULL),
(5329, 0, 'config', 'config_download', '0', NULL),
(5330, 0, 'config', 'config_voucher_min', '', NULL),
(5331, 0, 'config', 'config_voucher_max', '', NULL),
(5332, 0, 'config', 'config_tax', '0', NULL),
(5328, 0, 'config', 'config_review_status', '0', NULL),
(5327, 0, 'config', 'config_product_count', '0', NULL),
(5326, 0, 'config', 'config_admin_limit', '10', NULL),
(5325, 0, 'config', 'config_catalog_limit', 'Notice: Undefined variable: config_catalog_limit in /oz/works/vhosts/15B0335/admin/view/template/setting/setting.tpl on line 205', NULL),
(5324, 0, 'config', 'config_currency_auto', '0', NULL),
(5323, 0, 'config', 'config_currency', 'NTD', NULL),
(5322, 0, 'config', 'config_admin_language', 'zh-TW', NULL),
(5321, 0, 'config', 'config_language', 'zh-TW', NULL),
(5320, 0, 'config', 'config_zone_id', '', NULL),
(5319, 0, 'config', 'config_country_id', '11', NULL),
(5318, 0, 'config', 'config_layout_id', '6', NULL),
(5317, 0, 'config', 'config_template', 'default', NULL),
(5316, 0, 'config', 'config_meta_description1', '', NULL),
(5315, 0, 'config', 'config_title1', '', NULL),
(5314, 0, 'config', 'config_fax1', '', NULL),
(5313, 0, 'config', 'config_address1', '', NULL),
(5312, 0, 'config', 'config_telephone1', '', NULL),
(5311, 0, 'config', 'config_email1', '419326086@qq.com,IR@haksport.com', NULL),
(5310, 0, 'config', 'config_owner1', '', NULL),
(5309, 0, 'config', 'config_name1', '銘旺實業股份有限公司 - HAKERS ENTERPRISE CO., LTD.', NULL),
(5398, 0, 'config', 'config_maintenance', '0', NULL),
(5399, 0, 'config', 'config_password', '0', NULL),
(5400, 0, 'config', 'config_encryption', '', NULL),
(5401, 0, 'config', 'config_compression', '', NULL),
(5402, 0, 'config', 'config_error_display', '0', NULL),
(5403, 0, 'config', 'config_error_log', '0', NULL),
(5404, 0, 'config', 'config_error_filename', '', NULL);

-- --------------------------------------------------------

--
-- 資料表格式： `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 列出以下資料庫的數據： `size`
--

INSERT INTO `size` (`size_id`, `title`, `unit`) VALUES
(1, '2T', 'cm'),
(2, '3T', 'mm'),
(3, '110cm', 'in'),
(4, '130cm', ''),
(5, '150cm', ''),
(6, '8', ''),
(7, '10', ''),
(8, '12', ''),
(9, 'XS', ''),
(10, 'S', ''),
(11, 'M', ''),
(12, 'L', ''),
(13, 'XL', ''),
(14, '2XL', ''),
(15, '3XL', ''),
(16, '4XL', ''),
(17, '5XL', '');

-- --------------------------------------------------------

--
-- 資料表格式： `stock_status`
--

DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 列出以下資料庫的數據： `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days');

-- --------------------------------------------------------

--
-- 資料表格式： `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `store`
--


-- --------------------------------------------------------

--
-- 資料表格式： `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 列出以下資料庫的數據： `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- 資料表格式： `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 列出以下資料庫的數據： `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', 17.5000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- 資料表格式： `tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `tax_rate_to_customer_group`;
CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `tax_rate_to_customer_group`
--

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- 資料表格式： `tax_rule`
--

DROP TABLE IF EXISTS `tax_rule`;
CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- 列出以下資料庫的數據： `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- 資料表格式： `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=787 ;

--
-- 列出以下資料庫的數據： `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(786, 'information_id=4', 'about_us');

-- --------------------------------------------------------

--
-- 資料表格式： `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `code` varchar(40) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 列出以下資料庫的數據： `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `phone`, `image`, `code`, `mobile`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '3a3c2ec4e83c05940b4a1d79d76848296f4cc666', '65c94cfbd', '洪俊祥', '', 'hjx210@163.com', '86001133', 'data/cart.png', '', '13950427541', '61.154.2.36', 1, '2014-12-15 17:55:02'),
(4, 1, 'customer', 'a59e4a186c4c45109700c3ce4b29bb8c58b07795', '18af2f78e', 'customer', '', '', '', '', '', '', '123.195.154.209', 1, '2015-12-15 16:34:28');

-- --------------------------------------------------------

--
-- 資料表格式： `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 列出以下資料庫的數據： `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, '總管理員', 'a:2:{s:6:"access";a:25:{i:0;s:7:"ask/ask";i:1;s:12:"ask/ask_type";i:2;s:16:"catalog/category";i:3;s:15:"catalog/contact";i:4;s:19:"catalog/information";i:5;s:15:"catalog/inquiry";i:6;s:20:"catalog/manufacturer";i:7;s:15:"catalog/product";i:8;s:18:"common/filemanager";i:9;s:13:"common/update";i:10;s:13:"design/banner";i:11;s:20:"localisation/country";i:12;s:21:"localisation/currency";i:13;s:21:"localisation/language";i:14;s:17:"localisation/zone";i:15;s:9:"news/news";i:16;s:14:"news/news_type";i:17;s:13:"sale/customer";i:18;s:19:"sale/customer_group";i:19;s:15:"setting/setting";i:20;s:13:"setting/store";i:21;s:11:"tool/backup";i:22;s:12:"tool/sitemap";i:23;s:9:"user/user";i:24;s:20:"user/user_permission";}s:6:"modify";a:25:{i:0;s:7:"ask/ask";i:1;s:12:"ask/ask_type";i:2;s:16:"catalog/category";i:3;s:15:"catalog/contact";i:4;s:19:"catalog/information";i:5;s:15:"catalog/inquiry";i:6;s:20:"catalog/manufacturer";i:7;s:15:"catalog/product";i:8;s:18:"common/filemanager";i:9;s:13:"common/update";i:10;s:13:"design/banner";i:11;s:20:"localisation/country";i:12;s:21:"localisation/currency";i:13;s:21:"localisation/language";i:14;s:17:"localisation/zone";i:15;s:9:"news/news";i:16;s:14:"news/news_type";i:17;s:13:"sale/customer";i:18;s:19:"sale/customer_group";i:19;s:15:"setting/setting";i:20;s:13:"setting/store";i:21;s:11:"tool/backup";i:22;s:12:"tool/sitemap";i:23;s:9:"user/user";i:24;s:20:"user/user_permission";}}');

-- --------------------------------------------------------

--
-- 資料表格式： `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `voucher`
--


-- --------------------------------------------------------

--
-- 資料表格式： `voucher_history`
--

DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 列出以下資料庫的數據： `voucher_history`
--


-- --------------------------------------------------------

--
-- 資料表格式： `voucher_theme`
--

DROP TABLE IF EXISTS `voucher_theme`;
CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 列出以下資料庫的數據： `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 資料表格式： `voucher_theme_description`
--

DROP TABLE IF EXISTS `voucher_theme_description`;
CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 列出以下資料庫的數據： `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- 資料表格式： `weight_class`
--

DROP TABLE IF EXISTS `weight_class`;
CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 列出以下資料庫的數據： `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- 資料表格式： `weight_class_description`
--

DROP TABLE IF EXISTS `weight_class_description`;
CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 列出以下資料庫的數據： `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- 資料表格式： `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='郵區號' AUTO_INCREMENT=374 ;

--
-- 列出以下資料庫的數據： `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `zone_name`, `status`, `sort_order`) VALUES
(1, 1, '(205)暖暖區', '205', '暖暖區', 1, 1),
(2, 1, '(206)七堵區', '206', '七堵區', 1, 2),
(3, 1, '(203)中山區', '203', '中山區', 1, 3),
(4, 1, '(204)安樂區', '204', '安樂區', 1, 4),
(5, 1, '(200)仁愛區', '200', '仁愛區', 1, 5),
(6, 1, '(201)信義區', '201', '信義區', 1, 6),
(7, 1, '(202)中正區', '202', '中正區', 1, 7),
(8, 2, '(238)樹林區', '238', '樹林區', 1, 1),
(9, 2, '(221)汐止區', '221', '汐止區', 1, 2),
(10, 2, '(247)蘆洲區', '247', '蘆洲區', 1, 3),
(11, 2, '(236)土城區', '236', '土城區', 1, 4),
(12, 2, '(233)烏來區', '233', '烏來區', 1, 5),
(13, 2, '(207)萬里區', '207', '萬里區', 1, 6),
(14, 2, '(208)金山區', '208', '金山區', 1, 7),
(15, 2, '(228)貢寮區', '228', '貢寮區', 1, 8),
(16, 2, '(227)雙溪區', '227', '雙溪區', 1, 9),
(17, 2, '(226)平溪區', '226', '平溪區', 1, 10),
(18, 2, '(249)八里區', '249', '八里區', 1, 11),
(19, 2, '(253)石門區', '253', '石門區', 1, 12),
(20, 2, '(252)三芝區', '252', '三芝區', 1, 13),
(21, 2, '(232)坪林區', '232', '坪林區', 1, 14),
(22, 2, '(223)石碇區', '223', '石碇區', 1, 15),
(23, 2, '(222)深坑區', '222', '深坑區', 1, 16),
(24, 2, '(244)林口區', '244', '林口區', 1, 17),
(25, 2, '(243)泰山區', '243', '泰山區', 1, 18),
(26, 2, '(248)五股區', '248', '五股區', 1, 19),
(27, 2, '(224)瑞芳區', '224', '瑞芳區', 1, 20),
(28, 2, '(251)淡水區', '251', '淡水區', 1, 21),
(29, 2, '(237)三峽區', '237', '三峽區', 1, 22),
(30, 2, '(239)鶯歌區', '239', '鶯歌區', 1, 23),
(31, 2, '(231)新店區', '231', '新店區', 1, 24),
(32, 2, '(242)新莊區', '242', '新莊區', 1, 25),
(33, 2, '(235)中和區', '235', '中和區', 1, 26),
(34, 2, '(234)永和區', '234', '永和區', 1, 27),
(35, 2, '(241)三重區', '241', '三重區', 1, 28),
(36, 2, '(220)板橋區', '220', '板橋區', 1, 29),
(37, 3, '(116)文山區', '116', '文山區', 1, 1),
(38, 4, '(334)八德區', '334', '八德市', 1, 1),
(39, 5, '(302)竹北市', '302', '竹北市', 1, 1),
(40, 6, '香山區', '', '香山區', 1, 1),
(41, 8, '(411)太平市', '411', '太平市', 1, 1),
(42, 7, '(365)泰安鄉', '365', '泰安鄉', 1, 1),
(43, 8, '(412)大里區', '412', '大里市', 1, 2),
(44, 3, '(108)萬華區', '108', '萬華區', 1, 2),
(45, 3, ' (100)中正區', '100', ' 中正區', 1, 3),
(46, 3, '(110)信義區', '110', '信義區', 1, 4),
(371, 3, '(112)北投區', '112', NULL, 1, 0),
(48, 3, '(111)士林區 ', '111', '士林區 ', 1, 6),
(49, 3, '(114)內湖區', '114', '內湖區', 1, 7),
(50, 3, '(115)南港區', '115', '南港區', 1, 8),
(370, 3, '(104)中山區', '104', NULL, 1, 0),
(52, 3, '(103)大同區', '103', '大同區', 1, 10),
(53, 3, '(106)大安區', '106', '大安區', 1, 11),
(54, 3, '(105)松山區', '105', '松山區', 1, 12),
(55, 4, '(324)平鎮區', '324', '平鎮市 ', 1, 2),
(56, 4, '(336)復興區', '336', '復興鄉', 1, 3),
(57, 4, ' (328)觀音區', '328', ' 觀音鄉', 1, 4),
(58, 4, ' (327)新屋區', '327', ' 新屋鄉', 1, 5),
(59, 4, '(325)龍潭區', '325', '龍潭鄉', 1, 6),
(60, 4, '(333)龜山區', '333', '龜山鄉', 1, 7),
(61, 4, '(337)大園區', '337', '大園鄉', 1, 8),
(62, 4, '(338)蘆竹區', '338', '蘆竹鄉', 1, 9),
(63, 4, '(326)楊梅區', '326', '楊梅鎮', 1, 11),
(64, 4, '(335)大溪區', '335', '大溪鎮', 1, 12),
(65, 4, '(320)中壢區', '320', '中壢市', 1, 13),
(66, 4, '(330)桃園區', '330', '桃園市 ', 1, 14),
(67, 5, '(311)五峰鄉', '311', '五峰鄉', 1, 2),
(68, 5, ' (313)尖石鄉 ', '313', ' 尖石鄉 ', 1, 3),
(69, 5, ' (315)峨眉鄉', '315', ' 峨眉鄉', 1, 4),
(70, 5, '(314)北埔鄉 ', '314', '北埔鄉 ', 1, 5),
(71, 5, ' (308)寶山鄉', '308', ' 寶山鄉', 1, 6),
(72, 5, ' (307)芎林鄉', '307', ' 芎林鄉', 1, 7),
(73, 5, '(304)新豐鄉', '304', '新豐鄉', 1, 8),
(74, 5, '(312)橫山鄉 ', '312', '橫山鄉 ', 1, 9),
(75, 5, '(303)湖口鄉  ', '303', '湖口鄉  ', 1, 10),
(76, 5, '(310)竹東鎮', '310', '竹東鎮', 1, 11),
(77, 5, '(305)新埔鎮 ', '305', '新埔鎮 ', 1, 12),
(78, 5, '(306)關西鎮', '306', '關西鎮', 1, 13),
(79, 7, '(354)獅潭鄉', '354', '獅潭鄉', 1, 2),
(80, 7, ' (352)三灣鄉', '352', ' 三灣鄉', 1, 3),
(81, 7, '(361)造橋鄉', '361', '造橋鄉', 1, 4),
(82, 7, '(368)西湖鄉 ', '368', '西湖鄉 ', 1, 5),
(83, 7, '(367)三義鄉', '367', '三義鄉', 1, 6),
(84, 7, '(362)頭屋鄉', '362', '頭屋鄉', 1, 7),
(85, 7, '(353)南庄鄉 ', '353', '南庄鄉 ', 1, 8),
(86, 7, ' (366)銅鑼鄉 ', '366', ' 銅鑼鄉 ', 1, 9),
(87, 7, '(363)公館鄉 ', '363', '公館鄉 ', 1, 10),
(88, 7, '(364)大湖鄉', '364', '大湖鄉', 1, 11),
(89, 7, '(369)卓蘭鎮 ', '369', '卓蘭鎮 ', 1, 12),
(90, 7, '(356)後龍鎮', '356', '後龍鎮', 1, 13),
(91, 7, '(351)頭份鎮', '351', '頭份鎮', 1, 14),
(92, 7, '(350)竹南鎮', '350', '竹南鎮', 1, 15),
(93, 7, '(357)通霄鎮', '357', '通霄鎮', 1, 16),
(94, 7, '(358)苑裡鎮', '358', '苑裡鎮', 1, 17),
(95, 7, '(360)苗栗市', '360', '苗栗市', 1, 18),
(96, 6, '北區', '', '北區', 1, 2),
(97, 6, '東區', '', '東區', 1, 3),
(98, 8, '(424)和平區 ', '424', '和平區 ', 1, 3),
(99, 8, '(413)霧峰區 ', '413', '霧峰區 ', 1, 4),
(100, 8, '(434)龍井區 ', '434', '龍井區 ', 1, 5),
(101, 8, '(432)大肚區 ', '432', '大肚區 ', 1, 6),
(102, 8, '(414)烏日區 ', '414', '烏日區 ', 1, 7),
(103, 8, '(439)大安區 ', '439', '大安區 ', 1, 8),
(104, 8, '(438)外埔區 ', '438', '外埔區 ', 1, 9),
(105, 8, '(422)石岡區 ', '422', '石岡區 ', 1, 10),
(106, 8, '(426)新社區 ', '426', '新社區 ', 1, 11),
(107, 8, '(428)大雅區 ', '428', '大雅區 ', 1, 12),
(108, 8, '(427)潭子區 ', '427', '潭子區 ', 1, 13),
(109, 8, '(429)神岡區 ', '429', '神岡區 ', 1, 14),
(110, 8, '(421)后里區 ', '421', '后里區 ', 1, 20),
(111, 8, '(435)梧棲區 ', '435', '梧棲區 ', 1, 21),
(112, 8, '(433)沙鹿區 ', '433', '沙鹿區 ', 1, 22),
(113, 8, '(436)清水區 ', '436', '清水區 ', 1, 22),
(114, 8, '(437)大甲區 ', '437', '大甲區 ', 1, 23),
(115, 8, '(423)東勢區 ', '423', '東勢區 ', 1, 24),
(116, 8, '(420)豐原區 ', '420', '豐原區 ', 1, 25),
(117, 8, '(406)北屯區', '406', '北屯區', 1, 1),
(118, 8, '(408)南屯區', '408', '南屯區', 1, 2),
(119, 8, '(407)西屯區', '407', '西屯區', 1, 3),
(120, 8, '(404)北區', '404', '北區', 1, 4),
(121, 8, '(402)南區 ', '402', '南區 ', 1, 5),
(122, 8, '(403)西區', '403', '西區', 1, 6),
(123, 8, '(401)東區', '401', '東區', 1, 7),
(124, 8, '(400)中區 ', '400', '中區 ', 1, 8),
(125, 10, '(524)溪州鄉 ', '524', '溪州鄉 ', 1, 1),
(126, 10, '(525)竹塘鄉 ', '525', '竹塘鄉 ', 1, 2),
(127, 10, '(527)大城鄉', '527', '大城鄉', 1, 3),
(128, 10, '(528)芳苑鄉', '528', '芳苑鄉', 1, 4),
(129, 10, '(523)埤頭鄉 ', '523', '埤頭鄉 ', 1, 5),
(130, 10, '(522)田尾鄉', '522', '田尾鄉', 1, 6),
(131, 10, '(530)二水鄉', '530', '二水鄉', 1, 7),
(132, 10, '(511)社頭鄉 ', '511', '社頭鄉 ', 1, 8),
(133, 10, '(512)永靖鄉', '512', '永靖鄉', 1, 9),
(134, 10, '(513)埔心鄉', '513', '埔心鄉', 1, 10),
(135, 10, '(516)埔鹽鄉 ', '516', '埔鹽鄉 ', 1, 11),
(136, 10, '(515)大村鄉 ', '515', '大村鄉 ', 1, 12),
(137, 10, '(502)芬園鄉', '502', '芬園鄉', 1, 13),
(138, 10, '(503)花壇鄉', '503', '花壇鄉', 1, 14),
(139, 10, '(504)秀水鄉 ', '504', '秀水鄉 ', 1, 15),
(140, 10, '(506)福興鄉', '506', '福興鄉', 1, 16),
(141, 10, '(509)伸港鄉 ', '509', '伸港鄉 ', 1, 17),
(142, 10, '(507)線西鄉', '507', '線西鄉', 1, 18),
(143, 10, '(526)二林鎮', '526', '二林鎮', 1, 19),
(144, 10, ' (520)田中鎮', '520', ' 田中鎮', 1, 20),
(145, 10, '(514)溪湖鎮', '514', '溪湖鎮', 1, 21),
(146, 10, '(510)員林鎮', '510', '員林鎮', 1, 22),
(147, 10, '(521)北斗鎮 ', '521', '北斗鎮 ', 1, 23),
(148, 10, '(508)和美鎮 ', '508', '和美鎮 ', 1, 24),
(149, 10, '(505)鹿港鎮', '505', '鹿港鎮', 1, 25),
(150, 10, '(500)彰化市', '500', '彰化市', 1, 26),
(151, 11, ' (546)仁愛鄉  ', '546', ' 仁愛鄉 ', 1, 1),
(152, 11, '(556)信義鄉 ', '556', '信義鄉 ', 1, 2),
(153, 11, ' (553)水里鄉', '553', ' 水里鄉', 1, 3),
(154, 11, '(544)國姓鄉', '544', '國姓鄉', 1, 4),
(155, 11, ' (555)魚池鄉 ', '555', ' 魚池鄉 ', 1, 5),
(156, 11, ' (541)中寮鄉', '541', ' 中寮鄉', 1, 6),
(157, 11, ' (558)鹿谷鄉', '558', ' 鹿谷鄉', 1, 7),
(158, 11, '(551)名間鄉 ', '551', '名間鄉 ', 1, 8),
(159, 11, '(552)集集鎮', '552', '集集鎮', 1, 9),
(160, 11, '(557)竹山鎮', '557', '竹山鎮', 1, 10),
(161, 11, '(542)草屯鎮', '542', '草屯鎮', 1, 11),
(162, 11, '(545)埔里鎮 ', '545', '埔里鎮 ', 1, 12),
(163, 11, '(540)南投市 ', '540', '南投市 ', 1, 13),
(164, 12, '(652)水林鄉', '652', '水林鄉', 1, 1),
(165, 12, '(653)口湖鄉 ', '653', '口湖鄉 ', 1, 2),
(166, 12, '(654)四湖鄉', '654', '四湖鄉', 1, 3),
(167, 12, ' (655)元長鄉 ', '655', ' 元長鄉 ', 1, 4),
(168, 12, ' (636)台西鄉 ', '636', ' 臺西鄉 ', 1, 5),
(169, 12, ' (634)褒忠鄉', '634', ' 褒忠鄉', 1, 6),
(170, 12, '(635)東勢鄉', '635', '東勢鄉', 1, 7),
(171, 12, '(638)麥寮鄉', '638', '麥寮鄉', 1, 8),
(172, 12, '(637)崙背鄉', '637', '崙背鄉', 1, 9),
(173, 12, '(649)二崙鄉', '649', '二崙鄉', 1, 10),
(174, 12, '(643)林內鄉', '643', '林內鄉', 1, 11),
(175, 12, '(647)莿桐鄉', '647', '莿桐鄉', 1, 12),
(176, 12, '(631)大埤鄉', '631', '大埤鄉', 1, 13),
(177, 12, ' (646)古坑鄉 ', '646', ' 古坑鄉 ', 1, 14),
(178, 12, '(651)北港鎮', '651', '北港鎮', 1, 15),
(179, 12, '(633)土庫鎮', '633', '土庫鎮', 1, 16),
(180, 12, '(648)西螺鎮', '648', '西螺鎮', 1, 17),
(181, 12, '(632)虎尾鎮 ', '632', '虎尾鎮 ', 1, 18),
(182, 12, '(630)斗南鎮', '630', '斗南鎮', 1, 19),
(183, 12, '(640)斗六市 ', '640', '斗六市 ', 1, 20),
(184, 13, '(613)朴子市', '613', '朴子市', 1, 1),
(185, 13, '(612)太保市', '612', '太保市', 1, 2),
(186, 13, '(605)阿里山鄉', '605', '阿里山鄉', 1, 3),
(187, 13, '(607)大埔鄉 ', '607', '大埔鄉 ', 1, 4),
(188, 13, '(602)番路鄉 ', '602', '番路鄉 ', 1, 5),
(189, 13, '(603)梅山鄉', '603', '梅山鄉', 1, 6),
(190, 13, '(604)竹崎鄉 ', '604', '竹崎鄉 ', 1, 7),
(191, 13, '(606)中埔鄉 ', '606', '中埔鄉 ', 1, 8),
(192, 13, '(608)水上鄉 ', '608', '水上鄉 ', 1, 9),
(193, 13, '(611)鹿草鄉 ', '611', '鹿草鄉 ', 1, 12),
(194, 13, '(624)義竹鄉', '624', '義竹鄉', 1, 13),
(195, 13, ' (614)東石鄉', '614', ' 東石鄉', 1, 14),
(196, 13, '(615)六腳鄉', '615', '六腳鄉', 1, 15),
(197, 13, '(616)新港鄉 ', '616', '新港鄉 ', 1, 16),
(198, 13, '(623)溪口鄉  ', '623', '溪口鄉  ', 1, 17),
(199, 13, '(621)民雄鄉', '621', '民雄鄉', 1, 18),
(200, 13, '(622)大林鎮 ', '622', '大林鎮 ', 1, 19),
(201, 13, '(625)布袋鎮', '625', '布袋鎮', 1, 20),
(202, 14, '西區', '', '西區', 1, 1),
(203, 14, '東區 ', '', '東區 ', 1, 2),
(204, 15, '(710)永康區 ', '710', '永康區 ', 1, 1),
(205, 15, '(719)龍崎區 ', '719', '龍崎區 ', 1, 2),
(206, 15, '(718)關廟區 ', '718', '關廟區 ', 1, 3),
(207, 15, '(711)歸仁區 ', '711', '歸仁區 ', 1, 4),
(208, 15, '(717)仁德區 ', '717', '仁德區 ', 1, 5),
(209, 15, '(713)左鎮區 ', '713', '左鎮區 ', 1, 6),
(210, 15, ' (716)南化區 ', '716', ' 南化區 ', 1, 7),
(211, 15, '(715)楠西區 ', '715', '楠西區 ', 1, 8),
(212, 15, ' (714)玉井區 ', '714', ' 玉井區 ', 1, 9),
(213, 15, '(743)山上區 ', '743', '山上區 ', 1, 10),
(214, 15, ' (745)安定區 ', '745', ' 安定區 ', 1, 11),
(215, 15, '(744)新市區 ', '744', '新市區 ', 1, 12),
(216, 15, '(727)北門區 ', '727', '北門區 ', 1, 13),
(217, 15, '(725)將軍區 ', '725', '將軍區 ', 1, 14),
(218, 15, '(724)七股區 ', '724', '七股區 ', 1, 15),
(219, 15, '(723)西港區 ', '723', '西港區 ', 1, 16),
(220, 15, '(742)大內區 ', '742', '(742)大內區 ', 1, 17),
(221, 15, ' (720)官田區 ', '720', ' (720)官田區 ', 1, 18),
(222, 15, ' (734)六甲區 ', '734', ' (734)六甲區 ', 1, 19),
(223, 15, '(735)下營區 ', '735', '(735)下營區 ', 1, 20),
(224, 15, '(733)東山區 ', '733', '(733)東山區 ', 1, 21),
(225, 15, '(731)後壁區 ', '731', '(731)後壁區 ', 1, 22),
(226, 15, ' (736)柳營區 ', '736', ' (736)柳營區 ', 1, 23),
(227, 15, '(726)學甲區 ', '726', '(726)學甲區 ', 1, 24),
(228, 15, '(741)善化區 ', '741', '(741)善化區 ', 1, 25),
(229, 15, '(712)新化區 ', '712', '(712)新化區 ', 1, 26),
(230, 15, '(722)佳里區 ', '722', '(722)佳里區 ', 1, 27),
(231, 15, '(721)麻豆區 ', '721', '(721)麻豆區 ', 1, 28),
(232, 15, '(732)白河區 ', '732', '(732)白河區 ', 1, 29),
(233, 15, '(737)鹽水區 ', '737', '(737)鹽水區 ', 1, 30),
(234, 15, '(730)新營區 ', '730', '(730)新營區 ', 1, 31),
(235, 15, '(709)安南區', '709', '(709)安南區', 1, 1),
(236, 15, '(708)安平區', '708', '(708)安平區', 1, 2),
(237, 15, '(704)北區', '704', '(704)北區', 1, 3),
(239, 15, '(702)南區', '702', '(702)南區', 1, 5),
(240, 15, '(700)中西區', '700', '(700)中區', 1, 6),
(241, 15, '(701)東區 ', '701', '(701)東區 ', 1, 7),
(242, 17, '(849)三民區 ', '849', '(849)三民區 ', 1, 1),
(243, 17, '(848)桃源區 ', '848', '(848)桃源區 ', 1, 2),
(244, 17, '(851)茂林區 ', '851', '(851)茂林區 ', 1, 3),
(245, 17, '(845)內門區 ', '845', '(845)內門區 ', 1, 4),
(246, 17, '(846)杉林區 ', '846', '(846)杉林區 ', 1, 5),
(247, 17, '(847)甲仙區 ', '847', '(847)甲仙區 ', 1, 6),
(248, 17, '(844)六龜區 ', '844', '(844)六龜區 ', 1, 7),
(249, 17, '(826)梓官區 ', '826', '(826)梓官區 ', 1, 8),
(250, 17, '(827)彌陀區 ', '827', '(827)彌陀區 ', 1, 9),
(251, 17, '(828)永安區 ', '828', '(828)永安區 ', 1, 10),
(252, 17, '(852)茄萣區 ', '852', '(852)茄萣區 ', 1, 11),
(253, 17, '(829)湖內區 ', '829', '(829)湖內區 ', 1, 12),
(254, 17, ' (821)路竹區 ', '821', ' (821)路竹區 ', 1, 13),
(255, 17, ' (822)阿蓮區 ', '822', ' (822)阿蓮區 ', 1, 14),
(256, 17, '(823)田寮區 ', '823', '(823)田寮區 ', 1, 15),
(257, 17, '(824)燕巢區 ', '824', '(824)燕巢區 ', 1, 16),
(258, 17, '(825)橋頭區 ', '825', '(825)橋頭區 ', 1, 17),
(259, 17, ' (833)鳥松區 ', '833', ' (833)鳥松v', 1, 18),
(260, 17, '(815)大社區 ', '815', '(815)大社區 ', 1, 19),
(261, 17, ' (814)仁武區 ', '814', ' (814)仁武區 ', 1, 20),
(262, 17, '(840)大樹區 ', '840', '(840)大樹區 ', 1, 21),
(263, 17, '(831)大寮區 ', '831', '(831)大寮區 ', 1, 22),
(264, 17, '(832)林園區 ', '832', '(832)林園區 ', 1, 23),
(265, 17, '(843)美濃區 ', '843', '(843)美濃區 ', 1, 24),
(266, 17, '(842)旗山區 ', '842', '(842)旗山區 ', 1, 25),
(267, 17, ' (820)岡山區 ', '820', ' (820)岡山區 ', 1, 26),
(268, 17, '(830)鳳山區 ', '830', '(830)鳳山區 ', 1, 27),
(269, 17, ' (812)小港區', '812', ' (812)小港區', 1, 1),
(270, 17, '(811)楠梓區', '811', '(811)楠梓區', 1, 2),
(271, 17, '(813)左營區', '831', '(813)左營區', 1, 3),
(272, 17, ' (804)鼓山區', '804', ' (804)鼓山區', 1, 4),
(273, 17, ' (803)鹽埕區', '803', ' (803)鹽埕區', 1, 5),
(274, 17, '(807)三民區', '807', '(807)三民區', 1, 6),
(275, 17, '(801)前金區', '801', '(801)前金區', 1, 7),
(276, 17, '(800)新興區', '800', '(800)新興區', 1, 8),
(277, 17, '(806)前鎮區', '806', '(806)前鎮區', 1, 9),
(278, 17, '(802)苓雅區', '802', '(802)苓雅區', 1, 10),
(279, 17, ' (805)旗津區', '805', ' (805)旗津區', 1, 11),
(280, 19, '(901)三地門鄉 ', '901', '(901)三地門鄉 ', 1, 1),
(281, 19, '(945)牡丹鄉', '945', '(945)牡丹鄉', 1, 2),
(282, 19, ' (943)獅子鄉 ', '943', ' (943)獅子鄉 ', 1, 3),
(283, 19, '(942)春日鄉', '942', '(942)春日鄉', 1, 4),
(284, 19, ' (922)來義鄉', '922', ' (922)來義鄉', 1, 5),
(285, 19, ' (921)泰武鄉', '921', ' (921)泰武鄉', 1, 6),
(286, 19, ' (903)瑪家鄉 ', '903', ' (903)瑪家鄉 ', 1, 7),
(287, 19, ' (902)霧臺鄉 ', '902', ' (902)霧臺鄉 ', 1, 8),
(288, 19, '(941)枋山鄉', '941', '(941)枋山鄉', 1, 9),
(289, 19, '(947)滿州鄉 ', '947', '(947)滿州鄉 ', 1, 10),
(290, 19, ' (944)車城鄉', '944', ' (944)車城鄉', 1, 11),
(291, 19, ' (929)琉球鄉', '929', ' (929)琉球鄉', 1, 12),
(292, 19, '(931)佳冬鄉', '931', '(931)佳冬鄉', 1, 13),
(293, 19, '(926)南州鄉', '926', '(926)南州鄉', 1, 14),
(294, 19, ' (927)林邊鄉 ', '927', ' (927)林邊鄉 ', 1, 15),
(295, 19, '(924)崁頂鄉 ', '924', '(924)崁頂鄉 ', 1, 16),
(296, 19, '(932)新園鄉', '932', '(932)新園鄉', 1, 17),
(297, 19, '(940)枋寮鄉 ', '940', '(940)枋寮鄉 ', 1, 18),
(298, 19, '(925)新埤鄉', '925', '(925)新埤鄉', 1, 19),
(299, 19, '(911)竹田鄉', '911', '(911)竹田鄉', 1, 20),
(300, 19, '(912)內埔鄉 ', '912', '(912)內埔鄉 ', 1, 21),
(301, 19, '(923)萬巒鄉', '923', '(923)萬巒鄉', 1, 22),
(302, 19, ' (906)高樹鄉', '906', ' (906)高樹鄉', 1, 23),
(303, 19, '(907)鹽埔鄉', '907', '(907)鹽埔鄉', 1, 24),
(304, 19, '(905)里港鄉', '905', '(905)里港鄉', 1, 25),
(305, 19, ' (904)九如鄉', '904', ' (904)九如鄉', 1, 26),
(306, 19, '(909)麟洛鄉 ', '909', '(909)麟洛鄉 ', 1, 27),
(307, 19, '(908)長治鄉 ', '908', '(908)長治鄉 ', 1, 28),
(308, 19, '(913)萬丹鄉', '913', '(913)萬丹鄉', 1, 29),
(309, 19, ' (946)恆春鎮 ', '946', ' (946)恆春鎮 ', 1, 30),
(310, 19, '(928)東港鎮', '928', '(928)東港鎮', 1, 31),
(311, 19, '(920)潮州鎮 ', '920', '(920)潮州鎮 ', 1, 32),
(312, 19, ' (900)屏東市 ', '900', ' (900)屏東市 ', 1, 33),
(313, 20, '(272)南澳鄉', '272', '(272)南澳鄉', 1, 1),
(314, 20, ' (267)大同鄉', '267', ' (267)大同鄉', 1, 2),
(315, 20, '(266)三星鄉 ', '266', '(266)三星鄉 ', 1, 3),
(316, 20, ' (268)五結鄉', '268', ' (268)五結鄉', 1, 4),
(317, 20, ' (269)冬山鄉', '269', ' (269)冬山鄉', 1, 5),
(318, 20, ' (264)員山鄉', '264', ' (264)員山鄉', 1, 6),
(319, 20, '(263)壯圍鄉 ', '263', '(263)壯圍鄉 ', 1, 7),
(320, 20, '(262)礁溪鄉', '262', '(262)礁溪鄉', 1, 8),
(321, 20, '(261)頭城鎮', '261', '(261)頭城鎮', 1, 9),
(322, 20, ' (270)蘇澳鎮 ', '270', ' (270)蘇澳鎮 ', 1, 10),
(323, 20, '(265)羅東鎮 ', '265', '(265)羅東鎮 ', 1, 11),
(324, 20, ' (260)宜蘭市', '260', ' (260)宜蘭市', 1, 12),
(325, 21, '(979)萬榮鄉', '979', '(979)萬榮鄉', 1, 1),
(326, 21, '(982)卓溪鄉', '982', '(982)卓溪鄉', 1, 2),
(327, 21, '(972)秀林鄉', '972', '(972)秀林鄉', 1, 3),
(328, 21, '(983)富里鄉 ', '983', '(983)富里鄉 ', 1, 4),
(329, 21, '(978)瑞穗鄉  ', '978', '(978)瑞穗鄉  ', 1, 5),
(330, 21, ' (977)豐濱鄉', '977', ' (977)豐濱鄉', 1, 6),
(331, 21, ' (976)光復鄉', '976', ' (976)光復鄉', 1, 7),
(332, 21, '(974)壽豐鄉 ', '974', '(974)壽豐鄉 ', 1, 8),
(333, 21, '(973)吉安鄉 ', '973', '(973)吉安鄉 ', 1, 9),
(334, 21, '(971)新城鄉', '971', '(971)新城鄉', 1, 10),
(335, 21, '(981)玉里鎮 ', '981', '(981)玉里鎮 ', 1, 11),
(336, 21, '(975)鳳林鎮', '975', '(975)鳳林鎮', 1, 12),
(337, 21, ' (970)花蓮市', '970', ' (970)花蓮市', 1, 13),
(338, 22, ' (952)蘭嶼鄉', '952', ' (952)蘭嶼鄉', 1, 1),
(339, 22, ' (964)金峰鄉', '964', ' (964)金峰鄉', 1, 2),
(340, 22, '(966)達仁鄉', '966', '(966)達仁鄉', 1, 3),
(341, 22, '(957)海端鄉', '957', '(957)海端鄉', 1, 4),
(342, 22, '(953)延平鄉 ', '953', '(953)延平鄉 ', 1, 5),
(343, 22, ' (951)綠島鄉', '951', ' (951)綠島鄉', 1, 6),
(344, 22, '(958)池上鄉', '958', '(958)池上鄉', 1, 7),
(345, 22, '(955)鹿野鄉 ', '955', '(955)鹿野鄉 ', 1, 8),
(346, 22, '(962)長濱鄉 ', '962', '(962)長濱鄉 ', 1, 9),
(347, 22, '(959)東河鄉', '959', '(959)東河鄉', 1, 10),
(348, 22, '(963)太麻里鄉 ', '963', '(963)太麻里鄉 ', 1, 11),
(349, 22, ' (965)大武鄉 ', '965', ' (965)大武鄉 ', 1, 12),
(350, 22, '(954)卑南鄉 ', '954', '(954)卑南鄉 ', 1, 13),
(351, 22, ' (956)關山鎮', '956', ' (956)關山鎮', 1, 14),
(352, 22, '(961)成功鎮  ', '961', '(961)成功鎮  ', 1, 15),
(353, 22, '(950)台東市', '950', '(950)臺東市', 1, 17),
(354, 23, '(883)七美鄉', '883', '(883)七美鄉', 1, 1),
(355, 23, '(882)望安鄉', '882', '(882)望安鄉', 1, 2),
(356, 23, '(881)西嶼鄉 ', '881', '(881)西嶼鄉 ', 1, 3),
(357, 23, '(884)白沙鄉 ', '884', '(884)白沙鄉 ', 1, 4),
(358, 23, ' (885)湖西鄉 ', '885', ' (885)湖西鄉 ', 1, 5),
(359, 23, ' (880)馬公市', '880', ' (880)馬公市', 1, 6),
(360, 24, '(896)烏坵鄉', '896', '(896)烏坵鄉', 1, 1),
(361, 24, '(894)烈嶼鄉 ', '894', '(894)烈嶼鄉 ', 1, 2),
(362, 24, '(892)金寧鄉', '892', '(892)金寧鄉', 1, 3),
(363, 24, '(890)金沙鎮', '890', '(890)金沙鎮', 1, 4),
(364, 24, '(891)金湖鎮', '891', '(891)金湖鎮', 1, 5),
(365, 24, ' (893)金城鎮', '893', ' (893)金城鎮', 1, 6),
(366, 25, '(212)東引鄉', '212', '(212)東引鄉', 1, 1),
(367, 25, '(211)莒光鄉 ', '211', '(211)莒光鄉 ', 1, 2),
(368, 25, '(210)北竿鄉 ', '210', '(210)北竿鄉 ', 1, 3),
(369, 25, ' (209)南竿鄉 ', '209', ' (209)南竿鄉 ', 1, 4),
(372, 8, '(412)大里区', '412', NULL, 1, 0),
(373, 8, '(411)太平區', '411', NULL, 1, 0);

-- --------------------------------------------------------

--
-- 資料表格式： `zone_to_geo_zone`
--

DROP TABLE IF EXISTS `zone_to_geo_zone`;
CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 列出以下資料庫的數據： `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');
