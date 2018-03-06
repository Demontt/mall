-- MySQL dump 10.13  Distrib 5.5.48, for Linux (x86_64)
--
-- Host: localhost    Database: jdbc
-- ------------------------------------------------------
-- Server version	5.5.48-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `detail` text,
  `img` text,
  `type` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `taste` varchar(20) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='商品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'01020105','莱家粒粒威化黑加仑味110g','品质纯正 清新美味','<img src=\"img/goods/detail/lljwlili1.jpg\">','lljwlili.jpg','饼干',16,'欧美',110,120,'水果味','莱家',1,1),(2,'01010487','格力高百醇抹茶慕斯味48g','香脆口感 健康美味','<img src=\"img/goods/detail/geligkblip1.jpg\">','geligkblip.jpg','饼干',5.5,'上海',48,250,'抹茶味','格力高',0,1),(3,'01020162','莱家威化饼干 榛子味 250g','品质纯正 清新美味','<img src=\"img/goods/detail/lljwwzhw1.jpg\">','lljwwzhw.jpg','饼干',29.9,'欧美',250,44,'榛子味','莱家',1,0),(4,'05010282','有友山椒泡凤爪80g','有友山椒泡凤爪以优质鸡爪为原料，采用专利技术、特殊工艺与传统四川泡菜方式结合泡制而成。产品色泽天然，香辣纯正，营养丰富，好吃又开胃。佐餐伴酒、休闲旅游皆为上品。','<img src=\"img/goods/detail/ybybujjc1.jpg\">','ybybujjc.jpg','肉类',3.8,'重庆',80,290,'泡椒味','有友',0,0),(5,'07060123','小老板原味香脆紫菜（大片状）43.2g','不仅是海味零食哦','<img src=\"img/goods/detail/xclkbjyrwz1.jpg\">','xclkbjyrwz.jpg','海苔类',13.5,'泰国',43.2,88,'咸味','小老板',1,1),(6,'09030126','加煌爽口麻辣味笋尖100g','精选上等新鲜竹笋尖为原料，入口麻辣鲜香，脆嫩爽口，回味无穷。其聚色、香、味、美于一体，风味独特，吃上一口爽朗无比。笋尖的鲜美与腌制的爽脆相结合，加上传统秘制辣油，既开胃又好吃。','<img src=\"img/goods/detail/jwhdudkb1.jpg\">','jwhdudkb.jpg','豆菌笋类',4.5,'广东',100,50,'麻辣味','加煌',0,0),(7,'8080652','丽芝士雅嘉奶酪味夹心玉米棒400g','【商品配料】：玉米粉、植物油（棕榈油）、白砂糖、乳清粉、粉状干酪、食用盐、大豆磷脂、姜黄、日落黄、β-胡萝卜素','<img src=\"img/goods/detail/liviuiyajw1.jpg\">','liviuiyajw.jpg','膨化食品',22.9,'印尼',400,22,'奶酪味','丽芝士',1,0),(8,'02079934','德芙香浓黑巧克力43g','德芙香浓黑巧克力，香醇浓郁的经典黑巧克力，如丝般细致优雅，悠长余韵，缠绕舌尖。','<img src=\"img/goods/detail/defuxdns1.jpg\">','defuxdns.jpg','糖果',5.6,'北京',43,300,'甜味','德芙',0,0),(9,'2060014','Hello Kitty果汁软糖芒果味','Q劲十足，果香浓郁','<img src=\"img/goods/detail/hkgovi1.jpg\">','hkgovi.jpg','糖果',18,'广东',80,490,'甜味','Hello Kitty',1,1),(10,'4010486','榴的华金枕头榴莲干100g','精心挑选品质上乘，肉质鲜美的金枕头榴莲','<img src=\"img/goods/detail/lqdehwjnvf1.jpg\">','lqdehwjnvf.jpg','水果干',49,'泰国',100,486,'甜味','榴的华',0,1),(11,'06040062','百年树去壳巴旦木*500g','休闲零食，营养担当','<img src=\"img/goods/detail/blnmuuquke1.jpg\">','blnmuuquke.jpg','坚果',56,'福建',500,162,'原味','百年树',1,0),(12,'04030048','百年树爽脆黄秋葵淡盐味*200g','咸脆可口','<img src=\"img/goods/detail/blnmuuudcv1.jpg\">','blnmuuudcv.jpg','水果干',40,'福建',200,48,'咸味','百年树',0,0),(13,'11834020305037','三只松鼠 坚果大礼包1430g','生产许可证编号：SC11834020305037产品标准号：GB 19300厂名：三只松鼠股份有限公司厂址：安徽省芜湖市弋江区芜湖高新技术产业开发区久盛路8号;安徽省芜湖市弋江区高新开发区南区龙华厂房厂家联系方式：400-800-4900配料表：碧根果、食用盐、白砂糖、味精、食用香精香料、食品添加剂储藏方法：请置于阴凉干燥处保质期：240 天食品添加剂：安赛蜜，甜蜜素，阿斯巴甜（含苯丙氨酸），5\'-呈味核苷酸二钠净含量: 420g包装方式: 包装包装种类: 袋装品牌: Three Squirrels/三只松鼠系列: 碧根果210gx2组合食品口味: 奶油味 红鼻子节定制','<img src=\"img/goods/detail/sjvissuujmgo1.jpg\"><img src=\"img/goods/detail/sjvissuujmgo2.jpg\">','sjvissuujmgo.jpg','坚果',98,'安徽',1430,1969,'咸味','三只松鼠',1,0),(14,'10432128200992','良品铺子靖江猪肉脯','生产许可证编号：SC10432128200992产品标准号：GB/T31406厂名：靖江市津津食品有限公司厂址：江苏省泰州市靖江市江平路216号厂家联系方式：400-1177-517配料表：猪瘦肉，白砂糖，蛋液，鱼露，豌豆淀粉，味精，白胡椒粉，辣椒精油，花椒粉，食品添加剂（甘油，乳酸钠，双乙酸钠，乙基麦芽酚，红曲红，D-异抗坏血酸储藏方法：常温、阴凉、通风、干燥处保存保质期：180 天食品添加剂：甘油，乳酸钠，双乙酸钠，乙基麦芽酚，红曲红，D-异抗坏血酸产品名称：良品铺子 风味猪肉脯200g净含量: 200g包装方式: 包装品牌: 良品铺子系列: 风味猪肉脯200g商品条形码: 6953240735888是否为有机食品: 否肉类产品: 猪肉脯口味: 原味200gx1袋 香辣味200gx1袋 芝麻味200gx1袋 自然片200gx1袋是否含糖: 含糖省份: 中国大陆产地: 中国大陆省份: 江苏省城市: 泰州市','<img src=\"img/goods/detail/ldpnpuzi1.jpg\"><img src=\"img/goods/detail/ldpnpuzi2.jpg\">','ldpnpuzi.jpg','肉脯',17.9,'江苏',200,42529,'香辣味','良品铺子',1,1),(15,'11333019700024','百草味-芒果干120gx3袋','生产许可证编号：SC11333019700024产品标准号：GB/T10782厂名：杭州郝姆斯食品有限公司厂址：浙江省杭州市萧山临江高新技术产业开发区纬七路1999号厂家联系方式：400-8810-118配料表：见包装储藏方法：常温避光保存，开封即食保质期：365 天食品添加剂：见包装净含量: 360g包装方式: 包装品牌: BE＆CHEERY/百草味系列: 芒果干120gx3套装食品口味: 120gx3袋食品工艺: 果脯类是否含糖: 含糖产地: 中国大陆省份: 浙江省','<img src=\"img/goods/detail/blckwzmhgo1.jpg\"><img src=\"img/goods/detail/blckwzmhgo2.jpg\">','blckwzmhgo.jpg','水果干',28.9,'浙江',360,12103,'甜味','百草味',0,1),(16,'341124010829','盼盼手撕面包整箱2斤','生产许可证编号：QS3411 2401 0829 产品标准号：GB/T 20981厂名：安徽盼盼食品有限公司厂址：安徽省滁州市经济技术开发区城东工业园长江西路365号厂家联系方式：0731-89857383 89852497配料表：小麦粉、人造奶油、白砂糖、水、鸡蛋、食品添加剂等等储藏方法：请置于阴凉干燥处保质期：180 天食品添加剂：山梨糖醇液、单硬脂酸甘油酯、硬脂酰乳酸钠等等净含量: 1000g包装方式: 包装口味: 手撕1kg商品条形码: 6970042900115糕点种类: 手撕面包品牌: 盼盼系列: 手撕面包1kg是否含糖: 含糖产地: 中国大陆省份: 安徽省','<img src=\"img/goods/detail/pjpjubsi1.jpg\"><img src=\"img/goods/detail/pjpjubsi2.jpg\">','pjpjubsi.jpg','糕点',29.9,'安徽',1000,46031,'甜味','盼盼',0,0),(17,'10450011207694','有友泡椒泡凤爪迷你散装凤爪','生产许可证编号：SC10450011207694产品标准号：DBS 50/004厂名：有友食品股份有限公司厂址：重庆市渝北区国家农业科技园区国际食品工业城宝环一路13号厂家联系方式：023-67389300配料表：鸡爪、水、泡椒、食用盐、白砂糖储藏方法：阴凉、避光、防潮、勿压保质期：200 天食品添加剂：谷氨酸钠、5\'-呈味核苷酸二钠、葡萄糖酸-δ-内酯、D-异抗坏血酸钠、山梨酸钾净含量: 856g包装方式: 散装品牌: 有友系列: 凤爪428gX2商品条形码: 6944978703041肉类产品: 凤爪食品工艺: 腌制口味: 山椒味 酸菜味 椒香味是否含糖: 含糖产地: 中国大陆省份: 重庆','<img src=\"img/goods/detail/ybybpkjc1.jpg\"><img src=\"img/goods/detail/ybybpkjc2.jpg\">','ybybpkjc.jpg','肉类',43.9,'重庆',856,315,'山椒味','有友',1,1),(18,'121316010175','百草味-薯条90g','生产许可证编号：QS1213 1601 0175 产品标准号：QB2076厂名：海皇食品(天津)有限公司厂址：北辰区经济开发区双辰中路15号厂家联系方式：400-881-0118配料表：见包装保质期：300 天食品添加剂：见包装净含量: 90g包装方式: 包装品牌: BE＆CHEERY/百草味系列: 薯条90g产地: 中国大陆省份: 天津口味: 蜂蜜黄油味 原味 香辣味 番茄味','<img src=\"img/goods/detail/blckwzuutc1.jpg\"><img src=\"img/goods/detail/blckwzuutc2.jpg\">','blckwzuutc.jpg','膨化食品',9.9,'浙江',90,2385,'咸味','百草味',1,0),(19,'440512010220','正宗咪咪虾条20gX40包','生产许可证编号：QS4405 1201 0220 产品标准号：GB/T22699厂名：汕头经济特区新星食品工业有限公司厂址：汕头市潮汕路金园区工业城6C5片区厂家联系方式：0754-88104995配料表：小麦粉、食用植物油、白砂糖、食盐、虾粉、葱头、蒜头、咖喱粉储藏方法：请置于阴凉干燥处保质期：365 天食品添加剂：具体以包装实物为准净含量: 800g包装方式: 包装品牌: 咪咪系列: 虾条20g*40小包/整大袋商品条形码: 6923567880226膨化食品种类: 虾条同城服务: 同城物流送货上门是否含糖: 含糖产地: 中国大陆省份: 广东省口味: 蟹味粒 鲜虾味','<img src=\"img/goods/detail/mimixwtc1.jpg\"><img src=\"img/goods/detail/mimixwtc2.jpg\">','mimixwtc.jpg','膨化食品',19.8,'广东',800,3369,'咸味','咪咪',0,0),(20,'330012010007','旺旺 仙贝/雪饼旺旺大礼包520g*2包','生产许可证编号：QS3300 1201 0007 产品标准号：GB/T20977厂名：杭州旺旺食品有限公司厂址：浙江省杭州市余杭区余杭经济开发区振兴西路1号厂家联系方式：4008850151配料表：大米、白砂糖、棕榈油、淀粉、食用盐等储藏方法：请置于阴凉干燥处，避免阳光直射保质期：270 天食品添加剂：见包装净含量: 1040g包装方式: 包装品牌: 旺旺系列: 雪饼+仙贝膨化食品种类: 雪米饼同城服务: 同城物流送货上门是否含糖: 含糖产地: 中国大陆省份: 安徽省口味: 仙贝/雪饼各1袋 仙贝520g*2袋 雪饼5','<img src=\"img/goods/detail/whwhxmbz1.jpg\"><img src=\"img/goods/detail/whwhxmbz2.jpg\">','whwhxmbz.jpg','膨化食品',36.9,'浙江',1040,40377,'甜味','旺旺',0,0),(21,'420112010099','乐事薯片组合45g*12包','生产许可证编号：QS4201 1201 0099 厂名：百事食品(中国)有限公司武汉分厂厂址：湖北省武汉市东西湖区走马岭汇通大道10号厂家联系方式：8008201718保质期：270 天净含量: 540g包装方式: 包装品牌: Lay’s/乐事系列: 乐事组合45g乘9膨化食品种类: 薯片产地: 中国大陆省份: 上海口味: 清爽黄瓜*12 清爽青柠*12 香浓红烩*1','<img src=\"img/goods/detail/leuiuupm1.jpg\"><img src=\"img/goods/detail/leuiuupm2.jpg\">','leuiuupm.jpg','膨化食品',45.9,'湖北',540,792,'咸味','乐事',1,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_id_uindex` (`id`),
  UNIQUE KEY `user_login_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='用户登陆信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-10 22:42:33
