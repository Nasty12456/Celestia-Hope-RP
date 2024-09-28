-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qbcorev9
CREATE DATABASE IF NOT EXISTS `qbcorev9` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `qbcorev9`;

-- Dumping structure for table qbcorev9.0r_rented_vehicles
CREATE TABLE IF NOT EXISTS `0r_rented_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(64) NOT NULL,
  `plate` varchar(32) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `vehicle_price` int(11) DEFAULT NULL,
  `daily_fee` int(11) DEFAULT NULL,
  `rented_day` int(11) DEFAULT NULL,
  `rental_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.0r_rented_vehicles: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `identifier` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` longtext NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `transactions` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.adminmenu
CREATE TABLE IF NOT EXISTS `adminmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.adminmenu: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_donatesystem
CREATE TABLE IF NOT EXISTS `ak4y_donatesystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_donatesystem: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_donatesystem_codes
CREATE TABLE IF NOT EXISTS `ak4y_donatesystem_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_donatesystem_codes: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_fishing
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.ak4y_fishing: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_garbage
CREATE TABLE IF NOT EXISTS `ak4y_garbage` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `Tasks` longtext DEFAULT NULL,
  `EarnedMoney` int(11) DEFAULT 0,
  `DrawedMoney` int(11) DEFAULT 0,
  `TaskResetTime` int(11) DEFAULT 0,
  `MoneyResetTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.ak4y_garbage: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_jobselector
CREATE TABLE IF NOT EXISTS `ak4y_jobselector` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `currentXP` int(11) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_jobselector: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_jobselector_codes
CREATE TABLE IF NOT EXISTS `ak4y_jobselector_codes` (
  `code` varchar(50) DEFAULT NULL,
  `xpCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_jobselector_codes: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_multichar
