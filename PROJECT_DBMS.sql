-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: triton.towson.edu    Database: aadira1db
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB

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
-- Table structure for table `A_Department`
--

DROP TABLE IF EXISTS `A_Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A_Department` (
  `Dnumber` int(11) NOT NULL,
  `Dname` varchar(25) DEFAULT NULL,
  `MGRSSN` bigint(20) DEFAULT NULL,
  `MGRSTARTDATE` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `MGRSSN_idx` (`MGRSSN`),
  CONSTRAINT `A_Department_ibfk_1` FOREIGN KEY (`MGRSSN`) REFERENCES `A_Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_Department`
--

LOCK TABLES `A_Department` WRITE;
/*!40000 ALTER TABLE `A_Department` DISABLE KEYS */;
INSERT INTO `A_Department` VALUES (1,'Headquarters',888665555,'1981-06-19'),(4,'Administration',987654321,'1995-01-01'),(5,'Research',333445555,'1988-05-22');
/*!40000 ALTER TABLE `A_Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `A_Dependent`
--

DROP TABLE IF EXISTS `A_Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A_Dependent` (
  `ESSN` bigint(20) NOT NULL,
  `Dependent_name` varchar(20) NOT NULL DEFAULT '',
  `Sex` varchar(2) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`Dependent_name`),
  CONSTRAINT `A_Dependent_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `A_Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_Dependent`
--

LOCK TABLES `A_Dependent` WRITE;
/*!40000 ALTER TABLE `A_Dependent` DISABLE KEYS */;
INSERT INTO `A_Dependent` VALUES (123456789,'Alice','F','1988-12-30','Daughter'),(123456789,'Elizabeth','F','1967-05-05','Spouse'),(123456789,'Michael','M','1988-01-04','Son'),(333445555,'Alice','F','1986-04-05','Daughter'),(333445555,'Joy','F','1958-05-03','Spouse'),(333445555,'Theodore','M','1983-10-25','Son'),(987654321,'Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `A_Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `A_Dept_Locations`
--

DROP TABLE IF EXISTS `A_Dept_Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A_Dept_Locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `A_Dept_Locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `A_Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_Dept_Locations`
--

LOCK TABLES `A_Dept_Locations` WRITE;
/*!40000 ALTER TABLE `A_Dept_Locations` DISABLE KEYS */;
INSERT INTO `A_Dept_Locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `A_Dept_Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `A_Employee`
--

DROP TABLE IF EXISTS `A_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A_Employee` (
  `SSN` bigint(20) NOT NULL,
  `Fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `MINIT` varchar(1) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Salary` int(40) DEFAULT NULL,
  `SuperSSN` bigint(20) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `Dno` (`Dno`),
  KEY `SuperSSN` (`SuperSSN`),
  CONSTRAINT `A_Employee_ibfk_3` FOREIGN KEY (`SuperSSN`) REFERENCES `A_Employee` (`SSN`),
  CONSTRAINT `A_Employee_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `A_Department` (`Dnumber`),
  CONSTRAINT `A_Employee_ibfk_2` FOREIGN KEY (`SuperSSN`) REFERENCES `A_Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_Employee`
--

LOCK TABLES `A_Employee` WRITE;
/*!40000 ALTER TABLE `A_Employee` DISABLE KEYS */;
INSERT INTO `A_Employee` VALUES (123456789,'John','Smith','B','1955-01-09','731 Fondren, Houston, TX','M',30000,333445555,5),(333445555,'Franklin','Wong','T','1955-12-06','638 Voss, Houston, TX','M',40000,888665555,5),(453453453,'Joyce','English ','A','1972-07-31','5631 Rice, Houston, TX','F',25000,333445555,5),(666884444,'Ramesh','Narayan','K','1962-09-15','975 Fire Oak, Humble, TX','M',38000,333445555,5),(888665555,'James','Borg','E','1937-11-10','450 Stone, Houston, TX','M',55000,NULL,1),(987654321,'Jennifer','Wallace','S','1941-06-20','291 Berry,Bellaire,TX','F',43000,888665555,4),(987987987,'Ahmad','Jabbar','V','1969-03-29','980 Dallas, Houston,TX','M',25000,987654321,4),(999887777,'Alicia','Zelaya','J','1968-07-19','3321 Castle, Spring, TX','F',25000,987654321,4);
/*!40000 ALTER TABLE `A_Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `A_Project`
--

DROP TABLE IF EXISTS `A_Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A_Project` (
  `Pnumber` int(11) NOT NULL,
  `Pname` varchar(30) DEFAULT NULL,
  `Plocation` varchar(30) DEFAULT NULL,
  `Dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnum_idx` (`Dnum`),
  CONSTRAINT `Dnum` FOREIGN KEY (`Dnum`) REFERENCES `A_Department` (`Dnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_Project`
--

LOCK TABLES `A_Project` WRITE;
/*!40000 ALTER TABLE `A_Project` DISABLE KEYS */;
INSERT INTO `A_Project` VALUES (1,'ProductX','Bellaire',5),(2,'ProductY','Sugarland',5),(3,'ProductZ','Houston',5),(10,'Computerization','Stafford',4),(20,'Reorganization','Houston',1),(30,'Newbenefits','Stafford',4);
/*!40000 ALTER TABLE `A_Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `ad_id` int(11) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (9999,NULL,'Joe','Minion');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branch` (
  `branchNo` varchar(4) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('B003','163 Main St','Glasoow','G11 90X'),('B007','16 Arovil St','Aberdeen','AB2 3SU');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `cid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `Descrip` varchar(80) DEFAULT NULL,
  `Term` varchar(30) NOT NULL,
  `fac_id` int(11) NOT NULL,
  `prog_id` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid_UNIQUE` (`cid`),
  KEY `courses_ibfk_1` (`fac_id`),
  KEY `courses_ibfk_2` (`prog_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `Faculty` (`fac_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (400,'Operating Systems','The study and application of operating systems','Fall 2014',1005,2000),(405,'Cloud computing','The study and application of cloud computing.','Fall 2014',1007,2005),(410,'Information security','The study and application o','Spring 2015',1007,2005),(415,'Advance Algorithms & data Structures','The study and appliction of algorithm and data structures.','Spring 2015',1005,2000),(420,'Mining Massive datasets using mapreduce','The study and application of data mining','Fall 2014',1008,2015),(425,'Data Mining','The study and application of Data Mining','Spring 2015',1008,2015),(430,'Machine Learning in R','Study and application of machine learning algorithms','Spring 2015',1008,2015),(440,'Network and Cyber Forensics','study and application of cyber forensics','Fall 2014',1005,2000),(600,'Drawing meaning from Arts','The study and application of Arts','Fall 2014',1200,2025);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Dept_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `address` varchar(70) NOT NULL,
  `chair` int(11) NOT NULL,
  PRIMARY KEY (`Dept_id`),
  KEY `chair` (`chair`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`chair`) REFERENCES `Faculty` (`fac_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (2400,'Computer & Information Sciences','7886, Montgomery street,baltimore,MD.',1005),(2410,'Department of Physics','7800, Vancouver street, baltimore,MD.',1000),(2420,'Department of Chemistry','7820, Randall street, baltimore,MD.',1001),(2430,'Department of Mathematics','6620, worwickshire street,baltimore,MD.',1002),(2440,'Department of Radiology','6640, Blake street,baltimore,MD.',1004),(2450,'Department of Nursing','6650, Don bradman street,baltimore,MD.',1006),(2455,'Department of Arts','6655,Lt Kernal Jeff Street,baltimore,md',1200),(2460,'Department of Cutlrey','6670,Adam west street,baltimore,md',1201);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `fac_id` int(11) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `salary` decimal(10,5) DEFAULT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `Specialization` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1000,'4315,kittypozer drive',40000.05000,'Christian','Daniel','Physics'),(1001,'7767,ramona drive, fairfax',55000.68000,'robert','downey','CHemistry'),(1002,'8868,woodlake drive,fairfax',65000.43000,'Christopher','Henry','Maths'),(1003,'1104,montgomery lane,baltimore,md',35000.57000,'Randstan','Willey','Statistics'),(1004,'2456, lord byron lane, baltimore,md',45000.76000,'Ginny','Sam','Radiology'),(1005,'2233, Courtyard lane,baltimore,md',56000.75000,'Michael','Roberts','Operating systems'),(1006,'2240, Kentucky street, baltimore,md.',68000.55450,'Tim','paine','Nursing Sciences'),(1007,'1234, west village street, baltimore,md.',23000.45400,'Chriss','pratt','Cloud computing'),(1008,'1101, west mambalam street,baltimore,md',48000.64500,'Michael','Mcguire','Data Mining'),(1200,'4567,Brad walley street,baltimore,md',15000.45450,'Kim','yangon','Arts'),(1201,'9898, tim cook street, baltimore,md',65000.45600,'Jessica','Lin','Cutlery');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `J`
--

DROP TABLE IF EXISTS `J`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `J` (
  `j_num` varchar(10) NOT NULL,
  `jname` varchar(15) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`j_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `J`
--

LOCK TABLES `J` WRITE;
/*!40000 ALTER TABLE `J` DISABLE KEYS */;
INSERT INTO `J` VALUES ('j1','Sorter','Paris'),('j2','Punch','Rome'),('j3','Reader','Athens'),('j4','Console','Athens'),('j5','Collator','London'),('j6','Terminal','Oslo'),('j7','Tape','London');
/*!40000 ALTER TABLE `J` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maintains`
--

DROP TABLE IF EXISTS `Maintains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maintains` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ad_id`,`pay_id`),
  KEY `pay_id_idx` (`pay_id`),
  CONSTRAINT `maintains_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `Admin` (`ad_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pay_id` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`pay_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maintains`
--

LOCK TABLES `Maintains` WRITE;
/*!40000 ALTER TABLE `Maintains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Maintains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `P`
--

DROP TABLE IF EXISTS `P`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P` (
  `p_num` varchar(10) NOT NULL DEFAULT '',
  `pname` varchar(15) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`p_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `P`
--

LOCK TABLES `P` WRITE;
/*!40000 ALTER TABLE `P` DISABLE KEYS */;
INSERT INTO `P` VALUES ('p1','Nut','Red',12,'London'),('p2','Bolt','Green',17,'Paris'),('p3','Screw','Blue',17,'Rome'),('p4','Screw','Red',14,'London'),('p5','Cam','Blue',12,'Paris'),('p6','Cog','Red',19,'London');
/*!40000 ALTER TABLE `P` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programs`
--

DROP TABLE IF EXISTS `Programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Programs` (
  `prog_id` int(11) NOT NULL,
  `prog_name` varchar(20) NOT NULL,
  `Dept_id` int(11) NOT NULL,
  PRIMARY KEY (`prog_id`),
  KEY `Dept_id` (`Dept_id`),
  CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`Dept_id`) REFERENCES `Department` (`Dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programs`
--

LOCK TABLES `Programs` WRITE;
/*!40000 ALTER TABLE `Programs` DISABLE KEYS */;
INSERT INTO `Programs` VALUES (2000,'Computer science',2400),(2005,'Cloud Computing',2400),(2010,'Computer & Informati',2400),(2015,'Big Data & Data Scie',2400),(2020,'Nursing ',2450),(2025,'Master of Arts',2455);
/*!40000 ALTER TABLE `Programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `S`
--

DROP TABLE IF EXISTS `S`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S` (
  `s_num` varchar(10) NOT NULL DEFAULT '',
  `sname` varchar(15) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`s_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `S`
--

LOCK TABLES `S` WRITE;
/*!40000 ALTER TABLE `S` DISABLE KEYS */;
INSERT INTO `S` VALUES ('s1','Smith',20,'London'),('s2','Jones',20,'Paris'),('s3','Blake',40,'Paris'),('s4','Clark',20,'London'),('s5','Adams',30,'Athens');
/*!40000 ALTER TABLE `S` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPJ`
--

DROP TABLE IF EXISTS `SPJ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPJ` (
  `s_num` varchar(10) NOT NULL DEFAULT '',
  `p_num` varchar(10) NOT NULL DEFAULT '',
  `j_num` varchar(10) NOT NULL DEFAULT '',
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_num`,`p_num`,`j_num`),
  KEY `p_num` (`p_num`),
  KEY `j_num` (`j_num`),
  CONSTRAINT `SPJ_ibfk_1` FOREIGN KEY (`p_num`) REFERENCES `P` (`p_num`),
  CONSTRAINT `SPJ_ibfk_2` FOREIGN KEY (`s_num`) REFERENCES `S` (`s_num`),
  CONSTRAINT `SPJ_ibfk_3` FOREIGN KEY (`j_num`) REFERENCES `J` (`j_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPJ`
--

LOCK TABLES `SPJ` WRITE;
/*!40000 ALTER TABLE `SPJ` DISABLE KEYS */;
INSERT INTO `SPJ` VALUES ('s1','p1','j1',200),('s1','p1','j4',700),('s2','p3','j1',400),('s2','p3','j2',200),('s2','p3','j3',200),('s2','p3','j4',500),('s2','p3','j5',600),('s2','p3','j6',400),('s2','p3','j7',800),('s2','p5','j2',100),('s3','p3','j1',200),('s3','p4','j2',500),('s4','p6','j3',300),('s4','p6','j7',300),('s5','p1','j4',100),('s5','p2','j2',200),('s5','p2','j4',100),('s5','p3','j4',200),('s5','p4','j4',800),('s5','p5','j4',400),('s5','p5','j5',500),('s5','p5','j7',100),('s5','p6','j2',200),('s5','p6','j4',500);
/*!40000 ALTER TABLE `SPJ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `staffNo` varchar(4) NOT NULL,
  `fName` varchar(45) DEFAULT NULL,
  `lName` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `branchNo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `branchNo_idx` (`branchNo`),
  CONSTRAINT `branchNo` FOREIGN KEY (`branchNo`) REFERENCES `Branch` (`branchNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('SA16','David','Reece','Supervisor','M','1958-03-24',8006,'B007'),('SA9','David','Home','assistant','F','1970-02-19',8002,'B003');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Register`
--

DROP TABLE IF EXISTS `Student_Register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Register` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `grade` varchar(15) DEFAULT NULL,
  `term` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `Student_Register_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `Student_Register_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `Courses` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Register`
--

LOCK TABLES `Student_Register` WRITE;
/*!40000 ALTER TABLE `Student_Register` DISABLE KEYS */;
INSERT INTO `Student_Register` VALUES (38,400,'A','Fall 2014'),(38,405,NULL,'Fall 2014'),(38,415,NULL,'Spring 2015'),(38,420,NULL,'Fall 2014'),(39,400,'A','Fall 2014'),(39,420,'A','Fall 2014'),(40,415,NULL,'Fall 2014'),(40,425,NULL,'Spring 2015'),(40,600,NULL,'Fall 2014');
/*!40000 ALTER TABLE `Student_Register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `email` varchar(60) NOT NULL,
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('Amith@students.princegeorge.edu',38),('Joe@admin.princegeorge.edu',9999),('mcguire@princegeorge.edu',1008),('nitesh@students.princegeorge.edu',39),('roberts@princegeorge.edu',1005),('vshree@students.princegeorge.edu',40);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_on`
--

DROP TABLE IF EXISTS `Works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works_on` (
  `ESSN` bigint(20) NOT NULL,
  `Pno` int(2) NOT NULL DEFAULT '0',
  `Hours` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `Works_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `A_Employee` (`SSN`),
  CONSTRAINT `Works_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `A_Project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_on`
--

LOCK TABLES `Works_on` WRITE;
/*!40000 ALTER TABLE `Works_on` DISABLE KEYS */;
INSERT INTO `Works_on` VALUES (123456789,1,32.50),(123456789,2,7.50),(333445555,2,10.00),(333445555,3,10.00),(333445555,10,10.00),(333445555,20,10.00),(453453453,1,20.00),(453453453,2,20.00),(666884444,3,40.00),(888665555,20,0.00),(987654321,20,15.00),(987654321,30,20.00),(987987987,10,35.00),(987987987,30,5.00),(999887777,10,10.00),(999887777,30,30.00);
/*!40000 ALTER TABLE `Works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_course`
--

DROP TABLE IF EXISTS `credit_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_course` (
  `cid` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `term` varchar(20) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  `fac_id` int(11) DEFAULT NULL,
  `cost` decimal(10,5) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`,`term`),
  KEY `prog_id` (`prog_id`),
  KEY `fac_id` (`fac_id`),
  CONSTRAINT `credit_course_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Courses` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_course_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`),
  CONSTRAINT `credit_course_ibfk_3` FOREIGN KEY (`fac_id`) REFERENCES `Faculty` (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_course`
--

LOCK TABLES `credit_course` WRITE;
/*!40000 ALTER TABLE `credit_course` DISABLE KEYS */;
INSERT INTO `credit_course` VALUES (400,'Operating Systems','Fall 2014',2000,1005,2000.00000,3),(405,'Cloud Computing','Fall 2014',2005,1007,3000.00000,3),(410,'Information Security','Spring 2015',2005,1007,2000.00000,3),(415,'Advance Algorithms & Data Stru','Fall 2014',2000,1005,2500.00000,3),(415,'Advance Algorithms & data Stru','Spring 2015',2000,1005,2500.00000,3),(420,'Mining Massive datasets using ','Fall 2014',2015,1008,2000.00000,3),(425,'Data Mining','Spring 2015',2015,1008,2000.00000,3),(430,'Machine Learning in R','Spring 2015',2015,1008,3000.00000,3),(440,'Network and Cyber Forensics','Fall 2014',2000,1005,2000.00000,3);
/*!40000 ALTER TABLE `credit_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_contains`
--

DROP TABLE IF EXISTS `dept_contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_contains` (
  `dept_id` int(11) NOT NULL,
  `fac_id` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`,`fac_id`),
  KEY `fac_id` (`fac_id`),
  CONSTRAINT `dept_contains_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`Dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dept_contains_ibfk_2` FOREIGN KEY (`fac_id`) REFERENCES `Faculty` (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_contains`
--

LOCK TABLES `dept_contains` WRITE;
/*!40000 ALTER TABLE `dept_contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_student`
--

DROP TABLE IF EXISTS `first_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_student` (
  `ssid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `ph_no` int(10) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `gpa` decimal(10,2) DEFAULT NULL,
  `prevs_degree` varchar(20) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssid`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `first_student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`),
  CONSTRAINT `ssid` FOREIGN KEY (`ssid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_student`
--

LOCK TABLES `first_student` WRITE;
/*!40000 ALTER TABLE `first_student` DISABLE KEYS */;
INSERT INTO `first_student` VALUES (38,'amith.adiraju@gmail.com','Amith','Adiraju','1994-01-16',NULL,'YYYYYYYYY','M',3.22,'CSC',2015);
/*!40000 ALTER TABLE `first_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `int_student`
--

DROP TABLE IF EXISTS `int_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `int_student` (
  `isid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `ph_no` int(10) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `gpa` decimal(2,1) NOT NULL,
  `prevs_degree` varchar(20) NOT NULL,
  `country` varchar(40) NOT NULL,
  `english_score` decimal(10,2) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`isid`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `int_student_ibfk_1` FOREIGN KEY (`isid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `int_student_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `int_student`
--

LOCK TABLES `int_student` WRITE;
/*!40000 ALTER TABLE `int_student` DISABLE KEYS */;
INSERT INTO `int_student` VALUES (39,'nitesh.palamakula@gmail.com','nitesh','Palamakula','1994-01-18',NULL,'YYYYYYYYY','M',3.2,'CSC','India',7.50,2015),(40,'vijayashree1271@gmail.com','Vijaya','Chodavaram','1995-08-15',NULL,'efhfioiowefn','F',3.3,'CS','India',7.50,2000),(41,'student123@gmail.com','Lee','Zen','1995-03-02',NULL,'ebewkjf','M',3.5,'CS','India',94.00,2000);
/*!40000 ALTER TABLE `int_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noncredit_course`
--

DROP TABLE IF EXISTS `noncredit_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noncredit_course` (
  `cid` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `term` varchar(20) DEFAULT NULL,
  `prog_id` int(11) DEFAULT NULL,
  `fac_id` int(11) DEFAULT NULL,
  `cost` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `prog_id` (`prog_id`),
  KEY `fac_id` (`fac_id`),
  CONSTRAINT `noncredit_course_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Courses` (`cid`),
  CONSTRAINT `noncredit_course_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`),
  CONSTRAINT `noncredit_course_ibfk_3` FOREIGN KEY (`fac_id`) REFERENCES `Faculty` (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noncredit_course`
--

LOCK TABLES `noncredit_course` WRITE;
/*!40000 ALTER TABLE `noncredit_course` DISABLE KEYS */;
INSERT INTO `noncredit_course` VALUES (600,'Drawing meaning from Arts','Fall 2014',2025,1200,1000.00000);
/*!40000 ALTER TABLE `noncredit_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_date` varchar(12) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `stud_id` int(11) NOT NULL,
  `term` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `CardNum` varchar(45) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `stud_id_idx` (`stud_id`),
  CONSTRAINT `stud_id` FOREIGN KEY (`stud_id`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2014/09/12','OnlineDebit',38,'Fall 2014',3500,'123456789101112'),(2,'2014/09/27','OnlineCredit',39,'Fall 2014',2000,'123456789122122'),(5,'2014/9/12','OnlineCredit',39,'Fall 2014',2000,'123456789'),(6,'2015/03/05','OnlineCredit',38,'Fall 2014',3500,'54646464646');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq_course`
--

DROP TABLE IF EXISTS `prereq_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prereq_course` (
  `prereq` int(11) NOT NULL,
  `ccid` int(11) DEFAULT NULL,
  PRIMARY KEY (`prereq`),
  KEY `ccid` (`ccid`),
  CONSTRAINT `prereq_course_ibfk_1` FOREIGN KEY (`ccid`) REFERENCES `Courses` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq_course`
--

LOCK TABLES `prereq_course` WRITE;
/*!40000 ALTER TABLE `prereq_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `prereq_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `DOB` varchar(12) NOT NULL,
  `ph_no` int(10) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `prog_id_idx` (`prog_id`),
  CONSTRAINT `prog_id` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (38,'amith.adiraju@gmail.com','Amith','Adiraju','1994/01/16',NULL,'YYYYYYYYY','M',2015),(39,'nitesh.palamakula@gmail.com','nitesh','Palamakula','1994/01/18',NULL,'YYYYYYYYY','M',2015),(40,'vijayashree1271@gmail.com','Vijaya','Chodavaram','1995/08/15',NULL,'efhfioiowefn','F',2000),(41,'student123@gmail.com','Lee','Zen','1995/03/2',NULL,'ebewkjf','M',2000);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `supplier_shipment`
--

DROP TABLE IF EXISTS `supplier_shipment`;
/*!50001 DROP VIEW IF EXISTS `supplier_shipment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `supplier_shipment` AS SELECT 
 1 AS `s_num`,
 1 AS `total_qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suppliershipment1`
--

DROP TABLE IF EXISTS `suppliershipment1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliershipment1` (
  `s_num` varchar(10) NOT NULL DEFAULT '',
  `total` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliershipment1`
--

LOCK TABLES `suppliershipment1` WRITE;
/*!40000 ALTER TABLE `suppliershipment1` DISABLE KEYS */;
INSERT INTO `suppliershipment1` VALUES ('s1',900),('s2',3200),('s3',700),('s4',600),('s5',3100);
/*!40000 ALTER TABLE `suppliershipment1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_student`
--

DROP TABLE IF EXISTS `trans_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_student` (
  `tsid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `DOB` varchar(12) NOT NULL,
  `ph_no` int(10) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `gpa` decimal(2,1) NOT NULL,
  `courses_completed` varchar(40) NOT NULL,
  `univ_name` varchar(40) NOT NULL,
  `english_score` decimal(10,2) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tsid`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `trans_student_ibfk_1` FOREIGN KEY (`tsid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trans_student_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_student`
--

LOCK TABLES `trans_student` WRITE;
/*!40000 ALTER TABLE `trans_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `trans_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veteran_student`
--

DROP TABLE IF EXISTS `veteran_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veteran_student` (
  `vsid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `ph_no` int(10) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `vetarn_status` varchar(40) NOT NULL,
  `prog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vsid`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `veteran_student_ibfk_1` FOREIGN KEY (`vsid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `veteran_student_ibfk_2` FOREIGN KEY (`prog_id`) REFERENCES `Programs` (`prog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veteran_student`
--

LOCK TABLES `veteran_student` WRITE;
/*!40000 ALTER TABLE `veteran_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `veteran_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `supplier_shipment`
--

/*!50001 DROP VIEW IF EXISTS `supplier_shipment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aadira1`@`10.55.%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `supplier_shipment` AS select `SPJ`.`s_num` AS `s_num`,sum(`SPJ`.`qty`) AS `total_qty` from `SPJ` group by `SPJ`.`s_num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07 18:03:52
