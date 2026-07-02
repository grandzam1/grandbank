-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 05:07 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `device` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user`, `ip_address`, `created_at`, `updated_at`, `device`, `browser`, `os`) VALUES
(1190, 252, '197.210.78.27', '2024-01-07 08:12:41', '2024-01-07 08:12:41', 'WebKit', 'Chrome', 'Windows'),
(1191, 252, '197.210.78.27', '2024-01-07 08:12:41', '2024-01-07 08:12:41', 'WebKit', 'Chrome', 'Windows'),
(1192, 252, '197.210.78.208', '2024-03-09 08:57:07', '2024-03-09 08:57:07', 'WebKit', 'Chrome', 'Windows'),
(1193, 252, '197.210.78.208', '2024-03-09 08:57:07', '2024-03-09 08:57:07', 'WebKit', 'Chrome', 'Windows'),
(1194, 255, '197.210.78.208', '2024-03-09 09:08:46', '2024-03-09 09:08:46', 'WebKit', 'Edge', 'Windows'),
(1195, 255, '197.210.78.208', '2024-03-09 09:08:46', '2024-03-09 09:08:46', 'WebKit', 'Edge', 'Windows'),
(1196, 255, '197.210.78.208', '2024-03-09 09:09:02', '2024-03-09 09:09:02', 'WebKit', 'Chrome', 'AndroidOS'),
(1197, 255, '197.210.78.208', '2024-03-09 09:09:02', '2024-03-09 09:09:02', 'WebKit', 'Chrome', 'AndroidOS'),
(1198, 255, '197.210.78.208', '2024-03-09 09:09:59', '2024-03-09 09:09:59', 'WebKit', 'Edge', 'Windows'),
(1199, 255, '197.210.78.208', '2024-03-09 09:09:59', '2024-03-09 09:09:59', 'WebKit', 'Edge', 'Windows'),
(1200, 255, '196.44.98.162', '2024-03-09 09:48:40', '2024-03-09 09:48:40', 'WebKit', 'Chrome', 'AndroidOS'),
(1201, 255, '196.44.98.162', '2024-03-09 09:48:40', '2024-03-09 09:48:40', 'WebKit', 'Chrome', 'AndroidOS'),
(1202, 255, '102.89.43.84', '2024-03-09 09:49:22', '2024-03-09 09:49:22', 'iPhone', 'Chrome', 'iOS'),
(1203, 255, '102.89.43.84', '2024-03-09 09:49:22', '2024-03-09 09:49:22', 'iPhone', 'Chrome', 'iOS'),
(1204, 255, '::1', '2024-06-28 18:49:13', '2024-06-28 18:49:13', 'WebKit', 'Edge', 'Windows'),
(1205, 255, '::1', '2024-06-28 18:49:13', '2024-06-28 18:49:13', 'WebKit', 'Edge', 'Windows'),
(1206, 255, '::1', '2024-06-28 18:52:30', '2024-06-28 18:52:30', 'WebKit', 'Edge', 'Windows'),
(1207, 255, '::1', '2024-06-28 18:52:30', '2024-06-28 18:52:30', 'WebKit', 'Edge', 'Windows'),
(1208, 255, '::1', '2024-06-30 21:51:14', '2024-06-30 21:51:14', 'WebKit', 'Chrome', 'Windows'),
(1209, 255, '::1', '2024-06-30 21:51:14', '2024-06-30 21:51:14', 'WebKit', 'Chrome', 'Windows'),
(1210, 255, '::1', '2024-06-30 22:23:04', '2024-06-30 22:23:04', 'WebKit', 'Chrome', 'Windows'),
(1211, 255, '::1', '2024-06-30 22:23:04', '2024-06-30 22:23:04', 'WebKit', 'Chrome', 'Windows'),
(1212, 255, '::1', '2024-06-30 23:29:15', '2024-06-30 23:29:15', 'WebKit', 'Chrome', 'Windows'),
(1213, 255, '::1', '2024-06-30 23:29:15', '2024-06-30 23:29:15', 'WebKit', 'Chrome', 'Windows'),
(1214, 255, '::1', '2024-06-30 23:33:17', '2024-06-30 23:33:17', 'WebKit', 'Chrome', 'Windows'),
(1215, 255, '::1', '2024-06-30 23:33:17', '2024-06-30 23:33:17', 'WebKit', 'Chrome', 'Windows'),
(1216, 256, '::1', '2024-07-01 11:54:09', '2024-07-01 11:54:09', 'WebKit', 'Edge', 'Windows'),
(1217, 256, '::1', '2024-07-01 11:54:09', '2024-07-01 11:54:09', 'WebKit', 'Edge', 'Windows'),
(1218, 256, '::1', '2024-07-01 12:32:46', '2024-07-01 12:32:46', 'WebKit', 'Chrome', 'Windows'),
(1219, 256, '::1', '2024-07-01 12:32:47', '2024-07-01 12:32:47', 'WebKit', 'Chrome', 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `token_2fa_expiry` datetime DEFAULT current_timestamp(),
  `enable_2fa` varchar(255) NOT NULL DEFAULT 'disbaled',
  `token_2fa` varchar(255) DEFAULT NULL,
  `pass_2fa` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dashboard_style` varchar(255) NOT NULL DEFAULT 'dark',
  `remember_token` varchar(255) DEFAULT NULL,
  `password_token` varchar(100) DEFAULT NULL,
  `acnt_type_active` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstName`, `lastName`, `email`, `email_verified_at`, `password`, `token_2fa_expiry`, `enable_2fa`, `token_2fa`, `pass_2fa`, `phone`, `dashboard_style`, `remember_token`, `password_token`, `acnt_type_active`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'manager', 'admin@admin.com', NULL, '$2a$12$PO82xHDkhBa1kk7e7jKUFOMi6NtaXhq5FYJx9kxV8EDaZ.H7o3z3W', '2021-12-07 11:40:56', 'disabled', '16632', 'true', '34444443', 'light', NULL, NULL, 'active', 'active', 'Super Admin', '2021-03-10 18:55:53', '2023-02-23 13:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `total_refered` varchar(255) NOT NULL DEFAULT '0',
  `total_activated` varchar(255) NOT NULL DEFAULT '0',
  `earnings` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `agent`, `total_refered`, `total_activated`, `earnings`, `created_at`, `updated_at`) VALUES
(4, '17', '8', '0', '0', '2021-04-14 14:45:06', '2021-11-22 14:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `autologin_tokens`
--

CREATE TABLE `autologin_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bnc_transactions`
--

CREATE TABLE `bnc_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prepay_id` varchar(255) DEFAULT NULL,
  `deposit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bnc_transactions`
--

INSERT INTO `bnc_transactions` (`id`, `user_id`, `prepay_id`, `deposit_id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 93, '167699391154495488', NULL, 'Deposit', 'Pending', '2022-06-23 16:00:05', '2022-06-23 16:00:05'),
(2, 93, '167703773979492352', NULL, 'Deposit', 'PAID', '2022-06-23 16:34:04', '2022-06-23 18:30:22'),
(3, 93, '167706013804937216', NULL, 'Deposit', 'Pending', '2022-06-23 16:51:28', '2022-06-23 16:51:28'),
(4, 93, '167709121213775872', NULL, 'Deposit', 'PAID', '2022-06-23 17:15:34', '2022-06-23 18:08:48'),
(5, 93, '167717543820550144', NULL, 'Deposit', 'Pending', '2022-06-23 18:20:57', '2022-06-23 18:20:57'),
(6, 93, '167841863929143296', NULL, 'Deposit', 'Pending', '2022-06-24 10:25:50', '2022-06-24 10:25:50'),
(7, 93, '168543279060443136', NULL, 'Deposit', 'Pending', '2022-06-28 05:09:48', '2022-06-28 05:09:48'),
(8, 93, '171959846135930880', NULL, 'Deposit', 'Pending', '2022-07-16 15:07:07', '2022-07-16 15:07:07'),
(9, 93, '194899603708616704', NULL, 'Deposit', 'Pending', '2022-11-17 03:24:20', '2022-11-17 03:24:20'),
(10, 93, '196417178992926720', NULL, 'Deposit', 'Pending', '2022-11-24 19:37:56', '2022-11-24 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(255) DEFAULT 'xxxxxxxxxxxxxx',
  `amount` double NOT NULL DEFAULT 0,
  `card_number` varchar(255) NOT NULL DEFAULT 'xxxxxxxxxxxx',
  `status` varchar(255) NOT NULL DEFAULT 'Not Active',
  `expiry` varchar(255) NOT NULL DEFAULT 'xxxxxxxxxx',
  `type` varchar(255) DEFAULT 'xxxxxxx',
  `card_status` int(11) NOT NULL DEFAULT 0,
  `cvv` varchar(12) NOT NULL DEFAULT 'xxxx',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `user`, `name`, `amount`, `card_number`, `status`, `expiry`, `type`, `card_status`, `cvv`, `updated_at`, `created_at`) VALUES
