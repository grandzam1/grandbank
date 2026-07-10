SET FOREIGN_KEY_CHECKS=0;
SET NAMES utf8mb4;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kyc_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `usernumber` varchar(22) DEFAULT NULL,
  `pin` varchar(8) DEFAULT NULL,
  `pinstatus` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT 500000000,
  `accounttype` varchar(45) DEFAULT NULL,
  `allowtransfer` int(11) DEFAULT 0,
  `transferaction` int(11) DEFAULT 0,
  `code1` varchar(30) DEFAULT NULL,
  `code2` varchar(40) DEFAULT NULL,
  `code3` varchar(50) DEFAULT NULL,
  `codestatus` int(11) DEFAULT NULL,
  `signalstatus` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `cstatus` varchar(255) DEFAULT NULL,
  `userupdate` text DEFAULT NULL,
  `assign_to` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dashboard_style` varchar(255) NOT NULL DEFAULT 'light',
  `bank_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `acnt_type_active` varchar(255) DEFAULT NULL,
  `btc_address` varchar(255) DEFAULT NULL,
  `eth_address` varchar(255) DEFAULT NULL,
  `ltc_address` varchar(255) DEFAULT NULL,
  `usdt_address` varchar(191) DEFAULT NULL,
  `plan` varchar(255) DEFAULT NULL,
  `user_plan` varchar(255) DEFAULT NULL,
  `account_bal` float DEFAULT NULL,
  `roi` float DEFAULT NULL,
  `bonus` float DEFAULT NULL,
  `ref_bonus` float DEFAULT NULL,
  `signup_bonus` varchar(255) DEFAULT NULL,
  `auto_trade` varchar(255) DEFAULT NULL,
  `bonus_released` int(11) NOT NULL DEFAULT 0,
  `ref_by` varchar(255) DEFAULT NULL,
  `ref_link` varchar(255) DEFAULT NULL,
  `account_verify` varchar(255) DEFAULT NULL,
  `entered_at` datetime DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `last_growth` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT 'active',
  `account_status` varchar(255) NOT NULL DEFAULT 'active',
  `trade_mode` varchar(255) DEFAULT 'on',
  `act_session` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(255) DEFAULT '''7hiwQ7profile.jpg1691538933''',
  `withdrawotp` varchar(255) DEFAULT NULL,
  `sendotpemail` varchar(255) NOT NULL DEFAULT 'Yes',
  `sendroiemail` varchar(255) NOT NULL DEFAULT 'Yes',
  `sendpromoemail` varchar(255) NOT NULL DEFAULT 'Yes',
  `sendinvplanemail` varchar(255) NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `currency` varchar(23) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `usernumber` (`usernumber`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (255,35,'eva','eva','kovc',NULL,'88267380879','1234',0,NULL,500000,'Savings Account',0,1,'0744366','8575019','8980908',NULL,NULL,'evakovac929@gmail.com','eva123','2024-03-09 09:09:02','$2y$10$VnaMsZNAWD0DJfsXD4FXXuR/Ozjn3baHn8grBAAbyKMuhPlAqjfH.',NULL,NULL,'2024-03-05',NULL,NULL,NULL,'Lag','Nigeria','+2341234567890','light',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,481075,NULL,NULL,NULL,NULL,NULL,0,NULL,'https://remedydevcodes.com/ref/eva123','Verified',NULL,NULL,NULL,'active','active','on',NULL,'ofdeY2VM3Xe0mqpJ2gjnfLegHhB9L8mjb2X8sWq3Va5QpbVGQqMMcQ7ct1eH',NULL,'sK0Li7134124623789983844.jpg1783161722',NULL,'Yes','Yes','Yes','Yes','2024-03-09 09:02:43','2026-07-04 09:42:02',NULL,NULL,'USD'),(256,36,'remedy','kova','eva',NULL,'26988076988','1234',0,NULL,500000000,'Business Account',0,0,'5036246','2307951','9099222',NULL,NULL,'remedynulled@gmail.com','remedy123','2024-03-09 09:09:02','$2y$10$1QlQpUO4ugLWliAr7A0JtemXpY3QF2w7IH4lR4fkTVhQYajX0un7u',NULL,NULL,'2024-07-12',NULL,NULL,NULL,'no 23 lagos road','Monaco','+2341234567890','light',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'46',10000,NULL,NULL,NULL,NULL,NULL,0,NULL,'https://remedydevcodes.com/ref/remedy123','Verified','2026-06-29 02:51:07',NULL,NULL,'active','active','on',NULL,'CdNmBWXYmGLavSRSnZSUWxSmbSwJHZWZjbEQir1GdhG3xF0P8gAf1iLoHPKf',NULL,'dk5gWC134124623789983844.jpg1782700863',NULL,'Yes','Yes','Yes','Yes','2024-07-01 10:50:21','2026-06-29 01:52:19',NULL,NULL,'DKK');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
