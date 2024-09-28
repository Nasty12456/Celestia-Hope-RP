DROP TABLE IF EXISTS `houselocations`;

CREATE TABLE `houselocations` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`label` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`coords` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`owned` TINYINT(2) NULL DEFAULT NULL,
	`price` INT(11) NULL DEFAULT NULL,
	`defaultPrice` INT(11) NULL DEFAULT NULL,
	`tier` TINYINT(2) NULL DEFAULT NULL,
	`garage` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`garageShell` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`creator` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`mlo` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`ipl` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`console` INT(11) NULL DEFAULT NULL,
	`board` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`for_sale` INT(11) NULL DEFAULT '1',
	`extra_imgs` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`description` TEXT NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`creatorJob` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`name`) USING BTREE,
	INDEX `name` (`name`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
) COLLATE = 'latin1_swedish_ci' ENGINE = InnoDB AUTO_INCREMENT = 4304;

DROP TABLE IF EXISTS `player_houses`;

CREATE TABLE `player_houses` (
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`house` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`keyholders` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`decorations` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`stash` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`outfit` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`logout` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`decorateStash` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`charge` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`credit` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`creditPrice` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`console` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`decorateCoords` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`rented` INT(11) NULL DEFAULT NULL,
	`rentPrice` INT(11) NULL DEFAULT NULL,
	`rentable` INT(11) NULL DEFAULT NULL,
	`purchasable` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `house` (`house`) USING BTREE,
	INDEX `owner` (`owner`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE
) COLLATE = 'utf8mb4_general_ci' ENGINE = InnoDB AUTO_INCREMENT = 22;

DROP TABLE IF EXISTS `house_rents`;

CREATE TABLE `house_rents` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`house` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`identifier` VARCHAR(80) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`payed` INT(11) NOT NULL DEFAULT '0',
	`date` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE
) COLLATE = 'utf8mb4_general_ci' ENGINE = InnoDB AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `house_objects`;

CREATE TABLE `house_objects` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creator` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`model` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`coords` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`id`) USING BTREE
) COLLATE = 'latin1_swedish_ci' ENGINE = InnoDB;

DROP TABLE IF EXISTS `house_plants`;

CREATE TABLE `house_plants` (
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
) ENGINE = InnoDB AUTO_INCREMENT = 7123 DEFAULT CHARSET = utf8mb4;