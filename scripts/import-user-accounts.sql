SET FOREIGN_KEY_CHECKS=0;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `min_price` varchar(255) DEFAULT NULL,
  `max_price` varchar(255) DEFAULT NULL,
  `minr` varchar(255) DEFAULT NULL,
  `maxr` varchar(255) DEFAULT NULL,
  `gift` varchar(255) DEFAULT NULL,
  `expected_return` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `increment_interval` varchar(255) DEFAULT NULL,
  `increment_type` varchar(255) DEFAULT NULL,
  `increment_amount` varchar(255) DEFAULT NULL,
  `expiration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (10,'AMATUER AI','200','200','20000','2','3','0',NULL,'Main','Every 10 Minutes','Percentage','20','6 Days','2022-07-05 14:34:25','2023-04-25 10:00:53'),(11,'PROFESSIONAL AI','30000','30000','90000','3','3','0',NULL,'Main','Daily','Percentage','3','20 Days','2022-11-25 13:10:14','2023-04-24 22:40:06'),(12,'VARIETY AI','100000','100000','1000000000','80','80','0',NULL,'Main','Daily','Percentage','80','30 Days','2023-02-23 15:39:21','2023-04-24 22:40:53'),(13,'FIXED AI','50000','50000','5000000000000','80','80','0',NULL,'Main','Daily','Percentage','80','60 Days','2023-02-23 15:40:59','2023-04-24 22:41:36'),(14,'SUPERIOR AI','100000','100000','100000000','50','50','0',NULL,'Main','Daily','Percentage','50','20 Days','2023-03-09 15:42:12','2023-04-24 22:41:12');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `kycs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kycs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `social_media` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `frontimg` text DEFAULT NULL,
  `backimg` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `statenumber` varchar(50) DEFAULT NULL,
  `accounttype` varchar(50) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `income` varchar(100) DEFAULT NULL,
  `kinname` varchar(150) DEFAULT NULL,
  `kinaddress` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kycs_email_unique` (`zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kycs`
--

LOCK TABLES `kycs` WRITE;
/*!40000 ALTER TABLE `kycs` DISABLE KEYS */;
INSERT INTO `kycs` VALUES (35,255,'Male','Male','nulledtechy@gmail.com',NULL,'2024-03-05',NULL,'Lag','Lagos','lagos','Nigeria','National ID','uploads/ZHw0WgKN9UdrnoiKAyEY6ZTQkqaQh1tW9K0RUdSr.jpg','uploads/Qa8t6z3umofYR5WIBkrloSEEqHTnopxGRQ7w9dYQ.jpg','Verified','2024-03-09 09:12:38','2024-03-09 09:13:00','34567890','Savings Account','Self Employed','$700.00 - $1,000.00','eva','lagos, nigeria','broter',NULL,NULL),(36,256,'Male','Male','34556',NULL,'2024-07-12',NULL,'no 23 lagos road','No 23 Lagos road','Imo','Nigeria','Int\'l Passport','uploads/ZhnpK6H0RZsmpu5IshSZuThwSMLyq80lf2GsSWXJ.png','uploads/rcX5gWQ0kPjJVsIovO4YXU9N1RBzt78r5hSdu5tl.png','Verified','2024-07-01 11:41:04','2024-07-01 11:53:43','635433131','Savings Account','Self Employed','$1,000.00 - $2,000.00','Eva koavc','no 23 lagos road','brother',NULL,NULL);
/*!40000 ALTER TABLE `kycs` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `device` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1190,252,'197.210.78.27','2024-01-07 08:12:41','2024-01-07 08:12:41','WebKit','Chrome','Windows'),(1191,252,'197.210.78.27','2024-01-07 08:12:41','2024-01-07 08:12:41','WebKit','Chrome','Windows'),(1192,252,'197.210.78.208','2024-03-09 08:57:07','2024-03-09 08:57:07','WebKit','Chrome','Windows'),(1193,252,'197.210.78.208','2024-03-09 08:57:07','2024-03-09 08:57:07','WebKit','Chrome','Windows'),(1194,255,'197.210.78.208','2024-03-09 09:08:46','2024-03-09 09:08:46','WebKit','Edge','Windows'),(1195,255,'197.210.78.208','2024-03-09 09:08:46','2024-03-09 09:08:46','WebKit','Edge','Windows'),(1196,255,'197.210.78.208','2024-03-09 09:09:02','2024-03-09 09:09:02','WebKit','Chrome','AndroidOS'),(1197,255,'197.210.78.208','2024-03-09 09:09:02','2024-03-09 09:09:02','WebKit','Chrome','AndroidOS'),(1198,255,'197.210.78.208','2024-03-09 09:09:59','2024-03-09 09:09:59','WebKit','Edge','Windows'),(1199,255,'197.210.78.208','2024-03-09 09:09:59','2024-03-09 09:09:59','WebKit','Edge','Windows'),(1200,255,'196.44.98.162','2024-03-09 09:48:40','2024-03-09 09:48:40','WebKit','Chrome','AndroidOS'),(1201,255,'196.44.98.162','2024-03-09 09:48:40','2024-03-09 09:48:40','WebKit','Chrome','AndroidOS'),(1202,255,'102.89.43.84','2024-03-09 09:49:22','2024-03-09 09:49:22','iPhone','Chrome','iOS'),(1203,255,'102.89.43.84','2024-03-09 09:49:22','2024-03-09 09:49:22','iPhone','Chrome','iOS'),(1204,255,'::1','2024-06-28 18:49:13','2024-06-28 18:49:13','WebKit','Edge','Windows'),(1205,255,'::1','2024-06-28 18:49:13','2024-06-28 18:49:13','WebKit','Edge','Windows'),(1206,255,'::1','2024-06-28 18:52:30','2024-06-28 18:52:30','WebKit','Edge','Windows'),(1207,255,'::1','2024-06-28 18:52:30','2024-06-28 18:52:30','WebKit','Edge','Windows'),(1208,255,'::1','2024-06-30 21:51:14','2024-06-30 21:51:14','WebKit','Chrome','Windows'),(1209,255,'::1','2024-06-30 21:51:14','2024-06-30 21:51:14','WebKit','Chrome','Windows'),(1210,255,'::1','2024-06-30 22:23:04','2024-06-30 22:23:04','WebKit','Chrome','Windows'),(1211,255,'::1','2024-06-30 22:23:04','2024-06-30 22:23:04','WebKit','Chrome','Windows'),(1212,255,'::1','2024-06-30 23:29:15','2024-06-30 23:29:15','WebKit','Chrome','Windows'),(1213,255,'::1','2024-06-30 23:29:15','2024-06-30 23:29:15','WebKit','Chrome','Windows'),(1214,255,'::1','2024-06-30 23:33:17','2024-06-30 23:33:17','WebKit','Chrome','Windows'),(1215,255,'::1','2024-06-30 23:33:17','2024-06-30 23:33:17','WebKit','Chrome','Windows'),(1216,256,'::1','2024-07-01 11:54:09','2024-07-01 11:54:09','WebKit','Edge','Windows'),(1217,256,'::1','2024-07-01 11:54:09','2024-07-01 11:54:09','WebKit','Edge','Windows'),(1218,256,'::1','2024-07-01 12:32:46','2024-07-01 12:32:46','WebKit','Chrome','Windows'),(1219,256,'::1','2024-07-01 12:32:47','2024-07-01 12:32:47','WebKit','Chrome','Windows');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `Description` varchar(255) NOT NULL DEFAULT 'Cryptocurrency Funding',
  `type` varchar(255) NOT NULL DEFAULT 'Credit',
  `accountname` text DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `proof` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (121,'REME/OQFL5LUE-2024',255,'1000',NULL,'Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/J2rlKBwqZh93sGBUyBxPzXWgb6DbCPV0zTe4ZwOV.jpg','2024-06-30 17:33:55','2024-06-30 17:33:55'),(122,'REME/V6DBJEHC-2024',255,'233',NULL,'Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/WXpL971d0otKEYvzyaO0s1kw2n4gdCOEWXhpg2z3.jpg','2024-06-30 17:36:18','2024-06-30 17:36:18'),(123,'REME/6VT0Z8UM-2024',255,'300.00',NULL,'Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/ISX9kwlFQBEqWdVchfZhXA4GDaY8iox3twRK1Dyx.jpg','2024-06-30 17:39:53','2024-06-30 17:39:53'),(124,'REME/AHOED3XG-2024',255,'500','Bitcoin','Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/dOOGnXosGTDhoSeovsNZDp35DzD2yGBtB8xBwV9v.jpg','2024-06-30 20:38:02','2024-06-30 20:38:02'),(125,'REME/QDPGYJHP-2024',255,'300.00','USDT','Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/IMAvms3TEy4HAo4LAHbYOlJG3uO2xKJNirDULCTE.jpg','2024-06-30 20:44:46','2024-06-30 20:44:46'),(126,'REME/BWZOPQO6-2026',256,'500','Bitcoin','Cryptocurrency Funding','Credit',NULL,NULL,'Pending','uploads/IVgEYK2mDqxbFk104CfavFvKwBhOJHYUDcSSUb7q.jpg','2026-07-04 12:32:00','2026-07-04 12:32:00');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) DEFAULT NULL,
  `date` timestamp(6) NULL DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(11) NOT NULL DEFAULT 'USD',
  `columns` varchar(255) DEFAULT NULL,
  `bal` varchar(255) DEFAULT NULL,
  `accountname` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `accountnumber` text DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `Accounttype` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `bankaddress` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `swiftcode` varchar(50) DEFAULT NULL,
  `iban` varchar(35) DEFAULT NULL,
  `to_deduct` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `paydetails` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

LOCK TABLES `withdrawals` WRITE;
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
INSERT INTO `withdrawals` VALUES (249,'REME/2A0BBIJX-2024',NULL,255,'5000','USD',NULL,NULL,'Self','Credit','88267380879','Remedy','Savings Account','Birth day Gift','301 East Water Street, Charlottesville, VA 22904┬áVirginia','Nigeria',NULL,NULL,NULL,'Processed','Crypto Deposit',NULL,'2024-03-22 10:35:00','2024-03-09 09:35:11',NULL,NULL),(250,'REME-ZX91TRO8-NV8A1','2024-06-28 19:25:21.000000',255,'500','USD',NULL,'499470',NULL,NULL,'evakoac929@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500','Processed','Paypal',NULL,NULL,'2024-06-30 13:46:43',NULL,NULL),(251,'REME-C3HXA26L-TDJ2I','2024-06-28 19:36:00.000000',255,'1000','USD',NULL,'498470','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com',NULL,NULL,'Paypal',NULL,NULL,NULL,NULL,'1000','Pending','Paypal',NULL,'2024-06-28 19:36:00','2024-06-28 19:36:00',NULL,NULL),(252,'REME/IA5AZVJM-YASDQ','2024-06-28 21:29:48.000000',255,'500','USD',NULL,'497970','Bitcoin',NULL,'16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY','Cryptocurrency Transaction',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'500','Pending','Cryptocurrency',NULL,'2024-06-28 21:29:48','2024-06-28 21:29:48',NULL,NULL),(253,'REME-RAOT5RKX-ZQCKZ','2024-06-28 21:44:01.000000',255,'300','USD',NULL,'497670','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Skrill',NULL,'Skrill transaction',NULL,NULL,NULL,NULL,'300','Pending','Skrill',NULL,'2024-06-28 21:44:01','2024-06-28 21:44:01',NULL,NULL),(254,'REME-PWAZ8BDT-A6EUC','2024-06-28 22:08:04.000000',255,'300','USD',NULL,'497370','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Google Pay',NULL,'Google Pay transaction',NULL,NULL,NULL,NULL,'300','Pending','Google Pay',NULL,'2024-06-28 22:08:04','2024-06-28 22:08:04',NULL,NULL),(255,'REME/A3V8R3SR-0TVEM','2024-06-29 19:07:11.000000',255,'300','USD',NULL,'497070','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','International Wire Transfer',NULL,'2024-06-29 19:07:11','2024-06-29 19:07:11',NULL,NULL),(256,'REME/FNDB2UN3-2RD41','2024-06-29 20:41:24.000000',255,'300','USD',NULL,'496770','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY',NULL,'16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY','Cryptocurrency Transaction',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'300','Pending','Cryptocurrency',NULL,'2024-06-29 20:41:24','2024-06-29 20:41:24',NULL,NULL),(257,'REME-NNY5YHX0-BFQZR','2024-06-29 23:00:20.000000',255,'233','USD',NULL,'496537',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-29 23:00:20','2024-06-29 23:00:20',NULL,NULL),(258,'REME/VQU2QEXW-ULPYG','2024-06-29 23:18:25.000000',255,'300','USD',NULL,'496237','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-29 23:18:25','2024-06-29 23:18:25',NULL,NULL),(259,'REME/W9L5JSPU-UCLYN','2024-06-29 23:21:23.000000',255,NULL,'USD',NULL,'496237',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-29 23:21:23','2024-06-29 23:21:23',NULL,NULL),(260,'REME/LD4XMXKB-BMHQP','2024-06-29 23:23:09.000000',255,'300','USD',NULL,'495937','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-29 23:23:09','2024-06-29 23:23:09',NULL,NULL),(261,'REME/7HHLJQHT-UBW3T','2024-06-29 23:25:51.000000',255,'300','USD',NULL,'495637','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-29 23:25:51','2024-06-29 23:25:51',NULL,NULL),(262,'REME/IG84NVRR-HUHTL','2024-06-30 08:00:14.000000',255,'300.00','USD',NULL,'495337','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq','Debit','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq','Cryptocurrency Transaction',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'300.00','Pending','Local Transfer',NULL,'2024-06-30 08:00:14','2024-06-30 08:00:14',NULL,NULL),(263,'REME/MXF3U7TE-Q941R','2024-06-30 08:01:44.000000',255,NULL,'USD',NULL,'495337',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-30 08:01:44','2024-06-30 08:01:44',NULL,NULL),(264,'REME/PXOHOKQB-AHNMY','2024-06-30 08:03:10.000000',255,NULL,'USD',NULL,'495337',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-30 08:03:10','2024-06-30 08:03:10',NULL,NULL),(265,'REME-KLABGIHJ-TRZLK','2024-06-30 08:05:30.000000',255,'233','USD',NULL,'495104',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 08:05:30','2024-06-30 08:05:30',NULL,NULL),(266,'REME/PWRNKU1U-QFDYX','2024-06-30 08:08:02.000000',255,'300','USD',NULL,'494804','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-30 08:08:02','2024-06-30 08:08:02',NULL,NULL),(267,'REME/0BRY4LXC-YW4WI','2024-06-30 08:08:45.000000',255,'300','USD',NULL,'494504','eva kovac kovac kovac',NULL,'1234567890','First bank limited',NULL,'Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-30 08:08:45','2024-06-30 08:08:45',NULL,NULL),(268,'REME/SJVEBPUY-ESFMK','2024-06-30 08:28:49.000000',255,'300','USD',NULL,'494204','eva kovac kovac kovac',NULL,'1234567890','First bank limited','Online Banking','Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-30 08:28:49','2024-06-30 08:28:49',NULL,NULL),(269,'REME/2NXSD030-P2HVH','2024-06-30 08:31:17.000000',255,'300','USD',NULL,'493904','eva kovac kovac kovac',NULL,'1234567890','First bank limited','Online Banking','Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-30 08:31:17','2024-06-30 08:31:17',NULL,NULL),(270,'REME/2P39PHHG-IDRJN','2024-06-30 08:35:25.000000',255,'300','USD',NULL,'493604','eva kovac kovac kovac',NULL,'1234567890','Barclay','Online Banking','Schol fees payment',NULL,NULL,NULL,'534444','300','Pending','Wire Transfer',NULL,'2024-06-30 08:35:25','2024-06-30 08:35:25',NULL,NULL),(271,'REME/PXUBZYAO-MORBG','2024-06-30 08:44:54.000000',255,'233','USD',NULL,'493371','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY','Debit','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY',NULL,NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'233','Pending','Local Transfer',NULL,'2024-06-30 08:44:54','2024-06-30 08:44:54',NULL,NULL),(272,'REME/KK7CPAY5-N5KJM','2024-06-30 08:51:52.000000',255,'233','USD',NULL,'493138','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY','Debit','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY','Bitcoin',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'233','Pending','Local Transfer',NULL,'2024-06-30 08:51:52','2024-06-30 08:51:52',NULL,NULL),(273,'REME/0PPJENNW-F0E6U','2024-06-30 08:55:40.000000',255,'300.00','USD',NULL,'492838','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq','Debit','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq','USDT',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'300.00','Pending','Local Transfer',NULL,'2024-06-30 08:55:40','2024-06-30 08:55:40',NULL,NULL),(274,'REME/AS6RXAK6-8LKKQ','2024-06-30 09:02:17.000000',255,'300.00','USD',NULL,'492538','16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq',NULL,'16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq','USDT',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'300.00','Pending','Cryptocurrency',NULL,'2024-06-30 09:02:17','2024-06-30 09:02:17',NULL,NULL),(275,'REME-CCE5Q5JO-34Q9J','2024-06-30 09:15:07.000000',255,'500','USD',NULL,'492038',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'500','Pending','Paypal',NULL,'2024-06-30 09:15:07','2024-06-30 09:15:07',NULL,NULL),(276,'RE4AJTT5LDGKKWB','2024-06-30 09:18:52.000000',255,'233','USD',NULL,'491805',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 09:18:52','2024-06-30 09:18:52',NULL,NULL),(277,'REJQRM8RUPCDROS','2024-06-30 09:28:32.000000',255,'233','USD',NULL,'491572',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 09:28:32','2024-06-30 09:28:32',NULL,NULL),(278,'REME/IZDATSEA-DXKGB','2024-06-30 09:28:56.000000',255,NULL,'USD',NULL,'491572',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-30 09:28:56','2024-06-30 09:28:56',NULL,NULL),(279,'REYVI0SIZSU7YAK','2024-06-30 09:30:13.000000',255,'300.00','USD',NULL,'491272',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'300.00','Pending','Paypal',NULL,'2024-06-30 09:30:13','2024-06-30 09:30:13',NULL,NULL),(280,'REMKT6SNWYSZR7K','2024-06-30 09:31:15.000000',255,'300.00','USD',NULL,'490972',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'300.00','Pending','Paypal',NULL,'2024-06-30 09:31:15','2024-06-30 09:31:15',NULL,NULL),(281,'REASVIRVPC9HCJU','2024-06-30 09:33:38.000000',255,'100','USD',NULL,'490872',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'100','Pending','Paypal',NULL,'2024-06-30 09:33:38','2024-06-30 09:33:38',NULL,NULL),(282,'REEYL6QUMH0CHRC','2024-06-30 09:35:35.000000',255,'233','USD',NULL,'490639',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 09:35:35','2024-06-30 09:35:35',NULL,NULL),(283,'REEYL6QUMH0CHRC','2024-06-30 09:36:00.000000',255,'233','USD',NULL,'490406',NULL,NULL,NULL,'Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 09:36:00','2024-06-30 09:36:00',NULL,NULL),(284,'REEYL6QUMH0CHRC','2024-06-30 09:38:20.000000',255,'233','USD',NULL,'490173','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 09:38:20','2024-06-30 09:38:20',NULL,NULL),(285,'REMSIFPA0HWYVQC','2024-06-30 09:39:46.000000',255,'233','USD',NULL,'489940','evakovac929@gmail.com',NULL,'evakovac929@gmail.com','Skrill',NULL,'Skrill transaction',NULL,NULL,NULL,NULL,'233','Pending','Skrill',NULL,'2024-06-30 09:39:46','2024-06-30 09:39:46',NULL,NULL),(286,'REMFIRUEMNCIRIQ','2024-06-30 09:42:39.000000',255,'500','USD',NULL,'489440','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Google Pay',NULL,'Google Pay transaction',NULL,NULL,NULL,NULL,'500','Pending','Google Pay',NULL,'2024-06-30 09:42:39','2024-06-30 09:42:39',NULL,NULL),(287,'REPJXDUJBMOBEFP','2024-06-30 09:44:48.000000',255,'1000','USD',NULL,'488440','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Transfer Wise',NULL,'Transfer Wise transaction',NULL,NULL,NULL,NULL,'1000','Pending','Transfer Wise',NULL,'2024-06-30 09:44:48','2024-06-30 09:44:48',NULL,NULL),(288,'REKRXFKZ80R4XNR','2024-06-30 09:51:30.000000',255,'100','USD',NULL,'488340','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Payoneer',NULL,'Payoneer transaction',NULL,NULL,NULL,NULL,'100','Pending','Payoneer',NULL,'2024-06-30 09:51:30','2024-06-30 09:51:30',NULL,NULL),(289,'REME/QKTA5HLQ-1ZCSZ','2024-06-30 09:52:22.000000',255,NULL,'USD',NULL,'488340',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-30 09:52:22','2024-06-30 09:52:22',NULL,NULL),(290,'REME/53XMBNRZ-IOASS','2024-06-30 09:53:50.000000',255,NULL,'USD',NULL,'488340',NULL,'Debit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending','Local Transfer',NULL,'2024-06-30 09:53:50','2024-06-30 09:53:50',NULL,NULL),(291,'REDXSYZ83FMO9TZ','2024-06-30 09:56:47.000000',255,'100','USD',NULL,'488240','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Payoneer',NULL,'Payoneer transaction',NULL,NULL,NULL,NULL,'100','Pending','Payoneer',NULL,'2024-06-30 09:56:47','2024-06-30 09:56:47',NULL,NULL),(292,'RE8H5XXQAMQXRCA','2024-06-30 10:00:34.000000',255,'200','USD',NULL,'488040','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Payoneer',NULL,'Payoneer transaction',NULL,NULL,NULL,NULL,'200','Pending','Payoneer',NULL,'2024-06-30 10:00:34','2024-06-30 10:00:34',NULL,NULL),(293,'REROMRHJVW0E8Z0','2024-06-30 10:07:58.000000',255,'233','USD',NULL,'487807','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Payoneer',NULL,'Payoneer transaction',NULL,NULL,NULL,NULL,'233','Processed','Payoneer',NULL,NULL,'2024-06-30 13:47:36',NULL,NULL),(294,'RE7N92B1JW4XONI','2024-06-30 10:19:06.000000',255,'500','USD',NULL,'487307','evakovac929@gmail.com',NULL,'evakovac929@gmail.com','Transfer Wise',NULL,'Transfer Wise transaction',NULL,NULL,NULL,NULL,'500','Processed','Transfer Wise',NULL,NULL,'2024-06-30 13:43:47',NULL,NULL),(295,'RE2HIF51MH0YCCU','2024-06-30 10:31:23.000000',255,'233','USD',NULL,'487074','evakovac929@gmail.com',NULL,'evakovac929@gmail.com','Transfer Wise',NULL,'Transfer Wise transaction',NULL,NULL,NULL,NULL,'233','Pending','Transfer Wise',NULL,'2024-06-30 10:31:23','2024-06-30 10:31:23',NULL,NULL),(296,'REZYSCOULFLFGGY','2024-06-30 10:52:46.000000',255,'1000','USD',NULL,'485074','eva kovac kovac kovac',NULL,'eva kovac kovac kovac','Western Union','Western Union','Schol fees payment',NULL,'Netherland Antilles',NULL,NULL,'1000','pending','Western Union',NULL,NULL,'2024-06-30 13:35:15','634345','Lagos'),(297,'RENYHT93MRVYBZ5','2024-06-30 12:37:35.000000',255,'500','USD',NULL,'484574','bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r',NULL,'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r','Bitcoin',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'500','pending','Cryptocurrency',NULL,NULL,'2024-06-30 13:31:59',NULL,NULL),(298,'RENYHT93MRVYBZ5','2024-06-30 12:55:34.000000',255,'500','USD',NULL,'484074','bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r',NULL,'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r','Bitcoin',NULL,'Cryptocurrency',NULL,NULL,NULL,NULL,'500','Processed','Cryptocurrency',NULL,NULL,'2024-06-30 14:11:16',NULL,NULL),(299,'REJDI6UXEK4CDFY','2024-06-30 12:57:22.000000',255,'500','USD',NULL,'483574','evakoac929@gmail.com',NULL,'evakoac929@gmail.com','Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'500','Processed','Paypal',NULL,NULL,'2024-06-30 13:53:03',NULL,NULL),(300,'REKYMOFCCNW3SOM','2024-06-30 12:59:40.000000',255,'233','USD',NULL,'483341','eva kovac kovac kovac',NULL,'eva kovac kovac kovac','Western Union','Western Union','ttrttr',NULL,'Bahamas',NULL,NULL,'233','Processed','Western Union',NULL,NULL,'2024-06-30 13:52:14','634345','Lagos'),(301,'REHOUA5AZ7PBUYO','2024-06-30 13:00:57.000000',255,'300','USD',NULL,'483041','eva kovac kovac kovac',NULL,'1234567890','Barclay','Online Banking','Schol fees payment',NULL,NULL,NULL,'534444','300','Processed','Wire Transfer',NULL,'2024-05-31 14:50:00','2024-06-30 13:50:33',NULL,NULL),(302,'REQ2MKE2G0LWRVY','2024-06-30 13:04:12.000000',255,'300','USD',NULL,'482741','eva kovac kovac kovac',NULL,'1234567890','Barclay limite','Online Banking','Schol fees payment',NULL,NULL,NULL,'534444','300','Processed','Wire Transfer',NULL,NULL,'2024-06-30 13:49:07',NULL,NULL),(303,'REDKZTFHLOG1FGP','2024-06-30 13:55:50.000000',255,'500','USD',NULL,'482241','evakoac929@gmail.com',NULL,'evakoac929@gmail.com','Payoneer',NULL,'Payoneer transaction',NULL,NULL,NULL,NULL,'500','Processed','Payoneer',NULL,NULL,'2024-06-30 13:56:44',NULL,NULL),(304,'RERIRLDKQWI116L','2024-06-30 13:57:29.000000',255,'233','USD',NULL,'482008','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Transfer Wise',NULL,'Transfer Wise transaction',NULL,NULL,NULL,NULL,'233','Processed','Transfer Wise',NULL,NULL,'2024-06-30 13:59:18',NULL,NULL),(305,'REQELCAKKTU44AM','2024-06-30 14:00:48.000000',255,'300.00','USD',NULL,'481708','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Google Pay',NULL,'Google Pay transaction',NULL,NULL,NULL,NULL,'300.00','Pending','Google Pay',NULL,'2024-06-30 14:00:48','2024-06-30 14:00:48',NULL,NULL),(306,'REQELCAKKTU44AM','2024-06-30 14:11:49.000000',255,'300.00','USD',NULL,'481408','nulledtechy@gmail.com',NULL,'nulledtechy@gmail.com','Google Pay',NULL,'Google Pay transaction',NULL,NULL,NULL,NULL,'300.00','Processed','Google Pay',NULL,NULL,'2024-06-30 14:13:09',NULL,NULL),(307,'REGQ5YCBXRUGDLS','2024-06-30 14:14:24.000000',255,'500','USD',NULL,'480908','admin@admin.com',NULL,'admin@admin.com','Skrill',NULL,'Skrill transaction',NULL,NULL,NULL,NULL,'500','Processed','Skrill',NULL,NULL,'2024-06-30 14:16:28',NULL,NULL),(308,'REME/8IZ2DVXK-OESPI',NULL,255,'500','USD',NULL,NULL,'Self','Credit','88267380879','Remedy','Savings Account','deposit','301 East Water Street, Charlottesville, VA 22904┬áVirginia','Nigeria',NULL,NULL,NULL,'Processed','Local transfer',NULL,'2024-06-30 15:35:00','2024-06-30 14:35:50',NULL,NULL),(309,'REJQVMXHWKMUNFU','2024-06-30 15:44:41.000000',255,'233','USD',NULL,'481175','remedynulled@gmail.com',NULL,'remedynulled@gmail.com','Paypal',NULL,'Paypal',NULL,NULL,NULL,NULL,'233','Pending','Paypal',NULL,'2024-06-30 15:44:41','2024-06-30 15:44:41',NULL,NULL);
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tp__transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp__transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan` varchar(250) DEFAULT NULL,
  `user_plan_id` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp__transactions`
--

LOCK TABLES `tp__transactions` WRITE;
/*!40000 ALTER TABLE `tp__transactions` DISABLE KEYS */;
INSERT INTO `tp__transactions` VALUES (112,'Standard',18,93,'0.046','ROI','2022-08-09 10:29:04','2022-08-09 10:29:04'),(113,'Standard',18,93,'0.046','ROI','2022-08-09 10:52:59','2022-08-09 10:52:59'),(115,'Standard',NULL,93,'200','Investment capital','2022-08-09 11:22:42','2022-08-09 11:22:42'),(116,'SignUp Bonus',NULL,93,'5','Bonus','2022-08-16 06:27:32','2022-08-16 06:27:32'),(117,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-08-30 06:13:40','2022-08-30 06:13:40'),(118,'Credit',NULL,151,'40','Ref_bonus','2022-08-30 06:13:40','2022-08-30 06:13:40'),(119,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-08-30 08:14:20','2022-08-30 08:14:20'),(120,'Credit',NULL,151,'40','Ref_bonus','2022-08-30 08:14:20','2022-08-30 08:14:20'),(121,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-08-30 08:43:51','2022-08-30 08:43:51'),(122,'Credit',NULL,151,'40','Ref_bonus','2022-08-30 08:43:51','2022-08-30 08:43:51'),(123,'Credit',NULL,158,'200','balance','2022-08-30 10:32:05','2022-08-30 10:32:05'),(124,'Credit reversal',NULL,158,'100','balance','2022-08-30 10:32:27','2022-08-30 10:32:27'),(125,'Subscribed MT4 Trading',NULL,93,'30','MT4 Trading','2022-08-31 05:19:19','2022-08-31 05:19:19'),(126,'Subscribed MT4 Trading',NULL,93,'40','MT4 Trading','2022-08-31 09:01:26','2022-08-31 09:01:26'),(127,'Standard',NULL,93,'200','Plan purchase','2022-09-02 15:22:41','2022-09-02 15:22:41'),(128,'Standard',NULL,93,'200','Investment capital','2022-09-02 16:44:49','2022-09-02 16:44:49'),(129,'Standard',NULL,93,'200','Plan purchase','2022-09-02 18:02:31','2022-09-02 18:02:31'),(130,'Subscribed MT4 Trading',NULL,93,NULL,'MT4 Trading','2022-09-20 01:40:02','2022-09-20 01:40:02'),(131,'Subscribed MT4 Trading',NULL,93,'30','MT4 Trading','2022-09-20 09:26:40','2022-09-20 09:26:40'),(132,'Subscribed MT4 Trading',NULL,93,'30','MT4 Trading','2022-09-21 00:14:49','2022-09-21 00:14:49'),(133,'Credit',NULL,156,'200000','Profit','2022-10-28 05:59:52','2022-10-28 05:59:52'),(134,'Credit reversal',NULL,156,'200000','balance','2022-10-28 06:00:20','2022-10-28 06:00:20'),(135,'Credit reversal',NULL,156,'200000','Profit','2022-10-28 06:00:34','2022-10-28 06:00:34'),(136,'Credit',NULL,156,'200000','balance','2022-10-28 06:01:01','2022-10-28 06:01:01'),(137,'Credit',NULL,156,'200','balance','2022-10-28 06:01:17','2022-10-28 06:01:17'),(138,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-10-28 06:05:21','2022-10-28 06:05:21'),(139,'Credit',NULL,151,'40','Ref_bonus','2022-10-28 06:05:21','2022-10-28 06:05:21'),(140,'Credit',NULL,158,'100','balance','2022-10-29 00:26:45','2022-10-29 00:26:45'),(141,'Credit',NULL,93,'100','balance','2022-11-04 06:43:24','2022-11-04 06:43:24'),(142,'Credit',NULL,93,'100','Profit','2022-11-04 06:43:56','2022-11-04 06:43:56'),(143,'Credit',NULL,93,'100','Ref_Bonus','2022-11-04 06:44:45','2022-11-04 06:44:45'),(144,'Credit',NULL,93,'100','Bonus','2022-11-04 06:45:11','2022-11-04 06:45:11'),(145,'Credit',NULL,93,'100','Profit','2022-11-04 06:46:01','2022-11-04 06:46:01'),(146,'Credit',NULL,93,'100','Profit','2022-11-04 06:47:18','2022-11-04 06:47:18'),(147,'Debit',NULL,93,'100','Bonus','2022-11-04 06:47:38','2022-11-04 06:47:38'),(148,'Debit',NULL,93,'100','Ref_Bonus','2022-11-04 06:47:58','2022-11-04 06:47:58'),(149,'Debit',NULL,93,'100','Profit','2022-11-04 06:48:22','2022-11-04 06:48:22'),(150,'Debit',NULL,93,'100','balance','2022-11-04 06:48:38','2022-11-04 06:48:38'),(151,'Credit',NULL,93,'100','Deposit','2022-11-04 06:48:52','2022-11-04 06:48:52'),(152,'Debit',NULL,93,'100','Deposit','2022-11-04 06:49:11','2022-11-04 06:49:11'),(153,'Credit',NULL,93,'100','Ref_Bonus','2022-11-05 01:26:44','2022-11-05 01:26:44'),(154,'Credit',NULL,156,'100','balance','2022-11-05 01:36:03','2022-11-05 01:36:03'),(155,'Credit',NULL,158,'100','balance','2022-11-05 01:36:03','2022-11-05 01:36:03'),(156,'Debit',NULL,93,'100','balance','2022-11-05 01:36:27','2022-11-05 01:36:27'),(157,'Debit',NULL,156,'100','balance','2022-11-05 01:36:27','2022-11-05 01:36:27'),(158,'Debit',NULL,158,'100','balance','2022-11-05 01:36:27','2022-11-05 01:36:27'),(159,'Purchase Course',NULL,93,'2000','Education','2022-11-05 03:23:24','2022-11-05 03:23:24'),(160,'Standard',NULL,93,'200','Plan purchase','2022-11-10 05:17:43','2022-11-10 05:17:43'),(161,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-10 05:53:37','2022-11-10 05:53:37'),(162,'Credit',NULL,151,'40','Ref_bonus','2022-11-10 05:53:37','2022-11-10 05:53:37'),(163,'Credit',NULL,93,'100','balance','2022-11-10 07:09:20','2022-11-10 07:09:20'),(164,'Credit',NULL,156,'100','balance','2022-11-10 07:09:20','2022-11-10 07:09:20'),(165,'Credit',NULL,158,'100','balance','2022-11-10 07:09:20','2022-11-10 07:09:20'),(166,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:28:03','2022-11-11 02:28:03'),(167,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:36:46','2022-11-11 02:36:46'),(168,'Credit',NULL,151,'40','Ref_bonus','2022-11-11 02:36:46','2022-11-11 02:36:46'),(169,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:40:38','2022-11-11 02:40:38'),(170,'Credit',NULL,151,'40','Ref_bonus','2022-11-11 02:40:38','2022-11-11 02:40:38'),(171,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:40:49','2022-11-11 02:40:49'),(172,'Credit',NULL,151,'40','Ref_bonus','2022-11-11 02:40:49','2022-11-11 02:40:49'),(173,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:42:13','2022-11-11 02:42:13'),(174,'Credit',NULL,151,'40','Ref_bonus','2022-11-11 02:42:13','2022-11-11 02:42:13'),(175,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-11 02:47:09','2022-11-11 02:47:09'),(176,'Credit',NULL,151,'40','Ref_bonus','2022-11-11 02:47:09','2022-11-11 02:47:09'),(177,'Deposit Bonus for $ 100 deposited',NULL,93,'2','Bonus','2022-11-17 03:20:39','2022-11-17 03:20:39'),(178,'Credit',NULL,151,'40','Ref_bonus','2022-11-17 03:20:39','2022-11-17 03:20:39'),(179,'Standard',NULL,93,'200','Investment capital for cancelled plan','2022-11-25 12:47:05','2022-11-25 12:47:05'),(180,'Standard',NULL,170,'200','Plan purchase','2023-02-13 19:14:24','2023-02-13 19:14:24'),(181,'Standard',22,170,'80','ROI','2023-02-13 20:10:14','2023-02-13 20:10:14'),(182,'Standard',22,170,'80','ROI','2023-02-13 21:05:44','2023-02-13 21:05:44'),(183,'Standard',22,170,'80','ROI','2023-02-13 22:00:42','2023-02-13 22:00:42'),(184,'Standard',22,170,'80','ROI','2023-02-13 22:50:28','2023-02-13 22:50:28'),(185,'Standard',NULL,170,'200','Investment capital','2023-02-13 23:15:34','2023-02-13 23:15:34'),(186,'Credit',NULL,172,'500','Profit','2023-02-23 15:53:52','2023-02-23 15:53:52'),(187,'Credit',NULL,171,'2006','Profit','2023-02-23 18:04:19','2023-02-23 18:04:19'),(188,'Credit',NULL,171,'1000','Deposit','2023-02-23 18:04:34','2023-02-23 18:04:34'),(189,'Credit',NULL,171,'200','balance','2023-02-23 18:04:49','2023-02-23 18:04:49'),(190,'Credit',NULL,171,'2006','balance','2023-02-23 18:05:02','2023-02-23 18:05:02'),(191,'Credit',NULL,181,'7000','Deposit','2023-03-15 12:59:00','2023-03-15 12:59:00'),(192,'Credit',NULL,181,'906677','Profit','2023-03-15 12:59:23','2023-03-15 12:59:23'),(193,'Credit',NULL,178,'5000.00','Profit','2023-03-27 01:02:28','2023-03-27 01:02:28'),(194,'Credit',NULL,190,'400000','Profit','2023-03-27 13:56:00','2023-03-27 13:56:00'),(195,'Credit',NULL,197,'5000.00','Deposit','2023-04-03 19:15:38','2023-04-03 19:15:38'),(196,'Credit',NULL,199,'700','Profit','2023-04-11 15:15:24','2023-04-11 15:15:24'),(197,'Basic Plan',NULL,197,'200','Plan purchase','2023-04-20 11:35:36','2023-04-20 11:35:36'),(198,'Basic Plan',NULL,197,'300','Plan purchase','2023-04-24 21:36:53','2023-04-24 21:36:53'),(199,'Basic Plan',NULL,197,'300','Plan purchase','2023-04-24 21:40:35','2023-04-24 21:40:35'),(200,'AMATUER AI',NULL,197,'200','Plan purchase','2023-04-24 23:02:27','2023-04-24 23:02:27'),(201,'Credit',NULL,197,'200','Profit','2023-04-25 01:34:48','2023-04-25 01:34:48'),(202,'Credit',NULL,197,'300','Profit','2023-04-25 01:39:45','2023-04-25 01:39:45'),(203,'Credit reversal',NULL,197,'2000','balance','2023-04-25 01:56:33','2023-04-25 01:56:33'),(204,'Credit',NULL,199,'500','Bonus','2023-04-25 06:29:58','2023-04-25 06:29:58'),(205,'AMATUER AI',23,197,'4','ROI','2023-04-25 09:59:17','2023-04-25 09:59:17'),(206,'AMATUER AI',24,197,'6','ROI','2023-04-25 09:59:22','2023-04-25 09:59:22'),(207,'AMATUER AI',25,197,'6','ROI','2023-04-25 09:59:23','2023-04-25 09:59:23'),(208,'AMATUER AI',26,197,'4','ROI','2023-04-25 09:59:24','2023-04-25 09:59:24'),(209,'AMATUER AI',23,197,'4','ROI','2023-04-25 09:59:47','2023-04-25 09:59:47'),(210,'AMATUER AI',23,197,'4','ROI','2023-04-25 10:00:11','2023-04-25 10:00:11'),(211,'AMATUER AI',NULL,197,'500','Plan purchase','2023-04-25 10:03:58','2023-04-25 10:03:58'),(212,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:05:09','2023-04-25 10:05:09'),(213,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:05:15','2023-04-25 10:05:15'),(214,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:10:12','2023-04-25 10:10:12'),(215,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:15:10','2023-04-25 10:15:10'),(216,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:15:19','2023-04-25 10:15:19'),(217,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:20:10','2023-04-25 10:20:10'),(218,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:20:17','2023-04-25 10:20:17'),(219,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:25:10','2023-04-25 10:25:10'),(220,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:25:18','2023-04-25 10:25:18'),(221,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:30:13','2023-04-25 10:30:13'),(222,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:35:10','2023-04-25 10:35:10'),(223,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:35:18','2023-04-25 10:35:18'),(224,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:40:10','2023-04-25 10:40:10'),(225,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:40:20','2023-04-25 10:40:20'),(226,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:45:09','2023-04-25 10:45:09'),(227,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:50:11','2023-04-25 10:50:11'),(228,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:50:20','2023-04-25 10:50:20'),(229,'AMATUER AI',23,197,'40','ROI','2023-04-25 10:55:08','2023-04-25 10:55:08'),(230,'AMATUER AI',27,197,'100','ROI','2023-04-25 10:55:14','2023-04-25 10:55:14'),(231,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:00:10','2023-04-25 11:00:10'),(232,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:00:20','2023-04-25 11:00:20'),(233,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:05:11','2023-04-25 11:05:11'),(234,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:10:13','2023-04-25 11:10:13'),(235,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:10:22','2023-04-25 11:10:22'),(236,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:15:10','2023-04-25 11:15:10'),(237,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:15:19','2023-04-25 11:15:19'),(238,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:20:11','2023-04-25 11:20:11'),(239,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:25:12','2023-04-25 11:25:12'),(240,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:25:19','2023-04-25 11:25:19'),(241,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:30:10','2023-04-25 11:30:10'),(242,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:30:20','2023-04-25 11:30:20'),(243,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:35:12','2023-04-25 11:35:12'),(244,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:35:21','2023-04-25 11:35:21'),(245,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:40:12','2023-04-25 11:40:12'),(246,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:45:10','2023-04-25 11:45:10'),(247,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:45:18','2023-04-25 11:45:18'),(248,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:50:10','2023-04-25 11:50:10'),(249,'AMATUER AI',27,197,'100','ROI','2023-04-25 11:50:12','2023-04-25 11:50:12'),(250,'AMATUER AI',23,197,'40','ROI','2023-04-25 11:55:10','2023-04-25 11:55:10'),(251,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:00:14','2023-04-25 12:00:14'),(252,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:00:21','2023-04-25 12:00:21'),(253,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:05:11','2023-04-25 12:05:11'),(254,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:05:19','2023-04-25 12:05:19'),(255,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:10:13','2023-04-25 12:10:13'),(256,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:10:18','2023-04-25 12:10:18'),(257,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:15:10','2023-04-25 12:15:10'),(258,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:20:11','2023-04-25 12:20:11'),(259,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:20:18','2023-04-25 12:20:18'),(260,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:25:12','2023-04-25 12:25:12'),(261,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:25:21','2023-04-25 12:25:21'),(262,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:30:13','2023-04-25 12:30:13'),(263,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:35:10','2023-04-25 12:35:10'),(264,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:35:18','2023-04-25 12:35:18'),(265,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:40:11','2023-04-25 12:40:11'),(266,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:40:19','2023-04-25 12:40:19'),(267,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:45:10','2023-04-25 12:45:10'),(268,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:45:15','2023-04-25 12:45:15'),(269,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:50:10','2023-04-25 12:50:10'),(270,'AMATUER AI',23,197,'40','ROI','2023-04-25 12:55:12','2023-04-25 12:55:12'),(271,'AMATUER AI',27,197,'100','ROI','2023-04-25 12:55:18','2023-04-25 12:55:18'),(272,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:00:12','2023-04-25 13:00:12'),(273,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:00:21','2023-04-25 13:00:21'),(274,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:05:10','2023-04-25 13:05:10'),(275,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:10:11','2023-04-25 13:10:11'),(276,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:10:16','2023-04-25 13:10:16'),(277,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:15:11','2023-04-25 13:15:11'),(278,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:15:15','2023-04-25 13:15:15'),(279,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:20:12','2023-04-25 13:20:12'),(280,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:20:19','2023-04-25 13:20:19'),(281,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:25:12','2023-04-25 13:25:12'),(282,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:30:12','2023-04-25 13:30:12'),(283,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:30:20','2023-04-25 13:30:20'),(284,'AMATUER AI',23,197,'40','ROI','2023-04-25 13:35:13','2023-04-25 13:35:13'),(285,'AMATUER AI',27,197,'100','ROI','2023-04-25 13:35:21','2023-04-25 13:35:21'),(286,'Credit',NULL,197,'700','balance','2023-08-07 11:20:38','2023-08-07 11:20:38'),(287,'Credit',NULL,197,'700','balance','2023-08-07 11:24:17','2023-08-07 11:24:17'),(288,'Credit',NULL,197,'700','balance','2023-08-07 11:33:46','2023-08-07 11:33:46'),(289,'Credit',NULL,197,'450.00','balance','2023-08-07 11:34:54','2023-08-07 11:34:54'),(290,'Credit',NULL,197,'200','balance','2023-08-07 11:40:17','2023-08-07 11:40:17'),(291,'Credit reversal',NULL,197,'200','balance','2023-08-07 11:42:17','2023-08-07 11:42:17'),(292,'Credit',NULL,197,'7000','balance','2023-08-07 11:46:51','2023-08-07 11:46:51'),(293,'Credit',NULL,197,'450.00','balance','2023-08-07 11:48:38','2023-08-07 11:48:38'),(294,'Credit reversal',NULL,197,'45000','balance','2023-08-07 11:49:52','2023-08-07 11:49:52'),(295,'Credit',NULL,210,'70000','balance','2023-08-09 01:34:51','2023-08-09 01:34:51'),(296,'Credit',NULL,212,'500','balance','2023-08-13 18:11:50','2023-08-13 18:11:50'),(297,'Credit',NULL,220,'500','balance','2023-08-14 11:05:19','2023-08-14 11:05:19'),(298,'Credit',NULL,218,'500','balance','2023-08-14 12:20:43','2023-08-14 12:20:43'),(299,'Credit',NULL,218,'5000','balance','2023-08-14 12:23:41','2023-08-14 12:23:41'),(300,'Credit',NULL,219,'5000','balance','2023-08-14 12:34:55','2023-08-14 12:34:55'),(301,'Credit',NULL,222,'500','balance','2023-08-14 12:35:48','2023-08-14 12:35:48'),(302,'Credit',NULL,221,'5000','balance','2023-08-14 12:36:18','2023-08-14 12:36:18'),(303,'Credit',NULL,221,'500','balance','2023-08-14 12:37:05','2023-08-14 12:37:05'),(304,'Credit',NULL,223,'5000','balance','2023-08-14 12:40:38','2023-08-14 12:40:38'),(305,'Credit',NULL,222,'4500','balance','2023-08-14 13:05:14','2023-08-14 13:05:14'),(306,'Credit',NULL,226,'200','balance','2023-08-17 19:28:18','2023-08-17 19:28:18'),(307,'Credit',NULL,218,'200','balance','2023-08-23 06:11:15','2023-08-23 06:11:15'),(308,'Credit',NULL,218,'500','balance','2023-08-23 11:03:11','2023-08-23 11:03:11'),(309,'Credit',NULL,218,'50','balance','2023-08-23 11:06:08','2023-08-23 11:06:08'),(310,'Credit',NULL,239,'700','balance','2023-09-01 00:14:02','2023-09-01 00:14:02'),(311,'Credit',NULL,240,'40000','balance','2023-09-04 12:44:21','2023-09-04 12:44:21'),(312,'Credit',NULL,240,'105000000','balance','2023-09-06 06:08:10','2023-09-06 06:08:10'),(313,'Credit',NULL,241,'1','balance','2023-09-08 06:43:12','2023-09-08 06:43:12'),(314,NULL,NULL,241,'1','balance','2023-09-08 07:33:18','2023-09-08 07:33:18'),(315,'Credit',NULL,241,'15806','balance','2023-09-14 10:07:22','2023-09-14 10:07:22'),(316,'Credit',NULL,255,'5000','balance','2024-03-09 09:35:11','2024-03-09 09:35:11'),(317,'Credit',NULL,255,'500','balance','2024-06-30 14:35:55','2024-06-30 14:35:55'),(318,'Loan',NULL,256,'5000','Loan Credit','2026-06-29 01:52:15','2026-06-29 01:52:15'),(319,'Loan',NULL,256,'5000','Loan Credit','2026-06-29 01:52:19','2026-06-29 01:52:19');
/*!40000 ALTER TABLE `tp__transactions` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `inv_duration` varchar(255) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `last_growth` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profit_earned` float DEFAULT NULL,
  `facility` text DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `purpose` longtext DEFAULT NULL,
  `income` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_plans`
--

LOCK TABLES `user_plans` WRITE;
/*!40000 ALTER TABLE `user_plans` DISABLE KEYS */;
INSERT INTO `user_plans` VALUES (45,NULL,256,'5000','Processed','12',NULL,'2026-06-29 02:49:31','2026-06-29 02:49:31','2026-06-29 01:49:31','2026-06-29 01:52:19',NULL,'Automobile Loans','12','helloo','2,000-5,000'),(46,NULL,256,'5000','Processed','12',NULL,'2026-06-29 02:51:07','2026-06-29 02:51:07','2026-06-29 01:51:07','2026-06-29 01:52:15',NULL,'Automobile Loans','12','helloo','2,000-5,000');
/*!40000 ALTER TABLE `user_plans` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (2,9,NULL,'This is a new mail Victory, kindly apprehiend',NULL,NULL,NULL,NULL,0,'2021-03-12 18:38:30','2021-03-12 18:38:30'),(3,256,'Loan Application Submitted','Your loan application for 5000 has been submitted successfully and is pending approval. You will be notified once it is processed.','info','file-text','http://localhost/grandbank/dashboard/viewloan',NULL,1,'2026-06-29 01:51:07','2026-07-04 14:49:45'),(4,256,'Loan Approved','Congratulations! Your loan application for 5,000.00 has been approved and credited to your account. Your new balance is 5,000.00.','success','check-circle','http://localhost/grandbank/dashboard/viewloan',NULL,1,'2026-06-29 01:52:15','2026-06-29 01:53:03'),(5,256,'Loan Approved','Congratulations! Your loan application for 5,000.00 has been approved and credited to your account. Your new balance is 10,000.00.','success','check-circle','http://localhost/grandbank/dashboard/viewloan',NULL,1,'2026-06-29 01:52:19','2026-06-29 01:52:54'),(6,255,'Card Application Submitted','Your card application has been submitted and is awaiting approval. You will be notified when the status changes.','info','credit-card','http://localhost/grandbank/dashboard/cards/6',NULL,1,'2026-07-04 09:37:41','2026-07-04 09:39:27'),(7,255,'Card Application Approved','Your Black Visa card has been approved and is now ready for use.','success','check-circle','http://localhost/grandbank/dashboard/cards/6',NULL,1,'2026-07-04 10:06:17','2026-07-04 10:08:13'),(8,256,'Deposit Submitted','Your deposit of $500 via Bitcoin has been received and is pending approval.','info','upload','http://localhost/grandbank/dashboard/deposits',NULL,1,'2026-07-04 12:32:00','2026-07-04 14:14:14');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `card_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `standard_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `gold_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `platinum_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `black_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `monthly_fee` decimal(16,2) NOT NULL DEFAULT 0.00,
  `topup_fee_percentage` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `max_daily_limit` decimal(16,2) NOT NULL DEFAULT 10000.00,
  `min_daily_limit` decimal(16,2) NOT NULL DEFAULT 100.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_settings`
--

LOCK TABLES `card_settings` WRITE;
/*!40000 ALTER TABLE `card_settings` DISABLE KEYS */;
INSERT INTO `card_settings` VALUES (1,5000.00,10000.00,15000.00,20000.00,5.00,0.00,1,10000.00,100.00,NULL,'2026-07-04 09:31:37','2026-07-04 10:03:44');
/*!40000 ALTER TABLE `card_settings` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT 'xxxxxxxxxxxxxx',
  `amount` double NOT NULL DEFAULT 0,
  `card_number` varchar(255) NOT NULL DEFAULT 'xxxxxxxxxxxx',
  `status` varchar(255) NOT NULL DEFAULT 'Not Active',
  `expiry` varchar(255) NOT NULL DEFAULT 'xxxxxxxxxx',
  `type` varchar(255) DEFAULT 'xxxxxxx',
  `card_status` int(11) NOT NULL DEFAULT 0,
  `cvv` varchar(12) NOT NULL DEFAULT 'xxxx',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `expiry_month` varchar(2) DEFAULT NULL,
  `expiry_year` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `card_level` varchar(255) DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `last_four` varchar(4) DEFAULT NULL,
  `bin` varchar(8) DEFAULT NULL,
  `card_pan` text DEFAULT NULL,
  `card_token` varchar(255) DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `application_date` timestamp NULL DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `daily_limit` decimal(16,2) DEFAULT NULL,
  `monthly_limit` decimal(16,2) DEFAULT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 1,
  `is_physical` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cards_user_id_index` (`user_id`),
  KEY `cards_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,252,252,'eva kovac',1650,'49935540527294','Active','07/27','Virtual Card',1,'2557','2024-01-05 20:51:25','2024-01-05 05:56:06',NULL,NULL,NULL,NULL,NULL,'USD',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(2,253,253,'xxxxxxxxxxxxxx',0,'xxxxxxxxxxxx','Not Active','xxxxxxxxxx','xxxxxxx',0,'xxxx','2024-01-05 15:32:49','2024-01-05 15:32:49',NULL,NULL,NULL,NULL,NULL,'USD',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(3,254,254,'xxxxxxxxxxxxxx',0,'xxxxxxxxxxxx','Not Active','xxxxxxxxxx','xxxxxxx',0,'xxxx','2024-01-06 17:45:20','2024-01-06 17:45:20',NULL,NULL,NULL,NULL,NULL,'USD',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(4,255,255,'eva',1300,'49656883296043','Active','09/29','Virtual Card',1,'0868','2024-03-09 09:46:31','2024-03-09 09:02:43',NULL,NULL,NULL,NULL,NULL,'USD',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(5,256,256,'xxxxxxxxxxxxxx',0,'xxxxxxxxxxxx','Not Active','xxxxxxxxxx','xxxxxxx',0,'xxxx','2024-07-01 10:50:21','2024-07-01 10:50:21',NULL,NULL,NULL,NULL,NULL,'USD',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(6,255,255,'xxxxxxxxxxxxxx',0,'4955833914618279','active','xxxxxxxxxx','xxxxxxx',0,'174','2026-07-04 10:06:17','2026-07-04 09:37:41','eva','07','2029','visa','black','USD',0.00,'8279','495583','NDk1NTgzMzkxNDYxODI3OQ==','619b17887335618d5dc32f1b05d7c000','CARDRFBTL4L8PM','2026-07-04 09:37:41',NULL,NULL,'tje s',100.00,NULL,1,0);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `card_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `amount` double NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT NULL,
  `Updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_records`
