CREATE TABLE IF NOT EXISTS `robberies_creator_plannings` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`cargo_robbery_id` INT(11) NULL DEFAULT NULL,
	`minimum_police` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE,
	INDEX `cargo_robbery_id` (`cargo_robbery_id`) USING BTREE,
	CONSTRAINT `cargo_robbery_id` FOREIGN KEY (`cargo_robbery_id`) REFERENCES `robberies_creator_cargo_robberies` (`id`) ON UPDATE CASCADE ON DELETE SET NULL
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;
