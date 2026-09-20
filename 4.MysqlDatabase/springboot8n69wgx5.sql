-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springboot8n69wgx5
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `springboot8n69wgx5`
--

/*!40000 DROP DATABASE IF EXISTS `springboot8n69wgx5`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot8n69wgx5` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springboot8n69wgx5`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL),(7,'APIKey','ihML0NfEM0jokUAuBD9tbYtW',NULL),(8,'SecretKey','WK2bRUFf2uNe3oEoQXULpi8Y37aCvFdD',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussgonggaoxinxi`
--

DROP TABLE IF EXISTS `discussgonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussgonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussgonggaoxinxi`
--

LOCK TABLES `discussgonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `discussgonggaoxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussgonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  `istop` int(11) DEFAULT '0' COMMENT '是否置顶',
  `toptime` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='论坛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (61,'2024-04-22 13:50:30','帖子标题1','帖子内容1',0,1,'用户名1','upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg','开放',0,'2024-04-22 21:50:30'),(62,'2024-04-22 13:50:30','帖子标题2','帖子内容2',0,2,'用户名2','upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg','开放',0,'2024-04-22 21:50:30'),(63,'2024-04-22 13:50:30','帖子标题3','帖子内容3',0,3,'用户名3','upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg','开放',0,'2024-04-22 21:50:30'),(64,'2024-04-22 13:50:30','帖子标题4','帖子内容4',0,4,'用户名4','upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg','开放',0,'2024-04-22 21:50:30'),(65,'2024-04-22 13:50:30','帖子标题5','帖子内容5',0,5,'用户名5','upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg','开放',0,'2024-04-22 21:50:30'),(66,'2024-04-22 13:50:30','帖子标题6','帖子内容6',0,6,'用户名6','upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg','开放',0,'2024-04-22 21:50:30'),(67,'2024-04-22 13:50:30','帖子标题7','帖子内容7',0,7,'用户名7','upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg','开放',0,'2024-04-22 21:50:30'),(68,'2024-04-22 13:50:30','帖子标题8','帖子内容8',0,8,'用户名8','upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg,upload/forum_avatarurl10.jpg','开放',0,'2024-04-22 21:50:30');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaoxinxi`
--

DROP TABLE IF EXISTS `gonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonggaobiaoti` varchar(200) NOT NULL COMMENT '公告标题',
  `leixing` varchar(200) NOT NULL COMMENT '类型',
  `tupian` longtext COMMENT '图片',
  `neirong` longtext COMMENT '内容',
  `faburiqi` datetime DEFAULT NULL COMMENT '发布日期',
  `discussnum` int(11) DEFAULT '0' COMMENT '评论数',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaoxinxi`
--

LOCK TABLES `gonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `gonggaoxinxi` DISABLE KEYS */;
INSERT INTO `gonggaoxinxi` VALUES (41,'2024-04-22 13:50:29','公告标题1','类型1','upload/gonggaoxinxi_tupian1.jpg,upload/gonggaoxinxi_tupian2.jpg,upload/gonggaoxinxi_tupian3.jpg','内容1','2024-04-22 21:50:29',0,1),(42,'2024-04-22 13:50:29','公告标题2','类型2','upload/gonggaoxinxi_tupian2.jpg,upload/gonggaoxinxi_tupian3.jpg,upload/gonggaoxinxi_tupian4.jpg','内容2','2024-04-22 21:50:29',0,2),(43,'2024-04-22 13:50:29','公告标题3','类型3','upload/gonggaoxinxi_tupian3.jpg,upload/gonggaoxinxi_tupian4.jpg,upload/gonggaoxinxi_tupian5.jpg','内容3','2024-04-22 21:50:29',0,3),(44,'2024-04-22 13:50:29','公告标题4','类型4','upload/gonggaoxinxi_tupian4.jpg,upload/gonggaoxinxi_tupian5.jpg,upload/gonggaoxinxi_tupian6.jpg','内容4','2024-04-22 21:50:29',0,4),(45,'2024-04-22 13:50:29','公告标题5','类型5','upload/gonggaoxinxi_tupian5.jpg,upload/gonggaoxinxi_tupian6.jpg,upload/gonggaoxinxi_tupian7.jpg','内容5','2024-04-22 21:50:29',0,5),(46,'2024-04-22 13:50:29','公告标题6','类型6','upload/gonggaoxinxi_tupian6.jpg,upload/gonggaoxinxi_tupian7.jpg,upload/gonggaoxinxi_tupian8.jpg','内容6','2024-04-22 21:50:29',0,6),(47,'2024-04-22 13:50:29','公告标题7','类型7','upload/gonggaoxinxi_tupian7.jpg,upload/gonggaoxinxi_tupian8.jpg,upload/gonggaoxinxi_tupian9.jpg','内容7','2024-04-22 21:50:29',0,7),(48,'2024-04-22 13:50:29','公告标题8','类型8','upload/gonggaoxinxi_tupian8.jpg,upload/gonggaoxinxi_tupian9.jpg,upload/gonggaoxinxi_tupian10.jpg','内容8','2024-04-22 21:50:29',0,8);
/*!40000 ALTER TABLE `gonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `touxiang` longtext COMMENT '头像',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (21,'2024-04-22 13:50:29','教师工号1','123456','教师姓名1','男','职称1','13823888881','upload/jiaoshi_touxiang1.jpg','班级1'),(22,'2024-04-22 13:50:29','教师工号2','123456','教师姓名2','男','职称2','13823888882','upload/jiaoshi_touxiang2.jpg','班级2'),(23,'2024-04-22 13:50:29','教师工号3','123456','教师姓名3','男','职称3','13823888883','upload/jiaoshi_touxiang3.jpg','班级3'),(24,'2024-04-22 13:50:29','教师工号4','123456','教师姓名4','男','职称4','13823888884','upload/jiaoshi_touxiang4.jpg','班级4'),(25,'2024-04-22 13:50:29','教师工号5','123456','教师姓名5','男','职称5','13823888885','upload/jiaoshi_touxiang5.jpg','班级5'),(26,'2024-04-22 13:50:29','教师工号6','123456','教师姓名6','男','职称6','13823888886','upload/jiaoshi_touxiang6.jpg','班级6'),(27,'2024-04-22 13:50:29','教师工号7','123456','教师姓名7','男','职称7','13823888887','upload/jiaoshi_touxiang7.jpg','班级7'),(28,'2024-04-22 13:50:29','教师工号8','123456','教师姓名8','男','职称8','13823888888','upload/jiaoshi_touxiang8.jpg','班级8');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext COMMENT '图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,11,'学号1','xuesheng','学生','nxupq173ovi4pzyakvl3nwg3klxx0n67','2024-04-22 13:55:56','2024-04-22 14:55:56'),(2,1,'admin','users','管理员','59srjewdb9h7yfkmggrphumt404f617u','2024-04-22 13:57:39','2024-04-22 14:57:39');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2024-04-22 13:50:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `touxiang` longtext COMMENT '头像',
  `yundongcishu` int(11) DEFAULT NULL COMMENT '运动次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2024-04-22 13:50:29','学号1','姓名1','123456','男','13823888881','班级1','upload/xuesheng_touxiang1.jpg',1),(12,'2024-04-22 13:50:29','学号2','姓名2','123456','男','13823888882','班级2','upload/xuesheng_touxiang2.jpg',2),(13,'2024-04-22 13:50:29','学号3','姓名3','123456','男','13823888883','班级3','upload/xuesheng_touxiang3.jpg',3),(14,'2024-04-22 13:50:29','学号4','姓名4','123456','男','13823888884','班级4','upload/xuesheng_touxiang4.jpg',4),(15,'2024-04-22 13:50:29','学号5','姓名5','123456','男','13823888885','班级5','upload/xuesheng_touxiang5.jpg',5),(16,'2024-04-22 13:50:29','学号6','姓名6','123456','男','13823888886','班级6','upload/xuesheng_touxiang6.jpg',6),(17,'2024-04-22 13:50:29','学号7','姓名7','123456','男','13823888887','班级7','upload/xuesheng_touxiang7.jpg',7),(18,'2024-04-22 13:50:29','学号8','姓名8','123456','男','13823888888','班级8','upload/xuesheng_touxiang8.jpg',8);
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yundongdaka`
--

DROP TABLE IF EXISTS `yundongdaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yundongdaka` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yundongleixing` varchar(200) NOT NULL COMMENT '运动类型',
  `shizhang` int(11) NOT NULL COMMENT '时长（分钟）',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `dakashijian` datetime DEFAULT NULL COMMENT '打卡时间',
  `touxiang` longtext NOT NULL COMMENT '头像',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `yundongcishu` int(11) DEFAULT NULL COMMENT '运动次数',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='运动打卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yundongdaka`
--

LOCK TABLES `yundongdaka` WRITE;
/*!40000 ALTER TABLE `yundongdaka` DISABLE KEYS */;
INSERT INTO `yundongdaka` VALUES (51,'2024-04-22 13:50:29','运动类型1',1,'备注1','2024-04-22 21:50:29','upload/yundongdaka_touxiang1.jpg,upload/yundongdaka_touxiang2.jpg,upload/yundongdaka_touxiang3.jpg','学号1','姓名1','班级1',1,1),(52,'2024-04-22 13:50:29','运动类型2',2,'备注2','2024-04-22 21:50:29','upload/yundongdaka_touxiang2.jpg,upload/yundongdaka_touxiang3.jpg,upload/yundongdaka_touxiang4.jpg','学号2','姓名2','班级2',2,2),(53,'2024-04-22 13:50:29','运动类型3',3,'备注3','2024-04-22 21:50:29','upload/yundongdaka_touxiang3.jpg,upload/yundongdaka_touxiang4.jpg,upload/yundongdaka_touxiang5.jpg','学号3','姓名3','班级3',3,3),(54,'2024-04-22 13:50:29','运动类型4',4,'备注4','2024-04-22 21:50:29','upload/yundongdaka_touxiang4.jpg,upload/yundongdaka_touxiang5.jpg,upload/yundongdaka_touxiang6.jpg','学号4','姓名4','班级4',4,4),(55,'2024-04-22 13:50:29','运动类型5',5,'备注5','2024-04-22 21:50:29','upload/yundongdaka_touxiang5.jpg,upload/yundongdaka_touxiang6.jpg,upload/yundongdaka_touxiang7.jpg','学号5','姓名5','班级5',5,5),(56,'2024-04-22 13:50:29','运动类型6',6,'备注6','2024-04-22 21:50:29','upload/yundongdaka_touxiang6.jpg,upload/yundongdaka_touxiang7.jpg,upload/yundongdaka_touxiang8.jpg','学号6','姓名6','班级6',6,6),(57,'2024-04-22 13:50:29','运动类型7',7,'备注7','2024-04-22 21:50:29','upload/yundongdaka_touxiang7.jpg,upload/yundongdaka_touxiang8.jpg,upload/yundongdaka_touxiang9.jpg','学号7','姓名7','班级7',7,7),(58,'2024-04-22 13:50:29','运动类型8',8,'备注8','2024-04-22 21:50:29','upload/yundongdaka_touxiang8.jpg,upload/yundongdaka_touxiang9.jpg,upload/yundongdaka_touxiang10.jpg','学号8','姓名8','班级8',8,8);
/*!40000 ALTER TABLE `yundongdaka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yundongleixing`
--

DROP TABLE IF EXISTS `yundongleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yundongleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yundongleixing` varchar(200) NOT NULL COMMENT '运动类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='运动类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yundongleixing`
--

LOCK TABLES `yundongleixing` WRITE;
/*!40000 ALTER TABLE `yundongleixing` DISABLE KEYS */;
INSERT INTO `yundongleixing` VALUES (31,'2024-04-22 13:50:29','运动类型1'),(32,'2024-04-22 13:50:29','运动类型2'),(33,'2024-04-22 13:50:29','运动类型3'),(34,'2024-04-22 13:50:29','运动类型4'),(35,'2024-04-22 13:50:29','运动类型5'),(36,'2024-04-22 13:50:29','运动类型6'),(37,'2024-04-22 13:50:29','运动类型7'),(38,'2024-04-22 13:50:29','运动类型8');
/*!40000 ALTER TABLE `yundongleixing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 19:50:33