--

LOCK TABLES `card_records` WRITE;
/*!40000 ALTER TABLE `card_records` DISABLE KEYS */;
INSERT INTO `card_records` VALUES (1,252,50,'RUX-0777','Credit','2024-01-05 20:19:38','2024-01-05 20:19:38'),(2,252,50,'RUX-9719','Debit','2024-01-05 20:21:00','2024-01-05 20:21:00'),(3,252,50,'RUX-9578','Debit','2024-01-05 20:32:57','2024-01-05 20:32:57'),(4,252,50,'RUX-0464','Credit','2024-01-05 20:35:39','2024-01-05 20:35:39'),(5,252,3000,'RUX-9725','Debit','2024-01-05 20:51:25','2024-01-05 20:51:25'),(6,252,3000,'RUX-5869','Debit','2024-01-05 20:51:25','2024-01-05 20:51:25'),(7,255,1000,'RUX-8048','Credit','2024-03-09 09:35:33','2024-03-09 09:35:33'),(8,255,300,'RUX-6789','Credit','2024-03-09 09:46:31','2024-03-09 09:46:31');
/*!40000 ALTER TABLE `card_records` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `card_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `card_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `merchant_name` varchar(255) DEFAULT NULL,
  `merchant_category` varchar(255) DEFAULT NULL,
  `merchant_city` varchar(255) DEFAULT NULL,
  `merchant_country` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'completed',
  `description` text DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `settlement_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_transactions_card_id_index` (`card_id`),
  KEY `card_transactions_user_id_index` (`user_id`),
  KEY `card_transactions_transaction_date_index` (`transaction_date`),
  KEY `card_transactions_transaction_reference_index` (`transaction_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_transactions`
--

LOCK TABLES `card_transactions` WRITE;
/*!40000 ALTER TABLE `card_transactions` DISABLE KEYS */;
INSERT INTO `card_transactions` VALUES (1,6,255,100.00,'USD','fee','FEEN1WNRADN','Remedy',NULL,NULL,NULL,'completed','Card issuance fee for Black card','2026-07-04 09:37:41',NULL,'2026-07-04 09:37:41','2026-07-04 09:37:41');
/*!40000 ALTER TABLE `card_transactions` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
