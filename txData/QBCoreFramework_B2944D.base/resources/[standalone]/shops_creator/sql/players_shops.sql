CREATE TABLE IF NOT EXISTS `shops_creator_players_shops` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`price` INT(11) NOT NULL,
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`owner` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`employees_data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`stored_money` INT(11) NOT NULL,
	`owner_label` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`is_open` TINYINT(4) NOT NULL DEFAULT '1',
	`last_robbed` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;