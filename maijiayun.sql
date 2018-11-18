/*
Navicat MySQL Data Transfer

Source Server         : master1
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : maijiayun

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-12-15 18:32:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for caigou_cangkufubiao
-- ----------------------------
DROP TABLE IF EXISTS `caigou_cangkufubiao`;
CREATE TABLE `caigou_cangkufubiao` (
  `wareHouseId` int(11) NOT NULL,
  `reservoirId` int(11) NOT NULL,
  `reservoirName` varchar(11) NOT NULL,
  `locationName` varchar(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  KEY `reservoirId` (`reservoirId`),
  KEY `locationId` (`locationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_cangkufubiao
-- ----------------------------

-- ----------------------------
-- Table structure for caigou_goodgroup
-- ----------------------------
DROP TABLE IF EXISTS `caigou_goodgroup`;
CREATE TABLE `caigou_goodgroup` (
  `goodGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `goodGroupName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_goodgroup
-- ----------------------------
INSERT INTO `caigou_goodgroup` VALUES ('1', '未分类');
INSERT INTO `caigou_goodgroup` VALUES ('2', '综合健身');
INSERT INTO `caigou_goodgroup` VALUES ('3', '包装');
INSERT INTO `caigou_goodgroup` VALUES ('5', '义卖');
INSERT INTO `caigou_goodgroup` VALUES ('6', '捐赠');
INSERT INTO `caigou_goodgroup` VALUES ('7', 'office办公操作');
INSERT INTO `caigou_goodgroup` VALUES ('9', '包装');
INSERT INTO `caigou_goodgroup` VALUES ('10', '拍照摄影');
INSERT INTO `caigou_goodgroup` VALUES ('11', '甜品冰淇淋咖啡冷饮');
INSERT INTO `caigou_goodgroup` VALUES ('12', 'KTV');
INSERT INTO `caigou_goodgroup` VALUES ('13', '面包/月饼/蛋糕');
INSERT INTO `caigou_goodgroup` VALUES ('14', '中餐');
INSERT INTO `caigou_goodgroup` VALUES ('15', '日韩料理');
INSERT INTO `caigou_goodgroup` VALUES ('16', '意外险');
INSERT INTO `caigou_goodgroup` VALUES ('17', '运动健身卡');
INSERT INTO `caigou_goodgroup` VALUES ('18', '淘出版');
INSERT INTO `caigou_goodgroup` VALUES ('19', '数字漫画');
INSERT INTO `caigou_goodgroup` VALUES ('20', '起名取名');
INSERT INTO `caigou_goodgroup` VALUES ('21', '电子书出版物');
INSERT INTO `caigou_goodgroup` VALUES ('23', '店铺卡');
INSERT INTO `caigou_goodgroup` VALUES ('24', '景点观光');
INSERT INTO `caigou_goodgroup` VALUES ('25', 'èµ·ååå');
INSERT INTO `caigou_goodgroup` VALUES ('26', '网店模特');

-- ----------------------------
-- Table structure for caigou_goods
-- ----------------------------
DROP TABLE IF EXISTS `caigou_goods`;
CREATE TABLE `caigou_goods` (
  `goodId` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `goodGroupId` int(11) NOT NULL DEFAULT '1',
  `goodName` varchar(255) DEFAULT NULL,
  `goodPrice` double(255,0) DEFAULT NULL,
  `goodWeight` double DEFAULT NULL,
  `goodRepertory` int(11) DEFAULT NULL,
  `goodVirtualInventories` int(11) DEFAULT NULL,
  `goodInventoryCost` double DEFAULT NULL,
  `goodPicture` varchar(255) DEFAULT NULL,
  `goodAttribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodId`),
  KEY `goodGroupId` (`goodGroupId`),
  KEY `sku` (`sku`),
  KEY `goodName` (`goodName`),
  CONSTRAINT `caigou_goods_ibfk_5` FOREIGN KEY (`goodGroupId`) REFERENCES `caigou_goodgroup` (`goodGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_goods
-- ----------------------------
INSERT INTO `caigou_goods` VALUES ('0', '0', '6', '裤子', '999', '999', '922', '333', '666', '', null);
INSERT INTO `caigou_goods` VALUES ('1', '1', '9', '1', '1', '1', '474', '100', null, '/MaiJiaYun/CaiGou/img/1480859807832Penguins.jpg', null);
INSERT INTO `caigou_goods` VALUES ('2', '110120119', '2', '669988', '41141', '74', '222332', '66', '999', '/MaiJiaYun/CaiGou/img/1481099742709Lighthouse.jpg', null);
INSERT INTO `caigou_goods` VALUES ('3', '0', '1', '裤子', '1', '1', '25', '1', '666', 'null', null);
INSERT INTO `caigou_goods` VALUES ('10', '10111111', '9', '1', '0', '1', '52745', '48', null, '/MaiJiaYun/CaiGou/img/1480855965362Hydrangeas.jpg', null);
INSERT INTO `caigou_goods` VALUES ('11', '11', '1', 'hjhhh', '0', '0', '1110', '894', '0', '/MaiJiaYun/CaiGou/img/1481098972028Chrysanthemum.jpg', null);
INSERT INTO `caigou_goods` VALUES ('18', '747', '1', '裤子', '45', '24', '14', '254', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('49', '2747', '1', '背带裤', '141', '4', '575', '2505', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('101', '101', '2', '大壮', '1', '1', '32', '0', '66', 'null', null);
INSERT INTO `caigou_goods` VALUES ('123', '48456', '1', '铅笔', '0', '0', '832', '78', '0.01', null, null);
INSERT INTO `caigou_goods` VALUES ('222', '222', '9', '2', '2', '2', '5655', '45', null, null, null);
INSERT INTO `caigou_goods` VALUES ('606', '606', '6', '三鹿', '606', '20', '10', '2', '7777', 'http://imgsrc.baidu.com/forum/w%3D580%3Bcp%3Dtieba%2C10%2C543%3Bap%3D%C5%AE%CD%B7%B0%C9%2C104%2C554/sign=7ca7a446ac4bd11304cdb73a6a94c77f/562c11dfa9ec8a13d71517d5f603918fa0ecc0fc.jpg', null);
INSERT INTO `caigou_goods` VALUES ('646', '85', '1', '裤子', '45', '24', '14', '242', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('666', '666', '3', '666', '666', '666', '54', '3123', null, null, null);
INSERT INTO `caigou_goods` VALUES ('698', '748678', '1', '三鹿', '55', '254', '74', null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('986', '6857', '1', '裤子', '45', '24', '14', '24', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('999', '999', '1', '999', '999', '999', '10', '124', null, '/MaiJiaYun/CaiGou/img/14810081754823.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1008', '5985', '1', '大衣', '20', '700', '456', null, null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1111', '1111', '1', '000', '10', '1', null, null, null, '/MaiJiaYun/CaiGou/img/1481773334530Chrysanthemum.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327', '1327', '5', '1327', '1327', '1327', '5', '77', '666', '', null);
INSERT INTO `caigou_goods` VALUES ('7894', '486', '1', '电脑', '141', '5878', '5785', null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('8099', '74897', '1', '哈哈发', '52754', '5785', '57', null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('10004', '5552225', '1', 'iill', '100', '122', '4242', null, null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg', null);
INSERT INTO `caigou_goods` VALUES ('66677', '66677', '1', '嘎嘎', '12', '1', null, null, null, '/MaiJiaYun/CaiGou/img/1481782367902Chrysanthemum.jpg', null);
INSERT INTO `caigou_goods` VALUES ('69852', '69852', '6', 'KKKKK', '123', '12', null, null, null, '/MaiJiaYun/CaiGou/img/1481592242374Penguins.jpg', null);
INSERT INTO `caigou_goods` VALUES ('100001', '100001-1', '1', '哑铃', '50', '20', '1054', '9', '777', null, null);
INSERT INTO `caigou_goods` VALUES ('100002', '100002-1', '2', '连衣裙', '40', '1', '100', '9', '5000', null, '1');
INSERT INTO `caigou_goods` VALUES ('100003', '100003-1', '3', '大衣', '30', '4', '80', '8', '4000', null, null);
INSERT INTO `caigou_goods` VALUES ('100004', '100004-1', '2', 'haha', '400', '40', '30', '10', '0', null, null);
INSERT INTO `caigou_goods` VALUES ('100005', '100005-1', '1', '12355', '40', '0', '30', '10', null, '', null);
INSERT INTO `caigou_goods` VALUES ('100006', '747', '2', 'hahx', '5', '141', '80', '10', '678945', null, null);
INSERT INTO `caigou_goods` VALUES ('100007', '100006-1', '2', 'hahhh', '411', '14', '103', '80', '678945', null, null);
INSERT INTO `caigou_goods` VALUES ('100008', '100007-1', '1', 'xi', '144', '14', '1010', '100', null, null, null);
INSERT INTO `caigou_goods` VALUES ('123321', '123321', '14', '1', '1', '1', null, null, null, '/MaiJiaYun/CaiGou/img/1481763270870Tulips.jpg', null);
INSERT INTO `caigou_goods` VALUES ('153153', '153153', '9', '456', '4864', '48645', null, '789', null, '/MaiJiaYun/CaiGou/img/1481268191274Desert.jpg', null);
INSERT INTO `caigou_goods` VALUES ('287208', '48646', '1', '哈哈发', '52754', '5785', '57', null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('543543', '543543', '1', '521521521', '11', '543543', '1', '24', null, '/MaiJiaYun/CaiGou/img/1481092603338Tulips.jpg', null);
INSERT INTO `caigou_goods` VALUES ('636363', '636363', '5', '63', '6363', '62', '1', '24', null, '/MaiJiaYun/CaiGou/img/1481095889355Hydrangeas.jpg', null);
INSERT INTO `caigou_goods` VALUES ('789654', '789654', '6', '1', '11', '1', '110', '3853', null, '/MaiJiaYun/CaiGou/img/1480920033426Jellyfish.jpg', null);
INSERT INTO `caigou_goods` VALUES ('996699', '996699', '5', 'zb', '11', '11', null, null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('1111111', '1111111', '1', '5465489', '300', '120', '1', '12', null, '/MaiJiaYun/CaiGou/img/1480601709496Chrysanthemum.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1111123', '1111123', '1', 'xxxx', '100', '12', '104575', '38563', null, '/MaiJiaYun/CaiGou/img/1481012795534Chrysanthemum.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1457854', '1457854', '5', '张彬2', '1', '120', null, null, null, '/MaiJiaYun/CaiGou/img/1481268214754Koala.jpg', null);
INSERT INTO `caigou_goods` VALUES ('12555885', '4685659', '1', '鹿', '5754', '57', '57', null, null, null, null);
INSERT INTO `caigou_goods` VALUES ('55555555', '45568', '1', '小背心', '1414', '45', '417', '38532', null, '56', null);
INSERT INTO `caigou_goods` VALUES ('99999999', '99999999', '6', '111', '1', '1', null, '78', null, '/MaiJiaYun/CaiGou/img/1480908097749Penguins.jpg', null);
INSERT INTO `caigou_goods` VALUES ('123123123', '123123123', '7', '铅笔', '10', '1', null, '6', null, '/MaiJiaYun/CaiGou/img/1480680693886Tulips.jpg', null);
INSERT INTO `caigou_goods` VALUES ('123456789', '123456789', '6', '郑校长', '666', '66', null, '32', null, '/MaiJiaYun/CaiGou/img/1480681875259Penguins.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327010120', '1327010120', '5', '鹿', '120', '12', null, null, null, 'http://img4.imgtn.bdimg.com/it/u=4224681947,2086185765&fm=23&gp=0.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327010121', '1327010121', '2', '三', '100', '10', null, null, null, '/MaiJiaYun/CaiGou/img/1481076049436Tulips.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327010122', '132701012211', '5', 'an', '11', '1', null, null, null, '/MaiJiaYun/CaiGou/img/1481176098747Hydrangeas.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327010125', '1327010125', '1', 'cc', '10', '10', null, '98', null, '/MaiJiaYun/CaiGou/img/1480674899519Tulips.jpg', null);
INSERT INTO `caigou_goods` VALUES ('1327010666', '1327010666', '9', '天天酷跑3', '888', '626', '1010', '96', '0', '/MaiJiaYun/CaiGou/img/1481687131988Chrysanthemum.jpg', null);

-- ----------------------------
-- Table structure for caigou_gooduserstatus
-- ----------------------------
DROP TABLE IF EXISTS `caigou_gooduserstatus`;
CREATE TABLE `caigou_gooduserstatus` (
  `goodId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isUse` varchar(255) DEFAULT '1',
  `goodName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `caigou_gooduserstatus_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `caigou_gooduserstatus_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_gooduserstatus
-- ----------------------------
INSERT INTO `caigou_gooduserstatus` VALUES ('0', '10001', '0', '裤子');
INSERT INTO `caigou_gooduserstatus` VALUES ('1', '133333322', '1', '1');
INSERT INTO `caigou_gooduserstatus` VALUES ('2', '10001', '1', '669988');
INSERT INTO `caigou_gooduserstatus` VALUES ('3', '10001', '0', '裤子');
INSERT INTO `caigou_gooduserstatus` VALUES ('10', '10002', '1', '1');
INSERT INTO `caigou_gooduserstatus` VALUES ('101', '10001', '1', '大壮');
INSERT INTO `caigou_gooduserstatus` VALUES ('123', '10001', '1', '铅笔');
INSERT INTO `caigou_gooduserstatus` VALUES ('222', '10001', '1', '11124854');
INSERT INTO `caigou_gooduserstatus` VALUES ('606', '10002', '1', '三鹿');
INSERT INTO `caigou_gooduserstatus` VALUES ('666', '10001', '1', '666');
INSERT INTO `caigou_gooduserstatus` VALUES ('999', '10001', '1', '999');
INSERT INTO `caigou_gooduserstatus` VALUES ('1008', '10001', '1', '大衣');
INSERT INTO `caigou_gooduserstatus` VALUES ('1111', '10001', '1', '000');
INSERT INTO `caigou_gooduserstatus` VALUES ('8099', '10001', '1', '哈哈发');
INSERT INTO `caigou_gooduserstatus` VALUES ('10004', '10001', '1', 'null');
INSERT INTO `caigou_gooduserstatus` VALUES ('66677', '10001', '0', '嘎嘎');
INSERT INTO `caigou_gooduserstatus` VALUES ('69852', '10001', '1', 'KKKKK');
INSERT INTO `caigou_gooduserstatus` VALUES ('100001', '10001', '1', '哑铃');
INSERT INTO `caigou_gooduserstatus` VALUES ('100003', '1333333', '1', '大衣');
INSERT INTO `caigou_gooduserstatus` VALUES ('100004', '10001', '1', '5465489');
INSERT INTO `caigou_gooduserstatus` VALUES ('100005', '10001', '1', '12355');
INSERT INTO `caigou_gooduserstatus` VALUES ('100006', '10001', '1', 'aaaa');
INSERT INTO `caigou_gooduserstatus` VALUES ('100007', '10001', '1', 'bbbb');
INSERT INTO `caigou_gooduserstatus` VALUES ('100008', '10001', '1', 'ccccc');
INSERT INTO `caigou_gooduserstatus` VALUES ('123321', '10001', '1', '1');
INSERT INTO `caigou_gooduserstatus` VALUES ('153153', '10001', '1', '456');
INSERT INTO `caigou_gooduserstatus` VALUES ('287208', '10001', '1', '哈哈发');
INSERT INTO `caigou_gooduserstatus` VALUES ('543543', '10001', '1', '521521521');
INSERT INTO `caigou_gooduserstatus` VALUES ('636363', '10001', '1', '63');
INSERT INTO `caigou_gooduserstatus` VALUES ('789654', '10001', '1', '1');
INSERT INTO `caigou_gooduserstatus` VALUES ('996699', '10001', '1', 'zb');
INSERT INTO `caigou_gooduserstatus` VALUES ('1111111', '10001', '1', 'ddddd');
INSERT INTO `caigou_gooduserstatus` VALUES ('1111123', '10001', '1', 'xxxx');
INSERT INTO `caigou_gooduserstatus` VALUES ('1457854', '10001', '1', '张彬2');
INSERT INTO `caigou_gooduserstatus` VALUES ('55555555', '10001', '1', '小背心');
INSERT INTO `caigou_gooduserstatus` VALUES ('99999999', '10001', '1', '111');
INSERT INTO `caigou_gooduserstatus` VALUES ('123123123', '10001', '1', '铅笔');
INSERT INTO `caigou_gooduserstatus` VALUES ('123456789', '10001', '1', '郑校长');
INSERT INTO `caigou_gooduserstatus` VALUES ('1327010120', '10001', '1', '鹿');
INSERT INTO `caigou_gooduserstatus` VALUES ('1327010121', '10001', '1', '三');
INSERT INTO `caigou_gooduserstatus` VALUES ('1327010122', '10001', '1', 'an');
INSERT INTO `caigou_gooduserstatus` VALUES ('1327010125', '10001', '1', '张彬');
INSERT INTO `caigou_gooduserstatus` VALUES ('1327010666', '10001', '1', '天天酷跑3');

-- ----------------------------
-- Table structure for caigou_goodwarehouse
-- ----------------------------
DROP TABLE IF EXISTS `caigou_goodwarehouse`;
CREATE TABLE `caigou_goodwarehouse` (
  `goodId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `goodCount` int(11) DEFAULT NULL,
  `warehouseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodId`,`warehouseId`),
  KEY `sdgsdgsdgsa` (`warehouseId`),
  CONSTRAINT `caigou_goodwarehouse_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `sdgsdgsdgsa` FOREIGN KEY (`warehouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_goodwarehouse
-- ----------------------------
INSERT INTO `caigou_goodwarehouse` VALUES ('0', '1', '656', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('0', '2', '44', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('0', '3', '222', '仓库3');
INSERT INTO `caigou_goodwarehouse` VALUES ('2', '1', '100', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('2', '2', '10', '仓库7');
INSERT INTO `caigou_goodwarehouse` VALUES ('2', '3', '222222', '仓库3');
INSERT INTO `caigou_goodwarehouse` VALUES ('3', '1', '10', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('3', '2', '15', '仓库7');
INSERT INTO `caigou_goodwarehouse` VALUES ('11', '1', '1000', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('11', '2', '110', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('101', '1', '10', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('101', '2', '22', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('123', '1', '55', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('123', '2', '333', '仓库2');
INSERT INTO `caigou_goodwarehouse` VALUES ('123', '3', '444', '仓库3');
INSERT INTO `caigou_goodwarehouse` VALUES ('222', '1', '100', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('222', '2', '5555', '仓库2');
INSERT INTO `caigou_goodwarehouse` VALUES ('606', '1', '40', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('666', '1', '44', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('666', '2', '10', '仓库2');
INSERT INTO `caigou_goodwarehouse` VALUES ('999', '1', '55', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('1327', '1', '5', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('69852', '1', '1111', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('100001', '1', '44', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('100002', '2', '50', '仓库1');
INSERT INTO `caigou_goodwarehouse` VALUES ('100002', '3', '50', '仓库2');
INSERT INTO `caigou_goodwarehouse` VALUES ('100004', '1', '30', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('100006', '1', '80', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('100007', '1', '3', '默认仓库');
INSERT INTO `caigou_goodwarehouse` VALUES ('100007', '5', '100', '仓库4');
INSERT INTO `caigou_goodwarehouse` VALUES ('1327010666', '2', '1010', '仓库1');

-- ----------------------------
-- Table structure for caigou_kccbmx
-- ----------------------------
DROP TABLE IF EXISTS `caigou_kccbmx`;
CREATE TABLE `caigou_kccbmx` (
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `warehouseId` int(11) DEFAULT NULL,
  `businessName` varchar(255) DEFAULT NULL,
  `billsName` varchar(255) DEFAULT NULL,
  `changeTime` datetime DEFAULT NULL,
  `firstInventory` int(11) DEFAULT NULL,
  `firstCost` double DEFAULT NULL,
  `lastInventory` int(11) DEFAULT NULL,
  `lastCost` double DEFAULT NULL,
  KEY `goodId` (`goodId`),
  KEY `warehouseId` (`warehouseId`),
  CONSTRAINT `caigou_kccbmx_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `caigou_kccbmx_ibfk_2` FOREIGN KEY (`warehouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_kccbmx
-- ----------------------------
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-09 09:29:40', '1000', '66', '1000', '66');
INSERT INTO `caigou_kccbmx` VALUES ('101', '2', '管理员', '手工调价', '2016-12-09 09:31:27', '22', '0', '22', '66');
INSERT INTO `caigou_kccbmx` VALUES ('11', '2', '管理员', '手工调价', '2016-12-09 09:32:36', '110', '100', '110', '100');
INSERT INTO `caigou_kccbmx` VALUES ('11', '2', '管理员', '手工调价', '2016-12-09 09:32:46', '110', '100', '110', '200');
INSERT INTO `caigou_kccbmx` VALUES ('11', '2', '管理员', '手工调价', '2016-12-09 09:33:00', '110', '200', '110', '300');
INSERT INTO `caigou_kccbmx` VALUES ('11', '1', '管理员', '手工调价', '2016-12-09 09:53:33', '1000', '99', '1000', '99');
INSERT INTO `caigou_kccbmx` VALUES ('11', '1', '管理员', '手工调价', '2016-12-09 09:53:46', '1000', '99', '1000', '101');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-09 15:04:49', '1000', '66', '1000', '99');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-10 10:21:03', '500', '99', '500', '99');
INSERT INTO `caigou_kccbmx` VALUES ('606', '1', '管理员', '手工调价', '2016-12-10 10:21:23', '40', '7777', '40', '7777');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-13 09:39:41', '500', '911', '500', '911');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-13 09:39:47', '500', '911', '500', '3911');
INSERT INTO `caigou_kccbmx` VALUES ('2', '1', '管理员', '手工调价', '2016-12-13 09:40:04', '100', '1', '100', '111');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-13 09:41:45', '500', '3911', '500', '3911');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-13 09:42:15', '500', '3911', '500', '100');
INSERT INTO `caigou_kccbmx` VALUES ('3', '1', '管理员', '手工调价', '2016-12-13 09:43:03', '10', '3911', '10', '3911');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-13 09:45:11', '656', '3911', '656', '999');
INSERT INTO `caigou_kccbmx` VALUES ('123', '1', '管理员', '手工调价', '2016-12-13 09:46:30', '55', '0.01', '55', '0.01');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 09:11:56', '656', '999', '656', '80');
INSERT INTO `caigou_kccbmx` VALUES ('100004', '1', '管理员', '手工调价', '2016-12-14 09:18:28', '30', '0', '30', '0');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 09:36:22', '656', '80', '656', '88');
INSERT INTO `caigou_kccbmx` VALUES ('0', '2', '管理员', '手工调价', '2016-12-14 09:49:28', '111', '88', '111', '99');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 09:51:27', '656', '99', '656', '55');
INSERT INTO `caigou_kccbmx` VALUES ('0', '2', '管理员', '手工调价', '2016-12-14 18:43:19', '111', '55', '111', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 19:25:06', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('11', '2', '管理员', '手工调价', '2016-12-14 19:25:37', '110', '0', '110', '0');
INSERT INTO `caigou_kccbmx` VALUES ('101', '1', '管理员', '手工调价', '2016-12-14 19:25:38', '10', '66', '10', '66');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 22:09:55', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 23:27:24', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-14 23:27:27', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '3', '管理员', '手工调价', '2016-12-14 23:27:51', '111', '100', '111', '100');
INSERT INTO `caigou_kccbmx` VALUES ('2', '1', '管理员', '手工调价', '2016-12-14 23:30:16', '100', '111', '100', '111');
INSERT INTO `caigou_kccbmx` VALUES ('2', '1', '管理员', '手工调价', '2016-12-14 23:30:17', '100', '111', '100', '111');
INSERT INTO `caigou_kccbmx` VALUES ('2', '1', '管理员', '手工调价', '2016-12-14 23:30:22', '100', '111', '100', '111');
INSERT INTO `caigou_kccbmx` VALUES ('2', '1', '管理员', '手工调价', '2016-12-14 23:30:25', '100', '111', '100', '111');
INSERT INTO `caigou_kccbmx` VALUES ('2', '2', '管理员', '手工调价', '2016-12-14 23:30:31', '10', '111', '10', '111');
INSERT INTO `caigou_kccbmx` VALUES ('3', '1', '管理员', '手工调价', '2016-12-14 23:30:36', '10', '100', '10', '100');
INSERT INTO `caigou_kccbmx` VALUES ('3', '2', '管理员', '手工调价', '2016-12-14 23:30:40', '15', '100', '15', '100');
INSERT INTO `caigou_kccbmx` VALUES ('1327010666', '2', '管理员', '手工调价', '2016-12-14 23:41:52', '1010', '0', '1010', '0');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 08:57:29', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '2', '管理员', '手工调价', '2016-12-15 08:57:42', '555', '100', '555', '100');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 08:57:59', '656', '100', '656', '100');
INSERT INTO `caigou_kccbmx` VALUES ('2', '2', '管理员', '手工调价', '2016-12-15 08:58:12', '10', '111', '10', '999');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 09:04:58', '656', '100', '656', '1111');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 09:09:34', '656', '1111', '656', '222');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 11:04:19', '656', '222', '656', '222');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 11:27:48', '656', '222', '656', '222');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 11:28:00', '656', '222', '656', '222');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 11:28:35', '656', '222', '656', '222');
INSERT INTO `caigou_kccbmx` VALUES ('0', '1', '管理员', '手工调价', '2016-12-15 14:22:08', '656', '222', '656', '666');

-- ----------------------------
-- Table structure for caigou_location
-- ----------------------------
DROP TABLE IF EXISTS `caigou_location`;
CREATE TABLE `caigou_location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `reservoirId` int(11) NOT NULL,
  `locationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`locationId`),
  KEY `caigou_location_ibfk_1` (`reservoirId`),
  CONSTRAINT `caigou_location_ibfk_1` FOREIGN KEY (`reservoirId`) REFERENCES `caigou_reservoir` (`reservoirId`)
) ENGINE=InnoDB AUTO_INCREMENT=1278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_location
-- ----------------------------
INSERT INTO `caigou_location` VALUES ('1199', '101', 'A-01-09');
INSERT INTO `caigou_location` VALUES ('1200', '101', 'A-01-10');
INSERT INTO `caigou_location` VALUES ('1206', '126', 'B-01-06');
INSERT INTO `caigou_location` VALUES ('1210', '126', 'B-01-10');
INSERT INTO `caigou_location` VALUES ('1211', '126', 'B-01-11');
INSERT INTO `caigou_location` VALUES ('1217', '122', 'A-1-07');
INSERT INTO `caigou_location` VALUES ('1218', '122', 'A-1-08');
INSERT INTO `caigou_location` VALUES ('1219', '122', 'A-1-09');
INSERT INTO `caigou_location` VALUES ('1220', '122', 'A-1-10');
INSERT INTO `caigou_location` VALUES ('1222', '122', 'A-1-12');
INSERT INTO `caigou_location` VALUES ('1223', '122', 'A-1-13');
INSERT INTO `caigou_location` VALUES ('1224', '122', 'A-1-16');
INSERT INTO `caigou_location` VALUES ('1225', '146', '仓库4-库区1-库位02');
INSERT INTO `caigou_location` VALUES ('1226', '146', '仓库4-库区1-库位03');
INSERT INTO `caigou_location` VALUES ('1227', '146', '仓库4-库区1-库位04');
INSERT INTO `caigou_location` VALUES ('1228', '146', '仓库4-库区1-库位05');
INSERT INTO `caigou_location` VALUES ('1229', '146', '仓库4-库区1-库位06');
INSERT INTO `caigou_location` VALUES ('1230', '146', '仓库4-库区1-库位07');
INSERT INTO `caigou_location` VALUES ('1231', '146', '仓库4-库区1-库位08');
INSERT INTO `caigou_location` VALUES ('1232', '146', '仓库4-库区1-库位09');
INSERT INTO `caigou_location` VALUES ('1233', '146', '仓库4-库区1-库位10');
INSERT INTO `caigou_location` VALUES ('1235', '123', 'A-01-02');
INSERT INTO `caigou_location` VALUES ('1236', '123', 'A-01-03');
INSERT INTO `caigou_location` VALUES ('1237', '123', 'A-01-04');
INSERT INTO `caigou_location` VALUES ('1238', '123', 'A-01-05');
INSERT INTO `caigou_location` VALUES ('1239', '123', 'A-01-06');
INSERT INTO `caigou_location` VALUES ('1240', '123', 'A-01-07');
INSERT INTO `caigou_location` VALUES ('1241', '123', 'A-01-08');
INSERT INTO `caigou_location` VALUES ('1242', '123', 'A-01-09');
INSERT INTO `caigou_location` VALUES ('1243', '123', 'A-01-10');
INSERT INTO `caigou_location` VALUES ('1245', '130', 'A-01-02');
INSERT INTO `caigou_location` VALUES ('1246', '130', 'A-01-03');
INSERT INTO `caigou_location` VALUES ('1247', '130', 'A-01-04');
INSERT INTO `caigou_location` VALUES ('1248', '130', 'A-01-05');
INSERT INTO `caigou_location` VALUES ('1249', '130', 'A-01-06');
INSERT INTO `caigou_location` VALUES ('1250', '130', 'A-01-07');
INSERT INTO `caigou_location` VALUES ('1253', '130', 'A-01-10');
INSERT INTO `caigou_location` VALUES ('1254', '130', 'A-01-11');
INSERT INTO `caigou_location` VALUES ('1255', '132', 'B-01-05');
INSERT INTO `caigou_location` VALUES ('1256', '132', 'B-01-06');
INSERT INTO `caigou_location` VALUES ('1257', '132', 'B-01-07');
INSERT INTO `caigou_location` VALUES ('1259', '132', 'B-01-09');
INSERT INTO `caigou_location` VALUES ('1260', '132', 'B-01-10');
INSERT INTO `caigou_location` VALUES ('1261', '132', 'B-01-11');
INSERT INTO `caigou_location` VALUES ('1263', '132', 'B-01-13');
INSERT INTO `caigou_location` VALUES ('1264', '132', 'B-01-14');
INSERT INTO `caigou_location` VALUES ('1265', '148', 'B-01-09');
INSERT INTO `caigou_location` VALUES ('1266', '148', 'B-01-10');
INSERT INTO `caigou_location` VALUES ('1267', '148', 'B-01-11');
INSERT INTO `caigou_location` VALUES ('1268', '158', 'A-01-05');
INSERT INTO `caigou_location` VALUES ('1269', '158', 'A-01-06');
INSERT INTO `caigou_location` VALUES ('1270', '158', 'A-01-07');
INSERT INTO `caigou_location` VALUES ('1271', '158', 'A-01-08');
INSERT INTO `caigou_location` VALUES ('1272', '158', 'A-01-09');
INSERT INTO `caigou_location` VALUES ('1273', '158', 'A-01-10');
INSERT INTO `caigou_location` VALUES ('1274', '158', 'A-01-11');
INSERT INTO `caigou_location` VALUES ('1275', '158', 'A-01-12');
INSERT INTO `caigou_location` VALUES ('1276', '158', 'A-01-13');
INSERT INTO `caigou_location` VALUES ('1277', '158', 'A-01-14');

-- ----------------------------
-- Table structure for caigou_purchase
-- ----------------------------
DROP TABLE IF EXISTS `caigou_purchase`;
CREATE TABLE `caigou_purchase` (
  `purchaseId` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseCode` varchar(255) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `wareHouseId` int(11) DEFAULT NULL,
  `purchaseSum` int(255) NOT NULL,
  `purchaseNumber` int(11) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `storageQuantity` varchar(255) DEFAULT '0',
  `storageState` varchar(255) DEFAULT '未入库',
  `paymentState` varchar(255) DEFAULT '未支付',
  `state` varchar(255) DEFAULT '1',
  `isState` int(255) DEFAULT '1',
  PRIMARY KEY (`purchaseId`),
  KEY `supplier` (`supplierId`),
  KEY `user` (`userId`),
  KEY `;;kljjkl;'` (`wareHouseId`),
  CONSTRAINT `;;kljjkl;'` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `supplier` FOREIGN KEY (`supplierId`) REFERENCES `caigou_supplier` (`supplierId`),
  CONSTRAINT `user` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_purchase
-- ----------------------------
INSERT INTO `caigou_purchase` VALUES ('3', 'CG201612010002', '1', '2', '100', '1000', '2016-12-06 14:19:50', '小红', null, '10001', null, '未入库', '未付款', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('7', 'CG201612010007', '8', '1', '2', '1000', '2016-12-06 13:58:14', null, null, '10001', null, '已入库', '已支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('12', 'CG201612010012', '8', '1', '6', '200', '2016-12-06 14:31:58', null, null, '10001', '200', '已入库', '已支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('14', 'CG201612010014', '8', '1', '5', '66', '2016-12-06 14:32:04', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('16', 'CG201612010016', '8', '1', '5', '22', '2016-12-06 14:32:03', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('18', 'CG201612010018', '8', '1', '5', '22', '2016-12-06 14:32:03', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('19', 'CG201612010019', '8', '1', '5', null, '2016-12-06 14:32:03', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('20', 'CG201612010020', '8', '1', '5', '22365', '2016-12-06 14:32:02', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('21', 'CG201612010021', '8', '1', '5', '5', '2016-12-06 14:32:02', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('22', 'CG201612010022', '8', '1', '5', '5', '2016-12-06 14:32:01', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('23', 'CG201612010023', '8', '1', '5', '5', '2016-12-06 14:32:01', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('24', '1231313', '8', '1', '5', '5', '2016-12-06 14:32:58', null, null, '10003', '0', '未入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('25', '313131', '9', '5', '600', '20', '2016-12-06 19:43:52', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('26', '3131231', '628', '2', '300', '10', '2016-12-07 09:12:04', null, null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('27', 'CG201612070001', '648', '3', '3996', '6', '2016-12-07 10:32:51', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('30', 'CG201612070002', '648', '1', '3996', '6', '2016-12-07 14:03:46', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('31', 'CG201612070003', '648', '3', '4995', '6', '2016-12-07 14:12:57', '', null, '10002', '0', '未入库', '未支付', '1', '1');
INSERT INTO `caigou_purchase` VALUES ('32', 'CG201612070004', '648', '2', '600', '300', '2016-12-07 14:22:51', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('35', 'CG201612070006', '648', '2', '5651', '5', '2016-12-07 15:04:46', '', null, '10001', '0', '未入库', '未支付', '1', '1');
INSERT INTO `caigou_purchase` VALUES ('40', 'CG201612070007', '648', '1', '2997', '3', '2016-12-07 16:45:19', '', null, '10001', '0', '未入库', '已付款', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('41', 'CG201612070008', '648', '3', '900', '3', '2016-12-07 16:52:26', '', null, '10001', '0', '未入库', '已付款', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('42', 'CG201612070009', '648', '2', '246846', '6', '2016-12-07 16:55:45', '', null, '10001', '0', '已入库', '已支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('43', 'CG201612070010', '648', '3', '82282', '2', '2016-12-07 16:57:02', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('45', 'CG201612070011', '648', '2', '1998', '2', '2016-12-07 18:20:57', '', null, '10001', '0', '未入库', '已付款', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('52', 'CG201612080012', '648', '3', '3663', '333', '2016-12-08 14:12:05', '', null, '10001', '0', '未入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('53', 'CG201612080013', '651', '1', '112', '56', '2016-12-08 14:14:09', '', null, '10001', '0', '未入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('54', 'CG201602080014', '628', '3', '113', '65', '2016-12-08 14:17:06', null, null, '10001', '0', '已入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('58', 'CG201612080014', '651', '2', '32967', '33', '2016-12-08 14:30:22', '', null, '10001', '0', '未入库', '已付款', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('67', 'CG201612080015', '651', '2', '0', '33', '2016-12-08 19:17:02', '', null, '10001', '0', '未入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('68', 'CG201612080016', '648', '2', '11988', '12', '2016-12-08 19:22:21', '', null, '10001', '0', '未入库', '未支付', '3', '1');
INSERT INTO `caigou_purchase` VALUES ('69', 'CG201612090017', '648', '1', '1', '1', '2016-12-09 11:06:17', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('76', 'CG201612090018', '648', '1', '208', '22', '2016-12-13 23:22:33', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('77', 'CG201612140019', '10', '3', '123486', '66', '2016-12-14 20:23:23', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('78', 'CG201612140020', '10', '3', '3663', '99', '2016-12-14 20:27:54', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('79', 'CG201612140021', '666', '4', '894', '12', '2016-12-14 20:38:08', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('80', 'CG201612140022', '648', '3', '3996', '6', '2016-12-14 20:40:52', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('81', 'CG201612140023', '11', '2', '3996', '6', '2016-12-14 20:47:32', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('82', 'CG201612140024', '666', '3', '4242', '3', '2016-12-14 20:49:56', '', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('83', 'CG201612140025', '648', '3', '66', '66', '2016-12-14 21:08:03', '666', null, '10001', '0', '未入库', '未支付', '2', '1');
INSERT INTO `caigou_purchase` VALUES ('84', 'CG201612150026', '9', '1', '41142', '2', '2016-12-15 11:05:54', '', null, '10001', '0', '未入库', '未支付', '1', '1');
INSERT INTO `caigou_purchase` VALUES ('85', 'CG201612150027', '648', '1', '600', '30', '2016-12-15 14:08:01', 'aa', null, '10001', '0', '未入库', '未支付', '1', '1');
INSERT INTO `caigou_purchase` VALUES ('86', 'CG201612150028', '648', '2', '3000', '12', '2016-12-15 14:35:50', '333', null, '10001', '0', '未入库', '未支付', '1', '1');
INSERT INTO `caigou_purchase` VALUES ('87', 'CG201612150029', '648', '1', '600', '30', '2016-12-15 14:38:29', 'aa', null, '10001', '0', '未入库', '未支付', '1', '1');

-- ----------------------------
-- Table structure for caigou_purchasegood
-- ----------------------------
DROP TABLE IF EXISTS `caigou_purchasegood`;
CREATE TABLE `caigou_purchasegood` (
  `purchaseGoodId` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `purchaseNum` int(11) DEFAULT NULL,
  `quantity` int(255) DEFAULT '0',
  `purchasePrice` double DEFAULT NULL,
  `purchaseSum` double(255,0) DEFAULT NULL,
  `remark_1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`purchaseGoodId`),
  KEY `cai_good` (`goodId`),
  KEY `cai_purchase` (`purchaseId`),
  CONSTRAINT `cai_good` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `cai_purchase` FOREIGN KEY (`purchaseId`) REFERENCES `caigou_purchase` (`purchaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_purchasegood
-- ----------------------------
INSERT INTO `caigou_purchasegood` VALUES ('1', '3', '606', '50', '0', '10', '1243', 'dfvc');
INSERT INTO `caigou_purchasegood` VALUES ('2', '3', '1327', '50', '0', '10', '15', 'af');
INSERT INTO `caigou_purchasegood` VALUES ('15', '35', '0', '3', '0', '999', '2997', '');
INSERT INTO `caigou_purchasegood` VALUES ('16', '40', '11', '3', '0', '300', '900', '');
INSERT INTO `caigou_purchasegood` VALUES ('17', '41', '2', '6', '0', '41141', '246846', '');
INSERT INTO `caigou_purchasegood` VALUES ('18', '42', '2', '2', '0', '41141', '82282', '');
INSERT INTO `caigou_purchasegood` VALUES ('19', '43', '11', '2', '0', '20', '40', '');
INSERT INTO `caigou_purchasegood` VALUES ('20', '43', '0', '2', '0', '999', '1998', '');
INSERT INTO `caigou_purchasegood` VALUES ('21', '45', '0', '2', '0', '999', '1998', '');
INSERT INTO `caigou_purchasegood` VALUES ('30', '53', '222', '56', '0', '2', '112', '');
INSERT INTO `caigou_purchasegood` VALUES ('65', '76', '101', '7', '0', '1', '7', 'class=\"form-control');
INSERT INTO `caigou_purchasegood` VALUES ('66', '76', '11', '9', '0', '9', '81', 'class=\"form-control');
INSERT INTO `caigou_purchasegood` VALUES ('67', '76', '999', '6', '0', '20', '120', 'a');
INSERT INTO `caigou_purchasegood` VALUES ('92', '77', '0', '63', '0', '1', '63', '222');
INSERT INTO `caigou_purchasegood` VALUES ('93', '77', '2', '3', '0', '41141', '123423', '11');
INSERT INTO `caigou_purchasegood` VALUES ('94', '78', '123', '66', '0', '55', '3630', '2');
INSERT INTO `caigou_purchasegood` VALUES ('95', '78', '101', '33', '0', '1', '33', '1');
INSERT INTO `caigou_purchasegood` VALUES ('96', '79', '123', '9', '0', '99', '891', '');
INSERT INTO `caigou_purchasegood` VALUES ('97', '79', '101', '3', '0', '1', '3', '');
INSERT INTO `caigou_purchasegood` VALUES ('98', '80', '666', '6', '0', '666', '3996', '');
INSERT INTO `caigou_purchasegood` VALUES ('99', '81', '123', '6', '0', '666', '3996', '');
INSERT INTO `caigou_purchasegood` VALUES ('100', '82', '55555555', '3', '0', '1414', '4242', '');
INSERT INTO `caigou_purchasegood` VALUES ('101', '83', '1457854', '66', '0', '1', '66', '33');
INSERT INTO `caigou_purchasegood` VALUES ('102', '84', '101', '1', '0', '1', '1', '');
INSERT INTO `caigou_purchasegood` VALUES ('103', '84', '2', '1', '0', '41141', '41141', '');
INSERT INTO `caigou_purchasegood` VALUES ('104', '85', '123', '0', null, '20', null, 'a');
INSERT INTO `caigou_purchasegood` VALUES ('109', '86', '101', '3', '0', '1', '3', '22');
INSERT INTO `caigou_purchasegood` VALUES ('110', '86', '0', '3', '0', '999', '2997', '11');
INSERT INTO `caigou_purchasegood` VALUES ('111', '87', '123', '0', null, '20', null, 'a');

-- ----------------------------
-- Table structure for caigou_reservoir
-- ----------------------------
DROP TABLE IF EXISTS `caigou_reservoir`;
CREATE TABLE `caigou_reservoir` (
  `reservoirId` int(11) NOT NULL AUTO_INCREMENT,
  `wareHouseId` int(11) NOT NULL,
  `reservoirName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservoirId`),
  KEY `ljkljklkj` (`wareHouseId`),
  CONSTRAINT `ljkljklkj` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_reservoir
-- ----------------------------
INSERT INTO `caigou_reservoir` VALUES ('101', '2', '仓库2-库区1');
INSERT INTO `caigou_reservoir` VALUES ('102', '3', '仓库3-库区1');
INSERT INTO `caigou_reservoir` VALUES ('120', '5', '仓库5-库区1');
INSERT INTO `caigou_reservoir` VALUES ('121', '2', '仓库2-库区2');
INSERT INTO `caigou_reservoir` VALUES ('122', '1', '仓库1-库区2');
INSERT INTO `caigou_reservoir` VALUES ('123', '1', '仓库1-库区3');
INSERT INTO `caigou_reservoir` VALUES ('126', '2', '仓库2-库区3');
INSERT INTO `caigou_reservoir` VALUES ('127', '2', '仓库2-库区8');
INSERT INTO `caigou_reservoir` VALUES ('128', '5', '仓库5-库区2');
INSERT INTO `caigou_reservoir` VALUES ('129', '5', '仓库5-库区3');
INSERT INTO `caigou_reservoir` VALUES ('130', '5', '仓库5-库区4');
INSERT INTO `caigou_reservoir` VALUES ('131', '5', '仓库5-库区5');
INSERT INTO `caigou_reservoir` VALUES ('132', '5', '仓库5-库区6');
INSERT INTO `caigou_reservoir` VALUES ('133', '5', '仓库5-库区7');
INSERT INTO `caigou_reservoir` VALUES ('134', '5', '仓库5-库区6');
INSERT INTO `caigou_reservoir` VALUES ('146', '4', '仓库4-库区1');
INSERT INTO `caigou_reservoir` VALUES ('148', '2', '仓库2-库区7');
INSERT INTO `caigou_reservoir` VALUES ('158', '6', '仓库6-库区1');

-- ----------------------------
-- Table structure for caigou_return
-- ----------------------------
DROP TABLE IF EXISTS `caigou_return`;
CREATE TABLE `caigou_return` (
  `returnId` int(11) NOT NULL AUTO_INCREMENT,
  `returnCode` varchar(255) DEFAULT NULL,
  `purchaseId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `returnNumber` int(11) DEFAULT NULL,
  `returnOutNum` int(11) DEFAULT NULL,
  `returnMoney` double DEFAULT NULL,
  `returnTime` datetime DEFAULT NULL,
  `returnMaker` int(255) DEFAULT NULL,
  `returnChecker` int(255) DEFAULT NULL,
  `returnRemark` varchar(255) DEFAULT NULL,
  `returnState` int(11) DEFAULT '0',
  `userId` int(11) DEFAULT NULL,
  `deleteState` int(11) DEFAULT '0',
  PRIMARY KEY (`returnId`),
  KEY `fk_makerId` (`returnMaker`),
  KEY `fk_checkerId` (`returnChecker`),
  KEY `dgdsagsdfs` (`warehouseId`),
  KEY `purchaseId` (`purchaseId`),
  KEY `fks_userId` (`userId`),
  CONSTRAINT `caigou_return_ibfk_1` FOREIGN KEY (`purchaseId`) REFERENCES `caigou_purchase` (`purchaseId`),
  CONSTRAINT `dgdsagsdfs` FOREIGN KEY (`warehouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_checkerId` FOREIGN KEY (`returnChecker`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fk_makerId` FOREIGN KEY (`returnMaker`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fks_userId` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_return
-- ----------------------------
INSERT INTO `caigou_return` VALUES ('1', '2021315', '3', '1', '10', '10', '10', '2016-12-30 00:00:00', '10001', '1333333', '-', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('2', '2021306', '7', '3', '20', '20', '20', '2016-12-02 00:00:00', '1333333', '1333333', 'sd', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('3', '16-12-07 11:40:58', '3', '2', '2', '0', '2', '2016-12-07 11:40:58', '10001', '10001', 'zz', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('7', '16-12-07 14:37:03', '3', '2', '60', '0', '2', '2016-12-07 14:37:03', '10001', '10001', '', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('8', '16-12-07 14:38:13', '3', '2', '60', '0', '2', '2016-12-07 14:38:13', '10001', '10001', '', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('12', '16-12-07 16:47:41', '3', '4', '2', '0', '2', '2016-12-07 16:47:41', '10001', '10001', '', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('13', '16-12-07 16:47:43', '3', '4', '2', '0', '2', '2016-12-07 16:47:43', '10001', '10001', '', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('14', '16-12-07 16:47:43', '3', '4', '2', '0', '2', '2016-12-07 16:47:43', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('15', '16-12-07 16:47:44', '3', '4', '2', '0', '2', '2016-12-07 16:47:44', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('16', '16-12-07 16:47:44', '3', '4', '2', '0', '2', '2016-12-07 16:47:44', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('17', '16-12-07 17:58:13', '3', '3', '20', '0', '2', '2016-12-07 17:58:13', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('18', '16-12-07 18:20:01', '3', '2', '2', '0', '12', '2016-12-07 18:20:01', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('19', '16-12-07 18:20:05', '3', '2', '2', '0', '12', '2016-12-07 18:20:05', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('20', '16-12-07 18:31:36', '3', '2', '2', '0', '2', '2016-12-07 18:31:36', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('21', '16-12-07 18:38:01', '3', '2', '2', '0', '2', '2016-12-07 18:38:01', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('22', '16-12-07 18:38:12', '3', '2', '2', '0', '2', '2016-12-07 18:38:12', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('23', '16-12-07 18:39:02', '3', '2', '2', '0', '2', '2016-12-07 18:39:02', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('24', '16-12-07 18:39:03', '3', '2', '2', '0', '2', '2016-12-07 18:39:03', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('27', '16-12-07 18:39:03', '3', '2', '2', '0', '2', '2016-12-07 18:39:03', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('37', '16-12-07 19:14:39', '3', '4', '2', '0', '2', '2016-12-07 19:14:39', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('38', '16-12-07 20:06:20', '3', '4', '2', '0', '2', '2016-12-07 20:06:20', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('39', '16-12-07 20:58:11', '3', '2', '2', '0', '2', '2016-12-07 20:58:11', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('40', '16-12-07 21:00:50', '3', '3', '24', '0', '24', '2016-12-07 21:00:50', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('51', null, '12', '2', '2', '0', '2', '2016-12-08 09:42:31', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('52', null, null, null, null, null, null, null, null, null, null, '0', null, '0');
INSERT INTO `caigou_return` VALUES ('53', null, null, null, null, null, null, null, null, null, null, '0', null, '0');
INSERT INTO `caigou_return` VALUES ('54', '16-12-08 11:27:27', '3', '2', '3', '0', '7', '2016-12-08 11:27:27', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('55', '111111', '12', '2', '2', '0', '2', '2016-12-08 11:51:45', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('56', '16-12-08 11:53:09', '3', '2', '2', '0', '2', '2016-12-08 11:53:09', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('57', '16-12-08 14:04:25', '3', '3', '2', '0', '2', '2016-12-08 14:04:25', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('58', '111111', '12', '2', '2', '0', '2', '2016-12-08 14:08:34', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('59', '111111', '12', '3', '1', '0', '2', '2016-12-08 14:38:31', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('60', '111111', '12', '2', '2', '0', '2', '2016-12-08 14:40:16', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('61', '111111', '12', '2', '2', '0', '2', '2016-12-08 14:41:04', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('62', '111111', '12', '2', '2', '0', '12', '2016-12-08 14:42:05', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('63', '111111', '12', '1', '2', '0', '2', '2016-12-08 14:47:50', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('64', '111111', '12', '2', '1', '0', '2', '2016-12-08 14:52:28', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('65', '13123', '3', '4', '10', '0', '1', '2016-12-08 15:04:35', '10001', null, null, '0', null, '0');
INSERT INTO `caigou_return` VALUES ('66', '111111', '12', '2', '2', '0', '2', '2016-12-08 15:20:47', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('67', '111111', '12', '2', '2', '0', '12', '2016-12-08 15:22:00', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('69', '16-12-08 15:26:47', '3', '2', '4', '0', '4', '2016-12-08 15:26:47', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('71', '16-12-08 15:30:28', '3', '3', '2', '0', '2', '2016-12-08 15:30:28', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('73', '16-12-08 15:36:24', '3', '3', '100', '0', '246', '2016-12-08 15:36:24', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('75', '16-12-08 15:38:51', '3', '2', '3', '0', '330', '2016-12-08 15:38:51', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('77', '16-12-08 15:43:58', '3', '3', '5', '0', '555', '2016-12-08 15:43:58', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('79', '16-12-08 15:50:28', '3', '2', '7', '0', '77', '2016-12-08 15:50:28', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('81', '16-12-08 15:53:19', '3', '3', '3', '0', '33', '2016-12-08 15:53:19', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('83', '16-12-08 16:01:19', '3', '3', '9', '0', '99', '2016-12-08 16:01:19', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('85', '16-12-08 16:03:25', '3', '3', '2', '0', '4', '2016-12-08 16:03:25', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('87', '16-12-08 16:04:50', '3', '3', '2', '0', '2', '2016-12-08 16:04:50', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('89', '16-12-08 16:07:15', '3', '2', '2', '0', '4', '2016-12-08 16:07:15', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('93', '16-12-08 16:23:14', '3', '3', '6', '0', '8', '2016-12-08 16:23:14', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('94', '16-12-08 16:25:58', '3', '3', '2', '0', '2', '2016-12-08 16:25:58', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('95', '16-12-08 16:33:53', '3', '3', '5', '0', '5', '2016-12-08 16:33:53', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('96', '16-12-08 16:35:59', '3', '3', '10', '0', '12', '2016-12-08 16:35:59', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('106', '111111', '12', '2', '2', '0', '2', '2016-12-08 18:24:36', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('107', '16-12-09 08:58:36', '3', '3', '4', '0', '6', '2016-12-09 08:58:36', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('108', '16-12-09 10:32:40', '3', '2', '4', '0', '6', '2016-12-09 10:32:40', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('109', '16-12-09 10:33:12', '3', '4', '6', '0', '6', '2016-12-09 10:33:12', '10001', '10001', '', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('110', '16-12-09 11:05:14', '3', '1', '2', '0', '4', '2016-12-09 11:05:14', '10001', '10001', '1111', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('111', 'PC201612121040001', '12', '4', '4', '0', '4', '2016-12-12 10:40:41', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('112', 'PC201612121042001', '12', '1', '4', '0', '4', '2016-12-12 10:41:58', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('113', 'PC201612121052001', '12', '3', '2', '0', '2', '2016-12-12 10:52:08', '10001', '10001', '11111', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('114', 'PC201612121054001', '12', '3', '2', '0', '2', '2016-12-12 10:54:42', '10001', '10001', null, '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('115', 'PC201612121108001', '3', '3', '4', '0', '2', '2016-12-12 11:08:30', '10001', '10001', '2222', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('116', 'PC201612121115001', '3', '3', '24', '0', '24', '2016-12-12 11:15:11', '10001', '10001', '1212212', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('117', 'PC201612121455001', '3', '4', '4', '0', '4', '2016-12-12 14:54:52', '10001', '10001', '1111111', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('118', 'PC201612121754002', '3', '3', '2', '0', '2', '2016-12-12 17:54:43', '10001', '10001', '111111', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('119', 'PC201612131422001', '3', '3', '6', '0', '6', '2016-12-13 14:22:13', '10001', '10001', '222222', '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('120', 'PC201612141801001', '42', '2', '2', '0', '855', '2016-12-14 18:00:58', '10001', '10001', '22', '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('121', 'PC201612141850001', '42', '2', '2', '0', '2', '2016-12-14 18:49:54', '10001', '10001', null, '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('122', 'PC201612141850002', '42', '3', '2', '0', '22', '2016-12-14 18:50:14', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('123', 'PC201612141924001', '42', '2', '1', '0', '1', '2016-12-14 19:24:23', '10001', '10001', null, '1', '10001', '0');
INSERT INTO `caigou_return` VALUES ('124', 'PC201612141930001', '42', '3', '1', '0', '1', '2016-12-14 19:30:15', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('125', 'PC201612141930002', '42', '4', '1', '0', '1', '2016-12-14 19:30:28', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('126', 'PC201612141930003', '42', '3', '1', '0', '1', '2016-12-14 19:30:38', '10001', '10001', '1', '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('127', 'PC201612141931001', '42', '4', '1', '0', '1', '2016-12-14 19:30:48', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('128', 'PC201612141931002', '42', '4', '1', '0', '1', '2016-12-14 19:30:58', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('129', 'PC201612141931003', '42', '3', '1', '0', '1', '2016-12-14 19:31:13', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('130', 'PC201612141931004', '42', '3', '1', '0', '1', '2016-12-14 19:31:25', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('131', 'PC201612141931005', '42', '2', '1', '0', '1', '2016-12-14 19:31:36', '10001', '10001', null, '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('132', 'PC201612150911001', '42', '4', '1', '0', '1', '2016-12-15 09:10:48', '10001', '10001', '11111111', '0', '10001', '0');
INSERT INTO `caigou_return` VALUES ('133', 'PC201612151020001', '42', '3', '1', '0', '22', '2016-12-15 10:20:10', '10001', '10001', '1111111111', '0', '10001', '1');
INSERT INTO `caigou_return` VALUES ('134', 'PC201612151021001', '42', '3', '1', '0', '1', '2016-12-15 10:21:05', '10001', '10001', '111111', '1', '10001', '0');

-- ----------------------------
-- Table structure for caigou_returngoods
-- ----------------------------
DROP TABLE IF EXISTS `caigou_returngoods`;
CREATE TABLE `caigou_returngoods` (
  `returnId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(11,0) DEFAULT NULL,
  PRIMARY KEY (`returnId`,`goodId`),
  KEY `fr_goodId` (`goodId`),
  CONSTRAINT `fr_goodId` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `fr_returnId` FOREIGN KEY (`returnId`) REFERENCES `caigou_return` (`returnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_returngoods
-- ----------------------------
INSERT INTO `caigou_returngoods` VALUES ('96', '606', '5', '6');
INSERT INTO `caigou_returngoods` VALUES ('96', '1327', '5', '6');
INSERT INTO `caigou_returngoods` VALUES ('106', '606', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('106', '1327', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('107', '606', '2', '3');
INSERT INTO `caigou_returngoods` VALUES ('107', '1327', '2', '3');
INSERT INTO `caigou_returngoods` VALUES ('108', '606', '2', '3');
INSERT INTO `caigou_returngoods` VALUES ('108', '1327', '2', '3');
INSERT INTO `caigou_returngoods` VALUES ('109', '606', '3', '3');
INSERT INTO `caigou_returngoods` VALUES ('109', '1327', '3', '3');
INSERT INTO `caigou_returngoods` VALUES ('110', '606', '10', '10');
INSERT INTO `caigou_returngoods` VALUES ('110', '1327', '10', '10');
INSERT INTO `caigou_returngoods` VALUES ('111', '606', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('111', '1327', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('112', '606', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('112', '1327', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('113', '606', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('113', '1327', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('114', '606', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('114', '1327', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('115', '606', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('115', '1327', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('116', '606', '12', '12');
INSERT INTO `caigou_returngoods` VALUES ('116', '1327', '12', '12');
INSERT INTO `caigou_returngoods` VALUES ('117', '606', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('117', '1327', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('118', '606', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('118', '1327', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('119', '606', '3', '3');
INSERT INTO `caigou_returngoods` VALUES ('119', '1327', '3', '3');
INSERT INTO `caigou_returngoods` VALUES ('120', '2', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('121', '2', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('122', '2', '2', '2');
INSERT INTO `caigou_returngoods` VALUES ('123', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('124', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('125', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('126', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('127', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('128', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('129', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('130', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('131', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('132', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('133', '2', '1', '1');
INSERT INTO `caigou_returngoods` VALUES ('134', '2', '1', '1');

-- ----------------------------
-- Table structure for caigou_shop
-- ----------------------------
DROP TABLE IF EXISTS `caigou_shop`;
CREATE TABLE `caigou_shop` (
  `shopId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `shopUseVirtual` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shopId`),
  KEY `caigou_shop_ibfk_3` (`userId`),
  CONSTRAINT `caigou_shop_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_shop
-- ----------------------------
INSERT INTO `caigou_shop` VALUES ('1', '10001', '大小孩童装店', '20');
INSERT INTO `caigou_shop` VALUES ('2', '10001', '世纪华联', '30');
INSERT INTO `caigou_shop` VALUES ('3', '10001', '毛菇小象', '10');
INSERT INTO `caigou_shop` VALUES ('4', '10001', '小飞象', '50');
INSERT INTO `caigou_shop` VALUES ('5', '10003', '森马旗舰店', '100');
INSERT INTO `caigou_shop` VALUES ('1001', '10002', '大东', '10');

-- ----------------------------
-- Table structure for caigou_shopgoods
-- ----------------------------
DROP TABLE IF EXISTS `caigou_shopgoods`;
CREATE TABLE `caigou_shopgoods` (
  `goodId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `isOnShelf` int(11) NOT NULL DEFAULT '1',
  `goodName` varchar(255) DEFAULT NULL,
  `goodPrice` double(255,0) DEFAULT NULL,
  `goodWeight` double DEFAULT NULL,
  `goodRepertory` int(11) DEFAULT NULL,
  `isImport` int(11) DEFAULT '0',
  `isCorrespond` int(11) NOT NULL DEFAULT '0',
  `correspondGoodsId` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodId`,`shopId`),
  KEY `duiying` (`correspondGoodsId`),
  KEY `caigou_shopgoods_ibfk_2` (`shopId`),
  CONSTRAINT `caigou_shopgoods_ibfk_2` FOREIGN KEY (`shopId`) REFERENCES `caigou_shop` (`shopId`),
  CONSTRAINT `duiying` FOREIGN KEY (`correspondGoodsId`) REFERENCES `caigou_goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_shopgoods
-- ----------------------------
INSERT INTO `caigou_shopgoods` VALUES ('1', '1', '0', '裤子', '242', '24', '414', '1', '1', '3', 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('2', '2', '0', '1', '21', '24', '141', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('66', '1', '1', '1', '141', '4', '575', '0', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('123', '5', '1', '铅笔', null, null, null, '1', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('547', '1', '1', '1', '14', '74', '74', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('666', '2', '1', '11124854', '4', '12', '47', '1', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('698', '3', '1', '三鹿', '55', '254', '74', '0', '0', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('789', '2', '1', '666', '1', '4', '474', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('1005', '3', '1', '1327', '1000', '14', '274', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('1007', '4', '0', '哑铃', '1000', '10', '789', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('1008', '2', '1', '大衣', '20', '700', '456', '0', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('1009', '3', '0', '5465489', '100', '750', '456', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('7894', '5', '1', '电脑', '141', '5878', '5785', '0', '0', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('8099', '3', '1', '哈哈发', '52754', '5785', '57', '1', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('10004', '4', '0', 'null', '100', '122', '4242', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('10006', '2', '1', 'aaaa', '100', '788', '1230', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('10006', '1001', '1', 'bbbb', '189', '5000', '458', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('10009', '1', '0', 'ccc48659', '10', '74', '100', '0', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('12347', '3', '1', '521521521', '57', '525', '474', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('12356', '1001', '1', '63', '80', '45698', '45475', '0', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('33333', '1', '1', '12', '45', '24', '14', '1', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('55566', '4', '1', '郑校长', '447', '57', '57', '1', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('79032', '1', '1', 'hjhhh', '14', '4', '47', '0', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('98797', '4', '1', '三', '52745', '57', '57', '1', '0', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('100001', '1', '1', 'ddddd', '2', '1414', '41', '0', '1', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('100005', '1', '1', 'xxxx', '7', '120', '1000', '1', '0', '0', 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('12555885', '4', '1', '鹿', '5754', '57', '57', '0', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('48963655', '1', '0', '裤子', '2', '241', '14', '1', '0', null, 'http://www.lagou.com/i/image/M00/01/AE/Cgp3O1Zzb3aAccllAABrrN0sB3I743.jpg');
INSERT INTO `caigou_shopgoods` VALUES ('55555555', '2', '1', '111', '56', '45', '417', '0', '0', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('58686876', '5', '1', '哈哈哈哈哈哈', '575', '57', '57', '1', '1', null, null);
INSERT INTO `caigou_shopgoods` VALUES ('78965420', '2', '1', '铅笔', '57', '57', '574', '1', '0', null, null);

-- ----------------------------
-- Table structure for caigou_sku
-- ----------------------------
DROP TABLE IF EXISTS `caigou_sku`;
CREATE TABLE `caigou_sku` (
  `sku` varchar(255) NOT NULL,
  `goodId` int(11) NOT NULL,
  PRIMARY KEY (`sku`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `caigou_sku_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_sku
-- ----------------------------

-- ----------------------------
-- Table structure for caigou_supplier
-- ----------------------------
DROP TABLE IF EXISTS `caigou_supplier`;
CREATE TABLE `caigou_supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierCName` varchar(255) DEFAULT NULL,
  `supplierCAddress` varchar(255) DEFAULT NULL,
  `supplierLPerson` varchar(255) DEFAULT NULL,
  `supplierLPhone` varchar(255) DEFAULT NULL,
  `supplierLMName` varchar(255) DEFAULT NULL,
  `supplierLMMobile` varchar(255) DEFAULT NULL,
  `supplierLMEmail` varchar(255) DEFAULT NULL,
  `supplierLMQq` varchar(255) DEFAULT NULL,
  `supplierBoolean` int(11) DEFAULT '0',
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplierId`),
  KEY `fk_userIdd` (`userId`),
  CONSTRAINT `fk_userIdd` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_supplier
-- ----------------------------
INSERT INTO `caigou_supplier` VALUES ('1', 'niit', '无锡中关村', 'tom', '13141516178', 'jack', '14613614564', '123@qq.com', '54321', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('8', 'igeek', '无锡', 'tom', '13416546', 'jack', '16465354', '21312@163.cn', '15634351536', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('9', '阿里巴巴', '杭州', '不知道', '1165464', '马云', '1654654', '1654.@163.cn', '16465', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('10', '腾讯', '北京', '不知道', '654641', '马化腾', '1654984', '15646@qq.com', '15646341', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('11', '网易', '杭州', '不知道', '06541651', '丁磊', '165416', '1564@163.com', '16846851', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('628', '213', '', '', '', '', '14465461364', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('637', '12', '', '', '', '', '13546454564', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('638', '12', '', '', '', '12', '18856858648', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('639', '1', '12', '12', '123', '123', '15645641313', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('640', '13', '', '', '', '', '17564644564', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('641', '131', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('642', '1', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('643', '2', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('644', '12', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('645', '1', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('647', '1', '', '', '13456454645', '', '13456454645', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('648', '111', '', '', '', '', '13456454645', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('649', '123', '', '', '', '', '13465464564', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('651', '1', '', '', '13456454645', '', '13456454645', '', '', '0', '10001');
INSERT INTO `caigou_supplier` VALUES ('652', '1', '广东广州', '11', '11', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('653', '1', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('654', '1', '', '', '', '', '13456454645', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('655', '12', '', '123', '', '', '13465464564', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('656', '123', '', '123', '', '', '13465464564', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('657', '456', null, null, null, null, '13465464564', null, null, '1', '1333333');
INSERT INTO `caigou_supplier` VALUES ('658', '123', '', '123', '', '', '13465464564', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('659', '444443333', '', '', '', '', '21312313131', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('660', '10001', '', '', '', '', '12423424242424', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('662', '2234', '', '', '', '', '13131313131', '', '', '0', '1333333');
INSERT INTO `caigou_supplier` VALUES ('663', 'xxxx', '', '', '1232', '', '1223215621', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('664', 'wh', '', '', '', '', '18856858648', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('665', 'wh有限公司', '', '21', '21', '21', '18856858648', '', '', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('666', '上海暴龙有限公司', '上海', '上海暴龙', '123456789', '暴龙', '18856858648', '234@qq.com', '12345679', '1', '10001');
INSERT INTO `caigou_supplier` VALUES ('667', 'TTTT', '广东广州', '陈晓军', '', '', '15212001200', '', '', '1', '10001');

-- ----------------------------
-- Table structure for caigou_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `caigou_warehouse`;
CREATE TABLE `caigou_warehouse` (
  `wareHouseId` int(11) NOT NULL AUTO_INCREMENT,
  `wareHouseName` varchar(255) DEFAULT NULL,
  `wareHouseStatus` varchar(255) DEFAULT NULL,
  `wareHouseType` varchar(255) DEFAULT NULL,
  `wareHouseInfo` varchar(255) DEFAULT NULL,
  `wareHouseBoolean` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`wareHouseId`),
  KEY `wareHouseName` (`wareHouseName`),
  KEY `fghfdgh` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caigou_warehouse
-- ----------------------------
INSERT INTO `caigou_warehouse` VALUES ('1', '仓库1', null, null, null, null, '10001');
INSERT INTO `caigou_warehouse` VALUES ('2', '仓库2', null, null, null, null, '10001');
INSERT INTO `caigou_warehouse` VALUES ('3', '仓库3', null, null, null, null, '10001');
INSERT INTO `caigou_warehouse` VALUES ('4', '仓库4', null, null, null, null, '10001');
INSERT INTO `caigou_warehouse` VALUES ('5', '仓库5', null, null, null, null, '1333333');
INSERT INTO `caigou_warehouse` VALUES ('6', '仓库6', null, null, null, null, '133333322');
INSERT INTO `caigou_warehouse` VALUES ('9', '仓库7', null, null, null, null, '10086');
INSERT INTO `caigou_warehouse` VALUES ('10', '仓库8', null, null, null, null, '10001');

-- ----------------------------
-- Table structure for caiwu_fukuan
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_fukuan`;
CREATE TABLE `caiwu_fukuan` (
  `fkId` int(11) NOT NULL AUTO_INCREMENT,
  `fkNo` varchar(1024) DEFAULT NULL,
  `fkSkName` varchar(1024) DEFAULT NULL,
  `fkSkNickName` varchar(1024) DEFAULT NULL,
  `fkNumber` int(11) DEFAULT NULL,
  `fkShouldpayMoney` double(8,2) DEFAULT NULL,
  `fkPayMoney` double(8,2) DEFAULT NULL,
  `fkShouzhilxId` int(11) NOT NULL,
  `fkRemark` varchar(1024) DEFAULT NULL,
  `fkCreaterId` int(11) NOT NULL,
  `fkCreaterTime` datetime NOT NULL,
  `fkOperatorId` int(11) DEFAULT NULL,
  `fkOperatorTime` datetime DEFAULT NULL,
  `fkState` int(11) NOT NULL,
  `fkzhDafaultId` int(100) DEFAULT NULL,
  PRIMARY KEY (`fkId`),
  KEY `fk_creator` (`fkCreaterId`),
  KEY `fk_operator` (`fkOperatorId`),
  KEY `fk_deafultId` (`fkzhDafaultId`),
  KEY `fk_shouzhilx` (`fkShouzhilxId`),
  CONSTRAINT `fk_creator` FOREIGN KEY (`fkCreaterId`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fk_deafultId` FOREIGN KEY (`fkzhDafaultId`) REFERENCES `caiwu_fukuanzh` (`fkzhDafaultId`),
  CONSTRAINT `fk_operator` FOREIGN KEY (`fkOperatorId`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fk_shouzhilx` FOREIGN KEY (`fkShouzhilxId`) REFERENCES `caiwu_shouzhilx` (`shouzhilxId`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caiwu_fukuan
-- ----------------------------
INSERT INTO `caiwu_fukuan` VALUES ('2', 'CG201612010002', '李四', '李四', '6', '1888.00', '0.00', '1', 'sad', '1333333', '2016-12-12 10:13:03', '1333333', '2016-12-12 10:13:09', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('3', 'CG201611300003', '王五', '王五', '12', '1200.00', '1200.00', '3', '撒旦', '133333322', '2016-12-09 10:28:35', '133333322', '2016-11-30 19:28:07', '2', '123');
INSERT INTO `caiwu_fukuan` VALUES ('4', 'CG20161130004', '王艳', '王艳', '50', '150000.00', '2323.00', '4', '啊肯定就会', '10001', '2016-12-09 10:28:35', '10001', '2016-11-30 19:29:13', '2', '181');
INSERT INTO `caiwu_fukuan` VALUES ('5', 'CG20161130005', '赵六', '赵六', '20', '1200.00', '0.00', '1', '阿斯顿', '10001', '2016-12-09 10:28:34', '10001', '2016-11-30 19:31:31', '2', '182');
INSERT INTO `caiwu_fukuan` VALUES ('15', 'CG201612020001', '4的表', '44', '1', '12.00', '0.00', '4', '132413 ', '10001', '2016-12-09 10:28:33', '10001', '2016-12-02 14:26:57', '2', '183');
INSERT INTO `caiwu_fukuan` VALUES ('16', 'CG201612020056', 'df', 'af', '2', '45.00', '46.00', '1', 'rff', '10001', '2016-12-14 10:26:26', null, '2016-12-14 10:26:31', '3', null);
INSERT INTO `caiwu_fukuan` VALUES ('17', 'CG201612020123', '陈雪', '赵六', '2', '1.00', '2.00', '2', null, '10001', '2016-12-09 10:28:02', null, null, '2', '185');
INSERT INTO `caiwu_fukuan` VALUES ('18', 'CG201612020000', 'xdgf', 'dv', '3', '4.00', '30000.00', '3', null, '1333333', '2016-12-09 10:27:56', null, null, '3', '181');
INSERT INTO `caiwu_fukuan` VALUES ('20', 'CG201612024876', 'vv', '44', '6', '24.00', '3.00', '3', null, '10001', '2016-12-09 10:27:57', '1333333', '2016-12-13 19:43:46', '3', '181');
INSERT INTO `caiwu_fukuan` VALUES ('27', '55', 'sss', 'aa', null, '1125.00', '5225.00', '12', '企鹅鱼', '10001', '2016-12-09 10:28:12', '10001', '2016-12-09 20:39:02', '4', '219');
INSERT INTO `caiwu_fukuan` VALUES ('28', '55', '宿舍', '65', null, '5.00', '5.00', '14', '', '10001', '2016-12-09 10:28:12', '10001', '2016-12-09 20:39:02', '4', '185');
INSERT INTO `caiwu_fukuan` VALUES ('30', '66', '公告', '宿舍', null, '222.00', '42.00', '12', '法萨芬', '10001', '2016-12-09 10:28:32', '10001', '2016-12-06 10:37:11', '2', '182');
INSERT INTO `caiwu_fukuan` VALUES ('31', '52045632566s', '火狐', '搜狐', null, '5000.00', '3000.00', '12', '极客营软件培训I', '10001', '2016-12-09 10:28:31', '10001', '2016-12-14 21:00:40', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('33', 'fsf234', '逆流而上', 'ss', null, '5555.00', '7777.00', '12', 'wew ', '10002', '2016-12-09 10:28:30', '10002', '2016-12-06 10:37:16', '4', '219');
INSERT INTO `caiwu_fukuan` VALUES ('34', '22', '1212221212', '333', null, '33223.00', '55.00', '14', '', '10003', '2016-12-09 10:28:30', '10003', '2016-12-09 20:38:47', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('35', 'wweww', 'asasa', 'wsww', null, '3456.00', '324.00', '11', '', '10002', '2016-12-09 10:28:29', '10002', '2016-12-09 20:38:49', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('36', '2222', 'assaaaaa', 'aaaa', null, '2.00', '2.00', '12', '', '10003', '2016-12-09 10:28:29', '10003', '2016-12-09 20:38:51', '4', '182');
INSERT INTO `caiwu_fukuan` VALUES ('37', '55', '1234444', 'aaaaa', null, '22222.00', '55456.00', '11', '', '10001', '2016-12-09 10:28:12', '10001', '2016-12-09 20:39:02', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('38', '1122', 'sdsfssa', 'fss', null, '333.00', '444.00', '12', '', '10001', '2016-12-09 10:28:28', '10001', '2016-12-09 20:38:53', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('39', '233', 'kkkkk', 'jj', null, '444.00', '2.00', '12', '', '10001', '2016-12-09 10:28:27', '10001', '2016-12-09 20:38:57', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('40', 'CG201612020', '小雪0', '小李子', '1', '0.00', '100000.00', '1', '莫', '10001', '2016-12-09 10:28:36', '10001', '2016-12-09 20:38:34', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('41', 'CG201612021', '小雪1', '小红子', '2', '10.00', '5888.00', '2', '我', '10001', '2016-12-09 10:28:36', '10001', '2016-12-09 20:38:36', '4', '185');
INSERT INTO `caiwu_fukuan` VALUES ('42', 'CG201612022', '小雪2', '小明', '3', '20.00', '13440.00', '3', null, '10001', '2016-12-09 10:28:36', '10001', '2016-12-09 20:38:38', '4', '229');
INSERT INTO `caiwu_fukuan` VALUES ('43', 'CG201612023', '小雪3', '彪', '4', '30.00', '1500.00', '4', null, '10001', '2016-12-09 10:28:37', '10001', '2016-12-09 20:38:32', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('44', 'CG201612024', '小雪4', '何', '5', '40.00', '1500.00', '6', null, '10001', '2016-12-09 10:28:38', '10001', '2016-12-09 20:38:22', '4', '229');
INSERT INTO `caiwu_fukuan` VALUES ('45', 'CG201612025', '小雪5', '人', '6', '50.00', '1688.00', '7', null, '10001', '2016-12-09 10:28:38', '10001', '2016-12-09 20:38:29', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('46', 'CG201612026', '小雪6', '你才', '7', '60.00', '1788.00', '8', null, '10001', '2016-12-09 10:28:39', '10001', '2016-12-09 20:38:12', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('47', 'CG201612027', '小雪7', '我是美女', '8', '70.00', '1200.00', '9', null, '10001', '2016-12-09 10:28:39', '10001', '2016-12-09 20:38:20', '4', '219');
INSERT INTO `caiwu_fukuan` VALUES ('48', 'CG201612028', '小雪8', '小红子', '9', '80.00', '1230.00', '10', null, '10001', '2016-12-09 10:28:40', '10001', '2016-12-09 20:38:07', '4', '123');
INSERT INTO `caiwu_fukuan` VALUES ('49', 'CG201612029', '小雪9', '小李子', '10', '90.00', '1555.00', '11', null, '10001', '2016-12-09 10:28:40', '10001', '2016-12-09 20:38:09', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('50', 'CG2016120210', '小雪10', '龙', '11', '100.00', '155.00', '12', null, '10001', '2016-12-09 10:28:41', '10001', '2016-12-09 20:38:03', '4', '183');
INSERT INTO `caiwu_fukuan` VALUES ('51', 'CG2016120211', '小雪11', '张', '12', '110.00', '10.00', '1', null, '10001', '2016-12-09 10:28:41', '10001', '2016-12-09 20:38:04', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('52', 'CG2016120212', '小雪12', '孙', '13', '120.00', '12.00', '12', null, '10001', '2016-12-09 10:28:42', '10001', '2016-12-09 20:37:58', '4', '185');
INSERT INTO `caiwu_fukuan` VALUES ('53', 'CG2016120213', '小雪13', '立', '14', '130.00', '12.00', '12', null, '10001', '2016-12-09 10:28:42', '10001', '2016-12-09 20:38:00', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('54', 'CG2016120214', '小雪14', '立', '15', '140.00', '12.00', '12', null, '10001', '2016-12-09 10:28:43', '10001', '2016-12-09 20:37:53', '4', '181');
INSERT INTO `caiwu_fukuan` VALUES ('55', 'CG2016120215', '小雪15', '立', '16', '150.00', '18.00', '3', null, '10001', '2016-12-09 10:28:43', '10001', '2016-12-09 20:37:55', '4', '185');
INSERT INTO `caiwu_fukuan` VALUES ('56', 'CG2016120216', '小雪16', null, '17', '160.00', null, '4', null, '10001', '2016-12-09 10:28:44', '10001', '2016-12-09 20:37:48', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('57', 'CG2016120217', '小雪17', null, '18', '170.00', null, '3', null, '10001', '2016-12-09 10:28:44', null, '2016-12-09 20:37:51', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('58', 'CG2016120218', '小雪18', null, '19', '180.00', null, '3', null, '10001', '2016-12-09 10:28:45', null, '2016-12-09 20:37:44', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('59', 'CG2016120219', '小雪19', null, '20', '190.00', null, '3', null, '10001', '2016-12-09 10:28:45', null, '2016-12-09 20:37:46', '4', null);
INSERT INTO `caiwu_fukuan` VALUES ('60', 'CG2016120220', '小雪20', null, '21', '200.00', null, '3', null, '10001', '2016-12-09 10:28:46', null, '2016-12-09 20:37:39', '4', null);
INSERT INTO `caiwu_fukuan` VALUES ('61', 'CG2016120221', '小雪21', null, '22', '210.00', null, '3', null, '10001', '2016-12-09 10:28:46', null, '2016-12-09 20:37:41', '4', null);
INSERT INTO `caiwu_fukuan` VALUES ('62', 'CG2016120222', '小雪22', null, '23', '220.00', null, '3', null, '10001', '2016-12-09 10:28:47', null, '2016-12-09 20:37:34', '2', null);
INSERT INTO `caiwu_fukuan` VALUES ('63', 'CG2016120223', '小雪23', null, '24', '230.00', null, '3', null, '10001', '2016-12-09 10:28:48', null, '2016-12-09 20:37:37', '2', null);
INSERT INTO `caiwu_fukuan` VALUES ('64', 'CG2016120224', '小雪24', null, '25', '240.00', null, '3', null, '10001', '2016-12-09 10:28:48', null, '2016-12-09 20:37:32', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('65', 'CG2016120225', '小雪25', null, '26', '250.00', null, '3', null, '10001', '2016-12-09 10:28:49', null, '2016-12-09 20:37:27', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('66', 'CG2016120226', '小雪26', null, '27', '260.00', null, '3', null, '10001', '2016-12-09 10:28:49', null, '2016-12-09 20:37:30', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('67', 'CG2016120227', '小雪27', null, '28', '270.00', null, '3', null, '10001', '2016-12-09 10:28:50', null, '2016-12-09 20:37:22', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('68', 'CG2016120228', '小雪28', null, '29', '280.00', null, '3', null, '10001', '2016-12-09 10:28:50', null, '2016-12-09 20:37:25', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('70', 'CG201612010007', '小雪30', null, '31', '300.00', null, '3', null, '10001', '2016-12-09 10:28:51', null, '2016-12-09 20:36:57', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('71', 'CG2016120231', '小雪31', null, '32', '310.00', null, '3', null, '10001', '2016-12-09 10:28:51', null, '2016-12-09 20:36:59', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('72', 'CG2016120232', '小雪32', null, '33', '320.00', null, '3', null, '10001', '2016-12-09 10:28:52', null, '2016-12-09 20:36:55', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('74', 'CG2016120234', '小雪34', null, '35', '340.00', null, '3', null, '10001', '2016-12-09 10:28:53', null, '2016-12-09 20:36:50', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('75', 'CG2016120235', '小雪35', null, '36', '350.00', null, '3', null, '10001', '2016-12-09 10:28:53', null, '2016-12-09 20:36:53', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('76', 'CG2016120236', '小雪36', null, '37', '360.00', null, '3', null, '10001', '2016-12-09 10:28:54', null, '2016-12-09 20:36:46', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('77', 'CG2016120237', '小雪37', null, '38', '370.00', null, '3', null, '10001', '2016-12-09 10:28:54', null, '2016-12-09 20:36:49', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('78', 'CG2016120238', '小雪38', null, '39', '380.00', null, '3', null, '10001', '2016-12-09 10:28:55', null, '2016-12-09 20:36:41', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('79', 'CG2016120239', '小雪39', null, '40', '390.00', null, '3', null, '10001', '2016-12-09 10:28:55', null, '2016-12-09 20:36:44', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('80', 'CG2016120240', '小雪40', null, '41', '400.00', null, '3', null, '10001', '2016-12-09 10:28:56', null, '2016-12-09 20:36:34', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('81', 'CG2016120241', '小雪41', null, '42', '410.00', null, '3', null, '10001', '2016-12-09 10:28:56', null, '2016-12-09 20:36:36', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('82', 'CG2016120242', '小雪42', null, '43', '420.00', null, '3', null, '10001', '2016-12-09 10:28:56', null, '2016-12-09 20:36:39', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('83', 'CG2016120243', '小雪43', null, '44', '430.00', '545.00', '3', null, '10001', '2016-12-09 10:28:57', null, '2016-12-09 20:15:23', '4', '288');
INSERT INTO `caiwu_fukuan` VALUES ('84', 'CG2016120244', '小雪44', null, '45', '440.00', null, '3', null, '10001', '2016-12-09 10:28:57', null, '2016-12-09 20:36:32', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('85', 'CG2016120245', '小雪45', null, '46', '450.00', null, '3', null, '10001', '2016-12-09 10:28:58', null, '2016-12-09 15:00:55', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('86', 'CG2016120246', '小雪46', null, '47', '460.00', '4444.00', '3', null, '10001', '2016-12-09 10:28:58', null, '2016-12-09 15:57:52', '4', '183');
INSERT INTO `caiwu_fukuan` VALUES ('87', 'CG2016120247', '小雪47', null, '48', '470.00', null, '3', null, '10001', '2016-12-09 10:28:59', null, '2016-12-09 10:54:41', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('88', 'CG2016120248', '小雪48', null, '49', '480.00', null, '3', null, '10001', '2016-12-09 10:28:59', null, '2016-12-09 10:54:50', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('89', 'CG2016120249', '小雪49', null, '50', '490.00', '56757.00', '3', null, '10001', '2016-12-09 10:29:00', null, '2016-12-09 10:54:29', '2', '65');
INSERT INTO `caiwu_fukuan` VALUES ('90', 'CG2016120250', '小雪50', null, '51', '500.00', null, '3', null, '10001', '2016-12-09 10:29:01', null, '2016-12-09 10:54:14', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('91', 'CG2016120251', '小雪51', null, '52', '510.00', null, '3', null, '10001', '2016-12-09 10:29:01', null, '2016-12-09 10:54:18', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('92', 'CG2016120252', '小雪52', null, '53', '520.00', null, '3', null, '10001', '2016-12-09 10:29:02', null, '2016-12-09 10:44:39', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('93', 'CG2016120253', '小雪53', null, '54', '530.00', '3432.00', '3', null, '10001', '2016-12-09 10:29:02', null, '2016-12-09 10:54:11', '4', '288');
INSERT INTO `caiwu_fukuan` VALUES ('94', 'CG2016120254', '小雪54', null, '55', '540.00', null, '3', null, '10001', '2016-12-09 10:29:03', null, '2016-12-09 10:44:31', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('95', 'CG2016120255', '小雪55', null, '56', '550.00', null, '3', null, '10001', '2016-12-09 10:29:03', null, '2016-12-09 10:44:33', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('96', 'CG2016120256', '小雪56', null, '57', '560.00', null, '3', null, '10001', '2016-12-09 10:29:04', null, '2016-12-09 10:42:20', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('97', 'CG2016120257', '小雪57', null, '58', '570.00', null, '3', null, '10001', '2016-12-09 10:29:04', null, '2016-12-09 10:44:25', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('98', 'CG2016120258', '小雪58', null, '59', '580.00', '0.00', '3', null, '10001', '2016-12-09 10:29:05', null, '2016-12-09 10:34:49', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('99', 'CG2016120259', '小雪59', null, '60', '590.00', null, '3', null, '10001', '2016-12-09 15:00:43', null, '2016-12-09 15:00:52', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('100', 'CG2016120260', '小雪60', null, '61', '600.00', null, '3', null, '10001', '2016-12-09 15:57:39', null, '2016-12-09 15:57:46', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('101', 'CG2016120261', '小雪61', null, '62', '610.00', null, '3', null, '10001', '2016-12-09 20:11:17', null, '2016-12-09 20:12:56', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('102', 'CG2016120262', '小雪62', null, '63', '620.00', null, '3', null, '10001', '2016-12-09 20:42:48', null, '2016-12-09 21:34:34', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('103', 'CG2016120263', '小雪63', null, '64', '630.00', null, '3', null, '10001', '2016-12-09 20:42:49', null, '2016-12-09 21:34:31', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('104', 'CG2016120264', '小雪64', null, '65', '640.00', null, '3', null, '10001', '2016-12-09 10:28:33', null, '2016-12-09 20:38:41', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('105', 'CG2016120265', '小雪65', null, '66', '650.00', null, '3', null, '10001', '2016-12-09 20:42:50', null, '2016-12-09 21:34:28', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('106', 'CG2016120266', '小雪66', null, '67', '660.00', null, '3', null, '10001', '2016-11-23 19:04:29', null, '2016-12-09 10:07:09', '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('107', 'CG2016120267', '小雪67', null, '68', '670.00', '22222.00', '3', null, '10001', '2016-12-09 20:42:50', null, '2016-12-09 20:47:24', '2', '229');
INSERT INTO `caiwu_fukuan` VALUES ('108', 'CG2016120268', '小雪68', null, '69', '680.00', null, '3', null, '10001', '2016-12-09 10:28:02', null, '2016-12-09 21:34:55', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('109', 'CG2016120269', '小雪69', null, '70', '690.00', null, '3', null, '10001', '2016-12-09 20:42:51', null, '2016-12-09 21:34:26', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('110', 'CG2016120270', '小雪70', null, '71', '700.00', null, '3', null, '10001', '2016-12-09 10:28:33', null, '2016-12-09 20:38:43', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('111', 'CG2016120271', '小雪71', null, '72', '710.00', null, '3', null, '10001', '2016-11-28 19:04:29', null, '2016-12-09 10:12:09', '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('112', 'CG2016120272', '小雪72', null, '73', '720.00', null, '3', null, '10001', '2016-11-29 19:04:29', null, '2016-12-09 10:13:34', '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('113', 'CG2016120273', '小雪73', null, '74', '730.00', null, '3', null, '10001', '2016-12-09 20:42:52', null, '2016-12-09 20:47:47', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('114', 'CG2016120274', '小雪74', null, '75', '740.00', null, '3', null, '10001', '2016-11-27 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('115', 'CG2016120275', '小雪75', null, '76', '750.00', null, '3', null, '10001', '2016-12-09 20:42:53', null, '2016-12-09 20:47:44', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('116', 'CG2016120276', '小雪76', null, '77', '760.00', null, '3', null, '10001', '2016-12-09 20:42:54', null, '2016-12-09 20:47:42', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('117', 'CG2016120277', '小雪77', null, '78', '770.00', '555555.00', '3', null, '10001', '2016-12-09 20:42:55', null, '2016-12-09 20:47:39', '2', '229');
INSERT INTO `caiwu_fukuan` VALUES ('118', 'CG2016120278', '小雪78', null, '79', '780.00', null, '3', null, '10003', '2016-12-09 20:42:56', null, '2016-12-09 20:47:36', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('119', 'CG2016120279', '小雪79', null, '80', '790.00', null, '3', null, '10001', '2016-12-09 20:42:57', null, '2016-12-09 20:47:33', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('120', 'CG2016120280', '小雪80', null, '81', '800.00', null, '3', null, '10001', '2016-12-09 20:42:58', null, '2016-12-09 20:47:29', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('121', 'CG2016120281', '小雪81', null, '82', '810.00', null, '3', null, '10001', '2016-12-09 20:42:59', null, '2016-12-09 20:47:27', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('122', 'CG2016120282', '小雪82', null, '83', '820.00', '777.00', '3', null, '10002', '2016-12-09 21:47:58', null, null, '2', '413');
INSERT INTO `caiwu_fukuan` VALUES ('123', 'CG2016120283', '小雪83', null, '84', '830.00', null, '3', null, '10001', '2016-12-09 21:47:59', null, '2016-12-12 10:13:22', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('124', 'CG2016120284', '小雪84', null, '85', '840.00', null, '3', null, '10001', '2016-12-09 21:48:00', null, '2016-12-12 09:09:49', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('125', 'CG2016120285', '小雪85', null, '86', '850.00', null, '3', null, '10001', '2016-12-09 21:48:01', null, '2016-12-12 08:51:13', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('126', 'CG2016120286', '小雪86', null, '87', '860.00', '0.00', '3', null, '10001', '2016-12-09 21:48:01', null, '2016-12-12 08:51:33', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('127', 'CG2016120287', '小雪87', null, '88', '870.00', '0.00', '3', null, '10001', '2016-12-09 21:48:02', null, '2016-12-12 08:49:45', '3', '183');
INSERT INTO `caiwu_fukuan` VALUES ('128', 'CG2016120288', '小雪88', null, '89', '880.00', '0.00', '3', null, '10001', '2016-12-09 21:48:02', null, '2016-12-12 08:50:37', '3', '229');
INSERT INTO `caiwu_fukuan` VALUES ('129', 'CG2016120289', '小雪89', null, '90', '890.00', null, '3', null, '10001', '2016-12-09 21:48:03', null, '2016-12-11 20:45:13', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('130', 'CG2016120290', '小雪90', null, '91', '900.00', null, '3', null, '10001', '2016-12-09 21:48:04', null, '2016-12-11 20:43:28', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('131', 'CG2016120291', '小雪91', null, '92', '910.00', '0.00', '3', null, '10001', '2016-12-09 21:48:04', null, '2016-12-12 08:49:23', '3', '219');
INSERT INTO `caiwu_fukuan` VALUES ('132', 'CG2016120292', '小雪92', null, '93', '920.00', null, '3', null, '10001', '2016-12-09 21:48:05', null, '2016-12-09 21:53:06', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('133', 'CG2016120293', '小雪93', null, '94', '930.00', '433.00', '3', null, '10001', '2016-12-09 21:48:05', null, '2016-12-11 20:43:19', '3', '413');
INSERT INTO `caiwu_fukuan` VALUES ('134', 'CG2016120294', '小雪94', null, '95', '940.00', null, '3', null, '10001', '2016-12-09 21:48:05', null, '2016-12-11 20:43:23', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('135', 'CG2016120295', '小雪95', null, '96', '950.00', null, '3', null, '10001', '2016-12-10 12:33:03', null, '2016-12-11 20:43:16', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('139', 'CG2016120299', '小雪99', null, '100', '990.00', null, '3', null, '10001', '2016-12-13 09:56:23', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('140', 'CG20161202100', '小雪100', null, '101', '1000.00', null, '3', null, '10001', '2016-12-13 09:56:25', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('141', 'CG20161202101', '小雪101', null, '102', '1010.00', null, '3', null, '10001', '2016-12-13 09:56:26', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('142', 'CG20161202102', '小雪102', null, '103', '1020.00', '0.00', '3', null, '10001', '2016-12-13 09:56:27', null, '2016-12-13 09:59:05', '3', '229');
INSERT INTO `caiwu_fukuan` VALUES ('143', 'CG20161202103', '小雪103', null, '104', '1030.00', '0.00', '3', null, '10001', '2016-12-13 09:56:29', null, '2016-12-13 09:58:11', '3', '413');
INSERT INTO `caiwu_fukuan` VALUES ('144', 'CG20161202104', '小雪104', null, '105', '1040.00', null, '3', null, '10001', '2016-12-13 20:00:54', null, null, '2', '469');
INSERT INTO `caiwu_fukuan` VALUES ('145', 'CG20161202105', '小雪105', null, '106', '1050.00', null, '3', null, '10001', '2016-12-13 20:00:57', null, '2016-12-15 09:08:02', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('148', 'CG20161202108', '小雪108', null, '109', '1080.00', null, '3', null, '10001', '2016-12-10 16:05:42', null, '2016-12-11 20:41:06', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('151', 'CG20161202111', '小雪111', null, '112', '1110.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('152', 'CG20161202112', '小雪112', null, '113', '1120.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('153', 'CG20161202113', '小雪113', null, '114', '1130.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('154', 'CG20161202114', '小雪114', null, '115', '1140.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('155', 'CG20161202115', '小雪115', null, '116', '1150.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('156', 'CG20161202116', '小雪116', null, '117', '1160.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('157', 'CG20161202117', '小雪117', null, '118', '1170.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('158', 'CG20161202118', '小雪118', null, '119', '1180.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('159', 'CG20161202119', '小雪119', null, '120', '1190.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('160', 'CG20161202120', '小雪120', null, '121', '1200.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('161', 'CG20161202121', '小雪121', null, '122', '1210.00', null, '3', null, '133333322', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('162', 'CG20161202122', '小雪122', null, '123', '1220.00', null, '3', null, '1333333340', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('163', 'CG20161202123', '小雪123', null, '124', '1230.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('164', 'CG20161202124', '小雪124', null, '125', '1240.00', null, '3', null, '1333333357', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('165', 'CG20161202125', '小雪125', null, '126', '1250.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('166', 'CG20161202126', '小雪126', null, '127', '1260.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('167', 'CG20161202127', '小雪127', null, '128', '1270.00', null, '3', null, '1333333357', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('168', 'CG20161202128', '小雪128', null, '129', '1280.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('169', 'CG20161202129', '小雪129', null, '130', '1290.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('170', 'CG20161202130', '小雪130', null, '131', '1300.00', null, '3', null, '10002', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('171', 'CG20161202131', '小雪131', null, '132', '1310.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, '2016-12-09 09:59:00', '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('172', 'CG20161202132', '小雪132', null, '133', '1320.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('173', 'CG20161202133', '小雪133', null, '134', '1330.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('174', 'CG20161202134', '小雪134', null, '135', '1340.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('176', 'CG20161202136', '小雪136', null, '137', '1360.00', null, '3', null, '1333333340', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('177', 'CG20161202137', '小雪137', null, '138', '1370.00', null, '3', null, '10001', '2016-12-14 21:00:07', null, '2016-12-14 21:00:19', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('178', 'CG20161202138', '小雪138', null, '139', '1380.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('179', 'CG20161202139', '小雪139', null, '140', '1390.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('180', 'CG20161202140', '小雪140', null, '141', '1400.00', null, '3', null, '133333322', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('181', 'CG20161202141', '小雪141', null, '142', '1410.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('182', 'CG20161202142', '小雪142', null, '143', '1420.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('183', 'CG20161202143', '小雪143', null, '144', '1430.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('184', 'CG20161202144', '小雪144', null, '145', '1440.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('185', 'CG20161202145', '小雪145', null, '146', '1450.00', null, '3', null, '133333322', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('186', 'CG20161202146', '小雪146', null, '147', '1460.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('187', 'CG20161202147', '小雪147', null, '148', '1470.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('188', 'CG20161202148', '小雪148', null, '149', '1480.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('189', 'CG20161202149', '小雪149', null, '150', '1490.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('190', 'CG20161202150', '小雪150', null, '151', '1500.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('191', 'CG20161202151', '小雪151', null, '152', '1510.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('192', 'CG20161202152', '小雪152', null, '153', '1520.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('193', 'CG20161202153', '小雪153', null, '154', '1530.00', null, '3', null, '10003', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('194', 'CG20161202154', '小雪154', null, '155', '1540.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('195', 'CG20161202155', '小雪155', null, '156', '1550.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('196', 'CG20161202156', '小雪156', null, '157', '1560.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('197', 'CG20161202157', '小雪157', null, '158', '1570.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('198', 'CG20161202158', '小雪158', null, '159', '1580.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('199', 'CG20161202159', '小雪159', null, '160', '1590.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('200', 'CG20161202160', '小雪160', null, '161', '1600.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('201', 'CG20161202161', '小雪161', null, '162', '1610.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('202', 'CG20161202162', '小雪162', null, '163', '1620.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('203', 'CG20161202163', '小雪163', null, '164', '1630.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('204', 'CG20161202164', '小雪164', null, '165', '1640.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('205', 'CG20161202165', '小雪165', null, '166', '1650.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('206', 'CG20161202166', '小雪166', null, '167', '1660.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('207', 'CG20161202167', '小雪167', null, '168', '1670.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('208', 'CG20161202168', '小雪168', null, '169', '1680.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('209', 'CG20161202169', '小雪169', null, '170', '1690.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('210', 'CG20161202170', '小雪170', null, '171', '1700.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('211', 'CG20161202171', '小雪171', null, '172', '1710.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('212', 'CG20161202172', '小雪172', null, '173', '1720.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('213', 'CG20161202173', '小雪173', null, '174', '1730.00', null, '3', null, '1333333', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('214', 'CG20161202174', '小雪174', null, '175', '1740.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('215', 'CG20161202175', '小雪175', null, '176', '1750.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('216', 'CG20161202176', '小雪176', null, '177', '1760.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('217', 'CG20161202177', '小雪177', null, '178', '1770.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('218', 'CG20161202178', '小雪178', null, '179', '1780.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('219', 'CG20161202179', '小雪179', null, '180', '1790.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('220', 'CG20161202180', '小雪180', null, '181', '1800.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('221', 'CG20161202181', '小雪181', null, '182', '1810.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('222', 'CG20161202182', '小雪182', null, '183', '1820.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('223', 'CG20161202183', '小雪183', null, '184', '1830.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('224', 'CG20161202184', '小雪184', null, '185', '1840.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('225', 'CG20161202185', '小雪185', null, '186', '1850.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('226', 'CG20161202186', '小雪186', null, '187', '1860.00', null, '3', null, '10001', '2016-12-15 09:07:24', null, '2016-12-15 09:07:30', '3', '64');
INSERT INTO `caiwu_fukuan` VALUES ('227', 'CG20161202187', '小雪187', null, '188', '1870.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('228', 'CG20161202188', '小雪188', null, '189', '1880.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('229', 'CG20161202189', '小雪189', null, '190', '1890.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('230', 'CG20161202190', '小雪190', null, '191', '1900.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('231', 'CG20161202191', '小雪191', null, '192', '1910.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('232', 'CG20161202192', '小雪192', null, '193', '1920.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('233', 'CG20161202193', '小雪193', null, '194', '1930.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('234', 'CG20161202194', '小雪194', null, '195', '1940.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('235', 'CG20161202195', '小雪195', null, '196', '1950.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('236', 'CG20161202196', '小雪196', null, '197', '1960.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('237', 'CG20161202197', '小雪197', null, '198', '1970.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('238', 'CG20161202198', '小雪198', null, '199', '1980.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('239', 'CG20161202199', '小雪199', null, '200', '1990.00', null, '3', null, '10001', '2016-11-30 19:04:29', null, null, '1', '64');
INSERT INTO `caiwu_fukuan` VALUES ('240', 'ssqq', 'qqq', 'rrr', null, '111.00', '666666.00', '12', '', '10001', '2016-12-09 10:28:21', null, '2016-12-09 20:38:59', '4', '219');
INSERT INTO `caiwu_fukuan` VALUES ('241', 'CG1234asd54', '李志强', '小强', null, '452120.00', '45634.00', '12', '', '10001', '2016-12-05 06:22:59', '10001', '2016-12-09 10:40:05', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('242', 'ssszzz', 'dddd', '333', null, '444.00', '44444.00', '12', '', '10001', '2016-12-09 10:28:12', null, '2016-12-09 20:39:04', '4', '65');
INSERT INTO `caiwu_fukuan` VALUES ('244', 'CG201612010014', 'igeek', null, '66', '5.00', null, '3', null, '10001', '2016-12-09 10:28:32', null, '2016-12-09 20:38:45', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('245', '355', 'hangsnsi', '范德萨发', null, '3344.00', '666.00', '11', '', '10001', '2016-12-09 10:28:10', null, '2016-12-09 20:39:14', '4', '219');
INSERT INTO `caiwu_fukuan` VALUES ('246', 'lol123', '卢锡安', '圣枪游侠', null, '6300.00', '6300.00', '9', '省', '10001', '2016-12-09 10:28:09', null, '2016-12-09 20:39:16', '4', '229');
INSERT INTO `caiwu_fukuan` VALUES ('247', '44', '无忌简称', '一', null, '3150.00', '55555.00', '12', '', '10001', '2016-12-09 10:28:09', null, '2016-12-09 20:39:18', '4', '65');
INSERT INTO `caiwu_fukuan` VALUES ('248', '7777', '4444', '纷纷大幅', null, '666.00', '55656.00', '12', '', '10001', '2016-12-09 10:28:08', null, '2016-12-09 20:39:21', '4', '229');
INSERT INTO `caiwu_fukuan` VALUES ('253', 'CG201612010017', 'igeek', null, '2', '5.00', null, '3', null, '10001', '2016-12-09 10:28:11', null, '2016-12-09 20:39:10', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('256', 'CG201612010016', 'igeek', null, '22', '5.00', null, '3', null, '10001', '2016-12-09 10:28:07', null, '2016-12-09 20:39:23', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('257', '4657468731', '轻轻', '轻微', null, '12.00', '1212.00', '8', '', '10001', '2016-12-09 10:28:11', '10001', '2016-12-09 20:39:07', '4', '264');
INSERT INTO `caiwu_fukuan` VALUES ('258', '12', '12', '12', null, '21.00', '12.00', '14', '', '10001', '2016-12-09 10:28:10', null, '2016-12-09 20:39:12', '4', '183');
INSERT INTO `caiwu_fukuan` VALUES ('259', '23233232', '轻轻', '轻轻', '5', '12.00', '2332.00', '14', '', '10001', '2016-12-09 10:28:06', '10001', '2016-12-09 20:39:26', '4', '266');
INSERT INTO `caiwu_fukuan` VALUES ('264', 'CG201612070006', '111', null, '3', '3981.00', null, '3', null, '10001', '2016-12-09 10:28:05', null, '2016-12-09 20:40:14', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('265', 'CG201612070006', '111', null, '3', '3981.00', null, '3', null, '10001', '2016-12-09 10:28:05', null, '2016-12-09 20:40:14', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('266', 'CG201612070006', '111', null, '3', '3981.00', null, '3', null, '10001', '2016-12-09 10:28:05', null, '2016-12-09 20:40:14', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('267', 'CG201612070006', '111', null, '5', '5651.00', null, '3', null, '10001', '2016-12-09 10:28:05', null, '2016-12-09 20:40:14', '4', '64');
INSERT INTO `caiwu_fukuan` VALUES ('269', 'CG201612070008', '111', null, '666', '7326.00', null, '3', null, '10001', '2016-12-09 10:28:03', null, '2016-12-09 21:34:49', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('270', 'CG201612070007', '111', null, '66', '726.00', null, '3', null, '10001', '2016-12-09 10:28:04', null, '2016-12-09 21:34:47', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('271', 'CG201612070008', '111', null, '12', '360.00', null, '3', null, '10001', '2016-12-09 10:28:03', null, '2016-12-09 21:34:49', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('272', 'CG201612070005', '111', null, '60', '120.00', null, '3', null, '10001', '2016-12-09 10:28:05', null, '2016-12-09 21:34:40', '2', '413');
INSERT INTO `caiwu_fukuan` VALUES ('273', 'CG201612070011', '111', null, '2', '40.00', null, '3', null, '10001', '2016-12-09 10:28:03', null, '2016-12-09 21:34:53', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('274', 'CG201612080014', '111', null, '6', '1200.00', null, '3', null, '10001', '2016-12-09 10:28:01', null, '2016-12-09 21:34:57', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('275', 'CG201612080013', '1', null, '5', '82342.00', '0.00', '3', null, '10001', '2016-12-09 10:28:00', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('276', 'CG201612080013', '1', null, '5', '82342.00', '0.00', '3', null, '10001', '2016-12-09 10:28:00', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('277', 'CG201612080013', '1', null, '5', '82342.00', '0.00', '3', null, '10001', '2016-12-09 10:28:00', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('278', 'CG201612080013', '111', null, '600', '1200.00', '0.00', '3', null, '10001', '2016-12-09 10:28:00', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('279', 'CG201612080013', '111', null, '30', '30.00', '0.00', '3', null, '10001', '2016-12-09 10:28:00', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('280', 'CG201612080012', '111', null, '30', '600.00', null, '3', null, '10001', '2016-12-09 10:27:59', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('281', 'CG201612080012', '111', null, '33', '33.00', null, '3', null, '10001', '2016-12-09 10:27:59', null, null, '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('282', 'CG201612080016', '12', null, '33', '66.00', null, '3', null, '10001', '2016-12-09 10:27:58', null, null, '2', null);
INSERT INTO `caiwu_fukuan` VALUES ('283', 'CG201612080015', '1', null, '99', '99.00', '0.00', '3', null, '10001', '2016-12-09 10:27:59', null, null, '2', '288');
INSERT INTO `caiwu_fukuan` VALUES ('284', 'afas00', '菲尔普斯', '飞人', null, '12322.00', '5420.00', '11', 'dfsfsfdsf', '10001', '2016-12-09 10:28:02', null, '2016-12-09 21:34:45', '2', '183');
INSERT INTO `caiwu_fukuan` VALUES ('285', 'afas00', '菲尔普斯', '飞人', null, '12322.00', '5420.00', '12', 'dfsfsfdsf', '10001', '2016-12-09 10:28:02', null, '2016-12-09 21:34:45', '2', '65');
INSERT INTO `caiwu_fukuan` VALUES ('286', 'fdsf333', 'assss', 'czdzczc', null, '3333.00', '33444.00', '14', 'dfsf', '10001', '2016-12-09 10:28:01', null, '2016-12-09 21:52:55', '2', '183');
INSERT INTO `caiwu_fukuan` VALUES ('287', 'CG201612070001', '111', null, '6', '3996.00', null, '3', null, '10001', '2016-12-09 10:28:06', null, '2016-12-09 20:39:28', '4', null);
INSERT INTO `caiwu_fukuan` VALUES ('288', 'CG201612070002', '111', null, '6', '3996.00', null, '3', null, '10001', '2016-12-09 10:28:06', null, '2016-12-09 20:39:30', '4', null);
INSERT INTO `caiwu_fukuan` VALUES ('289', '阿斯蒂芬vsdf电饭锅', '李英男', '李四', null, '12345.00', '12.00', '12', '', '10001', '2016-12-09 10:34:06', null, '2016-12-09 10:34:45', '2', '64');
INSERT INTO `caiwu_fukuan` VALUES ('290', '44443', '45', 'er', null, '3333.00', '3333.00', '14', '', '10001', '2016-12-09 03:59:37', null, null, '2', '65');
INSERT INTO `caiwu_fukuan` VALUES ('291', '5555555555555555', '12312', '123123', null, '3232.00', '21312.00', '16', '', '10001', '2016-12-09 16:02:23', null, '2016-12-09 20:15:20', '4', '229');
INSERT INTO `caiwu_fukuan` VALUES ('292', '32323', '3rrw', '', null, '3233.00', '455.00', '17', '', '10001', '2016-12-12 10:18:58', null, '2016-12-12 10:36:46', '3', '229');
INSERT INTO `caiwu_fukuan` VALUES ('293', 'fdfe', 'sss', 'ss', null, '33.00', '333.00', '18', '', '10001', '2016-12-12 11:25:50', null, null, '2', '184');
INSERT INTO `caiwu_fukuan` VALUES ('294', '12555', '你好', 'dd', null, '333.00', '4555.50', '18', '', '10001', '2016-12-12 11:27:11', null, null, '2', '184');
INSERT INTO `caiwu_fukuan` VALUES ('295', '51555', '选择型号', '四十四', null, '2255.00', '465.00', '19', '', '10001', '2016-12-12 11:28:37', null, null, '2', '229');
INSERT INTO `caiwu_fukuan` VALUES ('296', '55656', '接收方', '323', null, '26565.00', '41615.00', '17', '', '10001', '2016-12-12 11:31:46', null, '2016-12-12 14:22:32', '3', '229');
INSERT INTO `caiwu_fukuan` VALUES ('297', '544', '李四', 'aaa', null, '6544.00', '5145.00', '22', '撒啊啊', '10002', '2016-12-14 11:33:56', null, '2016-12-15 09:07:38', '4', '459');
INSERT INTO `caiwu_fukuan` VALUES ('298', '52045632566s', '陈二', '丽丽', null, '5222.00', '5878.00', '22', '44424', '10002', '2016-12-14 11:38:05', null, '2016-12-14 21:00:40', '4', '184');
INSERT INTO `caiwu_fukuan` VALUES ('299', '787878', '555', '444', null, '5555.00', '5656.00', '2', '', '10001', '2016-12-15 09:10:41', null, null, '2', '469');
INSERT INTO `caiwu_fukuan` VALUES ('300', 'r24', 'zd', '', null, '12.00', '12.00', '14', '', '10001', '2016-12-15 13:12:16', null, null, '2', '229');
INSERT INTO `caiwu_fukuan` VALUES ('301', 'CG201612010018', 'igeek', null, '22', '5.00', null, '3', null, '10001', '2016-12-06 14:32:03', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('302', 'CG201612010018', 'igeek', null, '22', '5.00', null, '3', null, '10001', '2016-12-06 14:32:03', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('303', 'CG201612010018', 'igeek', null, '22', '5.00', null, '3', null, '10001', '2016-12-06 14:32:03', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('304', 'CG201612010018', 'igeek', null, '22', '5.00', null, '3', null, '10001', '2016-12-06 14:32:03', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('305', 'CG201612010019', 'igeek', null, '0', '5.00', null, '3', null, '10001', '2016-12-06 14:32:03', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('306', 'CG201612010020', 'igeek', null, '22365', '5.00', null, '3', null, '10001', '2016-12-06 14:32:02', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('307', 'CG201612010022', 'igeek', null, '5', '5.00', null, '3', null, '10001', '2016-12-06 14:32:01', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('308', '313131', '阿里巴巴', null, '20', '600.00', null, '3', null, '10001', '2016-12-06 19:43:52', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('310', '3131231', '213', null, '10', '300.00', null, '3', null, '10001', '2016-12-07 09:12:04', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('311', 'CG201612010023', 'igeek', null, '5', '5.00', null, '3', null, '10001', '2016-12-06 14:32:01', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('312', 'CG201612010023', 'igeek', null, '5', '5.00', null, '3', null, '10001', '2016-12-06 14:32:01', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('313', 'CG201612070001', '111', null, '6', '3996.00', null, '3', null, '10001', '2016-12-07 10:32:51', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('314', 'CG201612070004', '111', null, '300', '600.00', null, '3', null, '10001', '2016-12-07 14:22:51', null, null, '1', null);
INSERT INTO `caiwu_fukuan` VALUES ('315', '1236995', 'tom', 'jack', null, '12.00', '0.00', '14', '', '10001', '2016-12-15 14:43:32', null, null, '2', '229');

-- ----------------------------
-- Table structure for caiwu_fukuanzh
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_fukuanzh`;
CREATE TABLE `caiwu_fukuanzh` (
  `fkzhBankId` varchar(255) NOT NULL,
  `flshopId` int(11) NOT NULL,
  `fkzhBankName` varchar(100) NOT NULL,
  `fkzhDafaultId` int(100) NOT NULL AUTO_INCREMENT COMMENT '默认付款账号主键自增，业务代码不需要插入此字段数据。',
  `fkzhRemark` varchar(100) DEFAULT NULL,
  `dafaultBankId` bit(1) DEFAULT b'0',
  `isExist` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`fkzhDafaultId`),
  KEY `relation` (`flshopId`),
  KEY `fkzhBankId` (`fkzhBankId`),
  CONSTRAINT `relation` FOREIGN KEY (`flshopId`) REFERENCES `caigou_shop` (`shopId`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caiwu_fukuanzh
-- ----------------------------
INSERT INTO `caiwu_fukuanzh` VALUES ('6222021718011', '2', 'åè¡', '64', '9966', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('3243', '1001', '546', '65', '326', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('6646516111333', '4', '建行', '123', '123456', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('6646516111333', '1', '建行', '181', '123456', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('6646516111333', '1', '建行', '182', 'llllkkkkk', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('13', '5', '13', '183', '13', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('222', '4', '222', '184', '6666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('6646516111333', '1', '建行', '185', '123456', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('664651611112222', '1', '建行1', '219', '1111', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('622222', '1', '工商', '229', '工商', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('6646516111333', '2', '建行', '264', '66666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('622222', '1', '工商', '266', '工商', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('Aa126422551', '2', 'åè¡', '288', '6666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('55555', '1', '55555', '413', '55555', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('622222', '1', '工商', '425', '工商', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('11111', '4', '111', '426', 'iiiuyuyyyy', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('是', '2', '是', '459', '是', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('1111', '2', '1111', '460', '1111', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('2222', '2', '2222', '461', '22222', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('55555', '3', '44444', '462', '5555', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('666', '5', '5666', '463', '66jjjjj8888', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('99999', '3', '9999', '464', '66666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('999', '4', '999', '465', '6+++++', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('8888', '4', '888', '466', '888888', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('11111', '4', '1111', '467', '11111', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('11111', '4', '1111', '468', '1111', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('75637468', '3', '877575', '469', '477986789', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('453453', '2', '5345', '470', '22222', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('453453', '3', '453453', '471', '4534534', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('345345', '3', '45345', '472', '9999', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('45345', '4', '543', '473', '55555', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('875', '2', '774', '474', '4775378', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('11111', '2', '11111', '475', '9999', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('gjty', '2', 'ghhj', '476', 'jtyjty', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('hjghj', '2', 'ghjg', '477', '888888', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('bbb', '2', 'bggbb', '478', 'bbbb', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('fff', '2', 'ffff', '479', '66666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('sdd', '2', 'sdds', '480', 'sddd', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('111', '2', '111', '481', '5276378367', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('nmbnm', '4', '11111', '483', '11111', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('5542', '2', '4444555', '484', '55555', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('khj,', '3', 'jhkhj', '485', '66666', '\0', '');
INSERT INTO `caiwu_fukuanzh` VALUES ('111111', '3', '111111', '486', '74147127', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('88888', '3', '888888', '487', '9999', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('6666', '3', '6666', '488', '666', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('8888', '3', '666668', '489', '8888', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('9999', '4', '9999', '490', '99999', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('22222', '5', '111', '491', '111', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('66666666666666', '2', '666666666', '492', '6666666666666', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('他', '2', '他', '493', '他', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('888969', '1', '6666688', '494', '9999', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('666', '2', '6666', '495', '7777', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('ffff', '2', 'ggggg', '496', '1111', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('[]o', '2', '[[', '497', '555555', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('3333', '2', '77777', '498', '1111', '\0', '\0');
INSERT INTO `caiwu_fukuanzh` VALUES ('hhh', '2', '6666', '499', 'hhhhhh', '\0', '\0');

-- ----------------------------
-- Table structure for caiwu_kucuncb
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_kucuncb`;
CREATE TABLE `caiwu_kucuncb` (
  `goodId` int(11) NOT NULL COMMENT '商品货号',
  `wareHouseId` int(255) NOT NULL,
  `kucunCost` double DEFAULT '0' COMMENT '库存成本',
  PRIMARY KEY (`goodId`,`wareHouseId`),
  KEY `adfsdfsdg` (`wareHouseId`),
  CONSTRAINT `adfsdfsdg` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `caiwu_kucuncb_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caiwu_kucuncb
-- ----------------------------
INSERT INTO `caiwu_kucuncb` VALUES ('0', '1', '2');
INSERT INTO `caiwu_kucuncb` VALUES ('0', '2', '211');
INSERT INTO `caiwu_kucuncb` VALUES ('0', '3', '1');
INSERT INTO `caiwu_kucuncb` VALUES ('2', '1', '2');
INSERT INTO `caiwu_kucuncb` VALUES ('2', '2', '11');
INSERT INTO `caiwu_kucuncb` VALUES ('2', '3', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('3', '1', '1');
INSERT INTO `caiwu_kucuncb` VALUES ('3', '2', '1');
INSERT INTO `caiwu_kucuncb` VALUES ('11', '1', '1');
INSERT INTO `caiwu_kucuncb` VALUES ('11', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('101', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('101', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('123', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('123', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('123', '3', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('222', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('222', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('606', '1', '11');
INSERT INTO `caiwu_kucuncb` VALUES ('666', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('666', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('999', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('1327', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('69852', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100001', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100001', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100002', '2', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100002', '3', '1');
INSERT INTO `caiwu_kucuncb` VALUES ('100004', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100006', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100007', '1', '0');
INSERT INTO `caiwu_kucuncb` VALUES ('100007', '5', '0');

-- ----------------------------
-- Table structure for caiwu_kucunmx
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_kucunmx`;
CREATE TABLE `caiwu_kucunmx` (
  `goodId` int(11) DEFAULT NULL COMMENT '商品编号',
  `warehouseId` int(11) DEFAULT NULL COMMENT '仓库编号',
  `businessName` varchar(100) DEFAULT NULL COMMENT '业务',
  `billsName` varchar(100) DEFAULT '管理员' COMMENT '相关单据号',
  `changeTime` datetime DEFAULT NULL COMMENT '变动时间',
  `firstInventory` int(255) DEFAULT NULL COMMENT '期初库存',
  `firstCost` double(255,0) DEFAULT NULL COMMENT '期初成本',
  `lastInventory` int(255) DEFAULT NULL COMMENT '期末库存',
  `lastCost` double DEFAULT NULL COMMENT '期末库存',
  KEY `goodId` (`goodId`),
  KEY `ujghkhjkh` (`warehouseId`),
  CONSTRAINT `caiwu_kucunmx_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `ujghkhjkh` FOREIGN KEY (`warehouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caiwu_kucunmx
-- ----------------------------
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '库存初始化', '管理员', '2016-12-08 16:35:30', '1000', '1', '1000', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '2', '库存初始化', '管理员', '2016-12-12 13:11:54', '111', '2', '111', '2');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '2', '手工调价', '管理员', '2016-12-12 13:12:01', '111', '2', '111', '21');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '手工调价', '管理员', '2016-12-12 14:16:31', '1000', '1', '500', '11');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '手工调价', '管理员', '2016-12-12 19:15:49', '500', '11', '500', '111');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '手工调价', '管理员', '2016-12-12 19:52:33', '500', '111', '500', '1112');
INSERT INTO `caiwu_kucunmx` VALUES ('3', '1', '库存初始化', '管理员', '2016-12-12 23:21:05', '10', '1', '10', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('606', '1', '库存初始化', '管理员', '2016-12-12 23:21:20', '40', '1', '40', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('606', '1', '手工调价', '管理员', '2016-12-12 23:21:27', '40', '1', '40', '11');
INSERT INTO `caiwu_kucunmx` VALUES ('100002', '3', '库存初始化', '管理员', '2016-12-12 23:39:42', '50', '1', '50', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '2', '手工调价', '管理员', '2016-12-13 13:07:02', '111', '21', '111', '211');
INSERT INTO `caiwu_kucunmx` VALUES ('3', '2', '库存初始化', '管理员', '2016-12-13 13:07:25', '15', '1', '15', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('2', '1', '库存初始化', '管理员', '2016-12-15 09:55:52', '100', '1', '100', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('11', '1', '库存初始化', '管理员', '2016-12-15 09:57:01', '1000', '1', '1000', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '手工调价', '管理员', '2016-12-15 09:57:56', '500', '1112', '656', '11');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '3', '库存初始化', '管理员', '2016-12-15 11:50:25', '111', '1', '111', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('2', '2', '库存初始化', '管理员', '2016-12-15 11:50:39', '10', '1', '10', '1');
INSERT INTO `caiwu_kucunmx` VALUES ('2', '2', '手工调价', '管理员', '2016-12-15 11:50:45', '10', '1', '10', '11');
INSERT INTO `caiwu_kucunmx` VALUES ('0', '1', '手工调价', '管理员', '2016-12-15 13:51:19', '656', '11', '656', '2');
INSERT INTO `caiwu_kucunmx` VALUES ('2', '1', '手工调价', '管理员', '2016-12-15 13:51:47', '100', '1', '100', '2');

-- ----------------------------
-- Table structure for caiwu_shoukuan
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_shoukuan`;
CREATE TABLE `caiwu_shoukuan` (
  `skId` int(11) NOT NULL AUTO_INCREMENT,
  `skPayerName` varchar(50) DEFAULT NULL,
  `skPayerNickname` varchar(50) DEFAULT NULL,
  `skReceiptsCode` varchar(50) DEFAULT NULL,
  `skPayables` double(50,0) DEFAULT NULL,
  `skReceivable` double(50,0) DEFAULT NULL,
  `skCreatorId` int(11) NOT NULL,
  `skCreateDate` datetime DEFAULT NULL,
  `skOperatorId` int(11) DEFAULT NULL,
  `skOperationDate` datetime DEFAULT NULL,
  `skBeiZhu` varchar(50) DEFAULT NULL,
  `skState` int(11) DEFAULT NULL,
  `shouzhilxId` int(11) DEFAULT NULL,
  `fkzhDafaultId` int(100) DEFAULT NULL,
  PRIMARY KEY (`skId`),
  KEY `szlx` (`shouzhilxId`),
  KEY `creatorId` (`skCreatorId`),
  KEY `operatorId` (`skOperatorId`),
  KEY `fkzh` (`fkzhDafaultId`),
  CONSTRAINT `creatorId` FOREIGN KEY (`skCreatorId`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fkzh` FOREIGN KEY (`fkzhDafaultId`) REFERENCES `caiwu_fukuanzh` (`fkzhDafaultId`),
  CONSTRAINT `operatorId` FOREIGN KEY (`skOperatorId`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `szlx` FOREIGN KEY (`shouzhilxId`) REFERENCES `caiwu_shouzhilx` (`shouzhilxId`)
) ENGINE=InnoDB AUTO_INCREMENT=10073 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caiwu_shoukuan
-- ----------------------------
INSERT INTO `caiwu_shoukuan` VALUES ('738', '卢卡斯5-', 'å¢å¡æ–¯', '1022', '122', '133', '1333333357', '2016-12-07 15:41:34', '1333333357', '2016-12-07 15:41:44', 'å¢å¡æ–¯', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('739', '卢卡斯5-', 'lks5-', '1024', '100', '100', '1333333340', '2016-12-06 04:14:58', '1333333340', '2016-12-06 04:11:58', 'lsk1', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('740', '卖血上网10*', 'mxsw10*', '1026', '200', '200', '10002', '2016-12-06 04:17:58', '10003', '2016-12-06 04:11:58', '网费未付2', '0', '7', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('741', '迪卡15^_^', 'dk15^_^', '1028', '300', '300', '10002', '2016-12-06 04:20:58', '10003', '2016-12-06 04:11:58', 'sdf3', '0', '6', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('742', '卢卡斯20-', 'lks20-', '1030', '400', '400', '10002', '2016-12-06 04:23:58', '10003', '2016-12-06 04:11:58', 'lsk4', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('743', '卖血上网25*', 'mxsw25*', '1032', '500', '500', '10002', '2016-12-06 04:26:58', '10003', '2016-12-06 04:11:58', '网费未付5', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('744', '迪卡30^_^', 'dk30^_^', '1034', '600', '600', '10002', '2016-12-06 04:29:58', '10003', '2016-12-06 04:11:58', 'sdf6', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('745', '卢卡斯35-', 'lks35-', '1036', '700', '700', '10002', '2016-12-06 04:32:58', '10003', '2016-12-06 04:11:58', 'lsk7', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('746', '卖血上网40*', 'mxsw40*', '1038', '800', '800', '10002', '2016-12-06 04:35:58', '10003', '2016-12-06 04:11:58', '网费未付8', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('747', '迪卡45^_^', 'dk45^_^', '1040', '900', '900', '10002', '2016-12-06 04:38:58', '10003', '2016-12-06 04:11:58', 'sdf9', '0', '6', null);
INSERT INTO `caiwu_shoukuan` VALUES ('748', '卢卡斯50-', 'lks50-', '1042', '1000', '1000', '10002', '2016-12-06 04:41:58', '10003', '2016-12-06 04:11:58', 'lsk10', '0', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('749', '卖血上网55*', 'mxsw55*', '1044', '1100', '1100', '10002', '2016-12-06 04:44:58', '10003', '2016-12-06 04:11:58', '网费未付11', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('750', '迪卡60^_^', 'dk60^_^', '1046', '1200', '1200', '10002', '2016-12-06 04:47:58', '10003', '2016-12-06 04:11:58', 'sdf12', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('751', '卢卡斯65-', 'lks65-', '1048', '1300', '1300', '10002', '2016-12-06 04:50:58', '10003', '2016-12-06 04:11:58', 'lsk13', '0', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('752', '卖血上网70*', 'mxsw70*', '1050', '1400', '1400', '10002', '2016-12-06 04:53:58', '10003', '2016-12-06 04:11:58', '网费未付14', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('753', '迪卡75^_^', 'dk75^_^', '1052', '1500', '1500', '10002', '2016-12-06 04:56:58', '10003', '2016-12-06 04:11:58', 'sdf15', '0', '6', null);
INSERT INTO `caiwu_shoukuan` VALUES ('754', '卢卡斯80-', 'lks80-', '1054', '1600', '1600', '10002', '2016-12-06 04:59:58', '10003', '2016-12-06 04:11:58', 'lsk16', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('755', '卖血上网85*', 'mxsw85*', '1056', '1700', '1700', '10002', '2016-12-06 05:02:59', '10003', '2016-12-06 04:11:59', '网费未付17', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('756', '迪卡90^_^', 'dk90^_^', '1058', '1800', '1800', '10002', '2016-12-06 05:05:59', '10003', '2016-12-06 04:11:59', 'sdf18', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('757', '卢卡斯95-', 'lks95-', '1060', '1900', '1900', '10002', '2016-12-06 05:08:59', '10003', '2016-12-06 04:11:59', 'lsk19', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('758', '卖血上网100*', 'mxsw100*', '1062', '2000', '2000', '10002', '2016-12-06 05:11:59', '10003', '2016-12-06 04:11:59', '网费未付20', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('759', '迪卡105^_^', 'dk105^_^', '1064', '2100', '2100', '10002', '2016-12-06 05:14:59', '10003', '2016-12-06 04:11:59', 'sdf21', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('760', '卢卡斯110-', 'lks110-', '1066', '2200', '2200', '10002', '2016-12-06 05:17:59', '10003', '2016-12-06 04:11:59', 'lsk22', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('761', '卖血上网115*', 'mxsw115*', '1068', '2300', '2300', '10002', '2016-12-06 05:20:59', '10003', '2016-12-06 04:11:59', '网费未付23', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('762', '迪卡120^_^', 'dk120^_^', '1070', '2400', '2400', '10002', '2016-12-06 05:23:59', '10003', '2016-12-06 04:11:59', 'sdf24', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('763', '卢卡斯125-', 'lks125-', '1072', '2500', '2500', '10002', '2016-12-06 05:26:59', '10003', '2016-12-06 04:11:59', 'lsk25', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('764', '卖血上网130*', 'mxsw130*', '1074', '2600', '2600', '10002', '2016-12-06 05:29:59', '10003', '2016-12-06 04:11:59', '网费未付26', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('765', '迪卡135^_^', 'dk135^_^', '1076', '2700', '2700', '10002', '2016-12-06 05:32:59', '10003', '2016-12-06 04:11:59', 'sdf27', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('766', '卢卡斯140-', 'lks140-', '1078', '2800', '2800', '10002', '2016-12-06 05:35:59', '10003', '2016-12-06 04:11:59', 'lsk28', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('767', '卖血上网145*', 'mxsw145*', '1080', '2900', '2900', '10002', '2016-12-06 05:38:59', '10003', '2016-12-06 04:11:59', '网费未付29', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('768', '迪卡150^_^', 'dk150^_^', '1082', '3000', '3000', '10002', '2016-12-06 05:41:59', '10003', '2016-12-06 04:11:59', 'sdf30', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('769', '卢卡斯155-', 'lks155-', '1084', '3100', '3100', '10002', '2016-12-06 05:44:59', '10003', '2016-12-06 04:11:59', 'lsk31', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('770', '卖血上网160*', 'mxsw160*', '1086', '3200', '3200', '10002', '2016-12-06 05:47:59', '10003', '2016-12-06 04:11:59', '网费未付32', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('771', '迪卡165^_^', 'dk165^_^', '1088', '3300', '3300', '10002', '2016-12-06 05:50:59', '10003', '2016-12-06 04:11:59', 'sdf33', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('772', '卢卡斯170-', 'lks170-', '1090', '3400', '3400', '10002', '2016-12-06 05:53:59', '10003', '2016-12-06 04:11:59', 'lsk34', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('773', '卖血上网175*', 'mxsw175*', '1092', '3500', '3500', '10002', '2016-12-06 05:56:59', '10003', '2016-12-06 04:11:59', '网费未付35', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('774', '迪卡180^_^', 'dk180^_^', '1094', '3600', '3600', '10002', '2016-12-06 06:00:00', '10003', '2016-12-06 04:12:00', 'sdf36', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('775', '卢卡斯185-', 'lks185-', '1096', '3700', '3700', '10002', '2016-12-06 06:03:00', '10001', '2016-12-07 09:36:26', 'lsk37', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('776', '卖血上网190*', 'mxsw190*', '1098', '3800', '3800', '10002', '2016-12-06 06:06:00', '10003', '2016-12-06 04:12:00', '网费未付38', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('777', '迪卡195^_^', 'dk195^_^', '1100', '3900', '3900', '10002', '2016-12-06 06:09:00', '10003', '2016-12-06 04:12:00', 'sdf39', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('778', '卢卡斯200-', 'lks200-', '1102', '4000', '4000', '10002', '2016-12-06 06:12:00', '10003', '2016-12-06 04:12:00', 'lsk40', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('779', '卖血上网205*', 'mxsw205*', '1104', '4100', '4100', '10002', '2016-12-06 06:15:00', '10003', '2016-12-06 04:12:00', '网费未付41', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('780', '迪卡210^_^', 'dk210^_^', '1106', '4200', '4200', '10002', '2016-12-06 06:18:00', '10003', '2016-12-06 04:12:00', 'sdf42', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('781', '卢卡斯215-', 'lks215-', '1108', '4300', '4300', '10002', '2016-12-06 06:21:00', '10001', '2016-12-09 09:19:30', 'lsk43', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('782', '卖血上网220*', 'mxsw220*', '1110', '4400', '4400', '10002', '2016-12-06 06:24:00', '10003', '2016-12-06 04:12:00', '网费未付44', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('783', '迪卡225^_^', 'dk225^_^', '1112', '4500', '4500', '10002', '2016-12-06 06:27:00', '10003', '2016-12-06 04:12:00', 'sdf45', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('784', '卢卡斯230-', 'lks230-', '1114', '4600', '4600', '10002', '2016-12-06 06:30:00', '10003', '2016-12-06 04:12:00', 'lsk46', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('785', '卖血上网235*', 'mxsw235*', '1116', '4700', '4700', '10002', '2016-12-06 06:33:00', '10003', '2016-12-06 04:12:00', '网费未付47', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('786', '迪卡240^_^', 'dk240^_^', '1118', '4800', '4800', '10002', '2016-12-06 06:36:00', '10003', '2016-12-06 04:12:00', 'sdf48', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('787', '卢卡斯245-', 'lks245-', '1120', '4900', '4900', '10002', '2016-12-06 06:39:00', '10001', '2016-12-10 10:23:56', 'lsk49', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('788', '卖血上网250*', 'mxsw250*', '1122', '5000', '5000', '10002', '2016-12-06 06:42:00', '10003', '2016-12-06 04:12:00', '网费未付50', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('789', '迪卡255^_^', 'dk255^_^', '1124', '5100', '5100', '10002', '2016-12-06 06:45:00', '10003', '2016-12-06 04:12:00', 'sdf51', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('790', '卢卡斯260-', 'lks260-', '1126', '5200', '5200', '10002', '2016-12-06 06:48:00', '10001', '2016-12-14 09:04:20', 'lsk52', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('791', '卖血上网265*', 'mxsw265*', '1128', '5300', '5300', '10002', '2016-12-06 06:51:00', '10001', '2016-12-11 18:21:36', '网费未付53', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('792', '迪卡270^_^', 'dk270^_^', '1130', '5400', '5400', '10002', '2016-12-06 06:54:00', '10003', '2016-12-06 04:12:00', 'sdf54', '0', '6', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('793', '卢卡斯275-', 'lks275-', '1132', '5500', '5500', '10002', '2016-12-06 06:57:01', '10001', '2016-12-11 17:57:29', '合理', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('794', '卖血上网280*', 'mxsw280*', '1134', '5600', '5600', '10002', '2016-12-06 07:00:01', '10001', '2016-12-11 17:55:29', '网费未付56', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('795', '迪卡285^_^', 'dk285^_^', '1136', '5700', '5700', '10002', '2016-12-06 07:03:01', '10001', '2016-12-09 15:42:37', 'sdf57', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('796', '卢卡斯290-', 'lks290-', '1138', '5800', '5800', '10002', '2016-12-06 07:06:01', '10001', '2016-12-11 17:55:29', 'lsk58', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('797', '卖血上网295*', 'mxsw295*', '1140', '5900', '5900', '10002', '2016-12-06 07:09:01', '10001', '2016-12-08 22:27:11', '网费未付59', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('798', '迪卡300^_^', 'dk300^_^', '1142', '6000', '6000', '10002', '2016-12-06 07:12:01', '10001', '2016-12-09 09:37:16', 'sdf60', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('799', 'Tom5-', 'tom5-', '1144', '100', '100', '10002', '2016-12-06 04:18:19', '10003', '2016-12-06 04:15:19', 'lsk1', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('800', 'jack10*', 'mxsw10*', '1146', '200', '200', '10002', '2016-12-06 04:21:19', '10003', '2016-12-06 04:15:19', 'jac2', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('801', '图灵15^_^', 'tl15^_^', '1148', '300', '300', '10002', '2016-12-06 04:24:19', '10003', '2016-12-06 04:15:19', 'tl3', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('802', 'Tom20-', 'tom20-', '1150', '400', '400', '10002', '2016-12-06 04:27:19', '10003', '2016-12-06 04:15:19', 'lsk4', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('803', 'jack25*', 'mxsw25*', '1152', '500', '500', '10002', '2016-12-06 04:30:19', '10003', '2016-12-06 04:15:19', 'jac5', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('804', '图灵30^_^', 'tl30^_^', '1154', '600', '600', '10002', '2016-12-06 04:33:19', '10003', '2016-12-06 04:15:19', 'tl6', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('805', 'Tom35-', 'tom35-', '1156', '700', '700', '10002', '2016-12-06 04:36:19', '10003', '2016-12-06 04:15:19', 'lsk7', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('806', 'jack40*', 'mxsw40*', '1158', '800', '800', '10002', '2016-12-06 04:39:19', '10003', '2016-12-06 04:15:19', 'jac8', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('807', '图灵45^_^', 'tl45^_^', '1160', '900', '900', '10002', '2016-12-06 04:42:19', '10003', '2016-12-06 04:15:19', 'tl9', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('808', 'Tom50-', 'tom50-', '1162', '1000', '1000', '10002', '2016-12-06 04:45:20', '10003', '2016-12-06 04:15:20', 'lsk10', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('809', 'jack55*', 'mxsw55*', '1164', '1100', '1100', '10002', '2016-12-06 04:48:20', '10003', '2016-12-06 04:15:20', 'jac11', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('810', '图灵60^_^', 'tl60^_^', '1166', '1200', '1200', '10002', '2016-12-06 04:51:20', '10003', '2016-12-06 04:15:20', 'tl12', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('811', 'Tom65-', 'tom65-', '1168', '1300', '1300', '10002', '2016-12-06 04:54:20', '10003', '2016-12-06 04:15:20', 'lsk13', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('812', 'jack70*', 'mxsw70*', '1170', '1400', '1400', '10002', '2016-12-06 04:57:20', '10003', '2016-12-06 04:15:20', 'jac14', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('813', '图灵75^_^', 'tl75^_^', '1172', '1500', '1500', '10002', '2016-12-06 05:00:20', '10003', '2016-12-06 04:15:20', 'tl15', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('814', 'Tom80-', 'tom80-', '1174', '1600', '1600', '10002', '2016-12-06 05:03:20', '10003', '2016-12-06 04:15:20', 'lsk16', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('815', 'jack85*', 'mxsw85*', '1176', '1700', '1700', '10002', '2016-12-06 05:06:20', '10003', '2016-12-06 04:15:20', 'jac17', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('816', '图灵90^_^', 'tl90^_^', '1178', '1800', '1800', '10002', '2016-12-06 05:09:20', '10003', '2016-12-06 04:15:20', 'tl18', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('817', 'Tom95-', 'tom95-', '1180', '1900', '1900', '10002', '2016-12-06 05:12:20', '10003', '2016-12-06 04:15:20', 'lsk19', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('818', 'jack100*', 'mxsw100*', '1182', '2000', '2000', '10002', '2016-12-06 05:15:20', '10003', '2016-12-06 04:15:20', 'jac20', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('819', '图灵105^_^', 'tl105^_^', '1184', '2100', '2100', '10002', '2016-12-06 05:18:20', '10003', '2016-12-06 04:15:20', 'tl21', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('820', 'Tom110-', 'tom110-', '1186', '2200', '2200', '10002', '2016-12-06 05:21:20', '10003', '2016-12-06 04:15:20', 'lsk22', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('821', 'jack115*', 'mxsw115*', '1188', '2300', '2300', '10002', '2016-12-06 05:24:20', '10003', '2016-12-06 04:15:20', 'jac23', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('822', '图灵120^_^', 'tl120^_^', '1190', '2400', '2400', '10002', '2016-12-06 05:27:20', '10003', '2016-12-06 04:15:20', 'tl24', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('823', 'Tom125-', 'tom125-', '1192', '2500', '2500', '10002', '2016-12-06 05:30:20', '10003', '2016-12-06 04:15:20', 'lsk25', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('824', 'jack130*', 'mxsw130*', '1194', '2600', '2600', '10002', '2016-12-06 05:33:20', '10003', '2016-12-06 04:15:20', 'jac26', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('825', '图灵135^_^', 'tl135^_^', '1196', '2700', '2700', '10002', '2016-12-06 05:36:20', '10003', '2016-12-06 04:15:20', 'tl27', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('826', 'Tom140-', 'tom140-', '1198', '2800', '2800', '10002', '2016-12-06 05:39:21', '10003', '2016-12-06 04:15:21', 'lsk28', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('827', 'jack145*', 'mxsw145*', '1200', '2900', '2900', '10002', '2016-12-06 05:42:21', '10003', '2016-12-06 04:15:21', 'jac29', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('828', '图灵150^_^', 'tl150^_^', '1202', '3000', '3000', '10002', '2016-12-06 05:45:21', '10003', '2016-12-06 04:15:21', 'tl30', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('829', 'Tom155-', 'tom155-', '1204', '3100', '3100', '10002', '2016-12-06 05:48:21', '10003', '2016-12-06 04:15:21', 'lsk31', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('830', 'jack160*', 'mxsw160*', '1206', '3200', '3200', '10002', '2016-12-06 05:51:21', '10003', '2016-12-06 04:15:21', 'jac32', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('831', '图灵165^_^', 'tl165^_^', '1208', '3300', '3300', '10002', '2016-12-06 05:54:21', '10003', '2016-12-06 04:15:21', 'tl33', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('832', 'Tom170-', 'tom170-', '1210', '3400', '3400', '10002', '2016-12-06 05:57:21', '10003', '2016-12-06 04:15:21', 'lsk34', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('833', 'jack175*', 'mxsw175*', '1212', '3500', '3500', '10002', '2016-12-06 06:00:21', '10003', '2016-12-06 04:15:21', 'jac35', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('834', '图灵180^_^', 'tl180^_^', '1214', '3600', '3600', '10002', '2016-12-06 06:03:21', '10003', '2016-12-06 04:15:21', 'tl36', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('835', 'Tom185-', 'tom185-', '1216', '3700', '3700', '10002', '2016-12-06 06:06:21', '10003', '2016-12-06 04:15:21', 'lsk37', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('836', 'jack190*', 'mxsw190*', '1218', '3800', '3800', '10002', '2016-12-06 06:09:21', '10003', '2016-12-06 04:15:21', 'jac38', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('837', '图灵195^_^', 'tl195^_^', '1220', '3900', '3900', '10002', '2016-12-06 06:12:21', '10003', '2016-12-06 04:15:21', 'tl39', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('838', 'Tom200-', 'tom200-', '1222', '4000', '4000', '10002', '2016-12-06 06:15:21', '10003', '2016-12-06 04:15:21', 'lsk40', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('839', 'jack205*', 'mxsw205*', '1224', '4100', '4100', '10002', '2016-12-06 06:18:21', '10003', '2016-12-06 04:15:21', 'jac41', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('840', '图灵210^_^', 'tl210^_^', '1226', '4200', '4200', '10002', '2016-12-06 06:21:21', '10003', '2016-12-06 04:15:21', 'tl42', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('841', 'Tom215-', 'tom215-', '1228', '4300', '4300', '10002', '2016-12-06 06:24:21', '10003', '2016-12-06 04:15:21', 'lsk43', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('842', 'jack220*', 'mxsw220*', '1230', '4400', '4400', '10002', '2016-12-06 06:27:21', '10003', '2016-12-06 04:15:21', 'jac44', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('843', '图灵225^_^', 'tl225^_^', '1232', '4500', '4500', '10002', '2016-12-06 06:30:21', '10003', '2016-12-06 04:15:21', 'tl45', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('844', 'Tom230-', 'tom230-', '1234', '4600', '4600', '10002', '2016-12-06 06:33:21', '10003', '2016-12-06 04:15:21', 'lsk46', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('845', 'jack235*', 'mxsw235*', '1236', '4700', '4700', '10002', '2016-12-06 06:36:21', '10003', '2016-12-06 04:15:21', 'jac47', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('846', '图灵240^_^', 'tl240^_^', '1238', '4800', '4800', '10002', '2016-12-06 06:39:22', '10003', '2016-12-06 04:15:22', 'tl48', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('847', 'Tom245-', 'tom245-', '1240', '4900', '4900', '10002', '2016-12-06 06:42:22', '10003', '2016-12-06 04:15:22', 'lsk49', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('848', 'jack250*', 'mxsw250*', '1242', '5000', '5000', '10002', '2016-12-06 06:45:22', '10003', '2016-12-06 04:15:22', 'jac50', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('849', '图灵255^_^', 'tl255^_^', '1244', '5100', '5100', '10002', '2016-12-06 06:48:22', '10003', '2016-12-06 04:15:22', 'tl51', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('850', 'Tom260-', 'tom260-', '1246', '5200', '5200', '10002', '2016-12-06 06:51:22', '10003', '2016-12-06 04:15:22', 'lsk52', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('851', 'jack265*', 'mxsw265*', '1248', '5300', '5300', '10002', '2016-12-06 06:54:22', '10003', '2016-12-06 04:15:22', 'jac53', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('852', '图灵270^_^', 'tl270^_^', '1250', '5400', '5400', '10002', '2016-12-06 06:57:22', '10003', '2016-12-06 04:15:22', 'tl54', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('853', 'Tom275-', 'tom275-', '1252', '5500', '5500', '10002', '2016-12-06 07:00:22', '10003', '2016-12-06 04:15:22', 'lsk55', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('854', 'jack280*', 'mxsw280*', '1254', '5600', '5600', '10002', '2016-12-06 07:03:22', '10003', '2016-12-06 04:15:22', 'jac56', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('855', '图灵285^_^', 'tl285^_^', '1256', '5700', '5700', '10002', '2016-12-06 07:06:22', '10003', '2016-12-06 04:15:22', 'tl57', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('856', 'Tom290-', 'tom290-', '1258', '5800', '5800', '10002', '2016-12-06 07:09:22', '10003', '2016-12-06 04:15:22', 'lsk58', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('857', 'jack295*', 'mxsw295*', '1260', '5900', '5900', '10002', '2016-12-06 07:12:22', '10003', '2016-12-06 04:15:22', 'jac59', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('858', '图灵300^_^', 'tl300^_^', '1262', '6000', '6000', '10002', '2016-12-06 07:15:22', '10003', '2016-12-06 04:15:22', 'tl60', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('859', '古月哥欠5-', 'huge5-', '1264', '100', '100', '10001', '2016-12-06 04:28:38', '10002', '2016-12-06 04:25:38', 'huge1', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('860', '周小伦10*', 'zxl10*', '1266', '200', '200', '10001', '2016-12-06 04:31:39', '10002', '2016-12-06 04:25:39', 'zxl2', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('861', '贾斯汀15', '比伯15', '1268', '300', '300', '10001', '2016-12-06 04:34:39', '10002', '2016-12-06 04:25:39', 'bibo3', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('862', '林杰杰20#', 'ljj20#', '1270', '400', '400', '10001', '2016-12-06 04:37:39', '10002', '2016-12-06 04:25:39', 'ljj4', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('863', '阿甘25', 'agan25', '1272', '500', '500', '10001', '2016-12-06 04:40:39', '10002', '2016-12-06 04:25:39', 'ag5', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('864', '正传30^_^', 'zz30^_^', '1274', '600', '600', '10001', '2016-12-06 04:43:39', '10002', '2016-12-06 04:25:39', 'zz6', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('865', '古月哥欠35-', 'huge35-', '1276', '700', '700', '10001', '2016-12-06 04:46:39', '10002', '2016-12-06 04:25:39', 'huge7', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('866', '周小伦40*', 'zxl40*', '1278', '800', '800', '10001', '2016-12-06 04:49:39', '10002', '2016-12-06 04:25:39', 'zxl8', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('867', '贾斯汀45', '比伯45', '1280', '900', '900', '10001', '2016-12-06 04:52:39', '10002', '2016-12-06 04:25:39', 'bibo9', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('868', '林杰杰50#', 'ljj50#', '1282', '1000', '1000', '10001', '2016-12-06 04:55:39', '10002', '2016-12-06 04:25:39', 'ljj10', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('869', '阿甘55', 'agan55', '1284', '1100', '1100', '10001', '2016-12-06 04:58:39', '10002', '2016-12-06 04:25:39', 'ag11', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('870', '正传60^_^', 'zz60^_^', '1286', '1200', '1200', '10001', '2016-12-06 05:01:39', '10002', '2016-12-06 04:25:39', 'zz12', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('871', '古月哥欠65-', 'huge65-', '1288', '1300', '1300', '10001', '2016-12-06 05:04:39', '10002', '2016-12-06 04:25:39', 'huge13', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('872', '周小伦70*', 'zxl70*', '1290', '1400', '1400', '10001', '2016-12-06 05:07:39', '10002', '2016-12-06 04:25:39', 'zxl14', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('873', '贾斯汀75', '比伯75', '1292', '1500', '1500', '10001', '2016-12-06 05:10:39', '10002', '2016-12-06 04:25:39', 'bibo15', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('874', '林杰杰80#', 'ljj80#', '1294', '1600', '1600', '10001', '2016-12-06 05:13:39', '10002', '2016-12-06 04:25:39', 'ljj16', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('875', '阿甘85', 'agan85', '1296', '1700', '1700', '10001', '2016-12-06 05:16:39', '10002', '2016-12-06 04:25:39', 'ag17', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('876', '正传90^_^', 'zz90^_^', '1298', '1800', '1800', '10001', '2016-12-06 05:19:39', '10002', '2016-12-06 04:25:39', 'zz18', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('877', '古月哥欠95-', 'huge95-', '1300', '1900', '1900', '10001', '2016-12-06 05:22:39', '10002', '2016-12-06 04:25:39', 'huge19', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('878', '周小伦100*', 'zxl100*', '1302', '2000', '2000', '10001', '2016-12-06 05:25:40', '10002', '2016-12-06 04:25:40', 'zxl20', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('879', '贾斯汀105', '比伯105', '1304', '2100', '2100', '10001', '2016-12-06 05:28:40', '10002', '2016-12-06 04:25:40', 'bibo21', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('880', '林杰杰110#', 'ljj110#', '1306', '2200', '2200', '10001', '2016-12-06 05:31:40', '10002', '2016-12-06 04:25:40', 'ljj22', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('881', '阿甘115', 'agan115', '1308', '2300', '2300', '10001', '2016-12-06 05:34:40', '10002', '2016-12-06 04:25:40', 'ag23', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('882', '正传120^_^', 'zz120^_^', '1310', '2400', '2400', '10001', '2016-12-06 05:37:40', '10002', '2016-12-06 04:25:40', 'zz24', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('883', '古月哥欠125-', 'huge125-', '1312', '2500', '2500', '10001', '2016-12-06 05:40:40', '10002', '2016-12-06 04:25:40', 'huge25', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('884', '周小伦130*', 'zxl130*', '1314', '2600', '2600', '10001', '2016-12-06 05:43:40', '10002', '2016-12-06 04:25:40', 'zxl26', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('885', '贾斯汀135', '比伯135', '1316', '2700', '2700', '10001', '2016-12-06 05:46:40', '10002', '2016-12-06 04:25:40', 'bibo27', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('886', '林杰杰140#', 'ljj140#', '1318', '2800', '2800', '10001', '2016-12-06 05:49:40', '10002', '2016-12-06 04:25:40', 'ljj28', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('887', '阿甘145', 'agan145', '1320', '2900', '2900', '10001', '2016-12-06 05:52:40', '10002', '2016-12-06 04:25:40', 'ag29', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('888', '正传150^_^', 'zz150^_^', '1322', '3000', '3000', '10001', '2016-12-06 05:55:40', '10002', '2016-12-06 04:25:40', 'zz30', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('889', '古月哥欠155-', 'huge155-', '1324', '3100', '3100', '10001', '2016-12-06 05:58:40', '10002', '2016-12-06 04:25:40', 'huge31', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('890', '周小伦160*', 'zxl160*', '1326', '3200', '3200', '10001', '2016-12-06 06:01:40', '10002', '2016-12-06 04:25:40', 'zxl32', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('891', '贾斯汀165', '比伯165', '1328', '3300', '3300', '10001', '2016-12-06 06:04:40', '10002', '2016-12-06 04:25:40', 'bibo33', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('892', '林杰杰170#', 'ljj170#', '1330', '3400', '3400', '10001', '2016-12-06 06:07:40', '10002', '2016-12-06 04:25:40', 'ljj34', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('893', '阿甘175', 'agan175', '1332', '3500', '3500', '10001', '2016-12-06 06:10:40', '10002', '2016-12-06 04:25:40', 'ag35', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('894', '正传180^_^', 'zz180^_^', '1334', '3600', '3600', '10001', '2016-12-06 06:13:40', '10002', '2016-12-06 04:25:40', 'zz36', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('895', '古月哥欠185-', 'huge185-', '1336', '3700', '3700', '10001', '2016-12-06 06:16:40', '10002', '2016-12-06 04:25:40', 'huge37', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('896', '周小伦190*', 'zxl190*', '1338', '3800', '3800', '10001', '2016-12-06 06:19:40', '10002', '2016-12-06 04:25:40', 'zxl38', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('897', '贾斯汀195', '比伯195', '1340', '3900', '3900', '10001', '2016-12-06 06:22:40', '10002', '2016-12-06 04:25:40', 'bibo39', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('898', '林杰杰200#', 'ljj200#', '1342', '4000', '4000', '10001', '2016-12-06 06:25:41', '10002', '2016-12-06 04:25:41', 'ljj40', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('899', '阿甘205', 'agan205', '1344', '4100', '4100', '10001', '2016-12-06 06:28:41', '10002', '2016-12-06 04:25:41', 'ag41', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('900', '正传210^_^', 'zz210^_^', '1346', '4200', '4200', '10001', '2016-12-06 06:31:41', '10002', '2016-12-06 04:25:41', 'zz42', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('901', '古月哥欠215-', 'huge215-', '1348', '4300', '4300', '10001', '2016-12-06 06:34:41', '10002', '2016-12-06 04:25:41', 'huge43', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('902', '周小伦220*', 'zxl220*', '1350', '4400', '4400', '10001', '2016-12-06 06:37:41', '10002', '2016-12-06 04:25:41', 'zxl44', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('903', '贾斯汀225', '比伯225', '1352', '4500', '4500', '10001', '2016-12-06 06:40:41', '10002', '2016-12-06 04:25:41', 'bibo45', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('904', '林杰杰230#', 'ljj230#', '1354', '4600', '4600', '10001', '2016-12-06 06:43:41', '10002', '2016-12-06 04:25:41', 'ljj46', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('905', '阿甘235', 'agan235', '1356', '4700', '4700', '10001', '2016-12-06 06:46:41', '10002', '2016-12-06 04:25:41', 'ag47', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('906', '正传240^_^', 'zz240^_^', '1358', '4800', '4800', '10001', '2016-12-06 06:49:41', '10002', '2016-12-06 04:25:41', 'zz48', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('907', '古月哥欠245-', 'huge245-', '1360', '4900', '4900', '10001', '2016-12-06 06:52:41', '10001', '2016-12-10 10:21:14', 'huge49', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('908', '周小伦250*', 'zxl250*', '1362', '5000', '5000', '10001', '2016-12-06 06:55:41', '10001', '2016-12-11 18:20:43', 'zxl50', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('909', '贾斯汀255', '比伯255', '1364', '5100', '5100', '10001', '2016-12-06 06:58:41', '10001', '2016-12-11 17:55:29', 'bibo51', '1', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('910', '林杰杰260#', 'ljj260#', '1366', '5200', '5200', '10001', '2016-12-06 07:01:41', '10001', '2016-12-11 17:55:29', 'ljj52', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('911', '阿甘265', 'agan265', '1368', '5300', '5300', '10001', '2016-12-06 07:04:41', '10001', '2016-12-09 15:34:07', 'ag53', '1', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('912', '正传270^_^', 'zz270^_^', '1370', '5400', '5400', '10001', '2016-12-06 07:07:41', '10001', '2016-12-08 22:18:30', 'zz54', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('913', '古月哥欠275-', 'huge275-', '1372', '5500', '5500', '10001', '2016-12-06 07:10:41', '10001', '2016-12-08 22:16:16', 'huge55', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('914', '周小伦280*', 'zxl280*', '1374', '5600', '5600', '10001', '2016-12-06 07:13:41', '10001', '2016-12-08 22:16:38', 'zxl56', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('915', '贾斯汀285', '比伯285', '1376', '5700', '5700', '10001', '2016-12-06 07:16:41', '10001', '2016-12-09 15:31:58', 'bibo57', '1', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('916', '林杰杰290#', 'ljj290#', '1378', '5800', '5800', '10001', '2016-12-06 07:19:41', '10001', '2016-12-07 09:49:33', 'ljj58', '1', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('917', '阿甘295', 'agan295', '1380', '5900', '5900', '10001', '2016-12-06 07:22:41', '10001', '2016-12-08 21:44:25', 'ag59', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('918', '正传300^_^', 'zz300^_^', '1382', '6000', '6000', '10001', '2016-12-06 07:25:42', '10001', '2016-12-09 15:34:22', 'zz60', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('919', '古月哥欠10-', 'huge10-', '1384', '100', '100', '10001', '2016-12-06 04:37:43', '10002', '2016-12-06 04:34:43', 'huge1', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('920', '周小伦20*', 'zxl20*', '1386', '200', '200', '10001', '2016-12-06 04:40:43', '10002', '2016-12-06 04:34:43', 'zxl2', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('921', '贾斯汀30', '比伯30', '1388', '300', '300', '10001', '2016-12-06 04:43:43', '10002', '2016-12-06 04:34:43', 'bibo3', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('922', '林杰杰40#', 'ljj40#', '1390', '400', '400', '10001', '2016-12-06 04:46:43', '10002', '2016-12-06 04:34:43', 'ljj4', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('923', '阿甘50', 'agan50', '1392', '500', '500', '10001', '2016-12-06 04:49:43', '10002', '2016-12-06 04:34:43', 'ag5', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('924', '正传60^_^', 'zz60^_^', '1394', '600', '600', '10001', '2016-12-06 04:52:44', '10002', '2016-12-06 04:34:44', 'zz6', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('925', '古月哥欠70-', 'huge70-', '1396', '700', '700', '10001', '2016-12-06 04:55:44', '10002', '2016-12-06 04:34:44', 'huge7', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('926', '周小伦80*', 'zxl80*', '1398', '800', '800', '10001', '2016-12-06 04:58:44', '10002', '2016-12-06 04:34:44', 'zxl8', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('927', '贾斯汀90', '比伯90', '1400', '900', '900', '10001', '2016-12-06 05:01:44', '10002', '2016-12-06 04:34:44', 'bibo9', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('928', '林杰杰100#', 'ljj100#', '1402', '1000', '1000', '10001', '2016-12-06 05:04:44', '10002', '2016-12-06 04:34:44', 'ljj10', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('929', '阿甘110', 'agan110', '1404', '1100', '1100', '10001', '2016-12-06 05:07:44', '10002', '2016-12-06 04:34:44', 'ag11', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('930', '正传120^_^', 'zz120^_^', '1406', '1200', '1200', '10001', '2016-12-06 05:10:44', '10002', '2016-12-06 04:34:44', 'zz12', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('931', '古月哥欠130-', 'huge130-', '1408', '1300', '1300', '10001', '2016-12-06 05:13:44', '10002', '2016-12-06 04:34:44', 'huge13', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('932', '周小伦140*', 'zxl140*', '1410', '1400', '1400', '10001', '2016-12-06 05:16:44', '10002', '2016-12-06 04:34:44', 'zxl14', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('933', '贾斯汀150', '比伯150', '1412', '1500', '1500', '10001', '2016-12-06 05:19:44', '10002', '2016-12-06 04:34:44', 'bibo15', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('934', '林杰杰160#', 'ljj160#', '1414', '1600', '1600', '10001', '2016-12-06 05:22:44', '10002', '2016-12-06 04:34:44', 'ljj16', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('935', '阿甘170', 'agan170', '1416', '1700', '1700', '10001', '2016-12-06 05:25:44', '10002', '2016-12-06 04:34:44', 'ag17', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('936', '正传180^_^', 'zz180^_^', '1418', '1800', '1800', '10001', '2016-12-06 05:28:44', '10002', '2016-12-06 04:34:44', 'zz18', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('937', '古月哥欠190-', 'huge190-', '1420', '1900', '1900', '10001', '2016-12-06 05:31:44', '10002', '2016-12-06 04:34:44', 'huge19', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('938', '周小伦200*', 'zxl200*', '1422', '2000', '2000', '10001', '2016-12-06 05:34:44', '10002', '2016-12-06 04:34:44', 'zxl20', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('939', '贾斯汀210', '比伯210', '1424', '2100', '2100', '10001', '2016-12-06 05:37:44', '10002', '2016-12-06 04:34:44', 'bibo21', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('940', '林杰杰220#', 'ljj220#', '1426', '2200', '2200', '10001', '2016-12-06 05:40:44', '10002', '2016-12-06 04:34:44', 'ljj22', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('941', '阿甘230', 'agan230', '1428', '2300', '2300', '10001', '2016-12-06 05:43:44', '10002', '2016-12-06 04:34:44', 'ag23', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('942', '正传240^_^', 'zz240^_^', '1430', '2400', '2400', '10001', '2016-12-06 05:46:44', '10002', '2016-12-06 04:34:44', 'zz24', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('943', '古月哥欠250-', 'huge250-', '1432', '2500', '2500', '10001', '2016-12-06 05:49:44', '10002', '2016-12-06 04:34:44', 'huge25', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('944', '周小伦260*', 'zxl260*', '1434', '2600', '2600', '10001', '2016-12-06 05:52:45', '10002', '2016-12-06 04:34:45', 'zxl26', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('945', '贾斯汀270', '比伯270', '1436', '2700', '2700', '10001', '2016-12-06 05:55:45', '10002', '2016-12-06 04:34:45', 'bibo27', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('946', '林杰杰280#', 'ljj280#', '1438', '2800', '2800', '10001', '2016-12-06 05:58:45', '10002', '2016-12-06 04:34:45', 'ljj28', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('947', '阿甘290', 'agan290', '1440', '2900', '2900', '10001', '2016-12-06 06:01:45', '10002', '2016-12-06 04:34:45', 'ag29', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('948', '正传300^_^', 'zz300^_^', '1442', '3000', '3000', '10001', '2016-12-06 06:04:45', '10002', '2016-12-06 04:34:45', 'zz30', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('949', '古月哥欠310-', 'huge310-', '1444', '3100', '3100', '10001', '2016-12-06 06:07:45', '10002', '2016-12-06 04:34:45', 'huge31', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('950', '周小伦320*', 'zxl320*', '1446', '3200', '3200', '10001', '2016-12-06 06:10:45', '10002', '2016-12-06 04:34:45', 'zxl32', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('951', '贾斯汀330', '比伯330', '1448', '3300', '3300', '10001', '2016-12-06 06:13:45', '10002', '2016-12-06 04:34:45', 'bibo33', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('952', '林杰杰340#', 'ljj340#', '1450', '3400', '3400', '10001', '2016-12-06 06:16:45', '10002', '2016-12-06 04:34:45', 'ljj34', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('953', '阿甘350', 'agan350', '1452', '3500', '3500', '10001', '2016-12-06 06:19:45', '10002', '2016-12-06 04:34:45', 'ag35', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('954', '正传360^_^', 'zz360^_^', '1454', '3600', '3600', '10001', '2016-12-06 06:22:45', '10002', '2016-12-06 04:34:45', 'zz36', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('955', '古月哥欠370-', 'huge370-', '1456', '3700', '3700', '10001', '2016-12-06 06:25:45', '10002', '2016-12-06 04:34:45', 'huge37', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('956', '周小伦380*', 'zxl380*', '1458', '3800', '3800', '10001', '2016-12-06 06:28:45', '10002', '2016-12-06 04:34:45', 'zxl38', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('957', '贾斯汀390', '比伯390', '1460', '3900', '3900', '10001', '2016-12-06 06:31:45', '10002', '2016-12-06 04:34:45', 'bibo39', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('958', '林杰杰400#', 'ljj400#', '1462', '4000', '4000', '10001', '2016-12-06 06:34:45', '10002', '2016-12-06 04:34:45', 'ljj40', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('959', '阿甘410', 'agan410', '1464', '4100', '4100', '10001', '2016-12-06 06:37:45', '10002', '2016-12-06 04:34:45', 'ag41', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('960', '正传420^_^', 'zz420^_^', '1466', '4200', '4200', '10001', '2016-12-06 06:40:45', '10002', '2016-12-06 04:34:45', 'zz42', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('961', '古月哥欠430-', 'huge430-', '1468', '4300', '4300', '10001', '2016-12-06 06:43:45', '10002', '2016-12-06 04:34:45', 'huge43', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('962', '周小伦440*', 'zxl440*', '1470', '4400', '4400', '10001', '2016-12-06 06:46:46', '10002', '2016-12-06 04:34:46', 'zxl44', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('963', '贾斯汀450', '比伯450', '1472', '4500', '4500', '10001', '2016-12-06 06:49:46', '10002', '2016-12-06 04:34:46', 'bibo45', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('964', '林杰杰460#', 'ljj460#', '1474', '4600', '4600', '10001', '2016-12-06 06:52:46', '10002', '2016-12-06 04:34:46', 'ljj46', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('965', '阿甘470', 'agan470', '1476', '4700', '4700', '10001', '2016-12-06 06:55:46', '10002', '2016-12-06 04:34:46', 'ag47', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('966', '正传480^_^', 'zz480^_^', '1478', '4800', '4800', '10001', '2016-12-06 06:58:46', '10002', '2016-12-06 04:34:46', 'zz48', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('967', '古月哥欠490-', 'huge490-', '1480', '4900', '4900', '10001', '2016-12-06 07:01:46', '10002', '2016-12-06 04:34:46', 'huge49', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('968', '周小伦500*', 'zxl500*', '1482', '5000', '5000', '10001', '2016-12-06 07:04:46', '10002', '2016-12-06 04:34:46', 'zxl50', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('969', '贾斯汀510', '比伯510', '1484', '5100', '5100', '10001', '2016-12-06 07:07:46', '10002', '2016-12-06 04:34:46', 'bibo51', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('970', '林杰杰520#', 'ljj520#', '1486', '5200', '5200', '10001', '2016-12-06 07:10:46', '10002', '2016-12-06 04:34:46', 'ljj52', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('971', '阿甘530', 'agan530', '1488', '5300', '5300', '10001', '2016-12-06 07:13:46', '10002', '2016-12-06 04:34:46', 'ag53', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('972', '正传540^_^', 'zz540^_^', '1490', '5400', '5400', '10001', '2016-12-06 07:16:46', '10002', '2016-12-06 04:34:46', 'zz54', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('973', '古月哥欠550-', 'huge550-', '1492', '5500', '5500', '10001', '2016-12-06 07:19:46', '10002', '2016-12-06 04:34:46', 'huge55', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('974', '周小伦560*', 'zxl560*', '1494', '5600', '5600', '10001', '2016-12-06 07:22:46', '10002', '2016-12-06 04:34:46', 'zxl56', '2', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('975', '贾斯汀570', '比伯570', '1496', '5700', '5700', '10001', '2016-12-06 07:25:46', '10002', '2016-12-06 04:34:46', 'bibo57', '2', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('976', '林杰杰580#', 'ljj580#', '1498', '5800', '5800', '10001', '2016-12-06 07:28:46', '10002', '2016-12-06 04:34:46', 'ljj58', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('977', '阿甘590', 'agan590', '1500', '5900', '5900', '10001', '2016-12-06 07:31:46', '10002', '2016-12-06 04:34:46', 'ag59', '2', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('978', '正传600^_^', 'zz600^_^', '1502', '6000', '6000', '10001', '2016-12-06 07:34:46', '10002', '2016-12-06 04:34:46', 'zz60', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('979', '古月哥欠10-', 'huge10-', '1504', '100', '100', '10003', '2016-12-06 04:39:58', '10001', '2016-12-06 04:36:58', 'huge1', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('980', '周小伦20*', 'zxl20*', '1506', '200', '200', '10003', '2016-12-06 04:42:59', '10001', '2016-12-06 04:36:59', 'zxl2', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('981', '贾斯汀30', '比伯30', '1508', '300', '300', '10003', '2016-12-06 04:45:59', '10001', '2016-12-06 04:36:59', 'bibo3', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('982', '林杰杰40#', 'ljj40#', '1510', '400', '400', '10003', '2016-12-06 04:48:59', '10001', '2016-12-06 04:36:59', 'ljj4', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('983', '阿甘50', 'agan50', '1512', '500', '500', '10003', '2016-12-06 04:51:59', '10001', '2016-12-06 04:36:59', 'ag5', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('984', '正传60^_^', 'zz60^_^', '1514', '600', '600', '10003', '2016-12-06 04:54:59', '10001', '2016-12-06 04:36:59', 'zz6', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('985', '古月哥欠70-', 'huge70-', '1516', '700', '700', '10003', '2016-12-06 04:57:59', '10001', '2016-12-06 04:36:59', 'huge7', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('986', '周小伦80*', 'zxl80*', '1518', '800', '800', '10003', '2016-12-06 05:00:59', '10001', '2016-12-06 04:36:59', 'zxl8', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('987', '贾斯汀90', '比伯90', '1520', '900', '900', '10003', '2016-12-06 05:03:59', '10001', '2016-12-06 04:36:59', 'bibo9', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('988', '林杰杰100#', 'ljj100#', '1522', '1000', '1000', '10003', '2016-12-06 05:06:59', '10001', '2016-12-06 04:36:59', 'ljj10', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('989', '阿甘110', 'agan110', '1524', '1100', '1100', '10003', '2016-12-06 05:09:59', '10001', '2016-12-06 04:36:59', 'ag11', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('990', '正传120^_^', 'zz120^_^', '1526', '1200', '1200', '10003', '2016-12-06 05:12:59', '10001', '2016-12-06 04:36:59', 'zz12', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('991', '古月哥欠130-', 'huge130-', '1528', '1300', '1300', '10003', '2016-12-06 05:15:59', '10001', '2016-12-06 04:36:59', 'huge13', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('992', '周小伦140*', 'zxl140*', '1530', '1400', '1400', '10003', '2016-12-06 05:18:59', '10001', '2016-12-06 04:36:59', 'zxl14', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('993', '贾斯汀150', '比伯150', '1532', '1500', '1500', '10003', '2016-12-06 05:21:59', '10001', '2016-12-06 04:36:59', 'bibo15', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('994', '林杰杰160#', 'ljj160#', '1534', '1600', '1600', '10003', '2016-12-06 05:24:59', '10001', '2016-12-06 04:36:59', 'ljj16', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('995', '阿甘170', 'agan170', '1536', '1700', '1700', '10003', '2016-12-06 05:27:59', '10001', '2016-12-06 04:36:59', 'ag17', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('996', '正传180^_^', 'zz180^_^', '1538', '1800', '1800', '10003', '2016-12-06 05:30:59', '10001', '2016-12-06 04:36:59', 'zz18', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('997', '古月哥欠190-', 'huge190-', '1540', '1900', '1900', '10003', '2016-12-06 05:33:59', '10001', '2016-12-06 04:36:59', 'huge19', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('998', '周小伦200*', 'zxl200*', '1542', '2000', '2000', '10003', '2016-12-06 05:37:00', '10001', '2016-12-06 04:37:00', 'zxl20', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('999', '贾斯汀210', '比伯210', '1544', '2100', '2100', '10003', '2016-12-06 05:40:00', '10001', '2016-12-06 04:37:00', 'bibo21', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1000', '林杰杰220#', 'ljj220#', '1546', '2200', '2200', '10003', '2016-12-06 05:43:00', '10001', '2016-12-06 04:37:00', 'ljj22', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1001', '阿甘230', 'agan230', '1548', '2300', '2300', '10003', '2016-12-06 05:46:00', '10001', '2016-12-06 04:37:00', 'ag23', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1002', '正传240^_^', 'zz240^_^', '1550', '2400', '2400', '10003', '2016-12-06 05:49:00', '10001', '2016-12-06 04:37:00', 'zz24', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1003', '古月哥欠250-', 'huge250-', '1552', '2500', '2500', '10003', '2016-12-06 05:52:00', '10001', '2016-12-06 04:37:00', 'huge25', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1004', '周小伦260*', 'zxl260*', '1554', '2600', '2600', '10003', '2016-12-06 05:55:00', '10001', '2016-12-06 04:37:00', 'zxl26', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1005', '贾斯汀270', '比伯270', '1556', '2700', '2700', '10003', '2016-12-06 05:58:00', '10001', '2016-12-06 04:37:00', 'bibo27', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1006', '林杰杰280#', 'ljj280#', '1558', '2800', '2800', '10003', '2016-12-06 06:01:00', '10001', '2016-12-06 04:37:00', 'ljj28', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1007', '阿甘290', 'agan290', '1560', '2900', '2900', '10003', '2016-12-06 06:04:00', '10001', '2016-12-06 04:37:00', 'ag29', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1008', '正传300^_^', 'zz300^_^', '1562', '3000', '3000', '10003', '2016-12-06 06:07:00', '10001', '2016-12-06 04:37:00', 'zz30', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1009', '古月哥欠310-', 'huge310-', '1564', '3100', '3100', '10003', '2016-12-06 06:10:00', '10001', '2016-12-06 04:37:00', 'huge31', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1010', '周小伦320*', 'zxl320*', '1566', '3200', '3200', '10003', '2016-12-06 06:13:00', '10001', '2016-12-06 04:37:00', 'zxl32', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1011', '贾斯汀330', '比伯330', '1568', '3300', '3300', '10003', '2016-12-06 06:16:00', '10001', '2016-12-06 04:37:00', 'bibo33', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1012', '林杰杰340#', 'ljj340#', '1570', '3400', '3400', '10003', '2016-12-06 06:19:00', '10001', '2016-12-06 04:37:00', 'ljj34', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1013', '阿甘350', 'agan350', '1572', '3500', '3500', '10003', '2016-12-06 06:22:00', '10001', '2016-12-06 04:37:00', 'ag35', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1014', '正传360^_^', 'zz360^_^', '1574', '3600', '3600', '10003', '2016-12-06 06:25:00', '10001', '2016-12-06 04:37:00', 'zz36', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1015', '古月哥欠370-', 'huge370-', '1576', '3700', '3700', '10003', '2016-12-06 06:28:00', '10001', '2016-12-06 04:37:00', 'huge37', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1016', '周小伦380*', 'zxl380*', '1578', '3800', '3800', '10003', '2016-12-06 06:31:01', '10001', '2016-12-06 04:37:01', 'zxl38', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1017', '贾斯汀390', '比伯390', '1580', '3900', '3900', '10003', '2016-12-06 06:34:01', '10001', '2016-12-06 04:37:01', 'bibo39', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1018', '林杰杰400#', 'ljj400#', '1582', '4000', '4000', '10003', '2016-12-06 06:37:01', '10001', '2016-12-06 04:37:01', 'ljj40', '0', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1019', '阿甘410', 'agan410', '1584', '4100', '4100', '10003', '2016-12-06 06:40:01', '10001', '2016-12-06 04:37:01', 'ag41', '0', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1020', '正传420^_^', 'zz420^_^', '1586', '4200', '4200', '10003', '2016-12-06 06:43:01', '10001', '2016-12-06 04:37:01', 'zz42', '0', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1021', '古月哥欠430-', 'huge430-', '1588', '4300', '4300', '10003', '2016-12-06 06:46:01', '10001', '2016-12-06 04:37:01', 'huge43', '0', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1022', '周小伦440*', 'zxl440*', '1590', '4400', '4400', '10003', '2016-12-06 06:49:01', '10001', '2016-12-06 04:37:01', 'zxl44', '0', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1023', '贾斯汀450', '比伯450', '1592', '4500', '4500', '10003', '2016-12-06 06:52:01', '10001', '2016-12-06 04:37:01', 'bibo45', '0', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1024', '林杰杰460#', 'ljj460#', '1594', '4600', '4600', '10003', '2016-12-06 06:55:01', '10001', '2016-12-11 18:21:47', 'ljj46', '1', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1025', '阿甘470', 'agan470', '1596', '4700', '4700', '10003', '2016-12-06 06:58:01', '10001', '2016-12-11 17:57:29', 'ag47', '1', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1026', '正传480^_^', 'zz480^_^', '1598', '4800', '4800', '10003', '2016-12-06 07:01:01', '10001', '2016-12-11 20:03:24', 'zz48', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1027', '古月哥欠490-', 'huge490-', '1600', '4900', '4900', '10003', '2016-12-06 07:04:01', '10001', '2016-12-09 15:37:43', 'huge49', '2', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1028', '笑傲江湖', '笑傲江湖', '1602', '5000', '5000', '10003', '2016-12-06 07:07:01', '10001', '2016-12-08 22:36:02', 'zxl50', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1029', '贾斯汀510', '比伯510', '1604', '5100', '5100', '10003', '2016-12-06 07:10:01', '10001', '2016-12-09 15:35:14', 'bibo51', '1', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1030', '林杰杰520#', 'ljj520#', '1606', '5200', '5200', '10003', '2016-12-06 07:13:01', '10001', '2016-12-09 09:37:12', 'ljj52', '1', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1031', '阿甘530', 'agan530', '1608', '5300', '5300', '10003', '2016-12-06 07:16:01', '10001', '2016-12-08 22:17:32', 'ag53', '1', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1032', '正传540^_^', 'zz540^_^', '1610', '5400', '5400', '10003', '2016-12-06 07:19:01', '10001', '2016-12-07 09:11:33', 'zz54', '2', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1033', '古月哥欠550-', 'huge550-', '1612', '5500', '5500', '10003', '2016-12-06 07:22:01', '10001', '2016-12-08 15:05:20', 'huge55', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('1034', '周小伦560*', 'zxl560*', '1614', '5600', '5600', '10003', '2016-12-06 07:25:01', '10001', '2016-12-07 09:11:26', 'zxl56', '1', '7', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1035', '贾斯汀570', '比伯570', '1616', '5700', '5700', '10003', '2016-12-06 07:28:02', '10001', '2016-12-07 17:59:28', 'bibo57', '1', '2', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('1036', '林杰杰580#', 'ljj580#', '1618', '5800', '5800', '10003', '2016-12-06 07:31:02', '10001', '2016-12-07 14:24:45', 'ljj58', '2', '3', '219');
INSERT INTO `caiwu_shoukuan` VALUES ('1037', '阿甘590', 'agan590', '1620', '5900', '5900', '10003', '2016-12-06 07:34:02', '10001', '2016-12-07 12:28:29', 'ag59', '1', '4', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('1038', '正传600^_^', 'zz600^_^', '1622', '6000', '6000', '10003', '2016-12-06 07:37:02', '10001', '2016-12-06 18:21:50', 'zz60', '1', '6', '229');
INSERT INTO `caiwu_shoukuan` VALUES ('1039', 'Gigi', '吉吉', '', '1234', '1234', '10001', '2016-12-07 20:30:42', '10001', '2016-12-09 09:29:40', '', '1', '14', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('1040', 'Gigi', '吉吉', '', '1234', '1234', '10001', '2016-12-07 20:32:13', '10001', '2016-12-08 19:47:01', 'sdfsd', '1', '14', '264');
INSERT INTO `caiwu_shoukuan` VALUES ('1041', 'Gigi', '吉吉', '1234', '1234', '1234', '10001', '2016-12-07 20:35:41', '10001', '2016-12-08 09:56:20', '', '1', '14', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10005', '1027', '1027', 'OD201612072237001', null, '1327', '10001', '2016-12-07 22:37:47', '10001', '2016-12-07 22:37:47', '喜欢和你在一起', '1', '1', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10006', '1027', '1027', 'OD201612072237001', null, '1327', '10001', '2016-12-07 22:37:47', '10001', '2016-12-07 22:37:47', '喜欢和你在一起', '1', '1', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10009', '士大夫', 'jack', '101', '10', '10', '10001', '2016-12-08 10:42:00', '10001', '2016-12-08 15:05:05', '', '1', '10', '288');
INSERT INTO `caiwu_shoukuan` VALUES ('10010', 'niit', 'niit', '135656', '2', '2', '10001', '2016-12-08 11:03:45', '10001', '2016-12-09 09:29:48', '', '2', '2', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10011', 'niit', 'niit', '12345', '2', '123', '10001', '2016-12-08 11:04:03', '10001', '2016-12-11 17:55:29', '', '1', '2', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10012', 'niit', 'niit', '13562', '2', '2', '10001', '2016-12-08 11:04:05', '10001', '2016-12-08 20:27:37', '', '1', '2', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10013', 'niit', 'niit', '13564', '2', '2', '10001', '2016-12-08 11:04:06', '10001', '2016-12-08 21:44:14', '', '1', '2', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10014', '1026', '1026', 'OD201612081117001', null, '400', '10001', '2016-12-08 11:16:55', '10001', '2016-12-08 11:16:55', '我是你的好人', '1', '1', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10019', '笑傲江湖', '笑傲江湖', 'OD201612081550001', null, '1327', '10001', '2016-12-08 15:50:19', '10001', '2016-12-08 15:50:19', '从你的世界路过', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10020', '笑傲江湖', '笑傲江湖', 'OD201612082105001', null, '50', '10001', '2016-12-08 21:04:55', '10001', '2016-12-08 21:04:55', '爱我你就抱抱我', '1', '1', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10021', 'asd', 'asd', '12', '12', '12', '10001', '2016-12-09 09:25:31', '10001', '2016-12-10 14:53:40', 'asdasdsdfs', '1', '4', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10022', '盖伦', '盖伦', 'OD201612091013001', null, '295672', '10001', '2016-12-09 10:13:31', '10001', '2016-12-09 10:13:31', '人在塔在', '1', '1', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('10024', '杨过', '杨过', 'OD201612091032001', null, '-213', '10001', '2016-12-09 10:32:06', '10001', '2016-12-09 10:32:06', '2421', '1', '1', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('10025', '士大夫', 'jack', '2016', '200', '10', '10001', '2016-12-09 10:44:46', '10001', '2016-12-09 15:30:43', 'fsdfwsdfsdfsd', '1', '9', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10026', '杨过', '杨过', 'OD201612091129001', null, '999', '10001', '2016-12-09 11:29:31', '10001', '2016-12-09 11:29:31', '爱的礼物', '1', '1', '185');
INSERT INTO `caiwu_shoukuan` VALUES ('10027', '杨过', '杨过', 'OD201612091131001', null, '999', '10001', '2016-12-09 11:31:00', '10001', '2016-12-09 11:31:00', '爱的礼物', '1', '1', '185');
INSERT INTO `caiwu_shoukuan` VALUES ('10029', '士大夫', 'jack', '2016', '200', '10', '10001', '2016-12-09 14:56:57', '10001', '2016-12-09 15:29:20', 'asd', '1', '9', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10030', '亚索', '亚索', 'OD201612091546001', null, '1', '10001', '2016-12-09 15:46:21', '10001', '2016-12-09 15:46:21', '世界是你的', '1', '1', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10031', '士大夫', 'tom', '101', '10', '10', '10001', '2016-12-09 22:28:33', '10001', '2016-12-10 14:37:22', '胜多负少', '1', '11', '181');
INSERT INTO `caiwu_shoukuan` VALUES ('10032', 'jack', '里', '101', '10', '200', '10001', '2016-12-11 17:52:53', '10001', '2016-12-12 11:07:23', '123', '1', '14', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10034', 'niit', 'niit', '16-12-09 11:05:14', '4', '4', '10001', '2016-12-11 21:40:18', '10001', '2016-12-12 11:06:59', '1111', '2', '2', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10035', '笑傲江湖', '笑傲江湖', 'OD201612121032001', null, '1', '10001', '2016-12-12 10:31:53', '10001', '2016-12-12 10:31:53', '花花公子', '1', '1', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10037', '士大夫', 'sdf', '101', '10', '200', '10001', '2016-12-12 11:17:20', '10001', '2016-12-13 20:00:56', '', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10038', '请问', '我恶趣味', '868', '742785', '0', '10001', '2016-12-12 11:20:32', null, null, '请问额外', '0', '1', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10040', '笑傲江湖', '笑傲江湖', 'OD201612121141001', null, '42040', '10001', '2016-12-12 11:40:58', '10001', '2016-12-12 11:40:58', '22', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10041', '笑傲', '笑傲', 'OD201612121141002', null, '42040', '10001', '2016-12-12 11:41:44', '10001', '2016-12-12 11:41:44', 'xxx', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10042', '说好的两肋插刀呢', '说好的两肋插刀呢', 'OD201612121142001', null, '42040', '10001', '2016-12-12 11:42:39', '10001', '2016-12-12 11:42:39', 'gh', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10043', 'undefined', 'undefined', 'OD201612121144001', null, '987', '10001', '2016-12-12 11:44:53', '10001', '2016-12-12 11:44:53', '12', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10044', '笑傲江湖', '笑傲江湖', 'OD201612121145001', null, '41129', '10001', '2016-12-12 11:45:49', '10001', '2016-12-12 11:45:49', '12', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10045', '笑傲江湖', '笑傲江湖', 'OD201612121147001', null, '41128', '10001', '2016-12-12 11:46:58', '10001', '2016-12-12 11:46:58', '13', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10051', 'niit', 'niit', 'PC201612121115001', '24', '24', '10001', '2016-12-12 15:06:08', null, null, '1212212', '0', '2', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10052', '杨康', '杨康', 'OD201612121514001', null, '593', '10001', '2016-12-12 15:14:01', '10001', '2016-12-12 15:14:01', '123', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10053', 'niit', 'niit', 'PC201612121455001', '4', '4', '10001', '2016-12-12 17:54:10', '10001', '2016-12-13 09:51:48', '1111111', '2', '2', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10054', 'niit', 'niit', 'PC201612121754002', '2', '0', '10001', '2016-12-12 17:54:45', '10001', '2016-12-13 09:51:28', 'dfsdfs', '1', '2', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10055', '请问请问', '王企鹅', '54656', '16', '15', '10001', '2016-12-13 09:52:57', '10001', '2016-12-13 09:53:51', '魏飞飞去打网球', '1', '11', '183');
INSERT INTO `caiwu_shoukuan` VALUES ('10056', '孙', '王', '123', '10', '0', '10001', '2016-12-13 19:56:18', null, null, 'asd', '0', '11', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10057', '孙', 'sd', '123', '123', '123', '1333333', '2016-12-13 20:48:54', '1333333', '2016-12-13 20:49:32', 'asd', '2', '14', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10058', 'fsafs', 'asdf', '1231231', '123', '0', '1333333', '2016-12-13 20:49:13', null, null, 'sss', '0', '11', '182');
INSERT INTO `caiwu_shoukuan` VALUES ('10059', 'awdzxfa', 'zczxc', 'zc2423423', '123', '123', '1333333', '2016-12-13 20:49:26', '1333333', '2016-12-13 20:49:29', 'zxvxcvxzcvzxc', '1', '9', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10060', 'qwe', 'asd', '1231qwe', '123', '1231421', '133345434', '2016-12-14 09:50:31', '133345434', '2016-12-14 20:07:08', 'ddddd', '1', '11', '266');
INSERT INTO `caiwu_shoukuan` VALUES ('10061', '孙', '张三', '111', '10', '10', '10001', '2016-12-14 11:04:06', '10001', '2016-12-14 18:01:02', '', '1', '20', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10062', '张三', '张三', '111', '10', '10', '10001', '2016-12-14 11:46:50', null, null, '', '0', '20', '65');
INSERT INTO `caiwu_shoukuan` VALUES ('10063', '孙', '李四', '111', '10', '10', '10001', '2016-12-14 11:53:50', null, null, '', '0', '20', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10064', '111', '111', 'PC201612141801001', '855', '855', '10001', '2016-12-14 18:04:05', null, null, '22', '0', '2', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10065', '111', '111', 'PC201612141924001', '1', '1', '10001', '2016-12-14 19:28:00', null, null, null, '0', '2', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10066', '111', '111', 'PC201612141850001', '2', '0', '10001', '2016-12-14 19:32:57', null, null, '', '0', '2', '64');
INSERT INTO `caiwu_shoukuan` VALUES ('10067', '111', '111', 'PC201612151021001', '1', '12', '10001', '2016-12-15 10:22:29', null, null, 'sd', '0', '2', '123');
INSERT INTO `caiwu_shoukuan` VALUES ('10068', '笑傲江湖', '笑傲江湖', 'OD201612151051001', null, '42138', '10001', '2016-12-15 10:51:32', '10001', '2016-12-15 10:51:32', '00', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10069', '笑傲江湖000', '笑傲江湖000', 'OD201612151054001', null, '999', '10001', '2016-12-15 10:54:45', '10001', '2016-12-15 10:54:45', '123', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10070', '杨康', '杨康', 'OD201612151254001', null, '42140', '10001', '2016-12-15 12:54:07', '10001', '2016-12-15 12:54:07', '00000000', '1', '1', null);
INSERT INTO `caiwu_shoukuan` VALUES ('10072', 'q', 'q', '1212', '12', '221', '10001', '2016-12-15 14:51:04', '10001', '2016-12-15 14:51:23', '', '1', '1', '123');

-- ----------------------------
-- Table structure for caiwu_shouzhilx
-- ----------------------------
DROP TABLE IF EXISTS `caiwu_shouzhilx`;
CREATE TABLE `caiwu_shouzhilx` (
  `shouzhilxId` int(11) NOT NULL AUTO_INCREMENT,
  `shouzhilxType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shouzhilxStatus` enum('启用','停用') COLLATE utf8_unicode_ci NOT NULL,
  `shouzhilxComment` varchar(100) COLLATE utf8_unicode_ci DEFAULT '系统预设',
  PRIMARY KEY (`shouzhilxId`),
  KEY `shouzhilxType` (`shouzhilxType`),
  KEY `shouzhilxId` (`shouzhilxId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of caiwu_shouzhilx
-- ----------------------------
INSERT INTO `caiwu_shouzhilx` VALUES ('1', '订单', '启用', '系统预设');
INSERT INTO `caiwu_shouzhilx` VALUES ('2', '采购退货单', '启用', '系统预设');
INSERT INTO `caiwu_shouzhilx` VALUES ('3', '采购订单', '启用', '系统预设');
INSERT INTO `caiwu_shouzhilx` VALUES ('4', '退换货单', '启用', '系统预设');
INSERT INTO `caiwu_shouzhilx` VALUES ('6', '主营业务收入', '停用', '书籍');
INSERT INTO `caiwu_shouzhilx` VALUES ('7', '其他业务收入', '停用', '电器');
INSERT INTO `caiwu_shouzhilx` VALUES ('8', '订单3', '停用', '汽车');
INSERT INTO `caiwu_shouzhilx` VALUES ('9', '货到付款', '启用', '货到付款');
INSERT INTO `caiwu_shouzhilx` VALUES ('10', '货到付款', '启用', '家具');
INSERT INTO `caiwu_shouzhilx` VALUES ('11', '订单4', '启用', '已启用');
INSERT INTO `caiwu_shouzhilx` VALUES ('12', '订单5', '停用', '零食');
INSERT INTO `caiwu_shouzhilx` VALUES ('13', '订单5', '停用', '服装');
INSERT INTO `caiwu_shouzhilx` VALUES ('14', '订单7', '启用', '发发发');
INSERT INTO `caiwu_shouzhilx` VALUES ('15', '订单8', '停用', '手机');
INSERT INTO `caiwu_shouzhilx` VALUES ('16', '订单9', '停用', '电脑');
INSERT INTO `caiwu_shouzhilx` VALUES ('17', '订单10', '停用', '书籍');
INSERT INTO `caiwu_shouzhilx` VALUES ('18', '订单11', '停用', '电器');
INSERT INTO `caiwu_shouzhilx` VALUES ('19', '订单12', '停用', '汽车');
INSERT INTO `caiwu_shouzhilx` VALUES ('20', '订单13', '启用', '洗浴');
INSERT INTO `caiwu_shouzhilx` VALUES ('22', '订单14', '停用', '已停用');
INSERT INTO `caiwu_shouzhilx` VALUES ('23', '订单15', '停用', '暂停使用');
INSERT INTO `caiwu_shouzhilx` VALUES ('24', '订单16', '停用', '停用');
INSERT INTO `caiwu_shouzhilx` VALUES ('25', '订单17', '停用', '已停用');
INSERT INTO `caiwu_shouzhilx` VALUES ('26', '订单18', '停用', '福娃');

-- ----------------------------
-- Table structure for common_boss
-- ----------------------------
DROP TABLE IF EXISTS `common_boss`;
CREATE TABLE `common_boss` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `bossType` int(5) NOT NULL,
  `bossCompanyName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `common_boss_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1333333381 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_boss
-- ----------------------------
INSERT INTO `common_boss` VALUES ('10001', '8', 'NIIT');
INSERT INTO `common_boss` VALUES ('1333333', '8', 'AAA');
INSERT INTO `common_boss` VALUES ('133333322', '8', 'BBB');
INSERT INTO `common_boss` VALUES ('1333333340', '8', 'ww');
INSERT INTO `common_boss` VALUES ('1333333357', '8', 'CCC');
INSERT INTO `common_boss` VALUES ('1333333374', '9', '22qq2@qq.com');
INSERT INTO `common_boss` VALUES ('1333333377', '9', '222@qq.com');
INSERT INTO `common_boss` VALUES ('1333333380', '9', '000@qq.com');

-- ----------------------------
-- Table structure for common_bpl
-- ----------------------------
DROP TABLE IF EXISTS `common_bpl`;
CREATE TABLE `common_bpl` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `limitId` int(11) NOT NULL,
  `bplIsDefault` int(1) DEFAULT NULL,
  PRIMARY KEY (`postId`,`limitId`),
  KEY `FK_limitId_limit` (`limitId`),
  CONSTRAINT `FK_limitId_limit` FOREIGN KEY (`limitId`) REFERENCES `common_limit` (`limitId`),
  CONSTRAINT `FK_postId_post` FOREIGN KEY (`postId`) REFERENCES `common_post` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_bpl
-- ----------------------------
INSERT INTO `common_bpl` VALUES ('1', '1', '1');
INSERT INTO `common_bpl` VALUES ('1', '2', '1');
INSERT INTO `common_bpl` VALUES ('1', '3', '1');
INSERT INTO `common_bpl` VALUES ('2', '4', '1');
INSERT INTO `common_bpl` VALUES ('2', '5', '1');
INSERT INTO `common_bpl` VALUES ('2', '6', '1');
INSERT INTO `common_bpl` VALUES ('3', '7', '1');
INSERT INTO `common_bpl` VALUES ('3', '8', '1');
INSERT INTO `common_bpl` VALUES ('3', '9', '1');
INSERT INTO `common_bpl` VALUES ('3', '10', '1');
INSERT INTO `common_bpl` VALUES ('3', '11', '1');
INSERT INTO `common_bpl` VALUES ('3', '12', '1');
INSERT INTO `common_bpl` VALUES ('4', '13', '1');
INSERT INTO `common_bpl` VALUES ('4', '14', '1');
INSERT INTO `common_bpl` VALUES ('4', '15', '1');
INSERT INTO `common_bpl` VALUES ('4', '16', '1');
INSERT INTO `common_bpl` VALUES ('4', '17', '1');
INSERT INTO `common_bpl` VALUES ('5', '3', '1');
INSERT INTO `common_bpl` VALUES ('5', '18', '1');
INSERT INTO `common_bpl` VALUES ('5', '19', '1');
INSERT INTO `common_bpl` VALUES ('5', '20', '1');
INSERT INTO `common_bpl` VALUES ('5', '21', '1');
INSERT INTO `common_bpl` VALUES ('5', '23', '1');
INSERT INTO `common_bpl` VALUES ('6', '3', '1');
INSERT INTO `common_bpl` VALUES ('6', '25', '1');
INSERT INTO `common_bpl` VALUES ('6', '26', '1');
INSERT INTO `common_bpl` VALUES ('7', '27', '1');
INSERT INTO `common_bpl` VALUES ('7', '28', '1');
INSERT INTO `common_bpl` VALUES ('7', '29', '1');
INSERT INTO `common_bpl` VALUES ('7', '30', '1');
INSERT INTO `common_bpl` VALUES ('8', '31', '1');
INSERT INTO `common_bpl` VALUES ('8', '32', '1');
INSERT INTO `common_bpl` VALUES ('8', '33', '1');
INSERT INTO `common_bpl` VALUES ('8', '34', '1');
INSERT INTO `common_bpl` VALUES ('8', '35', '1');
INSERT INTO `common_bpl` VALUES ('8', '36', '1');
INSERT INTO `common_bpl` VALUES ('9', '33', '1');
INSERT INTO `common_bpl` VALUES ('9', '35', '1');
INSERT INTO `common_bpl` VALUES ('9', '37', '1');
INSERT INTO `common_bpl` VALUES ('9', '38', '1');
INSERT INTO `common_bpl` VALUES ('9', '39', '1');

-- ----------------------------
-- Table structure for common_code
-- ----------------------------
DROP TABLE IF EXISTS `common_code`;
CREATE TABLE `common_code` (
  `userId` int(11) NOT NULL,
  `codePurchasse_Max` varchar(50) DEFAULT NULL,
  `codeReturn_Max` varchar(50) DEFAULT NULL,
  `codeOrder_Max` varchar(50) DEFAULT NULL,
  `codeChukudan_Max` varchar(50) DEFAULT NULL,
  `codeDiaobodan_Max` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userCode` FOREIGN KEY (`userId`) REFERENCES `common_boss` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_code
-- ----------------------------
INSERT INTO `common_code` VALUES ('10001', 'PC201612151025001', 'RT201612020928003', 'OD201612151356001', 'CK2016120100001', 'DB201612151118001');
INSERT INTO `common_code` VALUES ('1333333', 'PC201612131427001', 'RT201612020928003', 'OD201612121514001', 'CK2016120100001', 'DB201612102214001');

-- ----------------------------
-- Table structure for common_defaultcode
-- ----------------------------
DROP TABLE IF EXISTS `common_defaultcode`;
CREATE TABLE `common_defaultcode` (
  `codePurchasse` varchar(50) NOT NULL,
  `codeReturn` varchar(50) DEFAULT NULL,
  `codeOrder` varchar(50) DEFAULT NULL,
  `codeChukudan` varchar(50) DEFAULT NULL,
  `codeDiaobodan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codePurchasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_defaultcode
-- ----------------------------
INSERT INTO `common_defaultcode` VALUES ('PC201612131427001', 'RT201612020928003', 'OD201612121514001', 'CK2016120100001', 'DB201612102214001');

-- ----------------------------
-- Table structure for common_defaultextralimit
-- ----------------------------
DROP TABLE IF EXISTS `common_defaultextralimit`;
CREATE TABLE `common_defaultextralimit` (
  `defPostId` int(11) NOT NULL,
  `defLimitId` int(11) NOT NULL,
  `defIsSelectid` int(11) NOT NULL,
  PRIMARY KEY (`defPostId`,`defLimitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_defaultextralimit
-- ----------------------------
INSERT INTO `common_defaultextralimit` VALUES ('1', '17', '1');
INSERT INTO `common_defaultextralimit` VALUES ('2', '3', '1');
INSERT INTO `common_defaultextralimit` VALUES ('3', '2', '1');
INSERT INTO `common_defaultextralimit` VALUES ('3', '3', '1');
INSERT INTO `common_defaultextralimit` VALUES ('4', '20', '1');
INSERT INTO `common_defaultextralimit` VALUES ('6', '4', '1');
INSERT INTO `common_defaultextralimit` VALUES ('7', '4', '1');

-- ----------------------------
-- Table structure for common_employee
-- ----------------------------
DROP TABLE IF EXISTS `common_employee`;
CREATE TABLE `common_employee` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeBossUserId` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_employee_to_boss` (`employeeBossUserId`),
  CONSTRAINT `FK_employee_to_boss` FOREIGN KEY (`employeeBossUserId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `FK_employee_to_user` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1333333384 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_employee
-- ----------------------------
INSERT INTO `common_employee` VALUES ('10002', '10001');
INSERT INTO `common_employee` VALUES ('10003', '10001');
INSERT INTO `common_employee` VALUES ('1333333361', '10001');
INSERT INTO `common_employee` VALUES ('1333333369', '10001');
INSERT INTO `common_employee` VALUES ('1333333370', '10001');
INSERT INTO `common_employee` VALUES ('1333333371', '10001');
INSERT INTO `common_employee` VALUES ('1333333372', '10001');
INSERT INTO `common_employee` VALUES ('1333333373', '10001');
INSERT INTO `common_employee` VALUES ('1333333379', '10001');
INSERT INTO `common_employee` VALUES ('1333333381', '10001');
INSERT INTO `common_employee` VALUES ('1333333382', '10001');
INSERT INTO `common_employee` VALUES ('1333333383', '10001');
INSERT INTO `common_employee` VALUES ('133345434', '1333333357');

-- ----------------------------
-- Table structure for common_extralimit
-- ----------------------------
DROP TABLE IF EXISTS `common_extralimit`;
CREATE TABLE `common_extralimit` (
  `bossId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  `limitId` int(11) NOT NULL,
  `extIsSelected` int(1) NOT NULL,
  PRIMARY KEY (`bossId`,`postId`,`limitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_extralimit
-- ----------------------------
INSERT INTO `common_extralimit` VALUES ('10001', '1', '17', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '2', '3', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '3', '2', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '3', '3', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '4', '20', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '6', '4', '1');
INSERT INTO `common_extralimit` VALUES ('10001', '7', '4', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '1', '17', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '2', '3', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '3', '2', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '3', '3', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '4', '20', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '6', '4', '1');
INSERT INTO `common_extralimit` VALUES ('1333333', '7', '4', '1');

-- ----------------------------
-- Table structure for common_inviteduser
-- ----------------------------
DROP TABLE IF EXISTS `common_inviteduser`;
CREATE TABLE `common_inviteduser` (
  `invitedUserId` int(11) NOT NULL AUTO_INCREMENT COMMENT '被邀请人Id',
  `invitedUserBy` int(11) NOT NULL COMMENT '邀请人Id',
  `invitedUserName` varchar(50) NOT NULL COMMENT '邀请人被姓名',
  `invitedUserPhone` varchar(50) NOT NULL COMMENT '被邀请人的手机号',
  `invitedUserEmail` varchar(50) NOT NULL COMMENT '被邀请人的邮箱',
  `invitedUserPost` varchar(100) DEFAULT NULL COMMENT '被邀请人的岗位',
  `invitedUserActivatedState` int(2) NOT NULL COMMENT '激活状态',
  `invitedUserActivationCode` varchar(100) NOT NULL COMMENT '激活码',
  `invitedUserRegisterTime` date NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`invitedUserId`),
  UNIQUE KEY `NONCLUSTERED` (`invitedUserActivationCode`),
  KEY `FK_invitedUser_to_BossId` (`invitedUserBy`),
  CONSTRAINT `FK_invitedUser_to_BossId` FOREIGN KEY (`invitedUserBy`) REFERENCES `common_boss` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_inviteduser
-- ----------------------------
INSERT INTO `common_inviteduser` VALUES ('11113', '10001', '111111', '15875468975', '16455578@qq.com', '1,2,3', '0', '3e0337e06f40809b2b74891e4f264341', '2016-12-15');
INSERT INTO `common_inviteduser` VALUES ('11116', '10001', '111111', '15875468972', '164555781@qq.com', '1,2,3,4', '0', '03fa351fa0e1cdadd0cd9aa1c54760f9', '2016-12-15');
INSERT INTO `common_inviteduser` VALUES ('11118', '10001', 'LKKKKK', '15875468979', '916455578@qq.com', '1,2,7', '0', 'd80d51e3426f08e0687f97ef1c8e8158', '2016-12-15');
INSERT INTO `common_inviteduser` VALUES ('11119', '10001', 'oooo', '13145678912', '7777777@qq.com', '1,2', '0', 'a955cf1920aa3bc036081c1193e541d9', '2016-12-15');
INSERT INTO `common_inviteduser` VALUES ('11120', '10001', 'PPPP', '13478945621', '88888888@qq.com', '1,2', '0', '5669e6e45ccab46a7384a8c8ab88edd2', '2016-12-15');
INSERT INTO `common_inviteduser` VALUES ('11121', '10001', '余快', '18382838383', '171194975@qq.com', '1,2,3,4,5', '0', '1432c88ff065fdc31f578d1f618878ad', '2016-12-15');

-- ----------------------------
-- Table structure for common_limit
-- ----------------------------
DROP TABLE IF EXISTS `common_limit`;
CREATE TABLE `common_limit` (
  `limitId` int(11) NOT NULL AUTO_INCREMENT,
  `limitName` varchar(50) NOT NULL,
  `limitUrl` varchar(50) DEFAULT NULL,
  `limitIcon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`limitId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_limit
-- ----------------------------
INSERT INTO `common_limit` VALUES ('1', '店铺', null, 'icon-dianpushouquan');
INSERT INTO `common_limit` VALUES ('2', '物流', null, 'icon-wuliupeisong');
INSERT INTO `common_limit` VALUES ('3', '商品', '/servlet/cg/sp?method=ini', 'icon-shangpin');
INSERT INTO `common_limit` VALUES ('4', '订单查询', '/servlet/DdcxMethodServlet?method=ddcx', 'icon-dingdanchaxun');
INSERT INTO `common_limit` VALUES ('5', '待付款订单', null, 'icon-dingdancuikuan');
INSERT INTO `common_limit` VALUES ('6', '退款售后', null, 'icon-tuihuanhuo');
INSERT INTO `common_limit` VALUES ('7', '审查', '/servlet/order/orderServlet?method=shenHe', 'icon-daishenhe');
INSERT INTO `common_limit` VALUES ('8', '反审', '/servlet/order/orderServlet?method=fanShen', 'icon-yishenhe');
INSERT INTO `common_limit` VALUES ('9', '打单发货', '/servlet/order/orderServlet?method=faHuo', 'icon-dadanfahuo');
INSERT INTO `common_limit` VALUES ('10', '打印设置', null, 'icon-dayinshezhi');
INSERT INTO `common_limit` VALUES ('11', '验货', null, 'icon-yanhuo');
INSERT INTO `common_limit` VALUES ('12', '称重', null, 'icon-chengzhong');
INSERT INTO `common_limit` VALUES ('13', '入库单', '/servlet/Purchase', 'icon-rukudan');
INSERT INTO `common_limit` VALUES ('14', '出库单', '/servlet/kuguan/chukudan/one?op=caigou', 'icon-chukudan');
INSERT INTO `common_limit` VALUES ('15', '调拨单', '/servlet/kg/WeiwanchengServlet1', 'icon-diaobodan');
INSERT INTO `common_limit` VALUES ('16', '盘点单', null, 'icon-pandiandan');
INSERT INTO `common_limit` VALUES ('17', '仓库管理', '/CangKuXinxiMethodServlet?method=requestDis', 'icon-cangkuguanli');
INSERT INTO `common_limit` VALUES ('18', '采购单', '/caigou/servlet/DcgServlet', 'icon-caigoudan');
INSERT INTO `common_limit` VALUES ('19', '采购退货单', '/servlet/caigou/cgthdServlet', 'icon-caigoutuihuodan');
INSERT INTO `common_limit` VALUES ('20', '库存监控', '/caigou/servlet/KcjkServlet', 'icon-cangkujiankong');
INSERT INTO `common_limit` VALUES ('21', '供应商信息', '/servlet/caigou/gysServlet', 'icon-gongyingshangxinxi');
INSERT INTO `common_limit` VALUES ('23', '库存成本', '/servlet/cg/kccb?method=showKccb', 'icon-kucunchengben');
INSERT INTO `common_limit` VALUES ('25', '库存同步', null, 'icon-kucuntongbu');
INSERT INTO `common_limit` VALUES ('26', '赠品策略', null, 'icon-zengpincelue');
INSERT INTO `common_limit` VALUES ('27', '收款', '/servlet/cw/shouKuan', 'icon-shoukuan');
INSERT INTO `common_limit` VALUES ('28', '付款', '/servlet/cw/Wait_checkServlet?method=zhujiemian', 'icon-fukuan');
INSERT INTO `common_limit` VALUES ('29', '库存成本', '/KucunCostServlet', 'icon-kucunchengben');
INSERT INTO `common_limit` VALUES ('30', '基础资料', '/Servlet/LoginFukuanzhServlet', 'icon-jichuziliao');
INSERT INTO `common_limit` VALUES ('31', '我的供应商', null, 'icon-wdgongyingshang');
INSERT INTO `common_limit` VALUES ('32', '经销商品', null, 'icon-jingxiaoshangpin');
INSERT INTO `common_limit` VALUES ('33', '经销订单', null, 'icon-jingxiaodingdan');
INSERT INTO `common_limit` VALUES ('34', '代销商品', null, 'icon-spth');
INSERT INTO `common_limit` VALUES ('35', '代销订单', null, 'icon-daixiaodingdan');
INSERT INTO `common_limit` VALUES ('36', '寻找货源', null, 'icon-pandiandan');
INSERT INTO `common_limit` VALUES ('37', '分销发布', null, 'icon-fenxiaofb');
INSERT INTO `common_limit` VALUES ('38', '我的分销商', null, 'icon-fenxiaokh');
INSERT INTO `common_limit` VALUES ('39', '退款售后', null, 'icon-tuikuan');

-- ----------------------------
-- Table structure for common_post
-- ----------------------------
DROP TABLE IF EXISTS `common_post`;
CREATE TABLE `common_post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `postName` varchar(50) NOT NULL,
  `postType` varchar(10) NOT NULL,
  PRIMARY KEY (`postId`),
  KEY `postName` (`postName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_post
-- ----------------------------
INSERT INTO `common_post` VALUES ('1', '管理员', 'ERP');
INSERT INTO `common_post` VALUES ('2', '客服', 'ERP');
INSERT INTO `common_post` VALUES ('3', '订单处理', 'ERP');
INSERT INTO `common_post` VALUES ('4', '库管', 'ERP');
INSERT INTO `common_post` VALUES ('5', '采购', 'ERP');
INSERT INTO `common_post` VALUES ('6', '运营', 'ERP');
INSERT INTO `common_post` VALUES ('7', '财务', 'ERP');
INSERT INTO `common_post` VALUES ('8', '分销商', 'supply');
INSERT INTO `common_post` VALUES ('9', '供应商', 'supply');

-- ----------------------------
-- Table structure for common_rep
-- ----------------------------
DROP TABLE IF EXISTS `common_rep`;
CREATE TABLE `common_rep` (
  `empId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表用户Id',
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`empId`,`postId`),
  KEY `Fk_PostId` (`postId`),
  CONSTRAINT `FK_RelEmpPost_to_user` FOREIGN KEY (`empId`) REFERENCES `common_employee` (`userId`),
  CONSTRAINT `Fk_PostId` FOREIGN KEY (`postId`) REFERENCES `common_post` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=1333333384 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_rep
-- ----------------------------
INSERT INTO `common_rep` VALUES ('10002', '1');
INSERT INTO `common_rep` VALUES ('10003', '1');
INSERT INTO `common_rep` VALUES ('1333333369', '1');
INSERT INTO `common_rep` VALUES ('1333333372', '1');
INSERT INTO `common_rep` VALUES ('1333333379', '1');
INSERT INTO `common_rep` VALUES ('1333333381', '1');
INSERT INTO `common_rep` VALUES ('1333333382', '1');
INSERT INTO `common_rep` VALUES ('1333333383', '1');
INSERT INTO `common_rep` VALUES ('10002', '2');
INSERT INTO `common_rep` VALUES ('10003', '2');
INSERT INTO `common_rep` VALUES ('1333333369', '2');
INSERT INTO `common_rep` VALUES ('1333333372', '2');
INSERT INTO `common_rep` VALUES ('1333333379', '2');
INSERT INTO `common_rep` VALUES ('1333333381', '2');
INSERT INTO `common_rep` VALUES ('1333333382', '2');
INSERT INTO `common_rep` VALUES ('1333333383', '2');
INSERT INTO `common_rep` VALUES ('1333333369', '3');
INSERT INTO `common_rep` VALUES ('1333333372', '3');
INSERT INTO `common_rep` VALUES ('1333333383', '3');
INSERT INTO `common_rep` VALUES ('1333333372', '4');
INSERT INTO `common_rep` VALUES ('1333333383', '4');
INSERT INTO `common_rep` VALUES ('1333333383', '5');
INSERT INTO `common_rep` VALUES ('133345434', '7');
INSERT INTO `common_rep` VALUES ('1333333379', '7');

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userPhoneNo` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userType` varchar(10) NOT NULL,
  `userNickname` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userImgPath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `userNickname` (`userNickname`),
  KEY `FK_userTypeName` (`userType`),
  CONSTRAINT `FK_userTypeName` FOREIGN KEY (`userType`) REFERENCES `common_usertype` (`userType`)
) ENGINE=InnoDB AUTO_INCREMENT=1333333384 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES ('10001', '13333333333', '123', 'boss', 'Blue', 'yk', '123@qq.com', '/MaiJiaYun/_files/img/user/1481598208997_10001.png');
INSERT INTO `common_user` VALUES ('10002', '18888888888', '123', 'emp', 'Jack', 'Jack', '222@qq.com', '/MaiJiaYun/Login/files/userImg/1481765848388_10002.jpg');
INSERT INTO `common_user` VALUES ('10003', '16666666666', '123', 'emp', 'Tom', 'Tom', '666@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333', '13232323232', '123123', 'boss', '汪大爷', '汪大爷', '133@qq.com', '/MaiJiaYun/_files/img/user/1480578534846_1333333.jpg');
INSERT INTO `common_user` VALUES ('133333322', '133333322', '123123', 'boss', null, 'sd', '122@qq.com', null);
INSERT INTO `common_user` VALUES ('133345434', '18686786576', '123', 'emp', 'sdfa', 'sdfa', '1233@qq.com', '');
INSERT INTO `common_user` VALUES ('1333333340', '13838383838', '123123', 'boss', '22', null, '512051676@qq.com', '/MaiJiaYun/_files/img/user/1481013380625_1333333340.jpg');
INSERT INTO `common_user` VALUES ('1333333357', '18333332200', 'qqqqqqqq', 'boss', null, null, '111188@qq.ff', null);
INSERT INTO `common_user` VALUES ('1333333361', '13147199551', '123', 'emp', 'LLL', 'LLL', '1452930743@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333366', '1333331111', '123123123', 'boss', '管理员', null, '1', null);
INSERT INTO `common_user` VALUES ('1333333367', '13022556523', '12312312', 'boss', '管理员', null, '123', null);
INSERT INTO `common_user` VALUES ('1333333368', '1300112211', '123456', 'boss', '管理员', null, '121@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333369', '15875468975', '123', 'emp', '111111', '111111', '16455578@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333370', '15677894562', '123', 'emp', 'asdf', 'asdf', '145789@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333371', '15677894567', '12345', 'emp', 'LL', 'LL', '1452930742@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333372', '15875468972', '123', 'emp', '111111', '111111', '164555781@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333373', '15677894565', '123', 'emp', 'LL111', 'LL111', '1452930740@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333374', '13288542136', '123qweqw', 'boss', '管理员', null, '111@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333375', '15677894565', '123', 'emp', 'LL111', 'LL111', '1452930740@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333376', '15677894565', '123', 'emp', 'LL111', 'LL111', '1452930740@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333377', '13000615421', '123asda', 'boss', '管理员', null, '112@qwe.asd', null);
INSERT INTO `common_user` VALUES ('1333333378', '15875468972', '123', 'emp', '111111', '111111', '164555781@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333379', '15875468979', '123', 'emp', 'LKKKKK', 'LKKKKK', '916455578@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333380', '130212212', '123asd', 'boss', '管理员', null, '12@qwe.asd', null);
INSERT INTO `common_user` VALUES ('1333333381', '13145678912', '123', 'emp', 'oooo', 'oooo', '7777777@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333382', '13478945621', '123', 'emp', 'PPPP', 'PPPP', '88888888@qq.com', null);
INSERT INTO `common_user` VALUES ('1333333383', '18382838383', '123', 'emp', '余快', '余快', '171194975@qq.com', null);

-- ----------------------------
-- Table structure for common_usertype
-- ----------------------------
DROP TABLE IF EXISTS `common_usertype`;
CREATE TABLE `common_usertype` (
  `userTypeId` int(10) NOT NULL,
  `userType` varchar(50) NOT NULL,
  PRIMARY KEY (`userTypeId`),
  KEY `userType` (`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_usertype
-- ----------------------------
INSERT INTO `common_usertype` VALUES ('1', 'boss');
INSERT INTO `common_usertype` VALUES ('2', 'emp');

-- ----------------------------
-- Table structure for kefu_areas
-- ----------------------------
DROP TABLE IF EXISTS `kefu_areas`;
CREATE TABLE `kefu_areas` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaCode` varchar(20) NOT NULL,
  `areaName` varchar(50) NOT NULL,
  `cityCode` varchar(20) NOT NULL,
  PRIMARY KEY (`areaId`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Records of kefu_areas
-- ----------------------------
INSERT INTO `kefu_areas` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `kefu_areas` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `kefu_areas` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `kefu_areas` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `kefu_areas` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `kefu_areas` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `kefu_areas` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `kefu_areas` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `kefu_areas` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `kefu_areas` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `kefu_areas` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `kefu_areas` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `kefu_areas` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `kefu_areas` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `kefu_areas` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `kefu_areas` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `kefu_areas` VALUES ('17', '110228', '密云县', '110200');
INSERT INTO `kefu_areas` VALUES ('18', '110229', '延庆县', '110200');
INSERT INTO `kefu_areas` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `kefu_areas` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `kefu_areas` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `kefu_areas` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `kefu_areas` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `kefu_areas` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `kefu_areas` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `kefu_areas` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `kefu_areas` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `kefu_areas` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `kefu_areas` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `kefu_areas` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `kefu_areas` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `kefu_areas` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `kefu_areas` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `kefu_areas` VALUES ('34', '120221', '宁河县', '120200');
INSERT INTO `kefu_areas` VALUES ('35', '120223', '静海县', '120200');
INSERT INTO `kefu_areas` VALUES ('36', '120225', '蓟　县', '120200');
INSERT INTO `kefu_areas` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `kefu_areas` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `kefu_areas` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `kefu_areas` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `kefu_areas` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `kefu_areas` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `kefu_areas` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `kefu_areas` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `kefu_areas` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `kefu_areas` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `kefu_areas` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `kefu_areas` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `kefu_areas` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `kefu_areas` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `kefu_areas` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `kefu_areas` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `kefu_areas` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `kefu_areas` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `kefu_areas` VALUES ('55', '130133', '赵　县', '130100');
INSERT INTO `kefu_areas` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `kefu_areas` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `kefu_areas` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `kefu_areas` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `kefu_areas` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `kefu_areas` VALUES ('61', '130201', '市辖区', '130200');
INSERT INTO `kefu_areas` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `kefu_areas` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `kefu_areas` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `kefu_areas` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `kefu_areas` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `kefu_areas` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `kefu_areas` VALUES ('68', '130223', '滦　县', '130200');
INSERT INTO `kefu_areas` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `kefu_areas` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `kefu_areas` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `kefu_areas` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `kefu_areas` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `kefu_areas` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `kefu_areas` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `kefu_areas` VALUES ('76', '130301', '市辖区', '130300');
INSERT INTO `kefu_areas` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `kefu_areas` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `kefu_areas` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `kefu_areas` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `kefu_areas` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `kefu_areas` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `kefu_areas` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `kefu_areas` VALUES ('84', '130401', '市辖区', '130400');
INSERT INTO `kefu_areas` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `kefu_areas` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `kefu_areas` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `kefu_areas` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `kefu_areas` VALUES ('89', '130421', '邯郸县', '130400');
INSERT INTO `kefu_areas` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `kefu_areas` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `kefu_areas` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `kefu_areas` VALUES ('93', '130426', '涉　县', '130400');
INSERT INTO `kefu_areas` VALUES ('94', '130427', '磁　县', '130400');
INSERT INTO `kefu_areas` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `kefu_areas` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `kefu_areas` VALUES ('97', '130430', '邱　县', '130400');
INSERT INTO `kefu_areas` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `kefu_areas` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `kefu_areas` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `kefu_areas` VALUES ('101', '130434', '魏　县', '130400');
INSERT INTO `kefu_areas` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `kefu_areas` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `kefu_areas` VALUES ('104', '130501', '市辖区', '130500');
INSERT INTO `kefu_areas` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `kefu_areas` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `kefu_areas` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `kefu_areas` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `kefu_areas` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `kefu_areas` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `kefu_areas` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `kefu_areas` VALUES ('112', '130526', '任　县', '130500');
INSERT INTO `kefu_areas` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `kefu_areas` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `kefu_areas` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `kefu_areas` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `kefu_areas` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `kefu_areas` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `kefu_areas` VALUES ('119', '130533', '威　县', '130500');
INSERT INTO `kefu_areas` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `kefu_areas` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `kefu_areas` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `kefu_areas` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `kefu_areas` VALUES ('124', '130601', '市辖区', '130600');
INSERT INTO `kefu_areas` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `kefu_areas` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `kefu_areas` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `kefu_areas` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `kefu_areas` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `kefu_areas` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `kefu_areas` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `kefu_areas` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `kefu_areas` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `kefu_areas` VALUES ('134', '130627', '唐　县', '130600');
INSERT INTO `kefu_areas` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `kefu_areas` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `kefu_areas` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `kefu_areas` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `kefu_areas` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `kefu_areas` VALUES ('140', '130633', '易　县', '130600');
INSERT INTO `kefu_areas` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `kefu_areas` VALUES ('142', '130635', '蠡　县', '130600');
INSERT INTO `kefu_areas` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `kefu_areas` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `kefu_areas` VALUES ('145', '130638', '雄　县', '130600');
INSERT INTO `kefu_areas` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `kefu_areas` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `kefu_areas` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `kefu_areas` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `kefu_areas` VALUES ('150', '130701', '市辖区', '130700');
INSERT INTO `kefu_areas` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `kefu_areas` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `kefu_areas` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `kefu_areas` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `kefu_areas` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `kefu_areas` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `kefu_areas` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `kefu_areas` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `kefu_areas` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `kefu_areas` VALUES ('160', '130726', '蔚　县', '130700');
INSERT INTO `kefu_areas` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `kefu_areas` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `kefu_areas` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `kefu_areas` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `kefu_areas` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `kefu_areas` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `kefu_areas` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `kefu_areas` VALUES ('168', '130801', '市辖区', '130800');
INSERT INTO `kefu_areas` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `kefu_areas` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `kefu_areas` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `kefu_areas` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `kefu_areas` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `kefu_areas` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `kefu_areas` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `kefu_areas` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `kefu_areas` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `kefu_areas` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `kefu_areas` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `kefu_areas` VALUES ('180', '130901', '市辖区', '130900');
INSERT INTO `kefu_areas` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `kefu_areas` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `kefu_areas` VALUES ('183', '130921', '沧　县', '130900');
INSERT INTO `kefu_areas` VALUES ('184', '130922', '青　县', '130900');
INSERT INTO `kefu_areas` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `kefu_areas` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `kefu_areas` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `kefu_areas` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `kefu_areas` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `kefu_areas` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `kefu_areas` VALUES ('191', '130929', '献　县', '130900');
INSERT INTO `kefu_areas` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `kefu_areas` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `kefu_areas` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `kefu_areas` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `kefu_areas` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `kefu_areas` VALUES ('197', '131001', '市辖区', '131000');
INSERT INTO `kefu_areas` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `kefu_areas` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `kefu_areas` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `kefu_areas` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `kefu_areas` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `kefu_areas` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `kefu_areas` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `kefu_areas` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `kefu_areas` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `kefu_areas` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `kefu_areas` VALUES ('208', '131101', '市辖区', '131100');
INSERT INTO `kefu_areas` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `kefu_areas` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `kefu_areas` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `kefu_areas` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `kefu_areas` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `kefu_areas` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `kefu_areas` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `kefu_areas` VALUES ('216', '131127', '景　县', '131100');
INSERT INTO `kefu_areas` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `kefu_areas` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `kefu_areas` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `kefu_areas` VALUES ('220', '140101', '市辖区', '140100');
INSERT INTO `kefu_areas` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `kefu_areas` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `kefu_areas` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `kefu_areas` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `kefu_areas` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `kefu_areas` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `kefu_areas` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `kefu_areas` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `kefu_areas` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `kefu_areas` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `kefu_areas` VALUES ('231', '140201', '市辖区', '140200');
INSERT INTO `kefu_areas` VALUES ('232', '140202', '城　区', '140200');
INSERT INTO `kefu_areas` VALUES ('233', '140203', '矿　区', '140200');
INSERT INTO `kefu_areas` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `kefu_areas` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `kefu_areas` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `kefu_areas` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `kefu_areas` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `kefu_areas` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `kefu_areas` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `kefu_areas` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `kefu_areas` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `kefu_areas` VALUES ('243', '140301', '市辖区', '140300');
INSERT INTO `kefu_areas` VALUES ('244', '140302', '城　区', '140300');
INSERT INTO `kefu_areas` VALUES ('245', '140303', '矿　区', '140300');
INSERT INTO `kefu_areas` VALUES ('246', '140311', '郊　区', '140300');
INSERT INTO `kefu_areas` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `kefu_areas` VALUES ('248', '140322', '盂　县', '140300');
INSERT INTO `kefu_areas` VALUES ('249', '140401', '市辖区', '140400');
INSERT INTO `kefu_areas` VALUES ('250', '140402', '城　区', '140400');
INSERT INTO `kefu_areas` VALUES ('251', '140411', '郊　区', '140400');
INSERT INTO `kefu_areas` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `kefu_areas` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `kefu_areas` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `kefu_areas` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `kefu_areas` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `kefu_areas` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `kefu_areas` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `kefu_areas` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `kefu_areas` VALUES ('260', '140430', '沁　县', '140400');
INSERT INTO `kefu_areas` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `kefu_areas` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `kefu_areas` VALUES ('263', '140501', '市辖区', '140500');
INSERT INTO `kefu_areas` VALUES ('264', '140502', '城　区', '140500');
INSERT INTO `kefu_areas` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `kefu_areas` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `kefu_areas` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `kefu_areas` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `kefu_areas` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `kefu_areas` VALUES ('270', '140601', '市辖区', '140600');
INSERT INTO `kefu_areas` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `kefu_areas` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `kefu_areas` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `kefu_areas` VALUES ('274', '140622', '应　县', '140600');
INSERT INTO `kefu_areas` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `kefu_areas` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `kefu_areas` VALUES ('277', '140701', '市辖区', '140700');
INSERT INTO `kefu_areas` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `kefu_areas` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `kefu_areas` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `kefu_areas` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `kefu_areas` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `kefu_areas` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `kefu_areas` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `kefu_areas` VALUES ('285', '140727', '祁　县', '140700');
INSERT INTO `kefu_areas` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `kefu_areas` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `kefu_areas` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `kefu_areas` VALUES ('289', '140801', '市辖区', '140800');
INSERT INTO `kefu_areas` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `kefu_areas` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `kefu_areas` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `kefu_areas` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `kefu_areas` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `kefu_areas` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `kefu_areas` VALUES ('296', '140826', '绛　县', '140800');
INSERT INTO `kefu_areas` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `kefu_areas` VALUES ('298', '140828', '夏　县', '140800');
INSERT INTO `kefu_areas` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `kefu_areas` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `kefu_areas` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `kefu_areas` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `kefu_areas` VALUES ('303', '140901', '市辖区', '140900');
INSERT INTO `kefu_areas` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `kefu_areas` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `kefu_areas` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `kefu_areas` VALUES ('307', '140923', '代　县', '140900');
INSERT INTO `kefu_areas` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `kefu_areas` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `kefu_areas` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `kefu_areas` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `kefu_areas` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `kefu_areas` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `kefu_areas` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `kefu_areas` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `kefu_areas` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `kefu_areas` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `kefu_areas` VALUES ('318', '141001', '市辖区', '141000');
INSERT INTO `kefu_areas` VALUES ('319', '141002', '尧都区', '141000');
INSERT INTO `kefu_areas` VALUES ('320', '141021', '曲沃县', '141000');
INSERT INTO `kefu_areas` VALUES ('321', '141022', '翼城县', '141000');
INSERT INTO `kefu_areas` VALUES ('322', '141023', '襄汾县', '141000');
INSERT INTO `kefu_areas` VALUES ('323', '141024', '洪洞县', '141000');
INSERT INTO `kefu_areas` VALUES ('324', '141025', '古　县', '141000');
INSERT INTO `kefu_areas` VALUES ('325', '141026', '安泽县', '141000');
INSERT INTO `kefu_areas` VALUES ('326', '141027', '浮山县', '141000');
INSERT INTO `kefu_areas` VALUES ('327', '141028', '吉　县', '141000');
INSERT INTO `kefu_areas` VALUES ('328', '141029', '乡宁县', '141000');
INSERT INTO `kefu_areas` VALUES ('329', '141030', '大宁县', '141000');
INSERT INTO `kefu_areas` VALUES ('330', '141031', '隰　县', '141000');
INSERT INTO `kefu_areas` VALUES ('331', '141032', '永和县', '141000');
INSERT INTO `kefu_areas` VALUES ('332', '141033', '蒲　县', '141000');
INSERT INTO `kefu_areas` VALUES ('333', '141034', '汾西县', '141000');
INSERT INTO `kefu_areas` VALUES ('334', '141081', '侯马市', '141000');
INSERT INTO `kefu_areas` VALUES ('335', '141082', '霍州市', '141000');
INSERT INTO `kefu_areas` VALUES ('336', '141101', '市辖区', '141100');
INSERT INTO `kefu_areas` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `kefu_areas` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `kefu_areas` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `kefu_areas` VALUES ('340', '141123', '兴　县', '141100');
INSERT INTO `kefu_areas` VALUES ('341', '141124', '临　县', '141100');
INSERT INTO `kefu_areas` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `kefu_areas` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `kefu_areas` VALUES ('344', '141127', '岚　县', '141100');
INSERT INTO `kefu_areas` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `kefu_areas` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `kefu_areas` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `kefu_areas` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `kefu_areas` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `kefu_areas` VALUES ('350', '150101', '市辖区', '150100');
INSERT INTO `kefu_areas` VALUES ('351', '150102', '新城区', '150100');
INSERT INTO `kefu_areas` VALUES ('352', '150103', '回民区', '150100');
INSERT INTO `kefu_areas` VALUES ('353', '150104', '玉泉区', '150100');
INSERT INTO `kefu_areas` VALUES ('354', '150105', '赛罕区', '150100');
INSERT INTO `kefu_areas` VALUES ('355', '150121', '土默特左旗', '150100');
INSERT INTO `kefu_areas` VALUES ('356', '150122', '托克托县', '150100');
INSERT INTO `kefu_areas` VALUES ('357', '150123', '和林格尔县', '150100');
INSERT INTO `kefu_areas` VALUES ('358', '150124', '清水河县', '150100');
INSERT INTO `kefu_areas` VALUES ('359', '150125', '武川县', '150100');
INSERT INTO `kefu_areas` VALUES ('360', '150201', '市辖区', '150200');
INSERT INTO `kefu_areas` VALUES ('361', '150202', '东河区', '150200');
INSERT INTO `kefu_areas` VALUES ('362', '150203', '昆都仑区', '150200');
INSERT INTO `kefu_areas` VALUES ('363', '150204', '青山区', '150200');
INSERT INTO `kefu_areas` VALUES ('364', '150205', '石拐区', '150200');
INSERT INTO `kefu_areas` VALUES ('365', '150206', '白云矿区', '150200');
INSERT INTO `kefu_areas` VALUES ('366', '150207', '九原区', '150200');
INSERT INTO `kefu_areas` VALUES ('367', '150221', '土默特右旗', '150200');
INSERT INTO `kefu_areas` VALUES ('368', '150222', '固阳县', '150200');
INSERT INTO `kefu_areas` VALUES ('369', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `kefu_areas` VALUES ('370', '150301', '市辖区', '150300');
INSERT INTO `kefu_areas` VALUES ('371', '150302', '海勃湾区', '150300');
INSERT INTO `kefu_areas` VALUES ('372', '150303', '海南区', '150300');
INSERT INTO `kefu_areas` VALUES ('373', '150304', '乌达区', '150300');
INSERT INTO `kefu_areas` VALUES ('374', '150401', '市辖区', '150400');
INSERT INTO `kefu_areas` VALUES ('375', '150402', '红山区', '150400');
INSERT INTO `kefu_areas` VALUES ('376', '150403', '元宝山区', '150400');
INSERT INTO `kefu_areas` VALUES ('377', '150404', '松山区', '150400');
INSERT INTO `kefu_areas` VALUES ('378', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `kefu_areas` VALUES ('379', '150422', '巴林左旗', '150400');
INSERT INTO `kefu_areas` VALUES ('380', '150423', '巴林右旗', '150400');
INSERT INTO `kefu_areas` VALUES ('381', '150424', '林西县', '150400');
INSERT INTO `kefu_areas` VALUES ('382', '150425', '克什克腾旗', '150400');
INSERT INTO `kefu_areas` VALUES ('383', '150426', '翁牛特旗', '150400');
INSERT INTO `kefu_areas` VALUES ('384', '150428', '喀喇沁旗', '150400');
INSERT INTO `kefu_areas` VALUES ('385', '150429', '宁城县', '150400');
INSERT INTO `kefu_areas` VALUES ('386', '150430', '敖汉旗', '150400');
INSERT INTO `kefu_areas` VALUES ('387', '150501', '市辖区', '150500');
INSERT INTO `kefu_areas` VALUES ('388', '150502', '科尔沁区', '150500');
INSERT INTO `kefu_areas` VALUES ('389', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `kefu_areas` VALUES ('390', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `kefu_areas` VALUES ('391', '150523', '开鲁县', '150500');
INSERT INTO `kefu_areas` VALUES ('392', '150524', '库伦旗', '150500');
INSERT INTO `kefu_areas` VALUES ('393', '150525', '奈曼旗', '150500');
INSERT INTO `kefu_areas` VALUES ('394', '150526', '扎鲁特旗', '150500');
INSERT INTO `kefu_areas` VALUES ('395', '150581', '霍林郭勒市', '150500');
INSERT INTO `kefu_areas` VALUES ('396', '150602', '东胜区', '150600');
INSERT INTO `kefu_areas` VALUES ('397', '150621', '达拉特旗', '150600');
INSERT INTO `kefu_areas` VALUES ('398', '150622', '准格尔旗', '150600');
INSERT INTO `kefu_areas` VALUES ('399', '150623', '鄂托克前旗', '150600');
INSERT INTO `kefu_areas` VALUES ('400', '150624', '鄂托克旗', '150600');
INSERT INTO `kefu_areas` VALUES ('401', '150625', '杭锦旗', '150600');
INSERT INTO `kefu_areas` VALUES ('402', '150626', '乌审旗', '150600');
INSERT INTO `kefu_areas` VALUES ('403', '150627', '伊金霍洛旗', '150600');
INSERT INTO `kefu_areas` VALUES ('404', '150701', '市辖区', '150700');
INSERT INTO `kefu_areas` VALUES ('405', '150702', '海拉尔区', '150700');
INSERT INTO `kefu_areas` VALUES ('406', '150721', '阿荣旗', '150700');
INSERT INTO `kefu_areas` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `kefu_areas` VALUES ('408', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `kefu_areas` VALUES ('409', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `kefu_areas` VALUES ('410', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `kefu_areas` VALUES ('411', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `kefu_areas` VALUES ('412', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `kefu_areas` VALUES ('413', '150781', '满洲里市', '150700');
INSERT INTO `kefu_areas` VALUES ('414', '150782', '牙克石市', '150700');
INSERT INTO `kefu_areas` VALUES ('415', '150783', '扎兰屯市', '150700');
INSERT INTO `kefu_areas` VALUES ('416', '150784', '额尔古纳市', '150700');
INSERT INTO `kefu_areas` VALUES ('417', '150785', '根河市', '150700');
INSERT INTO `kefu_areas` VALUES ('418', '150801', '市辖区', '150800');
INSERT INTO `kefu_areas` VALUES ('419', '150802', '临河区', '150800');
INSERT INTO `kefu_areas` VALUES ('420', '150821', '五原县', '150800');
INSERT INTO `kefu_areas` VALUES ('421', '150822', '磴口县', '150800');
INSERT INTO `kefu_areas` VALUES ('422', '150823', '乌拉特前旗', '150800');
INSERT INTO `kefu_areas` VALUES ('423', '150824', '乌拉特中旗', '150800');
INSERT INTO `kefu_areas` VALUES ('424', '150825', '乌拉特后旗', '150800');
INSERT INTO `kefu_areas` VALUES ('425', '150826', '杭锦后旗', '150800');
INSERT INTO `kefu_areas` VALUES ('426', '150901', '市辖区', '150900');
INSERT INTO `kefu_areas` VALUES ('427', '150902', '集宁区', '150900');
INSERT INTO `kefu_areas` VALUES ('428', '150921', '卓资县', '150900');
INSERT INTO `kefu_areas` VALUES ('429', '150922', '化德县', '150900');
INSERT INTO `kefu_areas` VALUES ('430', '150923', '商都县', '150900');
INSERT INTO `kefu_areas` VALUES ('431', '150924', '兴和县', '150900');
INSERT INTO `kefu_areas` VALUES ('432', '150925', '凉城县', '150900');
INSERT INTO `kefu_areas` VALUES ('433', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `kefu_areas` VALUES ('434', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `kefu_areas` VALUES ('435', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `kefu_areas` VALUES ('436', '150929', '四子王旗', '150900');
INSERT INTO `kefu_areas` VALUES ('437', '150981', '丰镇市', '150900');
INSERT INTO `kefu_areas` VALUES ('438', '152201', '乌兰浩特市', '152200');
INSERT INTO `kefu_areas` VALUES ('439', '152202', '阿尔山市', '152200');
INSERT INTO `kefu_areas` VALUES ('440', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `kefu_areas` VALUES ('441', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `kefu_areas` VALUES ('442', '152223', '扎赉特旗', '152200');
INSERT INTO `kefu_areas` VALUES ('443', '152224', '突泉县', '152200');
INSERT INTO `kefu_areas` VALUES ('444', '152501', '二连浩特市', '152500');
INSERT INTO `kefu_areas` VALUES ('445', '152502', '锡林浩特市', '152500');
INSERT INTO `kefu_areas` VALUES ('446', '152522', '阿巴嘎旗', '152500');
INSERT INTO `kefu_areas` VALUES ('447', '152523', '苏尼特左旗', '152500');
INSERT INTO `kefu_areas` VALUES ('448', '152524', '苏尼特右旗', '152500');
INSERT INTO `kefu_areas` VALUES ('449', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `kefu_areas` VALUES ('450', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `kefu_areas` VALUES ('451', '152527', '太仆寺旗', '152500');
INSERT INTO `kefu_areas` VALUES ('452', '152528', '镶黄旗', '152500');
INSERT INTO `kefu_areas` VALUES ('453', '152529', '正镶白旗', '152500');
INSERT INTO `kefu_areas` VALUES ('454', '152530', '正蓝旗', '152500');
INSERT INTO `kefu_areas` VALUES ('455', '152531', '多伦县', '152500');
INSERT INTO `kefu_areas` VALUES ('456', '152921', '阿拉善左旗', '152900');
INSERT INTO `kefu_areas` VALUES ('457', '152922', '阿拉善右旗', '152900');
INSERT INTO `kefu_areas` VALUES ('458', '152923', '额济纳旗', '152900');
INSERT INTO `kefu_areas` VALUES ('459', '210101', '市辖区', '210100');
INSERT INTO `kefu_areas` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `kefu_areas` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `kefu_areas` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `kefu_areas` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `kefu_areas` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `kefu_areas` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `kefu_areas` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `kefu_areas` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `kefu_areas` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `kefu_areas` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `kefu_areas` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `kefu_areas` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `kefu_areas` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `kefu_areas` VALUES ('473', '210201', '市辖区', '210200');
INSERT INTO `kefu_areas` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `kefu_areas` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `kefu_areas` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `kefu_areas` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `kefu_areas` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `kefu_areas` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `kefu_areas` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `kefu_areas` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `kefu_areas` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `kefu_areas` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `kefu_areas` VALUES ('484', '210301', '市辖区', '210300');
INSERT INTO `kefu_areas` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `kefu_areas` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `kefu_areas` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `kefu_areas` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `kefu_areas` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `kefu_areas` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `kefu_areas` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `kefu_areas` VALUES ('492', '210401', '市辖区', '210400');
INSERT INTO `kefu_areas` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `kefu_areas` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `kefu_areas` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `kefu_areas` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `kefu_areas` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `kefu_areas` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `kefu_areas` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `kefu_areas` VALUES ('500', '210501', '市辖区', '210500');
INSERT INTO `kefu_areas` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `kefu_areas` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `kefu_areas` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `kefu_areas` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `kefu_areas` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `kefu_areas` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `kefu_areas` VALUES ('507', '210601', '市辖区', '210600');
INSERT INTO `kefu_areas` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `kefu_areas` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `kefu_areas` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `kefu_areas` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `kefu_areas` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `kefu_areas` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `kefu_areas` VALUES ('514', '210701', '市辖区', '210700');
INSERT INTO `kefu_areas` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `kefu_areas` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `kefu_areas` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `kefu_areas` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `kefu_areas` VALUES ('519', '210727', '义　县', '210700');
INSERT INTO `kefu_areas` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `kefu_areas` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `kefu_areas` VALUES ('522', '210801', '市辖区', '210800');
INSERT INTO `kefu_areas` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `kefu_areas` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `kefu_areas` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `kefu_areas` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `kefu_areas` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `kefu_areas` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `kefu_areas` VALUES ('529', '210901', '市辖区', '210900');
INSERT INTO `kefu_areas` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `kefu_areas` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `kefu_areas` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `kefu_areas` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `kefu_areas` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `kefu_areas` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `kefu_areas` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `kefu_areas` VALUES ('537', '211001', '市辖区', '211000');
INSERT INTO `kefu_areas` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `kefu_areas` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `kefu_areas` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `kefu_areas` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `kefu_areas` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `kefu_areas` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `kefu_areas` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `kefu_areas` VALUES ('545', '211101', '市辖区', '211100');
INSERT INTO `kefu_areas` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `kefu_areas` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `kefu_areas` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `kefu_areas` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `kefu_areas` VALUES ('550', '211201', '市辖区', '211200');
INSERT INTO `kefu_areas` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `kefu_areas` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `kefu_areas` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `kefu_areas` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `kefu_areas` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `kefu_areas` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `kefu_areas` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `kefu_areas` VALUES ('558', '211301', '市辖区', '211300');
INSERT INTO `kefu_areas` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `kefu_areas` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `kefu_areas` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `kefu_areas` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `kefu_areas` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `kefu_areas` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `kefu_areas` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `kefu_areas` VALUES ('566', '211401', '市辖区', '211400');
INSERT INTO `kefu_areas` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `kefu_areas` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `kefu_areas` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `kefu_areas` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `kefu_areas` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `kefu_areas` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `kefu_areas` VALUES ('573', '220101', '市辖区', '220100');
INSERT INTO `kefu_areas` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `kefu_areas` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `kefu_areas` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `kefu_areas` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `kefu_areas` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `kefu_areas` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `kefu_areas` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `kefu_areas` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `kefu_areas` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `kefu_areas` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `kefu_areas` VALUES ('584', '220201', '市辖区', '220200');
INSERT INTO `kefu_areas` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `kefu_areas` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `kefu_areas` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `kefu_areas` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `kefu_areas` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `kefu_areas` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `kefu_areas` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `kefu_areas` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `kefu_areas` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `kefu_areas` VALUES ('594', '220301', '市辖区', '220300');
INSERT INTO `kefu_areas` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `kefu_areas` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `kefu_areas` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `kefu_areas` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `kefu_areas` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `kefu_areas` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `kefu_areas` VALUES ('601', '220401', '市辖区', '220400');
INSERT INTO `kefu_areas` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `kefu_areas` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `kefu_areas` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `kefu_areas` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `kefu_areas` VALUES ('606', '220501', '市辖区', '220500');
INSERT INTO `kefu_areas` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `kefu_areas` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `kefu_areas` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `kefu_areas` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `kefu_areas` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `kefu_areas` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `kefu_areas` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `kefu_areas` VALUES ('614', '220601', '市辖区', '220600');
INSERT INTO `kefu_areas` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `kefu_areas` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `kefu_areas` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `kefu_areas` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `kefu_areas` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `kefu_areas` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `kefu_areas` VALUES ('621', '220701', '市辖区', '220700');
INSERT INTO `kefu_areas` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `kefu_areas` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `kefu_areas` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `kefu_areas` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `kefu_areas` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `kefu_areas` VALUES ('627', '220801', '市辖区', '220800');
INSERT INTO `kefu_areas` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `kefu_areas` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `kefu_areas` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `kefu_areas` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `kefu_areas` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `kefu_areas` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `kefu_areas` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `kefu_areas` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `kefu_areas` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `kefu_areas` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `kefu_areas` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `kefu_areas` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `kefu_areas` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `kefu_areas` VALUES ('641', '230101', '市辖区', '230100');
INSERT INTO `kefu_areas` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `kefu_areas` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `kefu_areas` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `kefu_areas` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `kefu_areas` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `kefu_areas` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `kefu_areas` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `kefu_areas` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `kefu_areas` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `kefu_areas` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `kefu_areas` VALUES ('652', '230125', '宾　县', '230100');
INSERT INTO `kefu_areas` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `kefu_areas` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `kefu_areas` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `kefu_areas` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `kefu_areas` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `kefu_areas` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `kefu_areas` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `kefu_areas` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `kefu_areas` VALUES ('661', '230201', '市辖区', '230200');
INSERT INTO `kefu_areas` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `kefu_areas` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `kefu_areas` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `kefu_areas` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `kefu_areas` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `kefu_areas` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `kefu_areas` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `kefu_areas` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `kefu_areas` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `kefu_areas` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `kefu_areas` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `kefu_areas` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `kefu_areas` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `kefu_areas` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `kefu_areas` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `kefu_areas` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `kefu_areas` VALUES ('678', '230301', '市辖区', '230300');
INSERT INTO `kefu_areas` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `kefu_areas` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `kefu_areas` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `kefu_areas` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `kefu_areas` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `kefu_areas` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `kefu_areas` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `kefu_areas` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `kefu_areas` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `kefu_areas` VALUES ('688', '230401', '市辖区', '230400');
INSERT INTO `kefu_areas` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `kefu_areas` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `kefu_areas` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `kefu_areas` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `kefu_areas` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `kefu_areas` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `kefu_areas` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `kefu_areas` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `kefu_areas` VALUES ('697', '230501', '市辖区', '230500');
INSERT INTO `kefu_areas` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `kefu_areas` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `kefu_areas` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `kefu_areas` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `kefu_areas` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `kefu_areas` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `kefu_areas` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `kefu_areas` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `kefu_areas` VALUES ('706', '230601', '市辖区', '230600');
INSERT INTO `kefu_areas` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `kefu_areas` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `kefu_areas` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `kefu_areas` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `kefu_areas` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `kefu_areas` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `kefu_areas` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `kefu_areas` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `kefu_areas` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `kefu_areas` VALUES ('716', '230701', '市辖区', '230700');
INSERT INTO `kefu_areas` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `kefu_areas` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `kefu_areas` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `kefu_areas` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `kefu_areas` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `kefu_areas` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `kefu_areas` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `kefu_areas` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `kefu_areas` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `kefu_areas` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `kefu_areas` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `kefu_areas` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `kefu_areas` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `kefu_areas` VALUES ('730', '230715', '红星区', '230700');
INSERT INTO `kefu_areas` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `kefu_areas` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `kefu_areas` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `kefu_areas` VALUES ('734', '230801', '市辖区', '230800');
INSERT INTO `kefu_areas` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `kefu_areas` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `kefu_areas` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `kefu_areas` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `kefu_areas` VALUES ('739', '230811', '郊　区', '230800');
INSERT INTO `kefu_areas` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `kefu_areas` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `kefu_areas` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `kefu_areas` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `kefu_areas` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `kefu_areas` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `kefu_areas` VALUES ('746', '230901', '市辖区', '230900');
INSERT INTO `kefu_areas` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `kefu_areas` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `kefu_areas` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `kefu_areas` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `kefu_areas` VALUES ('751', '231001', '市辖区', '231000');
INSERT INTO `kefu_areas` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `kefu_areas` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `kefu_areas` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `kefu_areas` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `kefu_areas` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `kefu_areas` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `kefu_areas` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `kefu_areas` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `kefu_areas` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `kefu_areas` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `kefu_areas` VALUES ('762', '231101', '市辖区', '231100');
INSERT INTO `kefu_areas` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `kefu_areas` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `kefu_areas` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `kefu_areas` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `kefu_areas` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `kefu_areas` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `kefu_areas` VALUES ('769', '231201', '市辖区', '231200');
INSERT INTO `kefu_areas` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `kefu_areas` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `kefu_areas` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `kefu_areas` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `kefu_areas` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `kefu_areas` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `kefu_areas` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `kefu_areas` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `kefu_areas` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `kefu_areas` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `kefu_areas` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `kefu_areas` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `kefu_areas` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `kefu_areas` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `kefu_areas` VALUES ('784', '310103', '卢湾区', '310100');
INSERT INTO `kefu_areas` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `kefu_areas` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `kefu_areas` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `kefu_areas` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `kefu_areas` VALUES ('789', '310108', '闸北区', '310100');
INSERT INTO `kefu_areas` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `kefu_areas` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `kefu_areas` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `kefu_areas` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `kefu_areas` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `kefu_areas` VALUES ('795', '310115', '浦东新区', '310100');
INSERT INTO `kefu_areas` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `kefu_areas` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `kefu_areas` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `kefu_areas` VALUES ('799', '310119', '南汇区', '310100');
INSERT INTO `kefu_areas` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `kefu_areas` VALUES ('801', '310230', '崇明县', '310200');
INSERT INTO `kefu_areas` VALUES ('802', '320101', '市辖区', '320100');
INSERT INTO `kefu_areas` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `kefu_areas` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `kefu_areas` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `kefu_areas` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `kefu_areas` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `kefu_areas` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `kefu_areas` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `kefu_areas` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `kefu_areas` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `kefu_areas` VALUES ('812', '320115', '江宁区', '320100');
INSERT INTO `kefu_areas` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `kefu_areas` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `kefu_areas` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `kefu_areas` VALUES ('816', '320201', '市辖区', '320200');
INSERT INTO `kefu_areas` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `kefu_areas` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `kefu_areas` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `kefu_areas` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `kefu_areas` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `kefu_areas` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `kefu_areas` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `kefu_areas` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `kefu_areas` VALUES ('825', '320301', '市辖区', '320300');
INSERT INTO `kefu_areas` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `kefu_areas` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `kefu_areas` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `kefu_areas` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `kefu_areas` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `kefu_areas` VALUES ('831', '320321', '丰　县', '320300');
INSERT INTO `kefu_areas` VALUES ('832', '320322', '沛　县', '320300');
INSERT INTO `kefu_areas` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `kefu_areas` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `kefu_areas` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `kefu_areas` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `kefu_areas` VALUES ('837', '320401', '市辖区', '320400');
INSERT INTO `kefu_areas` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `kefu_areas` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `kefu_areas` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `kefu_areas` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `kefu_areas` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `kefu_areas` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `kefu_areas` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `kefu_areas` VALUES ('845', '320501', '市辖区', '320500');
INSERT INTO `kefu_areas` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `kefu_areas` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `kefu_areas` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `kefu_areas` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `kefu_areas` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `kefu_areas` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `kefu_areas` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `kefu_areas` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `kefu_areas` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `kefu_areas` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `kefu_areas` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `kefu_areas` VALUES ('857', '320601', '市辖区', '320600');
INSERT INTO `kefu_areas` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `kefu_areas` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `kefu_areas` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `kefu_areas` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `kefu_areas` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `kefu_areas` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `kefu_areas` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `kefu_areas` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `kefu_areas` VALUES ('866', '320701', '市辖区', '320700');
INSERT INTO `kefu_areas` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `kefu_areas` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `kefu_areas` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `kefu_areas` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `kefu_areas` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `kefu_areas` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `kefu_areas` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `kefu_areas` VALUES ('874', '320801', '市辖区', '320800');
INSERT INTO `kefu_areas` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `kefu_areas` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `kefu_areas` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `kefu_areas` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `kefu_areas` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `kefu_areas` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `kefu_areas` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `kefu_areas` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `kefu_areas` VALUES ('883', '320901', '市辖区', '320900');
INSERT INTO `kefu_areas` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `kefu_areas` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `kefu_areas` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `kefu_areas` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `kefu_areas` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `kefu_areas` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `kefu_areas` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `kefu_areas` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `kefu_areas` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `kefu_areas` VALUES ('893', '321001', '市辖区', '321000');
INSERT INTO `kefu_areas` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `kefu_areas` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `kefu_areas` VALUES ('896', '321011', '郊　区', '321000');
INSERT INTO `kefu_areas` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `kefu_areas` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `kefu_areas` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `kefu_areas` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `kefu_areas` VALUES ('901', '321101', '市辖区', '321100');
INSERT INTO `kefu_areas` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `kefu_areas` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `kefu_areas` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `kefu_areas` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `kefu_areas` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `kefu_areas` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `kefu_areas` VALUES ('908', '321201', '市辖区', '321200');
INSERT INTO `kefu_areas` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `kefu_areas` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `kefu_areas` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `kefu_areas` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `kefu_areas` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `kefu_areas` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `kefu_areas` VALUES ('915', '321301', '市辖区', '321300');
INSERT INTO `kefu_areas` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `kefu_areas` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `kefu_areas` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `kefu_areas` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `kefu_areas` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `kefu_areas` VALUES ('921', '330101', '市辖区', '330100');
INSERT INTO `kefu_areas` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `kefu_areas` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `kefu_areas` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `kefu_areas` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `kefu_areas` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `kefu_areas` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `kefu_areas` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `kefu_areas` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `kefu_areas` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `kefu_areas` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `kefu_areas` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `kefu_areas` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `kefu_areas` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `kefu_areas` VALUES ('935', '330201', '市辖区', '330200');
INSERT INTO `kefu_areas` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `kefu_areas` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `kefu_areas` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `kefu_areas` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `kefu_areas` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `kefu_areas` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `kefu_areas` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `kefu_areas` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `kefu_areas` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `kefu_areas` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `kefu_areas` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `kefu_areas` VALUES ('947', '330301', '市辖区', '330300');
INSERT INTO `kefu_areas` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `kefu_areas` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `kefu_areas` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `kefu_areas` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `kefu_areas` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `kefu_areas` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `kefu_areas` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `kefu_areas` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `kefu_areas` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `kefu_areas` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `kefu_areas` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `kefu_areas` VALUES ('959', '330401', '市辖区', '330400');
INSERT INTO `kefu_areas` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `kefu_areas` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `kefu_areas` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `kefu_areas` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `kefu_areas` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `kefu_areas` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `kefu_areas` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `kefu_areas` VALUES ('967', '330501', '市辖区', '330500');
INSERT INTO `kefu_areas` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `kefu_areas` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `kefu_areas` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `kefu_areas` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `kefu_areas` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `kefu_areas` VALUES ('973', '330601', '市辖区', '330600');
INSERT INTO `kefu_areas` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `kefu_areas` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `kefu_areas` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `kefu_areas` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `kefu_areas` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `kefu_areas` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `kefu_areas` VALUES ('980', '330701', '市辖区', '330700');
INSERT INTO `kefu_areas` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `kefu_areas` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `kefu_areas` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `kefu_areas` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `kefu_areas` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `kefu_areas` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `kefu_areas` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `kefu_areas` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `kefu_areas` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `kefu_areas` VALUES ('990', '330801', '市辖区', '330800');
INSERT INTO `kefu_areas` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `kefu_areas` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `kefu_areas` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `kefu_areas` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `kefu_areas` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `kefu_areas` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `kefu_areas` VALUES ('997', '330901', '市辖区', '330900');
INSERT INTO `kefu_areas` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `kefu_areas` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `kefu_areas` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `kefu_areas` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `kefu_areas` VALUES ('1002', '331001', '市辖区', '331000');
INSERT INTO `kefu_areas` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `kefu_areas` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `kefu_areas` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `kefu_areas` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `kefu_areas` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `kefu_areas` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `kefu_areas` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `kefu_areas` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `kefu_areas` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `kefu_areas` VALUES ('1012', '331101', '市辖区', '331100');
INSERT INTO `kefu_areas` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `kefu_areas` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `kefu_areas` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `kefu_areas` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `kefu_areas` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `kefu_areas` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `kefu_areas` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `kefu_areas` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `kefu_areas` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `kefu_areas` VALUES ('1022', '340101', '市辖区', '340100');
INSERT INTO `kefu_areas` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `kefu_areas` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `kefu_areas` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `kefu_areas` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `kefu_areas` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `kefu_areas` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `kefu_areas` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `kefu_areas` VALUES ('1030', '340201', '市辖区', '340200');
INSERT INTO `kefu_areas` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `kefu_areas` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `kefu_areas` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `kefu_areas` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `kefu_areas` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `kefu_areas` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `kefu_areas` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `kefu_areas` VALUES ('1038', '340301', '市辖区', '340300');
INSERT INTO `kefu_areas` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `kefu_areas` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `kefu_areas` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `kefu_areas` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `kefu_areas` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `kefu_areas` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `kefu_areas` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `kefu_areas` VALUES ('1046', '340401', '市辖区', '340400');
INSERT INTO `kefu_areas` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `kefu_areas` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `kefu_areas` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `kefu_areas` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `kefu_areas` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `kefu_areas` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `kefu_areas` VALUES ('1053', '340501', '市辖区', '340500');
INSERT INTO `kefu_areas` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `kefu_areas` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `kefu_areas` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `kefu_areas` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `kefu_areas` VALUES ('1058', '340601', '市辖区', '340600');
INSERT INTO `kefu_areas` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `kefu_areas` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `kefu_areas` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `kefu_areas` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `kefu_areas` VALUES ('1063', '340701', '市辖区', '340700');
INSERT INTO `kefu_areas` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `kefu_areas` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `kefu_areas` VALUES ('1066', '340711', '郊　区', '340700');
INSERT INTO `kefu_areas` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `kefu_areas` VALUES ('1068', '340801', '市辖区', '340800');
INSERT INTO `kefu_areas` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `kefu_areas` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `kefu_areas` VALUES ('1071', '340811', '郊　区', '340800');
INSERT INTO `kefu_areas` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `kefu_areas` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `kefu_areas` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `kefu_areas` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `kefu_areas` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `kefu_areas` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `kefu_areas` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `kefu_areas` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `kefu_areas` VALUES ('1080', '341001', '市辖区', '341000');
INSERT INTO `kefu_areas` VALUES ('1081', '341002', '屯溪区', '341000');
INSERT INTO `kefu_areas` VALUES ('1082', '341003', '黄山区', '341000');
INSERT INTO `kefu_areas` VALUES ('1083', '341004', '徽州区', '341000');
INSERT INTO `kefu_areas` VALUES ('1084', '341021', '歙　县', '341000');
INSERT INTO `kefu_areas` VALUES ('1085', '341022', '休宁县', '341000');
INSERT INTO `kefu_areas` VALUES ('1086', '341023', '黟　县', '341000');
INSERT INTO `kefu_areas` VALUES ('1087', '341024', '祁门县', '341000');
INSERT INTO `kefu_areas` VALUES ('1088', '341101', '市辖区', '341100');
INSERT INTO `kefu_areas` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `kefu_areas` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `kefu_areas` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `kefu_areas` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `kefu_areas` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `kefu_areas` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `kefu_areas` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `kefu_areas` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `kefu_areas` VALUES ('1097', '341201', '市辖区', '341200');
INSERT INTO `kefu_areas` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `kefu_areas` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `kefu_areas` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `kefu_areas` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `kefu_areas` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `kefu_areas` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `kefu_areas` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `kefu_areas` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `kefu_areas` VALUES ('1106', '341301', '市辖区', '341300');
INSERT INTO `kefu_areas` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `kefu_areas` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `kefu_areas` VALUES ('1109', '341322', '萧　县', '341300');
INSERT INTO `kefu_areas` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `kefu_areas` VALUES ('1111', '341324', '泗　县', '341300');
INSERT INTO `kefu_areas` VALUES ('1112', '341401', '市辖区', '341400');
INSERT INTO `kefu_areas` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `kefu_areas` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `kefu_areas` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `kefu_areas` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `kefu_areas` VALUES ('1117', '341424', '和　县', '341400');
INSERT INTO `kefu_areas` VALUES ('1118', '341501', '市辖区', '341500');
INSERT INTO `kefu_areas` VALUES ('1119', '341502', '金安区', '341500');
INSERT INTO `kefu_areas` VALUES ('1120', '341503', '裕安区', '341500');
INSERT INTO `kefu_areas` VALUES ('1121', '341521', '寿　县', '341500');
INSERT INTO `kefu_areas` VALUES ('1122', '341522', '霍邱县', '341500');
INSERT INTO `kefu_areas` VALUES ('1123', '341523', '舒城县', '341500');
INSERT INTO `kefu_areas` VALUES ('1124', '341524', '金寨县', '341500');
INSERT INTO `kefu_areas` VALUES ('1125', '341525', '霍山县', '341500');
INSERT INTO `kefu_areas` VALUES ('1126', '341601', '市辖区', '341600');
INSERT INTO `kefu_areas` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `kefu_areas` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `kefu_areas` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `kefu_areas` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `kefu_areas` VALUES ('1131', '341701', '市辖区', '341700');
INSERT INTO `kefu_areas` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `kefu_areas` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `kefu_areas` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `kefu_areas` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `kefu_areas` VALUES ('1136', '341801', '市辖区', '341800');
INSERT INTO `kefu_areas` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `kefu_areas` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `kefu_areas` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `kefu_areas` VALUES ('1140', '341823', '泾　县', '341800');
INSERT INTO `kefu_areas` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `kefu_areas` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `kefu_areas` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `kefu_areas` VALUES ('1144', '350101', '市辖区', '350100');
INSERT INTO `kefu_areas` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `kefu_areas` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `kefu_areas` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `kefu_areas` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `kefu_areas` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `kefu_areas` VALUES ('1150', '350121', '闽侯县', '350100');
INSERT INTO `kefu_areas` VALUES ('1151', '350122', '连江县', '350100');
INSERT INTO `kefu_areas` VALUES ('1152', '350123', '罗源县', '350100');
INSERT INTO `kefu_areas` VALUES ('1153', '350124', '闽清县', '350100');
INSERT INTO `kefu_areas` VALUES ('1154', '350125', '永泰县', '350100');
INSERT INTO `kefu_areas` VALUES ('1155', '350128', '平潭县', '350100');
INSERT INTO `kefu_areas` VALUES ('1156', '350181', '福清市', '350100');
INSERT INTO `kefu_areas` VALUES ('1157', '350182', '长乐市', '350100');
INSERT INTO `kefu_areas` VALUES ('1158', '350201', '市辖区', '350200');
INSERT INTO `kefu_areas` VALUES ('1159', '350203', '思明区', '350200');
INSERT INTO `kefu_areas` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `kefu_areas` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `kefu_areas` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `kefu_areas` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `kefu_areas` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `kefu_areas` VALUES ('1165', '350301', '市辖区', '350300');
INSERT INTO `kefu_areas` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `kefu_areas` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `kefu_areas` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `kefu_areas` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `kefu_areas` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `kefu_areas` VALUES ('1171', '350401', '市辖区', '350400');
INSERT INTO `kefu_areas` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `kefu_areas` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `kefu_areas` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `kefu_areas` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `kefu_areas` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `kefu_areas` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `kefu_areas` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `kefu_areas` VALUES ('1179', '350427', '沙　县', '350400');
INSERT INTO `kefu_areas` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `kefu_areas` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `kefu_areas` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `kefu_areas` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `kefu_areas` VALUES ('1184', '350501', '市辖区', '350500');
INSERT INTO `kefu_areas` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `kefu_areas` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `kefu_areas` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `kefu_areas` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `kefu_areas` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `kefu_areas` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `kefu_areas` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `kefu_areas` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `kefu_areas` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `kefu_areas` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `kefu_areas` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `kefu_areas` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `kefu_areas` VALUES ('1197', '350601', '市辖区', '350600');
INSERT INTO `kefu_areas` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `kefu_areas` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `kefu_areas` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `kefu_areas` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `kefu_areas` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `kefu_areas` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `kefu_areas` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `kefu_areas` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `kefu_areas` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `kefu_areas` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `kefu_areas` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `kefu_areas` VALUES ('1209', '350701', '市辖区', '350700');
INSERT INTO `kefu_areas` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `kefu_areas` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `kefu_areas` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `kefu_areas` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `kefu_areas` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `kefu_areas` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `kefu_areas` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `kefu_areas` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `kefu_areas` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `kefu_areas` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `kefu_areas` VALUES ('1220', '350801', '市辖区', '350800');
INSERT INTO `kefu_areas` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `kefu_areas` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `kefu_areas` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `kefu_areas` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `kefu_areas` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `kefu_areas` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `kefu_areas` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `kefu_areas` VALUES ('1228', '350901', '市辖区', '350900');
INSERT INTO `kefu_areas` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `kefu_areas` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `kefu_areas` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `kefu_areas` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `kefu_areas` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `kefu_areas` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `kefu_areas` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `kefu_areas` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `kefu_areas` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `kefu_areas` VALUES ('1238', '360101', '市辖区', '360100');
INSERT INTO `kefu_areas` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `kefu_areas` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `kefu_areas` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `kefu_areas` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `kefu_areas` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `kefu_areas` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `kefu_areas` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `kefu_areas` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `kefu_areas` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `kefu_areas` VALUES ('1248', '360201', '市辖区', '360200');
INSERT INTO `kefu_areas` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `kefu_areas` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `kefu_areas` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `kefu_areas` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `kefu_areas` VALUES ('1253', '360301', '市辖区', '360300');
INSERT INTO `kefu_areas` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `kefu_areas` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `kefu_areas` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `kefu_areas` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `kefu_areas` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `kefu_areas` VALUES ('1259', '360401', '市辖区', '360400');
INSERT INTO `kefu_areas` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `kefu_areas` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `kefu_areas` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `kefu_areas` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `kefu_areas` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `kefu_areas` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `kefu_areas` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `kefu_areas` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `kefu_areas` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `kefu_areas` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `kefu_areas` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `kefu_areas` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `kefu_areas` VALUES ('1272', '360501', '市辖区', '360500');
INSERT INTO `kefu_areas` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `kefu_areas` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `kefu_areas` VALUES ('1275', '360601', '市辖区', '360600');
INSERT INTO `kefu_areas` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `kefu_areas` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `kefu_areas` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `kefu_areas` VALUES ('1279', '360701', '市辖区', '360700');
INSERT INTO `kefu_areas` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `kefu_areas` VALUES ('1281', '360721', '赣　县', '360700');
INSERT INTO `kefu_areas` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `kefu_areas` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `kefu_areas` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `kefu_areas` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `kefu_areas` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `kefu_areas` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `kefu_areas` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `kefu_areas` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `kefu_areas` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `kefu_areas` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `kefu_areas` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `kefu_areas` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `kefu_areas` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `kefu_areas` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `kefu_areas` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `kefu_areas` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `kefu_areas` VALUES ('1298', '360801', '市辖区', '360800');
INSERT INTO `kefu_areas` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `kefu_areas` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `kefu_areas` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `kefu_areas` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `kefu_areas` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `kefu_areas` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `kefu_areas` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `kefu_areas` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `kefu_areas` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `kefu_areas` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `kefu_areas` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `kefu_areas` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `kefu_areas` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `kefu_areas` VALUES ('1312', '360901', '市辖区', '360900');
INSERT INTO `kefu_areas` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `kefu_areas` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `kefu_areas` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `kefu_areas` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `kefu_areas` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `kefu_areas` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `kefu_areas` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `kefu_areas` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `kefu_areas` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `kefu_areas` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `kefu_areas` VALUES ('1323', '361001', '市辖区', '361000');
INSERT INTO `kefu_areas` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `kefu_areas` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `kefu_areas` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `kefu_areas` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `kefu_areas` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `kefu_areas` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `kefu_areas` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `kefu_areas` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `kefu_areas` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `kefu_areas` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `kefu_areas` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `kefu_areas` VALUES ('1335', '361101', '市辖区', '361100');
INSERT INTO `kefu_areas` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `kefu_areas` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `kefu_areas` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `kefu_areas` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `kefu_areas` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `kefu_areas` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `kefu_areas` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `kefu_areas` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `kefu_areas` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `kefu_areas` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `kefu_areas` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `kefu_areas` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `kefu_areas` VALUES ('1348', '370101', '市辖区', '370100');
INSERT INTO `kefu_areas` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `kefu_areas` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `kefu_areas` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `kefu_areas` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `kefu_areas` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `kefu_areas` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `kefu_areas` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `kefu_areas` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `kefu_areas` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `kefu_areas` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `kefu_areas` VALUES ('1359', '370201', '市辖区', '370200');
INSERT INTO `kefu_areas` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `kefu_areas` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `kefu_areas` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `kefu_areas` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `kefu_areas` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `kefu_areas` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `kefu_areas` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `kefu_areas` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `kefu_areas` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `kefu_areas` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `kefu_areas` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `kefu_areas` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `kefu_areas` VALUES ('1372', '370301', '市辖区', '370300');
INSERT INTO `kefu_areas` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `kefu_areas` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `kefu_areas` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `kefu_areas` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `kefu_areas` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `kefu_areas` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `kefu_areas` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `kefu_areas` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `kefu_areas` VALUES ('1381', '370401', '市辖区', '370400');
INSERT INTO `kefu_areas` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `kefu_areas` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `kefu_areas` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `kefu_areas` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `kefu_areas` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `kefu_areas` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `kefu_areas` VALUES ('1388', '370501', '市辖区', '370500');
INSERT INTO `kefu_areas` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `kefu_areas` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `kefu_areas` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `kefu_areas` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `kefu_areas` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `kefu_areas` VALUES ('1394', '370601', '市辖区', '370600');
INSERT INTO `kefu_areas` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `kefu_areas` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `kefu_areas` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `kefu_areas` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `kefu_areas` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `kefu_areas` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `kefu_areas` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `kefu_areas` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `kefu_areas` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `kefu_areas` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `kefu_areas` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `kefu_areas` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `kefu_areas` VALUES ('1407', '370701', '市辖区', '370700');
INSERT INTO `kefu_areas` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `kefu_areas` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `kefu_areas` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `kefu_areas` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `kefu_areas` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `kefu_areas` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `kefu_areas` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `kefu_areas` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `kefu_areas` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `kefu_areas` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `kefu_areas` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `kefu_areas` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `kefu_areas` VALUES ('1420', '370801', '市辖区', '370800');
INSERT INTO `kefu_areas` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `kefu_areas` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `kefu_areas` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `kefu_areas` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `kefu_areas` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `kefu_areas` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `kefu_areas` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `kefu_areas` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `kefu_areas` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `kefu_areas` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `kefu_areas` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `kefu_areas` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `kefu_areas` VALUES ('1433', '370901', '市辖区', '370900');
INSERT INTO `kefu_areas` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `kefu_areas` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `kefu_areas` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `kefu_areas` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `kefu_areas` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `kefu_areas` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `kefu_areas` VALUES ('1440', '371001', '市辖区', '371000');
INSERT INTO `kefu_areas` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `kefu_areas` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `kefu_areas` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `kefu_areas` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `kefu_areas` VALUES ('1445', '371101', '市辖区', '371100');
INSERT INTO `kefu_areas` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `kefu_areas` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `kefu_areas` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `kefu_areas` VALUES ('1449', '371122', '莒　县', '371100');
INSERT INTO `kefu_areas` VALUES ('1450', '371201', '市辖区', '371200');
INSERT INTO `kefu_areas` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `kefu_areas` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `kefu_areas` VALUES ('1453', '371301', '市辖区', '371300');
INSERT INTO `kefu_areas` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `kefu_areas` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `kefu_areas` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `kefu_areas` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `kefu_areas` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `kefu_areas` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `kefu_areas` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `kefu_areas` VALUES ('1461', '371325', '费　县', '371300');
INSERT INTO `kefu_areas` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `kefu_areas` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `kefu_areas` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `kefu_areas` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `kefu_areas` VALUES ('1466', '371401', '市辖区', '371400');
INSERT INTO `kefu_areas` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `kefu_areas` VALUES ('1468', '371421', '陵　县', '371400');
INSERT INTO `kefu_areas` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `kefu_areas` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `kefu_areas` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `kefu_areas` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `kefu_areas` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `kefu_areas` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `kefu_areas` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `kefu_areas` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `kefu_areas` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `kefu_areas` VALUES ('1478', '371501', '市辖区', '371500');
INSERT INTO `kefu_areas` VALUES ('1479', '371502', '东昌府区', '371500');
INSERT INTO `kefu_areas` VALUES ('1480', '371521', '阳谷县', '371500');
INSERT INTO `kefu_areas` VALUES ('1481', '371522', '莘　县', '371500');
INSERT INTO `kefu_areas` VALUES ('1482', '371523', '茌平县', '371500');
INSERT INTO `kefu_areas` VALUES ('1483', '371524', '东阿县', '371500');
INSERT INTO `kefu_areas` VALUES ('1484', '371525', '冠　县', '371500');
INSERT INTO `kefu_areas` VALUES ('1485', '371526', '高唐县', '371500');
INSERT INTO `kefu_areas` VALUES ('1486', '371581', '临清市', '371500');
INSERT INTO `kefu_areas` VALUES ('1487', '371601', '市辖区', '371600');
INSERT INTO `kefu_areas` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `kefu_areas` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `kefu_areas` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `kefu_areas` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `kefu_areas` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `kefu_areas` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `kefu_areas` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `kefu_areas` VALUES ('1495', '371701', '市辖区', '371700');
INSERT INTO `kefu_areas` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `kefu_areas` VALUES ('1497', '371721', '曹　县', '371700');
INSERT INTO `kefu_areas` VALUES ('1498', '371722', '单　县', '371700');
INSERT INTO `kefu_areas` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `kefu_areas` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `kefu_areas` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `kefu_areas` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `kefu_areas` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `kefu_areas` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `kefu_areas` VALUES ('1505', '410101', '市辖区', '410100');
INSERT INTO `kefu_areas` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `kefu_areas` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `kefu_areas` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `kefu_areas` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `kefu_areas` VALUES ('1510', '410106', '上街区', '410100');
INSERT INTO `kefu_areas` VALUES ('1511', '410108', '邙山区', '410100');
INSERT INTO `kefu_areas` VALUES ('1512', '410122', '中牟县', '410100');
INSERT INTO `kefu_areas` VALUES ('1513', '410181', '巩义市', '410100');
INSERT INTO `kefu_areas` VALUES ('1514', '410182', '荥阳市', '410100');
INSERT INTO `kefu_areas` VALUES ('1515', '410183', '新密市', '410100');
INSERT INTO `kefu_areas` VALUES ('1516', '410184', '新郑市', '410100');
INSERT INTO `kefu_areas` VALUES ('1517', '410185', '登封市', '410100');
INSERT INTO `kefu_areas` VALUES ('1518', '410201', '市辖区', '410200');
INSERT INTO `kefu_areas` VALUES ('1519', '410202', '龙亭区', '410200');
INSERT INTO `kefu_areas` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `kefu_areas` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `kefu_areas` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `kefu_areas` VALUES ('1523', '410211', '郊　区', '410200');
INSERT INTO `kefu_areas` VALUES ('1524', '410221', '杞　县', '410200');
INSERT INTO `kefu_areas` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `kefu_areas` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `kefu_areas` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `kefu_areas` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `kefu_areas` VALUES ('1529', '410301', '市辖区', '410300');
INSERT INTO `kefu_areas` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `kefu_areas` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `kefu_areas` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `kefu_areas` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `kefu_areas` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `kefu_areas` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `kefu_areas` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `kefu_areas` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `kefu_areas` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `kefu_areas` VALUES ('1539', '410325', '嵩　县', '410300');
INSERT INTO `kefu_areas` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `kefu_areas` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `kefu_areas` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `kefu_areas` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `kefu_areas` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `kefu_areas` VALUES ('1545', '410401', '市辖区', '410400');
INSERT INTO `kefu_areas` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `kefu_areas` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `kefu_areas` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `kefu_areas` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `kefu_areas` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `kefu_areas` VALUES ('1551', '410422', '叶　县', '410400');
INSERT INTO `kefu_areas` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `kefu_areas` VALUES ('1553', '410425', '郏　县', '410400');
INSERT INTO `kefu_areas` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `kefu_areas` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `kefu_areas` VALUES ('1556', '410501', '市辖区', '410500');
INSERT INTO `kefu_areas` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `kefu_areas` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `kefu_areas` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `kefu_areas` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `kefu_areas` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `kefu_areas` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `kefu_areas` VALUES ('1563', '410526', '滑　县', '410500');
INSERT INTO `kefu_areas` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `kefu_areas` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `kefu_areas` VALUES ('1566', '410601', '市辖区', '410600');
INSERT INTO `kefu_areas` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `kefu_areas` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `kefu_areas` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `kefu_areas` VALUES ('1570', '410621', '浚　县', '410600');
INSERT INTO `kefu_areas` VALUES ('1571', '410622', '淇　县', '410600');
INSERT INTO `kefu_areas` VALUES ('1572', '410701', '市辖区', '410700');
INSERT INTO `kefu_areas` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `kefu_areas` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `kefu_areas` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `kefu_areas` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `kefu_areas` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `kefu_areas` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `kefu_areas` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `kefu_areas` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `kefu_areas` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `kefu_areas` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `kefu_areas` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `kefu_areas` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `kefu_areas` VALUES ('1585', '410801', '市辖区', '410800');
INSERT INTO `kefu_areas` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `kefu_areas` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `kefu_areas` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `kefu_areas` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `kefu_areas` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `kefu_areas` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `kefu_areas` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `kefu_areas` VALUES ('1593', '410825', '温　县', '410800');
INSERT INTO `kefu_areas` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `kefu_areas` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `kefu_areas` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `kefu_areas` VALUES ('1597', '410901', '市辖区', '410900');
INSERT INTO `kefu_areas` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `kefu_areas` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `kefu_areas` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `kefu_areas` VALUES ('1601', '410926', '范　县', '410900');
INSERT INTO `kefu_areas` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `kefu_areas` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `kefu_areas` VALUES ('1604', '411001', '市辖区', '411000');
INSERT INTO `kefu_areas` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `kefu_areas` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `kefu_areas` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `kefu_areas` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `kefu_areas` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `kefu_areas` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `kefu_areas` VALUES ('1611', '411101', '市辖区', '411100');
INSERT INTO `kefu_areas` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `kefu_areas` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `kefu_areas` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `kefu_areas` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `kefu_areas` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `kefu_areas` VALUES ('1617', '411201', '市辖区', '411200');
INSERT INTO `kefu_areas` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `kefu_areas` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `kefu_areas` VALUES ('1620', '411222', '陕　县', '411200');
INSERT INTO `kefu_areas` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `kefu_areas` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `kefu_areas` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `kefu_areas` VALUES ('1624', '411301', '市辖区', '411300');
INSERT INTO `kefu_areas` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `kefu_areas` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `kefu_areas` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `kefu_areas` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `kefu_areas` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `kefu_areas` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `kefu_areas` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `kefu_areas` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `kefu_areas` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `kefu_areas` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `kefu_areas` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `kefu_areas` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `kefu_areas` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `kefu_areas` VALUES ('1638', '411401', '市辖区', '411400');
INSERT INTO `kefu_areas` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `kefu_areas` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `kefu_areas` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `kefu_areas` VALUES ('1642', '411422', '睢　县', '411400');
INSERT INTO `kefu_areas` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `kefu_areas` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `kefu_areas` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `kefu_areas` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `kefu_areas` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `kefu_areas` VALUES ('1648', '411501', '市辖区', '411500');
INSERT INTO `kefu_areas` VALUES ('1649', '411502', '师河区', '411500');
INSERT INTO `kefu_areas` VALUES ('1650', '411503', '平桥区', '411500');
INSERT INTO `kefu_areas` VALUES ('1651', '411521', '罗山县', '411500');
INSERT INTO `kefu_areas` VALUES ('1652', '411522', '光山县', '411500');
INSERT INTO `kefu_areas` VALUES ('1653', '411523', '新　县', '411500');
INSERT INTO `kefu_areas` VALUES ('1654', '411524', '商城县', '411500');
INSERT INTO `kefu_areas` VALUES ('1655', '411525', '固始县', '411500');
INSERT INTO `kefu_areas` VALUES ('1656', '411526', '潢川县', '411500');
INSERT INTO `kefu_areas` VALUES ('1657', '411527', '淮滨县', '411500');
INSERT INTO `kefu_areas` VALUES ('1658', '411528', '息　县', '411500');
INSERT INTO `kefu_areas` VALUES ('1659', '411601', '市辖区', '411600');
INSERT INTO `kefu_areas` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `kefu_areas` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `kefu_areas` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `kefu_areas` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `kefu_areas` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `kefu_areas` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `kefu_areas` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `kefu_areas` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `kefu_areas` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `kefu_areas` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `kefu_areas` VALUES ('1670', '411701', '市辖区', '411700');
INSERT INTO `kefu_areas` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `kefu_areas` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `kefu_areas` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `kefu_areas` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `kefu_areas` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `kefu_areas` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `kefu_areas` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `kefu_areas` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `kefu_areas` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `kefu_areas` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `kefu_areas` VALUES ('1681', '420101', '市辖区', '420100');
INSERT INTO `kefu_areas` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `kefu_areas` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `kefu_areas` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `kefu_areas` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `kefu_areas` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `kefu_areas` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `kefu_areas` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `kefu_areas` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `kefu_areas` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `kefu_areas` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `kefu_areas` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `kefu_areas` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `kefu_areas` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `kefu_areas` VALUES ('1695', '420201', '市辖区', '420200');
INSERT INTO `kefu_areas` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `kefu_areas` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `kefu_areas` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `kefu_areas` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `kefu_areas` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `kefu_areas` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `kefu_areas` VALUES ('1702', '420301', '市辖区', '420300');
INSERT INTO `kefu_areas` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `kefu_areas` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `kefu_areas` VALUES ('1705', '420321', '郧　县', '420300');
INSERT INTO `kefu_areas` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `kefu_areas` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `kefu_areas` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `kefu_areas` VALUES ('1709', '420325', '房　县', '420300');
INSERT INTO `kefu_areas` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `kefu_areas` VALUES ('1711', '420501', '市辖区', '420500');
INSERT INTO `kefu_areas` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `kefu_areas` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `kefu_areas` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `kefu_areas` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `kefu_areas` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `kefu_areas` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `kefu_areas` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `kefu_areas` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `kefu_areas` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `kefu_areas` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `kefu_areas` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `kefu_areas` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `kefu_areas` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `kefu_areas` VALUES ('1725', '420601', '市辖区', '420600');
INSERT INTO `kefu_areas` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `kefu_areas` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `kefu_areas` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `kefu_areas` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `kefu_areas` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `kefu_areas` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `kefu_areas` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `kefu_areas` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `kefu_areas` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `kefu_areas` VALUES ('1735', '420701', '市辖区', '420700');
INSERT INTO `kefu_areas` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `kefu_areas` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `kefu_areas` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `kefu_areas` VALUES ('1739', '420801', '市辖区', '420800');
INSERT INTO `kefu_areas` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `kefu_areas` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `kefu_areas` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `kefu_areas` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `kefu_areas` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `kefu_areas` VALUES ('1745', '420901', '市辖区', '420900');
INSERT INTO `kefu_areas` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `kefu_areas` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `kefu_areas` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `kefu_areas` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `kefu_areas` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `kefu_areas` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `kefu_areas` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `kefu_areas` VALUES ('1753', '421001', '市辖区', '421000');
INSERT INTO `kefu_areas` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `kefu_areas` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `kefu_areas` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `kefu_areas` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `kefu_areas` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `kefu_areas` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `kefu_areas` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `kefu_areas` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `kefu_areas` VALUES ('1762', '421101', '市辖区', '421100');
INSERT INTO `kefu_areas` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `kefu_areas` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `kefu_areas` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `kefu_areas` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `kefu_areas` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `kefu_areas` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `kefu_areas` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `kefu_areas` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `kefu_areas` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `kefu_areas` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `kefu_areas` VALUES ('1773', '421201', '市辖区', '421200');
INSERT INTO `kefu_areas` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `kefu_areas` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `kefu_areas` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `kefu_areas` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `kefu_areas` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `kefu_areas` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `kefu_areas` VALUES ('1780', '421301', '市辖区', '421300');
INSERT INTO `kefu_areas` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `kefu_areas` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `kefu_areas` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `kefu_areas` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `kefu_areas` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `kefu_areas` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `kefu_areas` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `kefu_areas` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `kefu_areas` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `kefu_areas` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `kefu_areas` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `kefu_areas` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `kefu_areas` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `kefu_areas` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `kefu_areas` VALUES ('1795', '430101', '市辖区', '430100');
INSERT INTO `kefu_areas` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `kefu_areas` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `kefu_areas` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `kefu_areas` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `kefu_areas` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `kefu_areas` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `kefu_areas` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `kefu_areas` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `kefu_areas` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `kefu_areas` VALUES ('1805', '430201', '市辖区', '430200');
INSERT INTO `kefu_areas` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `kefu_areas` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `kefu_areas` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `kefu_areas` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `kefu_areas` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `kefu_areas` VALUES ('1811', '430223', '攸　县', '430200');
INSERT INTO `kefu_areas` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `kefu_areas` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `kefu_areas` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `kefu_areas` VALUES ('1815', '430301', '市辖区', '430300');
INSERT INTO `kefu_areas` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `kefu_areas` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `kefu_areas` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `kefu_areas` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `kefu_areas` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `kefu_areas` VALUES ('1821', '430401', '市辖区', '430400');
INSERT INTO `kefu_areas` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `kefu_areas` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `kefu_areas` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `kefu_areas` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `kefu_areas` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `kefu_areas` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `kefu_areas` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `kefu_areas` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `kefu_areas` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `kefu_areas` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `kefu_areas` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `kefu_areas` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `kefu_areas` VALUES ('1834', '430501', '市辖区', '430500');
INSERT INTO `kefu_areas` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `kefu_areas` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `kefu_areas` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `kefu_areas` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `kefu_areas` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `kefu_areas` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `kefu_areas` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `kefu_areas` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `kefu_areas` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `kefu_areas` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `kefu_areas` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `kefu_areas` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `kefu_areas` VALUES ('1847', '430601', '市辖区', '430600');
INSERT INTO `kefu_areas` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `kefu_areas` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `kefu_areas` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `kefu_areas` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `kefu_areas` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `kefu_areas` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `kefu_areas` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `kefu_areas` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `kefu_areas` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `kefu_areas` VALUES ('1857', '430701', '市辖区', '430700');
INSERT INTO `kefu_areas` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `kefu_areas` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `kefu_areas` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `kefu_areas` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `kefu_areas` VALUES ('1862', '430723', '澧　县', '430700');
INSERT INTO `kefu_areas` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `kefu_areas` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `kefu_areas` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `kefu_areas` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `kefu_areas` VALUES ('1867', '430801', '市辖区', '430800');
INSERT INTO `kefu_areas` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `kefu_areas` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `kefu_areas` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `kefu_areas` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `kefu_areas` VALUES ('1872', '430901', '市辖区', '430900');
INSERT INTO `kefu_areas` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `kefu_areas` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `kefu_areas` VALUES ('1875', '430921', '南　县', '430900');
INSERT INTO `kefu_areas` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `kefu_areas` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `kefu_areas` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `kefu_areas` VALUES ('1879', '431001', '市辖区', '431000');
INSERT INTO `kefu_areas` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `kefu_areas` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `kefu_areas` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `kefu_areas` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `kefu_areas` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `kefu_areas` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `kefu_areas` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `kefu_areas` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `kefu_areas` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `kefu_areas` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `kefu_areas` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `kefu_areas` VALUES ('1891', '431101', '市辖区', '431100');
INSERT INTO `kefu_areas` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `kefu_areas` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `kefu_areas` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `kefu_areas` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `kefu_areas` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `kefu_areas` VALUES ('1897', '431124', '道　县', '431100');
INSERT INTO `kefu_areas` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `kefu_areas` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `kefu_areas` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `kefu_areas` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `kefu_areas` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `kefu_areas` VALUES ('1903', '431201', '市辖区', '431200');
INSERT INTO `kefu_areas` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `kefu_areas` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `kefu_areas` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `kefu_areas` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `kefu_areas` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `kefu_areas` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `kefu_areas` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `kefu_areas` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `kefu_areas` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `kefu_areas` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `kefu_areas` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `kefu_areas` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `kefu_areas` VALUES ('1916', '431301', '市辖区', '431300');
INSERT INTO `kefu_areas` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `kefu_areas` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `kefu_areas` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `kefu_areas` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `kefu_areas` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `kefu_areas` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `kefu_areas` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `kefu_areas` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `kefu_areas` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `kefu_areas` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `kefu_areas` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `kefu_areas` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `kefu_areas` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `kefu_areas` VALUES ('1930', '440101', '市辖区', '440100');
INSERT INTO `kefu_areas` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `kefu_areas` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `kefu_areas` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `kefu_areas` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `kefu_areas` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `kefu_areas` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `kefu_areas` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `kefu_areas` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `kefu_areas` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `kefu_areas` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `kefu_areas` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `kefu_areas` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `kefu_areas` VALUES ('1943', '440201', '市辖区', '440200');
INSERT INTO `kefu_areas` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `kefu_areas` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `kefu_areas` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `kefu_areas` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `kefu_areas` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `kefu_areas` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `kefu_areas` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `kefu_areas` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `kefu_areas` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `kefu_areas` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `kefu_areas` VALUES ('1954', '440301', '市辖区', '440300');
INSERT INTO `kefu_areas` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `kefu_areas` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `kefu_areas` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `kefu_areas` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `kefu_areas` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `kefu_areas` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `kefu_areas` VALUES ('1961', '440401', '市辖区', '440400');
INSERT INTO `kefu_areas` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `kefu_areas` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `kefu_areas` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `kefu_areas` VALUES ('1965', '440501', '市辖区', '440500');
INSERT INTO `kefu_areas` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `kefu_areas` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `kefu_areas` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `kefu_areas` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `kefu_areas` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `kefu_areas` VALUES ('1971', '440515', '澄海区', '440500');
INSERT INTO `kefu_areas` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `kefu_areas` VALUES ('1973', '440601', '市辖区', '440600');
INSERT INTO `kefu_areas` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `kefu_areas` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `kefu_areas` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `kefu_areas` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `kefu_areas` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `kefu_areas` VALUES ('1979', '440701', '市辖区', '440700');
INSERT INTO `kefu_areas` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `kefu_areas` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `kefu_areas` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `kefu_areas` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `kefu_areas` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `kefu_areas` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `kefu_areas` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `kefu_areas` VALUES ('1987', '440801', '市辖区', '440800');
INSERT INTO `kefu_areas` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `kefu_areas` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `kefu_areas` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `kefu_areas` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `kefu_areas` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `kefu_areas` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `kefu_areas` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `kefu_areas` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `kefu_areas` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `kefu_areas` VALUES ('1997', '440901', '市辖区', '440900');
INSERT INTO `kefu_areas` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `kefu_areas` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `kefu_areas` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `kefu_areas` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `kefu_areas` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `kefu_areas` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `kefu_areas` VALUES ('2004', '441201', '市辖区', '441200');
INSERT INTO `kefu_areas` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `kefu_areas` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `kefu_areas` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `kefu_areas` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `kefu_areas` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `kefu_areas` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `kefu_areas` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `kefu_areas` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `kefu_areas` VALUES ('2013', '441301', '市辖区', '441300');
INSERT INTO `kefu_areas` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `kefu_areas` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `kefu_areas` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `kefu_areas` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `kefu_areas` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `kefu_areas` VALUES ('2019', '441401', '市辖区', '441400');
INSERT INTO `kefu_areas` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `kefu_areas` VALUES ('2021', '441421', '梅　县', '441400');
INSERT INTO `kefu_areas` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `kefu_areas` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `kefu_areas` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `kefu_areas` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `kefu_areas` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `kefu_areas` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `kefu_areas` VALUES ('2028', '441501', '市辖区', '441500');
INSERT INTO `kefu_areas` VALUES ('2029', '441502', '城　区', '441500');
INSERT INTO `kefu_areas` VALUES ('2030', '441521', '海丰县', '441500');
INSERT INTO `kefu_areas` VALUES ('2031', '441523', '陆河县', '441500');
INSERT INTO `kefu_areas` VALUES ('2032', '441581', '陆丰市', '441500');
INSERT INTO `kefu_areas` VALUES ('2033', '441601', '市辖区', '441600');
INSERT INTO `kefu_areas` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `kefu_areas` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `kefu_areas` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `kefu_areas` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `kefu_areas` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `kefu_areas` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `kefu_areas` VALUES ('2040', '441701', '市辖区', '441700');
INSERT INTO `kefu_areas` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `kefu_areas` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `kefu_areas` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `kefu_areas` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `kefu_areas` VALUES ('2045', '441801', '市辖区', '441800');
INSERT INTO `kefu_areas` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `kefu_areas` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `kefu_areas` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `kefu_areas` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `kefu_areas` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `kefu_areas` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `kefu_areas` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `kefu_areas` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `kefu_areas` VALUES ('2054', '445101', '市辖区', '445100');
INSERT INTO `kefu_areas` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `kefu_areas` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `kefu_areas` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `kefu_areas` VALUES ('2058', '445201', '市辖区', '445200');
INSERT INTO `kefu_areas` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `kefu_areas` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `kefu_areas` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `kefu_areas` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `kefu_areas` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `kefu_areas` VALUES ('2064', '445301', '市辖区', '445300');
INSERT INTO `kefu_areas` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `kefu_areas` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `kefu_areas` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `kefu_areas` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `kefu_areas` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `kefu_areas` VALUES ('2070', '450101', '市辖区', '450100');
INSERT INTO `kefu_areas` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `kefu_areas` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `kefu_areas` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `kefu_areas` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `kefu_areas` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `kefu_areas` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `kefu_areas` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `kefu_areas` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `kefu_areas` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `kefu_areas` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `kefu_areas` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `kefu_areas` VALUES ('2082', '450127', '横　县', '450100');
INSERT INTO `kefu_areas` VALUES ('2083', '450201', '市辖区', '450200');
INSERT INTO `kefu_areas` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `kefu_areas` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `kefu_areas` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `kefu_areas` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `kefu_areas` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `kefu_areas` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `kefu_areas` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `kefu_areas` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `kefu_areas` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `kefu_areas` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `kefu_areas` VALUES ('2094', '450301', '市辖区', '450300');
INSERT INTO `kefu_areas` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `kefu_areas` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `kefu_areas` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `kefu_areas` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `kefu_areas` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `kefu_areas` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `kefu_areas` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `kefu_areas` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `kefu_areas` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `kefu_areas` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `kefu_areas` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `kefu_areas` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `kefu_areas` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `kefu_areas` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `kefu_areas` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `kefu_areas` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `kefu_areas` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `kefu_areas` VALUES ('2112', '450401', '市辖区', '450400');
INSERT INTO `kefu_areas` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `kefu_areas` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `kefu_areas` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `kefu_areas` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `kefu_areas` VALUES ('2117', '450422', '藤　县', '450400');
INSERT INTO `kefu_areas` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `kefu_areas` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `kefu_areas` VALUES ('2120', '450501', '市辖区', '450500');
INSERT INTO `kefu_areas` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `kefu_areas` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `kefu_areas` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `kefu_areas` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `kefu_areas` VALUES ('2125', '450601', '市辖区', '450600');
INSERT INTO `kefu_areas` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `kefu_areas` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `kefu_areas` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `kefu_areas` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `kefu_areas` VALUES ('2130', '450701', '市辖区', '450700');
INSERT INTO `kefu_areas` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `kefu_areas` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `kefu_areas` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `kefu_areas` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `kefu_areas` VALUES ('2135', '450801', '市辖区', '450800');
INSERT INTO `kefu_areas` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `kefu_areas` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `kefu_areas` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `kefu_areas` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `kefu_areas` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `kefu_areas` VALUES ('2141', '450901', '市辖区', '450900');
INSERT INTO `kefu_areas` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `kefu_areas` VALUES ('2143', '450921', '容　县', '450900');
INSERT INTO `kefu_areas` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `kefu_areas` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `kefu_areas` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `kefu_areas` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `kefu_areas` VALUES ('2148', '451001', '市辖区', '451000');
INSERT INTO `kefu_areas` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `kefu_areas` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `kefu_areas` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `kefu_areas` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `kefu_areas` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `kefu_areas` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `kefu_areas` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `kefu_areas` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `kefu_areas` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `kefu_areas` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `kefu_areas` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `kefu_areas` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `kefu_areas` VALUES ('2161', '451101', '市辖区', '451100');
INSERT INTO `kefu_areas` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `kefu_areas` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `kefu_areas` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `kefu_areas` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `kefu_areas` VALUES ('2166', '451201', '市辖区', '451200');
INSERT INTO `kefu_areas` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `kefu_areas` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `kefu_areas` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `kefu_areas` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `kefu_areas` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `kefu_areas` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `kefu_areas` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `kefu_areas` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `kefu_areas` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `kefu_areas` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `kefu_areas` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `kefu_areas` VALUES ('2178', '451301', '市辖区', '451300');
INSERT INTO `kefu_areas` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `kefu_areas` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `kefu_areas` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `kefu_areas` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `kefu_areas` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `kefu_areas` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `kefu_areas` VALUES ('2185', '451401', '市辖区', '451400');
INSERT INTO `kefu_areas` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `kefu_areas` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `kefu_areas` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `kefu_areas` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `kefu_areas` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `kefu_areas` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `kefu_areas` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `kefu_areas` VALUES ('2193', '460101', '市辖区', '460100');
INSERT INTO `kefu_areas` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `kefu_areas` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `kefu_areas` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `kefu_areas` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `kefu_areas` VALUES ('2198', '460201', '市辖区', '460200');
INSERT INTO `kefu_areas` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `kefu_areas` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `kefu_areas` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `kefu_areas` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `kefu_areas` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `kefu_areas` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `kefu_areas` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `kefu_areas` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `kefu_areas` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `kefu_areas` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `kefu_areas` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `kefu_areas` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `kefu_areas` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `kefu_areas` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `kefu_areas` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `kefu_areas` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `kefu_areas` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `kefu_areas` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `kefu_areas` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `kefu_areas` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `kefu_areas` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `kefu_areas` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `kefu_areas` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `kefu_areas` VALUES ('2227', '500110', '万盛区', '500100');
INSERT INTO `kefu_areas` VALUES ('2228', '500111', '双桥区', '500100');
INSERT INTO `kefu_areas` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `kefu_areas` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `kefu_areas` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `kefu_areas` VALUES ('2232', '500115', '长寿区', '500100');
INSERT INTO `kefu_areas` VALUES ('2233', '500222', '綦江县', '500200');
INSERT INTO `kefu_areas` VALUES ('2234', '500223', '潼南县', '500200');
INSERT INTO `kefu_areas` VALUES ('2235', '500224', '铜梁县', '500200');
INSERT INTO `kefu_areas` VALUES ('2236', '500225', '大足县', '500200');
INSERT INTO `kefu_areas` VALUES ('2237', '500226', '荣昌县', '500200');
INSERT INTO `kefu_areas` VALUES ('2238', '500227', '璧山县', '500200');
INSERT INTO `kefu_areas` VALUES ('2239', '500228', '梁平县', '500200');
INSERT INTO `kefu_areas` VALUES ('2240', '500229', '城口县', '500200');
INSERT INTO `kefu_areas` VALUES ('2241', '500230', '丰都县', '500200');
INSERT INTO `kefu_areas` VALUES ('2242', '500231', '垫江县', '500200');
INSERT INTO `kefu_areas` VALUES ('2243', '500232', '武隆县', '500200');
INSERT INTO `kefu_areas` VALUES ('2244', '500233', '忠　县', '500200');
INSERT INTO `kefu_areas` VALUES ('2245', '500234', '开　县', '500200');
INSERT INTO `kefu_areas` VALUES ('2246', '500235', '云阳县', '500200');
INSERT INTO `kefu_areas` VALUES ('2247', '500236', '奉节县', '500200');
INSERT INTO `kefu_areas` VALUES ('2248', '500237', '巫山县', '500200');
INSERT INTO `kefu_areas` VALUES ('2249', '500238', '巫溪县', '500200');
INSERT INTO `kefu_areas` VALUES ('2250', '500240', '石柱土家族自治县', '500200');
INSERT INTO `kefu_areas` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `kefu_areas` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `kefu_areas` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `kefu_areas` VALUES ('2254', '500381', '江津市', '500300');
INSERT INTO `kefu_areas` VALUES ('2255', '500382', '合川市', '500300');
INSERT INTO `kefu_areas` VALUES ('2256', '500383', '永川市', '500300');
INSERT INTO `kefu_areas` VALUES ('2257', '500384', '南川市', '500300');
INSERT INTO `kefu_areas` VALUES ('2258', '510101', '市辖区', '510100');
INSERT INTO `kefu_areas` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `kefu_areas` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `kefu_areas` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `kefu_areas` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `kefu_areas` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `kefu_areas` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `kefu_areas` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `kefu_areas` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `kefu_areas` VALUES ('2267', '510115', '温江县', '510100');
INSERT INTO `kefu_areas` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `kefu_areas` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `kefu_areas` VALUES ('2270', '510124', '郫　县', '510100');
INSERT INTO `kefu_areas` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `kefu_areas` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `kefu_areas` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `kefu_areas` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `kefu_areas` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `kefu_areas` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `kefu_areas` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `kefu_areas` VALUES ('2278', '510301', '市辖区', '510300');
INSERT INTO `kefu_areas` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `kefu_areas` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `kefu_areas` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `kefu_areas` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `kefu_areas` VALUES ('2283', '510321', '荣　县', '510300');
INSERT INTO `kefu_areas` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `kefu_areas` VALUES ('2285', '510401', '市辖区', '510400');
INSERT INTO `kefu_areas` VALUES ('2286', '510402', '东　区', '510400');
INSERT INTO `kefu_areas` VALUES ('2287', '510403', '西　区', '510400');
INSERT INTO `kefu_areas` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `kefu_areas` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `kefu_areas` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `kefu_areas` VALUES ('2291', '510501', '市辖区', '510500');
INSERT INTO `kefu_areas` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `kefu_areas` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `kefu_areas` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `kefu_areas` VALUES ('2295', '510521', '泸　县', '510500');
INSERT INTO `kefu_areas` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `kefu_areas` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `kefu_areas` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `kefu_areas` VALUES ('2299', '510601', '市辖区', '510600');
INSERT INTO `kefu_areas` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `kefu_areas` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `kefu_areas` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `kefu_areas` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `kefu_areas` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `kefu_areas` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `kefu_areas` VALUES ('2306', '510701', '市辖区', '510700');
INSERT INTO `kefu_areas` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `kefu_areas` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `kefu_areas` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `kefu_areas` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `kefu_areas` VALUES ('2311', '510724', '安　县', '510700');
INSERT INTO `kefu_areas` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `kefu_areas` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `kefu_areas` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `kefu_areas` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `kefu_areas` VALUES ('2316', '510801', '市辖区', '510800');
INSERT INTO `kefu_areas` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `kefu_areas` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `kefu_areas` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `kefu_areas` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `kefu_areas` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `kefu_areas` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `kefu_areas` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `kefu_areas` VALUES ('2324', '510901', '市辖区', '510900');
INSERT INTO `kefu_areas` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `kefu_areas` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `kefu_areas` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `kefu_areas` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `kefu_areas` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `kefu_areas` VALUES ('2330', '511001', '市辖区', '511000');
INSERT INTO `kefu_areas` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `kefu_areas` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `kefu_areas` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `kefu_areas` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `kefu_areas` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `kefu_areas` VALUES ('2336', '511101', '市辖区', '511100');
INSERT INTO `kefu_areas` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `kefu_areas` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `kefu_areas` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `kefu_areas` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `kefu_areas` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `kefu_areas` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `kefu_areas` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `kefu_areas` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `kefu_areas` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `kefu_areas` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `kefu_areas` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `kefu_areas` VALUES ('2348', '511301', '市辖区', '511300');
INSERT INTO `kefu_areas` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `kefu_areas` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `kefu_areas` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `kefu_areas` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `kefu_areas` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `kefu_areas` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `kefu_areas` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `kefu_areas` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `kefu_areas` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `kefu_areas` VALUES ('2358', '511401', '市辖区', '511400');
INSERT INTO `kefu_areas` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `kefu_areas` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `kefu_areas` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `kefu_areas` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `kefu_areas` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `kefu_areas` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `kefu_areas` VALUES ('2365', '511501', '市辖区', '511500');
INSERT INTO `kefu_areas` VALUES ('2366', '511502', '翠屏区', '511500');
INSERT INTO `kefu_areas` VALUES ('2367', '511521', '宜宾县', '511500');
INSERT INTO `kefu_areas` VALUES ('2368', '511522', '南溪县', '511500');
INSERT INTO `kefu_areas` VALUES ('2369', '511523', '江安县', '511500');
INSERT INTO `kefu_areas` VALUES ('2370', '511524', '长宁县', '511500');
INSERT INTO `kefu_areas` VALUES ('2371', '511525', '高　县', '511500');
INSERT INTO `kefu_areas` VALUES ('2372', '511526', '珙　县', '511500');
INSERT INTO `kefu_areas` VALUES ('2373', '511527', '筠连县', '511500');
INSERT INTO `kefu_areas` VALUES ('2374', '511528', '兴文县', '511500');
INSERT INTO `kefu_areas` VALUES ('2375', '511529', '屏山县', '511500');
INSERT INTO `kefu_areas` VALUES ('2376', '511601', '市辖区', '511600');
INSERT INTO `kefu_areas` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `kefu_areas` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `kefu_areas` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `kefu_areas` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `kefu_areas` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `kefu_areas` VALUES ('2382', '511701', '市辖区', '511700');
INSERT INTO `kefu_areas` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `kefu_areas` VALUES ('2384', '511721', '达　县', '511700');
INSERT INTO `kefu_areas` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `kefu_areas` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `kefu_areas` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `kefu_areas` VALUES ('2388', '511725', '渠　县', '511700');
INSERT INTO `kefu_areas` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `kefu_areas` VALUES ('2390', '511801', '市辖区', '511800');
INSERT INTO `kefu_areas` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `kefu_areas` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `kefu_areas` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `kefu_areas` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `kefu_areas` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `kefu_areas` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `kefu_areas` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `kefu_areas` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `kefu_areas` VALUES ('2399', '511901', '市辖区', '511900');
INSERT INTO `kefu_areas` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `kefu_areas` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `kefu_areas` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `kefu_areas` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `kefu_areas` VALUES ('2404', '512001', '市辖区', '512000');
INSERT INTO `kefu_areas` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `kefu_areas` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `kefu_areas` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `kefu_areas` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `kefu_areas` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `kefu_areas` VALUES ('2410', '513222', '理　县', '513200');
INSERT INTO `kefu_areas` VALUES ('2411', '513223', '茂　县', '513200');
INSERT INTO `kefu_areas` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `kefu_areas` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `kefu_areas` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `kefu_areas` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `kefu_areas` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `kefu_areas` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `kefu_areas` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `kefu_areas` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `kefu_areas` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `kefu_areas` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `kefu_areas` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `kefu_areas` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `kefu_areas` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `kefu_areas` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `kefu_areas` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `kefu_areas` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `kefu_areas` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `kefu_areas` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `kefu_areas` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `kefu_areas` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `kefu_areas` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `kefu_areas` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `kefu_areas` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `kefu_areas` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `kefu_areas` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `kefu_areas` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `kefu_areas` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `kefu_areas` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `kefu_areas` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `kefu_areas` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `kefu_areas` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `kefu_areas` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `kefu_areas` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `kefu_areas` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `kefu_areas` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `kefu_areas` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `kefu_areas` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `kefu_areas` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `kefu_areas` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `kefu_areas` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `kefu_areas` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `kefu_areas` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `kefu_areas` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `kefu_areas` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `kefu_areas` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `kefu_areas` VALUES ('2457', '520101', '市辖区', '520100');
INSERT INTO `kefu_areas` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `kefu_areas` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `kefu_areas` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `kefu_areas` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `kefu_areas` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `kefu_areas` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `kefu_areas` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `kefu_areas` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `kefu_areas` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `kefu_areas` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `kefu_areas` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `kefu_areas` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `kefu_areas` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `kefu_areas` VALUES ('2471', '520222', '盘　县', '520200');
INSERT INTO `kefu_areas` VALUES ('2472', '520301', '市辖区', '520300');
INSERT INTO `kefu_areas` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `kefu_areas` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `kefu_areas` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `kefu_areas` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `kefu_areas` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `kefu_areas` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `kefu_areas` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `kefu_areas` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `kefu_areas` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `kefu_areas` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `kefu_areas` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `kefu_areas` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `kefu_areas` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `kefu_areas` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `kefu_areas` VALUES ('2487', '520401', '市辖区', '520400');
INSERT INTO `kefu_areas` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `kefu_areas` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `kefu_areas` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `kefu_areas` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `kefu_areas` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `kefu_areas` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `kefu_areas` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `kefu_areas` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `kefu_areas` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `kefu_areas` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `kefu_areas` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `kefu_areas` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `kefu_areas` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `kefu_areas` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `kefu_areas` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `kefu_areas` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `kefu_areas` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `kefu_areas` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `kefu_areas` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `kefu_areas` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `kefu_areas` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `kefu_areas` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `kefu_areas` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `kefu_areas` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `kefu_areas` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `kefu_areas` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `kefu_areas` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `kefu_areas` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `kefu_areas` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `kefu_areas` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `kefu_areas` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `kefu_areas` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `kefu_areas` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `kefu_areas` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `kefu_areas` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `kefu_areas` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `kefu_areas` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `kefu_areas` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `kefu_areas` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `kefu_areas` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `kefu_areas` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `kefu_areas` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `kefu_areas` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `kefu_areas` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `kefu_areas` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `kefu_areas` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `kefu_areas` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `kefu_areas` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `kefu_areas` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `kefu_areas` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `kefu_areas` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `kefu_areas` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `kefu_areas` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `kefu_areas` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `kefu_areas` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `kefu_areas` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `kefu_areas` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `kefu_areas` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `kefu_areas` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `kefu_areas` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `kefu_areas` VALUES ('2548', '530101', '市辖区', '530100');
INSERT INTO `kefu_areas` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `kefu_areas` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `kefu_areas` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `kefu_areas` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `kefu_areas` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `kefu_areas` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `kefu_areas` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `kefu_areas` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `kefu_areas` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `kefu_areas` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `kefu_areas` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `kefu_areas` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `kefu_areas` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `kefu_areas` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `kefu_areas` VALUES ('2563', '530301', '市辖区', '530300');
INSERT INTO `kefu_areas` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `kefu_areas` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `kefu_areas` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `kefu_areas` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `kefu_areas` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `kefu_areas` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `kefu_areas` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `kefu_areas` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `kefu_areas` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `kefu_areas` VALUES ('2573', '530401', '市辖区', '530400');
INSERT INTO `kefu_areas` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `kefu_areas` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `kefu_areas` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `kefu_areas` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `kefu_areas` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `kefu_areas` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `kefu_areas` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `kefu_areas` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `kefu_areas` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `kefu_areas` VALUES ('2583', '530501', '市辖区', '530500');
INSERT INTO `kefu_areas` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `kefu_areas` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `kefu_areas` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `kefu_areas` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `kefu_areas` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `kefu_areas` VALUES ('2589', '530601', '市辖区', '530600');
INSERT INTO `kefu_areas` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `kefu_areas` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `kefu_areas` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `kefu_areas` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `kefu_areas` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `kefu_areas` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `kefu_areas` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `kefu_areas` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `kefu_areas` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `kefu_areas` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `kefu_areas` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `kefu_areas` VALUES ('2601', '530701', '市辖区', '530700');
INSERT INTO `kefu_areas` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `kefu_areas` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `kefu_areas` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `kefu_areas` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `kefu_areas` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `kefu_areas` VALUES ('2607', '530801', '市辖区', '530800');
INSERT INTO `kefu_areas` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `kefu_areas` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `kefu_areas` VALUES ('2618', '530901', '市辖区', '530900');
INSERT INTO `kefu_areas` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `kefu_areas` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `kefu_areas` VALUES ('2621', '530922', '云　县', '530900');
INSERT INTO `kefu_areas` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `kefu_areas` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `kefu_areas` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `kefu_areas` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `kefu_areas` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `kefu_areas` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `kefu_areas` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `kefu_areas` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `kefu_areas` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `kefu_areas` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `kefu_areas` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `kefu_areas` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `kefu_areas` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `kefu_areas` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `kefu_areas` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `kefu_areas` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `kefu_areas` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `kefu_areas` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `kefu_areas` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `kefu_areas` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `kefu_areas` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `kefu_areas` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `kefu_areas` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `kefu_areas` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `kefu_areas` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `kefu_areas` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `kefu_areas` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `kefu_areas` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `kefu_areas` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `kefu_areas` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `kefu_areas` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `kefu_areas` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `kefu_areas` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `kefu_areas` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `kefu_areas` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `kefu_areas` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `kefu_areas` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `kefu_areas` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `kefu_areas` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `kefu_areas` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `kefu_areas` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `kefu_areas` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `kefu_areas` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `kefu_areas` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `kefu_areas` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `kefu_areas` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `kefu_areas` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `kefu_areas` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `kefu_areas` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `kefu_areas` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `kefu_areas` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `kefu_areas` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `kefu_areas` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `kefu_areas` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `kefu_areas` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `kefu_areas` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `kefu_areas` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `kefu_areas` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `kefu_areas` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `kefu_areas` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `kefu_areas` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `kefu_areas` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `kefu_areas` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `kefu_areas` VALUES ('2685', '540101', '市辖区', '540100');
INSERT INTO `kefu_areas` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `kefu_areas` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `kefu_areas` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `kefu_areas` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `kefu_areas` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `kefu_areas` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `kefu_areas` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `kefu_areas` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `kefu_areas` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `kefu_areas` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `kefu_areas` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `kefu_areas` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `kefu_areas` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `kefu_areas` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `kefu_areas` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `kefu_areas` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `kefu_areas` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `kefu_areas` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `kefu_areas` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `kefu_areas` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `kefu_areas` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `kefu_areas` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `kefu_areas` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `kefu_areas` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `kefu_areas` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `kefu_areas` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `kefu_areas` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `kefu_areas` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `kefu_areas` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `kefu_areas` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `kefu_areas` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `kefu_areas` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `kefu_areas` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `kefu_areas` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `kefu_areas` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `kefu_areas` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `kefu_areas` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `kefu_areas` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `kefu_areas` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `kefu_areas` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `kefu_areas` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `kefu_areas` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `kefu_areas` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `kefu_areas` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `kefu_areas` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `kefu_areas` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `kefu_areas` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `kefu_areas` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `kefu_areas` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `kefu_areas` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `kefu_areas` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `kefu_areas` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `kefu_areas` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `kefu_areas` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `kefu_areas` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `kefu_areas` VALUES ('2741', '542427', '索　县', '542400');
INSERT INTO `kefu_areas` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `kefu_areas` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `kefu_areas` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `kefu_areas` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `kefu_areas` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `kefu_areas` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `kefu_areas` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `kefu_areas` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `kefu_areas` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `kefu_areas` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `kefu_areas` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `kefu_areas` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `kefu_areas` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `kefu_areas` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `kefu_areas` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `kefu_areas` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `kefu_areas` VALUES ('2758', '542627', '朗　县', '542600');
INSERT INTO `kefu_areas` VALUES ('2759', '610101', '市辖区', '610100');
INSERT INTO `kefu_areas` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `kefu_areas` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `kefu_areas` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `kefu_areas` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `kefu_areas` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `kefu_areas` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `kefu_areas` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `kefu_areas` VALUES ('2767', '610115', '临潼区', '610100');
INSERT INTO `kefu_areas` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `kefu_areas` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `kefu_areas` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `kefu_areas` VALUES ('2771', '610125', '户　县', '610100');
INSERT INTO `kefu_areas` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `kefu_areas` VALUES ('2773', '610201', '市辖区', '610200');
INSERT INTO `kefu_areas` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `kefu_areas` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `kefu_areas` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `kefu_areas` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `kefu_areas` VALUES ('2778', '610301', '市辖区', '610300');
INSERT INTO `kefu_areas` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `kefu_areas` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `kefu_areas` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `kefu_areas` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `kefu_areas` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `kefu_areas` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `kefu_areas` VALUES ('2785', '610326', '眉　县', '610300');
INSERT INTO `kefu_areas` VALUES ('2786', '610327', '陇　县', '610300');
INSERT INTO `kefu_areas` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `kefu_areas` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `kefu_areas` VALUES ('2789', '610330', '凤　县', '610300');
INSERT INTO `kefu_areas` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `kefu_areas` VALUES ('2791', '610401', '市辖区', '610400');
INSERT INTO `kefu_areas` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `kefu_areas` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `kefu_areas` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `kefu_areas` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `kefu_areas` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `kefu_areas` VALUES ('2797', '610424', '乾　县', '610400');
INSERT INTO `kefu_areas` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `kefu_areas` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `kefu_areas` VALUES ('2800', '610427', '彬　县', '610400');
INSERT INTO `kefu_areas` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `kefu_areas` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `kefu_areas` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `kefu_areas` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `kefu_areas` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `kefu_areas` VALUES ('2806', '610501', '市辖区', '610500');
INSERT INTO `kefu_areas` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `kefu_areas` VALUES ('2808', '610521', '华　县', '610500');
INSERT INTO `kefu_areas` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `kefu_areas` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `kefu_areas` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `kefu_areas` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `kefu_areas` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `kefu_areas` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `kefu_areas` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `kefu_areas` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `kefu_areas` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `kefu_areas` VALUES ('2818', '610601', '市辖区', '610600');
INSERT INTO `kefu_areas` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `kefu_areas` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `kefu_areas` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `kefu_areas` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `kefu_areas` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `kefu_areas` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `kefu_areas` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `kefu_areas` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `kefu_areas` VALUES ('2827', '610628', '富　县', '610600');
INSERT INTO `kefu_areas` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `kefu_areas` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `kefu_areas` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `kefu_areas` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `kefu_areas` VALUES ('2832', '610701', '市辖区', '610700');
INSERT INTO `kefu_areas` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `kefu_areas` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `kefu_areas` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `kefu_areas` VALUES ('2836', '610723', '洋　县', '610700');
INSERT INTO `kefu_areas` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `kefu_areas` VALUES ('2838', '610725', '勉　县', '610700');
INSERT INTO `kefu_areas` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `kefu_areas` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `kefu_areas` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `kefu_areas` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `kefu_areas` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `kefu_areas` VALUES ('2844', '610801', '市辖区', '610800');
INSERT INTO `kefu_areas` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `kefu_areas` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `kefu_areas` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `kefu_areas` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `kefu_areas` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `kefu_areas` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `kefu_areas` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `kefu_areas` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `kefu_areas` VALUES ('2853', '610828', '佳　县', '610800');
INSERT INTO `kefu_areas` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `kefu_areas` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `kefu_areas` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `kefu_areas` VALUES ('2857', '610901', '市辖区', '610900');
INSERT INTO `kefu_areas` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `kefu_areas` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `kefu_areas` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `kefu_areas` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `kefu_areas` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `kefu_areas` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `kefu_areas` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `kefu_areas` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `kefu_areas` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `kefu_areas` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `kefu_areas` VALUES ('2868', '611001', '市辖区', '611000');
INSERT INTO `kefu_areas` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `kefu_areas` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `kefu_areas` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `kefu_areas` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `kefu_areas` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `kefu_areas` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `kefu_areas` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `kefu_areas` VALUES ('2876', '620101', '市辖区', '620100');
INSERT INTO `kefu_areas` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `kefu_areas` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `kefu_areas` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `kefu_areas` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `kefu_areas` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `kefu_areas` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `kefu_areas` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `kefu_areas` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `kefu_areas` VALUES ('2885', '620201', '市辖区', '620200');
INSERT INTO `kefu_areas` VALUES ('2886', '620301', '市辖区', '620300');
INSERT INTO `kefu_areas` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `kefu_areas` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `kefu_areas` VALUES ('2889', '620401', '市辖区', '620400');
INSERT INTO `kefu_areas` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `kefu_areas` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `kefu_areas` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `kefu_areas` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `kefu_areas` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `kefu_areas` VALUES ('2895', '620501', '市辖区', '620500');
INSERT INTO `kefu_areas` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `kefu_areas` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `kefu_areas` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `kefu_areas` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `kefu_areas` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `kefu_areas` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `kefu_areas` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `kefu_areas` VALUES ('2903', '620601', '市辖区', '620600');
INSERT INTO `kefu_areas` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `kefu_areas` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `kefu_areas` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `kefu_areas` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `kefu_areas` VALUES ('2908', '620701', '市辖区', '620700');
INSERT INTO `kefu_areas` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `kefu_areas` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `kefu_areas` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `kefu_areas` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `kefu_areas` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `kefu_areas` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `kefu_areas` VALUES ('2915', '620801', '市辖区', '620800');
INSERT INTO `kefu_areas` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `kefu_areas` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `kefu_areas` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `kefu_areas` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `kefu_areas` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `kefu_areas` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `kefu_areas` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `kefu_areas` VALUES ('2923', '620901', '市辖区', '620900');
INSERT INTO `kefu_areas` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `kefu_areas` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `kefu_areas` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `kefu_areas` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `kefu_areas` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `kefu_areas` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `kefu_areas` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `kefu_areas` VALUES ('2931', '621001', '市辖区', '621000');
INSERT INTO `kefu_areas` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `kefu_areas` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `kefu_areas` VALUES ('2934', '621022', '环　县', '621000');
INSERT INTO `kefu_areas` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `kefu_areas` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `kefu_areas` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `kefu_areas` VALUES ('2938', '621026', '宁　县', '621000');
INSERT INTO `kefu_areas` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `kefu_areas` VALUES ('2940', '621101', '市辖区', '621100');
INSERT INTO `kefu_areas` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `kefu_areas` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `kefu_areas` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `kefu_areas` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `kefu_areas` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `kefu_areas` VALUES ('2946', '621125', '漳　县', '621100');
INSERT INTO `kefu_areas` VALUES ('2947', '621126', '岷　县', '621100');
INSERT INTO `kefu_areas` VALUES ('2948', '621201', '市辖区', '621200');
INSERT INTO `kefu_areas` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `kefu_areas` VALUES ('2950', '621221', '成　县', '621200');
INSERT INTO `kefu_areas` VALUES ('2951', '621222', '文　县', '621200');
INSERT INTO `kefu_areas` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `kefu_areas` VALUES ('2953', '621224', '康　县', '621200');
INSERT INTO `kefu_areas` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `kefu_areas` VALUES ('2955', '621226', '礼　县', '621200');
INSERT INTO `kefu_areas` VALUES ('2956', '621227', '徽　县', '621200');
INSERT INTO `kefu_areas` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `kefu_areas` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `kefu_areas` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `kefu_areas` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `kefu_areas` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `kefu_areas` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `kefu_areas` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `kefu_areas` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `kefu_areas` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `kefu_areas` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `kefu_areas` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `kefu_areas` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `kefu_areas` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `kefu_areas` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `kefu_areas` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `kefu_areas` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `kefu_areas` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `kefu_areas` VALUES ('2974', '630101', '市辖区', '630100');
INSERT INTO `kefu_areas` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `kefu_areas` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `kefu_areas` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `kefu_areas` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `kefu_areas` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `kefu_areas` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `kefu_areas` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `kefu_areas` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `kefu_areas` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `kefu_areas` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `kefu_areas` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `kefu_areas` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `kefu_areas` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `kefu_areas` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `kefu_areas` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `kefu_areas` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `kefu_areas` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `kefu_areas` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `kefu_areas` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `kefu_areas` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `kefu_areas` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `kefu_areas` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `kefu_areas` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `kefu_areas` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `kefu_areas` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `kefu_areas` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `kefu_areas` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `kefu_areas` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `kefu_areas` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `kefu_areas` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `kefu_areas` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `kefu_areas` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `kefu_areas` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `kefu_areas` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `kefu_areas` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `kefu_areas` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `kefu_areas` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `kefu_areas` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `kefu_areas` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `kefu_areas` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `kefu_areas` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `kefu_areas` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `kefu_areas` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `kefu_areas` VALUES ('3018', '640101', '市辖区', '640100');
INSERT INTO `kefu_areas` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `kefu_areas` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `kefu_areas` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `kefu_areas` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `kefu_areas` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `kefu_areas` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `kefu_areas` VALUES ('3025', '640201', '市辖区', '640200');
INSERT INTO `kefu_areas` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `kefu_areas` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `kefu_areas` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `kefu_areas` VALUES ('3029', '640301', '市辖区', '640300');
INSERT INTO `kefu_areas` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `kefu_areas` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `kefu_areas` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `kefu_areas` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `kefu_areas` VALUES ('3034', '640401', '市辖区', '640400');
INSERT INTO `kefu_areas` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `kefu_areas` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `kefu_areas` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `kefu_areas` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `kefu_areas` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `kefu_areas` VALUES ('3040', '640501', '市辖区', '640500');
INSERT INTO `kefu_areas` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `kefu_areas` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `kefu_areas` VALUES ('3043', '640522', '海原县', '640400');
INSERT INTO `kefu_areas` VALUES ('3044', '650101', '市辖区', '650100');
INSERT INTO `kefu_areas` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `kefu_areas` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `kefu_areas` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `kefu_areas` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `kefu_areas` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `kefu_areas` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `kefu_areas` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `kefu_areas` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `kefu_areas` VALUES ('3053', '650201', '市辖区', '650200');
INSERT INTO `kefu_areas` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `kefu_areas` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `kefu_areas` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `kefu_areas` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `kefu_areas` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `kefu_areas` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `kefu_areas` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `kefu_areas` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `kefu_areas` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `kefu_areas` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `kefu_areas` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `kefu_areas` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `kefu_areas` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `kefu_areas` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `kefu_areas` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `kefu_areas` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `kefu_areas` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `kefu_areas` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `kefu_areas` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `kefu_areas` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `kefu_areas` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `kefu_areas` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `kefu_areas` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `kefu_areas` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `kefu_areas` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `kefu_areas` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `kefu_areas` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `kefu_areas` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `kefu_areas` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `kefu_areas` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `kefu_areas` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `kefu_areas` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `kefu_areas` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `kefu_areas` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `kefu_areas` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `kefu_areas` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `kefu_areas` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `kefu_areas` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `kefu_areas` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `kefu_areas` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `kefu_areas` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `kefu_areas` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `kefu_areas` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `kefu_areas` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `kefu_areas` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `kefu_areas` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `kefu_areas` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `kefu_areas` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `kefu_areas` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `kefu_areas` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `kefu_areas` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `kefu_areas` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `kefu_areas` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `kefu_areas` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `kefu_areas` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `kefu_areas` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `kefu_areas` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `kefu_areas` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `kefu_areas` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `kefu_areas` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `kefu_areas` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `kefu_areas` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `kefu_areas` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `kefu_areas` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `kefu_areas` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `kefu_areas` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `kefu_areas` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `kefu_areas` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `kefu_areas` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `kefu_areas` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `kefu_areas` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `kefu_areas` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `kefu_areas` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `kefu_areas` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `kefu_areas` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `kefu_areas` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `kefu_areas` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `kefu_areas` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `kefu_areas` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `kefu_areas` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `kefu_areas` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `kefu_areas` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `kefu_areas` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `kefu_areas` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `kefu_areas` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `kefu_areas` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `kefu_areas` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `kefu_areas` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `kefu_areas` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `kefu_areas` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `kefu_areas` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for kefu_cities
-- ----------------------------
DROP TABLE IF EXISTS `kefu_cities`;
CREATE TABLE `kefu_cities` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `cityCode` varchar(20) NOT NULL,
  `cityName` varchar(50) NOT NULL,
  `provinceCode` varchar(20) NOT NULL,
  PRIMARY KEY (`cityId`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='行政区域地州市信息表';

-- ----------------------------
-- Records of kefu_cities
-- ----------------------------
INSERT INTO `kefu_cities` VALUES ('1', '110100', '市辖区', '110000');
INSERT INTO `kefu_cities` VALUES ('2', '110200', '县', '110000');
INSERT INTO `kefu_cities` VALUES ('3', '120100', '市辖区', '120000');
INSERT INTO `kefu_cities` VALUES ('4', '120200', '县', '120000');
INSERT INTO `kefu_cities` VALUES ('5', '130100', '石家庄市', '130000');
INSERT INTO `kefu_cities` VALUES ('6', '130200', '唐山市', '130000');
INSERT INTO `kefu_cities` VALUES ('7', '130300', '秦皇岛市', '130000');
INSERT INTO `kefu_cities` VALUES ('8', '130400', '邯郸市', '130000');
INSERT INTO `kefu_cities` VALUES ('9', '130500', '邢台市', '130000');
INSERT INTO `kefu_cities` VALUES ('10', '130600', '保定市', '130000');
INSERT INTO `kefu_cities` VALUES ('11', '130700', '张家口市', '130000');
INSERT INTO `kefu_cities` VALUES ('12', '130800', '承德市', '130000');
INSERT INTO `kefu_cities` VALUES ('13', '130900', '沧州市', '130000');
INSERT INTO `kefu_cities` VALUES ('14', '131000', '廊坊市', '130000');
INSERT INTO `kefu_cities` VALUES ('15', '131100', '衡水市', '130000');
INSERT INTO `kefu_cities` VALUES ('16', '140100', '太原市', '140000');
INSERT INTO `kefu_cities` VALUES ('17', '140200', '大同市', '140000');
INSERT INTO `kefu_cities` VALUES ('18', '140300', '阳泉市', '140000');
INSERT INTO `kefu_cities` VALUES ('19', '140400', '长治市', '140000');
INSERT INTO `kefu_cities` VALUES ('20', '140500', '晋城市', '140000');
INSERT INTO `kefu_cities` VALUES ('21', '140600', '朔州市', '140000');
INSERT INTO `kefu_cities` VALUES ('22', '140700', '晋中市', '140000');
INSERT INTO `kefu_cities` VALUES ('23', '140800', '运城市', '140000');
INSERT INTO `kefu_cities` VALUES ('24', '140900', '忻州市', '140000');
INSERT INTO `kefu_cities` VALUES ('25', '141000', '临汾市', '140000');
INSERT INTO `kefu_cities` VALUES ('26', '141100', '吕梁市', '140000');
INSERT INTO `kefu_cities` VALUES ('27', '150100', '呼和浩特市', '150000');
INSERT INTO `kefu_cities` VALUES ('28', '150200', '包头市', '150000');
INSERT INTO `kefu_cities` VALUES ('29', '150300', '乌海市', '150000');
INSERT INTO `kefu_cities` VALUES ('30', '150400', '赤峰市', '150000');
INSERT INTO `kefu_cities` VALUES ('31', '150500', '通辽市', '150000');
INSERT INTO `kefu_cities` VALUES ('32', '150600', '鄂尔多斯市', '150000');
INSERT INTO `kefu_cities` VALUES ('33', '150700', '呼伦贝尔市', '150000');
INSERT INTO `kefu_cities` VALUES ('34', '150800', '巴彦淖尔市', '150000');
INSERT INTO `kefu_cities` VALUES ('35', '150900', '乌兰察布市', '150000');
INSERT INTO `kefu_cities` VALUES ('36', '152200', '兴安盟', '150000');
INSERT INTO `kefu_cities` VALUES ('37', '152500', '锡林郭勒盟', '150000');
INSERT INTO `kefu_cities` VALUES ('38', '152900', '阿拉善盟', '150000');
INSERT INTO `kefu_cities` VALUES ('39', '210100', '沈阳市', '210000');
INSERT INTO `kefu_cities` VALUES ('40', '210200', '大连市', '210000');
INSERT INTO `kefu_cities` VALUES ('41', '210300', '鞍山市', '210000');
INSERT INTO `kefu_cities` VALUES ('42', '210400', '抚顺市', '210000');
INSERT INTO `kefu_cities` VALUES ('43', '210500', '本溪市', '210000');
INSERT INTO `kefu_cities` VALUES ('44', '210600', '丹东市', '210000');
INSERT INTO `kefu_cities` VALUES ('45', '210700', '锦州市', '210000');
INSERT INTO `kefu_cities` VALUES ('46', '210800', '营口市', '210000');
INSERT INTO `kefu_cities` VALUES ('47', '210900', '阜新市', '210000');
INSERT INTO `kefu_cities` VALUES ('48', '211000', '辽阳市', '210000');
INSERT INTO `kefu_cities` VALUES ('49', '211100', '盘锦市', '210000');
INSERT INTO `kefu_cities` VALUES ('50', '211200', '铁岭市', '210000');
INSERT INTO `kefu_cities` VALUES ('51', '211300', '朝阳市', '210000');
INSERT INTO `kefu_cities` VALUES ('52', '211400', '葫芦岛市', '210000');
INSERT INTO `kefu_cities` VALUES ('53', '220100', '长春市', '220000');
INSERT INTO `kefu_cities` VALUES ('54', '220200', '吉林市', '220000');
INSERT INTO `kefu_cities` VALUES ('55', '220300', '四平市', '220000');
INSERT INTO `kefu_cities` VALUES ('56', '220400', '辽源市', '220000');
INSERT INTO `kefu_cities` VALUES ('57', '220500', '通化市', '220000');
INSERT INTO `kefu_cities` VALUES ('58', '220600', '白山市', '220000');
INSERT INTO `kefu_cities` VALUES ('59', '220700', '松原市', '220000');
INSERT INTO `kefu_cities` VALUES ('60', '220800', '白城市', '220000');
INSERT INTO `kefu_cities` VALUES ('61', '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `kefu_cities` VALUES ('62', '230100', '哈尔滨市', '230000');
INSERT INTO `kefu_cities` VALUES ('63', '230200', '齐齐哈尔市', '230000');
INSERT INTO `kefu_cities` VALUES ('64', '230300', '鸡西市', '230000');
INSERT INTO `kefu_cities` VALUES ('65', '230400', '鹤岗市', '230000');
INSERT INTO `kefu_cities` VALUES ('66', '230500', '双鸭山市', '230000');
INSERT INTO `kefu_cities` VALUES ('67', '230600', '大庆市', '230000');
INSERT INTO `kefu_cities` VALUES ('68', '230700', '伊春市', '230000');
INSERT INTO `kefu_cities` VALUES ('69', '230800', '佳木斯市', '230000');
INSERT INTO `kefu_cities` VALUES ('70', '230900', '七台河市', '230000');
INSERT INTO `kefu_cities` VALUES ('71', '231000', '牡丹江市', '230000');
INSERT INTO `kefu_cities` VALUES ('72', '231100', '黑河市', '230000');
INSERT INTO `kefu_cities` VALUES ('73', '231200', '绥化市', '230000');
INSERT INTO `kefu_cities` VALUES ('74', '232700', '大兴安岭地区', '230000');
INSERT INTO `kefu_cities` VALUES ('75', '310100', '市辖区', '310000');
INSERT INTO `kefu_cities` VALUES ('76', '310200', '县', '310000');
INSERT INTO `kefu_cities` VALUES ('77', '320100', '南京市', '320000');
INSERT INTO `kefu_cities` VALUES ('78', '320200', '无锡市', '320000');
INSERT INTO `kefu_cities` VALUES ('79', '320300', '徐州市', '320000');
INSERT INTO `kefu_cities` VALUES ('80', '320400', '常州市', '320000');
INSERT INTO `kefu_cities` VALUES ('81', '320500', '苏州市', '320000');
INSERT INTO `kefu_cities` VALUES ('82', '320600', '南通市', '320000');
INSERT INTO `kefu_cities` VALUES ('83', '320700', '连云港市', '320000');
INSERT INTO `kefu_cities` VALUES ('84', '320800', '淮安市', '320000');
INSERT INTO `kefu_cities` VALUES ('85', '320900', '盐城市', '320000');
INSERT INTO `kefu_cities` VALUES ('86', '321000', '扬州市', '320000');
INSERT INTO `kefu_cities` VALUES ('87', '321100', '镇江市', '320000');
INSERT INTO `kefu_cities` VALUES ('88', '321200', '泰州市', '320000');
INSERT INTO `kefu_cities` VALUES ('89', '321300', '宿迁市', '320000');
INSERT INTO `kefu_cities` VALUES ('90', '330100', '杭州市', '330000');
INSERT INTO `kefu_cities` VALUES ('91', '330200', '宁波市', '330000');
INSERT INTO `kefu_cities` VALUES ('92', '330300', '温州市', '330000');
INSERT INTO `kefu_cities` VALUES ('93', '330400', '嘉兴市', '330000');
INSERT INTO `kefu_cities` VALUES ('94', '330500', '湖州市', '330000');
INSERT INTO `kefu_cities` VALUES ('95', '330600', '绍兴市', '330000');
INSERT INTO `kefu_cities` VALUES ('96', '330700', '金华市', '330000');
INSERT INTO `kefu_cities` VALUES ('97', '330800', '衢州市', '330000');
INSERT INTO `kefu_cities` VALUES ('98', '330900', '舟山市', '330000');
INSERT INTO `kefu_cities` VALUES ('99', '331000', '台州市', '330000');
INSERT INTO `kefu_cities` VALUES ('100', '331100', '丽水市', '330000');
INSERT INTO `kefu_cities` VALUES ('101', '340100', '合肥市', '340000');
INSERT INTO `kefu_cities` VALUES ('102', '340200', '芜湖市', '340000');
INSERT INTO `kefu_cities` VALUES ('103', '340300', '蚌埠市', '340000');
INSERT INTO `kefu_cities` VALUES ('104', '340400', '淮南市', '340000');
INSERT INTO `kefu_cities` VALUES ('105', '340500', '马鞍山市', '340000');
INSERT INTO `kefu_cities` VALUES ('106', '340600', '淮北市', '340000');
INSERT INTO `kefu_cities` VALUES ('107', '340700', '铜陵市', '340000');
INSERT INTO `kefu_cities` VALUES ('108', '340800', '安庆市', '340000');
INSERT INTO `kefu_cities` VALUES ('109', '341000', '黄山市', '340000');
INSERT INTO `kefu_cities` VALUES ('110', '341100', '滁州市', '340000');
INSERT INTO `kefu_cities` VALUES ('111', '341200', '阜阳市', '340000');
INSERT INTO `kefu_cities` VALUES ('112', '341300', '宿州市', '340000');
INSERT INTO `kefu_cities` VALUES ('113', '341400', '巢湖市', '340000');
INSERT INTO `kefu_cities` VALUES ('114', '341500', '六安市', '340000');
INSERT INTO `kefu_cities` VALUES ('115', '341600', '亳州市', '340000');
INSERT INTO `kefu_cities` VALUES ('116', '341700', '池州市', '340000');
INSERT INTO `kefu_cities` VALUES ('117', '341800', '宣城市', '340000');
INSERT INTO `kefu_cities` VALUES ('118', '350100', '福州市', '350000');
INSERT INTO `kefu_cities` VALUES ('119', '350200', '厦门市', '350000');
INSERT INTO `kefu_cities` VALUES ('120', '350300', '莆田市', '350000');
INSERT INTO `kefu_cities` VALUES ('121', '350400', '三明市', '350000');
INSERT INTO `kefu_cities` VALUES ('122', '350500', '泉州市', '350000');
INSERT INTO `kefu_cities` VALUES ('123', '350600', '漳州市', '350000');
INSERT INTO `kefu_cities` VALUES ('124', '350700', '南平市', '350000');
INSERT INTO `kefu_cities` VALUES ('125', '350800', '龙岩市', '350000');
INSERT INTO `kefu_cities` VALUES ('126', '350900', '宁德市', '350000');
INSERT INTO `kefu_cities` VALUES ('127', '360100', '南昌市', '360000');
INSERT INTO `kefu_cities` VALUES ('128', '360200', '景德镇市', '360000');
INSERT INTO `kefu_cities` VALUES ('129', '360300', '萍乡市', '360000');
INSERT INTO `kefu_cities` VALUES ('130', '360400', '九江市', '360000');
INSERT INTO `kefu_cities` VALUES ('131', '360500', '新余市', '360000');
INSERT INTO `kefu_cities` VALUES ('132', '360600', '鹰潭市', '360000');
INSERT INTO `kefu_cities` VALUES ('133', '360700', '赣州市', '360000');
INSERT INTO `kefu_cities` VALUES ('134', '360800', '吉安市', '360000');
INSERT INTO `kefu_cities` VALUES ('135', '360900', '宜春市', '360000');
INSERT INTO `kefu_cities` VALUES ('136', '361000', '抚州市', '360000');
INSERT INTO `kefu_cities` VALUES ('137', '361100', '上饶市', '360000');
INSERT INTO `kefu_cities` VALUES ('138', '370100', '济南市', '370000');
INSERT INTO `kefu_cities` VALUES ('139', '370200', '青岛市', '370000');
INSERT INTO `kefu_cities` VALUES ('140', '370300', '淄博市', '370000');
INSERT INTO `kefu_cities` VALUES ('141', '370400', '枣庄市', '370000');
INSERT INTO `kefu_cities` VALUES ('142', '370500', '东营市', '370000');
INSERT INTO `kefu_cities` VALUES ('143', '370600', '烟台市', '370000');
INSERT INTO `kefu_cities` VALUES ('144', '370700', '潍坊市', '370000');
INSERT INTO `kefu_cities` VALUES ('145', '370800', '济宁市', '370000');
INSERT INTO `kefu_cities` VALUES ('146', '370900', '泰安市', '370000');
INSERT INTO `kefu_cities` VALUES ('147', '371000', '威海市', '370000');
INSERT INTO `kefu_cities` VALUES ('148', '371100', '日照市', '370000');
INSERT INTO `kefu_cities` VALUES ('149', '371200', '莱芜市', '370000');
INSERT INTO `kefu_cities` VALUES ('150', '371300', '临沂市', '370000');
INSERT INTO `kefu_cities` VALUES ('151', '371400', '德州市', '370000');
INSERT INTO `kefu_cities` VALUES ('152', '371500', '聊城市', '370000');
INSERT INTO `kefu_cities` VALUES ('153', '371600', '滨州市', '370000');
INSERT INTO `kefu_cities` VALUES ('154', '371700', '荷泽市', '370000');
INSERT INTO `kefu_cities` VALUES ('155', '410100', '郑州市', '410000');
INSERT INTO `kefu_cities` VALUES ('156', '410200', '开封市', '410000');
INSERT INTO `kefu_cities` VALUES ('157', '410300', '洛阳市', '410000');
INSERT INTO `kefu_cities` VALUES ('158', '410400', '平顶山市', '410000');
INSERT INTO `kefu_cities` VALUES ('159', '410500', '安阳市', '410000');
INSERT INTO `kefu_cities` VALUES ('160', '410600', '鹤壁市', '410000');
INSERT INTO `kefu_cities` VALUES ('161', '410700', '新乡市', '410000');
INSERT INTO `kefu_cities` VALUES ('162', '410800', '焦作市', '410000');
INSERT INTO `kefu_cities` VALUES ('163', '410900', '濮阳市', '410000');
INSERT INTO `kefu_cities` VALUES ('164', '411000', '许昌市', '410000');
INSERT INTO `kefu_cities` VALUES ('165', '411100', '漯河市', '410000');
INSERT INTO `kefu_cities` VALUES ('166', '411200', '三门峡市', '410000');
INSERT INTO `kefu_cities` VALUES ('167', '411300', '南阳市', '410000');
INSERT INTO `kefu_cities` VALUES ('168', '411400', '商丘市', '410000');
INSERT INTO `kefu_cities` VALUES ('169', '411500', '信阳市', '410000');
INSERT INTO `kefu_cities` VALUES ('170', '411600', '周口市', '410000');
INSERT INTO `kefu_cities` VALUES ('171', '411700', '驻马店市', '410000');
INSERT INTO `kefu_cities` VALUES ('172', '420100', '武汉市', '420000');
INSERT INTO `kefu_cities` VALUES ('173', '420200', '黄石市', '420000');
INSERT INTO `kefu_cities` VALUES ('174', '420300', '十堰市', '420000');
INSERT INTO `kefu_cities` VALUES ('175', '420500', '宜昌市', '420000');
INSERT INTO `kefu_cities` VALUES ('176', '420600', '襄樊市', '420000');
INSERT INTO `kefu_cities` VALUES ('177', '420700', '鄂州市', '420000');
INSERT INTO `kefu_cities` VALUES ('178', '420800', '荆门市', '420000');
INSERT INTO `kefu_cities` VALUES ('179', '420900', '孝感市', '420000');
INSERT INTO `kefu_cities` VALUES ('180', '421000', '荆州市', '420000');
INSERT INTO `kefu_cities` VALUES ('181', '421100', '黄冈市', '420000');
INSERT INTO `kefu_cities` VALUES ('182', '421200', '咸宁市', '420000');
INSERT INTO `kefu_cities` VALUES ('183', '421300', '随州市', '420000');
INSERT INTO `kefu_cities` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `kefu_cities` VALUES ('185', '429000', '省直辖行政单位', '420000');
INSERT INTO `kefu_cities` VALUES ('186', '430100', '长沙市', '430000');
INSERT INTO `kefu_cities` VALUES ('187', '430200', '株洲市', '430000');
INSERT INTO `kefu_cities` VALUES ('188', '430300', '湘潭市', '430000');
INSERT INTO `kefu_cities` VALUES ('189', '430400', '衡阳市', '430000');
INSERT INTO `kefu_cities` VALUES ('190', '430500', '邵阳市', '430000');
INSERT INTO `kefu_cities` VALUES ('191', '430600', '岳阳市', '430000');
INSERT INTO `kefu_cities` VALUES ('192', '430700', '常德市', '430000');
INSERT INTO `kefu_cities` VALUES ('193', '430800', '张家界市', '430000');
INSERT INTO `kefu_cities` VALUES ('194', '430900', '益阳市', '430000');
INSERT INTO `kefu_cities` VALUES ('195', '431000', '郴州市', '430000');
INSERT INTO `kefu_cities` VALUES ('196', '431100', '永州市', '430000');
INSERT INTO `kefu_cities` VALUES ('197', '431200', '怀化市', '430000');
INSERT INTO `kefu_cities` VALUES ('198', '431300', '娄底市', '430000');
INSERT INTO `kefu_cities` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `kefu_cities` VALUES ('200', '440100', '广州市', '440000');
INSERT INTO `kefu_cities` VALUES ('201', '440200', '韶关市', '440000');
INSERT INTO `kefu_cities` VALUES ('202', '440300', '深圳市', '440000');
INSERT INTO `kefu_cities` VALUES ('203', '440400', '珠海市', '440000');
INSERT INTO `kefu_cities` VALUES ('204', '440500', '汕头市', '440000');
INSERT INTO `kefu_cities` VALUES ('205', '440600', '佛山市', '440000');
INSERT INTO `kefu_cities` VALUES ('206', '440700', '江门市', '440000');
INSERT INTO `kefu_cities` VALUES ('207', '440800', '湛江市', '440000');
INSERT INTO `kefu_cities` VALUES ('208', '440900', '茂名市', '440000');
INSERT INTO `kefu_cities` VALUES ('209', '441200', '肇庆市', '440000');
INSERT INTO `kefu_cities` VALUES ('210', '441300', '惠州市', '440000');
INSERT INTO `kefu_cities` VALUES ('211', '441400', '梅州市', '440000');
INSERT INTO `kefu_cities` VALUES ('212', '441500', '汕尾市', '440000');
INSERT INTO `kefu_cities` VALUES ('213', '441600', '河源市', '440000');
INSERT INTO `kefu_cities` VALUES ('214', '441700', '阳江市', '440000');
INSERT INTO `kefu_cities` VALUES ('215', '441800', '清远市', '440000');
INSERT INTO `kefu_cities` VALUES ('216', '441900', '东莞市', '440000');
INSERT INTO `kefu_cities` VALUES ('217', '442000', '中山市', '440000');
INSERT INTO `kefu_cities` VALUES ('218', '445100', '潮州市', '440000');
INSERT INTO `kefu_cities` VALUES ('219', '445200', '揭阳市', '440000');
INSERT INTO `kefu_cities` VALUES ('220', '445300', '云浮市', '440000');
INSERT INTO `kefu_cities` VALUES ('221', '450100', '南宁市', '450000');
INSERT INTO `kefu_cities` VALUES ('222', '450200', '柳州市', '450000');
INSERT INTO `kefu_cities` VALUES ('223', '450300', '桂林市', '450000');
INSERT INTO `kefu_cities` VALUES ('224', '450400', '梧州市', '450000');
INSERT INTO `kefu_cities` VALUES ('225', '450500', '北海市', '450000');
INSERT INTO `kefu_cities` VALUES ('226', '450600', '防城港市', '450000');
INSERT INTO `kefu_cities` VALUES ('227', '450700', '钦州市', '450000');
INSERT INTO `kefu_cities` VALUES ('228', '450800', '贵港市', '450000');
INSERT INTO `kefu_cities` VALUES ('229', '450900', '玉林市', '450000');
INSERT INTO `kefu_cities` VALUES ('230', '451000', '百色市', '450000');
INSERT INTO `kefu_cities` VALUES ('231', '451100', '贺州市', '450000');
INSERT INTO `kefu_cities` VALUES ('232', '451200', '河池市', '450000');
INSERT INTO `kefu_cities` VALUES ('233', '451300', '来宾市', '450000');
INSERT INTO `kefu_cities` VALUES ('234', '451400', '崇左市', '450000');
INSERT INTO `kefu_cities` VALUES ('235', '460100', '海口市', '460000');
INSERT INTO `kefu_cities` VALUES ('236', '460200', '三亚市', '460000');
INSERT INTO `kefu_cities` VALUES ('237', '469000', '省直辖县级行政单位', '460000');
INSERT INTO `kefu_cities` VALUES ('238', '500100', '市辖区', '500000');
INSERT INTO `kefu_cities` VALUES ('239', '500200', '县', '500000');
INSERT INTO `kefu_cities` VALUES ('240', '500300', '市', '500000');
INSERT INTO `kefu_cities` VALUES ('241', '510100', '成都市', '510000');
INSERT INTO `kefu_cities` VALUES ('242', '510300', '自贡市', '510000');
INSERT INTO `kefu_cities` VALUES ('243', '510400', '攀枝花市', '510000');
INSERT INTO `kefu_cities` VALUES ('244', '510500', '泸州市', '510000');
INSERT INTO `kefu_cities` VALUES ('245', '510600', '德阳市', '510000');
INSERT INTO `kefu_cities` VALUES ('246', '510700', '绵阳市', '510000');
INSERT INTO `kefu_cities` VALUES ('247', '510800', '广元市', '510000');
INSERT INTO `kefu_cities` VALUES ('248', '510900', '遂宁市', '510000');
INSERT INTO `kefu_cities` VALUES ('249', '511000', '内江市', '510000');
INSERT INTO `kefu_cities` VALUES ('250', '511100', '乐山市', '510000');
INSERT INTO `kefu_cities` VALUES ('251', '511300', '南充市', '510000');
INSERT INTO `kefu_cities` VALUES ('252', '511400', '眉山市', '510000');
INSERT INTO `kefu_cities` VALUES ('253', '511500', '宜宾市', '510000');
INSERT INTO `kefu_cities` VALUES ('254', '511600', '广安市', '510000');
INSERT INTO `kefu_cities` VALUES ('255', '511700', '达州市', '510000');
INSERT INTO `kefu_cities` VALUES ('256', '511800', '雅安市', '510000');
INSERT INTO `kefu_cities` VALUES ('257', '511900', '巴中市', '510000');
INSERT INTO `kefu_cities` VALUES ('258', '512000', '资阳市', '510000');
INSERT INTO `kefu_cities` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `kefu_cities` VALUES ('260', '513300', '甘孜藏族自治州', '510000');
INSERT INTO `kefu_cities` VALUES ('261', '513400', '凉山彝族自治州', '510000');
INSERT INTO `kefu_cities` VALUES ('262', '520100', '贵阳市', '520000');
INSERT INTO `kefu_cities` VALUES ('263', '520200', '六盘水市', '520000');
INSERT INTO `kefu_cities` VALUES ('264', '520300', '遵义市', '520000');
INSERT INTO `kefu_cities` VALUES ('265', '520400', '安顺市', '520000');
INSERT INTO `kefu_cities` VALUES ('266', '522200', '铜仁地区', '520000');
INSERT INTO `kefu_cities` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `kefu_cities` VALUES ('268', '522400', '毕节地区', '520000');
INSERT INTO `kefu_cities` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `kefu_cities` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `kefu_cities` VALUES ('271', '530100', '昆明市', '530000');
INSERT INTO `kefu_cities` VALUES ('272', '530300', '曲靖市', '530000');
INSERT INTO `kefu_cities` VALUES ('273', '530400', '玉溪市', '530000');
INSERT INTO `kefu_cities` VALUES ('274', '530500', '保山市', '530000');
INSERT INTO `kefu_cities` VALUES ('275', '530600', '昭通市', '530000');
INSERT INTO `kefu_cities` VALUES ('276', '530700', '丽江市', '530000');
INSERT INTO `kefu_cities` VALUES ('277', '530800', '思茅市', '530000');
INSERT INTO `kefu_cities` VALUES ('278', '530900', '临沧市', '530000');
INSERT INTO `kefu_cities` VALUES ('279', '532300', '楚雄彝族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('281', '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('282', '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('283', '532900', '大理白族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('285', '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('286', '533400', '迪庆藏族自治州', '530000');
INSERT INTO `kefu_cities` VALUES ('287', '540100', '拉萨市', '540000');
INSERT INTO `kefu_cities` VALUES ('288', '542100', '昌都地区', '540000');
INSERT INTO `kefu_cities` VALUES ('289', '542200', '山南地区', '540000');
INSERT INTO `kefu_cities` VALUES ('290', '542300', '日喀则地区', '540000');
INSERT INTO `kefu_cities` VALUES ('291', '542400', '那曲地区', '540000');
INSERT INTO `kefu_cities` VALUES ('292', '542500', '阿里地区', '540000');
INSERT INTO `kefu_cities` VALUES ('293', '542600', '林芝地区', '540000');
INSERT INTO `kefu_cities` VALUES ('294', '610100', '西安市', '610000');
INSERT INTO `kefu_cities` VALUES ('295', '610200', '铜川市', '610000');
INSERT INTO `kefu_cities` VALUES ('296', '610300', '宝鸡市', '610000');
INSERT INTO `kefu_cities` VALUES ('297', '610400', '咸阳市', '610000');
INSERT INTO `kefu_cities` VALUES ('298', '610500', '渭南市', '610000');
INSERT INTO `kefu_cities` VALUES ('299', '610600', '延安市', '610000');
INSERT INTO `kefu_cities` VALUES ('300', '610700', '汉中市', '610000');
INSERT INTO `kefu_cities` VALUES ('301', '610800', '榆林市', '610000');
INSERT INTO `kefu_cities` VALUES ('302', '610900', '安康市', '610000');
INSERT INTO `kefu_cities` VALUES ('303', '611000', '商洛市', '610000');
INSERT INTO `kefu_cities` VALUES ('304', '620100', '兰州市', '620000');
INSERT INTO `kefu_cities` VALUES ('305', '620200', '嘉峪关市', '620000');
INSERT INTO `kefu_cities` VALUES ('306', '620300', '金昌市', '620000');
INSERT INTO `kefu_cities` VALUES ('307', '620400', '白银市', '620000');
INSERT INTO `kefu_cities` VALUES ('308', '620500', '天水市', '620000');
INSERT INTO `kefu_cities` VALUES ('309', '620600', '武威市', '620000');
INSERT INTO `kefu_cities` VALUES ('310', '620700', '张掖市', '620000');
INSERT INTO `kefu_cities` VALUES ('311', '620800', '平凉市', '620000');
INSERT INTO `kefu_cities` VALUES ('312', '620900', '酒泉市', '620000');
INSERT INTO `kefu_cities` VALUES ('313', '621000', '庆阳市', '620000');
INSERT INTO `kefu_cities` VALUES ('314', '621100', '定西市', '620000');
INSERT INTO `kefu_cities` VALUES ('315', '621200', '陇南市', '620000');
INSERT INTO `kefu_cities` VALUES ('316', '622900', '临夏回族自治州', '620000');
INSERT INTO `kefu_cities` VALUES ('317', '623000', '甘南藏族自治州', '620000');
INSERT INTO `kefu_cities` VALUES ('318', '630100', '西宁市', '630000');
INSERT INTO `kefu_cities` VALUES ('319', '632100', '海东地区', '630000');
INSERT INTO `kefu_cities` VALUES ('320', '632200', '海北藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('321', '632300', '黄南藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('322', '632500', '海南藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('323', '632600', '果洛藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('324', '632700', '玉树藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `kefu_cities` VALUES ('326', '640100', '银川市', '640000');
INSERT INTO `kefu_cities` VALUES ('327', '640200', '石嘴山市', '640000');
INSERT INTO `kefu_cities` VALUES ('328', '640300', '吴忠市', '640000');
INSERT INTO `kefu_cities` VALUES ('329', '640400', '固原市', '640000');
INSERT INTO `kefu_cities` VALUES ('330', '640500', '中卫市', '640000');
INSERT INTO `kefu_cities` VALUES ('331', '650100', '乌鲁木齐市', '650000');
INSERT INTO `kefu_cities` VALUES ('332', '650200', '克拉玛依市', '650000');
INSERT INTO `kefu_cities` VALUES ('333', '652100', '吐鲁番地区', '650000');
INSERT INTO `kefu_cities` VALUES ('334', '652200', '哈密地区', '650000');
INSERT INTO `kefu_cities` VALUES ('335', '652300', '昌吉回族自治州', '650000');
INSERT INTO `kefu_cities` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `kefu_cities` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `kefu_cities` VALUES ('338', '652900', '阿克苏地区', '650000');
INSERT INTO `kefu_cities` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `kefu_cities` VALUES ('340', '653100', '喀什地区', '650000');
INSERT INTO `kefu_cities` VALUES ('341', '653200', '和田地区', '650000');
INSERT INTO `kefu_cities` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `kefu_cities` VALUES ('343', '654200', '塔城地区', '650000');
INSERT INTO `kefu_cities` VALUES ('344', '654300', '阿勒泰地区', '650000');
INSERT INTO `kefu_cities` VALUES ('345', '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for kefu_lieshezhi
-- ----------------------------
DROP TABLE IF EXISTS `kefu_lieshezhi`;
CREATE TABLE `kefu_lieshezhi` (
  `lieshezhiId` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置列Id',
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `lszinfoId` int(11) NOT NULL,
  `ddcxShowName` varchar(100) DEFAULT NULL COMMENT '订单查询_显示名称',
  `ddcxState` bit(1) DEFAULT NULL COMMENT '订单查询_是否显示',
  `ddcxSequence` int(11) DEFAULT NULL COMMENT '订单查询_顺序',
  `dfkddShowName` varchar(100) DEFAULT NULL COMMENT '待付款订单_显示名称',
  `dfkddState` bit(1) DEFAULT NULL COMMENT '待付款订单_是否显示',
  `dfkddSequence` int(11) DEFAULT NULL COMMENT '待付款订单_顺序',
  `shenHeShowName` varchar(100) DEFAULT NULL COMMENT '审单_显示名称',
  `shenHeState` bit(1) DEFAULT NULL COMMENT '审单_是否显示',
  `shenHeSequence` int(11) DEFAULT NULL COMMENT '审单_顺序',
  `fsShowName` varchar(100) DEFAULT NULL COMMENT '反审_显示名称',
  `fsState` bit(1) DEFAULT NULL COMMENT '反审_是否显示',
  `fsSequence` int(11) DEFAULT NULL COMMENT '反审_顺序',
  `ddfhShowName` varchar(100) DEFAULT NULL COMMENT '打单发货_显示名称',
  `ddfhState` bit(1) DEFAULT NULL COMMENT '打单发货_是否显示',
  `ddfhSequence` int(11) DEFAULT NULL COMMENT '打单发货_顺序',
  PRIMARY KEY (`lieshezhiId`),
  KEY `lszforeign` (`lszinfoId`),
  KEY `userforeign` (`userId`),
  CONSTRAINT `lszforeign` FOREIGN KEY (`lszinfoId`) REFERENCES `kefu_lszinfo` (`lszinfoId`),
  CONSTRAINT `userforeign` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=100045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kefu_lieshezhi
-- ----------------------------
INSERT INTO `kefu_lieshezhi` VALUES ('100001', '10001', '1', '状态', '', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `kefu_lieshezhi` VALUES ('100002', '10001', '2', '店铺名', '', '2', '店铺名', '', '1', '店铺名', '', '1', '店铺名', '', '1', '店铺名', '', '3');
INSERT INTO `kefu_lieshezhi` VALUES ('100003', '10001', '3', '订单号/下单时间', '', '3', '订单号/下单时间', '', '2', '订单号/下单时间', '', '2', '订单号/下单时间', '', '2', '订单号/下单时间', '', '7');
INSERT INTO `kefu_lieshezhi` VALUES ('100004', '10001', '4', '买家', '', '4', '买家', '', '3', '买家', '', '3', '买家', '', '3', '买家', '\0', '8');
INSERT INTO `kefu_lieshezhi` VALUES ('100005', '10001', '5', '买家备注', '', '5', '买家备注', '', '4', '买家备注', '', '4', '买家备注', '', '4', '买家备注', '\0', '9');
INSERT INTO `kefu_lieshezhi` VALUES ('100006', '10001', '6', '卖家备注', '', '6', '卖家备注', '', '5', '卖家备注', '', '5', '卖家备注', '', '5', '卖家备注', '\0', '10');
INSERT INTO `kefu_lieshezhi` VALUES ('100007', '10001', '7', '地址', '', '7', '地址', '', '6', '地址', '', '6', '地址', '', '6', '地址', '\0', '11');
INSERT INTO `kefu_lieshezhi` VALUES ('100008', '10001', '8', '物流/运单号', '', '8', '物流/运单号', '\0', '17', '物流/运单号', '\0', '17', '物流/运单号', '\0', '17', '物流/运单号', '\0', '20');
INSERT INTO `kefu_lieshezhi` VALUES ('100009', '10001', '9', '物流', '\0', '9', '物流', '', '7', '物流', '', '7', '物流', '', '7', '物流', '', '1');
INSERT INTO `kefu_lieshezhi` VALUES ('100010', '10001', '10', '数量', '\0', '10', '数量', '', '8', '数量', '', '8', '数量', '', '8', '数量', '\0', '12');
INSERT INTO `kefu_lieshezhi` VALUES ('100011', '10001', '11', '实付/运费', '\0', '11', '实付/运费', '\0', '9', '实付/运费', '\0', '9', '实付/运费', '\0', '9', '实付/运费', '\0', '13');
INSERT INTO `kefu_lieshezhi` VALUES ('100012', '10001', '12', '收货人手机号', '\0', '12', '收货人手机号', '\0', '10', '收货人手机号', '\0', '10', '收货人手机号', '\0', '10', '收货人手机号', '\0', '14');
INSERT INTO `kefu_lieshezhi` VALUES ('100013', '10001', '13', '收货人电话', '\0', '13', '收货人电话', '\0', '11', '收货人电话', '\0', '11', '收货人电话', '\0', '11', '收货人电话', '\0', '15');
INSERT INTO `kefu_lieshezhi` VALUES ('100014', '10001', '14', '收货人姓名', '\0', '14', '收货人姓名', '\0', '12', '收货人姓名', '\0', '12', '收货人姓名', '\0', '12', '收货人姓名', '\0', '16');
INSERT INTO `kefu_lieshezhi` VALUES ('100015', '10001', '15', '付款时间', '\0', '15', '付款时间', '\0', '13', '付款时间', '\0', '13', '付款时间', '\0', '13', '付款时间', '\0', '17');
INSERT INTO `kefu_lieshezhi` VALUES ('100016', '10001', '16', '审单时间', '\0', '16', '审单时间', '\0', '14', '审单时间', '\0', '14', '审单时间', '\0', '14', '审单时间', '\0', '18');
INSERT INTO `kefu_lieshezhi` VALUES ('100017', '10001', '17', '发货时间', '\0', '17', '发货时间', '\0', '15', '发货时间', '\0', '15', '发货时间', '\0', '15', '发货时间', '\0', '19');
INSERT INTO `kefu_lieshezhi` VALUES ('100018', '10001', '18', '快递单号', '\0', '18', '快递单号', '\0', '16', '快递单号', '\0', '16', '快递单号', '\0', '16', '快递单号', '', '6');
INSERT INTO `kefu_lieshezhi` VALUES ('100019', '10001', '19', '发货单号', '\0', '19', null, null, null, null, null, null, null, null, null, '发货单号', '\0', '21');
INSERT INTO `kefu_lieshezhi` VALUES ('100020', '10001', '20', null, null, null, null, null, null, null, null, null, null, null, null, '仓库', '', '2');
INSERT INTO `kefu_lieshezhi` VALUES ('100021', '10001', '21', null, null, null, null, null, null, null, null, null, null, null, null, '打印发货单', '', '4');
INSERT INTO `kefu_lieshezhi` VALUES ('100022', '10001', '22', null, null, null, null, null, null, null, null, null, null, null, null, '打印快递单', '', '5');
INSERT INTO `kefu_lieshezhi` VALUES ('100023', '10003', '1', '状态', '', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `kefu_lieshezhi` VALUES ('100024', '10003', '2', '店铺名', '', '2', '店铺名', '', '1', '店铺名', '', '1', '店铺名', '', '1', '店铺名', '', '3');
INSERT INTO `kefu_lieshezhi` VALUES ('100025', '10003', '3', '订单号/下单时间', '', '3', '订单号/下单时间', '', '2', '订单号/下单时间', '', '2', '订单号/下单时间', '', '2', '订单号/下单时间', '', '7');
INSERT INTO `kefu_lieshezhi` VALUES ('100026', '10003', '4', '买家', '', '4', '买家', '', '3', '买家', '', '3', '买家', '', '3', '买家', '\0', '8');
INSERT INTO `kefu_lieshezhi` VALUES ('100027', '10003', '5', '买家备注', '', '5', '买家备注', '', '4', '买家备注', '', '4', '买家备注', '', '4', '买家备注', '\0', '9');
INSERT INTO `kefu_lieshezhi` VALUES ('100028', '10003', '6', '卖家备注', '', '6', '卖家备注', '', '5', '卖家备注', '', '5', '卖家备注', '', '5', '卖家备注', '\0', '10');
INSERT INTO `kefu_lieshezhi` VALUES ('100029', '10003', '7', '地址', '', '7', '地址', '', '6', '地址', '', '6', '地址', '', '6', '地址', '\0', '11');
INSERT INTO `kefu_lieshezhi` VALUES ('100030', '10003', '8', '物流/运单号', '', '8', '物流/运单号', '\0', '17', '物流/运单号', '\0', '17', '物流/运单号', '\0', '17', '物流/运单号', '\0', '20');
INSERT INTO `kefu_lieshezhi` VALUES ('100031', '10003', '9', '物流', '', '9', '物流', '', '7', '物流', '', '7', '物流', '', '7', '物流', '', '1');
INSERT INTO `kefu_lieshezhi` VALUES ('100032', '10003', '10', '数量', '', '10', '数量', '', '8', '数量', '', '8', '数量', '', '8', '数量', '\0', '12');
INSERT INTO `kefu_lieshezhi` VALUES ('100033', '10003', '11', '实付/运费', '', '11', '实付/运费', '', '9', '实付/运费', '\0', '9', '实付/运费', '\0', '9', '实付/运费', '\0', '13');
INSERT INTO `kefu_lieshezhi` VALUES ('100034', '10003', '12', '收货人手机号', '\0', '12', '收货人手机号', '\0', '10', '收货人手机号', '\0', '10', '收货人手机号', '\0', '10', '收货人手机号', '\0', '14');
INSERT INTO `kefu_lieshezhi` VALUES ('100035', '10003', '13', '收货人电话', '\0', '13', '收货人电话', '\0', '11', '收货人电话', '\0', '11', '收货人电话', '\0', '11', '收货人电话', '\0', '15');
INSERT INTO `kefu_lieshezhi` VALUES ('100036', '10003', '14', '收货人姓名', '\0', '14', '收货人姓名', '\0', '12', '收货人姓名', '\0', '12', '收货人姓名', '\0', '12', '收货人姓名', '\0', '16');
INSERT INTO `kefu_lieshezhi` VALUES ('100037', '10003', '15', '付款时间', '\0', '15', '付款时间', '\0', '13', '付款时间', '\0', '13', '付款时间', '\0', '13', '付款时间', '\0', '17');
INSERT INTO `kefu_lieshezhi` VALUES ('100038', '10003', '16', '审单时间', '\0', '16', '审单时间', '\0', '14', '审单时间', '\0', '14', '审单时间', '\0', '14', '审单时间', '\0', '18');
INSERT INTO `kefu_lieshezhi` VALUES ('100039', '10003', '17', '发货时间', '\0', '17', '发货时间', '\0', '15', '发货时间', '\0', '15', '发货时间', '\0', '15', '发货时间', '\0', '19');
INSERT INTO `kefu_lieshezhi` VALUES ('100040', '10003', '18', '快递单号', '\0', '18', '快递单号', '\0', '16', '快递单号', '\0', '16', '快递单号', '\0', '16', '快递单号', '', '6');
INSERT INTO `kefu_lieshezhi` VALUES ('100041', '10003', '19', '发货单号', '\0', '19', null, null, null, null, null, null, null, null, null, '发货单号', '\0', '21');
INSERT INTO `kefu_lieshezhi` VALUES ('100042', '10003', '20', null, null, null, null, null, null, null, null, null, null, null, null, '仓库', '', '2');
INSERT INTO `kefu_lieshezhi` VALUES ('100043', '10003', '21', null, null, null, null, null, null, null, null, null, null, null, null, '打印发货单', '', '4');
INSERT INTO `kefu_lieshezhi` VALUES ('100044', '10003', '22', null, null, null, null, null, null, null, null, null, null, null, null, '打印快递单', '', '5');

-- ----------------------------
-- Table structure for kefu_lszinfo
-- ----------------------------
DROP TABLE IF EXISTS `kefu_lszinfo`;
CREATE TABLE `kefu_lszinfo` (
  `lszinfoId` int(11) NOT NULL AUTO_INCREMENT,
  `colName` varchar(50) DEFAULT NULL,
  `lieTitle` varchar(50) DEFAULT NULL COMMENT '列名称',
  `ddcxDefaultState` bit(1) DEFAULT NULL COMMENT '订单查询_默认显示状态',
  `ddcxDefaultSequence` int(11) DEFAULT NULL COMMENT '订单查询_默认顺序',
  `dfkddDefaultState` bit(1) DEFAULT NULL COMMENT '待付款订单_默认显示状态',
  `dfkddDefaultSequence` int(11) DEFAULT NULL COMMENT '待付款订单_默认顺序',
  `shenHeDefaultState` bit(1) DEFAULT NULL COMMENT '审单_默认显示状态',
  `shenHeDefaultSequence` int(11) DEFAULT NULL COMMENT '审单_默认顺序',
  `fsDefaultState` bit(1) DEFAULT NULL COMMENT '反审_默认显示状态',
  `fsDefaultSequence` int(11) DEFAULT NULL COMMENT '反审_默认顺序',
  `ddfhDefaultState` bit(1) DEFAULT NULL COMMENT '打单发货_默认显示状态',
  `ddfhDefaultSequence` int(11) DEFAULT NULL COMMENT '打单发货_默认顺序',
  PRIMARY KEY (`lszinfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kefu_lszinfo
-- ----------------------------
INSERT INTO `kefu_lszinfo` VALUES ('1', 'status', '状态', '', '1', null, null, null, null, null, null, null, null);
INSERT INTO `kefu_lszinfo` VALUES ('2', 'eShopName', '店铺名', '', '2', '', '1', '', '1', '', '1', '', '3');
INSERT INTO `kefu_lszinfo` VALUES ('3', 'b2cCode/createTime', '订单号/下单时间', '', '3', '', '2', '', '2', '', '2', '', '7');
INSERT INTO `kefu_lszinfo` VALUES ('4', 'customerName', '买家', '', '4', '', '3', '', '3', '', '3', '\0', '8');
INSERT INTO `kefu_lszinfo` VALUES ('5', 'buyerMemo', '买家备注', '', '5', '', '4', '', '4', '', '4', '\0', '9');
INSERT INTO `kefu_lszinfo` VALUES ('6', 'sellerMemo', '卖家备注', '', '6', '', '5', '', '5', '', '5', '\0', '10');
INSERT INTO `kefu_lszinfo` VALUES ('7', 'receiverAddress', '地址', '', '7', '', '6', '', '6', '', '6', '\0', '11');
INSERT INTO `kefu_lszinfo` VALUES ('8', 'expressCompanyName/expressCode', '物流/运单号', '', '8', '\0', '17', '\0', '17', '\0', '17', '\0', '20');
INSERT INTO `kefu_lszinfo` VALUES ('9', 'expressCompanyName', '物流', '\0', '9', '', '7', '', '7', '', '7', '', '1');
INSERT INTO `kefu_lszinfo` VALUES ('10', 'skuTotalQuantity', '数量', '\0', '10', '', '8', '', '8', '', '8', '\0', '12');
INSERT INTO `kefu_lszinfo` VALUES ('11', 'paymentAmount/buyerPostageFee', '实付/运费', '\0', '11', '', '9', '\0', '9', '\0', '9', '\0', '13');
INSERT INTO `kefu_lszinfo` VALUES ('12', 'receiverMobile', '收货人手机号', '\0', '12', '\0', '10', '\0', '10', '\0', '10', '\0', '14');
INSERT INTO `kefu_lszinfo` VALUES ('13', 'receiverPhone', '收货人电话', '\0', '13', '\0', '11', '\0', '11', '\0', '11', '\0', '15');
INSERT INTO `kefu_lszinfo` VALUES ('14', 'receiverName', '收货人姓名', '\0', '14', '\0', '12', '\0', '12', '\0', '12', '\0', '16');
INSERT INTO `kefu_lszinfo` VALUES ('15', 'paymentTime', '付款时间', '\0', '15', '\0', '13', '\0', '13', '\0', '13', '\0', '17');
INSERT INTO `kefu_lszinfo` VALUES ('16', 'auditTime', '审单时间', '\0', '16', '\0', '14', '\0', '14', '\0', '14', '\0', '18');
INSERT INTO `kefu_lszinfo` VALUES ('17', 'deliveryTime', '发货时间', '\0', '17', '\0', '15', '\0', '15', '\0', '15', '\0', '19');
INSERT INTO `kefu_lszinfo` VALUES ('18', 'expressCode', '快递单号', '\0', '18', '\0', '16', '\0', '16', '\0', '16', '', '6');
INSERT INTO `kefu_lszinfo` VALUES ('19', 'deliveryCode', '发货单号', '\0', '19', null, null, null, null, null, null, '\0', '21');
INSERT INTO `kefu_lszinfo` VALUES ('20', 'deliveryWarehouseName', '仓库', null, null, null, null, null, null, null, null, '', '2');
INSERT INTO `kefu_lszinfo` VALUES ('21', 'isDeliverySheetPrinted', '打印发货单', null, null, null, null, null, null, null, null, '', '4');
INSERT INTO `kefu_lszinfo` VALUES ('22', 'isExpressSheetPrinted', '打印快递单', null, null, null, null, null, null, null, null, '', '5');

-- ----------------------------
-- Table structure for kefu_post
-- ----------------------------
DROP TABLE IF EXISTS `kefu_post`;
CREATE TABLE `kefu_post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `postAreaCode` varchar(20) NOT NULL,
  `postZip` varchar(20) NOT NULL,
  `postCode` varchar(20) NOT NULL,
  PRIMARY KEY (`postId`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kefu_post
-- ----------------------------
INSERT INTO `kefu_post` VALUES ('1', '110101', '100000', '010');
INSERT INTO `kefu_post` VALUES ('2', '110102', '100000', '010');
INSERT INTO `kefu_post` VALUES ('3', '110103', '100000', '010');
INSERT INTO `kefu_post` VALUES ('4', '110104', '100000', '010');
INSERT INTO `kefu_post` VALUES ('5', '110105', '100000', '010');
INSERT INTO `kefu_post` VALUES ('6', '110106', '100000', '010');
INSERT INTO `kefu_post` VALUES ('7', '110107', '100000', '010');
INSERT INTO `kefu_post` VALUES ('8', '110108', '100000', '010');
INSERT INTO `kefu_post` VALUES ('9', '110109', '102300', '010');
INSERT INTO `kefu_post` VALUES ('10', '110111', '102400', '010');
INSERT INTO `kefu_post` VALUES ('11', '110112', '101100', '010');
INSERT INTO `kefu_post` VALUES ('12', '110113', '101300', '010');
INSERT INTO `kefu_post` VALUES ('13', '110114', '102200', '010');
INSERT INTO `kefu_post` VALUES ('14', '110115', '102600', '010');
INSERT INTO `kefu_post` VALUES ('15', '110116', '101400', '010');
INSERT INTO `kefu_post` VALUES ('16', '110117', '101200', '010');
INSERT INTO `kefu_post` VALUES ('17', '110228', '101500', '010');
INSERT INTO `kefu_post` VALUES ('18', '110229', '102100', '010');
INSERT INTO `kefu_post` VALUES ('19', '120101', '300000', '022');
INSERT INTO `kefu_post` VALUES ('20', '120102', '300000', '022');
INSERT INTO `kefu_post` VALUES ('21', '120103', '300000', '022');
INSERT INTO `kefu_post` VALUES ('22', '120104', '300000', '022');
INSERT INTO `kefu_post` VALUES ('23', '120105', '300000', '022');
INSERT INTO `kefu_post` VALUES ('24', '120106', '300000', '022');
INSERT INTO `kefu_post` VALUES ('25', '120107', '300450', '022');
INSERT INTO `kefu_post` VALUES ('26', '120108', '300480', '022');
INSERT INTO `kefu_post` VALUES ('27', '120109', '300000', '022');
INSERT INTO `kefu_post` VALUES ('28', '120110', '300000', '022');
INSERT INTO `kefu_post` VALUES ('29', '120111', '300000', '022');
INSERT INTO `kefu_post` VALUES ('30', '120112', '300000', '022');
INSERT INTO `kefu_post` VALUES ('31', '120113', '300000', '022');
INSERT INTO `kefu_post` VALUES ('32', '120114', '301700', '022');
INSERT INTO `kefu_post` VALUES ('33', '120115', '301800', '022');
INSERT INTO `kefu_post` VALUES ('34', '120221', '301500', '022');
INSERT INTO `kefu_post` VALUES ('35', '120223', '301600', '022');
INSERT INTO `kefu_post` VALUES ('36', '120225', '301900', '022');
INSERT INTO `kefu_post` VALUES ('37', '130101', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('38', '130102', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('39', '130103', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('40', '130104', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('41', '130105', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('42', '130107', '051000', '0311');
INSERT INTO `kefu_post` VALUES ('43', '130108', '050000', '0311');
INSERT INTO `kefu_post` VALUES ('44', '130121', '050300', '0311');
INSERT INTO `kefu_post` VALUES ('45', '130123', '050800', '0311');
INSERT INTO `kefu_post` VALUES ('46', '130124', '051430', '0311');
INSERT INTO `kefu_post` VALUES ('47', '130125', '050600', '0311');
INSERT INTO `kefu_post` VALUES ('48', '130126', '050500', '0311');
INSERT INTO `kefu_post` VALUES ('49', '130127', '051330', '0311');
INSERT INTO `kefu_post` VALUES ('50', '130128', '052500', '0311');
INSERT INTO `kefu_post` VALUES ('51', '130129', '051230', '0311');
INSERT INTO `kefu_post` VALUES ('52', '130130', '052400', '0311');
INSERT INTO `kefu_post` VALUES ('53', '130131', '050400', '0311');
INSERT INTO `kefu_post` VALUES ('54', '130132', '051130', '0311');
INSERT INTO `kefu_post` VALUES ('55', '130133', '051530', '0311');
INSERT INTO `kefu_post` VALUES ('56', '130181', '052300', '0311');
INSERT INTO `kefu_post` VALUES ('57', '130182', '052160', '0311');
INSERT INTO `kefu_post` VALUES ('58', '130183', '052200', '0311');
INSERT INTO `kefu_post` VALUES ('59', '130184', '050700', '0311');
INSERT INTO `kefu_post` VALUES ('60', '130185', '050200', '0311');
INSERT INTO `kefu_post` VALUES ('61', '130201', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('62', '130202', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('63', '130203', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('64', '130204', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('65', '130205', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('66', '130207', '063300', '0315');
INSERT INTO `kefu_post` VALUES ('67', '130208', '063000', '0315');
INSERT INTO `kefu_post` VALUES ('68', '130223', '063700', '0315');
INSERT INTO `kefu_post` VALUES ('69', '130224', '063500', '0315');
INSERT INTO `kefu_post` VALUES ('70', '130225', '063600', '0315');
INSERT INTO `kefu_post` VALUES ('71', '130227', '064300', '0315');
INSERT INTO `kefu_post` VALUES ('72', '130229', '064100', '0315');
INSERT INTO `kefu_post` VALUES ('73', '130230', '063200', '0315');
INSERT INTO `kefu_post` VALUES ('74', '130281', '064200', '0315');
INSERT INTO `kefu_post` VALUES ('75', '130283', '064400', '0315');
INSERT INTO `kefu_post` VALUES ('76', '130301', '066000', '0335');
INSERT INTO `kefu_post` VALUES ('77', '130302', '066000', '0335');
INSERT INTO `kefu_post` VALUES ('78', '130303', '066200', '0335');
INSERT INTO `kefu_post` VALUES ('79', '130304', '066100', '0335');
INSERT INTO `kefu_post` VALUES ('80', '130321', '066500', '0335');
INSERT INTO `kefu_post` VALUES ('81', '130322', '066600', '0335');
INSERT INTO `kefu_post` VALUES ('82', '130323', '066300', '0335');
INSERT INTO `kefu_post` VALUES ('83', '130324', '066400', '0335');
INSERT INTO `kefu_post` VALUES ('84', '130401', '056000', '0310');
INSERT INTO `kefu_post` VALUES ('85', '130402', '056000', '0310');
INSERT INTO `kefu_post` VALUES ('86', '130403', '056000', '0310');
INSERT INTO `kefu_post` VALUES ('87', '130404', '056000', '0310');
INSERT INTO `kefu_post` VALUES ('88', '130406', '056200', '0310');
INSERT INTO `kefu_post` VALUES ('89', '130421', '056000', '0310');
INSERT INTO `kefu_post` VALUES ('90', '130423', '056600', '0310');
INSERT INTO `kefu_post` VALUES ('91', '130424', '056700', '0310');
INSERT INTO `kefu_post` VALUES ('92', '130425', '056900', '0310');
INSERT INTO `kefu_post` VALUES ('93', '130426', '056400', '0310');
INSERT INTO `kefu_post` VALUES ('94', '130427', '056500', '0310');
INSERT INTO `kefu_post` VALUES ('95', '130428', '057550', '0310');
INSERT INTO `kefu_post` VALUES ('96', '130429', '057150', '0310');
INSERT INTO `kefu_post` VALUES ('97', '130430', '057450', '0310');
INSERT INTO `kefu_post` VALUES ('98', '130431', '057350', '0310');
INSERT INTO `kefu_post` VALUES ('99', '130432', '057650', '0310');
INSERT INTO `kefu_post` VALUES ('100', '130433', '057750', '0310');
INSERT INTO `kefu_post` VALUES ('101', '130434', '056800', '0310');
INSERT INTO `kefu_post` VALUES ('102', '130435', '057250', '0310');
INSERT INTO `kefu_post` VALUES ('103', '130481', '056300', '0310');
INSERT INTO `kefu_post` VALUES ('104', '130501', '054000', '0319');
INSERT INTO `kefu_post` VALUES ('105', '130502', '054000', '0319');
INSERT INTO `kefu_post` VALUES ('106', '130503', '054000', '0319');
INSERT INTO `kefu_post` VALUES ('107', '130521', '054000', '0319');
INSERT INTO `kefu_post` VALUES ('108', '130522', '054300', '0319');
INSERT INTO `kefu_post` VALUES ('109', '130523', '054200', '0319');
INSERT INTO `kefu_post` VALUES ('110', '130524', '055450', '0319');
INSERT INTO `kefu_post` VALUES ('111', '130525', '055350', '0319');
INSERT INTO `kefu_post` VALUES ('112', '130526', '055150', '0319');
INSERT INTO `kefu_post` VALUES ('113', '130527', '054400', '0319');
INSERT INTO `kefu_post` VALUES ('114', '130528', '055550', '0319');
INSERT INTO `kefu_post` VALUES ('115', '130529', '055250', '0319');
INSERT INTO `kefu_post` VALUES ('116', '130530', '051730', '0319');
INSERT INTO `kefu_post` VALUES ('117', '130531', '054600', '0319');
INSERT INTO `kefu_post` VALUES ('118', '130532', '054500', '0319');
INSERT INTO `kefu_post` VALUES ('119', '130533', '054700', '0319');
INSERT INTO `kefu_post` VALUES ('120', '130534', '054800', '0319');
INSERT INTO `kefu_post` VALUES ('121', '130535', '054900', '0319');
INSERT INTO `kefu_post` VALUES ('122', '130581', '051800', '0319');
INSERT INTO `kefu_post` VALUES ('123', '130582', '054100', '0319');
INSERT INTO `kefu_post` VALUES ('124', '130601', '071000', '0312');
INSERT INTO `kefu_post` VALUES ('125', '130602', '071000', '0312');
INSERT INTO `kefu_post` VALUES ('126', '130603', '071000', '0312');
INSERT INTO `kefu_post` VALUES ('127', '130604', '071000', '0312');
INSERT INTO `kefu_post` VALUES ('128', '130621', '072150', '0312');
INSERT INTO `kefu_post` VALUES ('129', '130622', '071100', '0312');
INSERT INTO `kefu_post` VALUES ('130', '130623', '074100', '0312');
INSERT INTO `kefu_post` VALUES ('131', '130624', '073200', '0312');
INSERT INTO `kefu_post` VALUES ('132', '130625', '072550', '0312');
INSERT INTO `kefu_post` VALUES ('133', '130626', '072650', '0312');
INSERT INTO `kefu_post` VALUES ('134', '130627', '072350', '0312');
INSERT INTO `kefu_post` VALUES ('135', '130628', '071500', '0312');
INSERT INTO `kefu_post` VALUES ('136', '130629', '071700', '0312');
INSERT INTO `kefu_post` VALUES ('137', '130630', '102900', '0312');
INSERT INTO `kefu_post` VALUES ('138', '130631', '072450', '0312');
INSERT INTO `kefu_post` VALUES ('139', '130632', '071600', '0312');
INSERT INTO `kefu_post` VALUES ('140', '130633', '074200', '0312');
INSERT INTO `kefu_post` VALUES ('141', '130634', '073100', '0312');
INSERT INTO `kefu_post` VALUES ('142', '130635', '071400', '0312');
INSERT INTO `kefu_post` VALUES ('143', '130636', '072250', '0312');
INSERT INTO `kefu_post` VALUES ('144', '130637', '071300', '0312');
INSERT INTO `kefu_post` VALUES ('145', '130638', '071800', '0312');
INSERT INTO `kefu_post` VALUES ('146', '130681', '072750', '0312');
INSERT INTO `kefu_post` VALUES ('147', '130682', '073000', '0312');
INSERT INTO `kefu_post` VALUES ('148', '130683', '071200', '0312');
INSERT INTO `kefu_post` VALUES ('149', '130684', '074000', '0312');
INSERT INTO `kefu_post` VALUES ('150', '130701', '075000', '0313');
INSERT INTO `kefu_post` VALUES ('151', '130702', '075000', '0313');
INSERT INTO `kefu_post` VALUES ('152', '130703', '075000', '0313');
INSERT INTO `kefu_post` VALUES ('153', '130705', '075000', '0313');
INSERT INTO `kefu_post` VALUES ('154', '130706', '075000', '0313');
INSERT INTO `kefu_post` VALUES ('155', '130721', '075100', '0313');
INSERT INTO `kefu_post` VALUES ('156', '130722', '076450', '0313');
INSERT INTO `kefu_post` VALUES ('157', '130723', '076650', '0313');
INSERT INTO `kefu_post` VALUES ('158', '130724', '076550', '0313');
INSERT INTO `kefu_post` VALUES ('159', '130725', '076750', '0313');
INSERT INTO `kefu_post` VALUES ('160', '130726', '075700', '0313');
INSERT INTO `kefu_post` VALUES ('161', '130727', '075800', '0313');
INSERT INTO `kefu_post` VALUES ('162', '130728', '076150', '0313');
INSERT INTO `kefu_post` VALUES ('163', '130729', '076250', '0313');
INSERT INTO `kefu_post` VALUES ('164', '130730', '075400', '0313');
INSERT INTO `kefu_post` VALUES ('165', '130731', '075600', '0313');
INSERT INTO `kefu_post` VALUES ('166', '130732', '075500', '0313');
INSERT INTO `kefu_post` VALUES ('167', '130733', '076350', '0313');
INSERT INTO `kefu_post` VALUES ('168', '130801', '067000', '0314');
INSERT INTO `kefu_post` VALUES ('169', '130802', '067000', '0314');
INSERT INTO `kefu_post` VALUES ('170', '130803', '067000', '0314');
INSERT INTO `kefu_post` VALUES ('171', '130804', '067200', '0314');
INSERT INTO `kefu_post` VALUES ('172', '130821', '067400', '0314');
INSERT INTO `kefu_post` VALUES ('173', '130822', '067300', '0314');
INSERT INTO `kefu_post` VALUES ('174', '130823', '067500', '0314');
INSERT INTO `kefu_post` VALUES ('175', '130824', '068250', '0314');
INSERT INTO `kefu_post` VALUES ('176', '130825', '068150', '0314');
INSERT INTO `kefu_post` VALUES ('177', '130826', '068350', '0314');
INSERT INTO `kefu_post` VALUES ('178', '130827', '067600', '0314');
INSERT INTO `kefu_post` VALUES ('179', '130828', '068450', '0314');
INSERT INTO `kefu_post` VALUES ('180', '130901', '061000', '0317');
INSERT INTO `kefu_post` VALUES ('181', '130902', '061000', '0317');
INSERT INTO `kefu_post` VALUES ('182', '130903', '061000', '0317');
INSERT INTO `kefu_post` VALUES ('183', '130921', '061000', '0317');
INSERT INTO `kefu_post` VALUES ('184', '130922', '062650', '0315');
INSERT INTO `kefu_post` VALUES ('185', '130923', '061600', '0317');
INSERT INTO `kefu_post` VALUES ('186', '130924', '061200', '0317');
INSERT INTO `kefu_post` VALUES ('187', '130925', '061300', '0317');
INSERT INTO `kefu_post` VALUES ('188', '130926', '062350', '0317');
INSERT INTO `kefu_post` VALUES ('189', '130927', '061500', '0317');
INSERT INTO `kefu_post` VALUES ('190', '130928', '061800', '0317');
INSERT INTO `kefu_post` VALUES ('191', '130929', '062250', '0317');
INSERT INTO `kefu_post` VALUES ('192', '130930', '061400', '0317');
INSERT INTO `kefu_post` VALUES ('193', '130981', '062150', '0317');
INSERT INTO `kefu_post` VALUES ('194', '130982', '062550', '0317');
INSERT INTO `kefu_post` VALUES ('195', '130983', '061100', '0317');
INSERT INTO `kefu_post` VALUES ('196', '130984', '062450', '0317');
INSERT INTO `kefu_post` VALUES ('197', '131001', '065000', '0316');
INSERT INTO `kefu_post` VALUES ('198', '131002', '065000', '0316');
INSERT INTO `kefu_post` VALUES ('199', '131003', '065000', '0316');
INSERT INTO `kefu_post` VALUES ('200', '131022', '065500', '0316');
INSERT INTO `kefu_post` VALUES ('201', '131023', '065600', '0316');
INSERT INTO `kefu_post` VALUES ('202', '131024', '065400', '0316');
INSERT INTO `kefu_post` VALUES ('203', '131025', '065900', '0316');
INSERT INTO `kefu_post` VALUES ('204', '131026', '065800', '0316');
INSERT INTO `kefu_post` VALUES ('205', '131028', '065300', '0316');
INSERT INTO `kefu_post` VALUES ('206', '131081', '065700', '0316');
INSERT INTO `kefu_post` VALUES ('207', '131082', '065200', '0316');
INSERT INTO `kefu_post` VALUES ('208', '131101', '053000', '0318');
INSERT INTO `kefu_post` VALUES ('209', '131102', '053000', '0318');
INSERT INTO `kefu_post` VALUES ('210', '131121', '053100', '0318');
INSERT INTO `kefu_post` VALUES ('211', '131122', '053400', '0318');
INSERT INTO `kefu_post` VALUES ('212', '131123', '053300', '0318');
INSERT INTO `kefu_post` VALUES ('213', '131124', '053900', '0318');
INSERT INTO `kefu_post` VALUES ('214', '131125', '053600', '0318');
INSERT INTO `kefu_post` VALUES ('215', '131126', '053800', '0318');
INSERT INTO `kefu_post` VALUES ('216', '131127', '053500', '0318');
INSERT INTO `kefu_post` VALUES ('217', '131128', '053700', '0318');
INSERT INTO `kefu_post` VALUES ('218', '131181', '053200', '0318');
INSERT INTO `kefu_post` VALUES ('219', '131182', '052800', '0318');
INSERT INTO `kefu_post` VALUES ('220', '140101', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('221', '140105', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('222', '140106', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('223', '140107', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('224', '140108', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('225', '140109', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('226', '140110', '030000', '0351');
INSERT INTO `kefu_post` VALUES ('227', '140121', '030400', '0351');
INSERT INTO `kefu_post` VALUES ('228', '140122', '030100', '0351');
INSERT INTO `kefu_post` VALUES ('229', '140123', '030300', '0351');
INSERT INTO `kefu_post` VALUES ('230', '140181', '030200', '0351');
INSERT INTO `kefu_post` VALUES ('231', '140201', '037000', '0352');
INSERT INTO `kefu_post` VALUES ('232', '140202', '037000', '0352');
INSERT INTO `kefu_post` VALUES ('233', '140203', '037000', '0352');
INSERT INTO `kefu_post` VALUES ('234', '140211', '037000', '0352');
INSERT INTO `kefu_post` VALUES ('235', '140212', '037000', '0352');
INSERT INTO `kefu_post` VALUES ('236', '140221', '038100', '0352');
INSERT INTO `kefu_post` VALUES ('237', '140222', '038200', '0352');
INSERT INTO `kefu_post` VALUES ('238', '140223', '037500', '0352');
INSERT INTO `kefu_post` VALUES ('239', '140224', '034400', '0352');
INSERT INTO `kefu_post` VALUES ('240', '140225', '037400', '0352');
INSERT INTO `kefu_post` VALUES ('241', '140226', '037100', '0352');
INSERT INTO `kefu_post` VALUES ('242', '140227', '037300', '0352');
INSERT INTO `kefu_post` VALUES ('243', '140301', '045000', '0353');
INSERT INTO `kefu_post` VALUES ('244', '140302', '045000', '0353');
INSERT INTO `kefu_post` VALUES ('245', '140303', '045000', '0353');
INSERT INTO `kefu_post` VALUES ('246', '140311', '045000', '0353');
INSERT INTO `kefu_post` VALUES ('247', '140321', '045200', '0353');
INSERT INTO `kefu_post` VALUES ('248', '140322', '045100', '0353');
INSERT INTO `kefu_post` VALUES ('249', '140401', '046000', '0355');
INSERT INTO `kefu_post` VALUES ('250', '140402', '046000', '0355');
INSERT INTO `kefu_post` VALUES ('251', '140411', '046000', '0355');
INSERT INTO `kefu_post` VALUES ('252', '140421', '046000', '0355');
INSERT INTO `kefu_post` VALUES ('253', '140423', '046200', '0355');
INSERT INTO `kefu_post` VALUES ('254', '140424', '046100', '0355');
INSERT INTO `kefu_post` VALUES ('255', '140425', '047400', '0355');
INSERT INTO `kefu_post` VALUES ('256', '140426', '047600', '0355');
INSERT INTO `kefu_post` VALUES ('257', '140427', '047300', '0355');
INSERT INTO `kefu_post` VALUES ('258', '140428', '046600', '0355');
INSERT INTO `kefu_post` VALUES ('259', '140429', '046300', '0355');
INSERT INTO `kefu_post` VALUES ('260', '140430', '046400', '0355');
INSERT INTO `kefu_post` VALUES ('261', '140431', '046500', '0355');
INSERT INTO `kefu_post` VALUES ('262', '140481', '047500', '0355');
INSERT INTO `kefu_post` VALUES ('263', '140501', '048000', '0356');
INSERT INTO `kefu_post` VALUES ('264', '140502', '048000', '0356');
INSERT INTO `kefu_post` VALUES ('265', '140521', '048200', '0356');
INSERT INTO `kefu_post` VALUES ('266', '140522', '048100', '0356');
INSERT INTO `kefu_post` VALUES ('267', '140524', '048300', '0356');
INSERT INTO `kefu_post` VALUES ('268', '140525', '048000', '0356');
INSERT INTO `kefu_post` VALUES ('269', '140581', '046700', '0356');
INSERT INTO `kefu_post` VALUES ('270', '140601', '038500', '0349');
INSERT INTO `kefu_post` VALUES ('271', '140602', '038500', '0349');
INSERT INTO `kefu_post` VALUES ('272', '140603', '038500', '0349');
INSERT INTO `kefu_post` VALUES ('273', '140621', '038400', '0349');
INSERT INTO `kefu_post` VALUES ('274', '140622', '037600', '0349');
INSERT INTO `kefu_post` VALUES ('275', '140623', '037200', '0349');
INSERT INTO `kefu_post` VALUES ('276', '140624', '038300', '0349');
INSERT INTO `kefu_post` VALUES ('277', '140701', '030600', '0354');
INSERT INTO `kefu_post` VALUES ('278', '140702', '030600', '0354');
INSERT INTO `kefu_post` VALUES ('279', '140721', '031800', '0354');
INSERT INTO `kefu_post` VALUES ('280', '140722', '032600', '0354');
INSERT INTO `kefu_post` VALUES ('281', '140723', '032700', '0354');
INSERT INTO `kefu_post` VALUES ('282', '140724', '045300', '0354');
INSERT INTO `kefu_post` VALUES ('283', '140725', '031700', '0354');
INSERT INTO `kefu_post` VALUES ('284', '140726', '030800', '0354');
INSERT INTO `kefu_post` VALUES ('285', '140727', '030900', '0354');
INSERT INTO `kefu_post` VALUES ('286', '140728', '031100', '0354');
INSERT INTO `kefu_post` VALUES ('287', '140729', '031300', '0354');
INSERT INTO `kefu_post` VALUES ('288', '140781', '031200', '0354');
INSERT INTO `kefu_post` VALUES ('289', '140801', '044000', '0359');
INSERT INTO `kefu_post` VALUES ('290', '140802', '044000', '0359');
INSERT INTO `kefu_post` VALUES ('291', '140821', '044100', '0359');
INSERT INTO `kefu_post` VALUES ('292', '140822', '044200', '0359');
INSERT INTO `kefu_post` VALUES ('293', '140823', '043800', '0359');
INSERT INTO `kefu_post` VALUES ('294', '140824', '043200', '0359');
INSERT INTO `kefu_post` VALUES ('295', '140825', '043100', '0359');
INSERT INTO `kefu_post` VALUES ('296', '140826', '043600', '0359');
INSERT INTO `kefu_post` VALUES ('297', '140827', '043700', '0359');
INSERT INTO `kefu_post` VALUES ('298', '140828', '044400', '0359');
INSERT INTO `kefu_post` VALUES ('299', '140829', '044300', '0359');
INSERT INTO `kefu_post` VALUES ('300', '140830', '044600', '0359');
INSERT INTO `kefu_post` VALUES ('301', '140881', '044500', '0359');
INSERT INTO `kefu_post` VALUES ('302', '140882', '043300', '0359');
INSERT INTO `kefu_post` VALUES ('303', '140901', '034000', '0350');
INSERT INTO `kefu_post` VALUES ('304', '140902', '034000', '0350');
INSERT INTO `kefu_post` VALUES ('305', '140921', '035400', '0350');
INSERT INTO `kefu_post` VALUES ('306', '140922', '035500', '0350');
INSERT INTO `kefu_post` VALUES ('307', '140923', '034200', '0350');
INSERT INTO `kefu_post` VALUES ('308', '140924', '034300', '0350');
INSERT INTO `kefu_post` VALUES ('309', '140925', '036000', '0350');
INSERT INTO `kefu_post` VALUES ('310', '140926', '035100', '0350');
INSERT INTO `kefu_post` VALUES ('311', '140927', '036100', '0350');
INSERT INTO `kefu_post` VALUES ('312', '140928', '036200', '0350');
INSERT INTO `kefu_post` VALUES ('313', '140929', '036300', '0350');
INSERT INTO `kefu_post` VALUES ('314', '140930', '036500', '0350');
INSERT INTO `kefu_post` VALUES ('315', '140931', '036600', '0350');
INSERT INTO `kefu_post` VALUES ('316', '140932', '036400', '0350');
INSERT INTO `kefu_post` VALUES ('317', '140981', '034100', '0350');
INSERT INTO `kefu_post` VALUES ('318', '141001', '041000', '0350');
INSERT INTO `kefu_post` VALUES ('319', '141002', '041000', '0357');
INSERT INTO `kefu_post` VALUES ('320', '141021', '043400', '0357');
INSERT INTO `kefu_post` VALUES ('321', '141022', '043500', '0357');
INSERT INTO `kefu_post` VALUES ('322', '141023', '041500', '0357');
INSERT INTO `kefu_post` VALUES ('323', '141024', '031600', '0357');
INSERT INTO `kefu_post` VALUES ('324', '141025', '042400', '0357');
INSERT INTO `kefu_post` VALUES ('325', '141026', '042500', '0357');
INSERT INTO `kefu_post` VALUES ('326', '141027', '042600', '0357');
INSERT INTO `kefu_post` VALUES ('327', '141028', '042200', '0357');
INSERT INTO `kefu_post` VALUES ('328', '141029', '042100', '0357');
INSERT INTO `kefu_post` VALUES ('329', '141030', '042300', '0357');
INSERT INTO `kefu_post` VALUES ('330', '141031', '041300', '0357');
INSERT INTO `kefu_post` VALUES ('331', '141032', '041400', '0357');
INSERT INTO `kefu_post` VALUES ('332', '141033', '041200', '0357');
INSERT INTO `kefu_post` VALUES ('333', '141034', '031500', '0357');
INSERT INTO `kefu_post` VALUES ('334', '141081', '043000', '0357');
INSERT INTO `kefu_post` VALUES ('335', '141082', '031400', '0357');
INSERT INTO `kefu_post` VALUES ('336', '141101', '033000', '0358');
INSERT INTO `kefu_post` VALUES ('337', '141102', '033000', '0358');
INSERT INTO `kefu_post` VALUES ('338', '141121', '032100', '0358');
INSERT INTO `kefu_post` VALUES ('339', '141122', '030500', '0358');
INSERT INTO `kefu_post` VALUES ('340', '141123', '035300', '0358');
INSERT INTO `kefu_post` VALUES ('341', '141124', '033200', '0358');
INSERT INTO `kefu_post` VALUES ('342', '141125', '033300', '0358');
INSERT INTO `kefu_post` VALUES ('343', '141126', '032500', '0358');
INSERT INTO `kefu_post` VALUES ('344', '141127', '035200', '0358');
INSERT INTO `kefu_post` VALUES ('345', '141128', '033100', '0358');
INSERT INTO `kefu_post` VALUES ('346', '141129', '033400', '0358');
INSERT INTO `kefu_post` VALUES ('347', '141130', '032400', '0358');
INSERT INTO `kefu_post` VALUES ('348', '141181', '032300', '0358');
INSERT INTO `kefu_post` VALUES ('349', '141182', '032200', '0358');
INSERT INTO `kefu_post` VALUES ('350', '150101', '010000', '0471');
INSERT INTO `kefu_post` VALUES ('351', '150102', '010000', '0471');
INSERT INTO `kefu_post` VALUES ('352', '150103', '010000', '0471');
INSERT INTO `kefu_post` VALUES ('353', '150104', '010000', '0471');
INSERT INTO `kefu_post` VALUES ('354', '150105', '010000', '0471');
INSERT INTO `kefu_post` VALUES ('355', '150121', '010100', '0471');
INSERT INTO `kefu_post` VALUES ('356', '150122', '010200', '0471');
INSERT INTO `kefu_post` VALUES ('357', '150123', '011500', '0471');
INSERT INTO `kefu_post` VALUES ('358', '150124', '011600', '0471');
INSERT INTO `kefu_post` VALUES ('359', '150125', '011700', '0471');
INSERT INTO `kefu_post` VALUES ('360', '150201', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('361', '150202', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('362', '150203', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('363', '150204', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('364', '150205', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('365', '150206', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('366', '150207', '014000', '0472');
INSERT INTO `kefu_post` VALUES ('367', '150221', '014100', '0472');
INSERT INTO `kefu_post` VALUES ('368', '150222', '014200', '0472');
INSERT INTO `kefu_post` VALUES ('369', '150223', '014500', '0472');
INSERT INTO `kefu_post` VALUES ('370', '150301', '016000', '0473');
INSERT INTO `kefu_post` VALUES ('371', '150302', '016000', '0473');
INSERT INTO `kefu_post` VALUES ('372', '150303', '016000', '0473');
INSERT INTO `kefu_post` VALUES ('373', '150304', '016000', '0473');
INSERT INTO `kefu_post` VALUES ('374', '150401', '024000', '0476');
INSERT INTO `kefu_post` VALUES ('375', '150402', '024000', '0476');
INSERT INTO `kefu_post` VALUES ('376', '150403', '024000', '0476');
INSERT INTO `kefu_post` VALUES ('377', '150404', '024000', '0476');
INSERT INTO `kefu_post` VALUES ('378', '150421', '025500', '0476');
INSERT INTO `kefu_post` VALUES ('379', '150422', '025450', '0476');
INSERT INTO `kefu_post` VALUES ('380', '150423', '025150', '0476');
INSERT INTO `kefu_post` VALUES ('381', '150424', '025250', '0476');
INSERT INTO `kefu_post` VALUES ('382', '150425', '025350', '0476');
INSERT INTO `kefu_post` VALUES ('383', '150426', '024500', '0476');
INSERT INTO `kefu_post` VALUES ('384', '150428', '024400', '0476');
INSERT INTO `kefu_post` VALUES ('385', '150429', '024200', '0476');
INSERT INTO `kefu_post` VALUES ('386', '150430', '024300', '0476');
INSERT INTO `kefu_post` VALUES ('387', '150501', '028000', '0475');
INSERT INTO `kefu_post` VALUES ('388', '150502', '028000', '0475');
INSERT INTO `kefu_post` VALUES ('389', '150521', '029300', '0475');
INSERT INTO `kefu_post` VALUES ('390', '150522', '028100', '0475');
INSERT INTO `kefu_post` VALUES ('391', '150523', '028400', '0475');
INSERT INTO `kefu_post` VALUES ('392', '150524', '028200', '0475');
INSERT INTO `kefu_post` VALUES ('393', '150525', '028300', '0475');
INSERT INTO `kefu_post` VALUES ('394', '150526', '029100', '0475');
INSERT INTO `kefu_post` VALUES ('395', '150581', '029200', '0475');
INSERT INTO `kefu_post` VALUES ('396', '150602', '017000', '0477');
INSERT INTO `kefu_post` VALUES ('397', '150621', '017000', '0477');
INSERT INTO `kefu_post` VALUES ('398', '150622', '017100', '0477');
INSERT INTO `kefu_post` VALUES ('399', '150623', '016200', '0477');
INSERT INTO `kefu_post` VALUES ('400', '150624', '016100', '0477');
INSERT INTO `kefu_post` VALUES ('401', '150625', '017400', '0477');
INSERT INTO `kefu_post` VALUES ('402', '150626', '017300', '0477');
INSERT INTO `kefu_post` VALUES ('403', '150627', '017200', '0477');
INSERT INTO `kefu_post` VALUES ('404', '150701', '021000', '0470');
INSERT INTO `kefu_post` VALUES ('405', '150702', '021000', '0470');
INSERT INTO `kefu_post` VALUES ('406', '150721', '162750', '0470');
INSERT INTO `kefu_post` VALUES ('407', '150722', '162850', '0470');
INSERT INTO `kefu_post` VALUES ('408', '150723', '022450', '0470');
INSERT INTO `kefu_post` VALUES ('409', '150724', '021100', '0470');
INSERT INTO `kefu_post` VALUES ('410', '150725', '021500', '0470');
INSERT INTO `kefu_post` VALUES ('411', '150726', '021200', '0470');
INSERT INTO `kefu_post` VALUES ('412', '150727', '021300', '0470');
INSERT INTO `kefu_post` VALUES ('413', '150781', '021400', '0470');
INSERT INTO `kefu_post` VALUES ('414', '150782', '022150', '0470');
INSERT INTO `kefu_post` VALUES ('415', '150783', '162650', '0470');
INSERT INTO `kefu_post` VALUES ('416', '150784', '022250', '0470');
INSERT INTO `kefu_post` VALUES ('417', '150785', '022350', '0470');
INSERT INTO `kefu_post` VALUES ('418', '150801', '015000', '0478');
INSERT INTO `kefu_post` VALUES ('419', '150802', '015000', '0478');
INSERT INTO `kefu_post` VALUES ('420', '150821', '015100', '0478');
INSERT INTO `kefu_post` VALUES ('421', '150822', '015200', '0478');
INSERT INTO `kefu_post` VALUES ('422', '150823', '014400', '0478');
INSERT INTO `kefu_post` VALUES ('423', '150824', '015300', '0478');
INSERT INTO `kefu_post` VALUES ('424', '150825', '015500', '0478');
INSERT INTO `kefu_post` VALUES ('425', '150826', '015400', '0478');
INSERT INTO `kefu_post` VALUES ('426', '150901', '012000', '0474');
INSERT INTO `kefu_post` VALUES ('427', '150902', '012000', '0474');
INSERT INTO `kefu_post` VALUES ('428', '150921', '012300', '0474');
INSERT INTO `kefu_post` VALUES ('429', '150922', '013350', '0474');
INSERT INTO `kefu_post` VALUES ('430', '150923', '013400', '0474');
INSERT INTO `kefu_post` VALUES ('431', '150924', '013650', '0474');
INSERT INTO `kefu_post` VALUES ('432', '150925', '013750', '0474');
INSERT INTO `kefu_post` VALUES ('433', '150926', '012200', '0474');
INSERT INTO `kefu_post` VALUES ('434', '150927', '013500', '0474');
INSERT INTO `kefu_post` VALUES ('435', '150928', '012400', '0474');
INSERT INTO `kefu_post` VALUES ('436', '150929', '011800', '0474');
INSERT INTO `kefu_post` VALUES ('437', '150981', '012100', '0474');
INSERT INTO `kefu_post` VALUES ('438', '152201', '137400', '0482');
INSERT INTO `kefu_post` VALUES ('439', '152202', '137400', '0482');
INSERT INTO `kefu_post` VALUES ('440', '152221', '137400', '0482');
INSERT INTO `kefu_post` VALUES ('441', '152222', '029400', '0482');
INSERT INTO `kefu_post` VALUES ('442', '152223', '137600', '0482');
INSERT INTO `kefu_post` VALUES ('443', '152224', '137500', '0482');
INSERT INTO `kefu_post` VALUES ('444', '152501', '012600', '0479');
INSERT INTO `kefu_post` VALUES ('445', '152502', '026000', '0479');
INSERT INTO `kefu_post` VALUES ('446', '152522', '011400', '0479');
INSERT INTO `kefu_post` VALUES ('447', '152523', '011300', '0479');
INSERT INTO `kefu_post` VALUES ('448', '152524', '011200', '0479');
INSERT INTO `kefu_post` VALUES ('449', '152525', '026300', '0479');
INSERT INTO `kefu_post` VALUES ('450', '152526', '026200', '0479');
INSERT INTO `kefu_post` VALUES ('451', '152527', '027000', '0479');
INSERT INTO `kefu_post` VALUES ('452', '152528', '013250', '0479');
INSERT INTO `kefu_post` VALUES ('453', '152529', '013800', '0479');
INSERT INTO `kefu_post` VALUES ('454', '152530', '027200', '0479');
INSERT INTO `kefu_post` VALUES ('455', '152531', '027300', '0479');
INSERT INTO `kefu_post` VALUES ('456', '152921', '750300', '0483');
INSERT INTO `kefu_post` VALUES ('457', '152922', '737300', '0483');
INSERT INTO `kefu_post` VALUES ('458', '152923', '735400', '0483');
INSERT INTO `kefu_post` VALUES ('459', '210101', '110000', '024');
INSERT INTO `kefu_post` VALUES ('460', '210102', '110000', '024');
INSERT INTO `kefu_post` VALUES ('461', '210103', '110000', '024');
INSERT INTO `kefu_post` VALUES ('462', '210104', '110000', '024');
INSERT INTO `kefu_post` VALUES ('463', '210105', '110000', '024');
INSERT INTO `kefu_post` VALUES ('464', '210106', '110020', '024');
INSERT INTO `kefu_post` VALUES ('465', '210111', '110100', '024');
INSERT INTO `kefu_post` VALUES ('466', '210112', '110000', '024');
INSERT INTO `kefu_post` VALUES ('467', '210113', '110000', '024');
INSERT INTO `kefu_post` VALUES ('468', '210114', '110000', '024');
INSERT INTO `kefu_post` VALUES ('469', '210122', '110200', '024');
INSERT INTO `kefu_post` VALUES ('470', '210123', '110500', '024');
INSERT INTO `kefu_post` VALUES ('471', '210124', '110400', '024');
INSERT INTO `kefu_post` VALUES ('472', '210181', '110300', '024');
INSERT INTO `kefu_post` VALUES ('473', '210201', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('474', '210202', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('475', '210203', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('476', '210204', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('477', '210211', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('478', '210212', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('479', '210213', '116000', '0411');
INSERT INTO `kefu_post` VALUES ('480', '210224', '116500', '0411');
INSERT INTO `kefu_post` VALUES ('481', '210281', '116300', '0411');
INSERT INTO `kefu_post` VALUES ('482', '210282', '116200', '0411');
INSERT INTO `kefu_post` VALUES ('483', '210283', '116400', '0411');
INSERT INTO `kefu_post` VALUES ('484', '210301', '114000', '0412');
INSERT INTO `kefu_post` VALUES ('485', '210302', '114000', '0412');
INSERT INTO `kefu_post` VALUES ('486', '210303', '114000', '0412');
INSERT INTO `kefu_post` VALUES ('487', '210304', '114000', '0412');
INSERT INTO `kefu_post` VALUES ('488', '210311', '114000', '0412');
INSERT INTO `kefu_post` VALUES ('489', '210321', '114100', '0412');
INSERT INTO `kefu_post` VALUES ('490', '210323', '118400', '0412');
INSERT INTO `kefu_post` VALUES ('491', '210381', '114200', '0412');
INSERT INTO `kefu_post` VALUES ('492', '210401', '113000', '0413');
INSERT INTO `kefu_post` VALUES ('493', '210402', '113000', '0413');
INSERT INTO `kefu_post` VALUES ('494', '210403', '113000', '0413');
INSERT INTO `kefu_post` VALUES ('495', '210404', '113000', '0413');
INSERT INTO `kefu_post` VALUES ('496', '210411', '113000', '0413');
INSERT INTO `kefu_post` VALUES ('497', '210421', '113100', '0413');
INSERT INTO `kefu_post` VALUES ('498', '210422', '113200', '0413');
INSERT INTO `kefu_post` VALUES ('499', '210423', '113300', '0413');
INSERT INTO `kefu_post` VALUES ('500', '210501', '117000', '0414');
INSERT INTO `kefu_post` VALUES ('501', '210502', '117000', '0414');
INSERT INTO `kefu_post` VALUES ('502', '210503', '117000', '0414');
INSERT INTO `kefu_post` VALUES ('503', '210504', '117000', '0414');
INSERT INTO `kefu_post` VALUES ('504', '210505', '117000', '0414');
INSERT INTO `kefu_post` VALUES ('505', '210521', '117100', '0414');
INSERT INTO `kefu_post` VALUES ('506', '210522', '117200', '0414');
INSERT INTO `kefu_post` VALUES ('507', '210601', '118000', '0415');
INSERT INTO `kefu_post` VALUES ('508', '210602', '118000', '0415');
INSERT INTO `kefu_post` VALUES ('509', '210603', '118000', '0415');
INSERT INTO `kefu_post` VALUES ('510', '210604', '118000', '0415');
INSERT INTO `kefu_post` VALUES ('511', '210624', '118200', '0415');
INSERT INTO `kefu_post` VALUES ('512', '210681', '118300', '0415');
INSERT INTO `kefu_post` VALUES ('513', '210682', '118100', '0415');
INSERT INTO `kefu_post` VALUES ('514', '210701', '121000', '0416');
INSERT INTO `kefu_post` VALUES ('515', '210702', '121000', '0416');
INSERT INTO `kefu_post` VALUES ('516', '210703', '121000', '0416');
INSERT INTO `kefu_post` VALUES ('517', '210711', '121000', '0416');
INSERT INTO `kefu_post` VALUES ('518', '210726', '121400', '0416');
INSERT INTO `kefu_post` VALUES ('519', '210727', '121100', '0416');
INSERT INTO `kefu_post` VALUES ('520', '210781', '121200', '0416');
INSERT INTO `kefu_post` VALUES ('521', '210782', '121300', '0416');
INSERT INTO `kefu_post` VALUES ('522', '210801', '115000', '0417');
INSERT INTO `kefu_post` VALUES ('523', '210802', '115000', '0417');
INSERT INTO `kefu_post` VALUES ('524', '210803', '115000', '0417');
INSERT INTO `kefu_post` VALUES ('525', '210804', '115000', '0417');
INSERT INTO `kefu_post` VALUES ('526', '210811', '115000', '0417');
INSERT INTO `kefu_post` VALUES ('527', '210881', '115200', '0417');
INSERT INTO `kefu_post` VALUES ('528', '210882', '115100', '0417');
INSERT INTO `kefu_post` VALUES ('529', '210901', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('530', '210902', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('531', '210903', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('532', '210904', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('533', '210905', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('534', '210911', '123000', '0418');
INSERT INTO `kefu_post` VALUES ('535', '210921', '123100', '0418');
INSERT INTO `kefu_post` VALUES ('536', '210922', '123200', '0418');
INSERT INTO `kefu_post` VALUES ('537', '211001', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('538', '211002', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('539', '211003', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('540', '211004', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('541', '211005', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('542', '211011', '111000', '0419');
INSERT INTO `kefu_post` VALUES ('543', '211021', '111200', '0419');
INSERT INTO `kefu_post` VALUES ('544', '211081', '111300', '0419');
INSERT INTO `kefu_post` VALUES ('545', '211101', '124000', '0427');
INSERT INTO `kefu_post` VALUES ('546', '211102', '124000', '0427');
INSERT INTO `kefu_post` VALUES ('547', '211103', '124000', '0427');
INSERT INTO `kefu_post` VALUES ('548', '211121', '124200', '0427');
INSERT INTO `kefu_post` VALUES ('549', '211122', '124100', '0427');
INSERT INTO `kefu_post` VALUES ('550', '211201', '112000', '0410');
INSERT INTO `kefu_post` VALUES ('551', '211202', '112000', '0410');
INSERT INTO `kefu_post` VALUES ('552', '211204', '112000', '0410');
INSERT INTO `kefu_post` VALUES ('553', '211221', '112600', '0410');
INSERT INTO `kefu_post` VALUES ('554', '211223', '112400', '0410');
INSERT INTO `kefu_post` VALUES ('555', '211224', '112500', '0410');
INSERT INTO `kefu_post` VALUES ('556', '211281', '112700', '0410');
INSERT INTO `kefu_post` VALUES ('557', '211282', '112300', '0410');
INSERT INTO `kefu_post` VALUES ('558', '211301', '122000', '0421');
INSERT INTO `kefu_post` VALUES ('559', '211302', '122000', '0421');
INSERT INTO `kefu_post` VALUES ('560', '211303', '122000', '0421');
INSERT INTO `kefu_post` VALUES ('561', '211321', '122000', '0421');
INSERT INTO `kefu_post` VALUES ('562', '211322', '122400', '0421');
INSERT INTO `kefu_post` VALUES ('563', '211324', '122300', '0421');
INSERT INTO `kefu_post` VALUES ('564', '211381', '122100', '0421');
INSERT INTO `kefu_post` VALUES ('565', '211382', '122500', '0421');
INSERT INTO `kefu_post` VALUES ('566', '211401', '125000', '0429');
INSERT INTO `kefu_post` VALUES ('567', '211402', '125000', '0429');
INSERT INTO `kefu_post` VALUES ('568', '211403', '125000', '0429');
INSERT INTO `kefu_post` VALUES ('569', '211404', '125000', '0429');
INSERT INTO `kefu_post` VALUES ('570', '211421', '125200', '0429');
INSERT INTO `kefu_post` VALUES ('571', '211422', '125300', '0429');
INSERT INTO `kefu_post` VALUES ('572', '211481', '125100', '0429');
INSERT INTO `kefu_post` VALUES ('573', '220101', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('574', '220102', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('575', '220103', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('576', '220104', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('577', '220105', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('578', '220106', '130000', '0431');
INSERT INTO `kefu_post` VALUES ('579', '220112', '130600', '0431');
INSERT INTO `kefu_post` VALUES ('580', '220122', '130200', '0431');
INSERT INTO `kefu_post` VALUES ('581', '220181', '130500', '0431');
INSERT INTO `kefu_post` VALUES ('582', '220182', '130400', '0431');
INSERT INTO `kefu_post` VALUES ('583', '220183', '130300', '0431');
INSERT INTO `kefu_post` VALUES ('584', '220201', '132000', '0432');
INSERT INTO `kefu_post` VALUES ('585', '220202', '132000', '0432');
INSERT INTO `kefu_post` VALUES ('586', '220203', '132000', '0432');
INSERT INTO `kefu_post` VALUES ('587', '220204', '132000', '0432');
INSERT INTO `kefu_post` VALUES ('588', '220211', '132000', '0432');
INSERT INTO `kefu_post` VALUES ('589', '220221', '132100', '0432');
INSERT INTO `kefu_post` VALUES ('590', '220281', '132500', '0432');
INSERT INTO `kefu_post` VALUES ('591', '220282', '132400', '0432');
INSERT INTO `kefu_post` VALUES ('592', '220283', '132600', '0432');
INSERT INTO `kefu_post` VALUES ('593', '220284', '132300', '0432');
INSERT INTO `kefu_post` VALUES ('594', '220301', '136000', '0434');
INSERT INTO `kefu_post` VALUES ('595', '220302', '136000', '0434');
INSERT INTO `kefu_post` VALUES ('596', '220303', '136000', '0434');
INSERT INTO `kefu_post` VALUES ('597', '220322', '136500', '0434');
INSERT INTO `kefu_post` VALUES ('598', '220323', '130700', '0434');
INSERT INTO `kefu_post` VALUES ('599', '220381', '136100', '0434');
INSERT INTO `kefu_post` VALUES ('600', '220382', '136400', '0434');
INSERT INTO `kefu_post` VALUES ('601', '220401', '136200', '0437');
INSERT INTO `kefu_post` VALUES ('602', '220402', '136200', '0437');
INSERT INTO `kefu_post` VALUES ('603', '220403', '136200', '0437');
INSERT INTO `kefu_post` VALUES ('604', '220421', '136300', '0437');
INSERT INTO `kefu_post` VALUES ('605', '220422', '136600', '0437');
INSERT INTO `kefu_post` VALUES ('606', '220501', '134000', '0435');
INSERT INTO `kefu_post` VALUES ('607', '220502', '134000', '0435');
INSERT INTO `kefu_post` VALUES ('608', '220503', '134000', '0435');
INSERT INTO `kefu_post` VALUES ('609', '220521', '134100', '0435');
INSERT INTO `kefu_post` VALUES ('610', '220523', '135100', '0448');
INSERT INTO `kefu_post` VALUES ('611', '220524', '135300', '0448');
INSERT INTO `kefu_post` VALUES ('612', '220581', '135000', '0448');
INSERT INTO `kefu_post` VALUES ('613', '220582', '134200', '0435');
INSERT INTO `kefu_post` VALUES ('614', '220601', '134300', '0439');
INSERT INTO `kefu_post` VALUES ('615', '220602', '134300', '0439');
INSERT INTO `kefu_post` VALUES ('616', '220621', '134500', '0439');
INSERT INTO `kefu_post` VALUES ('617', '220622', '135200', '0439');
INSERT INTO `kefu_post` VALUES ('618', '220623', '134400', '0439');
INSERT INTO `kefu_post` VALUES ('619', '220625', '134700', '0439');
INSERT INTO `kefu_post` VALUES ('620', '220681', '134600', '0439');
INSERT INTO `kefu_post` VALUES ('621', '220701', '138000', '0438');
INSERT INTO `kefu_post` VALUES ('622', '220702', '138000', '0438');
INSERT INTO `kefu_post` VALUES ('623', '220721', '131100', '0438');
INSERT INTO `kefu_post` VALUES ('624', '220722', '131500', '0438');
INSERT INTO `kefu_post` VALUES ('625', '220723', '131400', '0438');
INSERT INTO `kefu_post` VALUES ('626', '220724', '131200', '0438');
INSERT INTO `kefu_post` VALUES ('627', '220801', '137000', '0436');
INSERT INTO `kefu_post` VALUES ('628', '220802', '137000', '0436');
INSERT INTO `kefu_post` VALUES ('629', '220821', '137300', '0436');
INSERT INTO `kefu_post` VALUES ('630', '220822', '137200', '0436');
INSERT INTO `kefu_post` VALUES ('631', '220881', '137100', '0436');
INSERT INTO `kefu_post` VALUES ('632', '220882', '131300', '0436');
INSERT INTO `kefu_post` VALUES ('633', '222401', '133000', '0043');
INSERT INTO `kefu_post` VALUES ('634', '222402', '133100', '0043');
INSERT INTO `kefu_post` VALUES ('635', '222403', '133700', '0043');
INSERT INTO `kefu_post` VALUES ('636', '222404', '133300', '0043');
INSERT INTO `kefu_post` VALUES ('637', '222405', '133400', '0043');
INSERT INTO `kefu_post` VALUES ('638', '222406', '133500', '0043');
INSERT INTO `kefu_post` VALUES ('639', '222424', '133200', '0043');
INSERT INTO `kefu_post` VALUES ('640', '222426', '133600', '0043');
INSERT INTO `kefu_post` VALUES ('641', '230101', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('642', '230102', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('643', '230103', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('644', '230104', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('645', '230106', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('646', '230107', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('647', '230108', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('648', '230109', '150000', '0451');
INSERT INTO `kefu_post` VALUES ('649', '230111', '150500', '0451');
INSERT INTO `kefu_post` VALUES ('650', '230123', '154800', '0451');
INSERT INTO `kefu_post` VALUES ('651', '230124', '150800', '0451');
INSERT INTO `kefu_post` VALUES ('652', '230125', '150400', '0451');
INSERT INTO `kefu_post` VALUES ('653', '230126', '151800', '0451');
INSERT INTO `kefu_post` VALUES ('654', '230127', '151900', '0451');
INSERT INTO `kefu_post` VALUES ('655', '230128', '150900', '0451');
INSERT INTO `kefu_post` VALUES ('656', '230129', '150700', '0451');
INSERT INTO `kefu_post` VALUES ('657', '230181', '150300', '0451');
INSERT INTO `kefu_post` VALUES ('658', '230182', '150100', '0451');
INSERT INTO `kefu_post` VALUES ('659', '230183', '150600', '0451');
INSERT INTO `kefu_post` VALUES ('660', '230184', '150200', '0451');
INSERT INTO `kefu_post` VALUES ('661', '230201', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('662', '230202', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('663', '230203', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('664', '230204', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('665', '230205', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('666', '230206', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('667', '230207', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('668', '230208', '161000', '0452');
INSERT INTO `kefu_post` VALUES ('669', '230221', '161100', '0452');
INSERT INTO `kefu_post` VALUES ('670', '230223', '161500', '0452');
INSERT INTO `kefu_post` VALUES ('671', '230224', '162400', '0452');
INSERT INTO `kefu_post` VALUES ('672', '230225', '162100', '0452');
INSERT INTO `kefu_post` VALUES ('673', '230227', '161200', '0452');
INSERT INTO `kefu_post` VALUES ('674', '230229', '161600', '0452');
INSERT INTO `kefu_post` VALUES ('675', '230230', '164800', '0452');
INSERT INTO `kefu_post` VALUES ('676', '230231', '164700', '0452');
INSERT INTO `kefu_post` VALUES ('677', '230281', '161300', '0452');
INSERT INTO `kefu_post` VALUES ('678', '230301', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('679', '230302', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('680', '230303', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('681', '230304', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('682', '230305', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('683', '230306', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('684', '230307', '158100', '0467');
INSERT INTO `kefu_post` VALUES ('685', '230321', '158200', '0467');
INSERT INTO `kefu_post` VALUES ('686', '230381', '158400', '0467');
INSERT INTO `kefu_post` VALUES ('687', '230382', '158300', '0467');
INSERT INTO `kefu_post` VALUES ('688', '230401', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('689', '230402', '154000', '0468');
INSERT INTO `kefu_post` VALUES ('690', '230403', '154100', '0468');
INSERT INTO `kefu_post` VALUES ('691', '230404', '154100', '0468');
INSERT INTO `kefu_post` VALUES ('692', '230405', '154100', '0468');
INSERT INTO `kefu_post` VALUES ('693', '230406', '154100', '0468');
INSERT INTO `kefu_post` VALUES ('694', '230407', '154100', '0468');
INSERT INTO `kefu_post` VALUES ('695', '230421', '154200', '0468');
INSERT INTO `kefu_post` VALUES ('696', '230422', '156200', '0468');
INSERT INTO `kefu_post` VALUES ('697', '230501', '155100', '0469');
INSERT INTO `kefu_post` VALUES ('698', '230502', '155100', '0469');
INSERT INTO `kefu_post` VALUES ('699', '230503', '155100', '0469');
INSERT INTO `kefu_post` VALUES ('700', '230505', '155100', '0469');
INSERT INTO `kefu_post` VALUES ('701', '230506', '155100', '0469');
INSERT INTO `kefu_post` VALUES ('702', '230521', '155900', '0469');
INSERT INTO `kefu_post` VALUES ('703', '230522', '155800', '0469');
INSERT INTO `kefu_post` VALUES ('704', '230523', '155600', '0469');
INSERT INTO `kefu_post` VALUES ('705', '230524', '155700', '0469');
INSERT INTO `kefu_post` VALUES ('706', '230601', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('707', '230602', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('708', '230603', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('709', '230604', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('710', '230605', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('711', '230606', '163000', '0459');
INSERT INTO `kefu_post` VALUES ('712', '230621', '166400', '0459');
INSERT INTO `kefu_post` VALUES ('713', '230622', '166500', '0459');
INSERT INTO `kefu_post` VALUES ('714', '230623', '166300', '0459');
INSERT INTO `kefu_post` VALUES ('715', '230624', '166200', '0459');
INSERT INTO `kefu_post` VALUES ('716', '230701', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('717', '230702', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('718', '230703', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('719', '230704', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('720', '230705', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('721', '230706', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('722', '230707', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('723', '230708', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('724', '230709', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('725', '230710', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('726', '230711', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('727', '230712', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('728', '230713', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('729', '230714', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('730', '230715', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('731', '230716', '153000', '0458');
INSERT INTO `kefu_post` VALUES ('732', '230722', '153200', '0458');
INSERT INTO `kefu_post` VALUES ('733', '230781', '152500', '0458');
INSERT INTO `kefu_post` VALUES ('734', '230801', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('735', '230802', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('736', '230803', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('737', '230804', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('738', '230805', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('739', '230811', '154000', '0454');
INSERT INTO `kefu_post` VALUES ('740', '230822', '154400', '0454');
INSERT INTO `kefu_post` VALUES ('741', '230826', '154300', '0454');
INSERT INTO `kefu_post` VALUES ('742', '230828', '154700', '0454');
INSERT INTO `kefu_post` VALUES ('743', '230833', '156500', '0454');
INSERT INTO `kefu_post` VALUES ('744', '230881', '156400', '0454');
INSERT INTO `kefu_post` VALUES ('745', '230882', '156100', '0454');
INSERT INTO `kefu_post` VALUES ('746', '230901', '154600', '0464');
INSERT INTO `kefu_post` VALUES ('747', '230902', '154600', '0464');
INSERT INTO `kefu_post` VALUES ('748', '230903', '154600', '0464');
INSERT INTO `kefu_post` VALUES ('749', '230904', '154600', '0464');
INSERT INTO `kefu_post` VALUES ('750', '230921', '154500', '0464');
INSERT INTO `kefu_post` VALUES ('751', '231001', '157000', '0453');
INSERT INTO `kefu_post` VALUES ('752', '231002', '157000', '0453');
INSERT INTO `kefu_post` VALUES ('753', '231003', '157000', '0453');
INSERT INTO `kefu_post` VALUES ('754', '231004', '157000', '0453');
INSERT INTO `kefu_post` VALUES ('755', '231005', '157000', '0453');
INSERT INTO `kefu_post` VALUES ('756', '231024', '157200', '0453');
INSERT INTO `kefu_post` VALUES ('757', '231025', '157600', '0453');
INSERT INTO `kefu_post` VALUES ('758', '231081', '157300', '0453');
INSERT INTO `kefu_post` VALUES ('759', '231083', '157100', '0453');
INSERT INTO `kefu_post` VALUES ('760', '231084', '157400', '0453');
INSERT INTO `kefu_post` VALUES ('761', '231085', '157500', '0453');
INSERT INTO `kefu_post` VALUES ('762', '231101', '164300', '0456');
INSERT INTO `kefu_post` VALUES ('763', '231102', '164300', '0456');
INSERT INTO `kefu_post` VALUES ('764', '231121', '161400', '0456');
INSERT INTO `kefu_post` VALUES ('765', '231123', '164400', '0456');
INSERT INTO `kefu_post` VALUES ('766', '231124', '164200', '0456');
INSERT INTO `kefu_post` VALUES ('767', '231181', '164000', '0456');
INSERT INTO `kefu_post` VALUES ('768', '231182', '164100', '0456');
INSERT INTO `kefu_post` VALUES ('769', '231201', '152000', '0455');
INSERT INTO `kefu_post` VALUES ('770', '231202', '152000', '0455');
INSERT INTO `kefu_post` VALUES ('771', '231221', '152100', '0455');
INSERT INTO `kefu_post` VALUES ('772', '231222', '151500', '0455');
INSERT INTO `kefu_post` VALUES ('773', '231223', '151600', '0455');
INSERT INTO `kefu_post` VALUES ('774', '231224', '152400', '0455');
INSERT INTO `kefu_post` VALUES ('775', '231225', '151700', '0455');
INSERT INTO `kefu_post` VALUES ('776', '231226', '152200', '0455');
INSERT INTO `kefu_post` VALUES ('777', '231281', '151400', '0455');
INSERT INTO `kefu_post` VALUES ('778', '231282', '151100', '0455');
INSERT INTO `kefu_post` VALUES ('779', '231283', '152300', '0455');
INSERT INTO `kefu_post` VALUES ('780', '232721', '165100', '0457');
INSERT INTO `kefu_post` VALUES ('781', '232722', '165200', '0457');
INSERT INTO `kefu_post` VALUES ('782', '232723', '165300', '0457');
INSERT INTO `kefu_post` VALUES ('783', '310101', '200000', '021');
INSERT INTO `kefu_post` VALUES ('784', '310103', '200000', '021');
INSERT INTO `kefu_post` VALUES ('785', '310104', '200000', '021');
INSERT INTO `kefu_post` VALUES ('786', '310105', '200000', '021');
INSERT INTO `kefu_post` VALUES ('787', '310106', '200000', '021');
INSERT INTO `kefu_post` VALUES ('788', '310107', '200000', '021');
INSERT INTO `kefu_post` VALUES ('789', '310108', '200000', '021');
INSERT INTO `kefu_post` VALUES ('790', '310109', '200000', '021');
INSERT INTO `kefu_post` VALUES ('791', '310110', '200000', '021');
INSERT INTO `kefu_post` VALUES ('792', '310112', '201100', '021');
INSERT INTO `kefu_post` VALUES ('793', '310113', '201900', '021');
INSERT INTO `kefu_post` VALUES ('794', '310114', '201800', '021');
INSERT INTO `kefu_post` VALUES ('795', '310115', '200120', '021');
INSERT INTO `kefu_post` VALUES ('796', '310116', '201500', '021');
INSERT INTO `kefu_post` VALUES ('797', '310117', '201600', '021');
INSERT INTO `kefu_post` VALUES ('798', '310118', '201700', '021');
INSERT INTO `kefu_post` VALUES ('799', '310119', '201300', '021');
INSERT INTO `kefu_post` VALUES ('800', '310120', '201400', '021');
INSERT INTO `kefu_post` VALUES ('801', '310230', '202150', '021');
INSERT INTO `kefu_post` VALUES ('802', '320101', '210000', '025');
INSERT INTO `kefu_post` VALUES ('803', '320102', '210000', '025');
INSERT INTO `kefu_post` VALUES ('804', '320103', '210000', '025');
INSERT INTO `kefu_post` VALUES ('805', '320104', '210000', '025');
INSERT INTO `kefu_post` VALUES ('806', '320105', '210000', '025');
INSERT INTO `kefu_post` VALUES ('807', '320106', '210000', '025');
INSERT INTO `kefu_post` VALUES ('808', '320107', '210000', '025');
INSERT INTO `kefu_post` VALUES ('809', '320111', '210000', '025');
INSERT INTO `kefu_post` VALUES ('810', '320113', '210000', '025');
INSERT INTO `kefu_post` VALUES ('811', '320114', '210000', '025');
INSERT INTO `kefu_post` VALUES ('812', '320115', '211100', '025');
INSERT INTO `kefu_post` VALUES ('813', '320116', '211500', '025');
INSERT INTO `kefu_post` VALUES ('814', '320124', '211200', '025');
INSERT INTO `kefu_post` VALUES ('815', '320125', '211300', '025');
INSERT INTO `kefu_post` VALUES ('816', '320201', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('817', '320202', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('818', '320203', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('819', '320204', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('820', '320205', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('821', '320206', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('822', '320211', '214000', '0510');
INSERT INTO `kefu_post` VALUES ('823', '320281', '214400', '0510');
INSERT INTO `kefu_post` VALUES ('824', '320282', '214200', '0510');
INSERT INTO `kefu_post` VALUES ('825', '320301', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('826', '320302', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('827', '320303', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('828', '320304', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('829', '320305', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('830', '320311', '221000', '0516');
INSERT INTO `kefu_post` VALUES ('831', '320321', '221700', '0516');
INSERT INTO `kefu_post` VALUES ('832', '320322', '221600', '0516');
INSERT INTO `kefu_post` VALUES ('833', '320323', '221100', '0516');
INSERT INTO `kefu_post` VALUES ('834', '320324', '221200', '0516');
INSERT INTO `kefu_post` VALUES ('835', '320381', '221400', '0516');
INSERT INTO `kefu_post` VALUES ('836', '320382', '221300', '0516');
INSERT INTO `kefu_post` VALUES ('837', '320401', '213000', '0519');
INSERT INTO `kefu_post` VALUES ('838', '320402', '213000', '0519');
INSERT INTO `kefu_post` VALUES ('839', '320404', '213000', '0519');
INSERT INTO `kefu_post` VALUES ('840', '320405', '213000', '0519');
INSERT INTO `kefu_post` VALUES ('841', '320411', '213000', '0519');
INSERT INTO `kefu_post` VALUES ('842', '320412', '213100', '0519');
INSERT INTO `kefu_post` VALUES ('843', '320481', '213300', '0519');
INSERT INTO `kefu_post` VALUES ('844', '320482', '213200', '0519');
INSERT INTO `kefu_post` VALUES ('845', '320501', '215000', '0512');
INSERT INTO `kefu_post` VALUES ('846', '320502', '215000', '0512');
INSERT INTO `kefu_post` VALUES ('847', '320503', '215000', '0512');
INSERT INTO `kefu_post` VALUES ('848', '320504', '215000', '0512');
INSERT INTO `kefu_post` VALUES ('849', '320505', '215000', '0512');
INSERT INTO `kefu_post` VALUES ('850', '320506', '215100', '0512');
INSERT INTO `kefu_post` VALUES ('851', '320507', '215100', '0512');
INSERT INTO `kefu_post` VALUES ('852', '320581', '215500', '0512');
INSERT INTO `kefu_post` VALUES ('853', '320582', '215600', '0512');
INSERT INTO `kefu_post` VALUES ('854', '320583', '215300', '0512');
INSERT INTO `kefu_post` VALUES ('855', '320584', '215200', '0512');
INSERT INTO `kefu_post` VALUES ('856', '320585', '215400', '0512');
INSERT INTO `kefu_post` VALUES ('857', '320601', '226000', '0513');
INSERT INTO `kefu_post` VALUES ('858', '320602', '226000', '0513');
INSERT INTO `kefu_post` VALUES ('859', '320611', '226000', '0513');
INSERT INTO `kefu_post` VALUES ('860', '320621', '226600', '0513');
INSERT INTO `kefu_post` VALUES ('861', '320623', '226400', '0513');
INSERT INTO `kefu_post` VALUES ('862', '320681', '226200', '0513');
INSERT INTO `kefu_post` VALUES ('863', '320682', '226500', '0513');
INSERT INTO `kefu_post` VALUES ('864', '320683', '226300', '0513');
INSERT INTO `kefu_post` VALUES ('865', '320684', '226100', '0513');
INSERT INTO `kefu_post` VALUES ('866', '320701', '222000', '0518');
INSERT INTO `kefu_post` VALUES ('867', '320703', '222000', '0518');
INSERT INTO `kefu_post` VALUES ('868', '320705', '222000', '0518');
INSERT INTO `kefu_post` VALUES ('869', '320706', '222000', '0518');
INSERT INTO `kefu_post` VALUES ('870', '320721', '222100', '0518');
INSERT INTO `kefu_post` VALUES ('871', '320722', '222300', '0518');
INSERT INTO `kefu_post` VALUES ('872', '320723', '222200', '0518');
INSERT INTO `kefu_post` VALUES ('873', '320724', '223500', '0518');
INSERT INTO `kefu_post` VALUES ('874', '320801', '223000', '0517');
INSERT INTO `kefu_post` VALUES ('875', '320802', '223001', '0517');
INSERT INTO `kefu_post` VALUES ('876', '320803', '223200', '0517');
INSERT INTO `kefu_post` VALUES ('877', '320804', '223300', '0517');
INSERT INTO `kefu_post` VALUES ('878', '320811', '223001', '0517');
INSERT INTO `kefu_post` VALUES ('879', '320826', '223400', '0517');
INSERT INTO `kefu_post` VALUES ('880', '320829', '223100', '0517');
INSERT INTO `kefu_post` VALUES ('881', '320830', '211700', '0517');
INSERT INTO `kefu_post` VALUES ('882', '320831', '211600', '0517');
INSERT INTO `kefu_post` VALUES ('883', '320901', '224000', '0515');
INSERT INTO `kefu_post` VALUES ('884', '320902', '224000', '0515');
INSERT INTO `kefu_post` VALUES ('885', '320903', '224000', '0515');
INSERT INTO `kefu_post` VALUES ('886', '320921', '224600', '0515');
INSERT INTO `kefu_post` VALUES ('887', '320922', '224000', '0515');
INSERT INTO `kefu_post` VALUES ('888', '320923', '224400', '0515');
INSERT INTO `kefu_post` VALUES ('889', '320924', '224300', '0515');
INSERT INTO `kefu_post` VALUES ('890', '320925', '224700', '0515');
INSERT INTO `kefu_post` VALUES ('891', '320981', '224200', '0515');
INSERT INTO `kefu_post` VALUES ('892', '320982', '224100', '0515');
INSERT INTO `kefu_post` VALUES ('893', '321001', '225000', '0514');
INSERT INTO `kefu_post` VALUES ('894', '321002', '225000', '0514');
INSERT INTO `kefu_post` VALUES ('895', '321003', '225100', '0514');
INSERT INTO `kefu_post` VALUES ('896', '321011', '225200', '0514');
INSERT INTO `kefu_post` VALUES ('897', '321023', '225800', '0514');
INSERT INTO `kefu_post` VALUES ('898', '321081', '211400', '0514');
INSERT INTO `kefu_post` VALUES ('899', '321084', '225600', '0514');
INSERT INTO `kefu_post` VALUES ('900', '321088', '225200', '0514');
INSERT INTO `kefu_post` VALUES ('901', '321101', '212000', '0511');
INSERT INTO `kefu_post` VALUES ('902', '321102', '212000', '0511');
INSERT INTO `kefu_post` VALUES ('903', '321111', '212000', '0511');
INSERT INTO `kefu_post` VALUES ('904', '321112', '212100', '0511');
INSERT INTO `kefu_post` VALUES ('905', '321181', '212300', '0511');
INSERT INTO `kefu_post` VALUES ('906', '321182', '212200', '0511');
INSERT INTO `kefu_post` VALUES ('907', '321183', '212400', '0511');
INSERT INTO `kefu_post` VALUES ('908', '321201', '225300', '0523');
INSERT INTO `kefu_post` VALUES ('909', '321202', '225300', '0523');
INSERT INTO `kefu_post` VALUES ('910', '321203', '225300', '0523');
INSERT INTO `kefu_post` VALUES ('911', '321281', '225700', '0523');
INSERT INTO `kefu_post` VALUES ('912', '321282', '214500', '0523');
INSERT INTO `kefu_post` VALUES ('913', '321283', '225400', '0523');
INSERT INTO `kefu_post` VALUES ('914', '321284', '225500', '0523');
INSERT INTO `kefu_post` VALUES ('915', '321301', '223800', '0527');
INSERT INTO `kefu_post` VALUES ('916', '321302', '223800', '0527');
INSERT INTO `kefu_post` VALUES ('917', '321311', '223800', '0527');
INSERT INTO `kefu_post` VALUES ('918', '321322', '223600', '0527');
INSERT INTO `kefu_post` VALUES ('919', '321323', '223700', '0527');
INSERT INTO `kefu_post` VALUES ('920', '321324', '223900', '0527');
INSERT INTO `kefu_post` VALUES ('921', '330101', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('922', '330102', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('923', '330103', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('924', '330104', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('925', '330105', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('926', '330106', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('927', '330108', '310000', '0571');
INSERT INTO `kefu_post` VALUES ('928', '330109', '311200', '0571');
INSERT INTO `kefu_post` VALUES ('929', '330110', '311100', '0571');
INSERT INTO `kefu_post` VALUES ('930', '330122', '311500', '0571');
INSERT INTO `kefu_post` VALUES ('931', '330127', '311700', '0571');
INSERT INTO `kefu_post` VALUES ('932', '330182', '311600', '0571');
INSERT INTO `kefu_post` VALUES ('933', '330183', '311400', '0571');
INSERT INTO `kefu_post` VALUES ('934', '330185', '311300', '0571');
INSERT INTO `kefu_post` VALUES ('935', '330201', '315000', '0574');
INSERT INTO `kefu_post` VALUES ('936', '330203', '315000', '0574');
INSERT INTO `kefu_post` VALUES ('937', '330204', '315000', '0574');
INSERT INTO `kefu_post` VALUES ('938', '330205', '315000', '0574');
INSERT INTO `kefu_post` VALUES ('939', '330206', '315800', '0574');
INSERT INTO `kefu_post` VALUES ('940', '330211', '315200', '0574');
INSERT INTO `kefu_post` VALUES ('941', '330212', '315100', '0574');
INSERT INTO `kefu_post` VALUES ('942', '330225', '315700', '0574');
INSERT INTO `kefu_post` VALUES ('943', '330226', '315600', '0574');
INSERT INTO `kefu_post` VALUES ('944', '330281', '315400', '0574');
INSERT INTO `kefu_post` VALUES ('945', '330282', '315300', '0574');
INSERT INTO `kefu_post` VALUES ('946', '330283', '315500', '0574');
INSERT INTO `kefu_post` VALUES ('947', '330301', '325000', '0577');
INSERT INTO `kefu_post` VALUES ('948', '330302', '325000', '0577');
INSERT INTO `kefu_post` VALUES ('949', '330303', '325000', '0577');
INSERT INTO `kefu_post` VALUES ('950', '330304', '325000', '0577');
INSERT INTO `kefu_post` VALUES ('951', '330322', '325700', '0577');
INSERT INTO `kefu_post` VALUES ('952', '330324', '325100', '0577');
INSERT INTO `kefu_post` VALUES ('953', '330326', '325400', '0577');
INSERT INTO `kefu_post` VALUES ('954', '330327', '325800', '0577');
INSERT INTO `kefu_post` VALUES ('955', '330328', '325300', '0577');
INSERT INTO `kefu_post` VALUES ('956', '330329', '325500', '0577');
INSERT INTO `kefu_post` VALUES ('957', '330381', '325200', '0577');
INSERT INTO `kefu_post` VALUES ('958', '330382', '325600', '0577');
INSERT INTO `kefu_post` VALUES ('959', '330401', '314000', '0573');
INSERT INTO `kefu_post` VALUES ('960', '330402', '314000', '0573');
INSERT INTO `kefu_post` VALUES ('961', '330411', '314000', '0573');
INSERT INTO `kefu_post` VALUES ('962', '330421', '314100', '0573');
INSERT INTO `kefu_post` VALUES ('963', '330424', '314300', '0573');
INSERT INTO `kefu_post` VALUES ('964', '330481', '314400', '0573');
INSERT INTO `kefu_post` VALUES ('965', '330482', '314200', '0573');
INSERT INTO `kefu_post` VALUES ('966', '330483', '314500', '0573');
INSERT INTO `kefu_post` VALUES ('967', '330501', '313000', '0572');
INSERT INTO `kefu_post` VALUES ('968', '330502', '313000', '0572');
INSERT INTO `kefu_post` VALUES ('969', '330503', '313000', '0572');
INSERT INTO `kefu_post` VALUES ('970', '330521', '313200', '0572');
INSERT INTO `kefu_post` VALUES ('971', '330522', '313100', '0572');
INSERT INTO `kefu_post` VALUES ('972', '330523', '313300', '0572');
INSERT INTO `kefu_post` VALUES ('973', '330601', '312000', '0575');
INSERT INTO `kefu_post` VALUES ('974', '330602', '312000', '0575');
INSERT INTO `kefu_post` VALUES ('975', '330621', '312000', '0575');
INSERT INTO `kefu_post` VALUES ('976', '330624', '312500', '0575');
INSERT INTO `kefu_post` VALUES ('977', '330681', '311800', '0575');
INSERT INTO `kefu_post` VALUES ('978', '330682', '312300', '0575');
INSERT INTO `kefu_post` VALUES ('979', '330683', '312400', '0575');
INSERT INTO `kefu_post` VALUES ('980', '330701', '321000', '0579');
INSERT INTO `kefu_post` VALUES ('981', '330702', '321000', '0579');
INSERT INTO `kefu_post` VALUES ('982', '330703', '321000', '0579');
INSERT INTO `kefu_post` VALUES ('983', '330723', '321200', '0579');
INSERT INTO `kefu_post` VALUES ('984', '330726', '322200', '0579');
INSERT INTO `kefu_post` VALUES ('985', '330727', '322300', '0579');
INSERT INTO `kefu_post` VALUES ('986', '330781', '321100', '0579');
INSERT INTO `kefu_post` VALUES ('987', '330782', '322000', '0579');
INSERT INTO `kefu_post` VALUES ('988', '330783', '322100', '0579');
INSERT INTO `kefu_post` VALUES ('989', '330784', '321300', '0579');
INSERT INTO `kefu_post` VALUES ('990', '330801', '324000', '0570');
INSERT INTO `kefu_post` VALUES ('991', '330802', '324000', '0570');
INSERT INTO `kefu_post` VALUES ('992', '330803', '324000', '0570');
INSERT INTO `kefu_post` VALUES ('993', '330822', '324200', '0570');
INSERT INTO `kefu_post` VALUES ('994', '330824', '324300', '0570');
INSERT INTO `kefu_post` VALUES ('995', '330825', '324400', '0570');
INSERT INTO `kefu_post` VALUES ('996', '330881', '324100', '0570');
INSERT INTO `kefu_post` VALUES ('997', '330901', '316000', '0580');
INSERT INTO `kefu_post` VALUES ('998', '330902', '316000', '0580');
INSERT INTO `kefu_post` VALUES ('999', '330903', '316100', '0580');
INSERT INTO `kefu_post` VALUES ('1000', '330921', '316200', '0580');
INSERT INTO `kefu_post` VALUES ('1001', '330922', '202450', '0580');
INSERT INTO `kefu_post` VALUES ('1002', '331001', '317000', '0576');
INSERT INTO `kefu_post` VALUES ('1003', '331002', '317700', '0576');
INSERT INTO `kefu_post` VALUES ('1004', '331003', '318020', '0576');
INSERT INTO `kefu_post` VALUES ('1005', '331004', '318000', '0576');
INSERT INTO `kefu_post` VALUES ('1006', '331021', '317600', '0576');
INSERT INTO `kefu_post` VALUES ('1007', '331022', '317100', '0576');
INSERT INTO `kefu_post` VALUES ('1008', '331023', '317200', '0576');
INSERT INTO `kefu_post` VALUES ('1009', '331024', '317300', '0576');
INSERT INTO `kefu_post` VALUES ('1010', '331081', '317500', '0576');
INSERT INTO `kefu_post` VALUES ('1011', '331082', '317000', '0576');
INSERT INTO `kefu_post` VALUES ('1012', '331101', '323000', '0578');
INSERT INTO `kefu_post` VALUES ('1013', '331102', '323000', '0578');
INSERT INTO `kefu_post` VALUES ('1014', '331121', '323900', '0578');
INSERT INTO `kefu_post` VALUES ('1015', '331122', '321400', '0578');
INSERT INTO `kefu_post` VALUES ('1016', '331123', '323300', '0578');
INSERT INTO `kefu_post` VALUES ('1017', '331124', '323400', '0578');
INSERT INTO `kefu_post` VALUES ('1018', '331125', '323600', '0578');
INSERT INTO `kefu_post` VALUES ('1019', '331126', '323800', '0578');
INSERT INTO `kefu_post` VALUES ('1020', '331127', '323500', '0578');
INSERT INTO `kefu_post` VALUES ('1021', '331181', '323700', '0578');
INSERT INTO `kefu_post` VALUES ('1022', '340101', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1023', '340102', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1024', '340103', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1025', '340104', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1026', '340111', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1027', '340121', '231100', '0551');
INSERT INTO `kefu_post` VALUES ('1028', '340122', '230000', '0551');
INSERT INTO `kefu_post` VALUES ('1029', '340123', '231200', '0551');
INSERT INTO `kefu_post` VALUES ('1030', '340201', '241000', '0553');
INSERT INTO `kefu_post` VALUES ('1031', '340202', '241000', '0553');
INSERT INTO `kefu_post` VALUES ('1032', '340203', '241000', '0553');
INSERT INTO `kefu_post` VALUES ('1033', '340204', '241000', '0553');
INSERT INTO `kefu_post` VALUES ('1034', '340207', '241000', '0553');
INSERT INTO `kefu_post` VALUES ('1035', '340221', '241100', '0553');
INSERT INTO `kefu_post` VALUES ('1036', '340222', '241200', '0553');
INSERT INTO `kefu_post` VALUES ('1037', '340223', '242400', '0553');
INSERT INTO `kefu_post` VALUES ('1038', '340301', '233000', '0552');
INSERT INTO `kefu_post` VALUES ('1039', '340302', '233000', '0552');
INSERT INTO `kefu_post` VALUES ('1040', '340303', '233000', '0552');
INSERT INTO `kefu_post` VALUES ('1041', '340304', '233000', '0552');
INSERT INTO `kefu_post` VALUES ('1042', '340311', '233000', '0552');
INSERT INTO `kefu_post` VALUES ('1043', '340321', '233400', '0552');
INSERT INTO `kefu_post` VALUES ('1044', '340322', '233300', '0552');
INSERT INTO `kefu_post` VALUES ('1045', '340323', '233700', '0552');
INSERT INTO `kefu_post` VALUES ('1046', '340401', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1047', '340402', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1048', '340403', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1049', '340404', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1050', '340405', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1051', '340406', '232000', '0554');
INSERT INTO `kefu_post` VALUES ('1052', '340421', '232100', '0554');
INSERT INTO `kefu_post` VALUES ('1053', '340501', '243000', '0555');
INSERT INTO `kefu_post` VALUES ('1054', '340502', '243000', '0555');
INSERT INTO `kefu_post` VALUES ('1055', '340503', '243000', '0555');
INSERT INTO `kefu_post` VALUES ('1056', '340504', '243000', '0555');
INSERT INTO `kefu_post` VALUES ('1057', '340521', '243100', '0555');
INSERT INTO `kefu_post` VALUES ('1058', '340601', '235000', '0561');
INSERT INTO `kefu_post` VALUES ('1059', '340602', '235000', '0561');
INSERT INTO `kefu_post` VALUES ('1060', '340603', '235000', '0561');
INSERT INTO `kefu_post` VALUES ('1061', '340604', '235000', '0561');
INSERT INTO `kefu_post` VALUES ('1062', '340621', '235100', '0561');
INSERT INTO `kefu_post` VALUES ('1063', '340701', '244000', '0562');
INSERT INTO `kefu_post` VALUES ('1064', '340702', '244000', '0562');
INSERT INTO `kefu_post` VALUES ('1065', '340703', '244000', '0562');
INSERT INTO `kefu_post` VALUES ('1066', '340711', '244000', '0562');
INSERT INTO `kefu_post` VALUES ('1067', '340721', '244100', '0562');
INSERT INTO `kefu_post` VALUES ('1068', '340801', '246000', '0556');
INSERT INTO `kefu_post` VALUES ('1069', '340802', '246000', '0556');
INSERT INTO `kefu_post` VALUES ('1070', '340803', '246000', '0556');
INSERT INTO `kefu_post` VALUES ('1071', '340811', '246000', '0556');
INSERT INTO `kefu_post` VALUES ('1072', '340822', '246100', '0556');
INSERT INTO `kefu_post` VALUES ('1073', '340823', '246700', '0556');
INSERT INTO `kefu_post` VALUES ('1074', '340824', '246300', '0556');
INSERT INTO `kefu_post` VALUES ('1075', '340825', '246400', '0556');
INSERT INTO `kefu_post` VALUES ('1076', '340826', '246500', '0556');
INSERT INTO `kefu_post` VALUES ('1077', '340827', '246200', '0556');
INSERT INTO `kefu_post` VALUES ('1078', '340828', '246600', '0556');
INSERT INTO `kefu_post` VALUES ('1079', '340881', '231400', '0556');
INSERT INTO `kefu_post` VALUES ('1080', '341001', '245000', '0559');
INSERT INTO `kefu_post` VALUES ('1081', '341002', '245000', '0559');
INSERT INTO `kefu_post` VALUES ('1082', '341003', '245000', '0559');
INSERT INTO `kefu_post` VALUES ('1083', '341004', '245000', '0559');
INSERT INTO `kefu_post` VALUES ('1084', '341021', '245200', '0559');
INSERT INTO `kefu_post` VALUES ('1085', '341022', '245400', '0559');
INSERT INTO `kefu_post` VALUES ('1086', '341023', '245500', '0559');
INSERT INTO `kefu_post` VALUES ('1087', '341024', '245600', '0559');
INSERT INTO `kefu_post` VALUES ('1088', '341101', '239000', '0550');
INSERT INTO `kefu_post` VALUES ('1089', '341102', '239000', '0550');
INSERT INTO `kefu_post` VALUES ('1090', '341103', '239000', '0550');
INSERT INTO `kefu_post` VALUES ('1091', '341122', '239200', '0550');
INSERT INTO `kefu_post` VALUES ('1092', '341124', '239500', '0550');
INSERT INTO `kefu_post` VALUES ('1093', '341125', '233200', '0550');
INSERT INTO `kefu_post` VALUES ('1094', '341126', '233100', '0550');
INSERT INTO `kefu_post` VALUES ('1095', '341181', '239300', '0550');
INSERT INTO `kefu_post` VALUES ('1096', '341182', '239400', '0550');
INSERT INTO `kefu_post` VALUES ('1097', '341201', '236000', '0558');
INSERT INTO `kefu_post` VALUES ('1098', '341202', '236000', '0558');
INSERT INTO `kefu_post` VALUES ('1099', '341203', '236000', '0558');
INSERT INTO `kefu_post` VALUES ('1100', '341204', '236000', '0558');
INSERT INTO `kefu_post` VALUES ('1101', '341221', '236400', '0558');
INSERT INTO `kefu_post` VALUES ('1102', '341222', '236600', '0558');
INSERT INTO `kefu_post` VALUES ('1103', '341225', '236300', '0558');
INSERT INTO `kefu_post` VALUES ('1104', '341226', '236200', '0558');
INSERT INTO `kefu_post` VALUES ('1105', '341282', '236500', '0558');
INSERT INTO `kefu_post` VALUES ('1106', '341301', '234000', '0557');
INSERT INTO `kefu_post` VALUES ('1107', '341302', '234000', '0557');
INSERT INTO `kefu_post` VALUES ('1108', '341321', '235300', '0557');
INSERT INTO `kefu_post` VALUES ('1109', '341322', '235200', '0557');
INSERT INTO `kefu_post` VALUES ('1110', '341323', '234200', '0557');
INSERT INTO `kefu_post` VALUES ('1111', '341324', '234300', '0557');
INSERT INTO `kefu_post` VALUES ('1112', '341401', '238000', '0565');
INSERT INTO `kefu_post` VALUES ('1113', '341402', '238000', '0565');
INSERT INTO `kefu_post` VALUES ('1114', '341421', '231500', '0565');
INSERT INTO `kefu_post` VALUES ('1115', '341422', '238300', '0565');
INSERT INTO `kefu_post` VALUES ('1116', '341423', '238100', '0565');
INSERT INTO `kefu_post` VALUES ('1117', '341424', '238200', '0565');
INSERT INTO `kefu_post` VALUES ('1118', '341501', '237000', '0564');
INSERT INTO `kefu_post` VALUES ('1119', '341502', '237000', '0564');
INSERT INTO `kefu_post` VALUES ('1120', '341503', '237000', '0564');
INSERT INTO `kefu_post` VALUES ('1121', '341521', '232200', '0564');
INSERT INTO `kefu_post` VALUES ('1122', '341522', '237400', '0564');
INSERT INTO `kefu_post` VALUES ('1123', '341523', '231300', '0564');
INSERT INTO `kefu_post` VALUES ('1124', '341524', '237300', '0564');
INSERT INTO `kefu_post` VALUES ('1125', '341525', '237200', '0564');
INSERT INTO `kefu_post` VALUES ('1126', '341601', '236000', '0558');
INSERT INTO `kefu_post` VALUES ('1127', '341602', '236800', '0558');
INSERT INTO `kefu_post` VALUES ('1128', '341621', '233600', '0558');
INSERT INTO `kefu_post` VALUES ('1129', '341622', '233500', '0558');
INSERT INTO `kefu_post` VALUES ('1130', '341623', '236700', '0558');
INSERT INTO `kefu_post` VALUES ('1131', '341701', '247100', '0566');
INSERT INTO `kefu_post` VALUES ('1132', '341702', '247100', '0566');
INSERT INTO `kefu_post` VALUES ('1133', '341721', '247200', '0566');
INSERT INTO `kefu_post` VALUES ('1134', '341722', '245100', '0566');
INSERT INTO `kefu_post` VALUES ('1135', '341723', '242800', '0566');
INSERT INTO `kefu_post` VALUES ('1136', '341801', '242000', '0563');
INSERT INTO `kefu_post` VALUES ('1137', '341802', '242000', '0563');
INSERT INTO `kefu_post` VALUES ('1138', '341821', '242100', '0563');
INSERT INTO `kefu_post` VALUES ('1139', '341822', '242200', '0563');
INSERT INTO `kefu_post` VALUES ('1140', '341823', '242500', '0563');
INSERT INTO `kefu_post` VALUES ('1141', '341824', '245300', '0563');
INSERT INTO `kefu_post` VALUES ('1142', '341825', '242600', '0563');
INSERT INTO `kefu_post` VALUES ('1143', '341881', '242300', '0563');
INSERT INTO `kefu_post` VALUES ('1144', '350101', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1145', '350102', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1146', '350103', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1147', '350104', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1148', '350105', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1149', '350111', '350000', '0591');
INSERT INTO `kefu_post` VALUES ('1150', '350121', '350100', '0591');
INSERT INTO `kefu_post` VALUES ('1151', '350122', '350500', '0591');
INSERT INTO `kefu_post` VALUES ('1152', '350123', '350600', '0591');
INSERT INTO `kefu_post` VALUES ('1153', '350124', '350800', '0591');
INSERT INTO `kefu_post` VALUES ('1154', '350125', '350700', '0591');
INSERT INTO `kefu_post` VALUES ('1155', '350128', '350400', '0591');
INSERT INTO `kefu_post` VALUES ('1156', '350181', '350300', '0591');
INSERT INTO `kefu_post` VALUES ('1157', '350182', '350200', '0591');
INSERT INTO `kefu_post` VALUES ('1158', '350201', '361000', '0592');
INSERT INTO `kefu_post` VALUES ('1159', '350203', '361000', '0592');
INSERT INTO `kefu_post` VALUES ('1160', '350205', '361000', '0592');
INSERT INTO `kefu_post` VALUES ('1161', '350206', '361000', '0592');
INSERT INTO `kefu_post` VALUES ('1162', '350211', '361000', '0592');
INSERT INTO `kefu_post` VALUES ('1163', '350212', '361100', '0592');
INSERT INTO `kefu_post` VALUES ('1164', '350213', '361100', '0592');
INSERT INTO `kefu_post` VALUES ('1165', '350301', '351100', '0594');
INSERT INTO `kefu_post` VALUES ('1166', '350302', '351100', '0594');
INSERT INTO `kefu_post` VALUES ('1167', '350303', '351100', '0594');
INSERT INTO `kefu_post` VALUES ('1168', '350304', '351100', '0594');
INSERT INTO `kefu_post` VALUES ('1169', '350305', '351100', '0594');
INSERT INTO `kefu_post` VALUES ('1170', '350322', '351200', '0594');
INSERT INTO `kefu_post` VALUES ('1171', '350401', '365000', '0598');
INSERT INTO `kefu_post` VALUES ('1172', '350402', '365000', '0598');
INSERT INTO `kefu_post` VALUES ('1173', '350403', '365000', '0598');
INSERT INTO `kefu_post` VALUES ('1174', '350421', '365300', '0598');
INSERT INTO `kefu_post` VALUES ('1175', '350423', '365300', '0598');
INSERT INTO `kefu_post` VALUES ('1176', '350424', '365400', '0598');
INSERT INTO `kefu_post` VALUES ('1177', '350425', '366100', '0598');
INSERT INTO `kefu_post` VALUES ('1178', '350426', '365100', '0598');
INSERT INTO `kefu_post` VALUES ('1179', '350427', '365500', '0598');
INSERT INTO `kefu_post` VALUES ('1180', '350428', '353300', '0598');
INSERT INTO `kefu_post` VALUES ('1181', '350429', '354400', '0598');
INSERT INTO `kefu_post` VALUES ('1182', '350430', '354500', '0598');
INSERT INTO `kefu_post` VALUES ('1183', '350481', '366000', '0598');
INSERT INTO `kefu_post` VALUES ('1184', '350501', '362000', '0595');
INSERT INTO `kefu_post` VALUES ('1185', '350502', '362000', '0595');
INSERT INTO `kefu_post` VALUES ('1186', '350503', '362000', '0595');
INSERT INTO `kefu_post` VALUES ('1187', '350504', '362000', '0595');
INSERT INTO `kefu_post` VALUES ('1188', '350505', '362100', '0595');
INSERT INTO `kefu_post` VALUES ('1189', '350521', '362100', '0595');
INSERT INTO `kefu_post` VALUES ('1190', '350524', '362400', '0595');
INSERT INTO `kefu_post` VALUES ('1191', '350525', '362600', '0595');
INSERT INTO `kefu_post` VALUES ('1192', '350526', '362500', '0595');
INSERT INTO `kefu_post` VALUES ('1193', '350527', '362000', '0595');
INSERT INTO `kefu_post` VALUES ('1194', '350581', '362700', '0595');
INSERT INTO `kefu_post` VALUES ('1195', '350582', '362200', '0595');
INSERT INTO `kefu_post` VALUES ('1196', '350583', '362300', '0595');
INSERT INTO `kefu_post` VALUES ('1197', '350601', '363000', '0596');
INSERT INTO `kefu_post` VALUES ('1198', '350602', '363000', '0596');
INSERT INTO `kefu_post` VALUES ('1199', '350603', '363000', '0596');
INSERT INTO `kefu_post` VALUES ('1200', '350622', '363300', '0596');
INSERT INTO `kefu_post` VALUES ('1201', '350623', '363200', '0596');
INSERT INTO `kefu_post` VALUES ('1202', '350624', '363500', '0596');
INSERT INTO `kefu_post` VALUES ('1203', '350625', '363900', '0596');
INSERT INTO `kefu_post` VALUES ('1204', '350626', '363400', '0596');
INSERT INTO `kefu_post` VALUES ('1205', '350627', '363600', '0596');
INSERT INTO `kefu_post` VALUES ('1206', '350628', '363700', '0596');
INSERT INTO `kefu_post` VALUES ('1207', '350629', '363800', '0596');
INSERT INTO `kefu_post` VALUES ('1208', '350681', '363100', '0596');
INSERT INTO `kefu_post` VALUES ('1209', '350701', '353000', '0599');
INSERT INTO `kefu_post` VALUES ('1210', '350702', '353000', '0599');
INSERT INTO `kefu_post` VALUES ('1211', '350721', '353200', '0599');
INSERT INTO `kefu_post` VALUES ('1212', '350722', '353400', '0599');
INSERT INTO `kefu_post` VALUES ('1213', '350723', '354100', '0599');
INSERT INTO `kefu_post` VALUES ('1214', '350724', '353500', '0599');
INSERT INTO `kefu_post` VALUES ('1215', '350725', '353600', '0599');
INSERT INTO `kefu_post` VALUES ('1216', '350781', '354000', '0599');
INSERT INTO `kefu_post` VALUES ('1217', '350782', '354300', '0599');
INSERT INTO `kefu_post` VALUES ('1218', '350783', '353100', '0599');
INSERT INTO `kefu_post` VALUES ('1219', '350784', '354200', '0599');
INSERT INTO `kefu_post` VALUES ('1220', '350801', '364000', '0597');
INSERT INTO `kefu_post` VALUES ('1221', '350802', '364000', '0597');
INSERT INTO `kefu_post` VALUES ('1222', '350821', '366300', '0597');
INSERT INTO `kefu_post` VALUES ('1223', '350822', '364100', '0597');
INSERT INTO `kefu_post` VALUES ('1224', '350823', '364200', '0597');
INSERT INTO `kefu_post` VALUES ('1225', '350824', '364300', '0597');
INSERT INTO `kefu_post` VALUES ('1226', '350825', '366200', '0597');
INSERT INTO `kefu_post` VALUES ('1227', '350881', '364400', '0597');
INSERT INTO `kefu_post` VALUES ('1228', '350901', '352000', '0595');
INSERT INTO `kefu_post` VALUES ('1229', '350902', '352000', '0593');
INSERT INTO `kefu_post` VALUES ('1230', '350921', '355100', '0593');
INSERT INTO `kefu_post` VALUES ('1231', '350922', '352200', '0593');
INSERT INTO `kefu_post` VALUES ('1232', '350923', '352300', '0593');
INSERT INTO `kefu_post` VALUES ('1233', '350924', '355500', '0593');
INSERT INTO `kefu_post` VALUES ('1234', '350925', '355400', '0593');
INSERT INTO `kefu_post` VALUES ('1235', '350926', '355300', '0593');
INSERT INTO `kefu_post` VALUES ('1236', '350981', '355000', '0593');
INSERT INTO `kefu_post` VALUES ('1237', '350982', '355200', '0593');
INSERT INTO `kefu_post` VALUES ('1238', '360101', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1239', '360102', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1240', '360103', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1241', '360104', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1242', '360105', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1243', '360111', '330000', '0791');
INSERT INTO `kefu_post` VALUES ('1244', '360121', '330200', '0791');
INSERT INTO `kefu_post` VALUES ('1245', '360122', '330100', '0791');
INSERT INTO `kefu_post` VALUES ('1246', '360123', '330500', '0791');
INSERT INTO `kefu_post` VALUES ('1247', '360124', '331700', '0791');
INSERT INTO `kefu_post` VALUES ('1248', '360201', '333000', '0798');
INSERT INTO `kefu_post` VALUES ('1249', '360202', '333000', '0798');
INSERT INTO `kefu_post` VALUES ('1250', '360203', '333000', '0798');
INSERT INTO `kefu_post` VALUES ('1251', '360222', '333400', '0798');
INSERT INTO `kefu_post` VALUES ('1252', '360281', '333300', '0798');
INSERT INTO `kefu_post` VALUES ('1253', '360301', '337000', '0799');
INSERT INTO `kefu_post` VALUES ('1254', '360302', '337000', '0799');
INSERT INTO `kefu_post` VALUES ('1255', '360313', '337000', '0799');
INSERT INTO `kefu_post` VALUES ('1256', '360321', '337100', '0799');
INSERT INTO `kefu_post` VALUES ('1257', '360322', '337000', '0799');
INSERT INTO `kefu_post` VALUES ('1258', '360323', '337000', '0799');
INSERT INTO `kefu_post` VALUES ('1259', '360401', '332000', '0792');
INSERT INTO `kefu_post` VALUES ('1260', '360402', '332900', '0792');
INSERT INTO `kefu_post` VALUES ('1261', '360403', '332000', '0792');
INSERT INTO `kefu_post` VALUES ('1262', '360421', '332100', '0792');
INSERT INTO `kefu_post` VALUES ('1263', '360423', '332300', '0792');
INSERT INTO `kefu_post` VALUES ('1264', '360424', '332400', '0792');
INSERT INTO `kefu_post` VALUES ('1265', '360425', '330300', '0792');
INSERT INTO `kefu_post` VALUES ('1266', '360426', '330400', '0792');
INSERT INTO `kefu_post` VALUES ('1267', '360427', '332800', '0792');
INSERT INTO `kefu_post` VALUES ('1268', '360428', '332600', '0792');
INSERT INTO `kefu_post` VALUES ('1269', '360429', '332500', '0792');
INSERT INTO `kefu_post` VALUES ('1270', '360430', '332700', '0792');
INSERT INTO `kefu_post` VALUES ('1271', '360481', '332200', '0792');
INSERT INTO `kefu_post` VALUES ('1272', '360501', '336500', '0790');
INSERT INTO `kefu_post` VALUES ('1273', '360502', '336500', '0790');
INSERT INTO `kefu_post` VALUES ('1274', '360521', '336600', '0790');
INSERT INTO `kefu_post` VALUES ('1275', '360601', '335000', '0701');
INSERT INTO `kefu_post` VALUES ('1276', '360602', '335000', '0701');
INSERT INTO `kefu_post` VALUES ('1277', '360622', '335200', '0701');
INSERT INTO `kefu_post` VALUES ('1278', '360681', '335400', '0701');
INSERT INTO `kefu_post` VALUES ('1279', '360701', '341000', '0797');
INSERT INTO `kefu_post` VALUES ('1280', '360702', '341000', '0797');
INSERT INTO `kefu_post` VALUES ('1281', '360721', '341100', '0797');
INSERT INTO `kefu_post` VALUES ('1282', '360722', '341600', '0797');
INSERT INTO `kefu_post` VALUES ('1283', '360723', '341500', '0797');
INSERT INTO `kefu_post` VALUES ('1284', '360724', '341200', '0797');
INSERT INTO `kefu_post` VALUES ('1285', '360725', '341300', '0797');
INSERT INTO `kefu_post` VALUES ('1286', '360726', '342100', '0797');
INSERT INTO `kefu_post` VALUES ('1287', '360727', '341700', '0797');
INSERT INTO `kefu_post` VALUES ('1288', '360728', '341900', '0797');
INSERT INTO `kefu_post` VALUES ('1289', '360729', '341800', '0797');
INSERT INTO `kefu_post` VALUES ('1290', '360730', '342800', '0797');
INSERT INTO `kefu_post` VALUES ('1291', '360731', '342300', '0797');
INSERT INTO `kefu_post` VALUES ('1292', '360732', '342400', '0797');
INSERT INTO `kefu_post` VALUES ('1293', '360733', '342600', '0797');
INSERT INTO `kefu_post` VALUES ('1294', '360734', '342200', '0797');
INSERT INTO `kefu_post` VALUES ('1295', '360735', '342700', '0797');
INSERT INTO `kefu_post` VALUES ('1296', '360781', '342500', '0797');
INSERT INTO `kefu_post` VALUES ('1297', '360782', '341400', '0797');
INSERT INTO `kefu_post` VALUES ('1298', '360801', '343000', '0796');
INSERT INTO `kefu_post` VALUES ('1299', '360802', '343000', '0796');
INSERT INTO `kefu_post` VALUES ('1300', '360803', '343000', '0796');
INSERT INTO `kefu_post` VALUES ('1301', '360821', '343100', '0796');
INSERT INTO `kefu_post` VALUES ('1302', '360822', '331600', '0796');
INSERT INTO `kefu_post` VALUES ('1303', '360823', '331400', '0796');
INSERT INTO `kefu_post` VALUES ('1304', '360824', '331300', '0796');
INSERT INTO `kefu_post` VALUES ('1305', '360825', '331500', '0796');
INSERT INTO `kefu_post` VALUES ('1306', '360826', '343700', '0796');
INSERT INTO `kefu_post` VALUES ('1307', '360827', '343900', '0796');
INSERT INTO `kefu_post` VALUES ('1308', '360828', '343800', '0796');
INSERT INTO `kefu_post` VALUES ('1309', '360829', '343200', '0796');
INSERT INTO `kefu_post` VALUES ('1310', '360830', '343400', '0796');
INSERT INTO `kefu_post` VALUES ('1311', '360881', '343600', '0796');
INSERT INTO `kefu_post` VALUES ('1312', '360901', '336000', '0795');
INSERT INTO `kefu_post` VALUES ('1313', '360902', '336000', '0795');
INSERT INTO `kefu_post` VALUES ('1314', '360921', '330700', '0795');
INSERT INTO `kefu_post` VALUES ('1315', '360922', '336100', '0795');
INSERT INTO `kefu_post` VALUES ('1316', '360923', '336400', '0795');
INSERT INTO `kefu_post` VALUES ('1317', '360924', '336300', '0795');
INSERT INTO `kefu_post` VALUES ('1318', '360925', '330600', '0795');
INSERT INTO `kefu_post` VALUES ('1319', '360926', '336200', '0795');
INSERT INTO `kefu_post` VALUES ('1320', '360981', '331100', '0795');
INSERT INTO `kefu_post` VALUES ('1321', '360982', '331200', '0795');
INSERT INTO `kefu_post` VALUES ('1322', '360983', '330800', '0795');
INSERT INTO `kefu_post` VALUES ('1323', '361001', '344000', '0794');
INSERT INTO `kefu_post` VALUES ('1324', '361002', '344100', '0794');
INSERT INTO `kefu_post` VALUES ('1325', '361021', '344700', '0794');
INSERT INTO `kefu_post` VALUES ('1326', '361022', '344600', '0794');
INSERT INTO `kefu_post` VALUES ('1327', '361023', '344500', '0794');
INSERT INTO `kefu_post` VALUES ('1328', '361024', '344200', '0794');
INSERT INTO `kefu_post` VALUES ('1329', '361025', '344300', '0794');
INSERT INTO `kefu_post` VALUES ('1330', '361026', '344400', '0794');
INSERT INTO `kefu_post` VALUES ('1331', '361027', '344800', '0794');
INSERT INTO `kefu_post` VALUES ('1332', '361028', '335300', '0794');
INSERT INTO `kefu_post` VALUES ('1333', '361029', '331800', '0794');
INSERT INTO `kefu_post` VALUES ('1334', '361030', '344900', '0794');
INSERT INTO `kefu_post` VALUES ('1335', '361101', '334000', '0793');
INSERT INTO `kefu_post` VALUES ('1336', '361102', '334000', '0793');
INSERT INTO `kefu_post` VALUES ('1337', '361121', '334100', '0793');
INSERT INTO `kefu_post` VALUES ('1338', '361122', '334600', '0793');
INSERT INTO `kefu_post` VALUES ('1339', '361123', '334700', '0793');
INSERT INTO `kefu_post` VALUES ('1340', '361124', '334500', '0793');
INSERT INTO `kefu_post` VALUES ('1341', '361125', '334300', '0793');
INSERT INTO `kefu_post` VALUES ('1342', '361126', '334400', '0793');
INSERT INTO `kefu_post` VALUES ('1343', '361127', '335100', '0793');
INSERT INTO `kefu_post` VALUES ('1344', '361128', '333100', '0793');
INSERT INTO `kefu_post` VALUES ('1345', '361129', '335500', '0793');
INSERT INTO `kefu_post` VALUES ('1346', '361130', '333200', '0793');
INSERT INTO `kefu_post` VALUES ('1347', '361181', '334200', '0793');
INSERT INTO `kefu_post` VALUES ('1348', '370101', '250000', '0531');
INSERT INTO `kefu_post` VALUES ('1349', '370102', '250000', '0531');
INSERT INTO `kefu_post` VALUES ('1350', '370103', '250000', '0531');
INSERT INTO `kefu_post` VALUES ('1351', '370104', '250000', '0531');
INSERT INTO `kefu_post` VALUES ('1352', '370105', '250000', '0531');
INSERT INTO `kefu_post` VALUES ('1353', '370112', '250100', '0531');
INSERT INTO `kefu_post` VALUES ('1354', '370113', '250300', '0531');
INSERT INTO `kefu_post` VALUES ('1355', '370124', '250400', '0531');
INSERT INTO `kefu_post` VALUES ('1356', '370125', '251400', '0531');
INSERT INTO `kefu_post` VALUES ('1357', '370126', '251600', '0531');
INSERT INTO `kefu_post` VALUES ('1358', '370181', '250200', '0531');
INSERT INTO `kefu_post` VALUES ('1359', '370201', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1360', '370202', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1361', '370203', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1362', '370205', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1363', '370211', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1364', '370212', '266100', '0532');
INSERT INTO `kefu_post` VALUES ('1365', '370213', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1366', '370214', '266000', '0532');
INSERT INTO `kefu_post` VALUES ('1367', '370281', '266300', '0532');
INSERT INTO `kefu_post` VALUES ('1368', '370282', '266200', '0532');
INSERT INTO `kefu_post` VALUES ('1369', '370283', '266700', '0532');
INSERT INTO `kefu_post` VALUES ('1370', '370284', '266400', '0532');
INSERT INTO `kefu_post` VALUES ('1371', '370285', '266600', '0532');
INSERT INTO `kefu_post` VALUES ('1372', '370301', '255100', '0533');
INSERT INTO `kefu_post` VALUES ('1373', '370302', '255100', '0533');
INSERT INTO `kefu_post` VALUES ('1374', '370303', '255000', '0533');
INSERT INTO `kefu_post` VALUES ('1375', '370304', '255200', '0533');
INSERT INTO `kefu_post` VALUES ('1376', '370305', '255400', '0533');
INSERT INTO `kefu_post` VALUES ('1377', '370306', '255300', '0533');
INSERT INTO `kefu_post` VALUES ('1378', '370321', '256400', '0533');
INSERT INTO `kefu_post` VALUES ('1379', '370322', '256300', '0533');
INSERT INTO `kefu_post` VALUES ('1380', '370323', '256100', '0533');
INSERT INTO `kefu_post` VALUES ('1381', '370401', '277000', '0632');
INSERT INTO `kefu_post` VALUES ('1382', '370402', '277000', '0632');
INSERT INTO `kefu_post` VALUES ('1383', '370403', '277000', '0632');
INSERT INTO `kefu_post` VALUES ('1384', '370404', '277300', '0632');
INSERT INTO `kefu_post` VALUES ('1385', '370405', '277400', '0632');
INSERT INTO `kefu_post` VALUES ('1386', '370406', '277200', '0632');
INSERT INTO `kefu_post` VALUES ('1387', '370481', '277500', '0632');
INSERT INTO `kefu_post` VALUES ('1388', '370501', '257000', '0546');
INSERT INTO `kefu_post` VALUES ('1389', '370502', '257100', '0546');
INSERT INTO `kefu_post` VALUES ('1390', '370503', '257200', '0546');
INSERT INTO `kefu_post` VALUES ('1391', '370521', '257500', '0546');
INSERT INTO `kefu_post` VALUES ('1392', '370522', '257400', '0546');
INSERT INTO `kefu_post` VALUES ('1393', '370523', '257300', '0546');
INSERT INTO `kefu_post` VALUES ('1394', '370601', '264000', '0535');
INSERT INTO `kefu_post` VALUES ('1395', '370602', '264000', '0535');
INSERT INTO `kefu_post` VALUES ('1396', '370611', '265500', '0535');
INSERT INTO `kefu_post` VALUES ('1397', '370612', '264100', '0535');
INSERT INTO `kefu_post` VALUES ('1398', '370613', '264000', '0535');
INSERT INTO `kefu_post` VALUES ('1399', '370634', '265800', '0535');
INSERT INTO `kefu_post` VALUES ('1400', '370681', '265700', '0535');
INSERT INTO `kefu_post` VALUES ('1401', '370682', '265200', '0535');
INSERT INTO `kefu_post` VALUES ('1402', '370683', '261400', '0535');
INSERT INTO `kefu_post` VALUES ('1403', '370684', '265600', '0535');
INSERT INTO `kefu_post` VALUES ('1404', '370685', '265400', '0535');
INSERT INTO `kefu_post` VALUES ('1405', '370686', '265300', '0535');
INSERT INTO `kefu_post` VALUES ('1406', '370687', '265100', '0535');
INSERT INTO `kefu_post` VALUES ('1407', '370701', '261000', '0536');
INSERT INTO `kefu_post` VALUES ('1408', '370702', '261000', '0536');
INSERT INTO `kefu_post` VALUES ('1409', '370703', '261100', '0536');
INSERT INTO `kefu_post` VALUES ('1410', '370704', '261200', '0536');
INSERT INTO `kefu_post` VALUES ('1411', '370705', '261000', '0536');
INSERT INTO `kefu_post` VALUES ('1412', '370724', '262600', '0536');
INSERT INTO `kefu_post` VALUES ('1413', '370725', '262400', '0536');
INSERT INTO `kefu_post` VALUES ('1414', '370781', '262500', '0536');
INSERT INTO `kefu_post` VALUES ('1415', '370782', '262200', '0536');
INSERT INTO `kefu_post` VALUES ('1416', '370783', '262700', '0536');
INSERT INTO `kefu_post` VALUES ('1417', '370784', '262100', '0536');
INSERT INTO `kefu_post` VALUES ('1418', '370785', '261500', '0536');
INSERT INTO `kefu_post` VALUES ('1419', '370786', '261300', '0536');
INSERT INTO `kefu_post` VALUES ('1420', '370801', '272000', '0537');
INSERT INTO `kefu_post` VALUES ('1421', '370802', '272000', '0537');
INSERT INTO `kefu_post` VALUES ('1422', '370811', '272000', '0537');
INSERT INTO `kefu_post` VALUES ('1423', '370826', '277600', '0537');
INSERT INTO `kefu_post` VALUES ('1424', '370827', '272300', '0537');
INSERT INTO `kefu_post` VALUES ('1425', '370828', '272200', '0537');
INSERT INTO `kefu_post` VALUES ('1426', '370829', '272400', '0537');
INSERT INTO `kefu_post` VALUES ('1427', '370830', '272500', '0537');
INSERT INTO `kefu_post` VALUES ('1428', '370831', '273200', '0537');
INSERT INTO `kefu_post` VALUES ('1429', '370832', '272600', '0537');
INSERT INTO `kefu_post` VALUES ('1430', '370881', '273100', '0537');
INSERT INTO `kefu_post` VALUES ('1431', '370882', '272000', '0537');
INSERT INTO `kefu_post` VALUES ('1432', '370883', '273500', '0537');
INSERT INTO `kefu_post` VALUES ('1433', '370901', '271000', '0538');
INSERT INTO `kefu_post` VALUES ('1434', '370902', '271000', '0538');
INSERT INTO `kefu_post` VALUES ('1435', '370903', '271000', '0538');
INSERT INTO `kefu_post` VALUES ('1436', '370921', '271400', '0538');
INSERT INTO `kefu_post` VALUES ('1437', '370923', '271500', '0538');
INSERT INTO `kefu_post` VALUES ('1438', '370982', '271200', '0538');
INSERT INTO `kefu_post` VALUES ('1439', '370983', '271600', '0538');
INSERT INTO `kefu_post` VALUES ('1440', '371001', '264000', '0631');
INSERT INTO `kefu_post` VALUES ('1441', '371002', '264200', '0631');
INSERT INTO `kefu_post` VALUES ('1442', '371081', '264400', '0631');
INSERT INTO `kefu_post` VALUES ('1443', '371082', '264300', '0631');
INSERT INTO `kefu_post` VALUES ('1444', '371083', '264500', '0631');
INSERT INTO `kefu_post` VALUES ('1445', '371101', '276800', '0633');
INSERT INTO `kefu_post` VALUES ('1446', '371102', '276800', '0633');
INSERT INTO `kefu_post` VALUES ('1447', '371103', '276800', '0633');
INSERT INTO `kefu_post` VALUES ('1448', '371121', '262300', '0633');
INSERT INTO `kefu_post` VALUES ('1449', '371122', '276500', '0633');
INSERT INTO `kefu_post` VALUES ('1450', '371201', '271100', '0634');
INSERT INTO `kefu_post` VALUES ('1451', '371202', '271100', '0634');
INSERT INTO `kefu_post` VALUES ('1452', '371203', '271100', '0634');
INSERT INTO `kefu_post` VALUES ('1453', '371301', '276000', '0539');
INSERT INTO `kefu_post` VALUES ('1454', '371302', '276000', '0539');
INSERT INTO `kefu_post` VALUES ('1455', '371311', '276000', '0539');
INSERT INTO `kefu_post` VALUES ('1456', '371312', '276000', '0539');
INSERT INTO `kefu_post` VALUES ('1457', '371321', '276300', '0539');
INSERT INTO `kefu_post` VALUES ('1458', '371322', '276100', '0539');
INSERT INTO `kefu_post` VALUES ('1459', '371323', '276400', '0539');
INSERT INTO `kefu_post` VALUES ('1460', '371324', '277700', '0539');
INSERT INTO `kefu_post` VALUES ('1461', '371325', '273400', '0539');
INSERT INTO `kefu_post` VALUES ('1462', '371326', '273300', '0539');
INSERT INTO `kefu_post` VALUES ('1463', '371327', '276600', '0539');
INSERT INTO `kefu_post` VALUES ('1464', '371328', '276200', '0539');
INSERT INTO `kefu_post` VALUES ('1465', '371329', '276700', '0539');
INSERT INTO `kefu_post` VALUES ('1466', '371401', '253000', '0534');
INSERT INTO `kefu_post` VALUES ('1467', '371402', '253000', '0534');
INSERT INTO `kefu_post` VALUES ('1468', '371421', '253500', '0534');
INSERT INTO `kefu_post` VALUES ('1469', '371422', '253400', '0534');
INSERT INTO `kefu_post` VALUES ('1470', '371423', '253700', '0534');
INSERT INTO `kefu_post` VALUES ('1471', '371424', '251500', '0534');
INSERT INTO `kefu_post` VALUES ('1472', '371425', '251100', '0534');
INSERT INTO `kefu_post` VALUES ('1473', '371426', '253100', '0534');
INSERT INTO `kefu_post` VALUES ('1474', '371427', '253200', '0534');
INSERT INTO `kefu_post` VALUES ('1475', '371428', '253300', '0534');
INSERT INTO `kefu_post` VALUES ('1476', '371481', '253600', '0534');
INSERT INTO `kefu_post` VALUES ('1477', '371482', '251200', '0534');
INSERT INTO `kefu_post` VALUES ('1478', '371501', '252000', '0635');
INSERT INTO `kefu_post` VALUES ('1479', '371502', '252000', '0635');
INSERT INTO `kefu_post` VALUES ('1480', '371521', '252300', '0635');
INSERT INTO `kefu_post` VALUES ('1481', '371522', '252400', '0635');
INSERT INTO `kefu_post` VALUES ('1482', '371523', '252100', '0635');
INSERT INTO `kefu_post` VALUES ('1483', '371524', '252200', '0635');
INSERT INTO `kefu_post` VALUES ('1484', '371525', '252500', '0635');
INSERT INTO `kefu_post` VALUES ('1485', '371526', '252800', '0635');
INSERT INTO `kefu_post` VALUES ('1486', '371581', '252600', '0635');
INSERT INTO `kefu_post` VALUES ('1487', '371601', '256600', '0543');
INSERT INTO `kefu_post` VALUES ('1488', '371602', '256600', '0543');
INSERT INTO `kefu_post` VALUES ('1489', '371621', '251700', '0543');
INSERT INTO `kefu_post` VALUES ('1490', '371622', '251800', '0543');
INSERT INTO `kefu_post` VALUES ('1491', '371623', '251900', '0543');
INSERT INTO `kefu_post` VALUES ('1492', '371624', '256800', '0543');
INSERT INTO `kefu_post` VALUES ('1493', '371625', '256500', '0543');
INSERT INTO `kefu_post` VALUES ('1494', '371626', '256200', '0543');
INSERT INTO `kefu_post` VALUES ('1495', '371701', '274000', '0530');
INSERT INTO `kefu_post` VALUES ('1496', '371702', '274000', '0530');
INSERT INTO `kefu_post` VALUES ('1497', '371721', '274400', '0530');
INSERT INTO `kefu_post` VALUES ('1498', '371722', '274300', '0530');
INSERT INTO `kefu_post` VALUES ('1499', '371723', '274200', '0530');
INSERT INTO `kefu_post` VALUES ('1500', '371724', '274900', '0530');
INSERT INTO `kefu_post` VALUES ('1501', '371725', '274700', '0530');
INSERT INTO `kefu_post` VALUES ('1502', '371726', '274600', '0530');
INSERT INTO `kefu_post` VALUES ('1503', '371727', '274100', '0530');
INSERT INTO `kefu_post` VALUES ('1504', '371728', '274500', '0530');
INSERT INTO `kefu_post` VALUES ('1505', '410101', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1506', '410102', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1507', '410103', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1508', '410104', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1509', '410105', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1510', '410106', '450041', '0371');
INSERT INTO `kefu_post` VALUES ('1511', '410108', '450000', '0371');
INSERT INTO `kefu_post` VALUES ('1512', '410122', '451450', '0371');
INSERT INTO `kefu_post` VALUES ('1513', '410181', '452100', '0371');
INSERT INTO `kefu_post` VALUES ('1514', '410182', '450100', '0371');
INSERT INTO `kefu_post` VALUES ('1515', '410183', '452370', '0371');
INSERT INTO `kefu_post` VALUES ('1516', '410184', '451100', '0371');
INSERT INTO `kefu_post` VALUES ('1517', '410185', '452470', '0371');
INSERT INTO `kefu_post` VALUES ('1518', '410201', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1519', '410202', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1520', '410203', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1521', '410204', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1522', '410205', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1523', '410211', '475000', '0378');
INSERT INTO `kefu_post` VALUES ('1524', '410221', '475200', '0378');
INSERT INTO `kefu_post` VALUES ('1525', '410222', '452200', '0378');
INSERT INTO `kefu_post` VALUES ('1526', '410223', '452100', '0378');
INSERT INTO `kefu_post` VALUES ('1527', '410224', '475100', '0378');
INSERT INTO `kefu_post` VALUES ('1528', '410225', '475300', '0378');
INSERT INTO `kefu_post` VALUES ('1529', '410301', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1530', '410302', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1531', '410303', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1532', '410304', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1533', '410305', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1534', '410306', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1535', '410307', '471000', '0379');
INSERT INTO `kefu_post` VALUES ('1536', '410322', '471100', '0379');
INSERT INTO `kefu_post` VALUES ('1537', '410323', '471800', '0379');
INSERT INTO `kefu_post` VALUES ('1538', '410324', '471500', '0379');
INSERT INTO `kefu_post` VALUES ('1539', '410325', '471400', '0379');
INSERT INTO `kefu_post` VALUES ('1540', '410326', '471200', '0379');
INSERT INTO `kefu_post` VALUES ('1541', '410327', '471600', '0379');
INSERT INTO `kefu_post` VALUES ('1542', '410328', '471700', '0379');
INSERT INTO `kefu_post` VALUES ('1543', '410329', '471300', '0379');
INSERT INTO `kefu_post` VALUES ('1544', '410381', '471900', '0379');
INSERT INTO `kefu_post` VALUES ('1545', '410401', '467000', '0375');
INSERT INTO `kefu_post` VALUES ('1546', '410402', '467000', '0375');
INSERT INTO `kefu_post` VALUES ('1547', '410403', '467000', '0375');
INSERT INTO `kefu_post` VALUES ('1548', '410404', '467000', '0375');
INSERT INTO `kefu_post` VALUES ('1549', '410411', '467000', '0375');
INSERT INTO `kefu_post` VALUES ('1550', '410421', '467400', '0375');
INSERT INTO `kefu_post` VALUES ('1551', '410422', '467200', '0375');
INSERT INTO `kefu_post` VALUES ('1552', '410423', '467300', '0375');
INSERT INTO `kefu_post` VALUES ('1553', '410425', '467100', '0375');
INSERT INTO `kefu_post` VALUES ('1554', '410481', '462500', '0375');
INSERT INTO `kefu_post` VALUES ('1555', '410482', '467500', '0375');
INSERT INTO `kefu_post` VALUES ('1556', '410501', '455000', '0372');
INSERT INTO `kefu_post` VALUES ('1557', '410502', '455000', '0372');
INSERT INTO `kefu_post` VALUES ('1558', '410503', '455000', '0372');
INSERT INTO `kefu_post` VALUES ('1559', '410505', '455000', '0372');
INSERT INTO `kefu_post` VALUES ('1560', '410506', '455000', '0372');
INSERT INTO `kefu_post` VALUES ('1561', '410522', '455100', '0372');
INSERT INTO `kefu_post` VALUES ('1562', '410523', '456150', '0372');
INSERT INTO `kefu_post` VALUES ('1563', '410526', '456400', '0372');
INSERT INTO `kefu_post` VALUES ('1564', '410527', '456300', '0372');
INSERT INTO `kefu_post` VALUES ('1565', '410581', '456500', '0372');
INSERT INTO `kefu_post` VALUES ('1566', '410601', '458000', '0392');
INSERT INTO `kefu_post` VALUES ('1567', '410602', '458000', '0392');
INSERT INTO `kefu_post` VALUES ('1568', '410603', '458000', '0392');
INSERT INTO `kefu_post` VALUES ('1569', '410611', '458000', '0392');
INSERT INTO `kefu_post` VALUES ('1570', '410621', '456250', '0392');
INSERT INTO `kefu_post` VALUES ('1571', '410622', '456750', '0392');
INSERT INTO `kefu_post` VALUES ('1572', '410701', '453000', '0373');
INSERT INTO `kefu_post` VALUES ('1573', '410702', '453000', '0373');
INSERT INTO `kefu_post` VALUES ('1574', '410703', '453000', '0373');
INSERT INTO `kefu_post` VALUES ('1575', '410704', '453000', '0373');
INSERT INTO `kefu_post` VALUES ('1576', '410711', '453000', '0373');
INSERT INTO `kefu_post` VALUES ('1577', '410721', '453700', '0373');
INSERT INTO `kefu_post` VALUES ('1578', '410724', '453800', '0373');
INSERT INTO `kefu_post` VALUES ('1579', '410725', '453500', '0373');
INSERT INTO `kefu_post` VALUES ('1580', '410726', '453200', '0373');
INSERT INTO `kefu_post` VALUES ('1581', '410727', '453300', '0373');
INSERT INTO `kefu_post` VALUES ('1582', '410728', '453400', '0373');
INSERT INTO `kefu_post` VALUES ('1583', '410781', '453100', '0373');
INSERT INTO `kefu_post` VALUES ('1584', '410782', '453600', '0373');
INSERT INTO `kefu_post` VALUES ('1585', '410801', '454150', '0391');
INSERT INTO `kefu_post` VALUES ('1586', '410802', '454150', '0391');
INSERT INTO `kefu_post` VALUES ('1587', '410803', '454150', '0391');
INSERT INTO `kefu_post` VALUES ('1588', '410804', '454150', '0391');
INSERT INTO `kefu_post` VALUES ('1589', '410811', '454150', '0391');
INSERT INTO `kefu_post` VALUES ('1590', '410821', '454350', '0391');
INSERT INTO `kefu_post` VALUES ('1591', '410822', '454450', '0391');
INSERT INTO `kefu_post` VALUES ('1592', '410823', '454950', '0391');
INSERT INTO `kefu_post` VALUES ('1593', '410825', '454850', '0391');
INSERT INTO `kefu_post` VALUES ('1594', '410881', '454650', '0391');
INSERT INTO `kefu_post` VALUES ('1595', '410882', '454550', '0391');
INSERT INTO `kefu_post` VALUES ('1596', '410883', '454750', '0391');
INSERT INTO `kefu_post` VALUES ('1597', '410901', '457000', '0393');
INSERT INTO `kefu_post` VALUES ('1598', '410902', '457000', '0393');
INSERT INTO `kefu_post` VALUES ('1599', '410922', '457300', '0393');
INSERT INTO `kefu_post` VALUES ('1600', '410923', '457400', '0393');
INSERT INTO `kefu_post` VALUES ('1601', '410926', '457500', '0393');
INSERT INTO `kefu_post` VALUES ('1602', '410927', '457600', '0393');
INSERT INTO `kefu_post` VALUES ('1603', '410928', '457100', '0393');
INSERT INTO `kefu_post` VALUES ('1604', '411001', '461000', '0373');
INSERT INTO `kefu_post` VALUES ('1605', '411002', '461000', '0374');
INSERT INTO `kefu_post` VALUES ('1606', '411023', '461100', '0374');
INSERT INTO `kefu_post` VALUES ('1607', '411024', '461200', '0374');
INSERT INTO `kefu_post` VALUES ('1608', '411025', '452670', '0374');
INSERT INTO `kefu_post` VALUES ('1609', '411081', '452570', '0374');
INSERT INTO `kefu_post` VALUES ('1610', '411082', '461500', '0374');
INSERT INTO `kefu_post` VALUES ('1611', '411101', '462000', '0395');
INSERT INTO `kefu_post` VALUES ('1612', '411102', '462000', '0395');
INSERT INTO `kefu_post` VALUES ('1613', '411103', '462300', '0395');
INSERT INTO `kefu_post` VALUES ('1614', '411104', '462300', '0395');
INSERT INTO `kefu_post` VALUES ('1615', '411121', '462400', '0395');
INSERT INTO `kefu_post` VALUES ('1616', '411122', '462600', '0395');
INSERT INTO `kefu_post` VALUES ('1617', '411201', '472000', '0398');
INSERT INTO `kefu_post` VALUES ('1618', '411202', '472000', '0398');
INSERT INTO `kefu_post` VALUES ('1619', '411221', '472400', '0398');
INSERT INTO `kefu_post` VALUES ('1620', '411222', '472100', '0398');
INSERT INTO `kefu_post` VALUES ('1621', '411224', '472200', '0398');
INSERT INTO `kefu_post` VALUES ('1622', '411281', '472300', '0398');
INSERT INTO `kefu_post` VALUES ('1623', '411282', '472500', '0398');
INSERT INTO `kefu_post` VALUES ('1624', '411301', '473000', '0377');
INSERT INTO `kefu_post` VALUES ('1625', '411302', '473000', '0377');
INSERT INTO `kefu_post` VALUES ('1626', '411303', '473000', '0377');
INSERT INTO `kefu_post` VALUES ('1627', '411321', '474650', '0377');
INSERT INTO `kefu_post` VALUES ('1628', '411322', '473200', '0377');
INSERT INTO `kefu_post` VALUES ('1629', '411323', '474550', '0377');
INSERT INTO `kefu_post` VALUES ('1630', '411324', '474250', '0377');
INSERT INTO `kefu_post` VALUES ('1631', '411325', '474350', '0377');
INSERT INTO `kefu_post` VALUES ('1632', '411326', '474450', '0377');
INSERT INTO `kefu_post` VALUES ('1633', '411327', '473300', '0377');
INSERT INTO `kefu_post` VALUES ('1634', '411328', '473400', '0377');
INSERT INTO `kefu_post` VALUES ('1635', '411329', '473500', '0377');
INSERT INTO `kefu_post` VALUES ('1636', '411330', '474750', '0377');
INSERT INTO `kefu_post` VALUES ('1637', '411381', '474150', '0377');
INSERT INTO `kefu_post` VALUES ('1638', '411401', '476000', '0370');
INSERT INTO `kefu_post` VALUES ('1639', '411402', '476000', '0370');
INSERT INTO `kefu_post` VALUES ('1640', '411403', '476000', '0370');
INSERT INTO `kefu_post` VALUES ('1641', '411421', '476800', '0370');
INSERT INTO `kefu_post` VALUES ('1642', '411422', '476900', '0370');
INSERT INTO `kefu_post` VALUES ('1643', '411423', '476700', '0370');
INSERT INTO `kefu_post` VALUES ('1644', '411424', '476200', '0370');
INSERT INTO `kefu_post` VALUES ('1645', '411425', '476300', '0370');
INSERT INTO `kefu_post` VALUES ('1646', '411426', '476400', '0370');
INSERT INTO `kefu_post` VALUES ('1647', '411481', '476600', '0370');
INSERT INTO `kefu_post` VALUES ('1648', '411501', '464000', '0376');
INSERT INTO `kefu_post` VALUES ('1649', '411502', '464000', '0376');
INSERT INTO `kefu_post` VALUES ('1650', '411503', '464000', '0376');
INSERT INTO `kefu_post` VALUES ('1651', '411521', '464200', '0376');
INSERT INTO `kefu_post` VALUES ('1652', '411522', '465450', '0397');
INSERT INTO `kefu_post` VALUES ('1653', '411523', '465500', '0397');
INSERT INTO `kefu_post` VALUES ('1654', '411524', '465350', '0397');
INSERT INTO `kefu_post` VALUES ('1655', '411525', '465200', '0397');
INSERT INTO `kefu_post` VALUES ('1656', '411526', '465150', '0397');
INSERT INTO `kefu_post` VALUES ('1657', '411527', '464400', '0397');
INSERT INTO `kefu_post` VALUES ('1658', '411528', '464300', '0397');
INSERT INTO `kefu_post` VALUES ('1659', '411601', '466000', '0394');
INSERT INTO `kefu_post` VALUES ('1660', '411602', '466000', '0394');
INSERT INTO `kefu_post` VALUES ('1661', '411621', '461300', '0394');
INSERT INTO `kefu_post` VALUES ('1662', '411622', '466600', '0394');
INSERT INTO `kefu_post` VALUES ('1663', '411623', '466100', '0394');
INSERT INTO `kefu_post` VALUES ('1664', '411624', '466300', '0394');
INSERT INTO `kefu_post` VALUES ('1665', '411625', '477150', '0394');
INSERT INTO `kefu_post` VALUES ('1666', '411626', '466700', '0394');
INSERT INTO `kefu_post` VALUES ('1667', '411627', '475400', '0394');
INSERT INTO `kefu_post` VALUES ('1668', '411628', '477200', '0394');
INSERT INTO `kefu_post` VALUES ('1669', '411681', '466200', '0394');
INSERT INTO `kefu_post` VALUES ('1670', '411701', '463000', '0396');
INSERT INTO `kefu_post` VALUES ('1671', '411702', '463000', '0396');
INSERT INTO `kefu_post` VALUES ('1672', '411721', '463900', '0396');
INSERT INTO `kefu_post` VALUES ('1673', '411722', '463800', '0396');
INSERT INTO `kefu_post` VALUES ('1674', '411723', '463400', '0396');
INSERT INTO `kefu_post` VALUES ('1675', '411724', '463600', '0396');
INSERT INTO `kefu_post` VALUES ('1676', '411725', '463200', '0396');
INSERT INTO `kefu_post` VALUES ('1677', '411726', '463700', '0396');
INSERT INTO `kefu_post` VALUES ('1678', '411727', '463300', '0396');
INSERT INTO `kefu_post` VALUES ('1679', '411728', '463100', '0396');
INSERT INTO `kefu_post` VALUES ('1680', '411729', '463500', '0396');
INSERT INTO `kefu_post` VALUES ('1681', '420101', '430000', '027');
INSERT INTO `kefu_post` VALUES ('1682', '420102', '430014', '027');
INSERT INTO `kefu_post` VALUES ('1683', '420103', '430000', '027');
INSERT INTO `kefu_post` VALUES ('1684', '420104', '430000', '027');
INSERT INTO `kefu_post` VALUES ('1685', '420105', '430050', '027');
INSERT INTO `kefu_post` VALUES ('1686', '420106', '430000', '027');
INSERT INTO `kefu_post` VALUES ('1687', '420107', '430080', '027');
INSERT INTO `kefu_post` VALUES ('1688', '420111', '430070', '027');
INSERT INTO `kefu_post` VALUES ('1689', '420112', '430040', '027');
INSERT INTO `kefu_post` VALUES ('1690', '420113', '430090', '027');
INSERT INTO `kefu_post` VALUES ('1691', '420114', '430100', '027');
INSERT INTO `kefu_post` VALUES ('1692', '420115', '430200', '027');
INSERT INTO `kefu_post` VALUES ('1693', '420116', '432200', '027');
INSERT INTO `kefu_post` VALUES ('1694', '420117', '431400', '027');
INSERT INTO `kefu_post` VALUES ('1695', '420201', '435000', '0714');
INSERT INTO `kefu_post` VALUES ('1696', '420202', '435000', '0714');
INSERT INTO `kefu_post` VALUES ('1697', '420203', '435000', '0714');
INSERT INTO `kefu_post` VALUES ('1698', '420204', '435000', '0714');
INSERT INTO `kefu_post` VALUES ('1699', '420205', '435000', '0714');
INSERT INTO `kefu_post` VALUES ('1700', '420222', '435200', '0714');
INSERT INTO `kefu_post` VALUES ('1701', '420281', '435100', '0714');
INSERT INTO `kefu_post` VALUES ('1702', '420301', '442000', '0719');
INSERT INTO `kefu_post` VALUES ('1703', '420302', '442000', '0719');
INSERT INTO `kefu_post` VALUES ('1704', '420303', '442000', '0719');
INSERT INTO `kefu_post` VALUES ('1705', '420321', '442500', '0719');
INSERT INTO `kefu_post` VALUES ('1706', '420322', '442600', '0719');
INSERT INTO `kefu_post` VALUES ('1707', '420323', '442200', '0719');
INSERT INTO `kefu_post` VALUES ('1708', '420324', '442300', '0719');
INSERT INTO `kefu_post` VALUES ('1709', '420325', '442100', '0719');
INSERT INTO `kefu_post` VALUES ('1710', '420381', '442700', '0719');
INSERT INTO `kefu_post` VALUES ('1711', '420501', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1712', '420502', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1713', '420503', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1714', '420504', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1715', '420505', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1716', '420506', '443100', '0717');
INSERT INTO `kefu_post` VALUES ('1717', '420525', '444200', '0717');
INSERT INTO `kefu_post` VALUES ('1718', '420526', '443700', '0717');
INSERT INTO `kefu_post` VALUES ('1719', '420527', '443600', '0717');
INSERT INTO `kefu_post` VALUES ('1720', '420528', '443500', '0717');
INSERT INTO `kefu_post` VALUES ('1721', '420529', '443400', '0717');
INSERT INTO `kefu_post` VALUES ('1722', '420581', '443000', '0717');
INSERT INTO `kefu_post` VALUES ('1723', '420582', '444100', '0717');
INSERT INTO `kefu_post` VALUES ('1724', '420583', '443200', '0717');
INSERT INTO `kefu_post` VALUES ('1725', '420601', '441000', '0710');
INSERT INTO `kefu_post` VALUES ('1726', '420602', '441000', '0710');
INSERT INTO `kefu_post` VALUES ('1727', '420606', '441000', '0710');
INSERT INTO `kefu_post` VALUES ('1728', '420607', '441100', '0710');
INSERT INTO `kefu_post` VALUES ('1729', '420624', '441500', '0710');
INSERT INTO `kefu_post` VALUES ('1730', '420625', '441700', '0710');
INSERT INTO `kefu_post` VALUES ('1731', '420626', '441600', '0710');
INSERT INTO `kefu_post` VALUES ('1732', '420682', '441800', '0710');
INSERT INTO `kefu_post` VALUES ('1733', '420683', '441200', '0710');
INSERT INTO `kefu_post` VALUES ('1734', '420684', '441400', '0710');
INSERT INTO `kefu_post` VALUES ('1735', '420701', '436000', '0711');
INSERT INTO `kefu_post` VALUES ('1736', '420702', '436000', '0711');
INSERT INTO `kefu_post` VALUES ('1737', '420703', '436000', '0711');
INSERT INTO `kefu_post` VALUES ('1738', '420704', '436000', '0711');
INSERT INTO `kefu_post` VALUES ('1739', '420801', '448000', '0724');
INSERT INTO `kefu_post` VALUES ('1740', '420802', '448000', '0724');
INSERT INTO `kefu_post` VALUES ('1741', '420804', '448000', '0724');
INSERT INTO `kefu_post` VALUES ('1742', '420821', '431800', '0724');
INSERT INTO `kefu_post` VALUES ('1743', '420822', '448200', '0724');
INSERT INTO `kefu_post` VALUES ('1744', '420881', '431900', '0724');
INSERT INTO `kefu_post` VALUES ('1745', '420901', '432000', '0712');
INSERT INTO `kefu_post` VALUES ('1746', '420902', '432100', '0712');
INSERT INTO `kefu_post` VALUES ('1747', '420921', '432900', '0712');
INSERT INTO `kefu_post` VALUES ('1748', '420922', '432800', '0712');
INSERT INTO `kefu_post` VALUES ('1749', '420923', '432500', '0712');
INSERT INTO `kefu_post` VALUES ('1750', '420981', '432400', '0712');
INSERT INTO `kefu_post` VALUES ('1751', '420982', '432600', '0712');
INSERT INTO `kefu_post` VALUES ('1752', '420984', '432300', '0712');
INSERT INTO `kefu_post` VALUES ('1753', '421001', '434000', '0716');
INSERT INTO `kefu_post` VALUES ('1754', '421002', '434000', '0716');
INSERT INTO `kefu_post` VALUES ('1755', '421003', '434020', '0716');
INSERT INTO `kefu_post` VALUES ('1756', '421022', '434300', '0716');
INSERT INTO `kefu_post` VALUES ('1757', '421023', '433300', '0716');
INSERT INTO `kefu_post` VALUES ('1758', '421024', '434100', '0716');
INSERT INTO `kefu_post` VALUES ('1759', '421081', '434400', '0716');
INSERT INTO `kefu_post` VALUES ('1760', '421083', '433200', '0716');
INSERT INTO `kefu_post` VALUES ('1761', '421087', '434200', '0716');
INSERT INTO `kefu_post` VALUES ('1762', '421101', '438000', '0713');
INSERT INTO `kefu_post` VALUES ('1763', '421102', '438000', '0713');
INSERT INTO `kefu_post` VALUES ('1764', '421121', '438000', '0713');
INSERT INTO `kefu_post` VALUES ('1765', '421122', '438400', '0713');
INSERT INTO `kefu_post` VALUES ('1766', '421123', '438600', '0713');
INSERT INTO `kefu_post` VALUES ('1767', '421124', '438700', '0713');
INSERT INTO `kefu_post` VALUES ('1768', '421125', '438200', '0713');
INSERT INTO `kefu_post` VALUES ('1769', '421126', '435300', '0713');
INSERT INTO `kefu_post` VALUES ('1770', '421127', '435500', '0713');
INSERT INTO `kefu_post` VALUES ('1771', '421181', '438300', '0713');
INSERT INTO `kefu_post` VALUES ('1772', '421182', '435400', '0713');
INSERT INTO `kefu_post` VALUES ('1773', '421201', '437000', '0715');
INSERT INTO `kefu_post` VALUES ('1774', '421202', '437000', '0715');
INSERT INTO `kefu_post` VALUES ('1775', '421221', '437200', '0715');
INSERT INTO `kefu_post` VALUES ('1776', '421222', '437400', '0715');
INSERT INTO `kefu_post` VALUES ('1777', '421223', '437500', '0715');
INSERT INTO `kefu_post` VALUES ('1778', '421224', '437600', '0715');
INSERT INTO `kefu_post` VALUES ('1779', '421281', '437300', '0715');
INSERT INTO `kefu_post` VALUES ('1780', '421301', '441300', '0722');
INSERT INTO `kefu_post` VALUES ('1781', '421302', '441300', '0722');
INSERT INTO `kefu_post` VALUES ('1782', '421381', '432700', '0722');
INSERT INTO `kefu_post` VALUES ('1783', '422801', '445000', '0718');
INSERT INTO `kefu_post` VALUES ('1784', '422802', '445400', '0718');
INSERT INTO `kefu_post` VALUES ('1785', '422822', '445300', '0718');
INSERT INTO `kefu_post` VALUES ('1786', '422823', '444300', '0718');
INSERT INTO `kefu_post` VALUES ('1787', '422825', '445500', '0718');
INSERT INTO `kefu_post` VALUES ('1788', '422826', '445600', '0718');
INSERT INTO `kefu_post` VALUES ('1789', '422827', '445700', '0718');
INSERT INTO `kefu_post` VALUES ('1790', '422828', '445800', '0718');
INSERT INTO `kefu_post` VALUES ('1791', '429004', '433000', '0728');
INSERT INTO `kefu_post` VALUES ('1792', '429005', '433100', '0728');
INSERT INTO `kefu_post` VALUES ('1793', '429006', '431700', '0728');
INSERT INTO `kefu_post` VALUES ('1794', '429021', '442400', '0719');
INSERT INTO `kefu_post` VALUES ('1795', '430101', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1796', '430102', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1797', '430103', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1798', '430104', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1799', '430105', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1800', '430111', '410000', '0731');
INSERT INTO `kefu_post` VALUES ('1801', '430121', '410100', '0731');
INSERT INTO `kefu_post` VALUES ('1802', '430122', '410200', '0731');
INSERT INTO `kefu_post` VALUES ('1803', '430124', '410600', '0731');
INSERT INTO `kefu_post` VALUES ('1804', '430181', '410300', '0731');
INSERT INTO `kefu_post` VALUES ('1805', '430201', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1806', '430202', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1807', '430203', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1808', '430204', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1809', '430211', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1810', '430221', '412000', '0733');
INSERT INTO `kefu_post` VALUES ('1811', '430223', '412300', '0733');
INSERT INTO `kefu_post` VALUES ('1812', '430224', '412400', '0733');
INSERT INTO `kefu_post` VALUES ('1813', '430225', '412500', '0733');
INSERT INTO `kefu_post` VALUES ('1814', '430281', '412200', '0733');
INSERT INTO `kefu_post` VALUES ('1815', '430301', '411100', '0732');
INSERT INTO `kefu_post` VALUES ('1816', '430302', '411100', '0732');
INSERT INTO `kefu_post` VALUES ('1817', '430304', '411100', '0732');
INSERT INTO `kefu_post` VALUES ('1818', '430321', '411200', '0732');
INSERT INTO `kefu_post` VALUES ('1819', '430381', '411400', '0732');
INSERT INTO `kefu_post` VALUES ('1820', '430382', '411300', '0732');
INSERT INTO `kefu_post` VALUES ('1821', '430401', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1822', '430405', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1823', '430406', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1824', '430407', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1825', '430408', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1826', '430412', '421000', '0734');
INSERT INTO `kefu_post` VALUES ('1827', '430421', '421200', '0734');
INSERT INTO `kefu_post` VALUES ('1828', '430422', '421100', '0734');
INSERT INTO `kefu_post` VALUES ('1829', '430423', '421300', '0734');
INSERT INTO `kefu_post` VALUES ('1830', '430424', '421400', '0734');
INSERT INTO `kefu_post` VALUES ('1831', '430426', '421600', '0734');
INSERT INTO `kefu_post` VALUES ('1832', '430481', '421800', '0734');
INSERT INTO `kefu_post` VALUES ('1833', '430482', '421500', '0734');
INSERT INTO `kefu_post` VALUES ('1834', '430501', '422000', '0739');
INSERT INTO `kefu_post` VALUES ('1835', '430502', '422000', '0739');
INSERT INTO `kefu_post` VALUES ('1836', '430503', '422000', '0739');
INSERT INTO `kefu_post` VALUES ('1837', '430511', '422000', '0739');
INSERT INTO `kefu_post` VALUES ('1838', '430521', '422800', '0739');
INSERT INTO `kefu_post` VALUES ('1839', '430522', '422900', '0739');
INSERT INTO `kefu_post` VALUES ('1840', '430523', '422100', '0739');
INSERT INTO `kefu_post` VALUES ('1841', '430524', '422200', '0739');
INSERT INTO `kefu_post` VALUES ('1842', '430525', '422300', '0739');
INSERT INTO `kefu_post` VALUES ('1843', '430527', '422600', '0739');
INSERT INTO `kefu_post` VALUES ('1844', '430528', '422700', '0739');
INSERT INTO `kefu_post` VALUES ('1845', '430529', '422500', '0739');
INSERT INTO `kefu_post` VALUES ('1846', '430581', '422400', '0739');
INSERT INTO `kefu_post` VALUES ('1847', '430601', '414000', '0730');
INSERT INTO `kefu_post` VALUES ('1848', '430602', '414000', '0730');
INSERT INTO `kefu_post` VALUES ('1849', '430603', '414000', '0730');
INSERT INTO `kefu_post` VALUES ('1850', '430611', '414000', '0730');
INSERT INTO `kefu_post` VALUES ('1851', '430621', '414100', '0730');
INSERT INTO `kefu_post` VALUES ('1852', '430623', '414200', '0730');
INSERT INTO `kefu_post` VALUES ('1853', '430624', '410500', '0730');
INSERT INTO `kefu_post` VALUES ('1854', '430626', '410400', '0730');
INSERT INTO `kefu_post` VALUES ('1855', '430681', '414400', '0730');
INSERT INTO `kefu_post` VALUES ('1856', '430682', '414300', '0730');
INSERT INTO `kefu_post` VALUES ('1857', '430701', '415000', '0736');
INSERT INTO `kefu_post` VALUES ('1858', '430702', '415000', '0736');
INSERT INTO `kefu_post` VALUES ('1859', '430703', '415100', '0736');
INSERT INTO `kefu_post` VALUES ('1860', '430721', '415600', '0736');
INSERT INTO `kefu_post` VALUES ('1861', '430722', '415900', '0736');
INSERT INTO `kefu_post` VALUES ('1862', '430723', '415500', '0736');
INSERT INTO `kefu_post` VALUES ('1863', '430724', '415200', '0736');
INSERT INTO `kefu_post` VALUES ('1864', '430725', '415700', '0736');
INSERT INTO `kefu_post` VALUES ('1865', '430726', '415300', '0736');
INSERT INTO `kefu_post` VALUES ('1866', '430781', '415400', '0736');
INSERT INTO `kefu_post` VALUES ('1867', '430801', '427000', '0744');
INSERT INTO `kefu_post` VALUES ('1868', '430802', '427000', '0744');
INSERT INTO `kefu_post` VALUES ('1869', '430811', '427400', '0744');
INSERT INTO `kefu_post` VALUES ('1870', '430821', '427200', '0744');
INSERT INTO `kefu_post` VALUES ('1871', '430822', '427100', '0744');
INSERT INTO `kefu_post` VALUES ('1872', '430901', '413000', '0737');
INSERT INTO `kefu_post` VALUES ('1873', '430902', '413000', '0737');
INSERT INTO `kefu_post` VALUES ('1874', '430903', '413000', '0737');
INSERT INTO `kefu_post` VALUES ('1875', '430921', '413200', '0737');
INSERT INTO `kefu_post` VALUES ('1876', '430922', '413400', '0737');
INSERT INTO `kefu_post` VALUES ('1877', '430923', '413500', '0737');
INSERT INTO `kefu_post` VALUES ('1878', '430981', '413100', '0737');
INSERT INTO `kefu_post` VALUES ('1879', '431001', '423000', '0735');
INSERT INTO `kefu_post` VALUES ('1880', '431002', '423000', '0735');
INSERT INTO `kefu_post` VALUES ('1881', '431003', '423000', '0735');
INSERT INTO `kefu_post` VALUES ('1882', '431021', '424400', '0735');
INSERT INTO `kefu_post` VALUES ('1883', '431022', '424200', '0735');
INSERT INTO `kefu_post` VALUES ('1884', '431023', '423300', '0735');
INSERT INTO `kefu_post` VALUES ('1885', '431024', '424500', '0735');
INSERT INTO `kefu_post` VALUES ('1886', '431025', '424300', '0735');
INSERT INTO `kefu_post` VALUES ('1887', '431026', '424100', '0735');
INSERT INTO `kefu_post` VALUES ('1888', '431027', '423500', '0735');
INSERT INTO `kefu_post` VALUES ('1889', '431028', '423600', '0735');
INSERT INTO `kefu_post` VALUES ('1890', '431081', '423400', '0735');
INSERT INTO `kefu_post` VALUES ('1891', '431101', '425000', '0746');
INSERT INTO `kefu_post` VALUES ('1892', '431102', '425000', '0746');
INSERT INTO `kefu_post` VALUES ('1893', '431103', '425000', '0746');
INSERT INTO `kefu_post` VALUES ('1894', '431121', '421700', '0746');
INSERT INTO `kefu_post` VALUES ('1895', '431122', '425900', '0746');
INSERT INTO `kefu_post` VALUES ('1896', '431123', '425200', '0746');
INSERT INTO `kefu_post` VALUES ('1897', '431124', '425300', '0746');
INSERT INTO `kefu_post` VALUES ('1898', '431125', '425400', '0746');
INSERT INTO `kefu_post` VALUES ('1899', '431126', '425600', '0746');
INSERT INTO `kefu_post` VALUES ('1900', '431127', '425800', '0746');
INSERT INTO `kefu_post` VALUES ('1901', '431128', '425700', '0746');
INSERT INTO `kefu_post` VALUES ('1902', '431129', '425500', '0746');
INSERT INTO `kefu_post` VALUES ('1903', '431201', '418000', '0745');
INSERT INTO `kefu_post` VALUES ('1904', '431202', '418000', '0745');
INSERT INTO `kefu_post` VALUES ('1905', '431221', '418000', '0745');
INSERT INTO `kefu_post` VALUES ('1906', '431222', '419600', '0745');
INSERT INTO `kefu_post` VALUES ('1907', '431223', '419500', '0745');
INSERT INTO `kefu_post` VALUES ('1908', '431224', '419300', '0745');
INSERT INTO `kefu_post` VALUES ('1909', '431225', '418300', '0745');
INSERT INTO `kefu_post` VALUES ('1910', '431226', '419400', '0745');
INSERT INTO `kefu_post` VALUES ('1911', '431227', '419200', '0745');
INSERT INTO `kefu_post` VALUES ('1912', '431228', '419100', '0745');
INSERT INTO `kefu_post` VALUES ('1913', '431229', '418400', '0745');
INSERT INTO `kefu_post` VALUES ('1914', '431230', '418500', '0745');
INSERT INTO `kefu_post` VALUES ('1915', '431281', '418200', '0745');
INSERT INTO `kefu_post` VALUES ('1916', '431301', '417000', '0738');
INSERT INTO `kefu_post` VALUES ('1917', '431302', '417000', '0738');
INSERT INTO `kefu_post` VALUES ('1918', '431321', '417700', '0738');
INSERT INTO `kefu_post` VALUES ('1919', '431322', '417600', '0738');
INSERT INTO `kefu_post` VALUES ('1920', '431381', '417500', '0738');
INSERT INTO `kefu_post` VALUES ('1921', '431382', '417100', '0738');
INSERT INTO `kefu_post` VALUES ('1922', '433101', '416000', '0743');
INSERT INTO `kefu_post` VALUES ('1923', '433122', '416100', '0743');
INSERT INTO `kefu_post` VALUES ('1924', '433123', '416200', '0743');
INSERT INTO `kefu_post` VALUES ('1925', '433124', '416400', '0743');
INSERT INTO `kefu_post` VALUES ('1926', '433125', '416500', '0743');
INSERT INTO `kefu_post` VALUES ('1927', '433126', '416300', '0743');
INSERT INTO `kefu_post` VALUES ('1928', '433127', '416700', '0743');
INSERT INTO `kefu_post` VALUES ('1929', '433130', '416800', '0743');
INSERT INTO `kefu_post` VALUES ('1930', '440101', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1931', '440102', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1932', '440103', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1933', '440104', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1934', '440105', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1935', '440106', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1936', '440107', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1937', '440111', '510000', '020');
INSERT INTO `kefu_post` VALUES ('1938', '440112', '510700', '020');
INSERT INTO `kefu_post` VALUES ('1939', '440113', '511400', '020');
INSERT INTO `kefu_post` VALUES ('1940', '440114', '510800', '020');
INSERT INTO `kefu_post` VALUES ('1941', '440183', '511300', '020');
INSERT INTO `kefu_post` VALUES ('1942', '440184', '510900', '020');
INSERT INTO `kefu_post` VALUES ('1943', '440201', '512000', '0751');
INSERT INTO `kefu_post` VALUES ('1944', '440203', '512000', '0751');
INSERT INTO `kefu_post` VALUES ('1945', '440204', '512000', '0751');
INSERT INTO `kefu_post` VALUES ('1946', '440205', '512100', '0751');
INSERT INTO `kefu_post` VALUES ('1947', '440222', '512500', '0751');
INSERT INTO `kefu_post` VALUES ('1948', '440224', '512300', '0751');
INSERT INTO `kefu_post` VALUES ('1949', '440229', '512600', '0751');
INSERT INTO `kefu_post` VALUES ('1950', '440232', '512600', '0751');
INSERT INTO `kefu_post` VALUES ('1951', '440233', '511100', '0751');
INSERT INTO `kefu_post` VALUES ('1952', '440281', '512200', '0751');
INSERT INTO `kefu_post` VALUES ('1953', '440282', '512400', '0751');
INSERT INTO `kefu_post` VALUES ('1954', '440301', '518000', '0755');
INSERT INTO `kefu_post` VALUES ('1955', '440303', '518000', '0755');
INSERT INTO `kefu_post` VALUES ('1956', '440304', '518000', '0755');
INSERT INTO `kefu_post` VALUES ('1957', '440305', '518000', '0755');
INSERT INTO `kefu_post` VALUES ('1958', '440306', '518100', '0755');
INSERT INTO `kefu_post` VALUES ('1959', '440307', '518100', '0755');
INSERT INTO `kefu_post` VALUES ('1960', '440308', '518000', '0755');
INSERT INTO `kefu_post` VALUES ('1961', '440401', '519000', '0756');
INSERT INTO `kefu_post` VALUES ('1962', '440402', '519000', '0756');
INSERT INTO `kefu_post` VALUES ('1963', '440403', '519100', '0756');
INSERT INTO `kefu_post` VALUES ('1964', '440404', '519090', '0756');
INSERT INTO `kefu_post` VALUES ('1965', '440501', '515000', '0754');
INSERT INTO `kefu_post` VALUES ('1966', '440507', '515000', '0754');
INSERT INTO `kefu_post` VALUES ('1967', '440511', '515000', '0754');
INSERT INTO `kefu_post` VALUES ('1968', '440512', '515000', '0754');
INSERT INTO `kefu_post` VALUES ('1969', '440513', '515100', '0661');
INSERT INTO `kefu_post` VALUES ('1970', '440514', '515100', '0661');
INSERT INTO `kefu_post` VALUES ('1971', '440515', '515800', '0754');
INSERT INTO `kefu_post` VALUES ('1972', '440523', '515900', '0754');
INSERT INTO `kefu_post` VALUES ('1973', '440601', '528000', '0757');
INSERT INTO `kefu_post` VALUES ('1974', '440604', '528000', '0757');
INSERT INTO `kefu_post` VALUES ('1975', '440605', '528200', '0757');
INSERT INTO `kefu_post` VALUES ('1976', '440606', '528000', '0757');
INSERT INTO `kefu_post` VALUES ('1977', '440607', '528100', '0757');
INSERT INTO `kefu_post` VALUES ('1978', '440608', '528500', '0757');
INSERT INTO `kefu_post` VALUES ('1979', '440701', '529000', '0750');
INSERT INTO `kefu_post` VALUES ('1980', '440703', '529000', '0750');
INSERT INTO `kefu_post` VALUES ('1981', '440704', '529000', '0750');
INSERT INTO `kefu_post` VALUES ('1982', '440705', '529100', '0750');
INSERT INTO `kefu_post` VALUES ('1983', '440781', '529200', '0750');
INSERT INTO `kefu_post` VALUES ('1984', '440783', '529300', '0750');
INSERT INTO `kefu_post` VALUES ('1985', '440784', '529700', '0750');
INSERT INTO `kefu_post` VALUES ('1986', '440785', '529400', '0750');
INSERT INTO `kefu_post` VALUES ('1987', '440801', '524000', '0759');
INSERT INTO `kefu_post` VALUES ('1988', '440802', '524000', '0759');
INSERT INTO `kefu_post` VALUES ('1989', '440803', '524000', '0759');
INSERT INTO `kefu_post` VALUES ('1990', '440804', '524000', '0759');
INSERT INTO `kefu_post` VALUES ('1991', '440811', '524000', '0759');
INSERT INTO `kefu_post` VALUES ('1992', '440823', '524300', '0759');
INSERT INTO `kefu_post` VALUES ('1993', '440825', '524100', '0759');
INSERT INTO `kefu_post` VALUES ('1994', '440881', '524400', '0759');
INSERT INTO `kefu_post` VALUES ('1995', '440882', '524200', '0759');
INSERT INTO `kefu_post` VALUES ('1996', '440883', '524500', '0759');
INSERT INTO `kefu_post` VALUES ('1997', '440901', '525000', '0688');
INSERT INTO `kefu_post` VALUES ('1998', '440902', '525000', '0668');
INSERT INTO `kefu_post` VALUES ('1999', '440903', '525000', '0668');
INSERT INTO `kefu_post` VALUES ('2000', '440923', '525400', '0668');
INSERT INTO `kefu_post` VALUES ('2001', '440981', '525200', '0668');
INSERT INTO `kefu_post` VALUES ('2002', '440982', '525100', '0668');
INSERT INTO `kefu_post` VALUES ('2003', '440983', '525300', '0668');
INSERT INTO `kefu_post` VALUES ('2004', '441201', '526000', '0758');
INSERT INTO `kefu_post` VALUES ('2005', '441202', '526000', '0758');
INSERT INTO `kefu_post` VALUES ('2006', '441203', '526000', '0758');
INSERT INTO `kefu_post` VALUES ('2007', '441223', '526300', '0758');
INSERT INTO `kefu_post` VALUES ('2008', '441224', '526400', '0758');
INSERT INTO `kefu_post` VALUES ('2009', '441225', '526500', '0758');
INSERT INTO `kefu_post` VALUES ('2010', '441226', '526600', '0758');
INSERT INTO `kefu_post` VALUES ('2011', '441283', '526100', '0758');
INSERT INTO `kefu_post` VALUES ('2012', '441284', '526200', '0758');
INSERT INTO `kefu_post` VALUES ('2013', '441301', '516000', '0752');
INSERT INTO `kefu_post` VALUES ('2014', '441302', '516000', '0752');
INSERT INTO `kefu_post` VALUES ('2015', '441303', '516200', '0752');
INSERT INTO `kefu_post` VALUES ('2016', '441322', '516100', '0752');
INSERT INTO `kefu_post` VALUES ('2017', '441323', '516300', '0752');
INSERT INTO `kefu_post` VALUES ('2018', '441324', '516800', '0752');
INSERT INTO `kefu_post` VALUES ('2019', '441401', '514000', '0753');
INSERT INTO `kefu_post` VALUES ('2020', '441402', '514000', '0753');
INSERT INTO `kefu_post` VALUES ('2021', '441421', '514700', '0753');
INSERT INTO `kefu_post` VALUES ('2022', '441422', '514200', '0753');
INSERT INTO `kefu_post` VALUES ('2023', '441423', '514300', '0753');
INSERT INTO `kefu_post` VALUES ('2024', '441424', '514400', '0753');
INSERT INTO `kefu_post` VALUES ('2025', '441426', '514600', '0753');
INSERT INTO `kefu_post` VALUES ('2026', '441427', '514100', '0753');
INSERT INTO `kefu_post` VALUES ('2027', '441481', '514500', '0753');
INSERT INTO `kefu_post` VALUES ('2028', '441501', '516600', '0660');
INSERT INTO `kefu_post` VALUES ('2029', '441502', '516600', '0660');
INSERT INTO `kefu_post` VALUES ('2030', '441521', '516400', '0660');
INSERT INTO `kefu_post` VALUES ('2031', '441523', '516700', '0660');
INSERT INTO `kefu_post` VALUES ('2032', '441581', '516500', '0660');
INSERT INTO `kefu_post` VALUES ('2033', '441601', '517000', '0762');
INSERT INTO `kefu_post` VALUES ('2034', '441602', '517000', '0762');
INSERT INTO `kefu_post` VALUES ('2035', '441621', '517400', '0762');
INSERT INTO `kefu_post` VALUES ('2036', '441622', '517300', '0762');
INSERT INTO `kefu_post` VALUES ('2037', '441623', '517100', '0762');
INSERT INTO `kefu_post` VALUES ('2038', '441624', '517200', '0762');
INSERT INTO `kefu_post` VALUES ('2039', '441625', '517500', '0762');
INSERT INTO `kefu_post` VALUES ('2040', '441701', '529500', '0662');
INSERT INTO `kefu_post` VALUES ('2041', '441702', '529500', '0662');
INSERT INTO `kefu_post` VALUES ('2042', '441721', '529800', '0662');
INSERT INTO `kefu_post` VALUES ('2043', '441723', '529900', '0662');
INSERT INTO `kefu_post` VALUES ('2044', '441781', '529600', '0662');
INSERT INTO `kefu_post` VALUES ('2045', '441801', '511500', '0763');
INSERT INTO `kefu_post` VALUES ('2046', '441802', '511500', '0763');
INSERT INTO `kefu_post` VALUES ('2047', '441821', '511600', '0763');
INSERT INTO `kefu_post` VALUES ('2048', '441823', '513100', '0763');
INSERT INTO `kefu_post` VALUES ('2049', '441825', '513200', '0763');
INSERT INTO `kefu_post` VALUES ('2050', '441826', '513300', '0763');
INSERT INTO `kefu_post` VALUES ('2051', '441827', '511800', '0763');
INSERT INTO `kefu_post` VALUES ('2052', '441881', '513000', '0763');
INSERT INTO `kefu_post` VALUES ('2053', '441882', '513400', '0763');
INSERT INTO `kefu_post` VALUES ('2054', '445101', '521000', '0768');
INSERT INTO `kefu_post` VALUES ('2055', '445102', '521000', '0768');
INSERT INTO `kefu_post` VALUES ('2056', '445121', '515600', '0768');
INSERT INTO `kefu_post` VALUES ('2057', '445122', '515700', '0768');
INSERT INTO `kefu_post` VALUES ('2058', '445201', '522000', '0663');
INSERT INTO `kefu_post` VALUES ('2059', '445202', '522000', '0663');
INSERT INTO `kefu_post` VALUES ('2060', '445221', '515500', '0663');
INSERT INTO `kefu_post` VALUES ('2061', '445222', '515400', '0663');
INSERT INTO `kefu_post` VALUES ('2062', '445224', '515200', '0663');
INSERT INTO `kefu_post` VALUES ('2063', '445281', '515300', '0663');
INSERT INTO `kefu_post` VALUES ('2064', '445301', '527300', '0766');
INSERT INTO `kefu_post` VALUES ('2065', '445302', '527300', '0766');
INSERT INTO `kefu_post` VALUES ('2066', '445321', '527400', '0766');
INSERT INTO `kefu_post` VALUES ('2067', '445322', '527100', '0766');
INSERT INTO `kefu_post` VALUES ('2068', '445323', '527500', '0766');
INSERT INTO `kefu_post` VALUES ('2069', '445381', '527200', '0766');
INSERT INTO `kefu_post` VALUES ('2070', '450101', '530000', '0771');
INSERT INTO `kefu_post` VALUES ('2071', '450102', '530000', '0771');
INSERT INTO `kefu_post` VALUES ('2072', '450103', '530000', '0771');
INSERT INTO `kefu_post` VALUES ('2073', '450105', '530000', '0771');
INSERT INTO `kefu_post` VALUES ('2074', '450107', '530000', '0771');
INSERT INTO `kefu_post` VALUES ('2075', '450108', '530200', '0771');
INSERT INTO `kefu_post` VALUES ('2076', '450109', '530200', '0771');
INSERT INTO `kefu_post` VALUES ('2077', '450122', '530100', '0771');
INSERT INTO `kefu_post` VALUES ('2078', '450123', '532700', '0771');
INSERT INTO `kefu_post` VALUES ('2079', '450124', '530600', '0771');
INSERT INTO `kefu_post` VALUES ('2080', '450125', '530500', '0771');
INSERT INTO `kefu_post` VALUES ('2081', '450126', '530400', '0771');
INSERT INTO `kefu_post` VALUES ('2082', '450127', '530300', '0771');
INSERT INTO `kefu_post` VALUES ('2083', '450201', '545000', '0772');
INSERT INTO `kefu_post` VALUES ('2084', '450202', '545000', '0772');
INSERT INTO `kefu_post` VALUES ('2085', '450203', '545000', '0772');
INSERT INTO `kefu_post` VALUES ('2086', '450204', '545000', '0772');
INSERT INTO `kefu_post` VALUES ('2087', '450205', '545000', '0772');
INSERT INTO `kefu_post` VALUES ('2088', '450221', '545100', '0772');
INSERT INTO `kefu_post` VALUES ('2089', '450222', '545200', '0772');
INSERT INTO `kefu_post` VALUES ('2090', '450223', '545600', '0772');
INSERT INTO `kefu_post` VALUES ('2091', '450224', '545400', '0772');
INSERT INTO `kefu_post` VALUES ('2092', '450225', '545300', '0772');
INSERT INTO `kefu_post` VALUES ('2093', '450226', '545500', '0772');
INSERT INTO `kefu_post` VALUES ('2094', '450301', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2095', '450302', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2096', '450303', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2097', '450304', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2098', '450305', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2099', '450311', '541000', '0773');
INSERT INTO `kefu_post` VALUES ('2100', '450321', '541900', '0773');
INSERT INTO `kefu_post` VALUES ('2101', '450322', '541100', '0773');
INSERT INTO `kefu_post` VALUES ('2102', '450323', '541200', '0773');
INSERT INTO `kefu_post` VALUES ('2103', '450324', '541500', '0773');
INSERT INTO `kefu_post` VALUES ('2104', '450325', '541300', '0773');
INSERT INTO `kefu_post` VALUES ('2105', '450326', '541800', '0773');
INSERT INTO `kefu_post` VALUES ('2106', '450327', '541600', '0773');
INSERT INTO `kefu_post` VALUES ('2107', '450328', '541700', '0773');
INSERT INTO `kefu_post` VALUES ('2108', '450329', '541400', '0773');
INSERT INTO `kefu_post` VALUES ('2109', '450330', '542400', '0773');
INSERT INTO `kefu_post` VALUES ('2110', '450331', '546600', '0773');
INSERT INTO `kefu_post` VALUES ('2111', '450332', '542500', '0773');
INSERT INTO `kefu_post` VALUES ('2112', '450401', '543000', '0774');
INSERT INTO `kefu_post` VALUES ('2113', '450403', '543000', '0774');
INSERT INTO `kefu_post` VALUES ('2114', '450404', '543000', '0774');
INSERT INTO `kefu_post` VALUES ('2115', '450405', '543000', '0774');
INSERT INTO `kefu_post` VALUES ('2116', '450421', '543100', '0774');
INSERT INTO `kefu_post` VALUES ('2117', '450422', '543300', '0774');
INSERT INTO `kefu_post` VALUES ('2118', '450423', '546700', '0774');
INSERT INTO `kefu_post` VALUES ('2119', '450481', '543200', '0774');
INSERT INTO `kefu_post` VALUES ('2120', '450501', '536000', '0779');
INSERT INTO `kefu_post` VALUES ('2121', '450502', '536000', '0779');
INSERT INTO `kefu_post` VALUES ('2122', '450503', '536000', '0779');
INSERT INTO `kefu_post` VALUES ('2123', '450512', '536000', '0779');
INSERT INTO `kefu_post` VALUES ('2124', '450521', '536100', '0779');
INSERT INTO `kefu_post` VALUES ('2125', '450601', '538000', '0770');
INSERT INTO `kefu_post` VALUES ('2126', '450602', '538000', '0770');
INSERT INTO `kefu_post` VALUES ('2127', '450603', '538000', '0770');
INSERT INTO `kefu_post` VALUES ('2128', '450621', '535500', '0770');
INSERT INTO `kefu_post` VALUES ('2129', '450681', '538100', '0770');
INSERT INTO `kefu_post` VALUES ('2130', '450701', '535000', '0777');
INSERT INTO `kefu_post` VALUES ('2131', '450702', '535000', '0777');
INSERT INTO `kefu_post` VALUES ('2132', '450703', '535000', '0777');
INSERT INTO `kefu_post` VALUES ('2133', '450721', '535400', '0777');
INSERT INTO `kefu_post` VALUES ('2134', '450722', '535300', '0777');
INSERT INTO `kefu_post` VALUES ('2135', '450801', '537100', '0775');
INSERT INTO `kefu_post` VALUES ('2136', '450802', '537100', '0775');
INSERT INTO `kefu_post` VALUES ('2137', '450803', '537100', '0775');
INSERT INTO `kefu_post` VALUES ('2138', '450804', '537100', '0775');
INSERT INTO `kefu_post` VALUES ('2139', '450821', '537300', '0775');
INSERT INTO `kefu_post` VALUES ('2140', '450881', '537200', '0775');
INSERT INTO `kefu_post` VALUES ('2141', '450901', '537000', '0775');
INSERT INTO `kefu_post` VALUES ('2142', '450902', '537000', '0775');
INSERT INTO `kefu_post` VALUES ('2143', '450921', '537500', '0775');
INSERT INTO `kefu_post` VALUES ('2144', '450922', '537700', '0775');
INSERT INTO `kefu_post` VALUES ('2145', '450923', '537600', '0775');
INSERT INTO `kefu_post` VALUES ('2146', '450924', '537800', '0775');
INSERT INTO `kefu_post` VALUES ('2147', '450981', '537400', '0775');
INSERT INTO `kefu_post` VALUES ('2148', '451001', '533000', '0776');
INSERT INTO `kefu_post` VALUES ('2149', '451002', '533000', '0776');
INSERT INTO `kefu_post` VALUES ('2150', '451021', '533600', '0776');
INSERT INTO `kefu_post` VALUES ('2151', '451022', '531500', '0776');
INSERT INTO `kefu_post` VALUES ('2152', '451023', '531400', '0776');
INSERT INTO `kefu_post` VALUES ('2153', '451024', '533700', '0776');
INSERT INTO `kefu_post` VALUES ('2154', '451025', '533800', '0776');
INSERT INTO `kefu_post` VALUES ('2155', '451026', '533900', '0776');
INSERT INTO `kefu_post` VALUES ('2156', '451027', '533100', '0776');
INSERT INTO `kefu_post` VALUES ('2157', '451028', '533200', '0776');
INSERT INTO `kefu_post` VALUES ('2158', '451029', '533300', '0776');
INSERT INTO `kefu_post` VALUES ('2159', '451030', '533500', '0776');
INSERT INTO `kefu_post` VALUES ('2160', '451031', '533500', '0776');
INSERT INTO `kefu_post` VALUES ('2161', '451101', '542800', '0774');
INSERT INTO `kefu_post` VALUES ('2162', '451102', '552106', '0774');
INSERT INTO `kefu_post` VALUES ('2163', '451121', '546800', '0774');
INSERT INTO `kefu_post` VALUES ('2164', '451122', '542600', '0774');
INSERT INTO `kefu_post` VALUES ('2165', '451123', '542700', '0774');
INSERT INTO `kefu_post` VALUES ('2166', '451201', '547000', '0778');
INSERT INTO `kefu_post` VALUES ('2167', '451202', '547000', '0778');
INSERT INTO `kefu_post` VALUES ('2168', '451221', '547200', '0778');
INSERT INTO `kefu_post` VALUES ('2169', '451222', '547300', '0778');
INSERT INTO `kefu_post` VALUES ('2170', '451223', '547600', '0778');
INSERT INTO `kefu_post` VALUES ('2171', '451224', '547400', '0778');
INSERT INTO `kefu_post` VALUES ('2172', '451225', '546400', '0778');
INSERT INTO `kefu_post` VALUES ('2173', '451226', '547100', '0778');
INSERT INTO `kefu_post` VALUES ('2174', '451227', '547500', '0778');
INSERT INTO `kefu_post` VALUES ('2175', '451228', '530700', '0778');
INSERT INTO `kefu_post` VALUES ('2176', '451229', '530800', '0778');
INSERT INTO `kefu_post` VALUES ('2177', '451281', '546300', '0778');
INSERT INTO `kefu_post` VALUES ('2178', '451301', '546100', '0772');
INSERT INTO `kefu_post` VALUES ('2179', '451302', '546100', '0772');
INSERT INTO `kefu_post` VALUES ('2180', '451321', '546200', '0772');
INSERT INTO `kefu_post` VALUES ('2181', '451322', '545800', '0772');
INSERT INTO `kefu_post` VALUES ('2182', '451323', '545900', '0772');
INSERT INTO `kefu_post` VALUES ('2183', '451324', '545700', '0772');
INSERT INTO `kefu_post` VALUES ('2184', '451381', '546500', '0772');
INSERT INTO `kefu_post` VALUES ('2185', '451401', '532200', '0771');
INSERT INTO `kefu_post` VALUES ('2186', '451402', '532200', '0771');
INSERT INTO `kefu_post` VALUES ('2187', '451421', '532100', '0771');
INSERT INTO `kefu_post` VALUES ('2188', '451422', '532500', '0771');
INSERT INTO `kefu_post` VALUES ('2189', '451423', '532400', '0771');
INSERT INTO `kefu_post` VALUES ('2190', '451424', '532300', '0771');
INSERT INTO `kefu_post` VALUES ('2191', '451425', '532800', '0771');
INSERT INTO `kefu_post` VALUES ('2192', '451481', '532600', '0771');
INSERT INTO `kefu_post` VALUES ('2193', '460101', '570100', '0898');
INSERT INTO `kefu_post` VALUES ('2194', '460105', '570100', '0898');
INSERT INTO `kefu_post` VALUES ('2195', '460106', '570100', '0898');
INSERT INTO `kefu_post` VALUES ('2196', '460107', '571100', '0898');
INSERT INTO `kefu_post` VALUES ('2197', '460108', '570100', '0898');
INSERT INTO `kefu_post` VALUES ('2198', '460201', '572000', '0898');
INSERT INTO `kefu_post` VALUES ('2199', '469001', '572200', '0898');
INSERT INTO `kefu_post` VALUES ('2200', '469002', '571400', '0898');
INSERT INTO `kefu_post` VALUES ('2201', '469003', '571700', '0898');
INSERT INTO `kefu_post` VALUES ('2202', '469005', '571300', '0898');
INSERT INTO `kefu_post` VALUES ('2203', '469006', '571500', '0898');
INSERT INTO `kefu_post` VALUES ('2204', '469007', '572600', '0898');
INSERT INTO `kefu_post` VALUES ('2205', '469025', '571200', '0898');
INSERT INTO `kefu_post` VALUES ('2206', '469026', '571600', '0898');
INSERT INTO `kefu_post` VALUES ('2207', '469027', '571900', '0898');
INSERT INTO `kefu_post` VALUES ('2208', '469028', '571800', '0898');
INSERT INTO `kefu_post` VALUES ('2209', '469030', '572800', '0898');
INSERT INTO `kefu_post` VALUES ('2210', '469031', '572700', '0898');
INSERT INTO `kefu_post` VALUES ('2211', '469033', '572500', '0898');
INSERT INTO `kefu_post` VALUES ('2212', '469034', '572400', '0898');
INSERT INTO `kefu_post` VALUES ('2213', '469035', '572300', '0898');
INSERT INTO `kefu_post` VALUES ('2214', '469036', '572900', '0898');
INSERT INTO `kefu_post` VALUES ('2215', '469037', '572000', '0898');
INSERT INTO `kefu_post` VALUES ('2216', '469038', '572000', '0898');
INSERT INTO `kefu_post` VALUES ('2217', '469039', '572000', '0898');
INSERT INTO `kefu_post` VALUES ('2218', '500101', '404100', '023');
INSERT INTO `kefu_post` VALUES ('2219', '500102', '408000', '023');
INSERT INTO `kefu_post` VALUES ('2220', '500103', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2221', '500104', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2222', '500105', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2223', '500106', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2224', '500107', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2225', '500108', '400000', '023');
INSERT INTO `kefu_post` VALUES ('2226', '500109', '400700', '023');
INSERT INTO `kefu_post` VALUES ('2227', '500110', '400800', '023');
INSERT INTO `kefu_post` VALUES ('2228', '500111', '400900', '023');
INSERT INTO `kefu_post` VALUES ('2229', '500112', '401120', '023');
INSERT INTO `kefu_post` VALUES ('2230', '500113', '401320', '023');
INSERT INTO `kefu_post` VALUES ('2231', '500114', '409000', '023');
INSERT INTO `kefu_post` VALUES ('2232', '500115', '401220', '023');
INSERT INTO `kefu_post` VALUES ('2233', '500222', '401420', '023');
INSERT INTO `kefu_post` VALUES ('2234', '500223', '402660', '023');
INSERT INTO `kefu_post` VALUES ('2235', '500224', '402560', '023');
INSERT INTO `kefu_post` VALUES ('2236', '500225', '402360', '023');
INSERT INTO `kefu_post` VALUES ('2237', '500226', '402460', '023');
INSERT INTO `kefu_post` VALUES ('2238', '500227', '402760', '023');
INSERT INTO `kefu_post` VALUES ('2239', '500228', '405200', '023');
INSERT INTO `kefu_post` VALUES ('2240', '500229', '405900', '023');
INSERT INTO `kefu_post` VALUES ('2241', '500230', '408200', '023');
INSERT INTO `kefu_post` VALUES ('2242', '500231', '408300', '023');
INSERT INTO `kefu_post` VALUES ('2243', '500232', '408500', '023');
INSERT INTO `kefu_post` VALUES ('2244', '500233', '404300', '023');
INSERT INTO `kefu_post` VALUES ('2245', '500234', '405400', '023');
INSERT INTO `kefu_post` VALUES ('2246', '500235', '404500', '023');
INSERT INTO `kefu_post` VALUES ('2247', '500236', '404600', '023');
INSERT INTO `kefu_post` VALUES ('2248', '500237', '404700', '023');
INSERT INTO `kefu_post` VALUES ('2249', '500238', '405800', '023');
INSERT INTO `kefu_post` VALUES ('2250', '500240', '409100', '023');
INSERT INTO `kefu_post` VALUES ('2251', '500241', '409900', '023');
INSERT INTO `kefu_post` VALUES ('2252', '500242', '409800', '023');
INSERT INTO `kefu_post` VALUES ('2253', '500243', '409600', '023');
INSERT INTO `kefu_post` VALUES ('2254', '500381', '402260', '023');
INSERT INTO `kefu_post` VALUES ('2255', '500382', '401520', '023');
INSERT INTO `kefu_post` VALUES ('2256', '500383', '402160', '023');
INSERT INTO `kefu_post` VALUES ('2257', '500384', '408400', '023');
INSERT INTO `kefu_post` VALUES ('2258', '510101', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2259', '510104', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2260', '510105', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2261', '510106', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2262', '510107', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2263', '510108', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2264', '510112', '610100', '028');
INSERT INTO `kefu_post` VALUES ('2265', '510113', '610300', '028');
INSERT INTO `kefu_post` VALUES ('2266', '510114', '610500', '028');
INSERT INTO `kefu_post` VALUES ('2267', '510115', '611100', '028');
INSERT INTO `kefu_post` VALUES ('2268', '510121', '610400', '028');
INSERT INTO `kefu_post` VALUES ('2269', '510122', '610200', '028');
INSERT INTO `kefu_post` VALUES ('2270', '510124', '611700', '028');
INSERT INTO `kefu_post` VALUES ('2271', '510129', '611300', '028');
INSERT INTO `kefu_post` VALUES ('2272', '510131', '611600', '028');
INSERT INTO `kefu_post` VALUES ('2273', '510132', '611400', '028');
INSERT INTO `kefu_post` VALUES ('2274', '510181', '611800', '028');
INSERT INTO `kefu_post` VALUES ('2275', '510182', '610000', '028');
INSERT INTO `kefu_post` VALUES ('2276', '510183', '611500', '028');
INSERT INTO `kefu_post` VALUES ('2277', '510184', '611200', '028');
INSERT INTO `kefu_post` VALUES ('2278', '510301', '643000', '0813');
INSERT INTO `kefu_post` VALUES ('2279', '510302', '643000', '0813');
INSERT INTO `kefu_post` VALUES ('2280', '510303', '643020', '0813');
INSERT INTO `kefu_post` VALUES ('2281', '510304', '643010', '0813');
INSERT INTO `kefu_post` VALUES ('2282', '510311', '643030', '0813');
INSERT INTO `kefu_post` VALUES ('2283', '510321', '643100', '0813');
INSERT INTO `kefu_post` VALUES ('2284', '510322', '643200', '0813');
INSERT INTO `kefu_post` VALUES ('2285', '510401', '617000', '0812');
INSERT INTO `kefu_post` VALUES ('2286', '510402', '617000', '0812');
INSERT INTO `kefu_post` VALUES ('2287', '510403', '617000', '0812');
INSERT INTO `kefu_post` VALUES ('2288', '510411', '617000', '0812');
INSERT INTO `kefu_post` VALUES ('2289', '510421', '617200', '0812');
INSERT INTO `kefu_post` VALUES ('2290', '510422', '617100', '0812');
INSERT INTO `kefu_post` VALUES ('2291', '510501', '646000', '0830');
INSERT INTO `kefu_post` VALUES ('2292', '510502', '646000', '0830');
INSERT INTO `kefu_post` VALUES ('2293', '510503', '646300', '0830');
INSERT INTO `kefu_post` VALUES ('2294', '510504', '646000', '0830');
INSERT INTO `kefu_post` VALUES ('2295', '510521', '646100', '0830');
INSERT INTO `kefu_post` VALUES ('2296', '510522', '646200', '0830');
INSERT INTO `kefu_post` VALUES ('2297', '510524', '646400', '0830');
INSERT INTO `kefu_post` VALUES ('2298', '510525', '646500', '0830');
INSERT INTO `kefu_post` VALUES ('2299', '510601', '618000', '0838');
INSERT INTO `kefu_post` VALUES ('2300', '510603', '618000', '0838');
INSERT INTO `kefu_post` VALUES ('2301', '510623', '618300', '0838');
INSERT INTO `kefu_post` VALUES ('2302', '510626', '618500', '0838');
INSERT INTO `kefu_post` VALUES ('2303', '510681', '618300', '0838');
INSERT INTO `kefu_post` VALUES ('2304', '510682', '618400', '0838');
INSERT INTO `kefu_post` VALUES ('2305', '510683', '618200', '0838');
INSERT INTO `kefu_post` VALUES ('2306', '510701', '621000', '0816');
INSERT INTO `kefu_post` VALUES ('2307', '510703', '621000', '0816');
INSERT INTO `kefu_post` VALUES ('2308', '510704', '621000', '0816');
INSERT INTO `kefu_post` VALUES ('2309', '510722', '621100', '0816');
INSERT INTO `kefu_post` VALUES ('2310', '510723', '621600', '0816');
INSERT INTO `kefu_post` VALUES ('2311', '510724', '622650', '0816');
INSERT INTO `kefu_post` VALUES ('2312', '510725', '622150', '0816');
INSERT INTO `kefu_post` VALUES ('2313', '510726', '622550', '0816');
INSERT INTO `kefu_post` VALUES ('2314', '510727', '622550', '0816');
INSERT INTO `kefu_post` VALUES ('2315', '510781', '621700', '0816');
INSERT INTO `kefu_post` VALUES ('2316', '510801', '628000', '0839');
INSERT INTO `kefu_post` VALUES ('2317', '510802', '628000', '0839');
INSERT INTO `kefu_post` VALUES ('2318', '510811', '628000', '0839');
INSERT INTO `kefu_post` VALUES ('2319', '510812', '628000', '0839');
INSERT INTO `kefu_post` VALUES ('2320', '510821', '628200', '0839');
INSERT INTO `kefu_post` VALUES ('2321', '510822', '628100', '0839');
INSERT INTO `kefu_post` VALUES ('2322', '510823', '628300', '0839');
INSERT INTO `kefu_post` VALUES ('2323', '510824', '628400', '0839');
INSERT INTO `kefu_post` VALUES ('2324', '510901', '629000', '0825');
INSERT INTO `kefu_post` VALUES ('2325', '510903', '629000', '0825');
INSERT INTO `kefu_post` VALUES ('2326', '510904', '629000', '0825');
INSERT INTO `kefu_post` VALUES ('2327', '510921', '629100', '0825');
INSERT INTO `kefu_post` VALUES ('2328', '510922', '629200', '0825');
INSERT INTO `kefu_post` VALUES ('2329', '510923', '629300', '0825');
INSERT INTO `kefu_post` VALUES ('2330', '511001', '628000', '0839');
INSERT INTO `kefu_post` VALUES ('2331', '511002', '641000', '0832');
INSERT INTO `kefu_post` VALUES ('2332', '511011', '641100', '0832');
INSERT INTO `kefu_post` VALUES ('2333', '511024', '642450', '0832');
INSERT INTO `kefu_post` VALUES ('2334', '511025', '641200', '0832');
INSERT INTO `kefu_post` VALUES ('2335', '511028', '642150', '0832');
INSERT INTO `kefu_post` VALUES ('2336', '511101', '614000', '0833');
INSERT INTO `kefu_post` VALUES ('2337', '511102', '614000', '0833');
INSERT INTO `kefu_post` VALUES ('2338', '511111', '614900', '0833');
INSERT INTO `kefu_post` VALUES ('2339', '511112', '614800', '0833');
INSERT INTO `kefu_post` VALUES ('2340', '511113', '614700', '0833');
INSERT INTO `kefu_post` VALUES ('2341', '511123', '614400', '0833');
INSERT INTO `kefu_post` VALUES ('2342', '511124', '613100', '0833');
INSERT INTO `kefu_post` VALUES ('2343', '511126', '614100', '0833');
INSERT INTO `kefu_post` VALUES ('2344', '511129', '614500', '0833');
INSERT INTO `kefu_post` VALUES ('2345', '511132', '614300', '0833');
INSERT INTO `kefu_post` VALUES ('2346', '511133', '614600', '0833');
INSERT INTO `kefu_post` VALUES ('2347', '511181', '614200', '0833');
INSERT INTO `kefu_post` VALUES ('2348', '511301', '637000', '0817');
INSERT INTO `kefu_post` VALUES ('2349', '511302', '637000', '0817');
INSERT INTO `kefu_post` VALUES ('2350', '511303', '637100', '0817');
INSERT INTO `kefu_post` VALUES ('2351', '511304', '637500', '0817');
INSERT INTO `kefu_post` VALUES ('2352', '511321', '637300', '0817');
INSERT INTO `kefu_post` VALUES ('2353', '511322', '637700', '0817');
INSERT INTO `kefu_post` VALUES ('2354', '511323', '637800', '0817');
INSERT INTO `kefu_post` VALUES ('2355', '511324', '637600', '0817');
INSERT INTO `kefu_post` VALUES ('2356', '511325', '637200', '0817');
INSERT INTO `kefu_post` VALUES ('2357', '511381', '637400', '0817');
INSERT INTO `kefu_post` VALUES ('2358', '511401', '620000', '0833');
INSERT INTO `kefu_post` VALUES ('2359', '511402', '620000', '0833');
INSERT INTO `kefu_post` VALUES ('2360', '511421', '620500', '0833');
INSERT INTO `kefu_post` VALUES ('2361', '511422', '620800', '0833');
INSERT INTO `kefu_post` VALUES ('2362', '511423', '620300', '0833');
INSERT INTO `kefu_post` VALUES ('2363', '511424', '620200', '0833');
INSERT INTO `kefu_post` VALUES ('2364', '511425', '620400', '0833');
INSERT INTO `kefu_post` VALUES ('2365', '511501', '644000', '0831');
INSERT INTO `kefu_post` VALUES ('2366', '511502', '644000', '0831');
INSERT INTO `kefu_post` VALUES ('2367', '511521', '644600', '0831');
INSERT INTO `kefu_post` VALUES ('2368', '511522', '644100', '0831');
INSERT INTO `kefu_post` VALUES ('2369', '511523', '644200', '0831');
INSERT INTO `kefu_post` VALUES ('2370', '511524', '644300', '0831');
INSERT INTO `kefu_post` VALUES ('2371', '511525', '645150', '0831');
INSERT INTO `kefu_post` VALUES ('2372', '511526', '644500', '0831');
INSERT INTO `kefu_post` VALUES ('2373', '511527', '645250', '0831');
INSERT INTO `kefu_post` VALUES ('2374', '511528', '644400', '0831');
INSERT INTO `kefu_post` VALUES ('2375', '511529', '645350', '0831');
INSERT INTO `kefu_post` VALUES ('2376', '511601', '638550', '0826');
INSERT INTO `kefu_post` VALUES ('2377', '511602', '638550', '0826');
INSERT INTO `kefu_post` VALUES ('2378', '511621', '638300', '0826');
INSERT INTO `kefu_post` VALUES ('2379', '511622', '638400', '0826');
INSERT INTO `kefu_post` VALUES ('2380', '511623', '638500', '0826');
INSERT INTO `kefu_post` VALUES ('2381', '511681', '638600', '0826');
INSERT INTO `kefu_post` VALUES ('2382', '511701', '635000', '0818');
INSERT INTO `kefu_post` VALUES ('2383', '511702', '635000', '0818');
INSERT INTO `kefu_post` VALUES ('2384', '511721', '635000', '0818');
INSERT INTO `kefu_post` VALUES ('2385', '511722', '636150', '0818');
INSERT INTO `kefu_post` VALUES ('2386', '511723', '636250', '0818');
INSERT INTO `kefu_post` VALUES ('2387', '511724', '635100', '0818');
INSERT INTO `kefu_post` VALUES ('2388', '511725', '635200', '0818');
INSERT INTO `kefu_post` VALUES ('2389', '511781', '636350', '0818');
INSERT INTO `kefu_post` VALUES ('2390', '511801', '625000', '0835');
INSERT INTO `kefu_post` VALUES ('2391', '511802', '625000', '0835');
INSERT INTO `kefu_post` VALUES ('2392', '511821', '625100', '0835');
INSERT INTO `kefu_post` VALUES ('2393', '511822', '625200', '0835');
INSERT INTO `kefu_post` VALUES ('2394', '511823', '625300', '0835');
INSERT INTO `kefu_post` VALUES ('2395', '511824', '625400', '0835');
INSERT INTO `kefu_post` VALUES ('2396', '511825', '625500', '0835');
INSERT INTO `kefu_post` VALUES ('2397', '511826', '625600', '0835');
INSERT INTO `kefu_post` VALUES ('2398', '511827', '625700', '0835');
INSERT INTO `kefu_post` VALUES ('2399', '511901', '636600', '0827');
INSERT INTO `kefu_post` VALUES ('2400', '511902', '636600', '0827');
INSERT INTO `kefu_post` VALUES ('2401', '511921', '636700', '0827');
INSERT INTO `kefu_post` VALUES ('2402', '511922', '635600', '0827');
INSERT INTO `kefu_post` VALUES ('2403', '511923', '636400', '0827');
INSERT INTO `kefu_post` VALUES ('2404', '512001', '641300', '0832');
INSERT INTO `kefu_post` VALUES ('2405', '512002', '641300', '0832');
INSERT INTO `kefu_post` VALUES ('2406', '512021', '642350', '0832');
INSERT INTO `kefu_post` VALUES ('2407', '512022', '641500', '0832');
INSERT INTO `kefu_post` VALUES ('2408', '512081', '641400', '0832');
INSERT INTO `kefu_post` VALUES ('2409', '513221', '623000', '0837');
INSERT INTO `kefu_post` VALUES ('2410', '513222', '623100', '0837');
INSERT INTO `kefu_post` VALUES ('2411', '513223', '623200', '0837');
INSERT INTO `kefu_post` VALUES ('2412', '513224', '623300', '0837');
INSERT INTO `kefu_post` VALUES ('2413', '513225', '623400', '0837');
INSERT INTO `kefu_post` VALUES ('2414', '513226', '624100', '0837');
INSERT INTO `kefu_post` VALUES ('2415', '513227', '624200', '0837');
INSERT INTO `kefu_post` VALUES ('2416', '513228', '623500', '0837');
INSERT INTO `kefu_post` VALUES ('2417', '513229', '624000', '0837');
INSERT INTO `kefu_post` VALUES ('2418', '513230', '624300', '0837');
INSERT INTO `kefu_post` VALUES ('2419', '513231', '624600', '0837');
INSERT INTO `kefu_post` VALUES ('2420', '513232', '624500', '0837');
INSERT INTO `kefu_post` VALUES ('2421', '513233', '624400', '0837');
INSERT INTO `kefu_post` VALUES ('2422', '513321', '626000', '0836');
INSERT INTO `kefu_post` VALUES ('2423', '513322', '626100', '0836');
INSERT INTO `kefu_post` VALUES ('2424', '513323', '626300', '0836');
INSERT INTO `kefu_post` VALUES ('2425', '513324', '616200', '0836');
INSERT INTO `kefu_post` VALUES ('2426', '513325', '627450', '0836');
INSERT INTO `kefu_post` VALUES ('2427', '513326', '626400', '0836');
INSERT INTO `kefu_post` VALUES ('2428', '513327', '626500', '0836');
INSERT INTO `kefu_post` VALUES ('2429', '513328', '626700', '0836');
INSERT INTO `kefu_post` VALUES ('2430', '513329', '626800', '0836');
INSERT INTO `kefu_post` VALUES ('2431', '513330', '627250', '0836');
INSERT INTO `kefu_post` VALUES ('2432', '513331', '627150', '0836');
INSERT INTO `kefu_post` VALUES ('2433', '513332', '627350', '0836');
INSERT INTO `kefu_post` VALUES ('2434', '513333', '626600', '0836');
INSERT INTO `kefu_post` VALUES ('2435', '513334', '624300', '0836');
INSERT INTO `kefu_post` VALUES ('2436', '513335', '627650', '0836');
INSERT INTO `kefu_post` VALUES ('2437', '513336', '627850', '0836');
INSERT INTO `kefu_post` VALUES ('2438', '513337', '627750', '0836');
INSERT INTO `kefu_post` VALUES ('2439', '513338', '627950', '0836');
INSERT INTO `kefu_post` VALUES ('2440', '513401', '615000', '0834');
INSERT INTO `kefu_post` VALUES ('2441', '513422', '615800', '0834');
INSERT INTO `kefu_post` VALUES ('2442', '513423', '615700', '0834');
INSERT INTO `kefu_post` VALUES ('2443', '513424', '615500', '0834');
INSERT INTO `kefu_post` VALUES ('2444', '513425', '615100', '0834');
INSERT INTO `kefu_post` VALUES ('2445', '513426', '615200', '0834');
INSERT INTO `kefu_post` VALUES ('2446', '513427', '615400', '0834');
INSERT INTO `kefu_post` VALUES ('2447', '513428', '615300', '0834');
INSERT INTO `kefu_post` VALUES ('2448', '513429', '615350', '0834');
INSERT INTO `kefu_post` VALUES ('2449', '513430', '616250', '0834');
INSERT INTO `kefu_post` VALUES ('2450', '513431', '616150', '0834');
INSERT INTO `kefu_post` VALUES ('2451', '513432', '616750', '0834');
INSERT INTO `kefu_post` VALUES ('2452', '513433', '615600', '0834');
INSERT INTO `kefu_post` VALUES ('2453', '513434', '616650', '0834');
INSERT INTO `kefu_post` VALUES ('2454', '513435', '616850', '0834');
INSERT INTO `kefu_post` VALUES ('2455', '513436', '616450', '0834');
INSERT INTO `kefu_post` VALUES ('2456', '513437', '616550', '0834');
INSERT INTO `kefu_post` VALUES ('2457', '520101', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2458', '520102', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2459', '520103', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2460', '520111', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2461', '520112', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2462', '520113', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2463', '520114', '550000', '0851');
INSERT INTO `kefu_post` VALUES ('2464', '520121', '550300', '0851');
INSERT INTO `kefu_post` VALUES ('2465', '520122', '551100', '0851');
INSERT INTO `kefu_post` VALUES ('2466', '520123', '550200', '0851');
INSERT INTO `kefu_post` VALUES ('2467', '520181', '551400', '0851');
INSERT INTO `kefu_post` VALUES ('2468', '520201', '553000', '0858');
INSERT INTO `kefu_post` VALUES ('2469', '520203', '553400', '0858');
INSERT INTO `kefu_post` VALUES ('2470', '520221', '553000', '0858');
INSERT INTO `kefu_post` VALUES ('2471', '520222', '561600', '0858');
INSERT INTO `kefu_post` VALUES ('2472', '520301', '563000', '0852');
INSERT INTO `kefu_post` VALUES ('2473', '520302', '563000', '0852');
INSERT INTO `kefu_post` VALUES ('2474', '520303', '563000', '0852');
INSERT INTO `kefu_post` VALUES ('2475', '520321', '563100', '0852');
INSERT INTO `kefu_post` VALUES ('2476', '520322', '563200', '0852');
INSERT INTO `kefu_post` VALUES ('2477', '520323', '563300', '0852');
INSERT INTO `kefu_post` VALUES ('2478', '520324', '563400', '0852');
INSERT INTO `kefu_post` VALUES ('2479', '520325', '563500', '0852');
INSERT INTO `kefu_post` VALUES ('2480', '520326', '564300', '0852');
INSERT INTO `kefu_post` VALUES ('2481', '520327', '564200', '0852');
INSERT INTO `kefu_post` VALUES ('2482', '520328', '564100', '0852');
INSERT INTO `kefu_post` VALUES ('2483', '520329', '564400', '0852');
INSERT INTO `kefu_post` VALUES ('2484', '520330', '564600', '0852');
INSERT INTO `kefu_post` VALUES ('2485', '520381', '564700', '0852');
INSERT INTO `kefu_post` VALUES ('2486', '520382', '564500', '0852');
INSERT INTO `kefu_post` VALUES ('2487', '520401', '561000', '0853');
INSERT INTO `kefu_post` VALUES ('2488', '520402', '561000', '0853');
INSERT INTO `kefu_post` VALUES ('2489', '520421', '561100', '0853');
INSERT INTO `kefu_post` VALUES ('2490', '520422', '562100', '0853');
INSERT INTO `kefu_post` VALUES ('2491', '520423', '561200', '0853');
INSERT INTO `kefu_post` VALUES ('2492', '520424', '561300', '0853');
INSERT INTO `kefu_post` VALUES ('2493', '520425', '550800', '0853');
INSERT INTO `kefu_post` VALUES ('2494', '522201', '554300', '0856');
INSERT INTO `kefu_post` VALUES ('2495', '522222', '554400', '0856');
INSERT INTO `kefu_post` VALUES ('2496', '522223', '554000', '0856');
INSERT INTO `kefu_post` VALUES ('2497', '522224', '555100', '0856');
INSERT INTO `kefu_post` VALUES ('2498', '522225', '565100', '0856');
INSERT INTO `kefu_post` VALUES ('2499', '522226', '555200', '0856');
INSERT INTO `kefu_post` VALUES ('2500', '522227', '565200', '0856');
INSERT INTO `kefu_post` VALUES ('2501', '522228', '565300', '0856');
INSERT INTO `kefu_post` VALUES ('2502', '522229', '554100', '0856');
INSERT INTO `kefu_post` VALUES ('2503', '522230', '554200', '0856');
INSERT INTO `kefu_post` VALUES ('2504', '522301', '562400', '0859');
INSERT INTO `kefu_post` VALUES ('2505', '522322', '562300', '0859');
INSERT INTO `kefu_post` VALUES ('2506', '522323', '561500', '0859');
INSERT INTO `kefu_post` VALUES ('2507', '522324', '561400', '0859');
INSERT INTO `kefu_post` VALUES ('2508', '522325', '562200', '0859');
INSERT INTO `kefu_post` VALUES ('2509', '522326', '552300', '0859');
INSERT INTO `kefu_post` VALUES ('2510', '522327', '552200', '0859');
INSERT INTO `kefu_post` VALUES ('2511', '522328', '552400', '0859');
INSERT INTO `kefu_post` VALUES ('2512', '522401', '551700', '0857');
INSERT INTO `kefu_post` VALUES ('2513', '522422', '551600', '0857');
INSERT INTO `kefu_post` VALUES ('2514', '522423', '551500', '0857');
INSERT INTO `kefu_post` VALUES ('2515', '522424', '551800', '0857');
INSERT INTO `kefu_post` VALUES ('2516', '522425', '552100', '0857');
INSERT INTO `kefu_post` VALUES ('2517', '522426', '553300', '0857');
INSERT INTO `kefu_post` VALUES ('2518', '522427', '553100', '0857');
INSERT INTO `kefu_post` VALUES ('2519', '522428', '553200', '0857');
INSERT INTO `kefu_post` VALUES ('2520', '522601', '556000', '0855');
INSERT INTO `kefu_post` VALUES ('2521', '522622', '556100', '0855');
INSERT INTO `kefu_post` VALUES ('2522', '522623', '556200', '0855');
INSERT INTO `kefu_post` VALUES ('2523', '522624', '556500', '0855');
INSERT INTO `kefu_post` VALUES ('2524', '522625', '557700', '0855');
INSERT INTO `kefu_post` VALUES ('2525', '522626', '557800', '0855');
INSERT INTO `kefu_post` VALUES ('2526', '522627', '556600', '0855');
INSERT INTO `kefu_post` VALUES ('2527', '522628', '556700', '0855');
INSERT INTO `kefu_post` VALUES ('2528', '522629', '556400', '0855');
INSERT INTO `kefu_post` VALUES ('2529', '522630', '556300', '0855');
INSERT INTO `kefu_post` VALUES ('2530', '522631', '557300', '0855');
INSERT INTO `kefu_post` VALUES ('2531', '522632', '557200', '0855');
INSERT INTO `kefu_post` VALUES ('2532', '522633', '557400', '0855');
INSERT INTO `kefu_post` VALUES ('2533', '522634', '557100', '0855');
INSERT INTO `kefu_post` VALUES ('2534', '522635', '557600', '0855');
INSERT INTO `kefu_post` VALUES ('2535', '522636', '557500', '0855');
INSERT INTO `kefu_post` VALUES ('2536', '522701', '558000', '0854');
INSERT INTO `kefu_post` VALUES ('2537', '522702', '550500', '0854');
INSERT INTO `kefu_post` VALUES ('2538', '522722', '558400', '0854');
INSERT INTO `kefu_post` VALUES ('2539', '522723', '551300', '0854');
INSERT INTO `kefu_post` VALUES ('2540', '522725', '550400', '0854');
INSERT INTO `kefu_post` VALUES ('2541', '522726', '558200', '0854');
INSERT INTO `kefu_post` VALUES ('2542', '522727', '558300', '0854');
INSERT INTO `kefu_post` VALUES ('2543', '522728', '550100', '0854');
INSERT INTO `kefu_post` VALUES ('2544', '522729', '550700', '0854');
INSERT INTO `kefu_post` VALUES ('2545', '522730', '551200', '0854');
INSERT INTO `kefu_post` VALUES ('2546', '522731', '550600', '0854');
INSERT INTO `kefu_post` VALUES ('2547', '522732', '558100', '0854');
INSERT INTO `kefu_post` VALUES ('2548', '530101', '650000', '0871');
INSERT INTO `kefu_post` VALUES ('2549', '530102', '650000', '0871');
INSERT INTO `kefu_post` VALUES ('2550', '530103', '650000', '0871');
INSERT INTO `kefu_post` VALUES ('2551', '530111', '650200', '0871');
INSERT INTO `kefu_post` VALUES ('2552', '530112', '650100', '0871');
INSERT INTO `kefu_post` VALUES ('2553', '530113', '654100', '0871');
INSERT INTO `kefu_post` VALUES ('2554', '530121', '650500', '0871');
INSERT INTO `kefu_post` VALUES ('2555', '530122', '650600', '0871');
INSERT INTO `kefu_post` VALUES ('2556', '530124', '650400', '0871');
INSERT INTO `kefu_post` VALUES ('2557', '530125', '652100', '0871');
INSERT INTO `kefu_post` VALUES ('2558', '530126', '652200', '0871');
INSERT INTO `kefu_post` VALUES ('2559', '530127', '651700', '0871');
INSERT INTO `kefu_post` VALUES ('2560', '530128', '651500', '0871');
INSERT INTO `kefu_post` VALUES ('2561', '530129', '655200', '0871');
INSERT INTO `kefu_post` VALUES ('2562', '530181', '650300', '0871');
INSERT INTO `kefu_post` VALUES ('2563', '530301', '655000', '0874');
INSERT INTO `kefu_post` VALUES ('2564', '530302', '655000', '0874');
INSERT INTO `kefu_post` VALUES ('2565', '530321', '655100', '0874');
INSERT INTO `kefu_post` VALUES ('2566', '530322', '655600', '0874');
INSERT INTO `kefu_post` VALUES ('2567', '530323', '655700', '0874');
INSERT INTO `kefu_post` VALUES ('2568', '530324', '655800', '0874');
INSERT INTO `kefu_post` VALUES ('2569', '530325', '655500', '0874');
INSERT INTO `kefu_post` VALUES ('2570', '530326', '654200', '0874');
INSERT INTO `kefu_post` VALUES ('2571', '530328', '655500', '0874');
INSERT INTO `kefu_post` VALUES ('2572', '530381', '655400', '0874');
INSERT INTO `kefu_post` VALUES ('2573', '530401', '653100', '0877');
INSERT INTO `kefu_post` VALUES ('2574', '530402', '653100', '0877');
INSERT INTO `kefu_post` VALUES ('2575', '530421', '652600', '0877');
INSERT INTO `kefu_post` VALUES ('2576', '530422', '652500', '0877');
INSERT INTO `kefu_post` VALUES ('2577', '530423', '652700', '0877');
INSERT INTO `kefu_post` VALUES ('2578', '530424', '652800', '0877');
INSERT INTO `kefu_post` VALUES ('2579', '530425', '651100', '0877');
INSERT INTO `kefu_post` VALUES ('2580', '530426', '653200', '0877');
INSERT INTO `kefu_post` VALUES ('2581', '530427', '653400', '0877');
INSERT INTO `kefu_post` VALUES ('2582', '530428', '653300', '0877');
INSERT INTO `kefu_post` VALUES ('2583', '530501', '678000', '0875');
INSERT INTO `kefu_post` VALUES ('2584', '530502', '678000', '0875');
INSERT INTO `kefu_post` VALUES ('2585', '530521', '678200', '0875');
INSERT INTO `kefu_post` VALUES ('2586', '530522', '679100', '0875');
INSERT INTO `kefu_post` VALUES ('2587', '530523', '678300', '0875');
INSERT INTO `kefu_post` VALUES ('2588', '530524', '678100', '0875');
INSERT INTO `kefu_post` VALUES ('2589', '530601', '657000', '0870');
INSERT INTO `kefu_post` VALUES ('2590', '530602', '657000', '0870');
INSERT INTO `kefu_post` VALUES ('2591', '530621', '657100', '0870');
INSERT INTO `kefu_post` VALUES ('2592', '530622', '654600', '0870');
INSERT INTO `kefu_post` VALUES ('2593', '530623', '657500', '0870');
INSERT INTO `kefu_post` VALUES ('2594', '530624', '657400', '0870');
INSERT INTO `kefu_post` VALUES ('2595', '530625', '657300', '0870');
INSERT INTO `kefu_post` VALUES ('2596', '530626', '657700', '0870');
INSERT INTO `kefu_post` VALUES ('2597', '530627', '657200', '0870');
INSERT INTO `kefu_post` VALUES ('2598', '530628', '657600', '0870');
INSERT INTO `kefu_post` VALUES ('2599', '530629', '657900', '0870');
INSERT INTO `kefu_post` VALUES ('2600', '530630', '657800', '0870');
INSERT INTO `kefu_post` VALUES ('2601', '530701', '674100', '0888');
INSERT INTO `kefu_post` VALUES ('2602', '530702', '674100', '0888');
INSERT INTO `kefu_post` VALUES ('2603', '530721', '674100', '0888');
INSERT INTO `kefu_post` VALUES ('2604', '530722', '674200', '0888');
INSERT INTO `kefu_post` VALUES ('2605', '530723', '674800', '0888');
INSERT INTO `kefu_post` VALUES ('2606', '530724', '674300', '0888');
INSERT INTO `kefu_post` VALUES ('2607', '530801', '665000', '0879');
INSERT INTO `kefu_post` VALUES ('2608', '530802', '665000', '0879');
INSERT INTO `kefu_post` VALUES ('2609', '530821', '665100', '0879');
INSERT INTO `kefu_post` VALUES ('2610', '530822', '654800', '0879');
INSERT INTO `kefu_post` VALUES ('2611', '530823', '676200', '0879');
INSERT INTO `kefu_post` VALUES ('2612', '530824', '666400', '0879');
INSERT INTO `kefu_post` VALUES ('2613', '530825', '666500', '0879');
INSERT INTO `kefu_post` VALUES ('2614', '530826', '665900', '0879');
INSERT INTO `kefu_post` VALUES ('2615', '530827', '665800', '0879');
INSERT INTO `kefu_post` VALUES ('2616', '530828', '665600', '0879');
INSERT INTO `kefu_post` VALUES ('2617', '530829', '665700', '0879');
INSERT INTO `kefu_post` VALUES ('2618', '530901', '677000', '0883');
INSERT INTO `kefu_post` VALUES ('2619', '530902', '677000', '0883');
INSERT INTO `kefu_post` VALUES ('2620', '530921', '675900', '0883');
INSERT INTO `kefu_post` VALUES ('2621', '530922', '675800', '0883');
INSERT INTO `kefu_post` VALUES ('2622', '530923', '677600', '0883');
INSERT INTO `kefu_post` VALUES ('2623', '530924', '677700', '0883');
INSERT INTO `kefu_post` VALUES ('2624', '530925', '677300', '0883');
INSERT INTO `kefu_post` VALUES ('2625', '530926', '677500', '0883');
INSERT INTO `kefu_post` VALUES ('2626', '530927', '677400', '0883');
INSERT INTO `kefu_post` VALUES ('2627', '532301', '675000', '0878');
INSERT INTO `kefu_post` VALUES ('2628', '532322', '675100', '0878');
INSERT INTO `kefu_post` VALUES ('2629', '532323', '675500', '0878');
INSERT INTO `kefu_post` VALUES ('2630', '532324', '675200', '0878');
INSERT INTO `kefu_post` VALUES ('2631', '532325', '675300', '0878');
INSERT INTO `kefu_post` VALUES ('2632', '532326', '675400', '0878');
INSERT INTO `kefu_post` VALUES ('2633', '532327', '651400', '0878');
INSERT INTO `kefu_post` VALUES ('2634', '532328', '651300', '0878');
INSERT INTO `kefu_post` VALUES ('2635', '532329', '651600', '0878');
INSERT INTO `kefu_post` VALUES ('2636', '532331', '651200', '0878');
INSERT INTO `kefu_post` VALUES ('2637', '532501', '661000', '0873');
INSERT INTO `kefu_post` VALUES ('2638', '532502', '661600', '0873');
INSERT INTO `kefu_post` VALUES ('2639', '532522', '661100', '0873');
INSERT INTO `kefu_post` VALUES ('2640', '532523', '661200', '0873');
INSERT INTO `kefu_post` VALUES ('2641', '532524', '654300', '0873');
INSERT INTO `kefu_post` VALUES ('2642', '532525', '662200', '0873');
INSERT INTO `kefu_post` VALUES ('2643', '532526', '652300', '0873');
INSERT INTO `kefu_post` VALUES ('2644', '532527', '652400', '0873');
INSERT INTO `kefu_post` VALUES ('2645', '532528', '662400', '0873');
INSERT INTO `kefu_post` VALUES ('2646', '532529', '654400', '0873');
INSERT INTO `kefu_post` VALUES ('2647', '532530', '661500', '0873');
INSERT INTO `kefu_post` VALUES ('2648', '532531', '662500', '0873');
INSERT INTO `kefu_post` VALUES ('2649', '532532', '661300', '0873');
INSERT INTO `kefu_post` VALUES ('2650', '532621', '663000', '0876');
INSERT INTO `kefu_post` VALUES ('2651', '532622', '663100', '0876');
INSERT INTO `kefu_post` VALUES ('2652', '532623', '663500', '0876');
INSERT INTO `kefu_post` VALUES ('2653', '532624', '663600', '0876');
INSERT INTO `kefu_post` VALUES ('2654', '532625', '663700', '0876');
INSERT INTO `kefu_post` VALUES ('2655', '532626', '663200', '0876');
INSERT INTO `kefu_post` VALUES ('2656', '532627', '663300', '0876');
INSERT INTO `kefu_post` VALUES ('2657', '532628', '663400', '0876');
INSERT INTO `kefu_post` VALUES ('2658', '532801', '666100', '0691');
INSERT INTO `kefu_post` VALUES ('2659', '532822', '666200', '0691');
INSERT INTO `kefu_post` VALUES ('2660', '532823', '666300', '0691');
INSERT INTO `kefu_post` VALUES ('2661', '532901', '671000', '0872');
INSERT INTO `kefu_post` VALUES ('2662', '532922', '672500', '0872');
INSERT INTO `kefu_post` VALUES ('2663', '532923', '672100', '0872');
INSERT INTO `kefu_post` VALUES ('2664', '532924', '671600', '0872');
INSERT INTO `kefu_post` VALUES ('2665', '532925', '675600', '0872');
INSERT INTO `kefu_post` VALUES ('2666', '532926', '675700', '0872');
INSERT INTO `kefu_post` VALUES ('2667', '532927', '672400', '0872');
INSERT INTO `kefu_post` VALUES ('2668', '532928', '672600', '0872');
INSERT INTO `kefu_post` VALUES ('2669', '532929', '672700', '0872');
INSERT INTO `kefu_post` VALUES ('2670', '532930', '671200', '0872');
INSERT INTO `kefu_post` VALUES ('2671', '532931', '671300', '0872');
INSERT INTO `kefu_post` VALUES ('2672', '532932', '671500', '0872');
INSERT INTO `kefu_post` VALUES ('2673', '533102', '678600', '0692');
INSERT INTO `kefu_post` VALUES ('2674', '533103', '678400', '0692');
INSERT INTO `kefu_post` VALUES ('2675', '533122', '679200', '0692');
INSERT INTO `kefu_post` VALUES ('2676', '533123', '679300', '0692');
INSERT INTO `kefu_post` VALUES ('2677', '533124', '678700', '0692');
INSERT INTO `kefu_post` VALUES ('2678', '533321', '673200', '0886');
INSERT INTO `kefu_post` VALUES ('2679', '533323', '673400', '0886');
INSERT INTO `kefu_post` VALUES ('2680', '533324', '673500', '0886');
INSERT INTO `kefu_post` VALUES ('2681', '533325', '671400', '0886');
INSERT INTO `kefu_post` VALUES ('2682', '533421', '674400', '0887');
INSERT INTO `kefu_post` VALUES ('2683', '533422', '674500', '0887');
INSERT INTO `kefu_post` VALUES ('2684', '533423', '674600', '0887');
INSERT INTO `kefu_post` VALUES ('2685', '540101', '850000', '0891');
INSERT INTO `kefu_post` VALUES ('2686', '540102', '850000', '0891');
INSERT INTO `kefu_post` VALUES ('2687', '540121', '851600', '0891');
INSERT INTO `kefu_post` VALUES ('2688', '540122', '851500', '0891');
INSERT INTO `kefu_post` VALUES ('2689', '540123', '851600', '0891');
INSERT INTO `kefu_post` VALUES ('2690', '540124', '850600', '0891');
INSERT INTO `kefu_post` VALUES ('2691', '540125', '851400', '0891');
INSERT INTO `kefu_post` VALUES ('2692', '540126', '850100', '0891');
INSERT INTO `kefu_post` VALUES ('2693', '540127', '850200', '0891');
INSERT INTO `kefu_post` VALUES ('2694', '542121', '854000', '0895');
INSERT INTO `kefu_post` VALUES ('2695', '542122', '854100', '0895');
INSERT INTO `kefu_post` VALUES ('2696', '542123', '854200', '0805');
INSERT INTO `kefu_post` VALUES ('2697', '542124', '855600', '0850');
INSERT INTO `kefu_post` VALUES ('2698', '542125', '855700', '0805');
INSERT INTO `kefu_post` VALUES ('2699', '542126', '854300', '0895');
INSERT INTO `kefu_post` VALUES ('2700', '542127', '854600', '0805');
INSERT INTO `kefu_post` VALUES ('2701', '542128', '854400', '0805');
INSERT INTO `kefu_post` VALUES ('2702', '542129', '854500', '0805');
INSERT INTO `kefu_post` VALUES ('2703', '542132', '855400', '0805');
INSERT INTO `kefu_post` VALUES ('2704', '542133', '855500', '0805');
INSERT INTO `kefu_post` VALUES ('2705', '542221', '856100', '0893');
INSERT INTO `kefu_post` VALUES ('2706', '542222', '850800', '0804');
INSERT INTO `kefu_post` VALUES ('2707', '542223', '850700', '0893');
INSERT INTO `kefu_post` VALUES ('2708', '542224', '856200', '0893');
INSERT INTO `kefu_post` VALUES ('2709', '542225', '856800', '0803');
INSERT INTO `kefu_post` VALUES ('2710', '542226', '856300', '0803');
INSERT INTO `kefu_post` VALUES ('2711', '542227', '856900', '0807');
INSERT INTO `kefu_post` VALUES ('2712', '542228', '851200', '0804');
INSERT INTO `kefu_post` VALUES ('2713', '542229', '856400', '0803');
INSERT INTO `kefu_post` VALUES ('2714', '542231', '856600', '0803');
INSERT INTO `kefu_post` VALUES ('2715', '542232', '856700', '0803');
INSERT INTO `kefu_post` VALUES ('2716', '542233', '851100', '0804');
INSERT INTO `kefu_post` VALUES ('2717', '542301', '857000', '0892');
INSERT INTO `kefu_post` VALUES ('2718', '542322', '857100', '0803');
INSERT INTO `kefu_post` VALUES ('2719', '542323', '857400', '0892');
INSERT INTO `kefu_post` VALUES ('2720', '542324', '858200', '0802');
INSERT INTO `kefu_post` VALUES ('2721', '542325', '857800', '0802');
INSERT INTO `kefu_post` VALUES ('2722', '542326', '858100', '0803');
INSERT INTO `kefu_post` VALUES ('2723', '542327', '858500', '0803');
INSERT INTO `kefu_post` VALUES ('2724', '542328', '858900', '0803');
INSERT INTO `kefu_post` VALUES ('2725', '542329', '857300', '0892');
INSERT INTO `kefu_post` VALUES ('2726', '542330', '857200', '0892');
INSERT INTO `kefu_post` VALUES ('2727', '542331', '857500', '0802');
INSERT INTO `kefu_post` VALUES ('2728', '542332', '857900', '0802');
INSERT INTO `kefu_post` VALUES ('2729', '542333', '858800', '0802');
INSERT INTO `kefu_post` VALUES ('2730', '542334', '857600', '0802');
INSERT INTO `kefu_post` VALUES ('2731', '542335', '858700', '0802');
INSERT INTO `kefu_post` VALUES ('2732', '542336', '858300', '0802');
INSERT INTO `kefu_post` VALUES ('2733', '542337', '858600', '0802');
INSERT INTO `kefu_post` VALUES ('2734', '542338', '857700', '0802');
INSERT INTO `kefu_post` VALUES ('2735', '542421', '852000', '0896');
INSERT INTO `kefu_post` VALUES ('2736', '542422', '852400', '0806');
INSERT INTO `kefu_post` VALUES ('2737', '542423', '852300', '0806');
INSERT INTO `kefu_post` VALUES ('2738', '542424', '853500', '0806');
INSERT INTO `kefu_post` VALUES ('2739', '542425', '853400', '0896');
INSERT INTO `kefu_post` VALUES ('2740', '542426', '853100', '0806');
INSERT INTO `kefu_post` VALUES ('2741', '542427', '852200', '0807');
INSERT INTO `kefu_post` VALUES ('2742', '542428', '852500', '0806');
INSERT INTO `kefu_post` VALUES ('2743', '542429', '852100', '0806');
INSERT INTO `kefu_post` VALUES ('2744', '542430', '853200', '0808');
INSERT INTO `kefu_post` VALUES ('2745', '542521', '859500', '0806');
INSERT INTO `kefu_post` VALUES ('2746', '542522', '859600', '0807');
INSERT INTO `kefu_post` VALUES ('2747', '542523', '859000', '0897');
INSERT INTO `kefu_post` VALUES ('2748', '542524', '859700', '0807');
INSERT INTO `kefu_post` VALUES ('2749', '542525', '859100', '0807');
INSERT INTO `kefu_post` VALUES ('2750', '542526', '859200', '0807');
INSERT INTO `kefu_post` VALUES ('2751', '542527', '859300', '0806');
INSERT INTO `kefu_post` VALUES ('2752', '542621', '860100', '0894');
INSERT INTO `kefu_post` VALUES ('2753', '542622', '860200', '0894');
INSERT INTO `kefu_post` VALUES ('2754', '542623', '860500', '0894');
INSERT INTO `kefu_post` VALUES ('2755', '542624', '860700', '0894');
INSERT INTO `kefu_post` VALUES ('2756', '542625', '860300', '0894');
INSERT INTO `kefu_post` VALUES ('2757', '542626', '860600', '0894');
INSERT INTO `kefu_post` VALUES ('2758', '542627', '860400', '0894');
INSERT INTO `kefu_post` VALUES ('2759', '610101', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2760', '610102', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2761', '610103', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2762', '610104', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2763', '610111', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2764', '610112', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2765', '610113', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2766', '610114', '710000', '029');
INSERT INTO `kefu_post` VALUES ('2767', '610115', '710600', '029');
INSERT INTO `kefu_post` VALUES ('2768', '610116', '710100', '029');
INSERT INTO `kefu_post` VALUES ('2769', '610122', '710500', '029');
INSERT INTO `kefu_post` VALUES ('2770', '610124', '710400', '029');
INSERT INTO `kefu_post` VALUES ('2771', '610125', '710300', '029');
INSERT INTO `kefu_post` VALUES ('2772', '610126', '710200', '029');
INSERT INTO `kefu_post` VALUES ('2773', '610201', '727000', '0919');
INSERT INTO `kefu_post` VALUES ('2774', '610202', '727000', '0919');
INSERT INTO `kefu_post` VALUES ('2775', '610203', '727000', '0919');
INSERT INTO `kefu_post` VALUES ('2776', '610204', '727100', '0919');
INSERT INTO `kefu_post` VALUES ('2777', '610222', '727200', '0919');
INSERT INTO `kefu_post` VALUES ('2778', '610301', '721000', '0917');
INSERT INTO `kefu_post` VALUES ('2779', '610302', '721000', '0917');
INSERT INTO `kefu_post` VALUES ('2780', '610303', '721000', '0917');
INSERT INTO `kefu_post` VALUES ('2781', '610304', '721300', '0917');
INSERT INTO `kefu_post` VALUES ('2782', '610322', '721400', '0917');
INSERT INTO `kefu_post` VALUES ('2783', '610323', '722400', '0917');
INSERT INTO `kefu_post` VALUES ('2784', '610324', '722200', '0917');
INSERT INTO `kefu_post` VALUES ('2785', '610326', '722300', '0917');
INSERT INTO `kefu_post` VALUES ('2786', '610327', '721200', '0917');
INSERT INTO `kefu_post` VALUES ('2787', '610328', '721100', '0917');
INSERT INTO `kefu_post` VALUES ('2788', '610329', '721500', '0917');
INSERT INTO `kefu_post` VALUES ('2789', '610330', '721700', '0917');
INSERT INTO `kefu_post` VALUES ('2790', '610331', '721600', '0917');
INSERT INTO `kefu_post` VALUES ('2791', '610401', '712000', '0910');
INSERT INTO `kefu_post` VALUES ('2792', '610402', '712000', '0910');
INSERT INTO `kefu_post` VALUES ('2793', '610403', '712000', '0910');
INSERT INTO `kefu_post` VALUES ('2794', '610404', '712000', '0910');
INSERT INTO `kefu_post` VALUES ('2795', '610422', '713800', '0910');
INSERT INTO `kefu_post` VALUES ('2796', '610423', '713700', '0910');
INSERT INTO `kefu_post` VALUES ('2797', '610424', '713300', '0910');
INSERT INTO `kefu_post` VALUES ('2798', '610425', '713200', '0910');
INSERT INTO `kefu_post` VALUES ('2799', '610426', '713400', '0910');
INSERT INTO `kefu_post` VALUES ('2800', '610427', '713500', '0910');
INSERT INTO `kefu_post` VALUES ('2801', '610428', '713600', '0910');
INSERT INTO `kefu_post` VALUES ('2802', '610429', '711300', '0910');
INSERT INTO `kefu_post` VALUES ('2803', '610430', '711200', '0910');
INSERT INTO `kefu_post` VALUES ('2804', '610431', '712200', '0910');
INSERT INTO `kefu_post` VALUES ('2805', '610481', '713100', '0910');
INSERT INTO `kefu_post` VALUES ('2806', '610501', '714000', '0913');
INSERT INTO `kefu_post` VALUES ('2807', '610502', '714000', '0913');
INSERT INTO `kefu_post` VALUES ('2808', '610521', '714100', '0913');
INSERT INTO `kefu_post` VALUES ('2809', '610522', '714300', '0913');
INSERT INTO `kefu_post` VALUES ('2810', '610523', '715100', '0913');
INSERT INTO `kefu_post` VALUES ('2811', '610524', '715300', '0913');
INSERT INTO `kefu_post` VALUES ('2812', '610525', '715200', '0913');
INSERT INTO `kefu_post` VALUES ('2813', '610526', '715500', '0913');
INSERT INTO `kefu_post` VALUES ('2814', '610527', '715600', '0913');
INSERT INTO `kefu_post` VALUES ('2815', '610528', '711700', '0913');
INSERT INTO `kefu_post` VALUES ('2816', '610581', '715400', '0913');
INSERT INTO `kefu_post` VALUES ('2817', '610582', '714200', '0913');
INSERT INTO `kefu_post` VALUES ('2818', '610601', '716000', '0911');
INSERT INTO `kefu_post` VALUES ('2819', '610602', '716000', '0911');
INSERT INTO `kefu_post` VALUES ('2820', '610621', '717100', '0911');
INSERT INTO `kefu_post` VALUES ('2821', '610622', '717200', '0911');
INSERT INTO `kefu_post` VALUES ('2822', '610623', '717300', '0911');
INSERT INTO `kefu_post` VALUES ('2823', '610624', '717400', '0911');
INSERT INTO `kefu_post` VALUES ('2824', '610625', '717500', '0911');
INSERT INTO `kefu_post` VALUES ('2825', '610626', '717600', '0911');
INSERT INTO `kefu_post` VALUES ('2826', '610627', '716100', '0911');
INSERT INTO `kefu_post` VALUES ('2827', '610628', '727500', '0911');
INSERT INTO `kefu_post` VALUES ('2828', '610629', '727400', '0911');
INSERT INTO `kefu_post` VALUES ('2829', '610630', '716200', '0911');
INSERT INTO `kefu_post` VALUES ('2830', '610631', '715700', '0911');
INSERT INTO `kefu_post` VALUES ('2831', '610632', '727300', '0911');
INSERT INTO `kefu_post` VALUES ('2832', '610701', '723000', '0916');
INSERT INTO `kefu_post` VALUES ('2833', '610702', '723000', '0916');
INSERT INTO `kefu_post` VALUES ('2834', '610721', '723100', '0916');
INSERT INTO `kefu_post` VALUES ('2835', '610722', '723200', '0916');
INSERT INTO `kefu_post` VALUES ('2836', '610723', '723300', '0916');
INSERT INTO `kefu_post` VALUES ('2837', '610724', '723500', '0916');
INSERT INTO `kefu_post` VALUES ('2838', '610725', '724200', '0916');
INSERT INTO `kefu_post` VALUES ('2839', '610726', '724400', '0916');
INSERT INTO `kefu_post` VALUES ('2840', '610727', '724300', '0916');
INSERT INTO `kefu_post` VALUES ('2841', '610728', '723600', '0916');
INSERT INTO `kefu_post` VALUES ('2842', '610729', '724100', '0916');
INSERT INTO `kefu_post` VALUES ('2843', '610730', '723400', '0916');
INSERT INTO `kefu_post` VALUES ('2844', '610801', '719000', '0912');
INSERT INTO `kefu_post` VALUES ('2845', '610802', '719000', '0912');
INSERT INTO `kefu_post` VALUES ('2846', '610821', '719300', '0912');
INSERT INTO `kefu_post` VALUES ('2847', '610822', '719400', '0912');
INSERT INTO `kefu_post` VALUES ('2848', '610823', '719200', '0912');
INSERT INTO `kefu_post` VALUES ('2849', '610824', '718500', '0912');
INSERT INTO `kefu_post` VALUES ('2850', '610825', '718600', '0912');
INSERT INTO `kefu_post` VALUES ('2851', '610826', '718000', '0912');
INSERT INTO `kefu_post` VALUES ('2852', '610827', '718100', '0912');
INSERT INTO `kefu_post` VALUES ('2853', '610828', '719200', '0912');
INSERT INTO `kefu_post` VALUES ('2854', '610829', '718200', '0912');
INSERT INTO `kefu_post` VALUES ('2855', '610830', '718300', '0912');
INSERT INTO `kefu_post` VALUES ('2856', '610831', '718400', '0912');
INSERT INTO `kefu_post` VALUES ('2857', '610901', '725000', '0915');
INSERT INTO `kefu_post` VALUES ('2858', '610902', '725000', '0915');
INSERT INTO `kefu_post` VALUES ('2859', '610921', '725100', '0915');
INSERT INTO `kefu_post` VALUES ('2860', '610922', '725200', '0915');
INSERT INTO `kefu_post` VALUES ('2861', '610923', '711600', '0915');
INSERT INTO `kefu_post` VALUES ('2862', '610924', '725300', '0915');
INSERT INTO `kefu_post` VALUES ('2863', '610925', '725400', '0915');
INSERT INTO `kefu_post` VALUES ('2864', '610926', '725500', '0915');
INSERT INTO `kefu_post` VALUES ('2865', '610927', '725600', '0915');
INSERT INTO `kefu_post` VALUES ('2866', '610928', '725700', '0915');
INSERT INTO `kefu_post` VALUES ('2867', '610929', '725800', '0915');
INSERT INTO `kefu_post` VALUES ('2868', '611001', '726000', '0914');
INSERT INTO `kefu_post` VALUES ('2869', '611002', '726000', '0914');
INSERT INTO `kefu_post` VALUES ('2870', '611021', '726100', '0914');
INSERT INTO `kefu_post` VALUES ('2871', '611022', '726200', '0914');
INSERT INTO `kefu_post` VALUES ('2872', '611023', '726300', '0914');
INSERT INTO `kefu_post` VALUES ('2873', '611024', '726400', '0914');
INSERT INTO `kefu_post` VALUES ('2874', '611025', '711500', '0914');
INSERT INTO `kefu_post` VALUES ('2875', '611026', '711400', '0914');
INSERT INTO `kefu_post` VALUES ('2876', '620101', '730000', '0931');
INSERT INTO `kefu_post` VALUES ('2877', '620102', '730030', '0931');
INSERT INTO `kefu_post` VALUES ('2878', '620103', '730050', '0931');
INSERT INTO `kefu_post` VALUES ('2879', '620104', '730060', '0931');
INSERT INTO `kefu_post` VALUES ('2880', '620105', '730070', '0931');
INSERT INTO `kefu_post` VALUES ('2881', '620111', '730080', '0931');
INSERT INTO `kefu_post` VALUES ('2882', '620121', '730300', '0931');
INSERT INTO `kefu_post` VALUES ('2883', '620122', '730200', '0931');
INSERT INTO `kefu_post` VALUES ('2884', '620123', '730100', '0931');
INSERT INTO `kefu_post` VALUES ('2885', '620201', '737100', '0935');
INSERT INTO `kefu_post` VALUES ('2886', '620301', '737100', '0935');
INSERT INTO `kefu_post` VALUES ('2887', '620302', '737100', '0935');
INSERT INTO `kefu_post` VALUES ('2888', '620321', '737200', '0935');
INSERT INTO `kefu_post` VALUES ('2889', '620401', '730900', '0943');
INSERT INTO `kefu_post` VALUES ('2890', '620402', '730900', '0943');
INSERT INTO `kefu_post` VALUES ('2891', '620403', '730900', '0943');
INSERT INTO `kefu_post` VALUES ('2892', '620421', '730600', '0943');
INSERT INTO `kefu_post` VALUES ('2893', '620422', '730700', '0943');
INSERT INTO `kefu_post` VALUES ('2894', '620423', '730400', '0943');
INSERT INTO `kefu_post` VALUES ('2895', '620501', '741000', '0938');
INSERT INTO `kefu_post` VALUES ('2896', '620502', '741000', '0938');
INSERT INTO `kefu_post` VALUES ('2897', '620503', '741000', '0938');
INSERT INTO `kefu_post` VALUES ('2898', '620521', '741400', '0938');
INSERT INTO `kefu_post` VALUES ('2899', '620522', '741600', '0938');
INSERT INTO `kefu_post` VALUES ('2900', '620523', '741200', '0938');
INSERT INTO `kefu_post` VALUES ('2901', '620524', '741300', '0938');
INSERT INTO `kefu_post` VALUES ('2902', '620525', '733000', '0935');
INSERT INTO `kefu_post` VALUES ('2903', '620601', '733000', '0935');
INSERT INTO `kefu_post` VALUES ('2904', '620602', '733000', '0935');
INSERT INTO `kefu_post` VALUES ('2905', '620621', '733300', '0935');
INSERT INTO `kefu_post` VALUES ('2906', '620622', '733100', '0935');
INSERT INTO `kefu_post` VALUES ('2907', '620623', '733200', '0935');
INSERT INTO `kefu_post` VALUES ('2908', '620701', '734000', '0936');
INSERT INTO `kefu_post` VALUES ('2909', '620702', '734000', '0936');
INSERT INTO `kefu_post` VALUES ('2910', '620721', '734400', '0936');
INSERT INTO `kefu_post` VALUES ('2911', '620722', '734500', '0936');
INSERT INTO `kefu_post` VALUES ('2912', '620723', '734200', '0936');
INSERT INTO `kefu_post` VALUES ('2913', '620724', '734300', '0936');
INSERT INTO `kefu_post` VALUES ('2914', '620725', '734100', '0936');
INSERT INTO `kefu_post` VALUES ('2915', '620801', '744000', '0933');
INSERT INTO `kefu_post` VALUES ('2916', '620802', '744000', '0933');
INSERT INTO `kefu_post` VALUES ('2917', '620821', '744300', '0933');
INSERT INTO `kefu_post` VALUES ('2918', '620822', '744400', '0933');
INSERT INTO `kefu_post` VALUES ('2919', '620823', '744200', '0933');
INSERT INTO `kefu_post` VALUES ('2920', '620824', '744100', '0933');
INSERT INTO `kefu_post` VALUES ('2921', '620825', '744600', '0933');
INSERT INTO `kefu_post` VALUES ('2922', '620826', '743400', '0933');
INSERT INTO `kefu_post` VALUES ('2923', '620901', '735000', '0937');
INSERT INTO `kefu_post` VALUES ('2924', '620902', '735000', '0937');
INSERT INTO `kefu_post` VALUES ('2925', '620921', '735300', '0937');
INSERT INTO `kefu_post` VALUES ('2926', '620922', '736100', '0937');
INSERT INTO `kefu_post` VALUES ('2927', '620923', '736300', '0937');
INSERT INTO `kefu_post` VALUES ('2928', '620924', '736400', '0937');
INSERT INTO `kefu_post` VALUES ('2929', '620981', '735200', '0937');
INSERT INTO `kefu_post` VALUES ('2930', '620982', '736200', '0937');
INSERT INTO `kefu_post` VALUES ('2931', '621001', '745000', '0934');
INSERT INTO `kefu_post` VALUES ('2932', '621002', '745000', '0934');
INSERT INTO `kefu_post` VALUES ('2933', '621021', '745000', '0934');
INSERT INTO `kefu_post` VALUES ('2934', '621022', '745700', '0934');
INSERT INTO `kefu_post` VALUES ('2935', '621023', '745600', '0934');
INSERT INTO `kefu_post` VALUES ('2936', '621024', '745400', '0934');
INSERT INTO `kefu_post` VALUES ('2937', '621025', '745300', '0934');
INSERT INTO `kefu_post` VALUES ('2938', '621026', '745200', '0934');
INSERT INTO `kefu_post` VALUES ('2939', '621027', '744500', '0934');
INSERT INTO `kefu_post` VALUES ('2940', '621101', '743000', '0932');
INSERT INTO `kefu_post` VALUES ('2941', '621102', '743000', '0932');
INSERT INTO `kefu_post` VALUES ('2942', '621121', '743300', '0932');
INSERT INTO `kefu_post` VALUES ('2943', '621122', '748100', '0932');
INSERT INTO `kefu_post` VALUES ('2944', '621123', '748200', '0932');
INSERT INTO `kefu_post` VALUES ('2945', '621124', '730500', '0932');
INSERT INTO `kefu_post` VALUES ('2946', '621125', '748300', '0932');
INSERT INTO `kefu_post` VALUES ('2947', '621126', '748400', '0932');
INSERT INTO `kefu_post` VALUES ('2948', '621201', '746000', '0935');
INSERT INTO `kefu_post` VALUES ('2949', '621202', '746000', '0935');
INSERT INTO `kefu_post` VALUES ('2950', '621221', '742500', '0935');
INSERT INTO `kefu_post` VALUES ('2951', '621222', '746400', '0935');
INSERT INTO `kefu_post` VALUES ('2952', '621223', '748500', '0935');
INSERT INTO `kefu_post` VALUES ('2953', '621224', '746500', '0935');
INSERT INTO `kefu_post` VALUES ('2954', '621225', '742100', '0935');
INSERT INTO `kefu_post` VALUES ('2955', '621226', '742200', '0935');
INSERT INTO `kefu_post` VALUES ('2956', '621227', '742300', '0935');
INSERT INTO `kefu_post` VALUES ('2957', '621228', '742400', '0935');
INSERT INTO `kefu_post` VALUES ('2958', '622901', '731100', '0930');
INSERT INTO `kefu_post` VALUES ('2959', '622921', '731800', '0930');
INSERT INTO `kefu_post` VALUES ('2960', '622922', '731500', '0930');
INSERT INTO `kefu_post` VALUES ('2961', '622923', '731600', '0930');
INSERT INTO `kefu_post` VALUES ('2962', '622924', '731300', '0930');
INSERT INTO `kefu_post` VALUES ('2963', '622925', '731200', '0930');
INSERT INTO `kefu_post` VALUES ('2964', '622926', '731400', '0930');
INSERT INTO `kefu_post` VALUES ('2965', '622927', '731700', '0930');
INSERT INTO `kefu_post` VALUES ('2966', '623001', '747000', '0941');
INSERT INTO `kefu_post` VALUES ('2967', '623021', '747500', '0941');
INSERT INTO `kefu_post` VALUES ('2968', '623022', '747600', '0941');
INSERT INTO `kefu_post` VALUES ('2969', '623023', '746300', '0941');
INSERT INTO `kefu_post` VALUES ('2970', '623024', '747400', '0941');
INSERT INTO `kefu_post` VALUES ('2971', '623025', '747300', '0941');
INSERT INTO `kefu_post` VALUES ('2972', '623026', '747200', '0941');
INSERT INTO `kefu_post` VALUES ('2973', '623027', '747100', '0941');
INSERT INTO `kefu_post` VALUES ('2974', '630101', '810000', '0971');
INSERT INTO `kefu_post` VALUES ('2975', '630102', '810000', '0971');
INSERT INTO `kefu_post` VALUES ('2976', '630103', '810000', '0971');
INSERT INTO `kefu_post` VALUES ('2977', '630104', '810000', '0971');
INSERT INTO `kefu_post` VALUES ('2978', '630105', '810000', '0971');
INSERT INTO `kefu_post` VALUES ('2979', '630121', '810100', '0971');
INSERT INTO `kefu_post` VALUES ('2980', '630122', '811600', '0972');
INSERT INTO `kefu_post` VALUES ('2981', '630123', '812100', '0972');
INSERT INTO `kefu_post` VALUES ('2982', '632121', '810600', '0972');
INSERT INTO `kefu_post` VALUES ('2983', '632122', '810800', '0972');
INSERT INTO `kefu_post` VALUES ('2984', '632123', '810700', '0972');
INSERT INTO `kefu_post` VALUES ('2985', '632126', '810500', '0972');
INSERT INTO `kefu_post` VALUES ('2986', '632127', '810900', '0972');
INSERT INTO `kefu_post` VALUES ('2987', '632128', '811100', '0972');
INSERT INTO `kefu_post` VALUES ('2988', '632221', '810300', '0978');
INSERT INTO `kefu_post` VALUES ('2989', '632222', '810400', '0970');
INSERT INTO `kefu_post` VALUES ('2990', '632223', '812200', '0970');
INSERT INTO `kefu_post` VALUES ('2991', '632224', '812300', '0970');
INSERT INTO `kefu_post` VALUES ('2992', '632321', '811300', '0973');
INSERT INTO `kefu_post` VALUES ('2993', '632322', '811200', '0973');
INSERT INTO `kefu_post` VALUES ('2994', '632323', '811400', '0973');
INSERT INTO `kefu_post` VALUES ('2995', '632324', '811500', '0973');
INSERT INTO `kefu_post` VALUES ('2996', '632521', '813000', '0974');
INSERT INTO `kefu_post` VALUES ('2997', '632522', '813200', '0974');
INSERT INTO `kefu_post` VALUES ('2998', '632523', '811700', '0974');
INSERT INTO `kefu_post` VALUES ('2999', '632524', '813300', '0974');
INSERT INTO `kefu_post` VALUES ('3000', '632525', '813100', '0974');
INSERT INTO `kefu_post` VALUES ('3001', '632621', '814000', '0975');
INSERT INTO `kefu_post` VALUES ('3002', '632622', '814300', '0975');
INSERT INTO `kefu_post` VALUES ('3003', '632623', '814100', '0975');
INSERT INTO `kefu_post` VALUES ('3004', '632624', '814200', '0975');
INSERT INTO `kefu_post` VALUES ('3005', '632625', '624700', '0975');
INSERT INTO `kefu_post` VALUES ('3006', '632626', '813500', '0975');
INSERT INTO `kefu_post` VALUES ('3007', '632721', '815000', '0976');
INSERT INTO `kefu_post` VALUES ('3008', '632722', '815300', '0976');
INSERT INTO `kefu_post` VALUES ('3009', '632723', '815100', '0976');
INSERT INTO `kefu_post` VALUES ('3010', '632724', '815400', '0976');
INSERT INTO `kefu_post` VALUES ('3011', '632725', '815200', '0976');
INSERT INTO `kefu_post` VALUES ('3012', '632726', '815500', '0976');
INSERT INTO `kefu_post` VALUES ('3013', '632801', '816000', '0977');
INSERT INTO `kefu_post` VALUES ('3014', '632802', '817000', '0977');
INSERT INTO `kefu_post` VALUES ('3015', '632821', '817100', '0977');
INSERT INTO `kefu_post` VALUES ('3016', '632822', '816100', '0977');
INSERT INTO `kefu_post` VALUES ('3017', '632823', '817200', '0977');
INSERT INTO `kefu_post` VALUES ('3018', '640101', '750000', '0951');
INSERT INTO `kefu_post` VALUES ('3019', '640104', '750000', '0951');
INSERT INTO `kefu_post` VALUES ('3020', '640105', '750000', '0951');
INSERT INTO `kefu_post` VALUES ('3021', '640106', '750000', '0951');
INSERT INTO `kefu_post` VALUES ('3022', '640121', '750100', '0951');
INSERT INTO `kefu_post` VALUES ('3023', '640122', '750200', '0951');
INSERT INTO `kefu_post` VALUES ('3024', '640181', '751400', '0951');
INSERT INTO `kefu_post` VALUES ('3025', '640201', '753000', '0952');
INSERT INTO `kefu_post` VALUES ('3026', '640202', '753000', '0952');
INSERT INTO `kefu_post` VALUES ('3027', '640205', '753600', '0952');
INSERT INTO `kefu_post` VALUES ('3028', '640221', '753400', '0952');
INSERT INTO `kefu_post` VALUES ('3029', '640301', '751100', '0953');
INSERT INTO `kefu_post` VALUES ('3030', '640302', '751100', '0953');
INSERT INTO `kefu_post` VALUES ('3031', '640323', '751500', '0953');
INSERT INTO `kefu_post` VALUES ('3032', '640324', '751300', '0953');
INSERT INTO `kefu_post` VALUES ('3033', '640381', '751600', '0953');
INSERT INTO `kefu_post` VALUES ('3034', '640401', '756000', '0954');
INSERT INTO `kefu_post` VALUES ('3035', '640402', '756000', '0954');
INSERT INTO `kefu_post` VALUES ('3036', '640422', '756200', '0954');
INSERT INTO `kefu_post` VALUES ('3037', '640423', '756300', '0954');
INSERT INTO `kefu_post` VALUES ('3038', '640424', '756400', '0954');
INSERT INTO `kefu_post` VALUES ('3039', '640425', '756500', '0954');
INSERT INTO `kefu_post` VALUES ('3040', '640501', '751700', '0953');
INSERT INTO `kefu_post` VALUES ('3041', '640502', '751700', '0953');
INSERT INTO `kefu_post` VALUES ('3042', '640521', '751200', '0953');
INSERT INTO `kefu_post` VALUES ('3043', '640522', '751800', '0954');
INSERT INTO `kefu_post` VALUES ('3044', '650101', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3045', '650102', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3046', '650103', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3047', '650104', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3048', '650105', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3049', '650106', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3050', '650107', '830000', '0992');
INSERT INTO `kefu_post` VALUES ('3051', '650108', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3052', '650121', '830000', '0991');
INSERT INTO `kefu_post` VALUES ('3053', '650201', '834000', '0990');
INSERT INTO `kefu_post` VALUES ('3054', '650202', '838600', '0990');
INSERT INTO `kefu_post` VALUES ('3055', '650203', '834000', '0990');
INSERT INTO `kefu_post` VALUES ('3056', '650204', '834000', '0990');
INSERT INTO `kefu_post` VALUES ('3057', '650205', '834000', '0990');
INSERT INTO `kefu_post` VALUES ('3058', '652101', '838000', '0995');
INSERT INTO `kefu_post` VALUES ('3059', '652122', '838200', '0995');
INSERT INTO `kefu_post` VALUES ('3060', '652123', '838100', '0995');
INSERT INTO `kefu_post` VALUES ('3061', '652201', '839000', '0902');
INSERT INTO `kefu_post` VALUES ('3062', '652222', '839200', '0902');
INSERT INTO `kefu_post` VALUES ('3063', '652223', '839300', '0902');
INSERT INTO `kefu_post` VALUES ('3064', '652301', '831100', '0994');
INSERT INTO `kefu_post` VALUES ('3065', '652302', '831500', '0994');
INSERT INTO `kefu_post` VALUES ('3066', '652303', '831400', '0994');
INSERT INTO `kefu_post` VALUES ('3067', '652323', '831200', '0994');
INSERT INTO `kefu_post` VALUES ('3068', '652324', '832200', '0994');
INSERT INTO `kefu_post` VALUES ('3069', '652325', '831800', '0994');
INSERT INTO `kefu_post` VALUES ('3070', '652327', '831700', '0994');
INSERT INTO `kefu_post` VALUES ('3071', '652328', '831900', '0994');
INSERT INTO `kefu_post` VALUES ('3072', '652701', '833400', '0909');
INSERT INTO `kefu_post` VALUES ('3073', '652722', '833300', '0909');
INSERT INTO `kefu_post` VALUES ('3074', '652723', '833500', '0909');
INSERT INTO `kefu_post` VALUES ('3075', '652801', '841000', '0996');
INSERT INTO `kefu_post` VALUES ('3076', '652822', '841600', '0996');
INSERT INTO `kefu_post` VALUES ('3077', '652823', '841500', '0996');
INSERT INTO `kefu_post` VALUES ('3078', '652824', '841800', '0996');
INSERT INTO `kefu_post` VALUES ('3079', '652825', '841900', '0996');
INSERT INTO `kefu_post` VALUES ('3080', '652826', '841100', '0996');
INSERT INTO `kefu_post` VALUES ('3081', '652827', '841300', '0996');
INSERT INTO `kefu_post` VALUES ('3082', '652828', '841200', '0996');
INSERT INTO `kefu_post` VALUES ('3083', '652829', '841400', '0996');
INSERT INTO `kefu_post` VALUES ('3084', '652901', '843000', '0997');
INSERT INTO `kefu_post` VALUES ('3085', '652922', '843100', '0997');
INSERT INTO `kefu_post` VALUES ('3086', '652923', '842000', '0997');
INSERT INTO `kefu_post` VALUES ('3087', '652924', '842200', '0997');
INSERT INTO `kefu_post` VALUES ('3088', '652925', '842100', '0997');
INSERT INTO `kefu_post` VALUES ('3089', '652926', '842300', '0997');
INSERT INTO `kefu_post` VALUES ('3090', '652927', '843400', '0997');
INSERT INTO `kefu_post` VALUES ('3091', '652928', '843200', '0997');
INSERT INTO `kefu_post` VALUES ('3092', '652929', '845350', '0908');
INSERT INTO `kefu_post` VALUES ('3093', '653001', '845350', '0908');
INSERT INTO `kefu_post` VALUES ('3094', '653022', '845550', '0908');
INSERT INTO `kefu_post` VALUES ('3095', '653023', '843500', '0997');
INSERT INTO `kefu_post` VALUES ('3096', '653024', '845450', '0908');
INSERT INTO `kefu_post` VALUES ('3097', '653101', '844000', '0998');
INSERT INTO `kefu_post` VALUES ('3098', '653121', '844100', '0998');
INSERT INTO `kefu_post` VALUES ('3099', '653122', '844200', '0998');
INSERT INTO `kefu_post` VALUES ('3100', '653123', '844500', '0998');
INSERT INTO `kefu_post` VALUES ('3101', '653124', '844800', '0998');
INSERT INTO `kefu_post` VALUES ('3102', '653125', '844700', '0998');
INSERT INTO `kefu_post` VALUES ('3103', '653126', '844900', '0998');
INSERT INTO `kefu_post` VALUES ('3104', '653127', '844600', '0998');
INSERT INTO `kefu_post` VALUES ('3105', '653128', '844400', '0998');
INSERT INTO `kefu_post` VALUES ('3106', '653129', '844300', '0998');
INSERT INTO `kefu_post` VALUES ('3107', '653130', '843800', '0998');
INSERT INTO `kefu_post` VALUES ('3108', '653131', '845250', '0998');
INSERT INTO `kefu_post` VALUES ('3109', '653201', '848000', '0903');
INSERT INTO `kefu_post` VALUES ('3110', '653221', '848000', '0903');
INSERT INTO `kefu_post` VALUES ('3111', '653222', '848100', '0903');
INSERT INTO `kefu_post` VALUES ('3112', '653223', '845150', '0903');
INSERT INTO `kefu_post` VALUES ('3113', '653224', '848200', '0903');
INSERT INTO `kefu_post` VALUES ('3114', '653225', '848300', '0903');
INSERT INTO `kefu_post` VALUES ('3115', '653226', '848400', '0903');
INSERT INTO `kefu_post` VALUES ('3116', '653227', '848500', '0903');
INSERT INTO `kefu_post` VALUES ('3117', '654002', '835000', '0999');
INSERT INTO `kefu_post` VALUES ('3118', '654003', '833200', '0992');
INSERT INTO `kefu_post` VALUES ('3119', '654021', '835100', '0999');
INSERT INTO `kefu_post` VALUES ('3120', '654022', '835300', '0999');
INSERT INTO `kefu_post` VALUES ('3121', '654023', '835200', '0999');
INSERT INTO `kefu_post` VALUES ('3122', '654024', '835400', '0999');
INSERT INTO `kefu_post` VALUES ('3123', '654025', '835800', '0999');
INSERT INTO `kefu_post` VALUES ('3124', '654026', '835600', '0999');
INSERT INTO `kefu_post` VALUES ('3125', '654027', '835500', '0999');
INSERT INTO `kefu_post` VALUES ('3126', '654028', '835700', '0999');
INSERT INTO `kefu_post` VALUES ('3127', '654201', '834300', '0901');
INSERT INTO `kefu_post` VALUES ('3128', '654202', '833300', '0992');
INSERT INTO `kefu_post` VALUES ('3129', '654221', '834600', '0901');
INSERT INTO `kefu_post` VALUES ('3130', '654223', '832100', '0993');
INSERT INTO `kefu_post` VALUES ('3131', '654224', '834500', '0901');
INSERT INTO `kefu_post` VALUES ('3132', '654225', '834800', '0901');
INSERT INTO `kefu_post` VALUES ('3133', '654226', '834400', '0990');
INSERT INTO `kefu_post` VALUES ('3134', '654301', '836500', '0906');
INSERT INTO `kefu_post` VALUES ('3135', '654321', '836600', '0906');
INSERT INTO `kefu_post` VALUES ('3136', '654322', '836100', '0906');
INSERT INTO `kefu_post` VALUES ('3137', '654323', '836400', '0906');
INSERT INTO `kefu_post` VALUES ('3138', '654324', '836700', '0906');
INSERT INTO `kefu_post` VALUES ('3139', '654325', '836200', '0906');
INSERT INTO `kefu_post` VALUES ('3140', '654326', '836800', '0906');
INSERT INTO `kefu_post` VALUES ('3141', '659001', '832000', '0993');
INSERT INTO `kefu_post` VALUES ('3142', '659002', '843300', '0997');
INSERT INTO `kefu_post` VALUES ('3143', '659003', '844000', '0998');
INSERT INTO `kefu_post` VALUES ('3144', '659004', '831300', '0994');

-- ----------------------------
-- Table structure for kefu_provinces
-- ----------------------------
DROP TABLE IF EXISTS `kefu_provinces`;
CREATE TABLE `kefu_provinces` (
  `provicesId` int(11) NOT NULL AUTO_INCREMENT,
  `provincesCode` varchar(20) NOT NULL,
  `provincesName` varchar(50) NOT NULL,
  PRIMARY KEY (`provicesId`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份信息表';

-- ----------------------------
-- Records of kefu_provinces
-- ----------------------------
INSERT INTO `kefu_provinces` VALUES ('1', '110000', '北京市');
INSERT INTO `kefu_provinces` VALUES ('2', '120000', '天津市');
INSERT INTO `kefu_provinces` VALUES ('3', '130000', '河北省');
INSERT INTO `kefu_provinces` VALUES ('4', '140000', '山西省');
INSERT INTO `kefu_provinces` VALUES ('5', '150000', '内蒙古自治区');
INSERT INTO `kefu_provinces` VALUES ('6', '210000', '辽宁省');
INSERT INTO `kefu_provinces` VALUES ('7', '220000', '吉林省');
INSERT INTO `kefu_provinces` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `kefu_provinces` VALUES ('9', '310000', '上海市');
INSERT INTO `kefu_provinces` VALUES ('10', '320000', '江苏省');
INSERT INTO `kefu_provinces` VALUES ('11', '330000', '浙江省');
INSERT INTO `kefu_provinces` VALUES ('12', '340000', '安徽省');
INSERT INTO `kefu_provinces` VALUES ('13', '350000', '福建省');
INSERT INTO `kefu_provinces` VALUES ('14', '360000', '江西省');
INSERT INTO `kefu_provinces` VALUES ('15', '370000', '山东省');
INSERT INTO `kefu_provinces` VALUES ('16', '410000', '河南省');
INSERT INTO `kefu_provinces` VALUES ('17', '420000', '湖北省');
INSERT INTO `kefu_provinces` VALUES ('18', '430000', '湖南省');
INSERT INTO `kefu_provinces` VALUES ('19', '440000', '广东省');
INSERT INTO `kefu_provinces` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `kefu_provinces` VALUES ('21', '460000', '海南省');
INSERT INTO `kefu_provinces` VALUES ('22', '500000', '重庆市');
INSERT INTO `kefu_provinces` VALUES ('23', '510000', '四川省');
INSERT INTO `kefu_provinces` VALUES ('24', '520000', '贵州省');
INSERT INTO `kefu_provinces` VALUES ('25', '530000', '云南省');
INSERT INTO `kefu_provinces` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `kefu_provinces` VALUES ('27', '610000', '陕西省');
INSERT INTO `kefu_provinces` VALUES ('28', '620000', '甘肃省');
INSERT INTO `kefu_provinces` VALUES ('29', '630000', '青海省');
INSERT INTO `kefu_provinces` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `kefu_provinces` VALUES ('31', '650000', '新疆维吾尔自治区');
INSERT INTO `kefu_provinces` VALUES ('32', '710000', '台湾省');
INSERT INTO `kefu_provinces` VALUES ('33', '810000', '香港特别行政区');
INSERT INTO `kefu_provinces` VALUES ('34', '820000', '澳门特别行政区');

-- ----------------------------
-- Table structure for kuguan_allot
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_allot`;
CREATE TABLE `kuguan_allot` (
  `diaoboId` varchar(20) NOT NULL,
  `diaoboTime` datetime NOT NULL,
  `diaoboState` tinyint(1) NOT NULL,
  `zhidanren` varchar(20) NOT NULL,
  `shenheren` varchar(20) NOT NULL,
  `goodId` int(11) NOT NULL,
  `goodName` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `goodNum` int(50) NOT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `wareHouseId` int(11) NOT NULL,
  PRIMARY KEY (`diaoboId`),
  KEY `goodId` (`goodId`),
  KEY `sku` (`sku`),
  KEY `wareHouseId` (`wareHouseId`),
  CONSTRAINT `kuguan_allot_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `kuguan_allot_ibfk_2` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_allot
-- ----------------------------

-- ----------------------------
-- Table structure for kuguan_caigouruku
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_caigouruku`;
CREATE TABLE `kuguan_caigouruku` (
  `caigouId` varchar(50) NOT NULL,
  `caigouBossId` int(11) NOT NULL,
  `caigouCode` varchar(50) NOT NULL,
  `caigouCaigoudanCode` varchar(50) NOT NULL,
  `caigouWarehouse` int(11) NOT NULL,
  `caigouInCount` int(11) NOT NULL,
  `caigouInFinish` int(11) DEFAULT '0',
  `caigouSetTime` varchar(50) NOT NULL,
  `caigouAuthor` int(11) NOT NULL,
  `caigouNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`caigouId`),
  KEY `fk_caigouruku_bossid` (`caigouBossId`),
  KEY `fk_caigouruku_cangkuid` (`caigouWarehouse`),
  KEY `fk_caigouruku_yonghuid` (`caigouAuthor`),
  CONSTRAINT `fk_caigouruku_bossid` FOREIGN KEY (`caigouBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_caigouruku_cangkuid` FOREIGN KEY (`caigouWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_caigouruku_yonghuid` FOREIGN KEY (`caigouAuthor`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_caigouruku
-- ----------------------------
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513823195', '10001', 'RKCG201612010016', 'CG201612010016', '1', '22', '0', '2016-12-06 14:32:03.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513823804', '10001', 'RK313131', '313131', '5', '20', '0', '2016-12-06 19:43:52.0', '10001', '');
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513823910', '10001', 'RK3131231', '3131231', '2', '10', '0', '2016-12-07 09:12:04.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513823999', '10001', 'RKCG201612070001', 'CG201612070001', '3', '6', '0', '2016-12-07 10:32:51.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513824122', '10001', 'RKCG201612070002', 'CG201612070002', '1', '6', '0', '2016-12-07 14:03:46.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513824932', '10001', 'RKCG201612070006', 'CG201612070006', '2', '5', '0', '2016-12-07 15:04:46.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513825019', '10001', 'RKCG201612070007', 'CG201612070007', '1', '3', '0', '2016-12-07 16:45:19.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513825818', '10001', 'RKCG201612070008', 'CG201612070008', '3', '3', '0', '2016-12-07 16:52:26.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513826870', '10001', 'RKCG201612080012', 'CG201612080012', '3', '333', '0', '2016-12-08 14:12:05.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513826958', '10001', 'RKCG201612080013', 'CG201612080013', '1', '56', '0', '2016-12-08 14:14:09.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513827075', '10001', 'RKCG201612080014', 'CG201612080014', '2', '33', '0', '2016-12-08 14:30:22.0', '10001', null);
INSERT INTO `kuguan_caigouruku` VALUES ('6800315-1481513827184', '10001', 'RKCG201612080015', 'CG201612080015', '2', '33', '0', '2016-12-08 19:17:02.0', '10001', null);

-- ----------------------------
-- Table structure for kuguan_caigourukuinfo
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_caigourukuinfo`;
CREATE TABLE `kuguan_caigourukuinfo` (
  `caigouxiangqingId` varchar(50) NOT NULL,
  `caigouxiangqingBossId` int(11) NOT NULL,
  `caigouxiangqingCode` varchar(50) NOT NULL,
  `caigouxiangqingSku` varchar(50) NOT NULL,
  `caigouxiangqingName` int(11) NOT NULL,
  `caigouxiangqingAttribute` varchar(100) DEFAULT NULL,
  `caigouxiangqingWarehouse` int(11) NOT NULL,
  `caigouxiangqingInNeed` int(11) NOT NULL,
  `caigouxiangqingInFinish` int(11) DEFAULT '0',
  `caigouxiangqingNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`caigouxiangqingId`),
  KEY `fk_caigouxiangqing_bossid` (`caigouxiangqingBossId`),
  KEY `fk_caigourukuinfo_shangpinsku` (`caigouxiangqingSku`),
  KEY `fk_caigourukuinfo_shangpinid` (`caigouxiangqingName`),
  KEY `fk_caigourukuinfo_cangku` (`caigouxiangqingWarehouse`),
  CONSTRAINT `fk_caigourukuinfo_cangku` FOREIGN KEY (`caigouxiangqingWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_caigourukuinfo_shangpinid` FOREIGN KEY (`caigouxiangqingName`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `fk_caigourukuinfo_shangpinsku` FOREIGN KEY (`caigouxiangqingSku`) REFERENCES `caigou_goods` (`sku`),
  CONSTRAINT `fk_caigouxiangqing_bossid` FOREIGN KEY (`caigouxiangqingBossId`) REFERENCES `common_boss` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_caigourukuinfo
-- ----------------------------
INSERT INTO `kuguan_caigourukuinfo` VALUES ('31168322-1481625052293', '10001', 'RKCG201612060019', '100001-1', '100001', '233', '1', '10', '0', '2333');
INSERT INTO `kuguan_caigourukuinfo` VALUES ('31168322-1481625069248', '10001', 'RKCG201612060019', '100002-1', '100002', '233', '1', '10', '0', '2333');
INSERT INTO `kuguan_caigourukuinfo` VALUES ('31168322-1481625076360', '10001', 'RKCG201612060019', '100003-1', '100003', '233', '1', '10', '0', '2333');
INSERT INTO `kuguan_caigourukuinfo` VALUES ('31168322-1481625146643', '10001', 'RKCG201612010014', '100001-1', '100001', '2333', '1', '50', '0', '6354368543');

-- ----------------------------
-- Table structure for kuguan_cangku
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_cangku`;
CREATE TABLE `kuguan_cangku` (
  `wareHouseId` int(11) NOT NULL,
  `wareHouseName` varchar(255) DEFAULT NULL,
  `wareHouseType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_cangku
-- ----------------------------
INSERT INTO `kuguan_cangku` VALUES ('20161203', '恰恰仓库', '自有仓库');
INSERT INTO `kuguan_cangku` VALUES ('20161204', '一号仓库', '自有仓库');
INSERT INTO `kuguan_cangku` VALUES ('20161205', '二号仓库', '自有仓库');
INSERT INTO `kuguan_cangku` VALUES ('20161206', '三号仓库', '自有仓库');
INSERT INTO `kuguan_cangku` VALUES ('20161207', '四号仓库', '自有仓库');

-- ----------------------------
-- Table structure for kuguan_chukudan
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_chukudan`;
CREATE TABLE `kuguan_chukudan` (
  `chukudanId` int(11) NOT NULL AUTO_INCREMENT,
  `chukudanCode` varchar(255) DEFAULT NULL,
  `chukuxiangguandanCode` varchar(255) DEFAULT NULL,
  `chukuType` int(255) DEFAULT NULL,
  `chukuCangku` varchar(255) DEFAULT NULL,
  `chukuNum` int(11) DEFAULT NULL,
  `chukuPeople` varchar(255) DEFAULT NULL,
  `chukuState` int(255) DEFAULT NULL,
  `chukudanTime` varchar(255) DEFAULT NULL,
  `chukudanPeople` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`chukudanId`),
  KEY `user-ID` (`userId`),
  CONSTRAINT `user-ID` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_chukudan
-- ----------------------------
INSERT INTO `kuguan_chukudan` VALUES ('6', 'ckdb006', 'db003', '2', '二号仓库', '100', '管理员', '2', '2016-11-30', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('302', 'CKCT1099', 'CT1099', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('303', 'CKCT10100', 'CT1099100', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('304', 'CKCT10101', 'CT1099101', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('306', 'CKCT10103', 'CT1099103', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('307', 'CKCT10104', 'CT1099104', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('309', 'CKCT10106', 'CT1099106', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('310', 'CKCT10107', 'CT1099107', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('311', 'CKCT10108', 'CT1099108', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('312', 'CKCT10109', 'CT1099109', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('313', 'CKCT10110', 'CT1099110', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('314', 'CKCT10111', 'CT1099111', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('315', 'CKCT10112', 'CT1099112', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('316', 'CKCT10113', 'CT1099113', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('317', 'CKCT10114', 'CT1099114', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('318', 'CKCT10115', 'CT1099115', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('319', 'CKCT10116', 'CT1099116', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('320', 'CKCT10117', 'CT1099117', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('321', 'CKCT10118', 'CT1099118', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('322', 'CKCT10119', 'CT1099119', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('323', 'CKCT10120', 'CT1099120', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('324', 'CKCT10121', 'CT1099121', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('325', 'CKCT10122', 'CT1099122', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('326', 'CKCT10123', 'CT1099123', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('327', 'CKCT10124', 'CT1099124', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('328', 'CKCT10125', 'CT1099125', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('329', 'CKCT10126', 'CT1099126', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('330', 'CKCT10127', 'CT1099127', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('331', 'CKCT10128', 'CT1099128', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('332', 'CKCT10129', 'CT1099129', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('333', 'CKCT10130', 'CT1099130', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('334', 'CKCT10131', 'CT1099131', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('335', 'CKCT10132', 'CT1099132', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('336', 'CKCT10133', 'CT1099133', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('337', 'CKCT10134', 'CT1099134', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('338', 'CKCT10135', 'CT1099135', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('339', 'CKCT10136', 'CT1099136', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('340', 'CKCT10137', 'CT1099137', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('341', 'CKCT10138', 'CT1099138', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('342', 'CKCT10139', 'CT1099139', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('343', 'CKCT10140', 'CT1099140', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('344', 'CKCT10141', 'CT1099141', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('345', 'CKCT10142', 'CT1099142', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('346', 'CKCT10143', 'CT1099143', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('347', 'CKCT10144', 'CT1099144', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('348', 'CKCT10145', 'CT1099145', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('349', 'CKCT10146', 'CT1099146', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('350', 'CKCT10147', 'CT1099147', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('351', 'CKCT10148', 'CT1099148', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('352', 'CKCT10149', 'CT1099149', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('353', 'CKCT10150', 'CT1099150', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('354', 'CKCT10151', 'CT1099151', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('355', 'CKCT10152', 'CT1099152', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('356', 'CKCT10153', 'CT1099153', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('357', 'CKCT10154', 'CT1099154', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('358', 'CKCT10155', 'CT1099155', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('359', 'CKCT10156', 'CT1099156', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('360', 'CKCT10157', 'CT1099157', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('361', 'CKCT10158', 'CT1099158', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('362', 'CKCT10159', 'CT1099159', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('363', 'CKCT10160', 'CT1099160', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('364', 'CKCT10161', 'CT1099161', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('365', 'CKCT10162', 'CT1099162', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('366', 'CKCT10163', 'CT1099163', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('367', 'CKCT10164', 'CT1099164', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('368', 'CKCT10165', 'CT1099165', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('369', 'CKCT10166', 'CT1099166', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('370', 'CKCT10167', 'CT1099167', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('371', 'CKCT10168', 'CT1099168', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('372', 'CKCT10169', 'CT1099169', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('373', 'CKCT10170', 'CT1099170', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('374', 'CKCT10171', 'CT1099171', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('375', 'CKCT10172', 'CT1099172', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('376', 'CKCT10173', 'CT1099173', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('377', 'CKCT10174', 'CT1099174', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('378', 'CKCT10175', 'CT1099175', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('379', 'CKCT10176', 'CT1099176', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('380', 'CKCT10177', 'CT1099177', '1', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('381', 'CKCT10178', 'CT1099178', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('382', 'CKCT10179', 'CT1099179', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('402', 'CKCT10199', 'CT1099199', '1', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('406', 'CKDB10103', 'DB10103', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('407', 'CKDB10104', 'DB10104', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('408', 'CKDB10105', 'DB10105', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('409', 'CKDB10106', 'DB10106', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('410', 'CKDB10107', 'DB10107', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('411', 'CKDB10108', 'DB10108', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('412', 'CKDB10109', 'DB10109', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('413', 'CKDB10110', 'DB10110', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('414', 'CKDB10111', 'DB10111', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('415', 'CKDB10112', 'DB10112', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('416', 'CKDB10113', 'DB10113', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('417', 'CKDB10114', 'DB10114', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('418', 'CKDB10115', 'DB10115', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('419', 'CKDB10116', 'DB10116', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('420', 'CKDB10117', 'DB10117', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('421', 'CKDB10118', 'DB10118', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('422', 'CKDB10119', 'DB10119', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('423', 'CKDB10120', 'DB10120', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('424', 'CKDB10121', 'DB10121', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('425', 'CKDB10122', 'DB10122', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('426', 'CKDB10123', 'DB10123', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('427', 'CKDB10124', 'DB10124', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('428', 'CKDB10125', 'DB10125', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('429', 'CKDB10126', 'DB10126', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('430', 'CKDB10127', 'DB10127', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('431', 'CKDB10128', 'DB10128', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('432', 'CKDB10129', 'DB10129', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('433', 'CKDB10130', 'DB10130', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('434', 'CKDB10131', 'DB10131', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('435', 'CKDB10132', 'DB10132', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('436', 'CKDB10133', 'DB10133', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('437', 'CKDB10134', 'DB10134', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('438', 'CKDB10135', 'DB10135', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('439', 'CKDB10136', 'DB10136', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('440', 'CKDB10137', 'DB10137', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('441', 'CKDB10138', 'DB10138', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('442', 'CKDB10139', 'DB10139', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('443', 'CKDB10140', 'DB10140', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('444', 'CKDB10141', 'DB10141', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('445', 'CKDB10142', 'DB10142', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('446', 'CKDB10143', 'DB10143', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('447', 'CKDB10144', 'DB10144', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('448', 'CKDB10145', 'DB10145', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('449', 'CKDB10146', 'DB10146', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('450', 'CKDB10147', 'DB10147', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('451', 'CKDB10148', 'DB10148', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('452', 'CKDB10149', 'DB10149', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('453', 'CKDB10150', 'DB10150', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('454', 'CKDB10151', 'DB10151', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('455', 'CKDB10152', 'DB10152', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('456', 'CKDB10153', 'DB10153', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('457', 'CKDB10154', 'DB10154', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('458', 'CKDB10155', 'DB10155', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('459', 'CKDB10156', 'DB10156', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('460', 'CKDB10157', 'DB10157', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('461', 'CKDB10158', 'DB10158', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('462', 'CKDB10159', 'DB10159', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('463', 'CKDB10160', 'DB10160', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('464', 'CKDB10161', 'DB10161', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('465', 'CKDB10162', 'DB10162', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('466', 'CKDB10163', 'DB10163', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('467', 'CKDB10164', 'DB10164', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('468', 'CKDB10165', 'DB10165', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('469', 'CKDB10166', 'DB10166', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('470', 'CKDB10167', 'DB10167', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('471', 'CKDB10168', 'DB10168', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('472', 'CKDB10169', 'DB10169', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('473', 'CKDB10170', 'DB10170', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('474', 'CKDB10171', 'DB10171', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('475', 'CKDB10172', 'DB10172', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('476', 'CKDB10173', 'DB10173', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('477', 'CKDB10174', 'DB10174', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('478', 'CKDB10175', 'DB10175', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('479', 'CKDB10176', 'DB10176', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('480', 'CKDB10177', 'DB10177', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('481', 'CKDB10178', 'DB10178', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('482', 'CKDB10179', 'DB10179', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('483', 'CKDB10180', 'DB10180', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('484', 'CKDB10181', 'DB10181', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('485', 'CKDB10182', 'DB10182', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('486', 'CKDB10183', 'DB10183', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('487', 'CKDB10184', 'DB10184', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('488', 'CKDB10185', 'DB10185', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('489', 'CKDB10186', 'DB10186', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('490', 'CKDB10187', 'DB10187', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('491', 'CKDB10188', 'DB10188', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('492', 'CKDB10189', 'DB10189', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('493', 'CKDB10190', 'DB10190', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('494', 'CKDB10191', 'DB10191', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('495', 'CKDB10192', 'DB10192', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('496', 'CKDB10193', 'DB10193', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('497', 'CKDB10194', 'DB10194', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('498', 'CKDB10195', 'DB10195', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('499', 'CKDB10196', 'DB10196', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('500', 'CKDB10197', 'DB10197', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('501', 'CKDB10198', 'DB10198', '2', '三号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('502', 'CKDB10199', 'DB10199', '2', '一号仓库', '100', '管理员', '1', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('503', 'CKCT30100', 'CT30100', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('504', 'CKCT30101', 'CT30101', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('505', 'CKCT30102', 'CT30102', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('506', 'CKCT30103', 'CT30103', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('507', 'CKCT30104', 'CT30104', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('508', 'CKCT30105', 'CT30105', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('509', 'CKCT30106', 'CT30106', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('510', 'CKCT30107', 'CT30107', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('511', 'CKCT30108', 'CT30108', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('512', 'CKCT30109', 'CT30109', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('513', 'CKCT30110', 'CT30110', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('514', 'CKCT30111', 'CT30111', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('515', 'CKCT30112', 'CT30112', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('516', 'CKCT30113', 'CT30113', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('517', 'CKCT30114', 'CT30114', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('518', 'CKCT30115', 'CT30115', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('519', 'CKCT30116', 'CT30116', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('520', 'CKCT30117', 'CT30117', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('521', 'CKCT30118', 'CT30118', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('522', 'CKCT30119', 'CT30119', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('523', 'CKCT30120', 'CT30120', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('524', 'CKCT30121', 'CT30121', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('525', 'CKCT30122', 'CT30122', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('526', 'CKCT30123', 'CT30123', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('527', 'CKCT30124', 'CT30124', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('528', 'CKCT30125', 'CT30125', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('529', 'CKCT30126', 'CT30126', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('530', 'CKCT30127', 'CT30127', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('531', 'CKCT30128', 'CT30128', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('532', 'CKCT30129', 'CT30129', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('533', 'CKCT30130', 'CT30130', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('534', 'CKCT30131', 'CT30131', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('535', 'CKCT30132', 'CT30132', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('536', 'CKCT30133', 'CT30133', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('537', 'CKCT30134', 'CT30134', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('538', 'CKCT30135', 'CT30135', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('539', 'CKCT30136', 'CT30136', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('540', 'CKCT30137', 'CT30137', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('541', 'CKCT30138', 'CT30138', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('542', 'CKCT30139', 'CT30139', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('543', 'CKCT30140', 'CT30140', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('544', 'CKCT30141', 'CT30141', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('545', 'CKCT30142', 'CT30142', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('546', 'CKCT30143', 'CT30143', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('547', 'CKCT30144', 'CT30144', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('548', 'CKCT30145', 'CT30145', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('549', 'CKCT30146', 'CT30146', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('550', 'CKCT30147', 'CT30147', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('551', 'CKCT30148', 'CT30148', '1', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('552', 'CKCT30149', 'CT30149', '1', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('553', 'CKDB30100', 'DB30100', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('554', 'CKDB30101', 'DB30101', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('555', 'CKDB30102', 'DB30102', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('556', 'CKDB30103', 'DB30103', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('557', 'CKDB30104', 'DB30104', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('558', 'CKDB30105', 'DB30105', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('559', 'CKDB30106', 'DB30106', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('560', 'CKDB30107', 'DB30107', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('561', 'CKDB30108', 'DB30108', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('562', 'CKDB30109', 'DB30109', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('563', 'CKDB30110', 'DB30110', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('564', 'CKDB30111', 'DB30111', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('565', 'CKDB30112', 'DB30112', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('566', 'CKDB30113', 'DB30113', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('567', 'CKDB30114', 'DB30114', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('568', 'CKDB30115', 'DB30115', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('569', 'CKDB30116', 'DB30116', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('570', 'CKDB30117', 'DB30117', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('571', 'CKDB30118', 'DB30118', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('572', 'CKDB30119', 'DB30119', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('573', 'CKDB30120', 'DB30120', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('574', 'CKDB30121', 'DB30121', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('575', 'CKDB30122', 'DB30122', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('576', 'CKDB30123', 'DB30123', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('577', 'CKDB30124', 'DB30124', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('578', 'CKDB30125', 'DB30125', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('579', 'CKDB30126', 'DB30126', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('580', 'CKDB30127', 'DB30127', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('581', 'CKDB30128', 'DB30128', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('582', 'CKDB30129', 'DB30129', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('583', 'CKDB30130', 'DB30130', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('584', 'CKDB30131', 'DB30131', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('585', 'CKDB30132', 'DB30132', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('586', 'CKDB30133', 'DB30133', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('587', 'CKDB30134', 'DB30134', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('588', 'CKDB30135', 'DB30135', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('589', 'CKDB30136', 'DB30136', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('590', 'CKDB30137', 'DB30137', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('591', 'CKDB30138', 'DB30138', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('592', 'CKDB30139', 'DB30139', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('593', 'CKDB30140', 'DB30140', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('594', 'CKDB30141', 'DB30141', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('595', 'CKDB30142', 'DB30142', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('596', 'CKDB30143', 'DB30143', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('597', 'CKDB30144', 'DB30144', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('598', 'CKDB30145', 'DB30145', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('599', 'CKDB30146', 'DB30146', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('600', 'CKDB30147', 'DB30147', '2', '三号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('601', 'CKDB30148', 'DB30148', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('602', 'CKDB30149', 'DB30149', '2', '一号仓库', '100', '管理员', '2', '2016-12-01 21:05:03', '管理员', null);
INSERT INTO `kuguan_chukudan` VALUES ('603', 'CKDB30150', 'DB30150', '1', '二号仓库', '10', 'dd', '2', '2016-12-01 21:05:03', 'vv', null);
INSERT INTO `kuguan_chukudan` VALUES ('604', null, 'CG201612010003', '1', '默认仓库', '10', null, '1', '2016-12-06 12:25:53', '汪大爷', null);
INSERT INTO `kuguan_chukudan` VALUES ('605', null, 'CG201612010002', '1', '三号仓库', '10', null, '1', '2016-12-06 02:06:58', '汪大爷', null);
INSERT INTO `kuguan_chukudan` VALUES ('606', null, 'CG201612010002', '1', '仓库1', '60', null, '1', '2016-12-08 11:03:45', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('607', null, 'CG201612010002', '1', '仓库1', '60', null, '1', '2016-12-08 11:04:03', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('608', null, 'CG201612010002', '1', '仓库3', '2', null, '1', '2016-12-08 11:04:05', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('609', null, 'CG201612010002', '1', '仓库3', '2', null, '1', '2016-12-08 11:04:06', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('611', null, 'CG201612010002', '1', '仓库1', '2', null, '1', '2016-12-11 21:40:18', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('612', 'CKD1', 'CG201612010002', '1', '仓库3', '24', '����Ա', '1', '2016-12-12 11:27:53', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('613', 'CKD1', 'CG201612010002', '1', '仓库3', '24', '����Ա', '1', '2016-12-12 14:34:23', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('614', 'CKD1', 'CG201612010002', '1', '仓库3', '24', '����Ա', '1', '2016-12-12 14:38:24', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('615', 'CKD1', 'CG201612010002', '1', '仓库3', '24', '����Ա', '1', '2016-12-12 14:43:23', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('616', 'CKD1', 'CG201612010002', '1', '仓库4', '4', '����Ա', '1', '2016-12-12 14:54:55', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('617', 'CKD1', 'CG201612010002', '1', '仓库4', '4', '����Ա', '1', '2016-12-12 15:00:25', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('618', 'CKD1', 'CG201612010002', '1', '仓库3', '24', '����Ա', '1', '2016-12-12 15:06:08', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('619', 'CKD1', 'CG201612010002', '1', '仓库4', '4', '����Ա', '1', '2016-12-12 17:54:10', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('620', 'CKD1', 'CG201612010002', '1', '仓库3', '2', '����Ա', '1', '2016-12-12 17:54:45', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('621', 'CKD1', 'CG201612070009', '1', '仓库2', '2', '����Ա', '1', '2016-12-14 18:04:05', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('622', 'CKD1', 'CG201612070009', '1', '仓库2', '1', '����Ա', '1', '2016-12-14 19:28:00', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('623', 'CKD1', 'CG201612070009', '1', '仓库2', '2', '����Ա', '1', '2016-12-14 19:32:57', 'yk', null);
INSERT INTO `kuguan_chukudan` VALUES ('624', 'CKD1', 'CG201612070009', '1', '仓库3', '1', '����Ա', '1', '2016-12-15 10:22:29', 'yk', null);

-- ----------------------------
-- Table structure for kuguan_chukuedit
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_chukuedit`;
CREATE TABLE `kuguan_chukuedit` (
  `bjId` int(11) NOT NULL AUTO_INCREMENT,
  `chukudanId` int(11) NOT NULL,
  `bjskuCode` varchar(255) DEFAULT NULL,
  `bjgoodName` varchar(255) DEFAULT NULL,
  `bjgoodProperty` varchar(255) DEFAULT NULL,
  `bjxuchukuNum` int(11) DEFAULT NULL,
  `bjyichukuNum` int(11) DEFAULT NULL,
  `bjbencichukuNum` int(11) DEFAULT NULL,
  `bjbeizhu` varchar(255) DEFAULT NULL,
  `bjchukuBeizhu` varchar(255) DEFAULT NULL,
  `bjcangku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bjId`),
  KEY `chuku_id` (`chukudanId`),
  CONSTRAINT `chuku_id` FOREIGN KEY (`chukudanId`) REFERENCES `kuguan_chukudan` (`chukudanId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_chukuedit
-- ----------------------------
INSERT INTO `kuguan_chukuedit` VALUES ('1', '6', 'se', 'fee', 'fe', '2', '1', '1', 'few', 'erg', 'a');
INSERT INTO `kuguan_chukuedit` VALUES ('3', '407', 'ef', 'ge', 'gr', '3', '3', '2', '[object HTMLInputElement]', null, null);
INSERT INTO `kuguan_chukuedit` VALUES ('4', '302', 'ef', 'ttr', 're', '5', '5', '3', '[object HTMLInputElement]', '4', null);
INSERT INTO `kuguan_chukuedit` VALUES ('11', '617', '606', '三鹿', '属性', '2', '0', '0', null, null, '仓库4');
INSERT INTO `kuguan_chukuedit` VALUES ('12', '617', '606', '三鹿', '属性', '2', '0', '0', null, null, '仓库4');
INSERT INTO `kuguan_chukuedit` VALUES ('13', '617', '606', '三鹿', '属性', '1', '0', '0', null, null, '仓库3');
INSERT INTO `kuguan_chukuedit` VALUES ('14', '621', '2', '12', '属性', '2', '0', '0', null, null, '仓库2');
INSERT INTO `kuguan_chukuedit` VALUES ('15', '622', '2', '12', '属性', '1', '0', '0', null, null, '仓库2');
INSERT INTO `kuguan_chukuedit` VALUES ('16', '623', '2', '12', '属性', '2', '0', '0', null, null, '仓库2');
INSERT INTO `kuguan_chukuedit` VALUES ('17', '624', '2', '12', '属性', '1', '0', '0', null, null, '仓库3');

-- ----------------------------
-- Table structure for kuguan_diaobodan
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_diaobodan`;
CREATE TABLE `kuguan_diaobodan` (
  `diaobodanCode` varchar(50) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `goodName` varchar(255) NOT NULL,
  `goodProperty` varchar(255) DEFAULT NULL,
  `goodRepertory` int(20) NOT NULL,
  `outNumber` int(20) NOT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diaobodanCode`,`sku`),
  CONSTRAINT `diaobodancode` FOREIGN KEY (`diaobodanCode`) REFERENCES `kuguan_diaobodanstate` (`diaobodanCode`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_diaobodan
-- ----------------------------
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612082344001', '100006-1', 'hahhh', '', '100', '2', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612082347001', '100002-1', '连衣裙', '', '50', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612090859001', '100002-1', '连衣裙', '', '50', '7', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612090926001', '100002-1', '连衣裙', '', '50', '3', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101657001', '100001-1', '哑铃', '', '44', '5', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101659001', '606', '三鹿', '', '40', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101704001', '0', '裤子', '', '100', '10', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101707001', '0', '裤子', '', '500', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101708001', '0', '裤子', '', '500', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101709001', '0', '裤子', '', '100', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101710001', '0', '裤子', '', '500', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101710002', '0', '裤子', '', '500', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101712001', '0', '裤子', '', '100', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101716002', '0', '裤子', '', '500', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101719001', '0', '裤子', '', '500', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101720001', '0', '裤子', '', '100', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101721001', '0', '裤子', '', '500', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101723001', '0', '裤子', '', '500', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101725001', '0', '裤子', '', '500', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101727001', '0', '裤子', '', '500', '0', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101728001', '0', '裤子', '', '500', '2', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612101731001', '100001-1', '哑铃', '', '44', '2', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612102214001', '606', '三鹿', '', '40', '2', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612132226001', '2', '12', '', '10', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612142044001', '0', '裤子', '', '656', '2', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612142244001', '2', '12', '', '10', '1', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612142245001', '0', '裤子', '', '656', '50', 'null');
INSERT INTO `kuguan_diaobodan` VALUES ('DB201612151118001', '0', '裤子', '', '656', '1', 'null');

-- ----------------------------
-- Table structure for kuguan_diaobodanstate
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_diaobodanstate`;
CREATE TABLE `kuguan_diaobodanstate` (
  `diaobodanCode` varchar(50) NOT NULL,
  `diaobodanSetTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `diaobodanCreater` varchar(20) NOT NULL DEFAULT '管理员',
  `diaobodanAuditor` varchar(20) DEFAULT '',
  `diaobodanAudittime` varchar(50) DEFAULT NULL,
  `diaobodanOutStore` varchar(255) NOT NULL,
  `diaobodanInStore` varchar(255) NOT NULL,
  `diaoboState` varchar(2) NOT NULL DEFAULT '',
  `diaoboBeizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diaobodanCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_diaobodanstate
-- ----------------------------
INSERT INTO `kuguan_diaobodanstate` VALUES ('111111111111111111', '2016-12-14 22:13:46', '管理员', '', null, 'fg', 'we', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('121212', '2016-12-14 22:14:15', '管理员', '', null, 'df', 'fg', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('23', '2016-12-14 22:14:44', '管理员', '', null, '4', '5fg', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('34333333333', '2016-12-14 22:13:27', '管理员', '', null, 'fd', 'fg', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('3434', '2016-12-14 22:15:04', '管理员', '', null, 'f', 'f', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612082344001', '2016-12-13 19:48:12', '管理员', 'yk', '2016-12-13 19:48:03', '仓库1', '仓库2', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612082347001', '2016-12-13 19:49:27', '管理员', 'yk', '2016-12-13 19:49:18', '仓库2', '仓库1', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612090853001', '2016-12-13 19:50:39', 'Blue', 'yk', '2016-12-13 19:50:30', '仓库1', '仓库2', '2', '111');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612090859001', '2016-12-13 19:50:42', '管理员', 'yk', '2016-12-13 19:50:32', '仓库2', '仓库1', '2', '222');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612090915001', '2016-12-13 19:50:49', 'Blue', 'yk', '2016-12-13 19:50:40', '仓库1', '仓库2', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612090926001', '2016-12-13 20:48:37', '管理员', 'yk', '2016-12-13 20:48:28', '仓库2', '仓库1', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612091602001', '2016-12-13 20:48:47', 'Blue', 'yk', '2016-12-13 20:48:38', '仓库1', '仓库7', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612100934001', '2016-12-14 22:57:36', 'Blue', 'yk', '2016-12-14 22:57:25', '仓库1', '仓库3', '2', '333');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101657001', '2016-12-15 11:19:56', 'Blue', 'yk', '2016-12-15 11:19:56', '仓库1', '仓库3', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101659001', '2016-12-12 15:15:36', 'Blue', '', null, '仓库1', '仓库3', '0', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101704001', '2016-12-12 15:15:41', 'Blue', '', null, '仓库3', '仓库7', '0', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101707001', '2016-12-10 17:07:43', 'Blue', '', null, '仓库1', '仓库3', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101708001', '2016-12-15 11:21:28', 'Blue', 'yk', '2016-12-15 11:21:28', '仓库1', '仓库7', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101709001', '2016-12-10 17:09:19', 'Blue', '', null, '仓库3', '仓库1', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101710001', '2016-12-10 17:10:14', 'Blue', '', null, '仓库1', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101710002', '2016-12-10 17:10:44', 'Blue', '', null, '仓库1', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101712001', '2016-12-10 17:12:25', 'Blue', '', null, '仓库3', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101716002', '2016-12-10 17:16:53', 'Blue', '', null, '仓库1', '仓库3', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101719001', '2016-12-10 17:19:42', 'Blue', '', null, '仓库1', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101720001', '2016-12-10 17:20:42', 'Blue', '', null, '仓库3', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101721001', '2016-12-12 15:15:22', 'Blue', '', null, '仓库1', '仓库7', '0', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101723001', '2016-12-10 17:23:37', 'Blue', '', null, '仓库1', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101725001', '2016-12-12 15:15:25', 'Blue', '', null, '仓库1', '仓库7', '0', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101727001', '2016-12-10 17:27:34', 'Blue', '', null, '仓库1', '仓库3', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101728001', '2016-12-10 17:28:52', 'Blue', '', null, '仓库1', '仓库7', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612101731001', '2016-12-14 11:39:30', 'Blue', 'yk', '2016-12-14 11:39:20', '仓库1', '仓库3', '2', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612102214001', '2016-12-10 22:14:21', 'Blue', '', null, '仓库1', '仓库3', '1', '2213');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612132226001', '2016-12-13 22:26:51', 'Blue', '', null, '仓库7', '仓库3', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612142044001', '2016-12-14 20:44:31', 'Blue', '', null, '仓库1', '仓库2', '1', 'bbb');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612142244001', '2016-12-14 22:44:58', 'Blue', '', null, '仓库2', '仓库3', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612142245001', '2016-12-14 22:45:23', 'Blue', '', null, '仓库1', '仓库2', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB201612151118001', '2016-12-15 11:18:15', 'Blue', '', null, '仓库1', '仓库2', '1', '');
INSERT INTO `kuguan_diaobodanstate` VALUES ('Db2543245324344', '2016-12-12 15:06:49', '管理员', '', null, 'aa', 'bb', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB3542354354543', '2016-12-12 15:15:14', '管理员', '', null, 'dd', 'cc', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB4658746874687', '2016-12-08 11:26:14', '管理员', '管理员', null, 'afdsh', 'fg', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB4674523453233', '2016-12-08 19:59:51', '管理员', '', null, 'fgh', 'jk', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB5245454545454', '2016-12-12 15:06:41', '管理员', '', null, 'dd', 'dd', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DB8439409873023', '2016-12-08 11:24:31', '管理员', '管理员', null, '仓库1', '仓库2', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('DBfg546876874684', '2016-12-12 15:06:47', '管理员', '', null, 'cvbd', 'rter', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('df', '2016-12-14 22:14:54', '管理员', '', null, 'f', 'f', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('erwrtwerwerwerer', '2016-12-14 22:13:13', '管理员', '', null, 'fg', 'rd', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('fg', '2016-12-14 22:14:38', '管理员', '', null, '8', '8', '0', null);
INSERT INTO `kuguan_diaobodanstate` VALUES ('tyf', '2016-12-14 22:15:16', '管理员', '', null, 'f', 'f', '0', null);

-- ----------------------------
-- Table structure for kuguan_diaoboruku
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_diaoboruku`;
CREATE TABLE `kuguan_diaoboruku` (
  `diaoboId` varchar(50) NOT NULL,
  `diaoboBossId` int(11) NOT NULL,
  `diaoboCode` varchar(50) NOT NULL,
  `diaoboDiaobodanCode` varchar(50) NOT NULL,
  `diaoboWarehouse` int(11) NOT NULL,
  `diaoboInCount` int(11) NOT NULL,
  `diaoboInFinish` int(11) DEFAULT '0',
  `diaoboSetTime` varchar(50) NOT NULL,
  `diaoboAuthor` int(11) NOT NULL,
  `diaoboNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`diaoboId`),
  KEY `fk_diaoboruku_bossid` (`diaoboBossId`),
  KEY `fk_diaoboruku_cangku` (`diaoboWarehouse`),
  KEY `fk_diaoboruku_yonghu` (`diaoboAuthor`),
  CONSTRAINT `fk_diaoboruku_bossid` FOREIGN KEY (`diaoboBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_diaoboruku_cangku` FOREIGN KEY (`diaoboWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_diaoboruku_yonghu` FOREIGN KEY (`diaoboAuthor`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_diaoboruku
-- ----------------------------
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025695267', '10001', 'RKDB2016120600004', 'DB2016120600004', '4', '50', '20', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025695318', '10001', 'RKDB2016120600005', 'DB2016120600005', '1', '50', '20', '2016-12-6 20:27:23', '10001', '是的发生的发生');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025695368', '10001', 'RKDB2016120600006', 'DB2016120600006', '5', '50', '20', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025695417', '10001', 'RKDB2016120600007', 'DB2016120600007', '5', '50', '20', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025695468', '10001', 'RKDB2016120600008', 'DB2016120600008', '3', '50', '20', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707295', '10001', 'RKDB2016120600011', 'DB2016120600011', '4', '50', '10', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707353', '10001', 'RKDB2016120600012', 'DB2016120600012', '4', '50', '5', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707403', '10001', 'RKDB2016120600013', 'DB2016120600013', '4', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707454', '10001', 'RKDB2016120600014', 'DB2016120600014', '1', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707503', '10001', 'RKDB2016120600015', 'DB2016120600015', '3', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707545', '10001', 'RKDB2016120600016', 'DB2016120600016', '1', '50', '1', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707596', '10001', 'RKDB2016120600017', 'DB2016120600017', '5', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707647', '10001', 'RKDB2016120600018', 'DB2016120600018', '4', '50', '10', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025707689', '10001', 'RKDB2016120600019', 'DB2016120600019', '3', '50', '10', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716461', '10001', 'RKDB2016120600020', 'DB2016120600020', '5', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716726', '10001', 'RKDB2016120600021', 'DB2016120600021', '3', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716784', '10001', 'RKDB2016120600022', 'DB2016120600022', '2', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716842', '10001', 'RKDB2016120600023', 'DB2016120600023', '2', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716884', '10001', 'RKDB2016120600024', 'DB2016120600024', '1', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716926', '10001', 'RKDB2016120600025', 'DB2016120600025', '2', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025716977', '10001', 'RKDB2016120600026', 'DB2016120600026', '1', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025717027', '10001', 'RKDB2016120600027', 'DB2016120600027', '5', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481025717086', '10001', 'RKDB2016120600028', 'DB2016120600028', '5', '50', '0', '2016-12-6 20:27:23', '10001', 'orz');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186179473', '10001', 'RKDB2016120600030', 'DB2016120600030', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186179847', '10001', 'RKDB2016120600031', 'DB2016120600031', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186179894', '10001', 'RKDB2016120600032', 'DB2016120600032', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186179957', '10001', 'RKDB2016120600033', 'DB2016120600033', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180019', '10001', 'RKDB2016120600034', 'DB2016120600034', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180097', '10001', 'RKDB2016120600035', 'DB2016120600035', '1', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180177', '10001', 'RKDB2016120600036', 'DB2016120600036', '1', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180224', '10001', 'RKDB2016120600037', 'DB2016120600037', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180271', '10001', 'RKDB2016120600038', 'DB2016120600038', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186180317', '10001', 'RKDB2016120600039', 'DB2016120600039', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196263', '10001', 'RKDB2016120600040', 'DB2016120600040', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196482', '10001', 'RKDB2016120600041', 'DB2016120600041', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196544', '10001', 'RKDB2016120600042', 'DB2016120600042', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196591', '10001', 'RKDB2016120600043', 'DB2016120600043', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196653', '10001', 'RKDB2016120600044', 'DB2016120600044', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196700', '10001', 'RKDB2016120600045', 'DB2016120600045', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196747', '10001', 'RKDB2016120600046', 'DB2016120600046', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196809', '10001', 'RKDB2016120600047', 'DB2016120600047', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196872', '10001', 'RKDB2016120600048', 'DB2016120600048', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186196919', '10001', 'RKDB2016120600049', 'DB2016120600049', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217096', '10001', 'RKDB2016120600050', 'DB2016120600050', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217314', '10001', 'RKDB2016120600051', 'DB2016120600051', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217361', '10001', 'RKDB2016120600052', 'DB2016120600052', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217408', '10001', 'RKDB2016120600053', 'DB2016120600053', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217455', '10001', 'RKDB2016120600054', 'DB2016120600054', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217517', '10001', 'RKDB2016120600055', 'DB2016120600055', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217611', '10001', 'RKDB2016120600057', 'DB2016120600057', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217689', '10001', 'RKDB2016120600058', 'DB2016120600058', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481186217735', '10001', 'RKDB2016120600059', 'DB2016120600059', '1', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722515410', '10001', 'RKDB2016120600060', 'DB2016120600060', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722515853', '10001', 'RKDB2016120600061', 'DB2016120600061', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722515919', '10001', 'RKDB2016120600062', 'DB2016120600062', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722515978', '10001', 'RKDB2016120600063', 'DB2016120600063', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516038', '10001', 'RKDB2016120600064', 'DB2016120600064', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516089', '10001', 'RKDB2016120600065', 'DB2016120600065', '2', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516140', '10001', 'RKDB2016120600066', 'DB2016120600066', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516191', '10001', 'RKDB2016120600067', 'DB2016120600067', '4', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516268', '10001', 'RKDB2016120600068', 'DB2016120600068', '3', '50', '0', '2016-12-8 20:27:23', '10001', '');
INSERT INTO `kuguan_diaoboruku` VALUES ('17225372-1481722516319', '10001', 'RKDB2016120600069', 'DB2016120600069', '5', '50', '0', '2016-12-8 20:27:23', '10001', '');

-- ----------------------------
-- Table structure for kuguan_diaoborukuinfo
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_diaoborukuinfo`;
CREATE TABLE `kuguan_diaoborukuinfo` (
  `diaoboxiangqingId` varchar(50) NOT NULL,
  `diaoboxiangqingBossId` int(11) NOT NULL,
  `diaoboxiangqingCode` varchar(50) NOT NULL,
  `diaoboxiangqingSku` varchar(50) NOT NULL,
  `diaoboxiangqingName` int(11) NOT NULL,
  `diaoboxiangqingAttribute` varchar(100) DEFAULT NULL,
  `diaoboxiangqingWarehouse` int(11) NOT NULL,
  `diaoboxiangqingInNeed` int(11) NOT NULL,
  `diaoboxiangqingInFinish` int(11) DEFAULT '0',
  `diaoboxiangqingNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`diaoboxiangqingId`),
  KEY `fk_diaoborukuinfo_bossid` (`diaoboxiangqingBossId`),
  KEY `fk_diaoborukuinfo_shangpinsku1` (`diaoboxiangqingSku`),
  KEY `fk_diaoborukuinfo_shangpinname` (`diaoboxiangqingName`),
  KEY `fk_diaoborukuinfo_cangku` (`diaoboxiangqingWarehouse`),
  CONSTRAINT `fk_diaoborukuinfo_bossid` FOREIGN KEY (`diaoboxiangqingBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_diaoborukuinfo_cangku` FOREIGN KEY (`diaoboxiangqingWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_diaoborukuinfo_shangpinname` FOREIGN KEY (`diaoboxiangqingName`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `fk_diaoborukuinfo_shangpinsku1` FOREIGN KEY (`diaoboxiangqingSku`) REFERENCES `caigou_goods` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_diaoborukuinfo
-- ----------------------------
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085277', '10001', 'RKDB2016120600000', '100001-1', '100001', 'n', '3', '10', '10', '23');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085541', '10001', 'RKDB2016120600001', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085623', '10001', 'RKDB2016120600002', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085670', '10001', 'RKDB2016120600003', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085730', '10001', 'RKDB2016120600004', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085782', '10001', 'RKDB2016120600005', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085857', '10001', 'RKDB2016120600006', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085908', '10001', 'RKDB2016120600007', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029085961', '10001', 'RKDB2016120600008', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029086037', '10001', 'RKDB2016120600009', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029103766', '10001', 'RKDB2016120600010', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104124', '10001', 'RKDB2016120600011', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104207', '10001', 'RKDB2016120600012', '100001-1', '100001', 'n', '1', '10', '5', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104258', '10001', 'RKDB2016120600013', '100001-1', '100001', 'n', '1', '10', '0', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104309', '10001', 'RKDB2016120600014', '100001-1', '100001', 'n', '1', '10', '0', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104359', '10001', 'RKDB2016120600015', '100001-1', '100001', 'n', '1', '10', '0', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104419', '10001', 'RKDB2016120600016', '100001-1', '100001', 'n', '1', '10', '1', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104470', '10001', 'RKDB2016120600017', '100001-1', '100001', 'n', '1', '10', '0', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104520', '10001', 'RKDB2016120600018', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029104571', '10001', 'RKDB2016120600019', '100001-1', '100001', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146101', '10001', 'RKDB2016120600000', '100002-1', '100002', 'n', '1', '10', '10', '2333');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146341', '10001', 'RKDB2016120600001', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146391', '10001', 'RKDB2016120600002', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146443', '10001', 'RKDB2016120600003', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146493', '10001', 'RKDB2016120600004', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146545', '10001', 'RKDB2016120600005', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146595', '10001', 'RKDB2016120600006', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146647', '10001', 'RKDB2016120600007', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146706', '10001', 'RKDB2016120600008', '100002-1', '100002', 'n', '1', '10', '10', '');
INSERT INTO `kuguan_diaoborukuinfo` VALUES ('17225372-1481029146757', '10001', 'RKDB2016120600009', '100002-1', '100002', 'n', '1', '10', '10', '');

-- ----------------------------
-- Table structure for kuguan_goodlog
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_goodlog`;
CREATE TABLE `kuguan_goodlog` (
  `goodId` int(11) NOT NULL,
  `wareHouseId` int(11) NOT NULL,
  `goodNum` int(50) NOT NULL,
  `dateTime` datetime NOT NULL,
  KEY `goodId` (`goodId`),
  KEY `agfdhdfsh` (`wareHouseId`),
  CONSTRAINT `agfdhdfsh` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `kuguan_goodlog_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_goodlog
-- ----------------------------
INSERT INTO `kuguan_goodlog` VALUES ('0', '1', '656', '2016-12-13 09:44:56');
INSERT INTO `kuguan_goodlog` VALUES ('0', '2', '44', '2016-12-15 14:17:32');
INSERT INTO `kuguan_goodlog` VALUES ('2', '1', '100', '2016-12-13 09:44:57');
INSERT INTO `kuguan_goodlog` VALUES ('11', '1', '1000', '2016-12-13 09:44:57');
INSERT INTO `kuguan_goodlog` VALUES ('11', '2', '110', '2016-12-14 19:55:31');
INSERT INTO `kuguan_goodlog` VALUES ('101', '2', '22', '2016-12-15 14:17:32');
INSERT INTO `kuguan_goodlog` VALUES ('606', '1', '40', '2016-12-08 16:01:49');
INSERT INTO `kuguan_goodlog` VALUES ('1327', '1', '5', '2016-12-13 09:44:58');
INSERT INTO `kuguan_goodlog` VALUES ('100001', '1', '44', '2016-12-13 09:44:58');
INSERT INTO `kuguan_goodlog` VALUES ('1327010666', '2', '1010', '2016-12-15 14:17:33');
INSERT INTO `kuguan_goodlog` VALUES ('100002', '2', '50', '2016-12-08 16:03:18');
INSERT INTO `kuguan_goodlog` VALUES ('100002', '3', '50', '2016-12-08 16:03:33');
INSERT INTO `kuguan_goodlog` VALUES ('100004', '1', '30', '2016-12-13 09:44:58');
INSERT INTO `kuguan_goodlog` VALUES ('100006', '1', '80', '2016-12-13 09:44:59');
INSERT INTO `kuguan_goodlog` VALUES ('100007', '1', '3', '2016-12-13 09:44:59');
INSERT INTO `kuguan_goodlog` VALUES ('100007', '5', '100', '2016-12-08 16:04:29');
INSERT INTO `kuguan_goodlog` VALUES ('3', '1', '10', '2016-12-13 09:44:57');
INSERT INTO `kuguan_goodlog` VALUES ('3', '2', '15', '2016-12-15 14:17:32');
INSERT INTO `kuguan_goodlog` VALUES ('0', '3', '222', '2016-12-15 14:19:04');
INSERT INTO `kuguan_goodlog` VALUES ('2', '2', '10', '2016-12-15 14:17:32');
INSERT INTO `kuguan_goodlog` VALUES ('123', '1', '55', '2016-12-13 09:46:24');
INSERT INTO `kuguan_goodlog` VALUES ('101', '1', '10', '2016-12-14 09:56:43');
INSERT INTO `kuguan_goodlog` VALUES ('222', '1', '100', '2016-12-14 09:58:11');
INSERT INTO `kuguan_goodlog` VALUES ('69852', '1', '1111', '2016-12-14 09:59:05');
INSERT INTO `kuguan_goodlog` VALUES ('123', '2', '333', '2016-12-15 14:17:33');
INSERT INTO `kuguan_goodlog` VALUES ('123', '3', '444', '2016-12-15 14:19:04');
INSERT INTO `kuguan_goodlog` VALUES ('666', '1', '44', '2016-12-14 19:11:58');
INSERT INTO `kuguan_goodlog` VALUES ('999', '1', '55', '2016-12-14 19:11:59');
INSERT INTO `kuguan_goodlog` VALUES ('222', '2', '5555', '2016-12-15 14:17:33');
INSERT INTO `kuguan_goodlog` VALUES ('666', '2', '10', '2016-12-15 14:18:23');
INSERT INTO `kuguan_goodlog` VALUES ('2', '3', '222222', '2016-12-15 14:19:04');

-- ----------------------------
-- Table structure for kuguan_rukuwancheng
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_rukuwancheng`;
CREATE TABLE `kuguan_rukuwancheng` (
  `wanchengId` varchar(50) NOT NULL,
  `wanchengBossId` int(11) NOT NULL,
  `wanchengCode` varchar(50) NOT NULL,
  `wanchengXiangguanCode` varchar(50) NOT NULL,
  `wanchengType` varchar(50) NOT NULL,
  `wanchengInCount` int(11) NOT NULL,
  `wanchengSetTime` varchar(50) NOT NULL,
  `wanchengAuthor` int(11) NOT NULL,
  `wanchengChecker` int(11) DEFAULT NULL,
  `wanchengCheckTime` varchar(50) NOT NULL,
  `wanchengNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`wanchengId`),
  KEY `fk_rukuwancheng_bossid` (`wanchengBossId`),
  KEY `fk_rukuwancheng_yonghu` (`wanchengAuthor`),
  KEY `fk_rukuwancheng_yonghu2` (`wanchengChecker`),
  CONSTRAINT `fk_rukuwancheng_bossid` FOREIGN KEY (`wanchengBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_rukuwancheng_yonghu` FOREIGN KEY (`wanchengAuthor`) REFERENCES `common_user` (`userId`),
  CONSTRAINT `fk_rukuwancheng_yonghu2` FOREIGN KEY (`wanchengChecker`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_rukuwancheng
-- ----------------------------
INSERT INTO `kuguan_rukuwancheng` VALUES ('11038854-1481249084820', '10001', 'RKDB2016120600002', 'DB2016120600002', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-09 10:04:44', 'orz');
INSERT INTO `kuguan_rukuwancheng` VALUES ('2317752-1481249042149', '10001', 'RKDB2016120600001', 'DB2016120600001', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-09 10:04:02', 'asads');
INSERT INTO `kuguan_rukuwancheng` VALUES ('25020932-1481006772638', '10001', 'RKCG201612060019', 'CG201612060019', '采购入库', '100', '2016-12-2 9:55:00', '10001', '10002', '2016-12-06 14:46:12', 'sersresersre');
INSERT INTO `kuguan_rukuwancheng` VALUES ('25020932-1481025214945', '10001', 'RK20161206000000000000', '20161206000000000000', '销售退货入库', '100', '2016-12-6 15:12:43', '10002', '10001', '2016-12-06 19:53:34', 'this is note');
INSERT INTO `kuguan_rukuwancheng` VALUES ('25020932-1481030154160', '10001', 'RKDB2016120600029', 'DB2016120600029', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10002', '2016-12-06 21:15:54', 'orz');
INSERT INTO `kuguan_rukuwancheng` VALUES ('29933753-1481714643864', '10001', 'RKDB2016120600009', 'DB2016120600009', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-14 19:24:03', 'orz');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642034', '10001', 'RKCG201612060020', 'CG201612060020', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', 's');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642297', '10001', 'RKCG201612060021', 'CG201612060021', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642368', '10001', 'RKCG201612060022', 'CG201612060022', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642423', '10001', 'RKCG201612060023', 'CG201612060023', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642474', '10001', 'RKCG201612060024', 'CG201612060024', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642525', '10001', 'RKCG201612060025', 'CG201612060025', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642576', '10001', 'RKCG201612060026', 'CG201612060026', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642627', '10001', 'RKCG201612060027', 'CG201612060027', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642678', '10001', 'RKCG201612060028', 'CG201612060028', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120642729', '10001', 'RKCG201612060029', 'CG201612060029', '采购入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684234', '10001', 'RKDB201612060020', 'DB201612060000', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684479', '10001', 'RKDB201612060021', 'DB201612060001', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684537', '10001', 'RKDB201612060022', 'DB201612060002', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684602', '10001', 'RKDB201612060023', 'DB201612060003', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684658', '10001', 'RKDB201612060024', 'DB201612060004', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684710', '10001', 'RKDB201612060025', 'DB201612060005', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684761', '10001', 'RKDB201612060026', 'DB201612060006', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684813', '10001', 'RKDB201612060027', 'DB201612060007', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684864', '10001', 'RKDB201612060028', 'DB201612060008', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120684924', '10001', 'RKDB201612060029', 'DB201612060009', '调拨入库', '50', '2016-12-7 20:35:30', '10002', '10002', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120731813', '10001', 'RK201612060000', '201612060000', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732066', '10001', 'RK201612060001', '201612060001', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732124', '10001', 'RK201612060002', '201612060002', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732192', '10001', 'RK201612060003', '201612060003', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732256', '10001', 'RK201612060004', '201612060004', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732304', '10001', 'RK201612060005', '201612060005', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732356', '10001', 'RK201612060006', '201612060006', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732407', '10001', 'RK201612060007', '201612060007', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732459', '10001', 'RK201612060008', '201612060008', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('31168322-1481120732510', '10001', 'RK201612060009', '201612060009', '销售退货入库', '50', '2016-12-7 20:35:30', '10001', '10001', '2016-12-7 21:36:00', '23333');
INSERT INTO `kuguan_rukuwancheng` VALUES ('33512901-1481249058319', '10001', 'RKDB2016120600010', 'DB2016120600010', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-09 10:04:18', 'orz');
INSERT INTO `kuguan_rukuwancheng` VALUES ('3722262-1481248962442', '10001', 'RKDB2016120600000', 'DB2016120600000', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-09 10:02:42', '一颗塞梯的，按M安轨，按E可赛艇');
INSERT INTO `kuguan_rukuwancheng` VALUES ('4213557-1481249190975', '10001', 'RKDB2016120600003', 'DB2016120600003', '调拨入库', '50', '2016-12-6 20:27:23', '10001', '10001', '2016-12-09 10:06:30', 'orz');

-- ----------------------------
-- Table structure for kuguan_tuihuoruku
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_tuihuoruku`;
CREATE TABLE `kuguan_tuihuoruku` (
  `tuihuoId` varchar(50) NOT NULL,
  `tuihuoBossId` int(11) NOT NULL,
  `tuihuoCode` varchar(50) NOT NULL,
  `tuihuoTuihuodanCode` varchar(50) NOT NULL,
  `tuihuoWarehouse` int(11) NOT NULL,
  `tuihuoInCount` int(11) NOT NULL,
  `tuihuoInFinish` int(11) DEFAULT '0',
  `tuihuoSetTime` varchar(50) NOT NULL,
  `tuihuoAuthor` int(11) NOT NULL,
  `tuihuoNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`tuihuoId`),
  KEY `fk_tuihuoruku_bossid` (`tuihuoBossId`),
  KEY `fk_tuihuoruku_cangku` (`tuihuoWarehouse`),
  KEY `fk_tuihuoruku_yonghu` (`tuihuoAuthor`),
  CONSTRAINT `fk_tuihuoruku_bossid` FOREIGN KEY (`tuihuoBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_tuihuoruku_cangku` FOREIGN KEY (`tuihuoWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_tuihuoruku_yonghu` FOREIGN KEY (`tuihuoAuthor`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_tuihuoruku
-- ----------------------------
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008591603', '10001', 'RK20161206000000000000', 'RK20161206000000000000', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008591829', '10001', 'RK20161206000000000001', 'RK20161206000000000001', '1', '100', '23', '2016-12-6 15:12:43', '10002', 'yikedaitide');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008591907', '10001', 'RK20161206000000000002', 'RK20161206000000000002', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008591962', '10001', 'RK20161206000000000003', 'RK20161206000000000003', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592012', '10001', 'RK20161206000000000004', 'RK20161206000000000004', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592063', '10001', 'RK20161206000000000005', 'RK20161206000000000005', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592113', '10001', 'RK20161206000000000006', 'RK20161206000000000006', '4', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592164', '10001', 'RK20161206000000000007', 'RK20161206000000000007', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592214', '10001', 'RK20161206000000000008', 'RK20161206000000000008', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008592266', '10001', 'RK20161206000000000009', 'RK20161206000000000009', '4', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008729611', '10001', 'RK20161206000000000010', 'RK20161206000000000010', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008729889', '10001', 'RK20161206000000000011', 'RK20161206000000000011', '5', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008729939', '10001', 'RK20161206000000000012', 'RK20161206000000000012', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730004', '10001', 'RK20161206000000000013', 'RK20161206000000000013', '4', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730058', '10001', 'RK20161206000000000014', 'RK20161206000000000014', '5', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730118', '10001', 'RK20161206000000000015', 'RK20161206000000000015', '5', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730167', '10001', 'RK20161206000000000016', 'RK20161206000000000016', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730226', '10001', 'RK20161206000000000017', 'RK20161206000000000017', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730277', '10001', 'RK20161206000000000018', 'RK20161206000000000018', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008730327', '10001', 'RK20161206000000000019', 'RK20161206000000000019', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738421', '10001', 'RK20161206000000000020', 'RK20161206000000000020', '1', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738683', '10001', 'RK20161206000000000021', 'RK20161206000000000021', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738740', '10001', 'RK20161206000000000022', 'RK20161206000000000022', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738791', '10001', 'RK20161206000000000023', 'RK20161206000000000023', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738841', '10001', 'RK20161206000000000024', 'RK20161206000000000024', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738884', '10001', 'RK20161206000000000025', 'RK20161206000000000025', '5', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738934', '10001', 'RK20161206000000000026', 'RK20161206000000000026', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008738983', '10001', 'RK20161206000000000027', 'RK20161206000000000027', '3', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');
INSERT INTO `kuguan_tuihuoruku` VALUES ('17225372-1481008739067', '10001', 'RK20161206000000000028', 'RK20161206000000000028', '2', '100', '0', '2016-12-6 15:12:43', '10002', 'this is note');

-- ----------------------------
-- Table structure for kuguan_tuihuorukuinfo
-- ----------------------------
DROP TABLE IF EXISTS `kuguan_tuihuorukuinfo`;
CREATE TABLE `kuguan_tuihuorukuinfo` (
  `tuihuoxiangqingId` varchar(50) NOT NULL,
  `tuihuoxiangqingBossId` int(11) NOT NULL,
  `tuihuoxiangqingCode` varchar(50) NOT NULL,
  `tuihuoxiangqingSku` varchar(50) NOT NULL,
  `tuihuoxiangqingName` int(11) NOT NULL,
  `tuihuoxiangqingAttribute` varchar(100) DEFAULT NULL,
  `tuihuoxiangqingWarehouse` int(11) NOT NULL,
  `tuihuoxiangqingInNeed` int(11) NOT NULL,
  `tuihuoxiangqingInOk` int(11) DEFAULT '0',
  `tuihuoxiangqingInBroken` int(11) DEFAULT '0',
  `tuihuoxiangqingInLost` int(11) DEFAULT '0',
  `tuihuoxiangqingNote` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`tuihuoxiangqingId`),
  KEY `fk_tuihuorukuinfo_bossid` (`tuihuoxiangqingBossId`),
  KEY `fk_tuihuorukuinfo_shangpinsku` (`tuihuoxiangqingSku`),
  KEY `fk_tuihuorukuinfo_shangpinname` (`tuihuoxiangqingName`),
  KEY `fk_tuihuorukuinfo_cangku` (`tuihuoxiangqingWarehouse`),
  CONSTRAINT `fk_tuihuorukuinfo_bossid` FOREIGN KEY (`tuihuoxiangqingBossId`) REFERENCES `common_boss` (`userId`),
  CONSTRAINT `fk_tuihuorukuinfo_cangku` FOREIGN KEY (`tuihuoxiangqingWarehouse`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `fk_tuihuorukuinfo_shangpinname` FOREIGN KEY (`tuihuoxiangqingName`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `fk_tuihuorukuinfo_shangpinsku` FOREIGN KEY (`tuihuoxiangqingSku`) REFERENCES `caigou_goods` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kuguan_tuihuorukuinfo
-- ----------------------------
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992043', '10001', 'RK20161206000000000000', '100001-1', '100001', '无属性', '1', '50', '20', '15', '15', '这是大衣');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992436', '10001', 'RK20161206000000000001', '100001-1', '100001', '无属性', '1', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992502', '10001', 'RK20161206000000000002', '100001-1', '100001', '无属性', '2', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992561', '10001', 'RK20161206000000000003', '100001-1', '100001', '无属性', '2', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992620', '10001', 'RK20161206000000000004', '100001-1', '100001', '无属性', '3', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992680', '10001', 'RK20161206000000000005', '100001-1', '100001', '无属性', '3', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992738', '10001', 'RK20161206000000000006', '100001-1', '100001', '无属性', '4', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992789', '10001', 'RK20161206000000000007', '100001-1', '100001', '无属性', '4', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992848', '10001', 'RK20161206000000000008', '100001-1', '100001', '无属性', '5', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481020992907', '10001', 'RK20161206000000000009', '100001-1', '100001', '无属性', '5', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021022535', '10001', 'RK20161206000000000000', '100002-1', '100002', '无属性', '1', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021022789', '10001', 'RK20161206000000000001', '100002-1', '100002', '无属性', '1', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021022873', '10001', 'RK20161206000000000002', '100002-1', '100002', '无属性', '2', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021022944', '10001', 'RK20161206000000000003', '100002-1', '100002', '无属性', '2', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021022999', '10001', 'RK20161206000000000004', '100002-1', '100002', '无属性', '3', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021023059', '10001', 'RK20161206000000000005', '100002-1', '100002', '无属性', '3', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021023126', '10001', 'RK20161206000000000006', '100002-1', '100002', '无属性', '4', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021023193', '10001', 'RK20161206000000000007', '100002-1', '100002', '无属性', '4', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021023252', '10001', 'RK20161206000000000008', '100002-1', '100002', '无属性', '5', '50', '0', '0', '0', '2333');
INSERT INTO `kuguan_tuihuorukuinfo` VALUES ('31168322-1481021023301', '10001', 'RK20161206000000000009', '100002-1', '100002', '无属性', '5', '50', '0', '0', '0', '2333');

-- ----------------------------
-- Table structure for order_buyer
-- ----------------------------
DROP TABLE IF EXISTS `order_buyer`;
CREATE TABLE `order_buyer` (
  `buyerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家id',
  `buyerName` varchar(50) NOT NULL COMMENT '买家姓名',
  `userId` int(11) NOT NULL,
  `alipayId` varchar(20) DEFAULT NULL COMMENT '支付宝账号',
  `buyerTel` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `buyerPhone` char(11) NOT NULL COMMENT '机号手',
  `buyerPostcode` char(6) NOT NULL COMMENT '邮编',
  `buyerProvince` varchar(50) NOT NULL COMMENT '省份',
  `buyerCity` varchar(50) DEFAULT NULL COMMENT '市',
  `buyerDistrict` varchar(50) DEFAULT NULL COMMENT '区',
  `buyerLocation` varchar(200) NOT NULL COMMENT '详细地址',
  `buyerAddress` varchar(400) NOT NULL COMMENT '买家的总地址信息',
  PRIMARY KEY (`buyerId`),
  UNIQUE KEY `alipayId` (`alipayId`)
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_buyer
-- ----------------------------
INSERT INTO `order_buyer` VALUES ('1001', '海波', '10001', '13624685497', '15736873305', '15736873305', '452300', '410000', '371400', '110101', '宝莲市', '');
INSERT INTO `order_buyer` VALUES ('1002', '王振', '10002', '13624598762', '15736873306', '15736873306', '450000', '410000', '371400', '110101', '徐州', '');
INSERT INTO `order_buyer` VALUES ('1007', '圆真', '10001', '15736873310', '15736873310', '03947654321', '412213', '420000', '420200', '420202', '光明顶', '四川');
INSERT INTO `order_buyer` VALUES ('1008', '张三丰', '10001', '15736873382', '15736873382', '01561512456', '412213', '410000', '371400', '110101', '武当山', '武当山');
INSERT INTO `order_buyer` VALUES ('1009', '圆真2', '10001', '', '15736873310', '15736873310', '412213', '410000', '410100', '410103', '光明顶', '河南省郑州市二七区');
INSERT INTO `order_buyer` VALUES ('1010', '圆真3', '10001', null, '15736873310', '15736873310', '412213', '410000', '410100', '410103', '光明顶', '河南省郑州市二七区');
INSERT INTO `order_buyer` VALUES ('1011', '圆真4', '10001', null, '15736873310', '15736873310', '412213', '410000', '410100', '410103', '光明顶', '河南省郑州市二七区');
INSERT INTO `order_buyer` VALUES ('1012', '圆真5', '10001', null, '15736873310', '15736873310', '412213', '410000', '410100', '410103', '光明顶', '河南省郑州市二七区');
INSERT INTO `order_buyer` VALUES ('1013', '灭绝师太2', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1014', '灭绝师太3', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1015', '海波2', '10001', null, '15736873305', '15736873305', '452300', '410000', '371400', '110101', '宝莲市', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1016', '海波2', '10001', null, '15736873305', '15736873305', '452300', '410000', '371400', '110101', '宝莲市', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1017', '圆真', '10001', null, '15736873310', '15736873310', '412213', '410000', '371400', '110101', '光明顶', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1018', '海波3', '10001', null, '15736873305', '15736873305', '452300', '130000', '130300', '130302', '宝莲市', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1019', '张三丰5', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1020', '张三丰7', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1021', '张三丰8', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1022', '张三丰8', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1023', '圆真11', '10001', null, '15736873310', '15736873310', '412213', '410000', '371400', '110101', '光明顶', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1024', '灭绝师太4', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1025', '灭绝师太7', '10001', null, '15736873382', '15736873382', '412213', '410000', '410100', '410183', '峨眉山', '河南省郑州市新密市');
INSERT INTO `order_buyer` VALUES ('1026', '天天开心', '10001', null, '15736873305', '15736873305', '236000', '110000', null, null, '武当山', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1027', 'bage', '10001', null, '15736873305', '15736873305', '123', '130000', '130300', '130304', '没毛病', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1028', '笑傲江湖', '10001', null, '13628624597', '13548769521', '663600', '110000', '110100', '110101', '武当山', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1029', '世界波', '10001', null, '15736873305', '15736873305', '236000', '340000', '341200', '341201', '武当山', '安徽省阜阳市市辖区');
INSERT INTO `order_buyer` VALUES ('1030', '灭绝师太', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1031', '张三丰111', '10001', null, '15736873382', '15736873382', '412213', '410000', '371400', '110101', '武当山', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1032', '白眉鹰王', '10001', null, '15736873305', '15736873305', '236000', '130000', '130300', '130302', '光明顶', '河北省秦皇岛市海港区');
INSERT INTO `order_buyer` VALUES ('1033', '紫衫龙王', '10001', null, '15736873310', '15736873310', '412213', '130000', '130300', '130304', '光明顶', '河北省秦皇岛市北戴河区');
INSERT INTO `order_buyer` VALUES ('1034', '青翼蝠王', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '光明顶', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1035', '杨过', '10001', null, '15736873305', '15736873305', '236000', '130000', null, null, 'undefined', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1036', '郭襄', '10001', null, '15736873305', '15736873305', '236000', '140000', '140300', '140303', '襄阳城', '山西省阳泉市矿　区');
INSERT INTO `order_buyer` VALUES ('1037', '杨康', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '中南山古墓', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1038', '黄蓉', '10001', null, '15736873305', '15736873305', '452300', '410000', '371400', '110101', '襄阳城', '河南省德州市东城区');
INSERT INTO `order_buyer` VALUES ('1039', '金轮法王', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '中南山古墓', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1040', '裘千仞', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '中南山古墓', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1041', '亚索', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1042', '烬', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1043', '蒙多', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1044', '亚索', '10001', null, '15736873306', '15736873305', '236000', '110000', '110100', '110103', '召唤师峡谷', '北京市市辖区崇文区');
INSERT INTO `order_buyer` VALUES ('1045', '伊芙琳', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1046', '蛮王123', '10001', null, '1573687456', '157368734', '236000', '120000', '120200', '120221', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1047', '纳尔', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1048', '德莱厄斯', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1049', '德莱文', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1050', '墨菲特', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1051', 'EZ', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1052', '瑞文', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '召唤师峡谷', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1053', 'Miss fortune', '10001', null, '15736873305', '15736873305', '236000', '110000', '110100', '110101', '比尔吉沃特', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1054', '光明左使', '10001', null, '15736873305', '15736873305', '236000', '140000', '140300', '140303', '光明顶', '山西省阳泉市矿　区');
INSERT INTO `order_buyer` VALUES ('1055', '盖小轮', '10001', null, '123456', '123456789', '663600', '140000', '140300', '140303', '西亚', '山西省阳泉市矿　区');
INSERT INTO `order_buyer` VALUES ('1056', '我的撒', '1333333365', null, '15720681807', '15720681807', '123456', '110000', '110100', '110102', '阿斯顿撒', '北京市市辖区西城区');
INSERT INTO `order_buyer` VALUES ('1057', '笑傲江湖000', '10001', null, '13628624597', '13628624597', '663600', '110000', '110100', '110101', '武当山', '北京市市辖区东城区');
INSERT INTO `order_buyer` VALUES ('1058', '张三', '10001', null, '15245896321', '15245896321', '123456', '120000', '120100', '120102', '阿萨德', '天津市市辖区河东区');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `detailId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单明细id',
  `orderCode` varchar(50) NOT NULL COMMENT '订单id',
  `goodId` int(11) NOT NULL COMMENT '商品id',
  `wareHouserId` int(11) NOT NULL COMMENT '仓库id',
  `detailGoodNum` int(11) NOT NULL COMMENT '商品数量',
  `goodPrice` double NOT NULL COMMENT '商品单价',
  `detailGoodPrivilege` double DEFAULT NULL COMMENT '商品优惠',
  `detailGoodDiscount` float DEFAULT NULL COMMENT '折扣',
  `detailSellPrice` double NOT NULL COMMENT '销售价格',
  `detailTotal` double NOT NULL COMMENT '单独商品的合计',
  PRIMARY KEY (`detailId`),
  KEY `fk_good` (`goodId`),
  KEY `jhgfjghk` (`wareHouserId`),
  KEY `gsdfgd` (`orderCode`),
  CONSTRAINT `fk_good` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `gsdfgd` FOREIGN KEY (`orderCode`) REFERENCES `order_order` (`orderCode`),
  CONSTRAINT `jhgfjghk` FOREIGN KEY (`wareHouserId`) REFERENCES `caigou_warehouse` (`wareHouseId`)
) ENGINE=InnoDB AUTO_INCREMENT=1339 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1130', 'OD201612061407001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1134', 'OD201612061634001', '100001', '2', '1', '50', '10', null, '50', '40');
INSERT INTO `order_detail` VALUES ('1135', 'OD201612061634001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1136', 'OD201612061638001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1137', 'OD201612061638001', '100002', '2', '1', '40', '2', null, '40', '38');
INSERT INTO `order_detail` VALUES ('1138', 'OD201612061638002', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1139', 'OD201612061638002', '100002', '2', '1', '40', '2', null, '40', '38');
INSERT INTO `order_detail` VALUES ('1140', 'OD201612061752001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1141', 'OD201612061752001', '1327', '1', '1', '1327', '4', null, '1327', '1323');
INSERT INTO `order_detail` VALUES ('1142', 'OD201612061755001', '606', '1', '10', '606', '20', null, '606', '6040');
INSERT INTO `order_detail` VALUES ('1143', 'OD201612061756001', '606', '1', '14', '606', '45', null, '606', '8439');
INSERT INTO `order_detail` VALUES ('1144', 'OD201612061807001', '606', '1', '1', '606', '400', null, '606', '206');
INSERT INTO `order_detail` VALUES ('1146', 'OD201612071418001', '100001', '2', '100', '50', '67', null, '50', '4933');
INSERT INTO `order_detail` VALUES ('1148', 'OD201612072006001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1149', 'OD201612072010001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1150', 'OD201612072011001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1151', 'OD201612072014001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1155', 'OD201612072014001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1160', 'OD201612072140001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1161', 'OD201612072140001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1162', 'OD201612072140001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1163', 'OD201612072140001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1164', 'OD201612072140001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1165', 'OD201612072140001', '100004', '1', '1', '400', '0', null, '400', '400');
INSERT INTO `order_detail` VALUES ('1166', 'OD201612072140001', '100006', '1', '1', '5', '0', null, '5', '5');
INSERT INTO `order_detail` VALUES ('1171', 'OD201612072208001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1172', 'OD201612072214001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1176', 'OD201612072232001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1177', 'OD201612072235001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1178', 'OD201612072237001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1181', 'OD201612081117001', '100004', '1', '1', '400', '0', null, '400', '400');
INSERT INTO `order_detail` VALUES ('1194', 'OD201612081550001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1195', 'OD201612081905001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1196', 'OD201612081905001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1197', 'OD201612081905001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1198', 'OD201612081905001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1199', 'OD201612081905001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1200', 'OD201612081905001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1201', 'OD201612081905001', '100004', '1', '1', '400', '0', null, '400', '400');
INSERT INTO `order_detail` VALUES ('1202', 'OD201612081905001', '100006', '1', '1', '5', '0', null, '5', '5');
INSERT INTO `order_detail` VALUES ('1203', 'OD201612081905001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1204', 'OD201612081906001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1205', 'OD201612081906001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1206', 'OD201612081906001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1207', 'OD201612081906001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1208', 'OD201612081906001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1209', 'OD201612081906001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1210', 'OD201612081906001', '100004', '1', '1', '400', '0', null, '400', '400');
INSERT INTO `order_detail` VALUES ('1211', 'OD201612081906001', '100006', '1', '1', '5', '0', null, '5', '5');
INSERT INTO `order_detail` VALUES ('1212', 'OD201612081908001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1213', 'OD201612081908001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1214', 'OD201612081908001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1215', 'OD201612081908001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1216', 'OD201612081909001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1217', 'OD201612081909001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1218', 'OD201612081909001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1219', 'OD201612081909001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1220', 'OD201612081909001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1221', 'OD201612081911001', '0', '2', '12', '999', '0', null, '999', '11988');
INSERT INTO `order_detail` VALUES ('1222', 'OD201612081911001', '11', '2', '12', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1223', 'OD201612081911001', '101', '2', '12', '1', '0', null, '1', '12');
INSERT INTO `order_detail` VALUES ('1224', 'OD201612081911001', '100001', '2', '12', '50', '0', null, '50', '600');
INSERT INTO `order_detail` VALUES ('1225', 'OD201612081911001', '100002', '2', '12', '40', '0', null, '40', '480');
INSERT INTO `order_detail` VALUES ('1226', 'OD201612081915001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1227', 'OD201612081915001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1228', 'OD201612081915001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1229', 'OD201612081915001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1230', 'OD201612081915001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1231', 'OD201612081916001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1232', 'OD201612081916001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1233', 'OD201612081916001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1234', 'OD201612081916001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1235', 'OD201612081916001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1236', 'OD201612081917001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1237', 'OD201612081917001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1238', 'OD201612081917001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1239', 'OD201612081917001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1240', 'OD201612081928001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1241', 'OD201612081928001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1242', 'OD201612081931001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1243', 'OD201612081931001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1244', 'OD201612081933001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1245', 'OD201612081933001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1246', 'OD201612081935001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1247', 'OD201612081935001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1248', 'OD201612081936001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1249', 'OD201612081936001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1250', 'OD201612081936001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1251', 'OD201612081936001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1252', 'OD201612081936001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1253', 'OD201612081937001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1254', 'OD201612081937001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1255', 'OD201612081937001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1256', 'OD201612081937001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1257', 'OD201612081937001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1258', 'OD201612081938001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1259', 'OD201612081938001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1260', 'OD201612081938001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1261', 'OD201612081938001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1262', 'OD201612081938001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1263', 'OD201612081939001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1264', 'OD201612081939001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1265', 'OD201612081939001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1266', 'OD201612081939001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1267', 'OD201612081939001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1268', 'OD201612081941001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1269', 'OD201612081941001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1270', 'OD201612081941001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1271', 'OD201612081941001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1272', 'OD201612081941001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1273', 'OD201612081941002', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1274', 'OD201612081941002', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1275', 'OD201612081941002', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1276', 'OD201612081941002', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1277', 'OD201612081941002', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1278', 'OD201612081943001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1279', 'OD201612081943001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1280', 'OD201612081943001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1281', 'OD201612081944001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1282', 'OD201612081944001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1283', 'OD201612081944001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1284', 'OD201612081944001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1285', 'OD201612081944001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1286', 'OD201612081945001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1287', 'OD201612081945001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1288', 'OD201612081945001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1289', 'OD201612081945001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1290', 'OD201612081945001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1291', 'OD201612081948001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1292', 'OD201612081948001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1293', 'OD201612081948001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1294', 'OD201612081948001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1295', 'OD201612081948001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1296', 'OD201612082105001', '100001', '1', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1297', 'OD201612091013001', '0', '2', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1298', 'OD201612091013001', '11', '2', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1299', 'OD201612091013001', '101', '2', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1300', 'OD201612091013001', '100001', '2', '1', '50', '0', null, '50', '50');
INSERT INTO `order_detail` VALUES ('1301', 'OD201612091013001', '100002', '2', '1', '40', '0', null, '40', '40');
INSERT INTO `order_detail` VALUES ('1302', 'OD201612091013001', '2', '1', '10', '41141', '0', null, '41141', '411410');
INSERT INTO `order_detail` VALUES ('1303', 'OD201612091013001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1304', 'OD201612091013001', '1327', '1', '1', '1327', '0', null, '1327', '1327');
INSERT INTO `order_detail` VALUES ('1305', 'OD201612091013001', '100004', '1', '1', '400', '0', null, '400', '400');
INSERT INTO `order_detail` VALUES ('1306', 'OD201612091013001', '100006', '1', '10', '5', '500', null, '5', '-450');
INSERT INTO `order_detail` VALUES ('1307', 'OD201612091013001', '100007', '1', '10', '411', '500', null, '411', '3610');
INSERT INTO `order_detail` VALUES ('1310', 'OD201612091032001', '11', '1', '1', '0', '0', null, '0', '0');
INSERT INTO `order_detail` VALUES ('1311', 'OD201612091129001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1312', 'OD201612091131001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1314', 'OD201612091546001', '3', '1', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1315', 'OD201612121032001', '3', '1', '1', '1', '0', null, '1', '1');
INSERT INTO `order_detail` VALUES ('1317', 'OD201612121044001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1322', 'OD201612121142001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1323', 'OD201612121142001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1324', 'OD201612121145001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1325', 'OD201612121147001', '2', '1', '1', '41141', '0', null, '41141', '41141');
INSERT INTO `order_detail` VALUES ('1330', 'OD201612121514001', '606', '1', '1', '606', '0', null, '606', '606');
INSERT INTO `order_detail` VALUES ('1331', 'OD201612151051001', '0', '1', '1', '999', '1', null, '999', '998');
INSERT INTO `order_detail` VALUES ('1332', 'OD201612151051001', '2', '1', '1', '41141', '1', null, '41141', '41140');
INSERT INTO `order_detail` VALUES ('1333', 'OD201612151054001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1334', 'OD201612151254001', '0', '1', '1', '999', '0', null, '999', '999');
INSERT INTO `order_detail` VALUES ('1335', 'OD201612151254001', '2', '1', '1', '41141', '0', null, '41141', '41141');

-- ----------------------------
-- Table structure for order_logistic
-- ----------------------------
DROP TABLE IF EXISTS `order_logistic`;
CREATE TABLE `order_logistic` (
  `logisticId` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流id',
  `logisticName` varchar(50) NOT NULL COMMENT '物流名称',
  PRIMARY KEY (`logisticId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_logistic
-- ----------------------------
INSERT INTO `order_logistic` VALUES ('1', '顺风');
INSERT INTO `order_logistic` VALUES ('2', '申通');
INSERT INTO `order_logistic` VALUES ('3', '圆通');
INSERT INTO `order_logistic` VALUES ('4', '韵达');
INSERT INTO `order_logistic` VALUES ('5', '中通');
INSERT INTO `order_logistic` VALUES ('6', '邮政');
INSERT INTO `order_logistic` VALUES ('7', '天天快递');
INSERT INTO `order_logistic` VALUES ('8', '汇通');

-- ----------------------------
-- Table structure for order_order
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '单订id',
  `buyerId` int(11) NOT NULL COMMENT '买家id',
  `logisticId` int(11) NOT NULL COMMENT '物流id',
  `shopId` int(11) NOT NULL COMMENT '店铺id',
  `userId` int(11) NOT NULL COMMENT '客户id',
  `orderCode` varchar(50) NOT NULL COMMENT '订单号',
  `orderRemind` int(11) DEFAULT NULL COMMENT '提醒',
  `orderBuyerRemark` varchar(200) DEFAULT NULL COMMENT '买家备注',
  `orderSellerRemark` varchar(200) DEFAULT NULL COMMENT '卖家备注',
  `orderPayWay` int(11) NOT NULL COMMENT '付款方式0.实付款，1.货到付款',
  `orderPayTpye` int(11) DEFAULT NULL COMMENT '付款类型0.网银，1.支付宝，2.微信3.现金',
  `orderPayMent` double DEFAULT NULL COMMENT '实付款',
  `orderFreight` double NOT NULL COMMENT '运费',
  `orderTime` datetime NOT NULL COMMENT '下单时间',
  `orderPayTime` datetime DEFAULT NULL COMMENT '付款时间',
  `orderExaTime` datetime DEFAULT NULL COMMENT '审单时间',
  `orderSendTime` datetime DEFAULT NULL COMMENT '发货时间',
  `orderWaybill` varchar(13) DEFAULT NULL COMMENT '运单号',
  `orderExpressCode` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `orderSendCode` varchar(20) DEFAULT NULL COMMENT '发货单号',
  `orderState` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态、待审单1、已审单2、已发货3',
  `orderTotal` double DEFAULT NULL COMMENT '订单总合计',
  `orderWeight` double NOT NULL COMMENT '订单总重量',
  `orderFee` double DEFAULT NULL COMMENT '订单优惠',
  `orderGoodNum` int(11) NOT NULL COMMENT '商品总数',
  `orderFavorable` int(10) DEFAULT NULL COMMENT '商品总优惠',
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderCode` (`orderCode`),
  KEY `fk_buyerId` (`buyerId`),
  KEY `fk_logisticId` (`logisticId`),
  KEY `fk_shopId` (`shopId`),
  KEY `fk_userId` (`userId`),
  KEY `orderId` (`orderId`,`orderCode`),
  CONSTRAINT `fk_buyerId` FOREIGN KEY (`buyerId`) REFERENCES `order_buyer` (`buyerId`),
  CONSTRAINT `fk_logisticId` FOREIGN KEY (`logisticId`) REFERENCES `order_logistic` (`logisticId`),
  CONSTRAINT `fk_shopId` FOREIGN KEY (`shopId`) REFERENCES `caigou_shop` (`shopId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_order
-- ----------------------------
INSERT INTO `order_order` VALUES ('183', '1007', '4', '1', '10001', 'OD201612061407001', null, '333这是备注', '006666', '0', '1', null, '0', '2016-12-06 14:07:37', '2016-12-06 14:07:37', null, null, null, null, null, '2', '606', '0', '0', '1', '0');
INSERT INTO `order_order` VALUES ('184', '1007', '4', '2', '10001', 'OD201612061634001', null, '333这是备注', '12', '1', '1', null, '12', '2016-12-06 16:34:04', '2016-12-06 16:34:04', null, null, null, null, null, '2', '68', '21', '12', '2', '10');
INSERT INTO `order_order` VALUES ('185', '1007', '3', '2', '10001', 'OD201612061638001', null, '333这是备注', '12', '1', '2', null, '12', '2016-12-06 16:38:00', '2016-12-06 16:38:00', null, null, null, null, null, '2', '76', '21', '12', '2', '2');
INSERT INTO `order_order` VALUES ('186', '1007', '3', '2', '10001', 'OD201612061638002', null, '333这是备注', '12', '1', '3', null, '12', '2016-12-06 16:38:38', '2016-12-06 16:38:38', null, null, null, null, null, '2', '76', '21', '12', '2', '2');
INSERT INTO `order_order` VALUES ('187', '1016', '3', '2', '10001', 'OD201612061752001', null, '333这是备注', '45', '0', '2', null, '45', '2016-12-06 17:52:18', '2016-12-06 17:52:18', null, null, null, null, null, '2', '1884', '1347', '45', '2', '4');
INSERT INTO `order_order` VALUES ('188', '1017', '5', '3', '10001', 'OD201612061755001', null, '333这是备注', '34', '1', '2', null, '34', '2016-12-06 17:55:37', '2016-12-06 17:55:37', null, null, null, null, null, '2', '6006', '200', '34', '10', '20');
INSERT INTO `order_order` VALUES ('189', '1018', '3', '4', '10001', 'OD201612061756001', null, '哇哈哈', '12', '1', '3', null, '12', '2016-12-06 17:56:06', '2016-12-06 17:56:06', null, null, null, null, null, '3', '8427', '280', '12', '14', '45');
INSERT INTO `order_order` VALUES ('190', '1023', '7', '4', '10001', 'OD201612061807001', null, '我的世界美丽！', '12', '0', '2', null, '12', '2016-12-06 18:07:26', '2016-12-06 18:07:26', null, null, null, null, null, '2', '194', '20', '12', '1', '400');
INSERT INTO `order_order` VALUES ('192', '1025', '1', '2', '10001', 'OD201612071418001', null, '哇哈哈', '333这是备注', '1', '1', '4600', '333', '2016-12-07 14:17:54', '2016-12-07 14:17:54', null, null, null, null, null, '3', '4933', '2000', '333', '100', '67');
INSERT INTO `order_order` VALUES ('194', '1026', '1', '5', '10001', 'OD201612072006001', null, '哇哈哈', 'wc', '1', '1', '606', '0', '2016-12-07 20:06:53', '2016-12-07 20:06:53', null, null, null, null, null, '2', '606', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('195', '1026', '1', '5', '10001', 'OD201612072010001', null, '哇哈哈', 'wc', '0', '1', '50', '0', '2016-12-07 20:09:58', '2016-12-07 20:09:58', null, null, null, null, null, '3', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('196', '1026', '1', '5', '10001', 'OD201612072011001', null, '新增的', 'wcc', '1', '3', '50', '0', '2016-12-07 20:11:49', '2016-12-07 20:11:49', null, null, null, null, null, '2', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('197', '1026', '1', '5', '10001', 'OD201612072014001', null, '新增的', '哇哈哈', '1', '1', '50', '0', '2016-12-07 20:13:58', '2016-12-07 20:13:58', null, null, null, null, null, '2', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('198', '1026', '1', '2', '10001', 'OD201612072049001', null, '新增的', '哇啊啊啊', '1', '1', '50', '0', '2016-12-07 20:49:08', '2016-12-07 20:49:08', null, null, null, null, null, '2', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('199', '1007', '4', '4', '10001', 'OD201612072140001', null, '你好美丽', '新增的', '1', '3', '44516', '12', '2016-12-07 21:39:58', '2016-12-07 21:39:58', null, null, null, null, null, '2', '44528', '2480', '12', '8', '0');
INSERT INTO `order_order` VALUES ('201', '1026', '1', '5', '10001', 'OD201612072208001', null, '你好美丽', '哈哈啊哈哈哈', '1', '1', '1327', '0', '2016-12-07 22:08:52', '2016-12-07 22:08:52', null, null, null, null, null, '2', '1327', '1327', '0', '1', '0');
INSERT INTO `order_order` VALUES ('202', '1001', '1', '4', '10001', 'OD201612072214001', null, '你好美丽', '我的世界美丽！', '0', '3', '41', '9', '2016-12-07 22:14:04', '2016-12-07 22:14:04', null, null, null, null, null, '2', '50', '20', '9', '1', '0');
INSERT INTO `order_order` VALUES ('206', '1028', '1', '5', '10001', 'OD201612072232001', null, '喜欢和你在一起', '你好美丽', '0', '3', '50', '0', '2016-12-07 22:32:41', '2016-12-07 22:32:41', null, null, null, null, null, '2', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('207', '1027', '3', '5', '10001', 'OD201612072235001', null, '', '', '0', '1', '1327', '0', '2016-12-07 22:35:42', '2016-12-07 22:35:42', null, null, null, null, null, '2', '1327', '1327', '0', '1', '0');
INSERT INTO `order_order` VALUES ('208', '1027', '2', '4', '10001', 'OD201612072237001', null, '不喜欢你', '喜欢和你在一起2', '0', '3', '1327', '0', '2016-12-07 22:37:47', '2016-12-07 22:37:47', null, null, null, null, null, '2', '1327', '1327', '0', '1', '0');
INSERT INTO `order_order` VALUES ('211', '1026', '1', '5', '10001', 'OD201612081117001', null, '过儿，你的雕呢？', '我是你的好人', '1', '1', '400', '0', '2016-12-08 11:16:55', '2016-12-08 11:16:55', null, null, null, null, null, '2', '400', '40', '0', '1', '0');
INSERT INTO `order_order` VALUES ('224', '1028', '2', '5', '10001', 'OD201612081550001', null, '过儿，你的雕呢？雕兄何在？', '从你的世界路过', '1', null, '1327', '0', '2016-12-08 15:50:19', null, null, null, null, null, null, '2', '1327', '1327', '0', '1', '0');
INSERT INTO `order_order` VALUES ('225', '1032', '1', '1', '10001', 'OD201612081905001', null, '过儿，你的雕呢？', '12', '0', null, '44517', '12', '2016-12-08 19:05:43', null, null, null, null, null, null, '2', '44529', '2481', '12', '9', '0');
INSERT INTO `order_order` VALUES ('226', '1033', '2', '2', '10001', 'OD201612081906001', null, '过儿，你的雕呢？', '123', '0', null, '44405', '123', '2016-12-08 19:06:37', null, null, null, null, null, null, '2', '44528', '2480', '123', '8', '0');
INSERT INTO `order_order` VALUES ('227', '1034', '3', '4', '10001', 'OD201612081908001', null, '过儿，你的雕呢？', '23', '0', null, '42723', '23', '2016-12-08 19:08:13', null, null, null, null, null, null, '2', '42746', '1093', '23', '4', '0');
INSERT INTO `order_order` VALUES ('228', '1035', '3', '2', '10001', 'OD201612081909001', null, '我是丐帮帮主', '过儿，你的雕呢？', '0', null, '-42433', '435345', '2016-12-08 19:09:41', null, null, null, null, null, null, '2', '392912', '1021', '43523', '5', '0');
INSERT INTO `order_order` VALUES ('229', '1036', '5', '3', '10001', 'OD201612081911001', null, '我是丐帮帮主', '没有备注', '0', null, '12546', '34534', '2016-12-08 19:11:10', null, null, null, null, null, null, '2', '47080', '12252', '534', '60', '0');
INSERT INTO `order_order` VALUES ('230', '1037', '4', '5', '10001', 'OD201612081915001', null, '我是丐帮帮主', '我就是卖国，你能拿我怎么地', '0', null, '1034', '346534', '2016-12-08 19:15:04', null, null, null, null, null, null, '2', '347568', '1021', '56', '5', '0');
INSERT INTO `order_order` VALUES ('231', '1038', '3', '2', '10001', 'OD201612081916001', null, '轻功水上漂', '我是丐帮帮主', '0', null, '655', '235325323', '2016-12-08 19:16:17', null, null, null, null, null, null, '2', '235325978', '1021', '435', '5', '0');
INSERT INTO `order_order` VALUES ('232', '1039', '4', '4', '10001', 'OD201612081917001', null, '轻功水上漂', '其实我拿的是幸运大转盘', '1', null, '42743', '324', '2016-12-08 19:17:29', null, null, null, null, null, null, '2', '43067', '1093', '3', '4', '0');
INSERT INTO `order_order` VALUES ('233', '1040', '4', '3', '10001', 'OD201612081928001', null, '轻功水上漂', '轻功水上漂', '1', null, '41906', '123', '2016-12-08 19:28:40', null, null, null, null, null, null, '2', '42029', '1073', '234', '2', '0');
INSERT INTO `order_order` VALUES ('234', '1041', '4', '2', '10001', 'OD201612081931001', null, '我于杀戮之中绽放，亦如黎明中的花朵', '面对疾风吧', '0', null, '39817', '4234234', '2016-12-08 19:31:45', null, null, null, null, null, null, '2', '4274051', '1073', '2323', '2', '0');
INSERT INTO `order_order` VALUES ('235', '1042', '2', '3', '10001', 'OD201612081933001', null, '我于杀戮之中绽放，亦如黎明中的花朵', '我于杀戮之中绽放，亦如黎明中的花朵', '0', null, '42117', '2312', '2016-12-08 19:33:35', null, null, null, null, null, null, '2', '44429', '1073', '23', '2', '0');
INSERT INTO `order_order` VALUES ('236', '1043', '3', '2', '10001', 'OD201612081935001', null, '我于杀戮之中绽放，亦如黎明中的花朵', '想去哪儿，就去哪儿', '0', null, '-4436', '23423', '2016-12-08 19:34:54', null, null, null, null, null, null, '2', '18987', '999', '5435', '2', '0');
INSERT INTO `order_order` VALUES ('237', '1044', '6', '3', '10001', 'OD201612081936001', null, '我有两把枪，一把叫***，另一把叫·***', '想杀我吗，尽管来试试', '0', null, '1078', '123', '2016-12-08 19:36:19', null, null, null, null, null, null, '2', '1201', '1021', '12', '5', '0');
INSERT INTO `order_order` VALUES ('238', '1045', '3', '3', '10001', 'OD201612081937001', null, '想杀我吗，尽管来试试', '黑夜就是我的面纱，哈哈哈', '0', null, '877', '123412', '2016-12-08 19:37:17', null, null, null, null, null, null, '2', '124289', '1021', '213', '5', '0');
INSERT INTO `order_order` VALUES ('239', '1046', '3', '2', '10001', 'OD201612081938001', null, '想杀我吗，尽管来试试', '五秒真男人 ', '0', null, '1078', '123', '2016-12-08 19:38:24', null, null, null, null, null, null, '1', '1201', '1021', '12', '5', '0');
INSERT INTO `order_order` VALUES ('240', '1047', '4', '3', '10001', 'OD201612081939001', null, '想杀我吗，尽管来试试', '纳尔，%&%……￥', '0', null, '967', '32423', '2016-12-08 19:39:27', null, null, null, null, null, null, '1', '33390', '1021', '123', '5', '0');
INSERT INTO `order_order` VALUES ('241', '1048', '4', '2', '10001', 'OD201612081941001', null, '我有两把枪，一把叫***，另一把叫·***', '我不需要队友，但我的队友需要我', '0', null, '1077', '2412', '2016-12-08 19:41:03', null, null, null, null, null, null, '1', '3489', '1021', '13', '5', '0');
INSERT INTO `order_order` VALUES ('242', '1049', '3', '3', '10001', 'OD201612081941002', null, '我不需要队友，但我的队友需要我', '欢迎来到德莱联盟', '0', null, '1077', '3423', '2016-12-08 19:41:49', null, null, null, null, null, null, '1', '4500', '1021', '13', '5', '0');
INSERT INTO `order_order` VALUES ('243', '1050', '5', '4', '10001', 'OD201612081943001', null, '我不需要队友，但我的队友需要我', '你会输的！', '0', null, '41735', '2312', '2016-12-08 19:43:44', null, null, null, null, null, null, '1', '44047', '94', '12', '3', '0');
INSERT INTO `order_order` VALUES ('244', '1051', '4', '3', '10001', 'OD201612081944001', null, '我不需要队友，但我的队友需要我', '是时候表演真正的技术了', '0', null, '1078', '423', '2016-12-08 19:44:21', null, null, null, null, null, null, '1', '1501', '1021', '12', '5', '0');
INSERT INTO `order_order` VALUES ('245', '1052', '4', '2', '10001', 'OD201612081945001', null, '我有两把枪，一把叫***，另一把叫·***', '断剑重铸之日，骑士归来之时', '0', null, '967', '21412', '2016-12-08 19:45:07', null, null, null, null, null, null, '1', '22379', '1021', '123', '5', '0');
INSERT INTO `order_order` VALUES ('246', '1053', '3', '4', '10001', 'OD201612081948001', null, '断剑重铸之日，骑士归来之时', '我有两把枪，一把叫***，另一把叫·***', '0', null, '1078', '234', '2016-12-08 19:48:11', null, null, null, null, null, null, '1', '1312', '1021', '12', '5', '0');
INSERT INTO `order_order` VALUES ('247', '1028', '1', '1', '10001', 'OD201612082105001', null, '断剑重铸之日，骑士归来之时', '爱我你就抱抱我', '1', null, '50', '0', '2016-12-08 21:04:55', null, null, null, null, null, null, '1', '50', '20', '0', '1', '0');
INSERT INTO `order_order` VALUES ('248', '1055', '2', '1', '10001', 'OD201612091013001', null, '断剑重铸之日，骑士归来之时', '人在塔在', '1', null, '295672', '213', '2016-12-09 10:13:31', null, null, null, null, null, null, '1', '295885', '4698', '122321', '38', '1000');
INSERT INTO `order_order` VALUES ('250', '1035', '3', '3', '10001', 'OD201612091032001', null, '断剑重铸之日，骑士归来之时', '2421', '1', null, '-213', '123', '2016-12-09 10:32:06', null, null, null, null, null, null, '1', '-90', '0', '213', '1', '0');
INSERT INTO `order_order` VALUES ('251', '1035', '1', '2', '10001', 'OD201612091129001', null, null, '爱的礼物', '1', null, '999', '0', '2016-12-09 11:29:31', null, null, null, null, null, null, '1', '999', '999', '0', '1', '0');
INSERT INTO `order_order` VALUES ('252', '1035', '2', '5', '10001', 'OD201612091131001', null, null, '爱的礼物', '1', null, '999', '0', '2016-12-09 11:31:00', null, null, null, null, null, null, '1', '999', '999', '0', '1', '0');
INSERT INTO `order_order` VALUES ('254', '1041', '1', '2', '10001', 'OD201612091546001', null, '这是买家备注', '这是卖家备注', '1', null, '1', '0', '2016-12-09 15:46:21', null, null, null, null, null, null, '1', '1', '1', '0', '1', '0');
INSERT INTO `order_order` VALUES ('255', '1028', '1', '2', '10001', 'OD201612121032001', null, null, '花花公子', '1', null, '1', '0', '2016-12-12 10:31:53', null, null, null, null, null, null, '1', '1', '1', '0', '1', '0');
INSERT INTO `order_order` VALUES ('257', '1008', '1', '5', '10001', 'OD201612121044001', null, null, '愿你天天快乐', '1', null, '999', '0', '2016-12-12 10:44:35', null, null, null, null, null, null, '1', '999', '999', '0', '1', '0');
INSERT INTO `order_order` VALUES ('262', '1028', '1', '1', '10001', 'OD201612121141001', null, null, '22', '0', null, '42040', '100', '2016-12-12 11:40:58', null, null, null, null, null, null, '1', '42140', '1073', '100', '2', '0');
INSERT INTO `order_order` VALUES ('263', '1028', '1', '1', '10001', 'OD201612121141002', null, null, 'xxx', '0', null, '42040', '100', '2016-12-12 11:41:44', null, null, null, null, null, null, '1', '42140', '1073', '100', '2', '0');
INSERT INTO `order_order` VALUES ('264', '1028', '1', '2', '10001', 'OD201612121142001', null, null, 'gh', '0', null, '42040', '100', '2016-12-12 11:42:39', null, null, null, null, null, null, '1', '42140', '1073', '100', '2', '0');
INSERT INTO `order_order` VALUES ('265', '1028', '2', '1', '10001', 'OD201612121144001', null, null, '12', '1', null, '987', '12', '2016-12-12 11:44:53', null, null, null, null, null, null, '1', '999', '999', '12', '1', '0');
INSERT INTO `order_order` VALUES ('266', '1028', '4', '3', '10001', 'OD201612121145001', null, null, '12', '0', null, '41129', '12', '2016-12-12 11:45:49', null, null, null, null, null, null, '1', '41141', '74', '12', '1', '0');
INSERT INTO `order_order` VALUES ('267', '1028', '4', '3', '10001', 'OD201612121147001', null, null, '13', '0', null, '41128', '13', '2016-12-12 11:46:58', null, null, null, null, null, null, '1', '41141', '74', '13', '1', '0');
INSERT INTO `order_order` VALUES ('272', '1037', '4', '3', '10001', 'OD201612121514001', null, null, '123', '0', null, '593', '123', '2016-12-12 15:14:01', null, null, null, null, null, null, '1', '716', '20', '13', '1', '0');
INSERT INTO `order_order` VALUES ('273', '1028', '2', '1', '10001', 'OD201612151051001', null, null, '00', '0', null, '42138', '0', '2016-12-15 10:51:32', null, null, null, null, null, null, '1', '42138', '1073', '0', '2', '2');
INSERT INTO `order_order` VALUES ('274', '1057', '1', '1', '10001', 'OD201612151054001', null, null, '123', '0', null, '999', '0', '2016-12-15 10:54:45', null, null, null, null, null, null, '1', '999', '999', '0', '1', '0');
INSERT INTO `order_order` VALUES ('275', '1037', '2', '2', '10001', 'OD201612151254001', null, null, '00000000', '1', null, '42140', '0', '2016-12-15 12:54:07', null, null, null, null, null, null, '1', '42140', '1073', '0', '2', '0');

-- ----------------------------
-- Table structure for sw
-- ----------------------------
DROP TABLE IF EXISTS `sw`;
CREATE TABLE `sw` (
  `purchaseId` int(255) NOT NULL AUTO_INCREMENT,
  `purchaseCode` varchar(255) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `wareHouseId` int(11) DEFAULT NULL,
  `purchaseSum` int(255) DEFAULT NULL,
  `purchaseNumber` int(11) DEFAULT NULL,
  `creatTime` timestamp NULL DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `storageQuantity` int(255) DEFAULT NULL,
  `storageState` varchar(255) DEFAULT NULL,
  `paymentState` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `state` varchar(255) DEFAULT '1',
  PRIMARY KEY (`purchaseId`),
  KEY `supplierId` (`supplierId`),
  KEY `userId` (`userId`),
  KEY `goodId` (`goodId`),
  KEY `ljgljhljk` (`wareHouseId`),
  CONSTRAINT `goodId` FOREIGN KEY (`goodId`) REFERENCES `caigou_goods` (`goodId`),
  CONSTRAINT `ljgljhljk` FOREIGN KEY (`wareHouseId`) REFERENCES `caigou_warehouse` (`wareHouseId`),
  CONSTRAINT `supplierId` FOREIGN KEY (`supplierId`) REFERENCES `caigou_supplier` (`supplierId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `common_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sw
-- ----------------------------
INSERT INTO `sw` VALUES ('1', 'CG201611280001', '100001', '1', '1', '200', '10', '2016-11-28 20:19:27', null, '', '10001', '10', '已完成', '未付款', '2');
INSERT INTO `sw` VALUES ('2', 'CG201611280002', '100002', '1', '1', '10', '1', '2016-12-02 09:27:56', null, '', '10001', '1', '已完成', '未付款', '2');
INSERT INTO `sw` VALUES ('3', 'CG201611280003', '100003', '10', '4', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('4', 'CG201611280004', '100002', '8', '2', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('6', 'CG201611280006', '100001', '9', '3', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('8', 'CG201611280008', '100002', '11', '4', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('9', 'CG201611280009', '3', '9', '2', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('10', 'CG201611280010', '100002', '9', '3', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('11', 'CG201611280011', '3', '9', '4', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('12', 'CG201611280012', '100003', '9', '3', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('13', 'CG201611280013', '3', '9', '3', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('14', 'CG201611280014', '100002', '9', '3', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('15', 'CG201611280015', '100002', '9', '2', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('16', 'CG201611280016', '3', '9', '1', null, null, null, null, null, null, null, null, '', '1');
INSERT INTO `sw` VALUES ('17', 'CG201611280017', '100002', '9', '1', null, null, null, null, null, null, null, null, '', '1');

-- ----------------------------
-- View structure for caigoudan
-- ----------------------------
DROP VIEW IF EXISTS `caigoudan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`sa`@`%`  VIEW `caigoudan` AS SELECT
caigou_purchase.purchaseId,
caigou_purchase.purchaseCode,
caigou_purchase.supplierId,
caigou_purchase.wareHouseId,
caigou_purchase.purchaseSum,
caigou_purchase.purchaseNumber,
caigou_purchase.creatTime,
caigou_purchase.remark,
caigou_purchase.operation,
caigou_purchase.userId,
caigou_purchase.storageQuantity,
caigou_purchase.storageState,
caigou_purchase.paymentState,
caigou_purchase.state,
caigou_warehouse.wareHouseName,
common_user.userType,
caigou_supplier.supplierCName
FROM
caigou_purchase
INNER JOIN caigou_warehouse ON caigou_purchase.wareHouseId = caigou_warehouse.wareHouseId
INNER JOIN common_user ON caigou_purchase.userId = common_user.userId
INNER JOIN caigou_supplier ON caigou_purchase.supplierId = caigou_supplier.supplierId ;

-- ----------------------------
-- View structure for caigou_return_query
-- ----------------------------
DROP VIEW IF EXISTS `caigou_return_query`;
CREATE ALGORITHM=UNDEFINED DEFINER=`sa`@`%` SQL SECURITY DEFINER  VIEW `caigou_return_query` AS select `a`.`returnId` AS `returnId`,`a`.`returnCode` AS `returnCode`,`a`.`purchaseId` AS `purchaseId`,`b`.`purchaseCode` AS `purchaseCode`,`f`.`supplierCName` AS `supplierCName`,`a`.`warehouseId` AS `returnWarehouseId`,`c`.`wareHouseName` AS `returnWarehouseName`,`b`.`wareHouseId` AS `purchaseWarehouseId`,`g`.`wareHouseName` AS `purchaseWarehouseName`,`a`.`returnNumber` AS `returnNumber`,`a`.`returnOutNum` AS `returnOutNum`,`a`.`returnMoney` AS `returnMoney`,`b`.`purchaseSum` AS `purchaseSum`,`a`.`returnTime` AS `returnTime`,`d`.`userId` AS `returnMaker`,`d`.`userName` AS `returnMakerName`,`e`.`userId` AS `returnChecker`,`e`.`userName` AS `returnCheckerName`,`a`.`returnRemark` AS `returnRemark`,`a`.`returnState` AS `returnState`,`a`.`userId` AS `userId`,`a`.`deleteState` AS `deleteState` from ((((((`caigou_return` `a` join `caigou_purchase` `b`) join `caigou_warehouse` `c`) join `common_user` `d`) join `common_user` `e`) join `caigou_supplier` `f`) join `caigou_warehouse` `g`) where ((`a`.`purchaseId` = `b`.`purchaseId`) and (`a`.`warehouseId` = `c`.`wareHouseId`) and (`a`.`returnMaker` = `d`.`userId`) and (`a`.`returnChecker` = `e`.`userId`) and (`b`.`supplierId` = `f`.`supplierId`) and (`b`.`wareHouseId` = `g`.`wareHouseId`)) ;

-- ----------------------------
-- Procedure structure for getCode
-- ----------------------------
DROP PROCEDURE IF EXISTS `getCode`;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `getCode`(IN `userId` int,IN `codeName` varchar(50),IN `num` int,IN `codePre` char(2))
BEGIN
		#用传入的参数中获取用户id
		SET @userId=userId;
		#将sql语句保存在变量中，通过预编译查询（这样可以将变量插入到sql语句中执行）
		SET @sql1=CONCAT('SELECT ',codeName,' INTO @oldCodeValue FROM common_code WHERE userId=?');
		PREPARE stmt1 FROM @sql1;
		#执行预编译语句stmt1，查询出common_code表中满足条件的code并赋值给变量@oldCodeValue
		EXECUTE stmt1 USING @userId;
		


		

		#执行函数ProcessCode将@oldCodeValue处理过后得到新的值给变量codeValue
		SET	@codeValue=ProcessCode(@oldCodeValue,num,codePre);	
		#SET @codeValue=codeValue;
		
		#将新的codeValue值存入common_code 表中
		SET @sql2=CONCAT('UPDATE common_code SET ',codeName,'=? WHERE userId=?');
		PREPARE stmt2 FROM @sql2;
		EXECUTE stmt2 USING @codeValue,@userId;
		SELECT @codeValue;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for initCode
-- ----------------------------
DROP PROCEDURE IF EXISTS `initCode`;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `initCode`(IN `bossId` int)
BEGIN
  	-- DECLARE odlId INT;
    DECLARE codePurchasse VARCHAR(50);
		DECLARE codeReturn VARCHAR(50);
		DECLARE codeOrder VARCHAR(50);
		DECLARE codeChukudan VARCHAR(50);
		DECLARE codeDiaobodan VARCHAR(50);
		
		SELECT * INTO codePurchasse,codeReturn,codeOrder,codeChukudan,codeDiaobodan FROM common_defaultcode;

		INSERT INTO common_code VALUES(bossId,codePurchasse,codeReturn,codeOrder,codeChukudan,codeDiaobodan);



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for initExtLimt
-- ----------------------------
DROP PROCEDURE IF EXISTS `initExtLimt`;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `initExtLimt`(IN `bossId_` int)
BEGIN
		/*将默认额外权限表的数据通过游标取到指定的用户额外权限中*/

		-- 遍历数据结束标志
		DECLARE flag INT  DEFAULT FALSE;
		
		-- 定义接收游标数据的变量 
    DECLARE possId_ INT(11);
		DECLARE limitId_ INT(11);
		DECLARE isSelected_ INT(2);

		-- 定义游标
    DECLARE defExtLimit_cursor CURSOR 
    FOR 
    SELECT * FROM common_defaultextralimit;
		-- 将结束标志绑定到游标
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=TRUE;

		-- 开启游标
    OPEN defExtLimit_cursor;
    -- 开始循环
		read_loop: LOOP
    -- 提取游标里的数据，
		FETCH defExtLimit_cursor INTO possId_,limitId_,isSelected_;
    -- 声明结束的时候
    IF flag THEN
      LEAVE read_loop;
    END IF;
    -- 插入数据(如果主键存在则更新数据)
		INSERT INTO common_extralimit VALUES(bossId_,possId_,limitId_,isSelected_) ON DUPLICATE KEY UPDATE extIsSelected=isSelected_;

		END LOOP;
		-- 关闭游标
		CLOSE defExtLimit_cursor;


END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ProcessCode
-- ----------------------------
DROP FUNCTION IF EXISTS `ProcessCode`;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` FUNCTION `ProcessCode`(`oldCode` varchar(50),`num` int,`codePre` char(2)) RETURNS varchar(20) CHARSET utf8
BEGIN
	#Routine body goes here...
	DECLARE currentDate varCHAR (15) ;-- 当前日期,年月日时分
  DECLARE maxNo INT DEFAULT 0 ; -- 传递进来的code的最后几位流水号，如：SH201301101009005，num=3，则maxNo=5 
	DECLARE  oldCodeDate varCHAR (15);-- 传递进来的code的时间，如：SH201301101009005的oldCodeDate=201301101009 
	DECLARE newCode varCHAR (50);-- 处理过后返回的cold
  DECLARE	newCodePre char(2);
	


  SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i') INTO currentDate ;-- 订单形式：前缀+年月日时分+流水号,如：SH201301101009005     
	SET oldCodeDate=SUBSTRING(oldCode, 3,12);


	IF codePre='!' THEN
	SET newCodePre=SUBSTRING(oldCode, 1,2);   
	ELSE 
	SET	newCodePre=codePre;
	END IF;
	
  
	

  IF oldCodeDate=currentDate  THEN     
    SET maxNo = CONVERT(SUBSTRING(oldCode, -num), DECIMAL) ;-- SUBSTRING(oldOrderNo, 0-num)：oldCodeDate如果与当前时间一致，截取oldCode最后几位流水号    
  END IF ;    
  SELECT     
    CONCAT(newCodePre, currentDate,  LPAD((maxNo + 1), num, '0')) INTO newCode ; -- LPAD((maxNo + 1), num, '0')：如果不足流水号位数，将用0填充左边    
	RETURN newCode;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `aa`;
DELIMITER ;;
CREATE TRIGGER `aa` AFTER INSERT ON `caigou_goodwarehouse` FOR EACH ROW INSERT INTO kuguan_goodlog SET goodId= NEW.goodId, wareHouseId=NEW.wareHouseId,goodNum=new.goodCount,dateTime=now()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bb`;
DELIMITER ;;
CREATE TRIGGER `bb` AFTER UPDATE ON `caigou_goodwarehouse` FOR EACH ROW update kuguan_goodlog SET goodId= NEW.goodId, wareHouseId=NEW.wareHouseId,goodNum=goodNum+(new.goodCount-old.goodCount),dateTime=now() where goodId= old.goodId  and wareHouseId=old.wareHouseId
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `cc`;
DELIMITER ;;
CREATE TRIGGER `cc` BEFORE DELETE ON `caigou_goodwarehouse` FOR EACH ROW DELETE FROM kuguan_goodlog  where goodId= old.goodId  and wareHouseId=old.wareHouseId
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `a`;
DELIMITER ;;
CREATE TRIGGER `a` AFTER INSERT ON `kuguan_goodlog` FOR EACH ROW INSERT INTO caiwu_kucuncb SET goodId= NEW.goodId, wareHouseId=NEW.wareHouseId
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `b`;
DELIMITER ;;
CREATE TRIGGER `b` BEFORE DELETE ON `kuguan_goodlog` FOR EACH ROW DELETE FROM caiwu_kucuncb  WHERE goodId=Old.goodId AND wareHouseId=OLD.wareHouseId
;;
DELIMITER ;