(1, 252, 'eva kovac', 1650, '49935540527294', 'Active', '07/27', 'Virtual Card', 1, '2557', '2024-01-05 20:51:25', '2024-01-05 05:56:06'),
(2, 253, 'xxxxxxxxxxxxxx', 0, 'xxxxxxxxxxxx', 'Not Active', 'xxxxxxxxxx', 'xxxxxxx', 0, 'xxxx', '2024-01-05 15:32:49', '2024-01-05 15:32:49'),
(3, 254, 'xxxxxxxxxxxxxx', 0, 'xxxxxxxxxxxx', 'Not Active', 'xxxxxxxxxx', 'xxxxxxx', 0, 'xxxx', '2024-01-06 17:45:20', '2024-01-06 17:45:20'),
(4, 255, 'eva', 1300, '49656883296043', 'Active', '09/29', 'Virtual Card', 1, '0868', '2024-03-09 09:46:31', '2024-03-09 09:02:43'),
(5, 256, 'xxxxxxxxxxxxxx', 0, 'xxxxxxxxxxxx', 'Not Active', 'xxxxxxxxxx', 'xxxxxxx', 0, 'xxxx', '2024-07-01 10:50:21', '2024-07-01 10:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `card_records`
--

CREATE TABLE `card_records` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `amount` double NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT NULL,
  `Updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `card_records`
--

INSERT INTO `card_records` (`id`, `user`, `amount`, `reference`, `type`, `Created_at`, `Updated_at`) VALUES
(1, 252, 50, 'RUX-0777', 'Credit', '2024-01-05 20:19:38', '2024-01-05 20:19:38'),
(2, 252, 50, 'RUX-9719', 'Debit', '2024-01-05 20:21:00', '2024-01-05 20:21:00'),
(3, 252, 50, 'RUX-9578', 'Debit', '2024-01-05 20:32:57', '2024-01-05 20:32:57'),
(4, 252, 50, 'RUX-0464', 'Credit', '2024-01-05 20:35:39', '2024-01-05 20:35:39'),
(5, 252, 3000, 'RUX-9725', 'Debit', '2024-01-05 20:51:25', '2024-01-05 20:51:25'),
(6, 252, 3000, 'RUX-5869', 'Debit', '2024-01-05 20:51:25', '2024-01-05 20:51:25'),
(7, 255, 1000, 'RUX-8048', 'Credit', '2024-03-09 09:35:33', '2024-03-09 09:35:33'),
(8, 255, 300, 'RUX-6789', 'Credit', '2024-03-09 09:46:31', '2024-03-09 09:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `ref_key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `ref_key`, `title`, `description`, `created_at`, `updated_at`) VALUES
(5, 'SMsJr1', 'What our Customer says!', 'Don\'t take our word for it, here\'s what some of our clients have to say about us', '2020-08-22 11:13:00', '2021-10-27 09:59:35'),
(11, 'anvs8c', 'About Us', 'About us header', '2020-08-22 11:32:29', '2021-10-27 10:21:22'),
(12, 'epJ4LI', 'Who we are', 'online trade \r\n                            is a solution for creating an investment management platform. It is suited for\r\n                            hedge or mutual fund managers and also Forex, stocks, bonds and cryptocurrency traders who\r\n                            are looking at runing pool trading system. Onlinetrader simplifies the investment,\r\n                            monitoring and management process. With a secure and compelling mobile-first design,\r\n                            together with a default front-end design, it takes few minutes to setup your own investment\r\n                            management or pool trading platform.', '2020-08-22 11:33:32', '2021-10-27 10:24:01'),
(13, '5hbB6X', 'Get Started', 'How to get started ?', '2020-08-22 11:33:55', '2021-10-27 10:25:09'),
(14, 'Zrhm3I', 'Create an Account', 'Create an account with us using your preffered email/username', '2020-08-22 11:34:11', '2021-10-27 10:25:29'),
(15, 'yTKhlt', 'Make a Deposit', 'Make A deposit with any of your preffered currency', '2020-08-22 11:34:26', '2021-10-27 10:25:52'),
(16, 'u0Ervr', 'Start Trading/Investing', 'Start trading with Indices commodities e.tc', '2020-08-22 11:34:56', '2021-10-27 10:26:12'),
(23, 'vr6Xw0', 'Our Investment Packages', 'Choose how you want to invest with us', '2020-08-22 11:37:43', '2021-10-27 09:58:51'),
(30, '52GPRA', 'Address', 'No 10 Mission Road, Nigeria', '2020-08-22 11:40:19', '2020-08-22 11:40:19'),
(31, '0EXbji', 'Phone Number', '+234 9xxxxxxxx', '2020-08-22 11:40:36', '2020-09-14 10:13:57'),
(32, 'HLgyaQ', 'Email', 'support@brynamics.xyz', '2020-08-22 11:41:14', '2020-08-22 12:23:55'),
(35, 'Mnag31', 'The Better Way to Trade & Invest', 'Online Trade helps over 2 million customers achieve their financial goals by helping them trade and invest with ease', '2021-10-27 09:42:23', '2022-11-10 18:42:38'),
(36, 'rXJ7JQ', 'Trade Invest stock, and Bond', 'Home page text', '2021-10-27 09:45:17', '2021-10-27 09:45:17'),
(37, 'J23T0Y', 'Security Comes First', 'Security Comes first', '2021-10-27 09:53:15', '2021-10-27 09:54:52'),
(38, '9HOR1z', 'Security', 'Online Trade uses the highest levels of Internet Security, and it is secured by 256 bits SSL security encryption to ensure that your information is completely protected from fraud.', '2021-10-27 09:56:13', '2021-10-27 09:56:13'),
(39, '7DH2G9', 'Two Factor Auth', 'Two-factor authentication (2FA) by default on all Online Trade accounts, to securely protect you from unauthorised access and impersonation.', '2021-10-27 09:56:26', '2021-10-27 09:56:26'),
(40, '5Vg32I', 'Explore Our Services', 'It’s our mission to provide you with a delightful and a successful trading experience!', '2021-10-27 09:56:38', '2021-10-27 09:56:38'),
(41, 'Vg6Gy7', 'Powerful Trading Platforms', 'Online Trade offers multiple platform options to cover the needs of each type of trader and investors .', '2021-10-27 09:56:53', '2021-10-27 09:56:53'),
(42, '1Sx1dl', 'High leverage', 'Chance to magnify your investment and really win big with super-low spreads to further up your profits', '2021-10-27 09:57:06', '2021-10-27 09:57:06'),
(43, 'YYqKx3', 'Fast execution', 'Super-fast trading software, so you never suffer slippage.', '2021-10-27 09:57:20', '2021-10-27 09:57:20'),
(44, 'yGg8xI', 'Ultimate Security', 'With advanced security systems, we keep your account always protected.', '2021-10-27 09:57:35', '2021-10-27 09:57:35'),
(45, 'xEWMho', '24/7 live chat Support', 'Connect with our 24/7 support and Market Analyst on-demand.', '2021-10-27 09:57:48', '2021-10-27 09:57:48'),
(46, '9SOtK1', 'Always on the go? Mobile trading is easier than ever with Online Trade!', 'Get your hands on our customized Trading Platform with the comfort of freely trading on the move, to experience truly liberating trading sessions.', '2021-10-27 09:58:05', '2021-10-27 09:58:05'),
(47, 'wOS1ve', 'Cryptocurrency', 'Trade and invest Top Cryptocurrency', '2021-10-27 09:59:07', '2021-10-27 09:59:07'),
(48, 'wuZlis', 'Hello!, How can we help you?', 'Hello!, How can we help you?', '2021-10-27 10:32:12', '2021-10-27 10:32:12'),
(49, '1TYkw0', 'Find the help you need', 'Launch your campaign and benefit from our expertise on designing and managing conversion centered bootstrap4 html page.', '2021-10-27 10:32:33', '2021-10-27 10:32:33'),
(50, 'rK6Yhn', 'FAQs', 'Due to its widespread use as filler text for layouts, non-readability is of great importance.', '2021-10-27 10:32:49', '2021-10-27 10:32:49'),
(51, 'HBHBLo', 'Guides / Support', 'Due to its widespread use as filler text for layouts, non-readability is of great importance.', '2021-10-27 10:33:03', '2021-10-27 10:33:03'),
(52, 'rCTDQh', 'Support Request', 'Due to its widespread use as filler text for layouts, non-readability is of great importance.', '2021-10-27 10:33:14', '2021-10-27 10:33:14'),
(53, 'kMsswR', 'Get Started', 'Launch your campaign and benefit from our expertise on designing and managing conversion centered bootstrap4 html page.', '2021-10-27 10:33:28', '2021-10-27 10:33:28'),
(54, 'EOUU7R', 'Get in Touch !', 'This is required when, for text is not yet available.', '2021-10-27 10:33:56', '2021-10-27 10:33:56'),
(56, 'ROu4q6', 'Contact Us', 'Contact Us', '2021-10-27 10:47:41', '2021-10-27 10:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `cp_transactions`
--

CREATE TABLE `cp_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `Item_number` varchar(255) DEFAULT NULL,
  `amount_paid` varchar(255) DEFAULT NULL,
  `user_plan` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_tele_id` int(11) DEFAULT NULL,
  `amount1` varchar(255) DEFAULT NULL,
  `amount2` varchar(255) DEFAULT NULL,
  `currency1` varchar(255) DEFAULT NULL,
  `currency2` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cp_p_key` varchar(255) DEFAULT NULL,
  `cp_pv_key` varchar(255) DEFAULT NULL,
  `cp_m_id` varchar(255) DEFAULT NULL,
  `cp_ipn_secret` varchar(255) DEFAULT NULL,
  `cp_debug_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cp_transactions`
--

INSERT INTO `cp_transactions` (`id`, `txn_id`, `item_name`, `Item_number`, `amount_paid`, `user_plan`, `user_id`, `user_tele_id`, `amount1`, `amount2`, `currency1`, `currency2`, `status`, `status_text`, `type`, `cp_p_key`, `cp_pv_key`, `cp_m_id`, `cp_ipn_secret`, `cp_debug_email`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'sefef', 'Heloosjjsnnij2878u2i', 'tes@dd.gb', '2021-03-11 18:46:45', '2022-07-21 04:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_accounts`
--

CREATE TABLE `crypto_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `btc` float DEFAULT NULL,
  `eth` float DEFAULT NULL,
  `ltc` float DEFAULT NULL,
  `xrp` float DEFAULT NULL,
  `link` float DEFAULT NULL,
  `bnb` float DEFAULT NULL,
  `aave` float DEFAULT NULL,
  `usdt` float DEFAULT NULL,
  `xlm` float DEFAULT NULL,
  `bch` float DEFAULT NULL,
  `ada` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_accounts`
--

INSERT INTO `crypto_accounts` (`id`, `user_id`, `btc`, `eth`, `ltc`, `xrp`, `link`, `bnb`, `aave`, `usdt`, `xlm`, `bch`, `ada`, `created_at`, `updated_at`) VALUES
(1, 93, 0.276921, 0.145275, 0.0223845, NULL, NULL, 0.499336, NULL, 182.225, NULL, NULL, 864.996, '2021-10-31 17:25:53', '2022-03-23 15:20:53'),
(2, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 14:15:27', '2022-02-14 14:15:27'),
(3, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 14:32:58', '2022-02-14 14:32:58'),
(4, 152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-25 18:47:58', '2022-03-25 18:47:58'),
(5, 153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-11 13:58:53', '2022-04-11 13:58:53'),
(6, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 13:16:21', '2022-04-13 13:16:21'),
(7, 151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-29 09:26:45', '2022-04-29 09:26:45'),
(8, 154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-24 12:00:30', '2022-05-24 12:00:30'),
(9, 156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 14:32:55', '2022-07-05 14:32:55'),
(10, 157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-07 15:13:02', '2022-07-07 15:13:02'),
(11, 158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-16 06:22:44', '2022-08-16 06:22:44'),
(12, 159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:26:48', '2022-08-30 09:26:48'),
(13, 160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:29:04', '2022-08-30 09:29:04'),
(14, 161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:31:31', '2022-08-30 09:31:31'),
(15, 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:33:13', '2022-08-30 09:33:13'),
(16, 163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:33:57', '2022-08-30 09:33:57'),
(17, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:34:29', '2022-08-30 09:34:29'),
(18, 165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:38:07', '2022-08-30 09:38:07'),
(19, 166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:40:53', '2022-08-30 09:40:53'),
(20, 167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:43:20', '2022-08-30 09:43:20'),
(21, 168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:46:13', '2022-08-30 09:46:13'),
(22, 169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-30 09:50:37', '2022-08-30 09:50:37'),
(23, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-13 18:25:04', '2023-02-13 18:25:04'),
(24, 171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-13 20:17:17', '2023-02-13 20:17:17'),
(25, 172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-23 15:52:59', '2023-02-23 15:52:59'),
(26, 173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-23 20:38:18', '2023-02-23 20:38:18'),
(27, 174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-09 15:19:22', '2023-03-09 15:19:22'),
(28, 175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-10 13:57:19', '2023-03-10 13:57:19'),
(29, 176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-10 14:03:15', '2023-03-10 14:03:15'),
(30, 177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-13 00:41:06', '2023-03-13 00:41:06'),
(31, 178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 12:04:58', '2023-03-15 12:04:58'),
(32, 179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 12:39:37', '2023-03-15 12:39:37'),
(33, 180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 12:41:31', '2023-03-15 12:41:31'),
(34, 181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 12:44:23', '2023-03-15 12:44:23'),
(35, 182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 17:56:48', '2023-03-15 17:56:48'),
(36, 183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 20:59:59', '2023-03-15 20:59:59'),
(37, 184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-17 15:02:38', '2023-03-17 15:02:38'),
(38, 185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-17 22:29:56', '2023-03-17 22:29:56'),
(39, 186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-19 05:06:37', '2023-03-19 05:06:37'),
(40, 187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-22 12:21:09', '2023-03-22 12:21:09'),
(41, 188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-26 09:24:57', '2023-03-26 09:24:57'),
(42, 189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-27 01:06:16', '2023-03-27 01:06:16'),
(43, 190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-27 13:45:31', '2023-03-27 13:45:31'),
(44, 191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-27 13:57:04', '2023-03-27 13:57:04'),
(45, 192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-29 13:03:36', '2023-03-29 13:03:36'),
(46, 193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-29 19:45:16', '2023-03-29 19:45:16'),
(47, 194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 22:07:02', '2023-03-30 22:07:02'),
(48, 195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-30 23:21:56', '2023-03-30 23:21:56'),
(49, 196, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-03 10:09:40', '2023-04-03 10:09:40'),
(50, 197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-03 19:15:43', '2023-04-03 19:15:43'),
(51, 198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-10 01:53:49', '2023-04-10 01:53:49'),
(52, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-11 08:19:44', '2023-04-11 08:19:44'),
(53, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-25 13:38:23', '2023-04-25 13:38:23'),
(54, 201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-03 17:44:16', '2023-08-03 17:44:16'),
(55, 202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-06 10:30:13', '2023-08-06 10:30:13'),
(56, 210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-08 13:09:20', '2023-08-08 13:09:20'),
(57, 211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 00:41:03', '2023-08-11 00:41:03'),
(58, 212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 15:30:28', '2023-08-11 15:30:28'),
(59, 213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-12 01:04:21', '2023-08-12 01:04:21'),
(60, 214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-12 12:03:15', '2023-08-12 12:03:15'),
(61, 215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-13 20:30:33', '2023-08-13 20:30:33'),
(62, 216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:12:43', '2023-08-14 08:12:43'),
(63, 217, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:32:26', '2023-08-14 08:32:26'),
(64, 218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 09:26:47', '2023-08-14 09:26:47'),
(65, 219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:48:21', '2023-08-14 10:48:21'),
(66, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:50:48', '2023-08-14 10:50:48'),
(67, 221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:54:53', '2023-08-14 10:54:53'),
(68, 222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 11:09:54', '2023-08-14 11:09:54'),
(69, 223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 11:49:21', '2023-08-14 11:49:21'),
(70, 224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-16 13:49:47', '2023-08-16 13:49:47'),
(71, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 00:59:53', '2023-08-17 00:59:53'),
(72, 226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 16:41:44', '2023-08-17 16:41:44'),
(73, 227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 20:20:56', '2023-08-17 20:20:56'),
(74, 228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 05:16:38', '2023-08-18 05:16:38'),
(75, 229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 08:16:31', '2023-08-18 08:16:31'),
(76, 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-23 06:42:02', '2023-08-23 06:42:02'),
(77, 232, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-23 07:22:39', '2023-08-23 07:22:39'),
(78, 236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-24 16:41:15', '2023-08-24 16:41:15'),
(79, 237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-25 06:59:26', '2023-08-25 06:59:26'),
(80, 238, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-25 17:04:47', '2023-08-25 17:04:47'),
(81, 239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-01 00:04:02', '2023-09-01 00:04:02'),
(82, 240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-04 12:31:49', '2023-09-04 12:31:49'),
(83, 241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-07 20:35:50', '2023-09-07 20:35:50'),
(84, 242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-11 13:25:01', '2023-09-11 13:25:01'),
(85, 243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-12 06:46:09', '2023-09-12 06:46:09'),
(86, 244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-12 18:04:10', '2023-09-12 18:04:10'),
(87, 245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-13 15:35:25', '2023-09-13 15:35:25'),
(88, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-05 01:00:14', '2024-01-05 01:00:14'),
(89, 252, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-05 06:03:22', '2024-01-05 06:03:22'),
(90, 253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-05 15:32:49', '2024-01-05 15:32:49'),
(91, 254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-06 17:45:20', '2024-01-06 17:45:20'),
(92, 255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-09 09:02:43', '2024-03-09 09:02:43'),
(93, 256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-01 10:50:21', '2024-07-01 10:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_records`
--

CREATE TABLE `crypto_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `quantity` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_records`
--

INSERT INTO `crypto_records` (`id`, `source`, `dest`, `amount`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'BTC', 'USD', 0.00, 107.58, '2022-05-24 10:21:07', '2022-05-24 10:21:07'),
(2, 'USD', 'BNB', 50.00, 0.15, '2022-05-24 11:26:55', '2022-05-24 11:26:55'),
(3, 'BTC', 'USD', 0.21, 6219.48, '2022-05-24 11:31:53', '2022-05-24 11:31:53'),
(4, 'USD', 'ETH', 100.00, 0.05, '2022-05-24 11:36:30', '2022-05-24 11:36:30'),
(5, 'USD', 'BTC', 60.00, 0.00, '2022-06-09 08:09:48', '2022-06-09 08:09:48'),
(6, 'BTC', 'USD', 0.10, 2841.35, '2022-06-12 06:36:40', '2022-06-12 06:36:40'),
(7, 'USD', 'BTC', 300.00, 0.01, '2022-07-16 15:18:29', '2022-07-16 15:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `txn_id`, `user`, `amount`, `payment_mode`, `Description`, `type`, `accountname`, `plan`, `status`, `proof`, `created_at`, `updated_at`) VALUES
(121, 'REME/OQFL5LUE-2024', 255, '1000', NULL, 'Cryptocurrency Funding', 'Credit', NULL, NULL, 'Pending', 'uploads/J2rlKBwqZh93sGBUyBxPzXWgb6DbCPV0zTe4ZwOV.jpg', '2024-06-30 17:33:55', '2024-06-30 17:33:55'),
(122, 'REME/V6DBJEHC-2024', 255, '233', NULL, 'Cryptocurrency Funding', 'Credit', NULL, NULL, 'Pending', 'uploads/WXpL971d0otKEYvzyaO0s1kw2n4gdCOEWXhpg2z3.jpg', '2024-06-30 17:36:18', '2024-06-30 17:36:18'),
(123, 'REME/6VT0Z8UM-2024', 255, '300.00', NULL, 'Cryptocurrency Funding', 'Credit', NULL, NULL, 'Pending', 'uploads/ISX9kwlFQBEqWdVchfZhXA4GDaY8iox3twRK1Dyx.jpg', '2024-06-30 17:39:53', '2024-06-30 17:39:53'),
(124, 'REME/AHOED3XG-2024', 255, '500', 'Bitcoin', 'Cryptocurrency Funding', 'Credit', NULL, NULL, 'Pending', 'uploads/dOOGnXosGTDhoSeovsNZDp35DzD2yGBtB8xBwV9v.jpg', '2024-06-30 20:38:02', '2024-06-30 20:38:02'),
(125, 'REME/QDPGYJHP-2024', 255, '300.00', 'USDT', 'Cryptocurrency Funding', 'Credit', NULL, NULL, 'Pending', 'uploads/IMAvms3TEy4HAo4LAHbYOlJG3uO2xKJNirDULCTE.jpg', '2024-06-30 20:44:46', '2024-06-30 20:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_key` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `ref_key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `ref_key`, `title`, `description`, `img_path`, `created_at`, `updated_at`) VALUES
(8, 'DPd1Kn', 'Testimonial 1', 'Testimonial 1', 'SIu0JZ01.jpg1635329714', '2020-08-23 12:24:52', '2021-10-27 10:15:14'),
(9, 'ZqCgDz', 'Testimonial 2', 'Testimonial 2', 'photos/2O5A1PaPNEG6J92eybtWfyawbw8KYvCneD5VCZVM.jpg', '2020-08-23 12:25:07', '2022-02-17 10:01:28'),
(14, 'b9158B', 'Home Image', 'The image at the home page', 'photos/eQZW9KTA66MfDXmmsM7VzwfBuleCSRBpoyjaivei.jpg', '2021-10-27 09:48:42', '2022-02-16 15:32:47'),
(15, 'iAwfKe', 'About image', 'The image in the about page', 'photos/O424fd54I3OWdTvNZNDAFuVCMG1oVUMuCgbwxzeT.png', '2021-10-27 10:22:20', '2022-02-16 15:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `ipaddresses`
--

CREATE TABLE `ipaddresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
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
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `user_id`, `title`, `gender`, `zipcode`, `phone_number`, `dob`, `social_media`, `address`, `city`, `state`, `country`, `document_type`, `frontimg`, `backimg`, `status`, `created_at`, `updated_at`, `statenumber`, `accounttype`, `employer`, `income`, `kinname`, `kinaddress`, `relationship`, `age`, `email`) VALUES
(35, 255, 'Male', 'Male', 'nulledtechy@gmail.com', NULL, '2024-03-05', NULL, 'Lag', 'Lagos', 'lagos', 'Nigeria', 'National ID', 'uploads/ZHw0WgKN9UdrnoiKAyEY6ZTQkqaQh1tW9K0RUdSr.jpg', 'uploads/Qa8t6z3umofYR5WIBkrloSEEqHTnopxGRQ7w9dYQ.jpg', 'Verified', '2024-03-09 09:12:38', '2024-03-09 09:13:00', '34567890', 'Savings Account', 'Self Employed', '$700.00 - $1,000.00', 'eva', 'lagos, nigeria', 'broter', NULL, NULL),
(36, 256, 'Male', 'Male', '34556', NULL, '2024-07-12', NULL, 'no 23 lagos road', 'No 23 Lagos road', 'Imo', 'Nigeria', 'Int\'l Passport', 'uploads/ZhnpK6H0RZsmpu5IshSZuThwSMLyq80lf2GsSWXJ.png', 'uploads/rcX5gWQ0kPjJVsIovO4YXU9N1RBzt78r5hSdu5tl.png', 'Verified', '2024-07-01 11:41:04', '2024-07-01 11:53:43', '635433131', 'Savings Account', 'Self Employed', '$1,000.00 - $2,000.00', 'Eva koavc', 'no 23 lagos road', 'brother', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_03_09_142220_create_sessions_table', 1),
(7, '2021_03_10_082445_create_admins_table', 2),
(8, '2021_03_10_082519_create_agents_table', 2),
(9, '2021_03_10_082715_create_assets_table', 2),
(10, '2021_03_10_082817_create_contents_table', 2),
(11, '2021_03_10_083110_create_cp_transactions_table', 2),
(12, '2021_03_10_083324_create_deposits_table', 2),
(13, '2021_03_10_083400_create_faqs_table', 2),
(14, '2021_03_10_083510_create_images_table', 2),
(15, '2021_03_10_083557_create_mt4_details_table', 2),
(16, '2021_03_10_083627_create_notifications_table', 2),
(17, '2021_03_10_083824_create_plans_table', 2),
(18, '2021_03_10_083850_create_settings_table', 2),
(19, '2021_03_10_083936_create_testimonies_table', 2),
(20, '2021_03_10_084009_create_tp__transactions_table', 2),
(21, '2021_03_10_084031_create_upgrades_table', 2),
(22, '2021_03_10_084120_create_userlogs_table', 2),
(23, '2021_03_10_084140_create_user_plans_table', 2),
(24, '2021_03_10_084235_create_wdmethods_table', 2),
(25, '2021_03_10_084300_create_withdrawals_table', 2),
(26, '2021_04_06_083043_create_tasks_table', 3),
(27, '2021_04_23_110006_create_exchanges_table', 4),
(28, '2021_04_23_114622_create_coin_transactions_table', 5),
(29, '2021_04_27_080945_create_currencies_table', 6),
(30, '2021_04_29_110349_create_c_withdrawals_table', 7),
(31, '2021_10_07_112653_create_ipaddresses_table', 8),
(32, '2021_10_27_114829_create_terms_privacies_table', 9),
(33, '2021_10_31_131124_create_crypto_accounts_table', 10),
(34, '2021_10_31_132849_create_settings_conts_table', 11),
(35, '2022_01_24_123921_create_copy_trade_accounts_table', 12),
(36, '2022_02_03_131113_create_tasks_table', 13),
(37, '2022_03_16_135903_create_adverts_table', 14),
(38, '2022_03_17_114728_create_orders_p2ps_table', 15),
(39, '2022_05_23_215802_create_crypto_records_table', 16),
(40, '2022_06_13_220336_create_kycs_table', 17),
(41, '2022_06_23_030303_create_bnc_transactions_table', 18),
(42, '2022_09_02_074542_create_courses_table', 19),
(43, '2022_09_02_074626_create_course_lessons_table', 20),
(44, '2022_09_02_074608_create_course_categories_table', 21),
(45, '2022_09_06_165000_create_user_courses_table', 22),
(46, '2014_01_28_232217_create_autologin_tokens_table', 23),
(47, '2014_02_07_004118_add_unique_index_to_autologin_tokens_table', 24),
(48, '2014_03_02_162640_add_count_to_autologin_tokens_table', 25),
(53, '2022_09_19_142955_create_master_accounts_table', 26),
(54, '2022_09_29_153351_create_signal_tbs_table', 27),
(55, '2022_09_29_175703_create_signal_subscribers_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `mt4_details`
--

CREATE TABLE `mt4_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mt4_id` varchar(255) DEFAULT NULL,
  `mt4_password` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `leverage` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `reminded_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(2, 9, 'This is a new mail Victory, kindly apprehiend', '2021-03-12 18:38:30', '2021-03-12 18:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nulledtechy@gmail.com', '$2y$10$EJG4pLsftbEPKXKUNMyvQOPuUAPRdHwgzko0ndDN97vWH8idrmLT2', '2023-08-08 12:16:55'),
('evakovac929@gmail.com', '$2y$10$CQzk6/AyQBEMTRvE0oQsUednJNi3aZbLC2on976eDoeQrEJtIElAe', '2023-08-16 21:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `paystacks`
--

CREATE TABLE `paystacks` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paystack_public_key` text DEFAULT NULL,
  `paystack_secret_key` text DEFAULT NULL,
  `paystack_url` varchar(255) DEFAULT NULL,
  `paystack_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paystacks`
--

INSERT INTO `paystacks` (`id`, `created_at`, `updated_at`, `paystack_public_key`, `paystack_secret_key`, `paystack_url`, `paystack_email`) VALUES
(1, '2021-10-07 15:26:10', '2023-02-13 20:26:29', NULL, NULL, 'https://api.paystack.co', 'test@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `min_price`, `max_price`, `minr`, `maxr`, `gift`, `expected_return`, `type`, `increment_interval`, `increment_type`, `increment_amount`, `expiration`, `created_at`, `updated_at`) VALUES
(10, 'AMATUER AI', '200', '200', '20000', '2', '3', '0', NULL, 'Main', 'Every 10 Minutes', 'Percentage', '20', '6 Days', '2022-07-05 14:34:25', '2023-04-25 10:00:53'),
(11, 'PROFESSIONAL AI', '30000', '30000', '90000', '3', '3', '0', NULL, 'Main', 'Daily', 'Percentage', '3', '20 Days', '2022-11-25 13:10:14', '2023-04-24 22:40:06'),
(12, 'VARIETY AI', '100000', '100000', '1000000000', '80', '80', '0', NULL, 'Main', 'Daily', 'Percentage', '80', '30 Days', '2023-02-23 15:39:21', '2023-04-24 22:40:53'),
(13, 'FIXED AI', '50000', '50000', '5000000000000', '80', '80', '0', NULL, 'Main', 'Daily', 'Percentage', '80', '60 Days', '2023-02-23 15:40:59', '2023-04-24 22:41:36'),
(14, 'SUPERIOR AI', '100000', '100000', '100000000', '50', '50', '0', NULL, 'Main', 'Daily', 'Percentage', '50', '20 Days', '2023-03-09 15:42:12', '2023-04-24 22:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3CNCqQrWu8y3lYirYU4jNT6HHOJ1yimGz3D1ngWl', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia1BrNXBGUjJ0QXdWZ3BQVTVCbjdQMEltT3lJUFFSdDZ6cmoyNkhUWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9hZG1pbi9kYXNoYm9hcmQvdXNlci1kZXRhaWxzLzI1NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1719761756),
('AL2SsRyapnWy64qOK2tAYWaVtK0Vn80CbQ9N77oh', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienhWQ3dtbW1KaVFxUEx5TXVWVGREMW5OS0RpdmZIdUZWWXh4eGkxeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9yZWdpc3RlciI7fX0=', 1719789068),
('DKQuWVRZCbRqZliCGpdRX5D1E5vC4CPuzL6VjdoB', 256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoib2NOalBoRzByTU1CbERVMEs2bXA4WUpYclVReDA5Y2ExMWlEM1R6aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcDEvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJnZXRBbm91YyI7czo0OiJ0cnVlIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNTY7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxUWxRcFVPNHVnTFdsaUFyN0EwSnRlbVhwWTNRRjJ3N0lINGxSNGZrVFZoUVlhalgwdW43dSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkMVFsUXBVTzR1Z0xXbGlBcjdBMEp0ZW1YcFkzUUYydzdJSDRsUjRma1RWaFFZYWpYMHVuN3UiO30=', 1719838489),
('fVlPJaw6J2MnMHSQCQuZJTgRMctgOPwMQR9rD7Av', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMm40NnhOQmZXeDFYWE9tREVXWXNKNlJGcG0wdjk0WjVKWlU5U1g3diI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719785313),
('LVftsOClfGGWfyq8XMRrPWYf35FMH6kk0hYCkRoD', 256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNVZyckVtbEZyMXlwZ1VCTzU0c1VOcHJ2ZjJva1JGM01PRUZrVko0aSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcDEvZGFzaGJvYXJkIjt9czo4OiJnZXRBbm91YyI7czo0OiJ0cnVlIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNTY7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxUWxRcFVPNHVnTFdsaUFyN0EwSnRlbVhwWTNRRjJ3N0lINGxSNGZrVFZoUVlhalgwdW43dSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkMVFsUXBVTzR1Z0xXbGlBcjdBMEp0ZW1YcFkzUUYydzdJSDRsUjRma1RWaFFZYWpYMHVuN3UiO3M6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1719845680),
('mGvAruRNfGUmhUHppjOYSA1JtonBKQsMvvOz5X9C', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQnZvcHpuNEZrQW9ERnRjenFhenhIdm1hbG9aNkE3VkZRaWFBTVVueCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2OToiaHR0cDovL2xvY2FsaG9zdC9iYW5rYXBwL2Rhc2hib2FyZC90cmFuc2FjdGlvbmRldGFpbHMvX19tYW5pZmVzdC5qc29uIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9kYXNoYm9hcmQvdHJhbnNhY3Rpb25kZXRhaWxzL19fbWFuaWZlc3QuanNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719763730),
('NDo6oh8tYGZy4rttr2xHOvb33BYaWVHwk9EmUIl6', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV1hsbE5TY0dEYjVhUng5SUtuN3phcnVTS0FLUUszT09JTnlRZjRudCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9zZXJ2aWNlcyI7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1719792663),
('rDMtzXgoPB26CF3iJd3GQwsVCgn6E0twvuuX50AH', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1RxM2R2U0lOYThDaFFhS0tacFA2Z3hrbTlrYXhBQmp6aEZNVFN2aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719763730),
('XPLI0oYRlGEeREDr7EUsxhAHEBbUgFPjKinV3keP', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRk5hamlvQ0FxbndyMkU4UHEwdU9EeFNnQTEzZEJCWEtjd3NGOU96MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly9sb2NhbGhvc3QvYmFua2FwcC9hZG1pbi9kYXNoYm9hcmQvcHJvY2Vzcy13aXRoZHJhd2FsLXJlcXVlc3QvMjUxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1719607010);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `code1` varchar(25) DEFAULT NULL,
  `code2` varchar(25) DEFAULT NULL,
  `code3` varchar(25) DEFAULT NULL,
  `code4` varchar(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code1status` int(11) DEFAULT 1,
  `code2status` int(11) DEFAULT 1,
  `code3status` int(11) DEFAULT 1,
  `otp` int(11) DEFAULT 0,
  `sms` int(11) DEFAULT 0,
  `currency` varchar(255) DEFAULT NULL,
  `intreast` int(11) DEFAULT NULL,
  `s_currency` varchar(255) DEFAULT NULL,
  `capt_secret` varchar(255) DEFAULT NULL,
  `capt_sitekey` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `s_s_k` varchar(255) DEFAULT NULL,
  `s_p_k` varchar(255) DEFAULT NULL,
  `pp_cs` varchar(255) DEFAULT NULL,
  `pp_ci` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_address` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `trade_mode` varchar(255) DEFAULT NULL,
  `google_translate` varchar(255) DEFAULT NULL,
  `weekend_trade` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `mail_server` varchar(20) DEFAULT NULL,
  `emailfrom` varchar(255) DEFAULT NULL,
  `emailfromname` varchar(255) DEFAULT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(255) DEFAULT NULL,
  `smtp_encrypt` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_password` varchar(255) DEFAULT NULL,
  `google_secret` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `google_redirect` varchar(255) DEFAULT NULL,
  `referral_commission` varchar(255) DEFAULT NULL,
  `referral_commission1` varchar(255) DEFAULT NULL,
  `referral_commission2` varchar(255) DEFAULT NULL,
  `referral_commission3` varchar(255) DEFAULT NULL,
  `referral_commission4` varchar(255) DEFAULT NULL,
  `referral_commission5` varchar(255) DEFAULT NULL,
  `signup_bonus` varchar(255) DEFAULT NULL,
  `deposit_bonus` int(11) DEFAULT NULL,
  `tawk_to` longtext DEFAULT NULL,
  `enable_2fa` varchar(255) NOT NULL DEFAULT 'no',
  `enable_kyc` varchar(255) NOT NULL DEFAULT 'no',
  `enable_kyc_registration` varchar(191) DEFAULT NULL,
  `enable_with` varchar(255) DEFAULT NULL,
  `enable_verification` varchar(255) NOT NULL DEFAULT 'true',
  `enable_social_login` varchar(255) DEFAULT NULL,
  `withdrawal_option` varchar(255) NOT NULL DEFAULT 'auto',
  `deposit_option` varchar(255) DEFAULT NULL,
  `auto_merchant_option` varchar(191) DEFAULT 'Coinpayment',
  `dashboard_option` varchar(255) DEFAULT NULL,
  `enable_annoc` varchar(255) DEFAULT NULL,
  `subscription_service` text DEFAULT NULL,
  `captcha` varchar(255) DEFAULT NULL,
  `return_capital` tinyint(1) DEFAULT 1,
  `tido` varchar(255) DEFAULT NULL,
  `address_o` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `should_cancel_plan` tinyint(1) DEFAULT 1,
  `commission_type` varchar(255) DEFAULT NULL,
  `commission_fee` varchar(255) DEFAULT NULL,
  `monthlyfee` varchar(255) DEFAULT NULL,
  `quarterlyfee` varchar(255) DEFAULT NULL,
  `yearlyfee` varchar(255) DEFAULT NULL,
  `newupdate` varchar(255) DEFAULT NULL,
  `modules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `redirect_url` varchar(192) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `website_theme` varchar(191) DEFAULT 'purpose.css',
  `credit_card_provider` varchar(191) DEFAULT 'Paystack',
  `deduction_option` varchar(191) DEFAULT 'userRequest',
  `welcome_message` text DEFAULT NULL,
  `install_type` varchar(20) DEFAULT NULL,
  `merchant_key` varchar(192) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code1message` text DEFAULT NULL,
  `code2message` text DEFAULT NULL,
  `code3message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `code1`, `code2`, `code3`, `code4`, `description`, `code1status`, `code2status`, `code3status`, `otp`, `sms`, `currency`, `intreast`, `s_currency`, `capt_secret`, `capt_sitekey`, `payment_mode`, `location`, `s_s_k`, `s_p_k`, `pp_cs`, `pp_ci`, `keywords`, `site_title`, `site_address`, `logo`, `favicon`, `trade_mode`, `google_translate`, `weekend_trade`, `contact_email`, `timezone`, `mail_server`, `emailfrom`, `emailfromname`, `smtp_host`, `smtp_port`, `smtp_encrypt`, `smtp_user`, `smtp_password`, `google_secret`, `google_id`, `google_redirect`, `referral_commission`, `referral_commission1`, `referral_commission2`, `referral_commission3`, `referral_commission4`, `referral_commission5`, `signup_bonus`, `deposit_bonus`, `tawk_to`, `enable_2fa`, `enable_kyc`, `enable_kyc_registration`, `enable_with`, `enable_verification`, `enable_social_login`, `withdrawal_option`, `deposit_option`, `auto_merchant_option`, `dashboard_option`, `enable_annoc`, `subscription_service`, `captcha`, `return_capital`, `tido`, `address_o`, `whatsapp`, `should_cancel_plan`, `commission_type`, `commission_fee`, `monthlyfee`, `quarterlyfee`, `yearlyfee`, `newupdate`, `modules`, `redirect_url`, `address`, `website_theme`, `credit_card_provider`, `deduction_option`, `welcome_message`, `install_type`, `merchant_key`, `created_at`, `updated_at`, `code1message`, `code2message`, `code3message`) VALUES
(1, 'Remedy', 'IMF', 'SWIFT', 'COT', NULL, NULL, 1, 1, 1, 1, 0, '$', 40, 'USD', NULL, NULL, '123567', NULL, 'sk_test_51M1VmfFSYdH5XTaEZgPwZLfrbZIXIf7ZgWaIXORzlJnESfX2ymtoS5wSdDmJcDwF3vuwGNVrUPBKOqhP9806DvZA00B0ExUbHc', 'pk_test_51M1VmfFSYdH5XTaE2qnAXCOOzKMcxvcMBKtAYxpZGWA00flDsxLPtBLtSfGRQve0C2BAGXNCVp71ytpNgUQYbnyy00nICYCfDT', 'jijdjkdkdk', 'iidjdjdj', 'Leads Union Bank online bank', 'Welcome to Remedy', 'https://remedydevcodes.com', 'photos/ssYtGYSQVnOYcPs77EzXL2SqpNccIff02VIp8S6D.png', 'photos/JtGIQMqhVkoRc9wTR6tASYpVAgqRbiNZgbNPCIar.png', NULL, NULL, NULL, 'support@contact.com', 'Pacific/Wallis', 'smtp', 'remedy@remdy.com', 'BAnk', 'sandbox.smtp.mailtrap.io', '2525', 'tls', '7da5a161418181', '95f0f2f05290f7', NULL, NULL, 'http://yoursite.com/auth/google/callback', '5', '30', '20', '10', '5', '1', NULL, 0, '', 'no', 'yes', 'yes', NULL, 'true', NULL, 'manual', 'manual', 'Binance', 'dark', NULL, 'on', NULL, 0, NULL, '55 Aylmer Road, East Finchley, London, United Kingdom, N2 0AT', NULL, NULL, NULL, NULL, '30', '40', '80', NULL, '{\"signal\":false,\"cryptoswap\":false,\"investment\":true,\"membership\":false,\"subscription\":true}', NULL, '301 East Water Street, Charlottesville, VA 22904 Virginia', 'green.css', 'Stripe', 'userRequest', NULL, 'Main-Domain', NULL, NULL, '2024-07-01 12:07:32', 'The IMF code is required to enable you to continue with this transaction. Please contact any of our nearest branches or our online customer care on representative with  support@bank.com: they will help you with the appropriate IMF code for this transaction.', 'The Federal SWIFT code is required for this transaction can be completed successfully. You can visit any of our nearest branches or contact our online customer care representative with support@bank.com: for more details of the for this transaction.', 'The COT code is required to enable you to continue with this transaction. Please contact any of our nearest branches or our online customer care on representative with support@bank.com: they will help you with the appropriate COT code for this transaction.');

-- --------------------------------------------------------

--
-- Table structure for table `settings_conts`
--

CREATE TABLE `settings_conts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `use_crypto_feature` varchar(20) NOT NULL DEFAULT 'true',
  `fee` float DEFAULT 0,
  `btc` varchar(20) NOT NULL DEFAULT 'enabled',
  `eth` varchar(20) NOT NULL DEFAULT 'enabled',
  `ltc` varchar(20) NOT NULL DEFAULT 'enabled',
  `link` varchar(20) NOT NULL DEFAULT 'enabled',
  `bnb` varchar(255) NOT NULL DEFAULT 'enabled',
  `aave` varchar(250) DEFAULT 'enabled',
  `usdt` varchar(250) NOT NULL DEFAULT 'enabled',
  `bch` varchar(255) NOT NULL DEFAULT 'enabled',
  `xlm` varchar(255) NOT NULL DEFAULT 'enabled',
  `xrp` varchar(255) NOT NULL DEFAULT 'enabled',
  `ada` varchar(255) NOT NULL DEFAULT 'enabled',
  `currency_rate` int(11) DEFAULT NULL,
  `minamt` int(11) DEFAULT NULL,
  `use_transfer` tinyint(1) DEFAULT 1,
  `min_transfer` int(11) DEFAULT 0,
  `purchase_code` varchar(191) DEFAULT 'xxxxxx',
  `transfer_charges` int(11) DEFAULT 0,
  `bnc_secret_key` varchar(191) DEFAULT NULL,
  `bnc_api_key` varchar(191) DEFAULT NULL,
  `flw_secret_hash` varchar(191) DEFAULT NULL,
  `flw_secret_key` varchar(191) DEFAULT NULL,
  `flw_public_key` varchar(191) DEFAULT NULL,
  `local_currency` varchar(20) DEFAULT NULL,
  `commission_p2p` float DEFAULT NULL,
  `enable_p2p` varchar(20) DEFAULT NULL,
  `base_currency` varchar(20) DEFAULT NULL,
  `telegram_bot_api` varchar(192) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings_conts`
--

INSERT INTO `settings_conts` (`id`, `use_crypto_feature`, `fee`, `btc`, `eth`, `ltc`, `link`, `bnb`, `aave`, `usdt`, `bch`, `xlm`, `xrp`, `ada`, `currency_rate`, `minamt`, `use_transfer`, `min_transfer`, `purchase_code`, `transfer_charges`, `bnc_secret_key`, `bnc_api_key`, `flw_secret_hash`, `flw_secret_key`, `flw_public_key`, `local_currency`, `commission_p2p`, `enable_p2p`, `base_currency`, `telegram_bot_api`, `created_at`, `updated_at`) VALUES
(1, 'false', 2, 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 500, 50, 1, 50, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'NGN', 0, 'false', NULL, '5797628824:AAFZ7AeMeVRivSL0h5wr1tU3u_MmNip3mb8', '2021-10-31 18:32:30', '2023-08-06 14:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `attch` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms_privacies`
--

CREATE TABLE `terms_privacies` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `useterms` varchar(255) NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_privacies`
--

INSERT INTO `terms_privacies` (`id`, `description`, `useterms`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Our Commitment to You:</strong></p>\r\n\r\n<p>Thank you for showing interest in our service. In order for us to provide you with our service, we are required to collect and process certain personal data about you and your activity.</p>\r\n\r\n<p>By entrusting us with your personal data, we would like to assure you of our commitment to keep such information private and to operate in accordance with all regulatory laws and all EU data protection laws, including General Data Protection Regulation (GDPR) 679/2016 (EU).</p>\r\n\r\n<p>We have taken measurable steps to protect the confidentiality, security and integrity of this data. We encourage you to review the following information carefully.</p>\r\n\r\n<p><strong>Grounds for data collection:</strong></p>\r\n\r\n<p>Processing of your personal information (meaning, any data which may potentially allow your identification with reasonable means; hereinafter &ldquo;Personal Data&rdquo;) is necessary for the performance of our contractual obligations towards you and providing you with our services, to protect our legitimate interests and for compliance with legal and financial regulatory obligations to which we are subject.</p>\r\n\r\n<p>When you use our services, you consent to the collection, storage, use, disclosure and other uses of your Personal Data as described in this Privacy Policy.</p>\r\n\r\n<p><strong>How do we receive data about you?</strong></p>\r\n\r\n<p>We receive your Personal Data from various sources:</p>\r\n\r\n<ol>\r\n	<li>When you voluntarily provide us with your personal details in order to create an account (for example, your name and email address)</li>\r\n	<li>When you use or access our site and services, in connection with your use of our services (for example, your financial transactions)</li>\r\n	<li>&nbsp;</li>\r\n</ol>\r\n\r\n<p><strong>What type of data we collect?</strong></p>\r\n\r\n<p>In order to open an account, and in order to provide you with our services we will need you to collect the following data:</p>\r\n\r\n<p><strong>Personal Data<br />\r\nWe collect the following Personal Data about you:</strong></p>\r\n\r\n<ul>\r\n	<li><em>Registration data</em>&nbsp;&ndash; your name, email address, phone number, occupation, country of residence, and your age (in order to verify you are over 18 years of age and eligible to participate in our service).</li>\r\n	<li><em>Voluntary data</em>&nbsp;&ndash; when you communicate with us (for example when you send us an email or use a &ldquo;contact us&rdquo; form on our site) we collect the personal data you provided us with.</li>\r\n	<li><em>Financial data</em>&nbsp;&ndash; by its nature, your use of our services includes financial transactions, thus requiring us to obtain your financial details, which includes, but not limited to your payment details (such as bank account details and financial transactions performed through our services).</li>\r\n	<li><em>Technical data</em>&nbsp;&ndash; we collect certain technical data that is automatically recorded when you use our services, such as your IP address, MAC address, device approximate location</li>\r\n	<li>Non Personal Data</li>\r\n</ul>\r\n\r\n<p>We record and collect data from or about your device (for example your computer or your mobile device) when you access our services and visit our site. This includes, but not limited to: your login credentials, UDID, Google advertising ID, IDFA, cookie identifiers, and may include other identifiers such your operating system version, browser type, language preferences, time zone, referring domains and the duration of your visits. This will facilitate our ability to improve our service and personalize your experience with us.<br />\r\nIf we combine Personal Data with non-Personal Data about you, the combined data will be treated as Personal Data for as long as it remains combined.</p>\r\n\r\n<p><strong>Tracking Technologies</strong></p>\r\n\r\n<p>When you visit or access our services we use (and authorize 3rd parties to use) pixels, cookies, events and other technologies (&ldquo;Tracking Technologies&ldquo;). Those allow us to automatically collect data about you, your device and your online behavior, in order to enhance your navigation in our services, improve our site&rsquo;s performance, perform analytics and customize your experience on it. In addition, we may merge data we have with data collected through said tracking technologies with data we may obtain from other sources and, as a result, such data may become Personal Data.<br />\r\nCookie Policy page.</p>\r\n\r\n<p><strong>How do we use the data We collect?</strong></p>\r\n\r\n<ul>\r\n	<li>Provision of service &ndash; we will use your Personal Data you provide us for the provision and improvement of our services to you.</li>\r\n	<li>Marketing purposes &ndash; we will use your Personal Data (such as your email address or phone number). For example, by subscribing to our newsletter you will receive tips and announcements straight to your email account. We may also send you promotional material concerning our services or our partners&rsquo; services (which we believe may interest you), including but not limited to, by building an automated profile based on your Personal Data, for marketing purposes. You may choose not to receive our promotional or marketing emails (all or any part thereof) by clicking on the &ldquo;unsubscribe&rdquo; link in the emails that you receive from us. Please note that even if you unsubscribe from our newsletter, we may continue to send you service-related updates and notifications or reply to your queries and feedback you provide us.</li>\r\n	<li>Opt-out of receiving marketing materials &ndash; If you do not want us to use or share your personal data for marketing purposes, you may opt-out in accordance with this &ldquo;Opt-out&rdquo; section. Please note that even if you opt-out, we may still use and share your personal information with third parties for non-marketing purposes (for example to fulfill your requests, communicate with you and respond to your inquiries, etc.). In such cases, the companies with whom we share your personal data are authorized to use your Personal Data only as necessary to provide these non-marketing services.</li>\r\n	<li>Analytics, surveys and research &ndash; we are always trying to improve our services and think of new and exciting features for our users. From time to time, we may conduct surveys or test features, and analyze the information we have to develop, evaluate and improve these features.</li>\r\n	<li>Protecting our interests &ndash; we use your Personal Data when we believe it&rsquo;s necessary in order to take precautions against liabilities, investigate and defend ourselves against any third-party claims or allegations, investigate and protect ourselves from fraud, protect the security or integrity of our services and protect the rights and property of the company, its users and/or partners.</li>\r\n	<li>Enforcing of policies &ndash; we use your Personal Data in order to enforce our policies, including but limited to our Terms &amp; Conditions.</li>\r\n	<li>Compliance with legal and regulatory requirements &ndash; we also use your Personal Data to investigate violations and prevent money laundering and perform due-diligence checks, and as required by law, regulation or other governmental authority, or to comply with a subpoena or similar legal process.</li>\r\n</ul>\r\n\r\n<p><strong>With whom do we share your Personal Data</strong></p>\r\n\r\n<ul>\r\n	<li>Internal concerned parties &ndash; we share your data with companies in our group, as well as our employees limited to those employees or partners who need to know the information in order to provide you with our services.</li>\r\n	<li>Financial providers and payment processors &ndash; we share your financial data about you for purposes of accepting deposits or performing risk analysis.</li>\r\n	<li>Business partners &ndash; we share your data with business partners, such as storage providers and analytics providers who help us provide you with our service.</li>\r\n	<li>Legal and regulatory entities &ndash; we may disclose any data in case we believe, in good faith, that such disclosure is necessary in order to enforce our Terms &amp; Conditions take precautions against liabilities, investigate and defend ourselves against any third party claims or allegations, protect the security or integrity of the site and our servers and protect the rights and property, our users and/or partners. We may also disclose your personal data where requested any other regulatory authority having control or jurisdiction over us, you or our associates or in the territories we have clients or providers, as a broker.</li>\r\n	<li>Merger and acquisitions &ndash; we may share your data if we enter into a business transaction such as a merger, acquisition, reorganization, bankruptcy, or sale of some or all of our assets. Any party that acquires our assets as part of such a transaction may continue to use your data in accordance with the terms of this Privacy Policy.</li>\r\n</ul>\r\n\r\n<p><strong>Transfer of data outside the EEA</strong></p>\r\n\r\n<p>Please note that some data recipients may be located outside the EEA. In such cases, we will transfer your data only to such countries as approved by the European Commission as providing an adequate level of data protection or enter into legal agreements ensuring an adequate level of data protection.</p>\r\n\r\n<p><strong>How we protect your data</strong></p>\r\n\r\n<p>We have implemented administrative, technical, and physical safeguards to help prevent unauthorized access, use, or disclosure of your personal data. Your data is stored on secure servers and isn&rsquo;t publicly available. We limit access of your data only to those employees or partners that need to know the information in order to enable the carrying out of the agreement between us.</p>\r\n\r\n<p>You need to help us prevent unauthorized access to your account by protecting your password appropriately and limiting access to your account (for example, by signing off after you have finished accessing your account). You will be solely responsible for keeping your password confidential and for all use of your password and your account, including any unauthorized use.</p>\r\n\r\n<p>While we seek to protect your data to ensure that it is kept confidential, we cannot absolutely guarantee its security. You should be aware that there is always some risk involved in transmitting data over the internet. While we strive to protect your Personal Data, we cannot ensure or warrant the security and privacy of your personal Data or other content you transmit using the service, and you do so at your own risk.</p>\r\n\r\n<p><strong>Retention</strong></p>\r\n\r\n<p>We will retain your personal data for as long as necessary to provide our services, and as necessary to comply with our legal obligations, resolve disputes, and enforce our policies. Retention periods will be determined taking into account the type of data that is collected and the purpose for which it is collected, bearing in mind the requirements applicable to the situation and the need to destroy outdated, unused data at the earliest reasonable time. Under applicable regulations, we will keep records containing client personal data, trading information, account opening documents, communications and anything else as required by applicable laws and regulations.</p>\r\n\r\n<p><strong>User Rights</strong></p>\r\n\r\n<ol>\r\n	<li>Receive confirmation as to whether or not personal data concerning you is being processed, and access your stored personal data, together with supplementary data.</li>\r\n	<li>Receive a copy of personal data you directly volunteer to us in a structured, commonly used and machine-readable format.</li>\r\n	<li>Request rectification of your personal data that is in our control.</li>\r\n	<li>Request erasure of your personal data.</li>\r\n	<li>Object to the processing of personal data by us.</li>\r\n	<li>Request to restrict processing of your personal data by us.</li>\r\n</ol>\r\n\r\n<p>However, please note that these rights are not absolute, and may be subject to our own legitimate interests and regulatory requirements.</p>\r\n\r\n<p><strong>How to Contact us?</strong></p>\r\n\r\n<p>If you wish to exercise any of the aforementioned rights, or receive more information, please contact our General Data Protection Officer (&ldquo;GDPO&rdquo;) using the details provided below:</p>\r\n\r\n<p>Email: support@onlintrade.com</p>\r\n\r\n<p>Attn. GDPO Compliance Officer</p>\r\n\r\n<p>If you decide to terminate your account, you may do so by emailing us at support@onlintrade.com. If you terminate your account, please be aware that personal information that you have provided us may still be maintained for legal and regulatory reasons (as described above), but it will no longer be accessible via your account.</p>\r\n\r\n<p><strong>Updates to this Policy</strong></p>\r\n\r\n<p>This Privacy Policy is subject to changes from time to time, at our sole discretion. The most current version will always be posted on our website (as reflected in the &ldquo;Last Updated&rdquo; heading). You are advised to check for updates regularly. In the event of material changes, we will provide you with a notice. By continuing to access or use our services after any revisions become effective, you agree to be bound by the updated Privacy Policy.</p>', 'no', '2020-12-14 15:39:57', '2022-07-05 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `testimonies`
--

CREATE TABLE `testimonies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_key` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `what_is_said` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp__transactions`
--

CREATE TABLE `tp__transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan` varchar(250) DEFAULT NULL,
  `user_plan_id` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tp__transactions`
--

INSERT INTO `tp__transactions` (`id`, `plan`, `user_plan_id`, `user`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(112, 'Standard', 18, 93, '0.046', 'ROI', '2022-08-09 10:29:04', '2022-08-09 10:29:04'),
(113, 'Standard', 18, 93, '0.046', 'ROI', '2022-08-09 10:52:59', '2022-08-09 10:52:59'),
(115, 'Standard', NULL, 93, '200', 'Investment capital', '2022-08-09 11:22:42', '2022-08-09 11:22:42'),
(116, 'SignUp Bonus', NULL, 93, '5', 'Bonus', '2022-08-16 06:27:32', '2022-08-16 06:27:32'),
(117, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-08-30 06:13:40', '2022-08-30 06:13:40'),
(118, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-08-30 06:13:40', '2022-08-30 06:13:40'),
(119, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-08-30 08:14:20', '2022-08-30 08:14:20'),
(120, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-08-30 08:14:20', '2022-08-30 08:14:20'),
(121, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-08-30 08:43:51', '2022-08-30 08:43:51'),
(122, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-08-30 08:43:51', '2022-08-30 08:43:51'),
(123, 'Credit', NULL, 158, '200', 'balance', '2022-08-30 10:32:05', '2022-08-30 10:32:05'),
(124, 'Credit reversal', NULL, 158, '100', 'balance', '2022-08-30 10:32:27', '2022-08-30 10:32:27'),
(125, 'Subscribed MT4 Trading', NULL, 93, '30', 'MT4 Trading', '2022-08-31 05:19:19', '2022-08-31 05:19:19'),
(126, 'Subscribed MT4 Trading', NULL, 93, '40', 'MT4 Trading', '2022-08-31 09:01:26', '2022-08-31 09:01:26'),
(127, 'Standard', NULL, 93, '200', 'Plan purchase', '2022-09-02 15:22:41', '2022-09-02 15:22:41'),
(128, 'Standard', NULL, 93, '200', 'Investment capital', '2022-09-02 16:44:49', '2022-09-02 16:44:49'),
(129, 'Standard', NULL, 93, '200', 'Plan purchase', '2022-09-02 18:02:31', '2022-09-02 18:02:31'),
(130, 'Subscribed MT4 Trading', NULL, 93, NULL, 'MT4 Trading', '2022-09-20 01:40:02', '2022-09-20 01:40:02'),
(131, 'Subscribed MT4 Trading', NULL, 93, '30', 'MT4 Trading', '2022-09-20 09:26:40', '2022-09-20 09:26:40'),
(132, 'Subscribed MT4 Trading', NULL, 93, '30', 'MT4 Trading', '2022-09-21 00:14:49', '2022-09-21 00:14:49'),
(133, 'Credit', NULL, 156, '200000', 'Profit', '2022-10-28 05:59:52', '2022-10-28 05:59:52'),
(134, 'Credit reversal', NULL, 156, '200000', 'balance', '2022-10-28 06:00:20', '2022-10-28 06:00:20'),
(135, 'Credit reversal', NULL, 156, '200000', 'Profit', '2022-10-28 06:00:34', '2022-10-28 06:00:34'),
(136, 'Credit', NULL, 156, '200000', 'balance', '2022-10-28 06:01:01', '2022-10-28 06:01:01'),
(137, 'Credit', NULL, 156, '200', 'balance', '2022-10-28 06:01:17', '2022-10-28 06:01:17'),
(138, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-10-28 06:05:21', '2022-10-28 06:05:21'),
(139, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-10-28 06:05:21', '2022-10-28 06:05:21'),
(140, 'Credit', NULL, 158, '100', 'balance', '2022-10-29 00:26:45', '2022-10-29 00:26:45'),
(141, 'Credit', NULL, 93, '100', 'balance', '2022-11-04 06:43:24', '2022-11-04 06:43:24'),
(142, 'Credit', NULL, 93, '100', 'Profit', '2022-11-04 06:43:56', '2022-11-04 06:43:56'),
(143, 'Credit', NULL, 93, '100', 'Ref_Bonus', '2022-11-04 06:44:45', '2022-11-04 06:44:45'),
(144, 'Credit', NULL, 93, '100', 'Bonus', '2022-11-04 06:45:11', '2022-11-04 06:45:11'),
(145, 'Credit', NULL, 93, '100', 'Profit', '2022-11-04 06:46:01', '2022-11-04 06:46:01'),
(146, 'Credit', NULL, 93, '100', 'Profit', '2022-11-04 06:47:18', '2022-11-04 06:47:18'),
(147, 'Debit', NULL, 93, '100', 'Bonus', '2022-11-04 06:47:38', '2022-11-04 06:47:38'),
(148, 'Debit', NULL, 93, '100', 'Ref_Bonus', '2022-11-04 06:47:58', '2022-11-04 06:47:58'),
(149, 'Debit', NULL, 93, '100', 'Profit', '2022-11-04 06:48:22', '2022-11-04 06:48:22'),
(150, 'Debit', NULL, 93, '100', 'balance', '2022-11-04 06:48:38', '2022-11-04 06:48:38'),
(151, 'Credit', NULL, 93, '100', 'Deposit', '2022-11-04 06:48:52', '2022-11-04 06:48:52'),
(152, 'Debit', NULL, 93, '100', 'Deposit', '2022-11-04 06:49:11', '2022-11-04 06:49:11'),
(153, 'Credit', NULL, 93, '100', 'Ref_Bonus', '2022-11-05 01:26:44', '2022-11-05 01:26:44'),
(154, 'Credit', NULL, 156, '100', 'balance', '2022-11-05 01:36:03', '2022-11-05 01:36:03'),
(155, 'Credit', NULL, 158, '100', 'balance', '2022-11-05 01:36:03', '2022-11-05 01:36:03'),
(156, 'Debit', NULL, 93, '100', 'balance', '2022-11-05 01:36:27', '2022-11-05 01:36:27'),
(157, 'Debit', NULL, 156, '100', 'balance', '2022-11-05 01:36:27', '2022-11-05 01:36:27'),
(158, 'Debit', NULL, 158, '100', 'balance', '2022-11-05 01:36:27', '2022-11-05 01:36:27'),
(159, 'Purchase Course', NULL, 93, '2000', 'Education', '2022-11-05 03:23:24', '2022-11-05 03:23:24'),
(160, 'Standard', NULL, 93, '200', 'Plan purchase', '2022-11-10 05:17:43', '2022-11-10 05:17:43'),
(161, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-10 05:53:37', '2022-11-10 05:53:37'),
(162, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-10 05:53:37', '2022-11-10 05:53:37'),
(163, 'Credit', NULL, 93, '100', 'balance', '2022-11-10 07:09:20', '2022-11-10 07:09:20'),
(164, 'Credit', NULL, 156, '100', 'balance', '2022-11-10 07:09:20', '2022-11-10 07:09:20'),
(165, 'Credit', NULL, 158, '100', 'balance', '2022-11-10 07:09:20', '2022-11-10 07:09:20'),
(166, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:28:03', '2022-11-11 02:28:03'),
(167, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:36:46', '2022-11-11 02:36:46'),
(168, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-11 02:36:46', '2022-11-11 02:36:46'),
(169, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:40:38', '2022-11-11 02:40:38'),
(170, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-11 02:40:38', '2022-11-11 02:40:38'),
(171, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:40:49', '2022-11-11 02:40:49'),
(172, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-11 02:40:49', '2022-11-11 02:40:49'),
(173, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:42:13', '2022-11-11 02:42:13'),
(174, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-11 02:42:13', '2022-11-11 02:42:13'),
(175, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-11 02:47:09', '2022-11-11 02:47:09'),
(176, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-11 02:47:09', '2022-11-11 02:47:09'),
(177, 'Deposit Bonus for $ 100 deposited', NULL, 93, '2', 'Bonus', '2022-11-17 03:20:39', '2022-11-17 03:20:39'),
(178, 'Credit', NULL, 151, '40', 'Ref_bonus', '2022-11-17 03:20:39', '2022-11-17 03:20:39'),
(179, 'Standard', NULL, 93, '200', 'Investment capital for cancelled plan', '2022-11-25 12:47:05', '2022-11-25 12:47:05'),
(180, 'Standard', NULL, 170, '200', 'Plan purchase', '2023-02-13 19:14:24', '2023-02-13 19:14:24'),
(181, 'Standard', 22, 170, '80', 'ROI', '2023-02-13 20:10:14', '2023-02-13 20:10:14'),
(182, 'Standard', 22, 170, '80', 'ROI', '2023-02-13 21:05:44', '2023-02-13 21:05:44'),
(183, 'Standard', 22, 170, '80', 'ROI', '2023-02-13 22:00:42', '2023-02-13 22:00:42'),
(184, 'Standard', 22, 170, '80', 'ROI', '2023-02-13 22:50:28', '2023-02-13 22:50:28'),
(185, 'Standard', NULL, 170, '200', 'Investment capital', '2023-02-13 23:15:34', '2023-02-13 23:15:34'),
(186, 'Credit', NULL, 172, '500', 'Profit', '2023-02-23 15:53:52', '2023-02-23 15:53:52'),
(187, 'Credit', NULL, 171, '2006', 'Profit', '2023-02-23 18:04:19', '2023-02-23 18:04:19'),
(188, 'Credit', NULL, 171, '1000', 'Deposit', '2023-02-23 18:04:34', '2023-02-23 18:04:34'),
(189, 'Credit', NULL, 171, '200', 'balance', '2023-02-23 18:04:49', '2023-02-23 18:04:49'),
(190, 'Credit', NULL, 171, '2006', 'balance', '2023-02-23 18:05:02', '2023-02-23 18:05:02'),
(191, 'Credit', NULL, 181, '7000', 'Deposit', '2023-03-15 12:59:00', '2023-03-15 12:59:00'),
(192, 'Credit', NULL, 181, '906677', 'Profit', '2023-03-15 12:59:23', '2023-03-15 12:59:23'),
(193, 'Credit', NULL, 178, '5000.00', 'Profit', '2023-03-27 01:02:28', '2023-03-27 01:02:28'),
(194, 'Credit', NULL, 190, '400000', 'Profit', '2023-03-27 13:56:00', '2023-03-27 13:56:00'),
(195, 'Credit', NULL, 197, '5000.00', 'Deposit', '2023-04-03 19:15:38', '2023-04-03 19:15:38'),
(196, 'Credit', NULL, 199, '700', 'Profit', '2023-04-11 15:15:24', '2023-04-11 15:15:24'),
(197, 'Basic Plan', NULL, 197, '200', 'Plan purchase', '2023-04-20 11:35:36', '2023-04-20 11:35:36'),
(198, 'Basic Plan', NULL, 197, '300', 'Plan purchase', '2023-04-24 21:36:53', '2023-04-24 21:36:53'),
(199, 'Basic Plan', NULL, 197, '300', 'Plan purchase', '2023-04-24 21:40:35', '2023-04-24 21:40:35'),
(200, 'AMATUER AI', NULL, 197, '200', 'Plan purchase', '2023-04-24 23:02:27', '2023-04-24 23:02:27'),
(201, 'Credit', NULL, 197, '200', 'Profit', '2023-04-25 01:34:48', '2023-04-25 01:34:48'),
(202, 'Credit', NULL, 197, '300', 'Profit', '2023-04-25 01:39:45', '2023-04-25 01:39:45'),
(203, 'Credit reversal', NULL, 197, '2000', 'balance', '2023-04-25 01:56:33', '2023-04-25 01:56:33'),
(204, 'Credit', NULL, 199, '500', 'Bonus', '2023-04-25 06:29:58', '2023-04-25 06:29:58'),
(205, 'AMATUER AI', 23, 197, '4', 'ROI', '2023-04-25 09:59:17', '2023-04-25 09:59:17'),
(206, 'AMATUER AI', 24, 197, '6', 'ROI', '2023-04-25 09:59:22', '2023-04-25 09:59:22'),
(207, 'AMATUER AI', 25, 197, '6', 'ROI', '2023-04-25 09:59:23', '2023-04-25 09:59:23'),
(208, 'AMATUER AI', 26, 197, '4', 'ROI', '2023-04-25 09:59:24', '2023-04-25 09:59:24'),
(209, 'AMATUER AI', 23, 197, '4', 'ROI', '2023-04-25 09:59:47', '2023-04-25 09:59:47'),
(210, 'AMATUER AI', 23, 197, '4', 'ROI', '2023-04-25 10:00:11', '2023-04-25 10:00:11'),
(211, 'AMATUER AI', NULL, 197, '500', 'Plan purchase', '2023-04-25 10:03:58', '2023-04-25 10:03:58'),
(212, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:05:09', '2023-04-25 10:05:09'),
(213, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:05:15', '2023-04-25 10:05:15'),
(214, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:10:12', '2023-04-25 10:10:12'),
(215, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:15:10', '2023-04-25 10:15:10'),
(216, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:15:19', '2023-04-25 10:15:19'),
(217, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:20:10', '2023-04-25 10:20:10'),
(218, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:20:17', '2023-04-25 10:20:17'),
(219, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:25:10', '2023-04-25 10:25:10'),
(220, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:25:18', '2023-04-25 10:25:18'),
(221, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:30:13', '2023-04-25 10:30:13'),
(222, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:35:10', '2023-04-25 10:35:10'),
(223, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:35:18', '2023-04-25 10:35:18'),
(224, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:40:10', '2023-04-25 10:40:10'),
(225, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:40:20', '2023-04-25 10:40:20'),
(226, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:45:09', '2023-04-25 10:45:09'),
(227, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:50:11', '2023-04-25 10:50:11'),
(228, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:50:20', '2023-04-25 10:50:20'),
(229, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 10:55:08', '2023-04-25 10:55:08'),
(230, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 10:55:14', '2023-04-25 10:55:14'),
(231, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:00:10', '2023-04-25 11:00:10'),
(232, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:00:20', '2023-04-25 11:00:20'),
(233, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:05:11', '2023-04-25 11:05:11'),
(234, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:10:13', '2023-04-25 11:10:13'),
(235, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:10:22', '2023-04-25 11:10:22'),
(236, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:15:10', '2023-04-25 11:15:10'),
(237, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:15:19', '2023-04-25 11:15:19'),
(238, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:20:11', '2023-04-25 11:20:11'),
(239, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:25:12', '2023-04-25 11:25:12'),
(240, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:25:19', '2023-04-25 11:25:19'),
(241, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:30:10', '2023-04-25 11:30:10'),
(242, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:30:20', '2023-04-25 11:30:20'),
(243, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:35:12', '2023-04-25 11:35:12'),
(244, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:35:21', '2023-04-25 11:35:21'),
(245, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:40:12', '2023-04-25 11:40:12'),
(246, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:45:10', '2023-04-25 11:45:10'),
(247, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:45:18', '2023-04-25 11:45:18'),
(248, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:50:10', '2023-04-25 11:50:10'),
(249, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 11:50:12', '2023-04-25 11:50:12'),
(250, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 11:55:10', '2023-04-25 11:55:10'),
(251, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:00:14', '2023-04-25 12:00:14'),
(252, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:00:21', '2023-04-25 12:00:21'),
(253, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:05:11', '2023-04-25 12:05:11'),
(254, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:05:19', '2023-04-25 12:05:19'),
(255, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:10:13', '2023-04-25 12:10:13'),
(256, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:10:18', '2023-04-25 12:10:18'),
(257, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:15:10', '2023-04-25 12:15:10'),
(258, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:20:11', '2023-04-25 12:20:11'),
(259, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:20:18', '2023-04-25 12:20:18'),
(260, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:25:12', '2023-04-25 12:25:12'),
(261, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:25:21', '2023-04-25 12:25:21'),
(262, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:30:13', '2023-04-25 12:30:13'),
(263, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:35:10', '2023-04-25 12:35:10'),
(264, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:35:18', '2023-04-25 12:35:18'),
(265, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:40:11', '2023-04-25 12:40:11'),
(266, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:40:19', '2023-04-25 12:40:19'),
(267, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:45:10', '2023-04-25 12:45:10'),
(268, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:45:15', '2023-04-25 12:45:15'),
(269, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:50:10', '2023-04-25 12:50:10'),
(270, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 12:55:12', '2023-04-25 12:55:12'),
(271, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 12:55:18', '2023-04-25 12:55:18'),
(272, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:00:12', '2023-04-25 13:00:12'),
(273, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:00:21', '2023-04-25 13:00:21'),
(274, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:05:10', '2023-04-25 13:05:10'),
(275, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:10:11', '2023-04-25 13:10:11'),
(276, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:10:16', '2023-04-25 13:10:16'),
(277, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:15:11', '2023-04-25 13:15:11'),
(278, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:15:15', '2023-04-25 13:15:15'),
(279, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:20:12', '2023-04-25 13:20:12'),
(280, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:20:19', '2023-04-25 13:20:19'),
(281, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:25:12', '2023-04-25 13:25:12'),
(282, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:30:12', '2023-04-25 13:30:12'),
(283, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:30:20', '2023-04-25 13:30:20'),
(284, 'AMATUER AI', 23, 197, '40', 'ROI', '2023-04-25 13:35:13', '2023-04-25 13:35:13'),
(285, 'AMATUER AI', 27, 197, '100', 'ROI', '2023-04-25 13:35:21', '2023-04-25 13:35:21'),
(286, 'Credit', NULL, 197, '700', 'balance', '2023-08-07 11:20:38', '2023-08-07 11:20:38'),
(287, 'Credit', NULL, 197, '700', 'balance', '2023-08-07 11:24:17', '2023-08-07 11:24:17'),
(288, 'Credit', NULL, 197, '700', 'balance', '2023-08-07 11:33:46', '2023-08-07 11:33:46'),
(289, 'Credit', NULL, 197, '450.00', 'balance', '2023-08-07 11:34:54', '2023-08-07 11:34:54'),
(290, 'Credit', NULL, 197, '200', 'balance', '2023-08-07 11:40:17', '2023-08-07 11:40:17'),
(291, 'Credit reversal', NULL, 197, '200', 'balance', '2023-08-07 11:42:17', '2023-08-07 11:42:17'),
(292, 'Credit', NULL, 197, '7000', 'balance', '2023-08-07 11:46:51', '2023-08-07 11:46:51'),
(293, 'Credit', NULL, 197, '450.00', 'balance', '2023-08-07 11:48:38', '2023-08-07 11:48:38'),
(294, 'Credit reversal', NULL, 197, '45000', 'balance', '2023-08-07 11:49:52', '2023-08-07 11:49:52'),
(295, 'Credit', NULL, 210, '70000', 'balance', '2023-08-09 01:34:51', '2023-08-09 01:34:51'),
(296, 'Credit', NULL, 212, '500', 'balance', '2023-08-13 18:11:50', '2023-08-13 18:11:50'),
(297, 'Credit', NULL, 220, '500', 'balance', '2023-08-14 11:05:19', '2023-08-14 11:05:19'),
(298, 'Credit', NULL, 218, '500', 'balance', '2023-08-14 12:20:43', '2023-08-14 12:20:43'),
(299, 'Credit', NULL, 218, '5000', 'balance', '2023-08-14 12:23:41', '2023-08-14 12:23:41'),
(300, 'Credit', NULL, 219, '5000', 'balance', '2023-08-14 12:34:55', '2023-08-14 12:34:55'),
(301, 'Credit', NULL, 222, '500', 'balance', '2023-08-14 12:35:48', '2023-08-14 12:35:48'),
(302, 'Credit', NULL, 221, '5000', 'balance', '2023-08-14 12:36:18', '2023-08-14 12:36:18'),
(303, 'Credit', NULL, 221, '500', 'balance', '2023-08-14 12:37:05', '2023-08-14 12:37:05'),
(304, 'Credit', NULL, 223, '5000', 'balance', '2023-08-14 12:40:38', '2023-08-14 12:40:38'),
(305, 'Credit', NULL, 222, '4500', 'balance', '2023-08-14 13:05:14', '2023-08-14 13:05:14'),
(306, 'Credit', NULL, 226, '200', 'balance', '2023-08-17 19:28:18', '2023-08-17 19:28:18'),
(307, 'Credit', NULL, 218, '200', 'balance', '2023-08-23 06:11:15', '2023-08-23 06:11:15'),
(308, 'Credit', NULL, 218, '500', 'balance', '2023-08-23 11:03:11', '2023-08-23 11:03:11'),
(309, 'Credit', NULL, 218, '50', 'balance', '2023-08-23 11:06:08', '2023-08-23 11:06:08'),
(310, 'Credit', NULL, 239, '700', 'balance', '2023-09-01 00:14:02', '2023-09-01 00:14:02'),
(311, 'Credit', NULL, 240, '40000', 'balance', '2023-09-04 12:44:21', '2023-09-04 12:44:21'),
(312, 'Credit', NULL, 240, '105000000', 'balance', '2023-09-06 06:08:10', '2023-09-06 06:08:10'),
(313, 'Credit', NULL, 241, '1', 'balance', '2023-09-08 06:43:12', '2023-09-08 06:43:12'),
(314, NULL, NULL, 241, '1', 'balance', '2023-09-08 07:33:18', '2023-09-08 07:33:18'),
(315, 'Credit', NULL, 241, '15806', 'balance', '2023-09-14 10:07:22', '2023-09-14 10:07:22'),
(316, 'Credit', NULL, 255, '5000', 'balance', '2024-03-09 09:35:11', '2024-03-09 09:35:11'),
(317, 'Credit', NULL, 255, '500', 'balance', '2024-06-30 14:35:55', '2024-06-30 14:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `trade_mode` varchar(255) DEFAULT 'on',
  `act_session` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `currency` varchar(23) NOT NULL DEFAULT 'USD'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `kyc_id`, `name`, `lastname`, `middlename`, `amount`, `usernumber`, `pin`, `pinstatus`, `action`, `limit`, `accounttype`, `allowtransfer`, `transferaction`, `code1`, `code2`, `code3`, `codestatus`, `signalstatus`, `email`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `dob`, `cstatus`, `userupdate`, `assign_to`, `address`, `country`, `phone`, `dashboard_style`, `bank_name`, `account_name`, `account_number`, `swift_code`, `acnt_type_active`, `btc_address`, `eth_address`, `ltc_address`, `usdt_address`, `plan`, `user_plan`, `account_bal`, `roi`, `bonus`, `ref_bonus`, `signup_bonus`, `auto_trade`, `bonus_released`, `ref_by`, `ref_link`, `account_verify`, `entered_at`, `activated_at`, `last_growth`, `status`, `trade_mode`, `act_session`, `remember_token`, `current_team_id`, `profile_photo_path`, `withdrawotp`, `sendotpemail`, `sendroiemail`, `sendpromoemail`, `sendinvplanemail`, `created_at`, `updated_at`, `zipcode`, `city`, `currency`) VALUES
(255, 35, 'eva', 'eva', 'kovc', NULL, '88267380879', '1234', 0, NULL, 500000, 'Savings Account', 0, 1, '0744366', '8575019', '8980908', NULL, NULL, 'evakovac929@gmail.com', 'eva123', '2024-03-09 09:09:02', '$2y$10$VnaMsZNAWD0DJfsXD4FXXuR/Ozjn3baHn8grBAAbyKMuhPlAqjfH.', NULL, NULL, '2024-03-05', NULL, NULL, NULL, 'Lag', 'Nigeria', '+2341234567890', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 481175, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://remedydevcodes.com/ref/eva123', 'Verified', NULL, NULL, NULL, 'active', 'on', NULL, 'ofdeY2VM3Xe0mqpJ2gjnfLegHhB9L8mjb2X8sWq3Va5QpbVGQqMMcQ7ct1eH', NULL, '9swxFYwoman.jpeg1719599314', NULL, 'Yes', 'Yes', 'Yes', 'Yes', '2024-03-09 09:02:43', '2024-06-30 22:33:39', NULL, NULL, 'USD'),
(256, 36, 'remedy', 'kova', 'eva', NULL, '26988076988', '1234', 0, NULL, 500000000, 'Business Account', 0, 0, '5036246', '2307951', '9099222', NULL, NULL, 'remedynulled@gmail.com', 'remedy123', '2024-03-09 09:09:02', '$2y$10$1QlQpUO4ugLWliAr7A0JtemXpY3QF2w7IH4lR4fkTVhQYajX0un7u', NULL, NULL, '2024-07-12', NULL, NULL, NULL, 'no 23 lagos road', 'Monaco', '+2341234567890', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://remedydevcodes.com/ref/remedy123', 'Verified', NULL, NULL, NULL, 'active', 'on', NULL, NULL, NULL, 'RA3D9Qwu.jpg1719837664', NULL, 'Yes', 'Yes', 'Yes', 'Yes', '2024-07-01 10:50:21', '2024-07-01 13:54:26', NULL, NULL, 'DKK');

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `income` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wdmethods`
--

CREATE TABLE `wdmethods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `minimum` varchar(255) DEFAULT NULL,
  `maximum` varchar(255) DEFAULT NULL,
  `charges_amount` varchar(255) DEFAULT NULL,
  `charges_type` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `img_url` text DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `wallet_address` text DEFAULT NULL,
  `barcode` text DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `methodtype` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `defaultpay` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wdmethods`
--

INSERT INTO `wdmethods` (`id`, `name`, `minimum`, `maximum`, `charges_amount`, `charges_type`, `duration`, `img_url`, `bankname`, `account_name`, `account_number`, `swift_code`, `wallet_address`, `barcode`, `network`, `methodtype`, `type`, `status`, `defaultpay`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', '50', '10003445566', '0', 'percentage', 'Instant', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAN4AAADjCAMAAADdXVr2AAAAwFBMVEX+rwD////+/v7t7e3s7Oz+rgD6+vr39/f09PTx8fH+rAD7+/vs7e/s7/P+yWru6d3++e37tyn4w2P1zYH49vH4v1T8sgD8sw/+1Yv+/PX9xFv6uzjs6uL+7sz++Oru6Nj+0n/v4L72yXLx3bX+2ZT+5rbv5tDu4sX5vkb+9N3y2q/+78300Yv25cD+36X+yGD005j+5LHy1qL3yGz+3qD+wlH+vDX+zGjz1Zv6vEv48Nzz2Kj9uSP6uz/+4LT8z3aW1ss+AAAfEUlEQVR4nNVdCVsaPdeehbBkkiou4AgCgoKoVK2CrcX2//+rL8ss2ScD2Pf5cnlpTGbJPUnOlpOTICIp7MQktUOab5BcgxW2aWGHFoassEmyYassVOsTpZ4+tNGihU1aH7NCoT421bOW0MIo4S2RS0NeWr5faHQiN4o9ICjgNTR4DQUea15ZWFXPm08f1SzbZK8v4fGWJEVLhC8VCfDURidyo/4NvJCkBNNEc2GzzGKE/j/DQwhh3ExHy6s/P55PTy4vL9e/Pj8/f63Pz98nNy9/ZvPxkIxoivnr4LEP2WmQ1Ka5iObIiCepTXMdVs8KmzTXork4NNUnRT0vHI5nj9Onz24PwCIBCIr/QK8/WP+9uB0dky5FjYbSkqRsCS9tlaVejaalQYemVpOkFs21E5JL2nJhhxY2WWGb5podaz0pTJKkM55dnHR7DARNQRDQX/RvwP7QH5rYFdvzycvyLMFtuSU0l7DHd5qmUuX9QqN5++ilQVwSRdKZjYzoNSSi1igL6WAI+WAw1SPyiUcvk89eBoyjAhwLywQ8U/7DQQab15+LGKFEaUkcF0S5XZY25EbHSqP5CKaXZvCUaVOO9aZ9rKtEsRMjPFzd3AV5n4EcV/5HyGj/0Js20/sRH+ESfdKmVVg0Omop07acoPFB4RFKeHR90iXYAB99oPwt9h4A+eBk1UFWyv4h9/Yvb0dhCx0OnolqxMVUbtqnslyfXk02oOw2Swoq6mkvbr/djxHK6ENcUq0qUqfSH3pp0KapxVKZNRa2HIUfN4MCWpBPLd5vWe/lHRiURaC8Ich6mhUThNOF+Ca/9qmFNH8IxpDeXgZV3VYzQXj3/YhyixqMQe1ixhj2ZOvtMP3epfPt0AnC/ukco/+p1ILw/Gb7BdhYAjB4vQ5NVKM2vIYFnpHP5PAQGk/7XwUuA/j0QABa4DUs8BoKvIgy/LjNymKaTVghzbLCiBVyQkyzHVbYOjr9UnAZwG/LKKLvjDkjYk0pGt0xNpq3j5YGirioMgbrVMbDxy8HxxIEr3MvUmdkDLuxdYR+fNmc0wH2btLwX0ot+Hrwz8AFdIj2X8J/Bi8cvQbw34HjAO8eFFHND94Oc+/WOS5B8Sv/FwBJ48szIFCf4noqDB6HuP7cq0s58fi1AFc1PjkuAPrdu/Pp49vLy2q1mv3+8fw4eV9vtgGvrHxIAfDuKpQoZ2xodEuhnDX5XvO377hkWlz3283tw4dgYGmhIjtezH5OuWbo90QIL8Jd+J631BKm7462AKEhRHl7/XkdoyZXK4o2abaYcPkyGfTYWFUeYvpigw/8ZUJZGF5tq7uODEjQ/fZ9mXYw0umT0ZJ2dnQ/HQRCL1oxwt5zjL7GlJREb6ASHbmiO70+tiqNgqlJrMd4uLi568HqmQhfCYXx1xi89anmsWtgZu+G28nVWdNPH9Oz88dNUDkR4Wbe9Nf3vLX10abizWRQns9aFUNAtfGJ9UQBwcsJmYcBEMan/FLyHwxWOD6wUBauKigmhN1nooAqFlhtAhvrxQkURrdr6H4VgKfUwH1AqSV8c3YdGZXrF0ZK9oZHjVKrE/cYBfAkRnXgue2cKLxxyikQrK9SwQ6qNL+hwHPVZ8tM86kbIFwPkZedU7VSN0WDMy9sn7263gXB3aqZiDc1S9Oy0bTtqM/s0W08f3fOBrgZl6Zr2UqeFzIrtQdjSNciOgUogNtViGTBVSf8VYzBpFQuzp0fdbvAbm7mZ0oK0zv7ZyRs7i0Kv2Z9D+FZF+pyd4Gvv8AHkFpGn/aPSJjsKLSZmvaF14jx8NExBUHvGu8Lrz0aWPuOiICztt2Stj+8OMbLJzuXAMEM7yeUoSP7yIS90yF2rO/FRGbORWp57iGWJbXVlv4wfLHLuSBYVM09pWWK1EKoihXd4MHZMpQuH5bLxWJxPVelluU1KV4sHx7SyjXQuIGPnoQBqsgw/SXaXWoxosvWDeD0zGqLocMCLbbFguzdcTFBCTwymVkp+b1dGti6OoIRfrbyCNif492llifLYwnB/IHspib6eDzIxH8qJV6I8Caltg8vjd4b6voevrLKu7A7RrvCm1joMoCfc2xYvpR6ry9ot98EeNFl+c1A9wx5wGtEqVWwgAOiAFaYkowaQ9MmZwIwHVZTBRmeMPdkeJVzL6Ma33s2fJcxss+9ZrHqrohG0YtFtwTgR5RI8pS6lE/9D5I+KIxm8ATnkhOpP5fgJe71/2bePnzdtcwUOElU/4Ikf0AgW2UyrwDyN3ywyAuU24R2aTgrDMO89zg8ge/J8Aq5XfVPkJyu6GT+sHFg+B0X7xca5WLr4bGF3VBZyMdtJxQHpxuer1fS8Z15ttAPXk9qCdNLC7otocS+8ITBKcITuFgteNZGge4c1ZNaLizoKMn080qSe6+UWlR4Nvpk8koiBNTcrDui3qqmJPqAwGiFad6ahwFcjxQHArtpqF8yFXjSEurlwVnT3jSx4Ju0jHeZTUnjvhndr6HV8UMdArEIb1/GUHQM6tiG1aqGUGaWNOFgiJxeSdK0OSRbF6eVuf9Ab+QrtYQ3ZnRE/nE7XanwCtJySHiR2dwKnzxMSbQsXKqLWPx+SjMleDaWJcNTey/U4EnM0w2PjjiLFgN/YgO8ju4V8Gm6HfQIv8sXnJSlfL7g1JFX0aTeK+rJTTK8Yv3f7J/A5JFsbauTlaZG/g76c5Q3qpNfqjMG/Gi8GcxUpXBHxtDwZAyCjqpQDTQ2ymfwKaw2JaG5eWj/xvWcjR1Sy85sPSpMFEbKDqUFeIvUYhzZ8BTX9KX2EcrAjvAa4ZWpD0B/VAnvpxHd2sA9/rnMKcAzE3dCwiqEsuOt6bNs50g3yFTPvVJqOejcY5caBxm4ailzT6ac+FS+i7cErOjnUJfqVSeojlSvsXVOGdsq5UT5TdWUUyxFRyb1Ft6dleScUU6J76GxScmDpwpfq8X3VLYu8D2wC9/LSvHMNP3grUtqwaYuJ+K4Mi3+p0JZXqoOtOyBaWiFhxamO/pjZIUXNqmtNrN1ULstnzYkQ+ABofdCZrZFdCOA0HuQwGM37QCv0TRpf/BGgSdoDNhg+APwh2Wpnpl5R0c0HdN0JGWHfeGdT2lePzo+Fntv+0ELh6mvxiCRsqVhJoHusaQxCEpS88r0Oc4dWths0LWmQPC/6isVRWMCVrL5vJx8/zhrNn38C8psyyRfwZuWqO9Rq0/eMYbeBsEyNPhw0ZvaaO7yEJcfU1FB7daDi2XNPURx19B9ZC4xUxbX1gW2ubKNZYsvNb632cZFD6MqZ5H8WgrxboWRF1vnhfja1OJTbJJa4pZh5sFB6oD3+wDwpGshXBdrkj4b3PCJYbz1h6LUkrMstNBdSAI4E4SuXClsVMLbPcFgwk0Cmp1T9ArIC9HYwNzhMy7tnMUCPn43dN4lN/garNDkJr/eq0rKtQB+jlUrteYVUDbaQF0y0ze3UhdUY6l/CEJXHLs+WuHtl/jkwv4KN7Q1Bour+NnA0H0vWDMlmSybcBK6doAZ4YnzTZ97Jnldu5Zbnf12gDUN5I2IWbrUommIhKaN6sM7RALBPfaE12roq+MALJACz9RU0nnO/Xs79J4Ri34tM+z4wSOitd7wKc7h5UKPztKp8uvaceXovT1IS/7uIfKae4SSG7pve4Syucdbjub6Yh58xRZ1NVdnj/oW/1L73DOIGSZ4AXwPyw/r3uCmf2RArS6iKYkQWG3qBXQEO3eAocXTNjB5eu9HWji+F1zN1vlk0Q0M8C6Ud4DprkfwMo4r4BENqDNa3WxEz5q9KKdY3Kc+AT7wwje9+4ikLMBrz6VRRrMALnAlPOZzFqarX4qXdyFHau3WwdquhVNfeKluFoTfQ8GUZDCxwLW6eOOKOvCj78EjMgBeBIdSz7nv5lJ9VQV+ilEHzj613SDwWfGXzPwLTEJaJ0mWG/EV+zIG3oK/kSHqQKK7KrQXhqfO2aWM76GrQNPDgqNaUQfMFsSy3RX6oPFGypgyvhdGuquCsO6jm4jgIy7YOr7QCDx8dXgdGbflX7n6qacntgvfiY9MIL9t+fhFh3dXSi3xp7ZVCd7jukEV+Pw1UU74LUzTdEjTWZrm2eXqYuPcXAMHnvDQSJcog3FuSkLzvjpaQG9YM+pAuWItkWCupfLFZ+rhmO1zoFlGc0tfjtKoXSrwS9+oA0yZExEA+JtuxKK7UFq/oQwPkLFpXop3mnZMhkfeDd+alpuarRvHmIYvzbbxVZqrg2F0TmktYwzvUOu92x3C0SyLT6gOTmmNQVLlmuFVHwSBmcoSAuAZdUA3yYNumgll4VaFB/ppWLECpK8QJanBcMWbKa0QqTvAVlYqCjbYRyijW5U1owsZ2YhJLWwtXfRsJGNzHVYtcBnghfQdedSLIvwFcMOLIrbDpbgpyCOcsF9DT3j4GXKRobwbvmEO7xaqjIhI3B5RB5T6JPwGM9FElE8q4FGTJF3MLyIOlR+Z3Dh3wROWdGSNh9OzvxxeNJG3XFG6uYzEXf3i2hRfWkqSsj4p6gvaohB77vBILyzX/5PclYCUrmyjE87ohfzSjrzglgjvT+JOrNlcwOeQmZLigcr14GfVVDYxhg6ywpO8knTPdSITWuDd4kp1NiN1mqmI9BE1JaFhoEpJTJmvHyuJwbOwdWEBTN8Bhvn40Xk7V/p8ggmFt7rWsAoJW0fXWUwqoeLn7vCkbit7zwmvbTL/sxu/e8Nb6jffUHj4J9T0FKZJ7gFPTB69186XsnbvvSjcaDc/EXgN0ihlcMLN0e5zL+cxWYgr1uiqudce9cq1TvHLwJX33AsFVzP+biqyBlGy1uCdFFEHXKv6Wj2b3kWcroIxAE45uX8BvT8WnLT4EBhn8IRQdOwZcBHxS2NTvBbJVYFxvvLdlPn1xygI0y1QtD14WoybRgVbl/mexdeygu8RpVFdvSlu9OV71JVAf8Y1gccGhtx7v8tpUUtqubBRTqfUQto8s1FOX6mFKEXzvnIzgDMC7wEq8AD/ZjvCq9t7DN7U5gLuK3OS7FCTeInGHlCRLJCGJ9H1dgxgeVEqtKV85dYYeFCFQdnd2fRjP3DqqzGQpDqt0Ntx0HrTem+wW9SAtlXhs+t7LNu6B4E+MIMa+h5THbUhANfNgNsApal3uUuMwNDN90J71AEUD2zigLe2TpO2kgk3RChjWozYe3CyYwDLHYUyvsJqYntbT1sL95rSVvpAj0gt51CROeHboeAJvWeFF4v+FYo5660WvIVuTkqDxq9M2yvhvewYXdVXKJOiDkj8SjaI+No5s6gDc9UgAYJRMBwAtfdutdi4yvq9ZqXm9dioEDF4kSXqQHL2mEtuGjz4HmUvVWPjaq4M7FEfijWQQFoGx1vVbAyv0V6MQeq4nDFwwx+9HyHEb0IYD3/bN8UDcF0vgOVIY3zgOjjuafDm6NBSy+VwPB6PWBqP8+ziftJVzLiSaPjkuUKU0YI41RR2OCPDE6iUc7wPvLKtZuOe0DvcCK9o9kV1b14PXkMP/gDvOTz56cPdoorbey8Ql1CEKMcaLlGlfvNenc03HWruARyePDgBhWeeW95zz9IjxmS79hgVvN8zqrgJ3hgolBMEXgEs7eqsqfccyCzXgvWoEEz9YvViHd6fYKwKRKAX7s3WTbCAnrVdy/6F3YewVlxqwT0QCPDUwXkAeNbeU1YynNdCasnbDV7+hLz3xE97oN7LH5tbJHRC4vgnwzeqC0+R6v5Uzb3aGsNec0/Ft03RnnPPQDnPOkIoAsNSvXiqgVDfTC7U3quAV5nga1OIRVB6LRhdGXTH/4zvAXlSDM0xtjRvXLspycLLKlFrhdQ/JZfmDd64XnxPllrAgaUWlmEJgvwoAygGx3d9BdD7CPeSWojMqWoMe8mcGjz6qz+wpn4gyGYG8vLuCy9OtYUYInMyjSE4nMZgmnvwJB4Oh8wn4ow5RZTuEWfp8WrSdYSzClaeUgsyagxnA80YcdvycxVQC5uazAlyeNjhf9BsHt9knpMGlPDOuTdFKFT1PfK4OdXWA9lKTbT1A5mS8oe6TUm0cGkNqEU9h/1MSbq2DkYB3+v5NbaWQt+rWiEKadBdc+9Ra+UetpaY8frDWcrEbvOHF/HN9iZ41IPIC562q4JayqiBRFliuCzhmXdX1jIlBZXwGPMMdcep/O4ZUndfynw4g2e0c+Jn3UpdrOon+YJTkhRL9SSXKPUdXo81mbPoPXpptv6fJEWYbPGhiXnPdcD8VtmlhddC5nXQlAtDg5U6CjJPa8EQaFtj8FVnBdk59ymrWGPg9CnNgznIq3yAdEL9NQbm2TLF/4kVomzfuu32IN1jhej4f7++l8FbWrg7vNpjfS/dQmk4SKuz/7T3ji3EJQvUVQFvprqm0Z0KAd2/r/beyR5zT/QpA6VPmcfcC8vJF/DPnc1ieIGr5x56hsqtNMJJQAMNKPDAZogql+oNUQc0z4hcW5ejDminIuT+B/G5GoOXP4qPJs3roCkVSp4R/KsMIqNfC7D4tfjzPUXJ8eF7pJ7Jh6bBOVUvjXW+Z/FrKbySxIoDeSV5wsujDui0L7v9ZA+vpP+AT1kWCMcY5cIXnsWnLPMIlI1ln+qsr6kxKK+q0hiyFSPbPnEyOKs1BotHING3TP6c8lp/pddAqe9piVHOlvWmMptMbXzv1Kh6yvcb/DnPeNQBozeu+2tFDsYQFBQzf2bGGCInY0DmAEj09ptKxqDsP6Tvhn8xcxXXfKmDXX2pJzljyDSs3E/Mi63jV6geAppxMXhbydapYpB90Px37kudecJLHbuTJzzzpTZ+fg94+IfVZAiXu3vCh5wjqqzhNqxv50zP/WTOnHkVxksCDy9ssW/pt660c5r3MfCoA8kfHd5r4jhGt208ZrdpkxmV2Limh+KZ7V6qXjtcGfij8A99FwqLmEt3Ph9oDxG+hkLXiRJSFWPA6VsgruRI+h7Ra6oNk7qlJttDRGfAYXaA6etrAlsPy2BCPNhQFoGojTFi/hH2rShgjvbYARbz/Xtq39bdv2dwmykftn64unq4pmlFcldXLEtzD6vfP1/7zqNdwADtuX/PvvvSHXVArhejxwl/rHMquwZC92XwudIQ6Np9yc0c2uCAz023bUOde5nIYqKcJejSISLIjccVn4LGH6hY30PGvbOojDrAdD4Fnrbz2aXOosapbMg5WIIXYeUagy4MFjufudw+1+AFvvvWSS6MF+aQffujA9tj68Gs2WRx7luPOIfcLeoA25YfLV/OlQMTrIPTBMB4bdGKt7BqAaw66sCOMSOoqna7pmEjjA0/QILrNKqC54wZkalqHhE/TOt76Np41IyirTuT6yIeJa12xI+gjPjBRaMkMcZrSZxRB0g2+quJsio8mXJa4WmDk+sKpT9nokUdSHjhWvX3oPFaskvzAJaWaDuVSyj2o2AOkAjVZEKVyxvXGm2nURErKaiKlUTKjvUF3+KXH1t3DGQaqjiD52DrhoVPPVbSLpGuItOZFHXgmQZkmYd/w2p4lZGucqqxQ5yy0GCf0pq5YwLwIgqdASy94pSVuzhMUeae3FEHDMYjrTN2gwqDl2bxJnvUg6YhwjHonhV3lZGNTZIbjRHoYgxIj5qoDc6qBJS/LA8/lxWRjVmhNUZgPsb2ifBIsrY4A3slAPvfQ2Gzwz4RHoXb68bnbKAjHd1elJPxOth/K+L3Hig+J2dpluiqjqgDA3N4VSjpOoEcbEd+PoDlLfTIsP7JTATigocc0VULeIJXwANU7CT0Y1xGfO2qoyzV05vQ/NwVG7d8paUiCITyzefd35vFsIMF/4JOUrgKdHRXBWNsXKLH8vrclFSocvjc0H3OyMZh0x7ZWAi7bYlsDODmo7xpOGxgbD0kyxRAxUBX1MjGsTCt6seljqxxqYsjzjRTkhJ2O7/JK6p4/bjUItUwdd8eUcXzj/sfiSpujjVbxITfDR6wwwN7wPOMCS+bUcyfBK7sc88qtB3yHCJ97lkj+pe8n809RnnLBXzLeQyE2CpL9Y6oBLxePsGNdG3E67PjJkAGjw0BwSmgiC+QlE4JpqgDJk0MgCuhffQBEt+jefNpGucWqcV+1oDjiLPSYC4eUCcc3LznaRoNo9Ry2LNQIje8YnAWtuB/cxaKyeoSBAc9yWZveDVOstGoAg+doX2ZYIdziITeaxReSfscUFf/HCLdFaBpO0XKtP5vdwWQTtMQPRFkylnhn6Dqe7R9ZxtjA/sf8pVM38u0dTZuso4xHeMQsDPAGvnGbv41GVVgH55ThUZZL/A9YGMMoGQM1NSdDYG8JZn9uyzNO8Z+BljeqJwxeJ7gxtEe/gS33dj6uy74M7nW/1hdLXgGx1f3/L0qeP/s/L1clcv4mOv0xMgadSBnWbzedpKNIrXEsf101xJebud0n54YS/4FDJ5pA3+zfa96weT4joyxcQ1RCdpS7yXCTfLgtPsnlA8tog60OxPzdgc4SbRTDegDvvTkUiNj8D0ky3hyqcVzhlo2zeeta1ILY6b2c2e7Nc6dLW46EFt3HIZrO3fWDE8+NVgyTtQ4NVjYImWUOWseUFecGqyumNQ+NTiyRyqG4pnPu8HLdYla8OiZz2b7aX7mswmeZe6R5Dix23PuCYNzX6Esdp3YHRqVQjb3lJb9h89bt6FznrduZOvZVJ6Yxzpl8ISAep7gdgi2HqWvtg2a8DNGsdhoD6klv9Jgls8eGvxweC3Rx+MuLKIawguRrU/KUNTwqR17wMNXGyu6LvXa3w2eTXplLZueOeGhxRayBCC8OxbhjTYwT9ul6AlvgYfwc5CvL6ujiZ3164LX4BqDYe6xA+jsi8tw8OCceyh9uHp4WF1fXy+EucXqHzKfsoe0ij6RluCjJ3vAof4SFY02zj3zBv68EB/dWTZFEny9iyGWog7I6/tU5cKthCTB/yCrp4lUl+v/kn+CGF8gedna0QWLltJowd+UnSKlGHAKvpeZivDIeAJxNkAHs7ZDGi5EXGEE2+sVU1KYmR3sXcfYuTiuc7k7e76TrRcccmQIRlXShtdRMa3UCRybtCbXDjBtAuPho9FtJh8917ihTltfqaV0qtKDFUjveIvCr4GH8MyxX59Jh3ElPLvUUsx6B32hHbhdhSi2cWSV91fVCy1ZnDvAEZq5wHKjVf8CdnpixS4TljmzMlX2InC3areqd5l41RdOCR/vgeOjBnDzYY+K0Cqy0smlOmPINoiEN85zPWBweZVWDIHqPUQiY5hPneACuB4itdG1hbJy2oQ2+TN/HVy/dDCy7PAS1ArXBrdsAoXh6iTQ/MTEBOBJjLRt+fWFspIqhCv35yQAu89HGO0NL4xu1xUOlACeIqRHHfAwJanwSpZFZSnnS8lbwfmMDg7b7kobvKIeYbyc9Kq8Q2GwwnKjHfCybaj6rv5sqb4sHDoJDAcIt5OrlEcl6CSJHFWgeGhiqo8i3Jk/bko+Z3sX/FyGHZMrg9poWurDGIpZ/wYq3RvJFZvp9XFdxoDxcHFz16v6fkyQGCLH0ex+piTTtCGU6mpbjY8O0u7792XKSI2qNRnOQgnDs6P76cB40p3Wdb1not6ZPRR3k1pKeCSTvlcOUPaJyfzZvP68jjn1NsNDiMy1Zrh8mQx6sAJbpgjBwQc2KGCHgkdIzX0FBS1bRDF2v93cPnw0MU18cKIiO17MnqeflcjKBIla7Ih0tatQJnFcdHTiMUPyP8yPCvS7d+fTx7eXlz+r1ez3j+fHyft6Qx3oIdT3T9g/192DO4Clae4xZ8Bs1Z8Cp7mIewgyaZfm8qgDlEWRzK1dA1PhBQHfMAq1BIDhWkeCweMQ5+2LfRpNS33ZuqSKjU58R6gR9Q4Jkq5rodgRdWA/qUUe6/h6YOtAt8NjnQCWwnWwLy2bm2MlHQ5eA6EfrhHq0eQa18LeTRqqXkme8BoeGoNpKhNN2s6FPeeT10UQnMy9ot4ZNYbdVbPW0WnfYqc4XO/B4NtHs1mjUXI2NyU1JK+AiFtlGo0i1khD9i9gLAbh8dQAMDhY7xEJ7+lB6JgoKhiDodGJ0uikplCmTFB6rC6e37h3vu5BLgm41+vQNK2+TmrRNriF6feuKHfUHpyWrwBh/3SOWSjNfeApLC1fnTWoapaoA2GY3l6WW/h2ZgxAuJYa7r8fUZE8KttXFV3VaOc0nkWg7uq3r+rzswI645uBt+hY2Y9Ea5w+5KZvpX3mqAOSf0FeyKzUuzIGtT69mmwABDtTzhJb/9v9GKFqV/EDmpJMY105VjfER9cn3b02mpLP07+8HYUtFIsM3DMu9QGlFh0erUd4uLq5CwoVp0bvcRVxej/iXfJfgGeop478o5cJ1+KUrShmZIDvPqHa7yLGqI6jvxc89zCuEwpKqB/PTi83uUIHFEB5LttWA/rnk5dlGlJC6e0q7jv36qqz5eOqVh6H49nj9PKz2wOilgdK5a/XH6z/XtyOjok2j1w6qud5DEqj6pqSTGzdUc9sKa10tLz68+P59OTy8nL96/Pz89f6/Px9cvNyO5uPh/yb1Pel/ldSi6M+jnNLWFLaWgSzC6amZuf63v8DeAp5rbV8eUh4sQYvVprPhLKyUK1PlHpG9LTF51iBV9SX8GLlqKl8d6gqlCmNTuRGMXj/B407U9Wu6d3rAAAAAElFTkSuQmCC', NULL, NULL, NULL, NULL, 'bc1qkspwvk9ge7rfl7374t96s95es64vc4fysk2nu5', '938893993', 'Bitcoin', 'crypto', 'both', 'enabled', 'yes', '2021-03-11 17:53:32', '2024-07-01 12:07:54'),
(2, 'Ethereum', '10', '2100', '0', 'percentage', 'Instant', 'https://lulo.com', NULL, NULL, NULL, NULL, 'dddddddddddddddddddddddd', '938893993', 'Erc', 'crypto', 'both', 'enabled', 'yes', '2021-03-22 15:36:03', '2023-02-23 12:28:34'),
(3, 'Litecoin', '100', '10000', '0', '0', 'Instant', 'https://lulo.com', NULL, NULL, NULL, NULL, 'hhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhh', 'Erc', 'crypto', 'both', 'enabled', 'yes', '2021-03-22 15:36:33', '2023-02-23 12:28:54'),
(10, 'Paypal', '10', '10000', '0', 'percentage', 'Instant Payment', 'https://lulo.com', 'Automatic', 'Automatic', '99388383', NULL, NULL, NULL, NULL, 'currency', 'deposit', 'disabled', 'yes', '2021-10-07 13:56:14', '2023-03-27 02:04:21'),
(12, 'Bank Transfer', '100', '1000000000000000000', '0', 'percentage', 'Instant Payment', NULL, 'Mining Bank', 'Miller lauren', '99388383', '3222ASD', NULL, NULL, NULL, 'currency', 'none', 'enabled', 'yes', '2021-10-11 16:35:35', '2023-03-27 02:02:51'),
(21, 'USDT', '0', '1000000000', '0', 'percentage', 'Instant Payment', NULL, NULL, NULL, NULL, NULL, 'TPCRRGUkpsnFM3r5cu9JfdeXBvhZoygbRnr correct wallet address here', NULL, 'TRC20', 'crypto', 'both', 'enabled', 'yes', '2021-04-14 14:45:06', '2023-03-12 23:08:46'),
(23, 'BUSD', '0', '1000', '0', 'percentage', NULL, NULL, NULL, NULL, NULL, NULL, 'Enter your correct wallet address here', NULL, 'ERC20', 'crypto', 'withdrawal', 'disabled', 'yes', '2022-06-28 04:25:41', '2023-02-23 12:31:17'),
(24, 'Credit Card', '0', '0', '0', 'percentage', 'Instant Payment', NULL, '-', '-', '0', NULL, NULL, NULL, NULL, 'currency', 'deposit', 'disabled', 'yes', '2022-07-20 17:02:29', '2023-03-27 02:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `txn_id`, `date`, `user`, `amount`, `currency`, `columns`, `bal`, `accountname`, `type`, `accountnumber`, `bankname`, `Accounttype`, `Description`, `bankaddress`, `country`, `swiftcode`, `iban`, `to_deduct`, `status`, `payment_mode`, `paydetails`, `created_at`, `updated_at`, `zipcode`, `city`) VALUES
(249, 'REME/2A0BBIJX-2024', NULL, 255, '5000', 'USD', NULL, NULL, 'Self', 'Credit', '88267380879', 'Remedy', 'Savings Account', 'Birth day Gift', '301 East Water Street, Charlottesville, VA 22904 Virginia', 'Nigeria', NULL, NULL, NULL, 'Processed', 'Crypto Deposit', NULL, '2024-03-22 10:35:00', '2024-03-09 09:35:11', NULL, NULL),
(250, 'REME-ZX91TRO8-NV8A1', '2024-06-28 19:25:21.000000', 255, '500', 'USD', NULL, '499470', NULL, NULL, 'evakoac929@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500', 'Processed', 'Paypal', NULL, NULL, '2024-06-30 13:46:43', NULL, NULL),
(251, 'REME-C3HXA26L-TDJ2I', '2024-06-28 19:36:00.000000', 255, '1000', 'USD', NULL, '498470', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', NULL, NULL, 'Paypal', NULL, NULL, NULL, NULL, '1000', 'Pending', 'Paypal', NULL, '2024-06-28 19:36:00', '2024-06-28 19:36:00', NULL, NULL),
(252, 'REME/IA5AZVJM-YASDQ', '2024-06-28 21:29:48.000000', 255, '500', 'USD', NULL, '497970', 'Bitcoin', NULL, '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', 'Cryptocurrency Transaction', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '500', 'Pending', 'Cryptocurrency', NULL, '2024-06-28 21:29:48', '2024-06-28 21:29:48', NULL, NULL),
(253, 'REME-RAOT5RKX-ZQCKZ', '2024-06-28 21:44:01.000000', 255, '300', 'USD', NULL, '497670', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Skrill', NULL, 'Skrill transaction', NULL, NULL, NULL, NULL, '300', 'Pending', 'Skrill', NULL, '2024-06-28 21:44:01', '2024-06-28 21:44:01', NULL, NULL),
(254, 'REME-PWAZ8BDT-A6EUC', '2024-06-28 22:08:04.000000', 255, '300', 'USD', NULL, '497370', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Google Pay', NULL, 'Google Pay transaction', NULL, NULL, NULL, NULL, '300', 'Pending', 'Google Pay', NULL, '2024-06-28 22:08:04', '2024-06-28 22:08:04', NULL, NULL),
(255, 'REME/A3V8R3SR-0TVEM', '2024-06-29 19:07:11.000000', 255, '300', 'USD', NULL, '497070', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'International Wire Transfer', NULL, '2024-06-29 19:07:11', '2024-06-29 19:07:11', NULL, NULL),
(256, 'REME/FNDB2UN3-2RD41', '2024-06-29 20:41:24.000000', 255, '300', 'USD', NULL, '496770', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', NULL, '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', 'Cryptocurrency Transaction', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '300', 'Pending', 'Cryptocurrency', NULL, '2024-06-29 20:41:24', '2024-06-29 20:41:24', NULL, NULL),
(257, 'REME-NNY5YHX0-BFQZR', '2024-06-29 23:00:20.000000', 255, '233', 'USD', NULL, '496537', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-29 23:00:20', '2024-06-29 23:00:20', NULL, NULL),
(258, 'REME/VQU2QEXW-ULPYG', '2024-06-29 23:18:25.000000', 255, '300', 'USD', NULL, '496237', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-29 23:18:25', '2024-06-29 23:18:25', NULL, NULL),
(259, 'REME/W9L5JSPU-UCLYN', '2024-06-29 23:21:23.000000', 255, NULL, 'USD', NULL, '496237', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-29 23:21:23', '2024-06-29 23:21:23', NULL, NULL),
(260, 'REME/LD4XMXKB-BMHQP', '2024-06-29 23:23:09.000000', 255, '300', 'USD', NULL, '495937', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-29 23:23:09', '2024-06-29 23:23:09', NULL, NULL),
(261, 'REME/7HHLJQHT-UBW3T', '2024-06-29 23:25:51.000000', 255, '300', 'USD', NULL, '495637', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-29 23:25:51', '2024-06-29 23:25:51', NULL, NULL),
(262, 'REME/IG84NVRR-HUHTL', '2024-06-30 08:00:14.000000', 255, '300.00', 'USD', NULL, '495337', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', 'Debit', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', 'Cryptocurrency Transaction', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Local Transfer', NULL, '2024-06-30 08:00:14', '2024-06-30 08:00:14', NULL, NULL),
(263, 'REME/MXF3U7TE-Q941R', '2024-06-30 08:01:44.000000', 255, NULL, 'USD', NULL, '495337', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-30 08:01:44', '2024-06-30 08:01:44', NULL, NULL),
(264, 'REME/PXOHOKQB-AHNMY', '2024-06-30 08:03:10.000000', 255, NULL, 'USD', NULL, '495337', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-30 08:03:10', '2024-06-30 08:03:10', NULL, NULL),
(265, 'REME-KLABGIHJ-TRZLK', '2024-06-30 08:05:30.000000', 255, '233', 'USD', NULL, '495104', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 08:05:30', '2024-06-30 08:05:30', NULL, NULL),
(266, 'REME/PWRNKU1U-QFDYX', '2024-06-30 08:08:02.000000', 255, '300', 'USD', NULL, '494804', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-30 08:08:02', '2024-06-30 08:08:02', NULL, NULL),
(267, 'REME/0BRY4LXC-YW4WI', '2024-06-30 08:08:45.000000', 255, '300', 'USD', NULL, '494504', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', NULL, 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-30 08:08:45', '2024-06-30 08:08:45', NULL, NULL),
(268, 'REME/SJVEBPUY-ESFMK', '2024-06-30 08:28:49.000000', 255, '300', 'USD', NULL, '494204', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', 'Online Banking', 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-30 08:28:49', '2024-06-30 08:28:49', NULL, NULL),
(269, 'REME/2NXSD030-P2HVH', '2024-06-30 08:31:17.000000', 255, '300', 'USD', NULL, '493904', 'eva kovac kovac kovac', NULL, '1234567890', 'First bank limited', 'Online Banking', 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-30 08:31:17', '2024-06-30 08:31:17', NULL, NULL),
(270, 'REME/2P39PHHG-IDRJN', '2024-06-30 08:35:25.000000', 255, '300', 'USD', NULL, '493604', 'eva kovac kovac kovac', NULL, '1234567890', 'Barclay', 'Online Banking', 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Pending', 'Wire Transfer', NULL, '2024-06-30 08:35:25', '2024-06-30 08:35:25', NULL, NULL),
(271, 'REME/PXUBZYAO-MORBG', '2024-06-30 08:44:54.000000', 255, '233', 'USD', NULL, '493371', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', 'Debit', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', NULL, NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '233', 'Pending', 'Local Transfer', NULL, '2024-06-30 08:44:54', '2024-06-30 08:44:54', NULL, NULL),
(272, 'REME/KK7CPAY5-N5KJM', '2024-06-30 08:51:52.000000', 255, '233', 'USD', NULL, '493138', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', 'Debit', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiqKY', 'Bitcoin', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '233', 'Pending', 'Local Transfer', NULL, '2024-06-30 08:51:52', '2024-06-30 08:51:52', NULL, NULL),
(273, 'REME/0PPJENNW-F0E6U', '2024-06-30 08:55:40.000000', 255, '300.00', 'USD', NULL, '492838', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', 'Debit', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', 'USDT', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Local Transfer', NULL, '2024-06-30 08:55:40', '2024-06-30 08:55:40', NULL, NULL),
(274, 'REME/AS6RXAK6-8LKKQ', '2024-06-30 09:02:17.000000', 255, '300.00', 'USD', NULL, '492538', '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', NULL, '16Wj46KCN6rpGoo1HWLyCpyXXsLXfhiq', 'USDT', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Cryptocurrency', NULL, '2024-06-30 09:02:17', '2024-06-30 09:02:17', NULL, NULL),
(275, 'REME-CCE5Q5JO-34Q9J', '2024-06-30 09:15:07.000000', 255, '500', 'USD', NULL, '492038', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '500', 'Pending', 'Paypal', NULL, '2024-06-30 09:15:07', '2024-06-30 09:15:07', NULL, NULL),
(276, 'RE4AJTT5LDGKKWB', '2024-06-30 09:18:52.000000', 255, '233', 'USD', NULL, '491805', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 09:18:52', '2024-06-30 09:18:52', NULL, NULL),
(277, 'REJQRM8RUPCDROS', '2024-06-30 09:28:32.000000', 255, '233', 'USD', NULL, '491572', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 09:28:32', '2024-06-30 09:28:32', NULL, NULL),
(278, 'REME/IZDATSEA-DXKGB', '2024-06-30 09:28:56.000000', 255, NULL, 'USD', NULL, '491572', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-30 09:28:56', '2024-06-30 09:28:56', NULL, NULL),
(279, 'REYVI0SIZSU7YAK', '2024-06-30 09:30:13.000000', 255, '300.00', 'USD', NULL, '491272', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Paypal', NULL, '2024-06-30 09:30:13', '2024-06-30 09:30:13', NULL, NULL),
(280, 'REMKT6SNWYSZR7K', '2024-06-30 09:31:15.000000', 255, '300.00', 'USD', NULL, '490972', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Paypal', NULL, '2024-06-30 09:31:15', '2024-06-30 09:31:15', NULL, NULL),
(281, 'REASVIRVPC9HCJU', '2024-06-30 09:33:38.000000', 255, '100', 'USD', NULL, '490872', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '100', 'Pending', 'Paypal', NULL, '2024-06-30 09:33:38', '2024-06-30 09:33:38', NULL, NULL),
(282, 'REEYL6QUMH0CHRC', '2024-06-30 09:35:35.000000', 255, '233', 'USD', NULL, '490639', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 09:35:35', '2024-06-30 09:35:35', NULL, NULL),
(283, 'REEYL6QUMH0CHRC', '2024-06-30 09:36:00.000000', 255, '233', 'USD', NULL, '490406', NULL, NULL, NULL, 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 09:36:00', '2024-06-30 09:36:00', NULL, NULL),
(284, 'REEYL6QUMH0CHRC', '2024-06-30 09:38:20.000000', 255, '233', 'USD', NULL, '490173', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 09:38:20', '2024-06-30 09:38:20', NULL, NULL),
(285, 'REMSIFPA0HWYVQC', '2024-06-30 09:39:46.000000', 255, '233', 'USD', NULL, '489940', 'evakovac929@gmail.com', NULL, 'evakovac929@gmail.com', 'Skrill', NULL, 'Skrill transaction', NULL, NULL, NULL, NULL, '233', 'Pending', 'Skrill', NULL, '2024-06-30 09:39:46', '2024-06-30 09:39:46', NULL, NULL),
(286, 'REMFIRUEMNCIRIQ', '2024-06-30 09:42:39.000000', 255, '500', 'USD', NULL, '489440', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Google Pay', NULL, 'Google Pay transaction', NULL, NULL, NULL, NULL, '500', 'Pending', 'Google Pay', NULL, '2024-06-30 09:42:39', '2024-06-30 09:42:39', NULL, NULL),
(287, 'REPJXDUJBMOBEFP', '2024-06-30 09:44:48.000000', 255, '1000', 'USD', NULL, '488440', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Transfer Wise', NULL, 'Transfer Wise transaction', NULL, NULL, NULL, NULL, '1000', 'Pending', 'Transfer Wise', NULL, '2024-06-30 09:44:48', '2024-06-30 09:44:48', NULL, NULL),
(288, 'REKRXFKZ80R4XNR', '2024-06-30 09:51:30.000000', 255, '100', 'USD', NULL, '488340', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Payoneer', NULL, 'Payoneer transaction', NULL, NULL, NULL, NULL, '100', 'Pending', 'Payoneer', NULL, '2024-06-30 09:51:30', '2024-06-30 09:51:30', NULL, NULL),
(289, 'REME/QKTA5HLQ-1ZCSZ', '2024-06-30 09:52:22.000000', 255, NULL, 'USD', NULL, '488340', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-30 09:52:22', '2024-06-30 09:52:22', NULL, NULL),
(290, 'REME/53XMBNRZ-IOASS', '2024-06-30 09:53:50.000000', 255, NULL, 'USD', NULL, '488340', NULL, 'Debit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pending', 'Local Transfer', NULL, '2024-06-30 09:53:50', '2024-06-30 09:53:50', NULL, NULL),
(291, 'REDXSYZ83FMO9TZ', '2024-06-30 09:56:47.000000', 255, '100', 'USD', NULL, '488240', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Payoneer', NULL, 'Payoneer transaction', NULL, NULL, NULL, NULL, '100', 'Pending', 'Payoneer', NULL, '2024-06-30 09:56:47', '2024-06-30 09:56:47', NULL, NULL),
(292, 'RE8H5XXQAMQXRCA', '2024-06-30 10:00:34.000000', 255, '200', 'USD', NULL, '488040', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Payoneer', NULL, 'Payoneer transaction', NULL, NULL, NULL, NULL, '200', 'Pending', 'Payoneer', NULL, '2024-06-30 10:00:34', '2024-06-30 10:00:34', NULL, NULL),
(293, 'REROMRHJVW0E8Z0', '2024-06-30 10:07:58.000000', 255, '233', 'USD', NULL, '487807', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Payoneer', NULL, 'Payoneer transaction', NULL, NULL, NULL, NULL, '233', 'Processed', 'Payoneer', NULL, NULL, '2024-06-30 13:47:36', NULL, NULL),
(294, 'RE7N92B1JW4XONI', '2024-06-30 10:19:06.000000', 255, '500', 'USD', NULL, '487307', 'evakovac929@gmail.com', NULL, 'evakovac929@gmail.com', 'Transfer Wise', NULL, 'Transfer Wise transaction', NULL, NULL, NULL, NULL, '500', 'Processed', 'Transfer Wise', NULL, NULL, '2024-06-30 13:43:47', NULL, NULL),
(295, 'RE2HIF51MH0YCCU', '2024-06-30 10:31:23.000000', 255, '233', 'USD', NULL, '487074', 'evakovac929@gmail.com', NULL, 'evakovac929@gmail.com', 'Transfer Wise', NULL, 'Transfer Wise transaction', NULL, NULL, NULL, NULL, '233', 'Pending', 'Transfer Wise', NULL, '2024-06-30 10:31:23', '2024-06-30 10:31:23', NULL, NULL),
(296, 'REZYSCOULFLFGGY', '2024-06-30 10:52:46.000000', 255, '1000', 'USD', NULL, '485074', 'eva kovac kovac kovac', NULL, 'eva kovac kovac kovac', 'Western Union', 'Western Union', 'Schol fees payment', NULL, 'Netherland Antilles', NULL, NULL, '1000', 'pending', 'Western Union', NULL, NULL, '2024-06-30 13:35:15', '634345', 'Lagos'),
(297, 'RENYHT93MRVYBZ5', '2024-06-30 12:37:35.000000', 255, '500', 'USD', NULL, '484574', 'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r', NULL, 'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r', 'Bitcoin', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '500', 'pending', 'Cryptocurrency', NULL, NULL, '2024-06-30 13:31:59', NULL, NULL),
(298, 'RENYHT93MRVYBZ5', '2024-06-30 12:55:34.000000', 255, '500', 'USD', NULL, '484074', 'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r', NULL, 'bc1qhcncp7gaphtjldzpn874g2zz5z4rg8h5c9ay2r', 'Bitcoin', NULL, 'Cryptocurrency', NULL, NULL, NULL, NULL, '500', 'Processed', 'Cryptocurrency', NULL, NULL, '2024-06-30 14:11:16', NULL, NULL),
(299, 'REJDI6UXEK4CDFY', '2024-06-30 12:57:22.000000', 255, '500', 'USD', NULL, '483574', 'evakoac929@gmail.com', NULL, 'evakoac929@gmail.com', 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '500', 'Processed', 'Paypal', NULL, NULL, '2024-06-30 13:53:03', NULL, NULL),
(300, 'REKYMOFCCNW3SOM', '2024-06-30 12:59:40.000000', 255, '233', 'USD', NULL, '483341', 'eva kovac kovac kovac', NULL, 'eva kovac kovac kovac', 'Western Union', 'Western Union', 'ttrttr', NULL, 'Bahamas', NULL, NULL, '233', 'Processed', 'Western Union', NULL, NULL, '2024-06-30 13:52:14', '634345', 'Lagos'),
(301, 'REHOUA5AZ7PBUYO', '2024-06-30 13:00:57.000000', 255, '300', 'USD', NULL, '483041', 'eva kovac kovac kovac', NULL, '1234567890', 'Barclay', 'Online Banking', 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Processed', 'Wire Transfer', NULL, '2024-05-31 14:50:00', '2024-06-30 13:50:33', NULL, NULL),
(302, 'REQ2MKE2G0LWRVY', '2024-06-30 13:04:12.000000', 255, '300', 'USD', NULL, '482741', 'eva kovac kovac kovac', NULL, '1234567890', 'Barclay limite', 'Online Banking', 'Schol fees payment', NULL, NULL, NULL, '534444', '300', 'Processed', 'Wire Transfer', NULL, NULL, '2024-06-30 13:49:07', NULL, NULL),
(303, 'REDKZTFHLOG1FGP', '2024-06-30 13:55:50.000000', 255, '500', 'USD', NULL, '482241', 'evakoac929@gmail.com', NULL, 'evakoac929@gmail.com', 'Payoneer', NULL, 'Payoneer transaction', NULL, NULL, NULL, NULL, '500', 'Processed', 'Payoneer', NULL, NULL, '2024-06-30 13:56:44', NULL, NULL),
(304, 'RERIRLDKQWI116L', '2024-06-30 13:57:29.000000', 255, '233', 'USD', NULL, '482008', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Transfer Wise', NULL, 'Transfer Wise transaction', NULL, NULL, NULL, NULL, '233', 'Processed', 'Transfer Wise', NULL, NULL, '2024-06-30 13:59:18', NULL, NULL),
(305, 'REQELCAKKTU44AM', '2024-06-30 14:00:48.000000', 255, '300.00', 'USD', NULL, '481708', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Google Pay', NULL, 'Google Pay transaction', NULL, NULL, NULL, NULL, '300.00', 'Pending', 'Google Pay', NULL, '2024-06-30 14:00:48', '2024-06-30 14:00:48', NULL, NULL),
(306, 'REQELCAKKTU44AM', '2024-06-30 14:11:49.000000', 255, '300.00', 'USD', NULL, '481408', 'nulledtechy@gmail.com', NULL, 'nulledtechy@gmail.com', 'Google Pay', NULL, 'Google Pay transaction', NULL, NULL, NULL, NULL, '300.00', 'Processed', 'Google Pay', NULL, NULL, '2024-06-30 14:13:09', NULL, NULL),
(307, 'REGQ5YCBXRUGDLS', '2024-06-30 14:14:24.000000', 255, '500', 'USD', NULL, '480908', 'admin@admin.com', NULL, 'admin@admin.com', 'Skrill', NULL, 'Skrill transaction', NULL, NULL, NULL, NULL, '500', 'Processed', 'Skrill', NULL, NULL, '2024-06-30 14:16:28', NULL, NULL),
(308, 'REME/8IZ2DVXK-OESPI', NULL, 255, '500', 'USD', NULL, NULL, 'Self', 'Credit', '88267380879', 'Remedy', 'Savings Account', 'deposit', '301 East Water Street, Charlottesville, VA 22904 Virginia', 'Nigeria', NULL, NULL, NULL, 'Processed', 'Local transfer', NULL, '2024-06-30 15:35:00', '2024-06-30 14:35:50', NULL, NULL),
(309, 'REJQVMXHWKMUNFU', '2024-06-30 15:44:41.000000', 255, '233', 'USD', NULL, '481175', 'remedynulled@gmail.com', NULL, 'remedynulled@gmail.com', 'Paypal', NULL, 'Paypal', NULL, NULL, NULL, NULL, '233', 'Pending', 'Paypal', NULL, '2024-06-30 15:44:41', '2024-06-30 15:44:41', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autologin_tokens`
--
ALTER TABLE `autologin_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `autologin_tokens_token_unique` (`token`);

--
-- Indexes for table `bnc_transactions`
--
ALTER TABLE `bnc_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_records`
--
ALTER TABLE `card_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cp_transactions`
--
ALTER TABLE `cp_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_accounts`
--
ALTER TABLE `crypto_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_records`
--
ALTER TABLE `crypto_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipaddresses`
--
ALTER TABLE `ipaddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kycs_email_unique` (`zipcode`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt4_details`
--
ALTER TABLE `mt4_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paystacks`
--
ALTER TABLE `paystacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_conts`
--
ALTER TABLE `settings_conts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_privacies`
--
ALTER TABLE `terms_privacies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonies`
--
ALTER TABLE `testimonies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp__transactions`
--
ALTER TABLE `tp__transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `usernumber` (`usernumber`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wdmethods`
--
ALTER TABLE `wdmethods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1220;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `autologin_tokens`
--
ALTER TABLE `autologin_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bnc_transactions`
--
ALTER TABLE `bnc_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card_records`
--
ALTER TABLE `card_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `cp_transactions`
--
ALTER TABLE `cp_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crypto_accounts`
--
ALTER TABLE `crypto_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `crypto_records`
--
ALTER TABLE `crypto_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ipaddresses`
--
ALTER TABLE `ipaddresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `mt4_details`
--
ALTER TABLE `mt4_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paystacks`
--
ALTER TABLE `paystacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings_conts`
--
ALTER TABLE `settings_conts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `terms_privacies`
--
ALTER TABLE `terms_privacies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonies`
--
ALTER TABLE `testimonies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tp__transactions`
--
ALTER TABLE `tp__transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wdmethods`
--
ALTER TABLE `wdmethods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
