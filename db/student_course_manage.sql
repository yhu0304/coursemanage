/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.50 : Database - student_course_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_course_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_course_manage`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `aid` int(10) unsigned NOT NULL,
  `apassword` varchar(10) NOT NULL DEFAULT 'admin',
  `aname` varchar(20) NOT NULL,
  `asex` varchar(1) DEFAULT NULL,
  `abirth` date DEFAULT NULL,
  `atel` varchar(15) DEFAULT NULL,
  `aemail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `administrator` */

insert  into `administrator`(`aid`,`apassword`,`aname`,`asex`,`abirth`,`atel`,`aemail`) values (100000,'admin','胡杨','男','1992-09-09','15850766634','505818459@qq.com');

/*Table structure for table `c_s_t` */

DROP TABLE IF EXISTS `c_s_t`;

CREATE TABLE `c_s_t` (
  `cstid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `property` varchar(8) NOT NULL DEFAULT '通修',
  `week` int(1) unsigned NOT NULL,
  `startlesson` int(2) unsigned NOT NULL,
  `endlesson` int(2) unsigned NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cstid`),
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `c_s_t_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `c_s_t_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `c_s_t_ibfk_3` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=100028 DEFAULT CHARSET=utf8;

/*Data for the table `c_s_t` */

insert  into `c_s_t`(`cstid`,`cid`,`sid`,`tid`,`property`,`week`,`startlesson`,`endlesson`,`location`) values (0000100000,10000,20120201,200000,'通修',1,5,7,'Y502'),(0000100001,10001,20120201,200001,'通修',2,3,4,'Y208'),(0000100004,10001,20120202,200001,'通修',2,3,4,'Y208'),(0000100019,20001,20120202,200003,'选修',4,7,8,'Y202'),(0000100020,20000,20120202,200002,'选修',1,9,10,'Y101'),(0000100021,20002,20120202,200003,'选修',5,9,10,'Y504'),(0000100023,20001,20120203,200003,'选修',4,7,8,'Y202'),(0000100024,20003,20120206,200005,'选修',3,9,12,'Y201'),(0000100026,20000,20120201,200002,'选修',1,9,10,'Y101'),(0000100027,20002,20120201,200003,'选修',5,9,10,'Y504');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `cname` varchar(20) NOT NULL DEFAULT '未知',
  `property` varchar(6) NOT NULL DEFAULT '通修',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`property`) values (10000,'ESP学术英语','通修'),(10001,'中国特色社会主义','通修'),(20000,'矩阵论','选修'),(20001,'数值分析','选修'),(20002,'J2EE','选修'),(20003,'云计算','选修'),(20004,'多媒体技术','选修');

/*Table structure for table `course_detail` */

DROP TABLE IF EXISTS `course_detail`;

CREATE TABLE `course_detail` (
  `cdid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `week` int(1) unsigned NOT NULL,
  `startlesson` int(2) unsigned NOT NULL,
  `endlesson` int(2) unsigned NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cdid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `course_detail_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `course_detail_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course_detail` */

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned zerofill NOT NULL,
  `cid` int(10) unsigned zerofill NOT NULL,
  `tid` int(10) unsigned zerofill NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=100014 DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

insert  into `grade`(`gid`,`sid`,`cid`,`tid`,`grade`) values (100000,0020120201,0000010000,0000200000,95),(100008,0020120202,0000020001,0000200003,88),(100009,0020120203,0000020001,0000200003,66),(100010,0020120202,0000020002,0000200003,76),(100011,0020120206,0000020003,0000200005,76),(100012,0020120201,0000010001,0000200001,88),(100013,0020120201,0000020000,0000200002,80);

/*Table structure for table `opinion` */

DROP TABLE IF EXISTS `opinion`;

CREATE TABLE `opinion` (
  `oid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ocontent` varchar(200) NOT NULL DEFAULT '无',
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

/*Data for the table `opinion` */

insert  into `opinion`(`oid`,`ocontent`,`status`) values (0000010000,'无','学生'),(0000010001,'123','学生'),(0000010003,'hello\r\n','教师'),(0000010006,'你好','学生'),(0000010007,'意见。。。','学生');

/*Table structure for table `optional_course` */

DROP TABLE IF EXISTS `optional_course`;

CREATE TABLE `optional_course` (
  `ocid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `week` int(1) unsigned NOT NULL,
  `startlesson` int(2) unsigned NOT NULL,
  `endlesson` int(2) unsigned NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  `total` int(3) unsigned NOT NULL DEFAULT '50',
  `rest` int(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`ocid`),
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  CONSTRAINT `optional_course_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `optional_course_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

/*Data for the table `optional_course` */

insert  into `optional_course`(`ocid`,`cid`,`tid`,`week`,`startlesson`,`endlesson`,`location`,`total`,`rest`) values (0000010000,20000,200002,1,9,10,'Y101',80,78),(0000010001,20001,200003,4,7,8,'Y202',100,99),(0000010002,20002,200003,5,9,10,'Y504',60,58),(0000010003,20003,200005,3,9,12,'Y201',80,79);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(10) unsigned NOT NULL,
  `spassword` varchar(10) NOT NULL DEFAULT '000000',
  `sname` varchar(20) NOT NULL,
  `ssex` varchar(1) DEFAULT NULL,
  `sbirth` date DEFAULT '1950-01-01',
  `sprofession` varchar(15) DEFAULT NULL,
  `stel` varchar(15) DEFAULT NULL,
  `semail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`spassword`,`sname`,`ssex`,`sbirth`,`sprofession`,`stel`,`semail`) values (20120201,'000000','张三','男','1993-07-07','计算机科学与技术','1234567893','123456789@163.com'),(20120202,'000000','李四','男','1992-03-04','网络技术与工程','15751766122','123456789@qq.com'),(20120203,'000000','王五','男','1991-02-06','软件工程','15866845678','wangwu@sina.com'),(20120204,'000000','张燕','女','1993-08-09','物联网工程','19384759686','mali@sina.com'),(20120205,'000000','李生','男','1995-09-04','计算机科学与技术','16837495860','chunchun@163.com'),(20120206,'000000','黄伟康','男','1992-02-02','计算机科学与技术','12345678905','');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` int(10) unsigned NOT NULL,
  `tpassword` varchar(10) NOT NULL DEFAULT '123456',
  `tname` varchar(20) NOT NULL,
  `tsex` varchar(1) DEFAULT NULL,
  `tbirth` date DEFAULT '1950-01-01',
  `tjob` varchar(20) DEFAULT NULL,
  `ttel` varchar(15) DEFAULT NULL,
  `temail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tid`,`tpassword`,`tname`,`tsex`,`tbirth`,`tjob`,`ttel`,`temail`) values (200000,'123456','陶佳丽','男','1990-03-08','无','15651699990','93765432@sina.com'),(200001,'123456','尹玉','男','1898-11-11','无',NULL,NULL),(200002,'123456','冒云香','女','1991-01-11','无','18014811111','null'),(200003,'123456','陈洋洋','男','1950-01-01','教授',NULL,NULL),(200004,'123456','陈丽璐','男','1990-02-02','助教',NULL,NULL),(200005,'123456','张晓雯','男','1994-01-01','助教','15684752319','45682595@184.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
