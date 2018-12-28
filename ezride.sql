/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.13-MariaDB : Database - xero
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ezride` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ezride`;

/*Table structure for table `cars` */

DROP TABLE IF EXISTS `cars`;

CREATE TABLE `cars` (
  `carno` varchar(15) NOT NULL,
  `carname` varchar(30) NOT NULL,
  `carclass` varchar(30) NOT NULL,
  `cartransmission` varchar(30) NOT NULL,
  `carcost` double NOT NULL,
  `cartype` varchar(30) NOT NULL,
  `carcapacity` int(11) NOT NULL,
  `carairbag` int(11) NOT NULL,
  `carotherdescription` varchar(50) NOT NULL,
  `carrating` int(11) DEFAULT NULL,
  `carphoto` varchar(30) NOT NULL,
  PRIMARY KEY (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cars` */

insert  into `cars`(`carno`,`carname`,`carclass`,`cartransmission`,`carcost`,`cartype`,`carcapacity`,`carairbag`,`carotherdescription`,`carrating`,`carphoto`) values 

  ('car1','i20','Hatchback','Manual',450,'Economy',5,4,'Cruise Control',4,'i20.png'),
  ('car10','Kwid','Hatchback','Manual',450,'Economy',4,2,'Others',5,'kwid.png'),
  ('car11','Swift','Hatchback','Manual',450,'Economy',5,4,'Others',NULL,'swift.png'),
  ('car2','City','Sedan','Manual',500,'Premium',5,4,'Others',5,'city.png'),
  ('car3','Aspire','Sedan','Manual',500,'Economy',5,2,'Others',5,'aspire.png'),
  ('car4','Ciaz','Sedan','Manual',500,'Premium',5,2,'Others',5,'ciaz.png'),
  ('car5','Corolla','Sedan','Auto',500,'Luxury',5,4,'Others',5,'corolla.png'),
  ('car6','Creta','SUV','Auto',700,'Premium',5,4,'Others',5,'creta.png'),
  ('car7','Duster','SUV','Manual',700,'Premium',5,4,'Others',5,'duster.png'),
  ('car8','Innova','SUV','Manual',700,'Luxury',7,4,'Others',4,'innova.png');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customerid` varchar(15) NOT NULL,
  `customername` varchar(30) NOT NULL,
  `customeremail` varchar(30) NOT NULL,
  `customerusername` varchar(30) NOT NULL,
  `customerpassword` varchar(50) NOT NULL,
  `customergender` varchar(15) NOT NULL,
  `customerdob` date NOT NULL,
  `customerphoto` varchar(30) DEFAULT NULL,
  `signuptime` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`customerid`,`customername`,`customeremail`,`customerusername`,`customerpassword`,`customergender`,`customerdob`,`customerphoto`,`signuptime`,`active`) values 
  ('cus1','Joseph Blessingh','josephblessingh@gmail.com','joseph123','bd9fa9edbeff8f0b88a6f26ce7665953','male','1999-05-04','customer.png','2018-10-02 00:13:08',1),
  ('cus2','Nirmal','nirmalbabu14@gmail.com','nirmal123','272fb605f8fb4785c9b09f3c1d3b6527','male','1998-07-11','customer.png','2018-10-02 06:21:52',1),
  ('cus3','Jithin','jithin.k.thomas@gmail.com','jithin123','455de69d127b972baa8e324642694026','male','1998-05-18','customer.png','2018-04-23 06:21:52',1),
  ('cus4','Sandesh','sandesh@gmail.com','sandesh123','1d8167d3261024a2af24ab5006f761bd','male','1998-07-01','customer.png','2018-07-23 06:21:52',1),
  ('cus5','Jovin','jovin@gmail.com','jovin123','91898be9b64eb350a181e181b338027c','male','1999-05-15','customer.png','2018-05-23 06:21:52',1),
  ('cus6','Shruti','shruti@gmail.com','shruti123','73d98b481fe4148fea2b01c63b46d188','female','1998-10-03','customer.png','2018-04-23 06:21:52',1),
  ('cus7','Raveena','raveena@gmail.com','raveena123','a0ef46c4fb02007b322001b8482698bb','female','1996-02-01','customer.png','2017-04-23 16:54:41',1),
  ('cus8','Customer','customer@gmail.com','customer123','f4ad231214cb99a985dff0f056a36242','male','1996-10-22','customer.png','2018-04-24 15:57:05',1),
  ('cus9','Joel Cherian','joel99cherian@gmail.com','joel123','c52331dd6fae697dbfa3954c00600b46','male','1999-04-13','customer.png','2018-04-24 16:57:05',1);

/*Table structure for table `carratings` */

DROP TABLE IF EXISTS `carratings`;

CREATE TABLE `carratings` (
  `carno` varchar(15) NOT NULL,
  `customerid` varchar(15) NOT NULL,
  `carrating` int(11) DEFAULT NULL,
  `carreview` varchar(100) DEFAULT NULL,
  `ratingtime` datetime NOT NULL,
  PRIMARY KEY (`carno`,`customerid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `carratings_ibfk_1` FOREIGN KEY (`carno`) REFERENCES `cars` (`carno`),
  CONSTRAINT `carratings_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carratings` */

insert  into `carratings`(`carno`,`customerid`,`carrating`,`carreview`,`ratingtime`) values 
  ('car1','cus1',3,'Hello!','2018-10-24 23:05:55'),
  ('car1','cus2',4,'This car is great! I like it! The price is affordable.','2018-10-01 23:05:55'),
  ('car1','cus3',5,'I love this car! Enjoyable Ride!','2018-10-01 23:05:55'),
  ('car3','cus8',5,'Good!','2017-10-01 16:12:46'),
  ('car8','cus4',3,'I think it is a bit expensive! ','2018-10-01 23:05:55'),
  ('car8','cus5',4,'Great Car! I just love it!','2018-10-01 23:05:55');


/*Table structure for table `offices` */

DROP TABLE IF EXISTS `offices`;

CREATE TABLE `offices` (
  `officeid` varchar(15) NOT NULL,
  `officename` varchar(30) NOT NULL,
  `officeaddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `offices` */

insert into `offices`(`officeid`,`officename`,`officeaddress`) values 
  ('office1','Kharghar','Shop-12, Anmol Planet, Sector-10, Kharghar'),
  ('office2','Belapur','Shop-120, Star Plaza, Sector-15, Belapur'),
  ('office3','Nerul','Shop no-2, Palm Beach Galleria, Sector-14, Nerul'),
  ('office4','Vashi','FCRIT, Sector-9, Vashi'),
  ('office5','Panvel','Shop-23, Huge Building, Sector-20, Panvel');

/*Table structure for table `drivers` */

DROP TABLE IF EXISTS `drivers`;

CREATE TABLE `drivers` (
  `driverid` varchar(15) NOT NULL,
  `drivername` varchar(30) NOT NULL,
  `driverusername` varchar(15) NOT NULL,
  `driverpassword` varchar(50) NOT NULL,
  `driverage` int(11) NOT NULL,
  `driverrating` int(11) NOT NULL,
  `officeid` varchar(30) NOT NULL,
  `drivercost` double NOT NULL,
  `drivergender` varchar(30) NOT NULL,
  `driverphoto` varchar(30) NOT NULL,
  `driveremail` varchar(30) NOT NULL,
  `licensephoto` varchar(30) DEFAULT NULL,
  `driverexperience` varchar(30) NOT NULL,
  `driversignuptime` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`driverid`),
  KEY `officeid` (`officeid`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`officeid`) REFERENCES `offices` (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `drivers` */

insert  into `drivers`(`driverid`,`drivername`,`driverusername`,`driverpassword`,`driverage`,`driverrating`,`officeid`,`drivercost`,`drivergender`,`driverphoto`,`driveremail`,`licensephoto`,`driverexperience`,`driversignuptime`,`lastlogin`,`Active`) values 
  ('driver1','Jhon','driver','c974f63abee678d0e103167ad9c813a5',21,5,'office1',1200,'male','driver1.png','Jhon@gmail.com','license1.png','10','2017-02-08 09:00:00','2017-04-24 23:16:53',1),
  ('driver10','Rana','Rana','c974f63abee678d0e103167ad9c813a5',42,0,'office2',1200,'male','driver1.png','dui@nonummy.org','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver11','Alex','Alex','c974f63abee678d0e103167ad9c813a5',32,0,'office5',1200,'female','driver1.png','justo@magnisdisp','license.png','5','2017-02-08 09:00:00',NULL,1),
  ('driver12','Zai','Zai','c974f63abee678d0e103167ad9c813a5',41,0,'office2',1200,'female','driver1.png','nun@Crasegetnisi.net','license.png','5','2017-02-08 09:00:00',NULL,1),
  ('driver13','Eden','Nash','c974f63abee678d0e103167ad9c813a5',21,0,'office5',1200,'male','driver1.png','lacus@erat.net','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver14','Guy','Butler','c974f63abee678d0e103167ad9c813a5',48,0,'office2',1200,'female','driver1.png','Donec.dignissim@anteVivamusnon','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver15','Audrey','Mota','c974f63abee678d0e103167ad9c813a5',25,0,'office5',1200,'female','driver1.png','cubilia.Curae@justoPraesent.or','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver16','Edan','Melvin','c974f63abee678d0e103167ad9c813a5',48,0,'office3',1200,'male','driver1.png','euismod@utnisia.net','license.png','9','2017-02-08 09:00:00',NULL,1),
  ('driver17','Moon','Dhruv','c974f63abee678d0e103167ad9c813a5',37,0,'office4',1200,'female','driver1.png','Etiam@euneque.ca','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver18','Alexa','Griffin','c974f63abee678d0e103167ad9c813a5',28,0,'office1',1200,'female','driver1.png','ligula.consectetuer@velit.co.u','license.png','7','2017-02-08 09:00:00',NULL,1),
  ('driver19','Porter','Daniels','c974f63abee678d0e103167ad9c813a5',34,0,'office5',1200,'female','driver1.png','urna.et@vehicularisus.com','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver2','Yashveer','Simon','c974f63abee678d0e103167ad9c813a5',20,0,'office1',1200,'male','driver1.png','quis.pede.Praesent@Vivamusmole','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver20','Shelly','Roberson','c974f63abee678d0e103167ad9c813a5',30,0,'office2',1200,'male','driver1.png','a.mi@elitdictum.ca','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver21','Abel','port','c974f63abee678d0e103167ad9c813a5',32,0,'office5',1200,'male','driver1.png','ante.ipsum@euerat.com','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver22','Porterous','Walters','c974f63abee678d0e103167ad9c813a5',41,0,'office3',1200,'male','driver1.png','ipsum.nunc.id@mollisdui.edu','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver23','Solo','Watts','c974f63abee678d0e103167ad9c813a5',23,0,'office5',1200,'female','driver1.png','in@MaurismagnaDuis.ca','license.png','9','2017-02-08 09:00:00',NULL,1),
  ('driver24','Wallace','Gallegos','c974f63abee678d0e103167ad9c813a5',27,0,'office1',1200,'male','driver1.png','sed.sem.egestas@sagittislobort','license.png','6','2017-02-08 09:00:00',NULL,0),
  ('driver25','Michael','Noah','c974f63abee678d0e103167ad9c813a5',43,0,'office2',1200,'female','driver1.png','lorem@auctorvelit.co.uk','license.png','5','2017-02-08 09:00:00',NULL,1),
  ('driver26','Ram','Smith','c974f63abee678d0e103167ad9c813a5',42,0,'office5',1200,'male','driver1.png','pede.malesuada@et.org','license.png','5','2017-02-08 09:00:00',NULL,1),
  ('driver27','Nirmal','Fliker','c974f63abee678d0e103167ad9c813a5',29,0,'office2',1200,'female','driver1.png','elit.pellentesque@hendreritDon','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver28','Nikhil','Zonan','c974f63abee678d0e103167ad9c813a5',43,0,'office3',1200,'female','driver1.png','dapibus.quam.quis@dapibus.co.u','license.png','10','2017-02-08 09:00:00',NULL,1),
  ('driver29','Omkar','Wong','c974f63abee678d0e103167ad9c813a5',36,0,'office3',1200,'male','driver1.png','Fusce.aliquam.enim@variusorcii','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver3','Ramesh','Cash','c974f63abee678d0e103167ad9c813a5',47,0,'office1',1200,'male','driver1.png','nec.euismod@magnisdisparturien','license.png','10','2017-02-08 09:00:00',NULL,1),
  ('driver30','Bata','Maggy','c974f63abee678d0e103167ad9c813a5',41,0,'office5',1200,'female','driver1.png','accumsan.convallis.ante@Curabi','license.png','4','2017-02-08 09:00:00',NULL,1),
  ('driver31','Simran','Scarlet','c974f63abee678d0e103167ad9c813a5',30,0,'office2',1200,'male','driver1.png','Nulla.tincidunt@temporlorem.co','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver32','Amey','Isaac','c974f63abee678d0e103167ad9c813a5',44,0,'office3',1200,'female','driver1.png','Morbi@Fuscefeugiat.org','license.png','7','2017-02-08 09:00:00',NULL,1),
  ('driver33','Kara','Yohan','c974f63abee678d0e103167ad9c813a5',32,0,'office2',1200,'female','driver1.png','egestas@Proin.com','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver34','Berry','Dustin','c974f63abee678d0e103167ad9c813a5',25,4,'office3',1200,'female','driver1.png','turpis@Nuncmauriselit.com','license.png','9','2017-02-08 09:00:00',NULL,1),
  ('driver35','ciaz','Donald','c974f63abee678d0e103167ad9c813a5',33,0,'office5',1200,'female','driver1.png','Nam@Aliquamerat.org','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver36','Ananth','Lucifer','c974f63abee678d0e103167ad9c813a5',34,0,'office4',1200,'female','driver1.png','ut@Nullam.org','license.png','8','2017-02-08 09:00:00',NULL,1),
  ('driver37','Sira','Cassi','c974f63abee678d0e103167ad9c813a5',34,0,'office5',1200,'female','driver1.png','consectetuer.euismod@neque.ca','license.png','3','2017-02-08 09:00:00',NULL,1),
  ('driver38','Dhruv','Valak','c974f63abee678d0e103167ad9c813a5',48,0,'office4',1200,'male','driver1.png','Mauris@et.co.uk','license.png','3','2017-02-08 09:00:00',NULL,1),
  ('driver39','Natalie','Tiger','c974f63abee678d0e103167ad9c813a5',37,0,'office4',1200,'female','driver1.png','consectetuer@fringillaestMauri','license.png','7','2017-02-08 09:00:00',NULL,1),
  ('driver4','Yohan','Macey','c974f63abee678d0e103167ad9c813a5',33,0,'office3',1200,'male','driver1.png','erat.volutpat.Nulla@molestieph','license.png','7','2017-02-08 09:00:00',NULL,1),
  ('driver40','Camera','Liberty','c974f63abee678d0e103167ad9c813a5',20,0,'office3',1200,'female','driver1.png','Cras.vulputate.velit@iaculis.e','license.png','6','2017-02-08 09:00:00',NULL,1),
  ('driver41','Gilth','Jennifer','c974f63abee678d0e103167ad9c813a5',46,0,'office3',1200,'female','driver1.png','facilisis.lorem.tristique@volu','license.png','9','2017-02-08 09:00:00',NULL,1),
  ('driver42','Candice','Malco','c974f63abee678d0e103167ad9c813a5',36,0,'office4',1200,'female','driver1.png','sapien@tinciduntpede.net','license.png','10','2017-02-08 09:00:00',NULL,1),
  ('driver43','Sita','Gray','c974f63abee678d0e103167ad9c813a5',32,0,'office5',1200,'male','driver1.png','ante@rhoncusNullam.edu','license.png','7','2017-02-08 09:00:00',NULL,1),
  ('nodriver','nodriver','nodriver','nodriver',0,1,'office1',0,'nodriver','nodriver','nodriver','nodriver','nodriver','0000-00-00 00:00:00',NULL,1);


/*Table structure for table `driverratings` */

DROP TABLE IF EXISTS `driverratings`;

CREATE TABLE `driverratings` (
  `driverid` varchar(15) NOT NULL,
  `customerid` varchar(15) NOT NULL,
  `driverrating` int(11) NOT NULL,
  `driverreview` varchar(50) NOT NULL,
  `ratingtime` datetime NOT NULL,
  PRIMARY KEY (`driverid`,`customerid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `driverratings_ibfk_1` FOREIGN KEY (`driverid`) REFERENCES `drivers` (`driverid`),
  CONSTRAINT `driverratings_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `driverratings` */

insert  into `driverratings`(`driverid`,`customerid`,`driverrating`,`driverreview`,`ratingtime`) values 
  ('driver34','cus1',3,'fsadf','2017-04-24 02:46:06'),
  ('driver34','cus2',5,'Great!','2018-03-24 02:46:06'),
  ('driver34','cus3',5,'Friendly!','2018-04-24 02:46:06');



/*Table structure for table `mails` */

DROP TABLE IF EXISTS `mails`;

CREATE TABLE `mails` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `feedback` varchar(150) DEFAULT NULL,
  `sendtime` datetime NOT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `mails` */

insert  into `mails`(`feedbackid`,`name`,`email`,`feedback`,`sendtime`) values 
  (1,'Joel','joel99cherian@gmail.com','Hello It is me!\r\n','2017-04-18 02:31:19'),
  (2,'Jithin','jithin@gmail.com','Hello! I am new to this website! Can you explain the process of this system!','2017-04-19 00:17:33'),
  (3,'Nirmal','nirmalbabu14@gmail.com','sadfsdfasdf','2017-04-19 00:17:57'),
  (4,'Raveena','raveena@gmail.com','Hello, the website is great!','2017-04-23 22:11:03'),
  (5,'Shruti','shruti@gmail.com','How to make the booking?','2017-04-24 02:55:47');

/*Table structure for table `officecars` */

DROP TABLE IF EXISTS `officecars`;

CREATE TABLE `officecars` (
  `officeid` varchar(15) DEFAULT NULL,
  `carno` varchar(15) DEFAULT NULL,
  `carid` varchar(15) NOT NULL,
  PRIMARY KEY (`carid`),
  KEY `carno` (`carno`),
  KEY `officeid` (`officeid`),
  CONSTRAINT `officecars_ibfk_1` FOREIGN KEY (`carno`) REFERENCES `cars` (`carno`),
  CONSTRAINT `officecars_ibfk_2` FOREIGN KEY (`officeid`) REFERENCES `offices` (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `officecars` */

insert  into `officecars`(`officeid`,`carno`,`carid`) values 
  ('office1','car1','carid1'),
  ('office1','car4','carid2'),
  ('office1','car5','carid3'),
  ('office1','car5','carid4'),
  ('office1','car6','carid5'),
  ('office1','car6','carid6'),
  ('office1','car7','carid7'),
  ('office1','car7','carid8'),
  ('office1','car8','carid9'),
  ('office1','car8','carid10'),
  ('office1','car2','carid11'),
  ('office1','car1','carid12'),
  ('office2','car8','carid13'),
  ('office2','car7','carid14'),
  ('office2','car11','carid15'),
  ('office2','car10','carid16'),
  ('office2','car10','carid17'),
  ('office2','car2','carid18'),
  ('office2','car2','carid19'),
  ('office2','car3','carid20'),
  ('office2','car3','carid21'),
  ('office2','car4','carid22'),
  ('office3','car1','carid23'),
  ('office3','car4','carid24'),
  ('office3','car5','carid25'),
  ('office3','car5','carid26'),
  ('office3','car6','carid27'),
  ('office3','car6','carid28'),
  ('office3','car7','carid29'),
  ('office3','car7','carid30'),
  ('office3','car8','carid31'),
  ('office3','car8','carid32'),
  ('office4','car7','carid33'),
  ('office4','car1','carid34'),
  ('office4','car11','carid35'),
  ('office4','car8','carid36'),
  ('office4','car5','carid37'),
  ('office4','car3','carid38'),
  ('office4','car10','carid39'),
  ('office4','car10','carid40'),
  ('office4','car2','carid41'),
  ('office4','car2','carid42'),
  ('office4','car3','carid43'),
  ('office5','car3','carid44'),
  ('office5','car4','carid45'),
  ('office5','car1','carid46'),
  ('office5','car4','carid47'),
  ('office5','car5','carid48'),
  ('office5','car5','carid49'),
  ('office5','car6','carid50');
  

/*Table structure for table `officephones` */

DROP TABLE IF EXISTS `officephones`;

CREATE TABLE `officephones` (
  `officephoneid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` varchar(30) NOT NULL,
  `officephoneprefix` varchar(11) NOT NULL,
  `officephoneno` int(11) NOT NULL,
  PRIMARY KEY (`officephoneid`),
  KEY `officeid` (`officeid`),
  CONSTRAINT `officephones_ibfk_1` FOREIGN KEY (`officeid`) REFERENCES `offices` (`officeid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `officephones` */

insert  into `officephones`(`officephoneid`,`officeid`,`officephoneprefix`,`officephoneno`) values 
  (1,'office1','022',27741928),
  (2,'office1','022',27741924),
  (3,'office1','+91',9869271231),
  (4,'office2','022',27723674),
  (5,'office2','022',27723221),
  (6,'office2','+91',9869571231),
  (7,'office3','022',27713806),
  (8,'office3','022',27713809),
  (9,'office3','+91',9969773517),
  (10,'office4','022',27701000),
  (11,'office4','022',27701001),
  (12,'office4','+91',7039877459),
  (13,'office5','022',27738999),
  (14,'office5','022',27738996),
  (15,'office5','+91',9869629164);

/*Table structure for table `staffs` */

DROP TABLE IF EXISTS `staffs`;

CREATE TABLE `staffs` (
  `staffid` varchar(15) NOT NULL,
  `staffname` varchar(30) NOT NULL,
  `staffusername` varchar(30) NOT NULL,
  `staffemail` varchar(30) NOT NULL,
  `staffpassword` varchar(50) NOT NULL,
  `staffrole` varchar(30) NOT NULL,
  `staffphoto` varchar(30) NOT NULL,
  `officeid` varchar(30) DEFAULT NULL,
  `staffgender` varchar(30) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`staffid`),
  KEY `officeid` (`officeid`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`officeid`) REFERENCES `offices` (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `staffs` */

insert  into `staffs`(`staffid`,`staffname`,`staffusername`,`staffemail`,`staffpassword`,`staffrole`,`staffphoto`,`officeid`,`staffgender`,`lastlogin`,`active`) values 
  ('staff1','Joseph','admin','josephblessingh@gmail.com','0192023a7bbd73250516f069df18b500','branchmanager','staff1.png','office1','male','2017-04-24 23:16:04',1),
  ('staff10','Nirmal','tharthar','nirmalbabu14@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office5','male','2017-04-18 03:23:50',1),
  ('staff12','Jithin','staff','jithin@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office1','male','2017-04-18 03:23:50',1),
  ('staff2','Ahan','kyawkyaw','aahanf@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office1','male','2017-04-18 03:24:06',1),
  ('staff3','Terrell','aungaung','terrell@gmail.com','0192023a7bbd73250516f069df18b500','branchmanager','staff1.png','office2','male',NULL,1),
  ('staff4','Jonathan','zawzawzaw','cho2jonathan@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office2','male',NULL,1),
  ('staff5','Freddy','kaungkaung','freddypoly99@gmail.com','0192023a7bbd73250516f069df18b500','branchmanger','staff1.png','office3','male',NULL,1),
  ('staff6','Saumya','linlinlin','saumya@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office3','male',NULL,1),
  ('staff7','Siddhi','moemoemoe','siddhi@gmail.com','0192023a7bbd73250516f069df18b500','branchmanager','staff1.png','office4','male',NULL,1),
  ('staff8','Nimmy','yanyanyan','nimmmy@gmail.com','0192023a7bbd73250516f069df18b500','staff','staff1.png','office4','male',NULL,1),
  ('staff9','Shreya','pyaepyae','shreya@gmail.com','0192023a7bbd73250516f069df18b500','branchmanager','staff1.png','office5','male',NULL,1);

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `bookingid` varchar(15) NOT NULL,
  `customerid` varchar(15) NOT NULL,
  `officeid` varchar(15) NOT NULL,
  `pickuptime` datetime NOT NULL,
  `returntime` datetime NOT NULL,
  `pickuplocation` varchar(30) NOT NULL,
  `returnlocation` varchar(30) NOT NULL,
  `durationinhours` int(11) NOT NULL,
  `carid` varchar(15) NOT NULL,
  `carcost` double NOT NULL,
  `driverid` varchar(15) DEFAULT NULL,
  `drivercost` double NOT NULL,
  `totalcost` double NOT NULL,
  `paymentmethod` varchar(30) NOT NULL,
  `confirmstatus` varchar(30) NOT NULL DEFAULT 'pending',
  `staffid` varchar(15) DEFAULT NULL,
  `bookingtime` datetime NOT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `officeid` (`officeid`),
  KEY `customerid` (`customerid`),
  KEY `carid` (`carid`),
  KEY `driverid` (`driverid`),
  KEY `staffid` (`staffid`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`officeid`) REFERENCES `offices` (`officeid`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`carid`) REFERENCES `officecars` (`carid`),
  CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`driverid`) REFERENCES `drivers` (`driverid`),
  CONSTRAINT `bookings_ibfk_5` FOREIGN KEY (`staffid`) REFERENCES `staffs` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookings` */

insert  into `bookings`(`bookingid`,`customerid`,`officeid`,`pickuptime`,`returntime`,`pickuplocation`,`returnlocation`,`durationinhours`,`carid`,`carcost`,`driverid`,`drivercost`,`totalcost`,`paymentmethod`,`confirmstatus`,`staffid`,`bookingtime`) values 
  ('booking6','cus1','office1','2017-04-07 06:30:00','2017-04-10 06:30:00','Sector-10','Sector-10',72,'carid14',432,'driver18',96,528,'Pay at Arrival','confirmed','staff1','2017-04-23 23:09:09'),
  ('booking8','cus6','office1','2017-04-27 06:30:00','2017-04-29 06:30:00','Kharghar Office','Kharghar Office',48,'carid19',216,'nodriver',0,216,'Pay at Arrival','confirmed','staff1','2017-04-23 23:14:07'),
  ('booking9','cus1','office1','2017-05-10 05:30:00','2017-05-13 05:30:00','Kharghar Office','Kharghar Office',72,'carid19',324,'nodriver',0,324,'Pay at Arrival','declined','staff1','2017-04-24 22:02:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