CREATE TABLE IF NOT EXISTS `ak4y_multichar` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '0',
  `charCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_multichar: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ak4y_multichar_codes
CREATE TABLE IF NOT EXISTS `ak4y_multichar_codes` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ak4y_multichar_codes: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.apartments: ~1 rows (approximately)
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(338, 'apartment2311', 'apartment2', 'Tinsel Towers 311', 'YVZ99801');

-- Dumping structure for table qbcorev9.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.bank_accounts_new: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.bank_cards: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.bank_statements: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.bans: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.bongs
CREATE TABLE IF NOT EXISTS `bongs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `tolerance` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `high` tinyint(11) NOT NULL,
  `time` int(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE KEY` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.bongs: ~1 rows (approximately)
INSERT INTO `bongs` (`id`, `citizenid`, `tolerance`, `amount`, `high`, `time`) VALUES
	(330, 'YVZ99801', 0, 0, 0, 0);

-- Dumping structure for table qbcorev9.brutal_hunting
CREATE TABLE IF NOT EXISTS `brutal_hunting` (
  `identifier` varchar(128) NOT NULL,
  `licence` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `date` varchar(128) NOT NULL,
  `hunterid` varchar(128) NOT NULL,
  `level` int(128) NOT NULL,
  `xp` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.brutal_hunting: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.carmileages
CREATE TABLE IF NOT EXISTS `carmileages` (
  `plate` text DEFAULT NULL,
  `mileage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.carmileages: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.chicken_animals
CREATE TABLE IF NOT EXISTS `chicken_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) unsigned NOT NULL,
  `hunger` int(11) DEFAULT 100,
  `ovulation` int(11) DEFAULT 0,
  `exp` int(11) DEFAULT 0,
  `coord_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table qbcorev9.chicken_animals: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.chicken_eggs
CREATE TABLE IF NOT EXISTS `chicken_eggs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) unsigned NOT NULL,
  `incubation` int(11) DEFAULT 0,
  `coord_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table qbcorev9.chicken_eggs: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.chicken_farms
CREATE TABLE IF NOT EXISTS `chicken_farms` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `collected_eggs` smallint(6) DEFAULT 0,
  `chicken_limit` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table qbcorev9.chicken_farms: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.cl_spawnselector
CREATE TABLE IF NOT EXISTS `cl_spawnselector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.cl_spawnselector: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.codem_adminmenu
CREATE TABLE IF NOT EXISTS `codem_adminmenu` (
  `identifier` varchar(50) DEFAULT NULL,
  `permissiondata` longtext DEFAULT NULL,
  `historydata` longtext DEFAULT NULL,
  `bandata` longtext DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.codem_adminmenu: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.codev_multichar
CREATE TABLE IF NOT EXISTS `codev_multichar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(90) DEFAULT NULL,
  `uses` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.codev_multichar: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.codev_multichar_codes
CREATE TABLE IF NOT EXISTS `codev_multichar_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `used` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.codev_multichar_codes: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.cow_animals
CREATE TABLE IF NOT EXISTS `cow_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` tinyint(4) NOT NULL DEFAULT 0,
  `coord_id` tinyint(4) NOT NULL DEFAULT 1,
  `hunger` tinyint(4) NOT NULL DEFAULT 100,
  `period` smallint(6) NOT NULL DEFAULT 0,
  `exp` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.cow_animals: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.cow_farms
CREATE TABLE IF NOT EXISTS `cow_farms` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `expressed_milks` int(11) NOT NULL DEFAULT 0,
  `cow_limit` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.cow_farms: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.crafting_benches
CREATE TABLE IF NOT EXISTS `crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchId` varchar(50) NOT NULL,
  `blueprints` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benchId` (`benchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.crafting_benches: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.crafting_stations
CREATE TABLE IF NOT EXISTS `crafting_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.crafting_stations: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.crews
CREATE TABLE IF NOT EXISTS `crews` (
  `owner` varchar(46) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `tag` varchar(4) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.crews: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.crypto: ~1 rows (approximately)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1000, '[{"NewWorth":1000,"PreviousWorth":1000}]');

-- Dumping structure for table qbcorev9.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.dealers: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.debux_apartments
CREATE TABLE IF NOT EXISTS `debux_apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'NO NAME',
  `apartment` varchar(255) DEFAULT NULL,
  `daire` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT 'a',
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.debux_apartments: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.dpkeybinds: ~1 rows (approximately)
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('license:080f85f2784fc282ede18076a4b1811a25ca05c4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- Dumping structure for table qbcorev9.dusa_pets
CREATE TABLE IF NOT EXISTS `dusa_pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) DEFAULT NULL,
  `modelname` varchar(250) DEFAULT NULL,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `illnesses` varchar(60) NOT NULL DEFAULT 'none',
  `name` varchar(255) DEFAULT 'Pet',
  `clothes` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table qbcorev9.dusa_pets: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.duty_logs
CREATE TABLE IF NOT EXISTS `duty_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.duty_logs: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.els_familys
CREATE TABLE IF NOT EXISTS `els_familys` (
  `owner_id` longtext DEFAULT NULL,
  `family_id` int(4) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_img` longtext DEFAULT NULL,
  `family_meta` varchar(9999) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `family_chat` longtext DEFAULT NULL,
  KEY `family_id` (`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.els_familys: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.es_playerlist
CREATE TABLE IF NOT EXISTS `es_playerlist` (
  `license` varchar(150) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `profile` longtext DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `xp` int(50) DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `border` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `tac` longtext DEFAULT NULL,
  `rewards` longtext DEFAULT NULL,
  `earnings` int(50) DEFAULT NULL,
  `rank` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.es_playerlist: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_accounts
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_accounts` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `balance` bigint(255) NOT NULL,
  `type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'personal',
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_society` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fd_advanced_banking_accounts_id_unique` (`id`) USING BTREE,
  UNIQUE KEY `fd_advanced_banking_accounts_iban_unique` (`iban`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_accounts_members
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_accounts_members` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(20) unsigned NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `can_deposit` tinyint(4) NOT NULL DEFAULT 0,
  `can_withdraw` tinyint(4) NOT NULL DEFAULT 0,
  `can_transfer` tinyint(4) NOT NULL DEFAULT 0,
  `can_export` tinyint(4) NOT NULL DEFAULT 0,
  `can_control_members` tinyint(4) NOT NULL DEFAULT 0,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fd_advanced_banking_accounts_members_id_unique` (`id`) USING BTREE,
  KEY `fd_advanced_banking_accounts_members_account_id_index` (`account_id`) USING BTREE,
  CONSTRAINT `fk_fd_accounts_members` FOREIGN KEY (`account_id`) REFERENCES `fd_advanced_banking_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_accounts_members: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_accounts_transactions
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_accounts_transactions` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(20) unsigned NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `done_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `from_account` int(20) DEFAULT NULL,
  `to_account` int(20) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fd_advanced_banking_accounts_transactions_id_unique` (`id`) USING BTREE,
  KEY `fd_advanced_banking_accounts_transactions_account_id_index` (`account_id`) USING BTREE,
  CONSTRAINT `fk_fd_accounts_transactions` FOREIGN KEY (`account_id`) REFERENCES `fd_advanced_banking_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_accounts_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_invoices
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_invoices` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(75) NOT NULL,
  `issued_by` varchar(75) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `amount` int(20) unsigned NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transfer_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `due_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `can_be_declined` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_invoices: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_migrations
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_migrations: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fd_advanced_banking_tracking
CREATE TABLE IF NOT EXISTS `fd_advanced_banking_tracking` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fd_advanced_banking_tracking: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.frkn_pet
CREATE TABLE IF NOT EXISTS `frkn_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netID` int(11) DEFAULT NULL,
  `petHash` varchar(50) DEFAULT NULL,
  `petTexureID` int(11) DEFAULT NULL,
  `petLeash` varchar(50) DEFAULT NULL,
  `petLeashID` int(11) DEFAULT NULL,
  `frknHat` varchar(50) DEFAULT NULL,
  `frknLeash` varchar(50) DEFAULT NULL,
  `frknGlasses` varchar(50) DEFAULT NULL,
  `petOwner` varchar(50) DEFAULT NULL,
  `petGender` varchar(50) DEFAULT NULL,
  `petName` varchar(50) DEFAULT NULL,
  `petLabel` longtext DEFAULT NULL,
  `hungryDecrase` int(11) DEFAULT NULL,
  `petHungryLevel` int(11) DEFAULT NULL,
  `thirstDecrase` int(11) DEFAULT NULL,
  `isOutSide` tinyint(4) DEFAULT 0,
  `petThirstLevel` int(11) DEFAULT NULL,
  `petEnergyLevel` int(11) DEFAULT NULL,
  `petHealthLevel` int(11) DEFAULT NULL,
  `petXP` int(11) DEFAULT NULL,
  `lastXP` int(11) DEFAULT NULL,
  `petLevel` int(11) DEFAULT NULL,
  `petAge` int(11) DEFAULT NULL,
  `petPosition` text DEFAULT NULL,
  `petIMG` longtext DEFAULT 'https://cdn.discordapp.com/attachments/942150634554163250/1091896194818658304/unkownpet.png',
  `listOf` varchar(50) DEFAULT NULL,
  `isSelling` tinyint(4) DEFAULT 0,
  `petSellingPrice` int(11) DEFAULT NULL,
  `petFace` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `netID` (`netID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.frkn_pet: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.fuel_stations: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.gang_respect
CREATE TABLE IF NOT EXISTS `gang_respect` (
  `gang_id` varchar(50) NOT NULL,
  `respect` int(11) NOT NULL DEFAULT 0,
  `tiendas` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gang_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.gang_respect: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.gloveboxitems: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.gl_gangs
CREATE TABLE IF NOT EXISTS `gl_gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `who` varchar(60) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT 'a_m_m_malibu_01',
  `level` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table qbcorev9.gl_gangs: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.gl_territories
CREATE TABLE IF NOT EXISTS `gl_territories` (
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Data` longtext DEFAULT '{}',
  `Level` int(11) DEFAULT 0,
  `Trap` longtext DEFAULT '{}',
  `Model` varchar(50) DEFAULT 'a_m_m_malibu_01',
  `Owner` varchar(60) DEFAULT NULL,
  `Relationships` longtext DEFAULT '{}',
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table qbcorev9.gl_territories: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.gym_memberships
CREATE TABLE IF NOT EXISTS `gym_memberships` (
  `owner` varchar(70) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.gym_memberships: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.houselocations: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.house_plants: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.hud_settings
CREATE TABLE IF NOT EXISTS `hud_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_license` varchar(50) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`user_license`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.hud_settings: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.kloud_delivery
CREATE TABLE IF NOT EXISTS `kloud_delivery` (
  `job` varchar(55) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.kloud_delivery: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.lapraces: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.management_funds: ~13 rows (approximately)
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 5400, 'boss'),
	(3, 'realestate', 153, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang'),
	(41, 'government', 0, 'boss');

-- Dumping structure for table qbcorev9.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.management_outfits: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_data: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_incidents: ~1 rows (approximately)
INSERT INTO `mdt_incidents` (`id`, `author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES
	(5, 'MamBa Op', 'Name - Charge - 3/11/2024', '\n      <div style="color: white;">\n          <p><strong>📝 Summary:</strong></p>\n          <p><em>[Insert Report Summary Here]</em></p>\n          <p>&nbsp;</p>\n          <p><strong>🧍 Hostage:</strong> [Name Here]</p>\n          <p>&nbsp;</p>\n          <p><strong>🗄️ Evidence Location:</strong> Stash # | Drawer #</p>\n          <p>&nbsp;</p>\n          <p><strong>🔪 Weapons/Items Confiscated:</strong></p>\n          <p><em>· [Insert List Here]</em></p>\n          <p>&nbsp;</p>\n          <p>-----</p>\n          <p><strong style="background-color: var(--color-1);">💸 Fine:</strong></p>\n          <p>&nbsp;</p>\n          <p><strong>⌚ Sentence:</strong></p>\n          <p>-----</p>\n      </div>\n  ', '["mam"]', '[]', '[]', '[]', '1710102680326', 'police');

-- Dumping structure for table qbcorev9.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.motels
CREATE TABLE IF NOT EXISTS `motels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) DEFAULT 'Room #1',
  `roomid` varchar(50) DEFAULT 'bh-1',
  `renter` varchar(100) DEFAULT 'John Doe',
  `renter_citizenid` varchar(50) DEFAULT 'ABC12345',
  `stash` varchar(2500) DEFAULT '[]',
  `rentedTime` int(11) DEFAULT 86400,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.motels: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.multijobs: ~1 rows (approximately)
INSERT INTO `multijobs` (`citizenid`, `jobdata`) VALUES
	('YVZ99801', '{"police":3}');

-- Dumping structure for table qbcorev9.ngs_banking_accounts
CREATE TABLE IF NOT EXISTS `ngs_banking_accounts` (
  `account_id` text DEFAULT NULL,
  `identifier` text DEFAULT NULL,
  `pincode` text DEFAULT NULL,
  `accounts` text DEFAULT NULL,
  `partners` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `iban` text DEFAULT NULL,
  `created` text DEFAULT NULL,
  `transactions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ngs_banking_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.ngs_banking_sub_accounts
CREATE TABLE IF NOT EXISTS `ngs_banking_sub_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `owner` text DEFAULT NULL,
  `owner_name` text DEFAULT NULL,
  `balance` int(50) DEFAULT NULL,
  `created` text DEFAULT NULL,
  `iban` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `transactions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.ngs_banking_sub_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`)),
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.objects: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.oilcompany_employees
CREATE TABLE IF NOT EXISTS `oilcompany_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `oilrig_hash` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.oilcompany_employees: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.oilrig_blender
CREATE TABLE IF NOT EXISTS `oilrig_blender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.oilrig_blender: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.oilrig_cdu
CREATE TABLE IF NOT EXISTS `oilrig_cdu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.oilrig_cdu: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.oilrig_position
CREATE TABLE IF NOT EXISTS `oilrig_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `oilrig_hash` varchar(50) DEFAULT NULL,
  `position` text NOT NULL DEFAULT '0',
  `metadata` text NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.oilrig_position: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.oilrig_storage
CREATE TABLE IF NOT EXISTS `oilrig_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.oilrig_storage: ~1 rows (approximately)
INSERT INTO `oilrig_storage` (`id`, `citizenid`, `name`, `metadata`) VALUES
	(2, 'MVY99250', 'isakh\'s storage', '{"gasoline":0.0,"fuel_oil":0.0,"avg_gas_octane":0.0,"crudeOil":0.0,"queue":[]}');

-- Dumping structure for table qbcorev9.oph3z_motel
CREATE TABLE IF NOT EXISTS `oph3z_motel` (
  `id` int(11) NOT NULL DEFAULT 0,
  `names` text NOT NULL DEFAULT '[]',
  `info` text NOT NULL DEFAULT '[]',
  `employees` text NOT NULL DEFAULT '[]',
  `rooms` longtext NOT NULL CHECK (json_valid(`rooms`)),
  `history` text NOT NULL DEFAULT '[]',
  `bucketcache` text NOT NULL DEFAULT '[]',
  `request` text NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.oph3z_motel: ~2 rows (approximately)
INSERT INTO `oph3z_motel` (`id`, `names`, `info`, `employees`, `rooms`, `history`, `bucketcache`, `request`) VALUES
	(1, '"QBCore Motel"', '{"DamagedRooms":8,"CompanyMoney":1000,"Owner":"","ActiveRooms":30,"Motelid":1,"TotalRooms":38,"Name":"QBCore Motel"}', '[]', '[{"type":"VIP","motelno":1,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":true,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":280,"Active":true,"booze":true,"Coords":{"x":312.8800048828125,"y":-218.75999450683595,"z":54.22000122070312,"w":157.82000732421876},"fixmoney":"","strip":true,"wall":"black","Rent":false,"theme":"modern"},{"type":"Middle","motelno":2,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"Date":"","Money":"","Name":""},"money":7777,"Active":true,"booze":true,"Coords":{"x":310.8699951171875,"y":-217.99000549316407,"z":54.22000122070312,"w":160.41000366210938},"fixmoney":5000,"strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":3,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":307.4599914550781,"y":-216.6699981689453,"z":54.22000122070312,"w":156.7899932861328},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":4,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":307.54998779296877,"y":-213.19000244140626,"z":54.22000122070312,"w":67.86000061035156},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":5,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":309.4800109863281,"y":-208.0,"z":54.22000122070312,"w":67.7300033569336},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":6,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":311.2300109863281,"y":-203.42999267578126,"z":54.22000122070312,"w":52.1500015258789},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":7,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":313.3800048828125,"y":-198.02000427246095,"z":54.22000122070312,"w":50.13000106811523},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":8,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":315.6400146484375,"y":-194.86000061035157,"z":54.22999954223633,"w":333.0299987792969},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":9,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":319.2300109863281,"y":-196.1699981689453,"z":54.22999954223633,"w":327.17999267578127},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":10,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":321.19000244140627,"y":-196.9199981689453,"z":54.22999954223633,"w":327.6400146484375},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":11,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":312.7300109863281,"y":-218.75,"z":58.02000045776367,"w":168.17999267578126},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":12,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":310.94000244140627,"y":-218.16000366210938,"z":58.02000045776367,"w":133.3699951171875},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":13,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":307.3800048828125,"y":-216.6999969482422,"z":58.02000045776367,"w":159.22000122070313},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":14,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":307.5400085449219,"y":-213.3699951171875,"z":58.02000045776367,"w":61.52000045776367},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":15,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":309.5400085449219,"y":-208.1699981689453,"z":58.02000045776367,"w":65.79000091552735},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":16,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":311.3500061035156,"y":-203.42999267578126,"z":58.02000045776367,"w":59.43999862670898},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":17,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":313.32000732421877,"y":-198.27000427246095,"z":58.02000045776367,"w":61.36000061035156},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":18,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":315.6700134277344,"y":-194.80999755859376,"z":58.02000045776367,"w":334.7699890136719},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":19,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":319.3699951171875,"y":-196.22999572753907,"z":58.02000045776367,"w":336.55999755859377},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":20,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":321.1000061035156,"y":-196.89999389648438,"z":58.02000045776367,"w":340.0899963378906},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":21,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":329.4599914550781,"y":-225.22999572753907,"z":54.22000122070312,"w":162.3300018310547},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":22,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":331.55999755859377,"y":-226.08999633789063,"z":54.22000122070312,"w":151.0800018310547},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":23,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":335.05999755859377,"y":-227.33999633789063,"z":54.22000122070312,"w":165.42999267578126},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":24,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":337.1700134277344,"y":-224.86000061035157,"z":54.22000122070312,"w":260.20001220703127},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":25,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":339.20001220703127,"y":-219.2899932861328,"z":54.22000122070312,"w":248.50999450683595},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":26,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":340.8800048828125,"y":-214.8800048828125,"z":54.22000122070312,"w":247.9600067138672},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":27,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":343.010009765625,"y":-209.3800048828125,"z":54.22000122070312,"w":269.0799865722656},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":28,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":344.6700134277344,"y":-205.02000427246095,"z":54.22000122070312,"w":271.2799987792969},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":29,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":346.75,"y":-199.80999755859376,"z":54.22000122070312,"w":244.4600067138672},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":30,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":329.4800109863281,"y":-225.17999267578126,"z":58.02000045776367,"w":134.19000244140626},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":31,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":331.6600036621094,"y":-225.9600067138672,"z":58.02000045776367,"w":156.47999572753907},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":32,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":334.9100036621094,"y":-227.22000122070313,"z":58.02000045776367,"w":186.14999389648438},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":33,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":337.1300048828125,"y":-224.72999572753907,"z":58.02000045776367,"w":260.9800109863281},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":34,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":339.1300048828125,"y":-219.5500030517578,"z":58.02000045776367,"w":265.54998779296877},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":35,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":340.8900146484375,"y":-214.8800048828125,"z":58.02000045776367,"w":267.3699951171875},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":36,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":342.8999938964844,"y":-209.63999938964845,"z":58.02000045776367,"w":248.27000427246095},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":37,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":344.6499938964844,"y":-205.0800018310547,"z":58.02000045776367,"w":243.97999572753907},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":38,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":false,"booze":true,"Coords":{"x":346.739990234375,"y":-199.75999450683595,"z":58.02000045776367,"w":227.75999450683595},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""}]', '[]', '[]', '[]'),
	(2, '"QBCore Motel"', '{"DamagedRooms":10,"CompanyMoney":1000,"Owner":"","ActiveRooms":16,"Motelid":2,"TotalRooms":26,"Name":"QBCore Motel"}', '[]', '[{"type":"Squatter","motelno":1,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":953.1300048828125,"y":-196.52000427246095,"z":73.22000122070313,"w":64.62000274658203},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":2,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":950.4299926757813,"y":-201.02000427246095,"z":73.20999908447266,"w":81.33999633789063},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":3,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":947.469970703125,"y":-205.9199981689453,"z":73.20999908447266,"w":56.97999954223633},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":4,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":948.8099975585938,"y":-208.99000549316407,"z":73.20999908447266,"w":159.8800048828125},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":5,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":951.6400146484375,"y":-210.69000244140626,"z":73.20999908447266,"w":157.02999877929688},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":6,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":967.4400024414063,"y":-205.08999633789063,"z":73.20999908447266,"w":238.72000122070313},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":7,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":970.8099975585938,"y":-199.67999267578126,"z":73.20999908447266,"w":252.39999389648438},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":8,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":950.3699951171875,"y":-201.1199951171875,"z":76.26000213623047,"w":58.5},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":9,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":947.6199951171875,"y":-205.69000244140626,"z":76.26000213623047,"w":81.70999908447266},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":10,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":948.5,"y":-208.80999755859376,"z":76.26000213623047,"w":162.6300048828125},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":11,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":951.7100219726563,"y":-210.72000122070313,"z":76.26000213623047,"w":168.74000549316407},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":12,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":957.739990234375,"y":-214.35000610351563,"z":76.26000213623047,"w":172.42999267578126},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":13,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":961.72998046875,"y":-214.55999755859376,"z":76.26000213623047,"w":244.07000732421876},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":14,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":964.6500244140625,"y":-209.72000122070313,"z":76.26000213623047,"w":257.7900085449219},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":15,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":967.4299926757813,"y":-205.11000061035157,"z":76.26000213623047,"w":230.55999755859376},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":16,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":970.8099975585938,"y":-199.50999450683595,"z":76.26000213623047,"w":269.0299987792969},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":17,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":953.2000122070313,"y":-196.3699951171875,"z":79.30000305175781,"w":63.09000015258789},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":18,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":950.489990234375,"y":-200.91000366210938,"z":79.30000305175781,"w":80.87999725341797},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":19,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":947.6500244140625,"y":-205.64999389648438,"z":79.30000305175781,"w":76.62999725341797},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":20,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":948.4199829101563,"y":-208.75,"z":79.30000305175781,"w":156.49000549316407},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":21,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":951.760009765625,"y":-210.75999450683595,"z":79.30000305175781,"w":159.61000061035157},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":22,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":957.6500244140625,"y":-214.3000030517578,"z":79.30000305175781,"w":147.74000549316407},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":23,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":961.6699829101563,"y":-214.66000366210938,"z":79.30000305175781,"w":247.80999755859376},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":24,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":964.5,"y":-209.97000122070313,"z":79.30000305175781,"w":257.2900085449219},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":25,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":967.47998046875,"y":-205.02999877929688,"z":79.30000305175781,"w":257.30999755859377},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""},{"type":"Squatter","motelno":26,"StyleMenu":[{"type":"style","durum":true,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075303669810/modern.png","name":"modern"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076520030218/seductive.png","name":"seductive"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075978969108/moody.png","name":"moody"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074599039027/vibrant.png","name":"vibrant"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076872355973/sharp.png","name":"sharp"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644075555340441/monochrome.png","name":"monochrome"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644076247388231/regal.png","name":"regal"},{"type":"style","durum":false,"price":5000,"png":"https://cdn.discordapp.com/attachments/1095505976725078167/1106644074989113344/aqua.png","name":"aqua"},{"type":"extra","durum":false,"price":5000,"png":"https://cdn.shopify.com/s/files/1/0178/2936/3812/products/1_42_1024x1024.png?v=1617035503","name":"strip"},{"type":"extra","durum":true,"price":5000,"png":"https://e7.pngegg.com/pngimages/85/460/png-clipart-riga-black-balsam-cocktail-gin-distilled-beverage-alcohol-splash.png","name":"booze"}],"Owner":{"MyMoney":"","PhoneNumber":"","Friends":[],"Lastname":"","OyuncuOdada":false,"RoomsOwner":"","Date":"","Name":""},"money":5000,"Active":true,"booze":true,"Coords":{"x":970.780029296875,"y":-199.5500030517578,"z":79.30000305175781,"w":246.50999450683595},"fixmoney":"","strip":false,"wall":"","Rent":false,"theme":""}]', '[]', '[]', '[]');

-- Dumping structure for table qbcorev9.osm_valet
CREATE TABLE IF NOT EXISTS `osm_valet` (
  `cid` varchar(50) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  `totalcalls` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.osm_valet: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_accounts
CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT 0,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int(11) DEFAULT 25000,
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_cash
CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT 2000,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_cash: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_external_accounts
CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_external_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_invoices
CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_invoices: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_shared_accounts
CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_shared_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pefcl_transactions
CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int(11) DEFAULT NULL,
  `fromAccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`),
  CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pefcl_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.phone_chatrooms: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.phone_chatroom_messages: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.phone_chats: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.phone_messages: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.phone_note: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `playtime` int(11) DEFAULT 0,
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `crafting_level` tinyint(4) NOT NULL DEFAULT 1,
  `crafting_xp` smallint(6) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `lvlpro` int(11) NOT NULL DEFAULT 0,
  `skills` longtext DEFAULT NULL,
  `frkn_fuelstation_control` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  `statistics` longtext DEFAULT NULL,
  `researched_items` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=16379 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.players: ~1 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `playtime`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `crafting_level`, `crafting_xp`, `level`, `lvlpro`, `skills`, `frkn_fuelstation_control`, `phone_number`, `statistics`, `researched_items`) VALUES
	(16365, 'YVZ99801', 1, 'license:080f85f2784fc282ede18076a4b1811a25ca05c4', 'HCRP | MAMBA !', '{"bank":5220,"crypto":0,"cash":500}', '{"cid":"1","lastname":"Op","firstname":"MamBa","nationality":"BD","birthdate":"2005-05-05","phone":"1305754839","gender":0,"backstory":"placeholder backstory","account":"US01QBCore4259800665"}', '{"onduty":true,"type":"none","isboss":false,"payment":220,"label":"Police","name":"police","grade":{"name":"Ranger","level":3}}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":269.3934020996094,"y":-938.5977783203125,"z":28.5552978515625}', '{"ishandcuffed":false,"jobrep":{"tow":0,"taxi":0,"trucker":0,"hotdog":0},"fingerprint":"DO622j38BpS8851","inlaststand":false,"jailitems":[],"phone":[],"armor":0,"hunger":63.99999999999998,"craftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":42494549},"attachmentcraftingrep":0,"crypto":{"shung":0,"gne":0,"xcoin":0,"lme":0},"criminalrecord":{"hasRecord":false},"isdead":false,"callsign":"NO CALLSIGN","garbage":0,"inside":{"apartment":[]},"delivery":0,"walletid":"QB-65152654","health":200,"status":[],"injail":0,"reporep":0,"commandbinds":[],"thirst":66.00000000000002,"tracker":false,"dealerrep":0,"stress":33,"licences":{"cdl":false,"weapon":false,"driver":false,"permit":false,"bike":false,"business":false},"bloodtype":"A+","fitbit":[]}', '[{"created":1710101195,"info":{"quality":88.74999999999958,"ammo":345,"serie":"62FgZ3lv094iVWy"},"slot":1,"type":"weapon","amount":1,"name":"weapon_pistol"}]', '2024-03-10 20:33:29', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, '{"Wheelie":{"icon":"fas fa-wheelchair","Current":10,"RemoveAmount":-0.2,"Stat":"MP0_WHEELIE_ABILITY","Local":"Wheelie"},"Stamina":{"icon":"fas fa-walking","Current":20,"RemoveAmount":-0.3,"Stat":"MP0_STAMINA","Local":"Stamina"},"LungCapacity":{"icon":"fas fa-heartbeat","Current":10,"RemoveAmount":-0.1,"Stat":"MP0_LUNG_CAPACITY","Local":"Lung Capacity"},"Driving":{"icon":"fas fa-car-side","Current":10.29999999999999,"RemoveAmount":-0.5,"Stat":"MP0_DRIVING_ABILITY","Local":"Driving"},"Strength":{"icon":"fas fa-dumbbell","Current":10.2,"RemoveAmount":-0.3,"Stat":"MP0_STRENGTH","Local":"Strength"},"Shooting":{"icon":"fas fa-bullseye","Current":10,"RemoveAmount":-0.1,"Stat":"MP0_SHOOTING_ABILITY","Local":"Shooting"}}', 0, NULL, NULL, '[]');

-- Dumping structure for table qbcorev9.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcorev9.playerskins: ~1 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(438, 'YVZ99801', 'mp_m_freemode_01', '{"hair":{"color":0,"style":2,"highlight":0,"texture":0},"tattoos":[],"headOverlays":{"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"faceFeatures":{"neckThickness":0,"cheeksWidth":0,"lipsThickness":0,"nosePeakLowering":0,"eyeBrownForward":0,"noseBoneTwist":0,"jawBoneWidth":0,"nosePeakHigh":0,"nosePeakSize":0,"noseBoneHigh":0,"chinBoneLenght":0,"chinHole":0,"jawBoneBackSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"eyesOpening":0,"chinBoneSize":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"noseWidth":0},"model":"mp_m_freemode_01","eyeColor":-1,"headBlend":{"shapeSecond":0,"shapeFirst":0,"skinMix":0,"shapeThird":0,"skinFirst":0,"skinSecond":0,"thirdMix":0,"skinThird":0,"shapeMix":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}]}', 1);

-- Dumping structure for table qbcorev9.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_contacts: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.player_gallery: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_houses: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_jobs: ~30 rows (approximately)
INSERT INTO `player_jobs` (`id`, `jobname`, `employees`, `maxEmployee`) VALUES
	(136, 'police', '{"YVZ99801":{"grade":3,"name":"MamBa Op","cid":"YVZ99801"}}', 15),
	(137, 'vineyard', '[]', 15),
	(138, 'taxi', '[]', 15),
	(139, 'trucker', '[]', 15),
	(140, 'cardealer', '[]', 15),
	(141, 'hotdog', '[]', 15),
	(142, 'recycle', '[]', 15),
	(143, 'mechanic', '[]', 15),
	(144, 'delivery', '[]', 15),
	(145, 'realestate', '[]', 15),
	(146, 'whitewidow', '[]', 15),
	(147, 'taco', '[]', 15),
	(148, 'ambulance', '[]', 15),
	(149, 'upnatoms', '[]', 15),
	(150, 'garbage', '[]', 15),
	(151, 'lawyer', '[]', 15),
	(152, 'oilwell', '[]', 15),
	(153, 'firefighter', '[]', 15),
	(154, 'burgershot', '[]', 15),
	(155, 'uwu', '[]', 15),
	(156, 'fire', '[]', 15),
	(157, 'bus', '[]', 15),
	(158, 'pizzathis', '[]', 15),
	(159, 'mesanuxta', '[]', 15),
	(160, 'beanmachine', '[]', 15),
	(161, 'judge', '[]', 15),
	(162, 'tequilala', '[]', 15),
	(163, 'tow', '[]', 15),
	(164, 'vanilla', '[]', 15),
	(165, 'reporter', '[]', 15);

-- Dumping structure for table qbcorev9.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_mails: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.player_outfits: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_plants
CREATE TABLE IF NOT EXISTS `player_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `seed` varchar(100) NOT NULL,
  `water` double NOT NULL,
  `food` double NOT NULL,
  `stage` double NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.player_plants: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `stored` int(11) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT 'pillboxgarage',
  `parkingspot` varchar(200) DEFAULT NULL,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `job` varchar(50) DEFAULT '',
  `frkn_fueltype` varchar(11) NOT NULL DEFAULT 'normal',
  `datetimein` int(11) DEFAULT 0,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `insurance` varchar(100) NOT NULL DEFAULT 'none',
  `deformation` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_playervehicles_plate` (`plate`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`),
  CONSTRAINT `FK_playervehicles_players` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_vehicles: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.player_warns: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.player_xp
CREATE TABLE IF NOT EXISTS `player_xp` (
  `identifier` varchar(46) NOT NULL,
  `xp` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table qbcorev9.player_xp: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.properties: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pug_animals
CREATE TABLE IF NOT EXISTS `pug_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `animal` varchar(50) DEFAULT NULL,
  `totalmissions` varchar(50) DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `horsemissions` varchar(50) DEFAULT NULL,
  `cowmissions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pug_animals: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.pug_chopping
CREATE TABLE IF NOT EXISTS `pug_chopping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `bucketid` int(11) DEFAULT NULL,
  `cars` text DEFAULT NULL,
  `upgrades` text DEFAULT NULL,
  `access` text DEFAULT NULL,
  `membercap` int(11) DEFAULT NULL,
  `vehiclecap` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `garageloc` text DEFAULT NULL,
  `carsstored` text DEFAULT NULL,
  `arcadegames` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.pug_chopping: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.px_pausemenu
CREATE TABLE IF NOT EXISTS `px_pausemenu` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT 0,
  `standartTasks` longtext DEFAULT NULL,
  `premiumTasks` longtext DEFAULT NULL,
  `rewards` longtext DEFAULT NULL,
  `standartResetTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.px_pausemenu: ~1 rows (approximately)
INSERT INTO `px_pausemenu` (`citizenid`, `currentXP`, `premium`, `standartTasks`, `premiumTasks`, `rewards`, `standartResetTime`) VALUES
	('YVZ99801', NULL, 0, '[{"taken":false,"requiredCount":1,"taskId":1,"hasCount":0,"rewardEXP":8000},{"taken":false,"requiredCount":5,"taskId":2,"hasCount":0,"rewardEXP":2500},{"taken":false,"requiredCount":50,"taskId":3,"hasCount":0,"rewardEXP":2500}]', NULL, 'null', NULL);

-- Dumping structure for table qbcorev9.px_pausemenu_event
CREATE TABLE IF NOT EXISTS `px_pausemenu_event` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.px_pausemenu_event: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.real_bank
CREATE TABLE IF NOT EXISTS `real_bank` (
  `identifier` varchar(50) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `credit` longtext DEFAULT NULL,
  `transaction` longtext DEFAULT NULL,
  `iban` int(4) DEFAULT NULL,
  `password` int(8) DEFAULT NULL,
  `AccountUsed` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.real_bank: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.renzu_motels
CREATE TABLE IF NOT EXISTS `renzu_motels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motel` varchar(64) DEFAULT NULL,
  `hour_rate` int(11) DEFAULT 0,
  `revenue` int(11) DEFAULT 0,
  `employees` longtext DEFAULT NULL,
  `rooms` longtext DEFAULT NULL,
  `owned` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.renzu_motels: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.s4-carplay-album
CREATE TABLE IF NOT EXISTS `s4-carplay-album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `unik` int(11) NOT NULL,
  `owner` text NOT NULL,
  `list` text NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.s4-carplay-album: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.saved_skins
CREATE TABLE IF NOT EXISTS `saved_skins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `mugshot` longtext NOT NULL,
  `skin` text NOT NULL,
  `skin2` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.saved_skins: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.sprays: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11954 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.stashitems: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.stg_apple
CREATE TABLE IF NOT EXISTS `stg_apple` (
  `owner` varchar(50) DEFAULT NULL,
  `settings` longtext DEFAULT '{}',
  `friends` longtext DEFAULT '{}',
  `messages` longtext DEFAULT '{}',
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.stg_apple: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.stg_applelastcall
CREATE TABLE IF NOT EXISTS `stg_applelastcall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.stg_applelastcall: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.stg_bankhistory
CREATE TABLE IF NOT EXISTS `stg_bankhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `price` int(11) DEFAULT 0,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.stg_bankhistory: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.stores
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `coordinate` text DEFAULT NULL,
  `owner` varchar(120) DEFAULT NULL,
  `stock` longtext DEFAULT NULL,
  `products` longtext DEFAULT NULL,
  `request` longtext DEFAULT NULL,
  `balance` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcorev9.stores: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.trunkitems: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.tunerchip_data
CREATE TABLE IF NOT EXISTS `tunerchip_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_plate` varchar(50) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_plate` (`vehicle_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table qbcorev9.tunerchip_data: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.vehicle_stock
CREATE TABLE IF NOT EXISTS `vehicle_stock` (
  `car` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.vehicle_stock: ~0 rows (approximately)

-- Dumping structure for table qbcorev9.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcorev9.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
