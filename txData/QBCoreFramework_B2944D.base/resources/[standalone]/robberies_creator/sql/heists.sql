CREATE TABLE IF NOT EXISTS `robberies_creator_heists` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`minimum_police` INT(11) NOT NULL DEFAULT '0',
	`timeout_minutes` INT(11) NOT NULL DEFAULT '120',
	`minutes_before_reset` INT(11) NOT NULL DEFAULT '60',
	`time_limit_minutes` INT(11) NOT NULL DEFAULT '0',
	`stages` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
