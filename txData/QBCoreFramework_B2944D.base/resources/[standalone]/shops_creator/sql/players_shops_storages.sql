CREATE TABLE IF NOT EXISTS `shops_creator_players_shops_storages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`quantity` INT(11) NOT NULL DEFAULT '0',
	`shop_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE,
	INDEX `shop_id_storages` (`shop_id`) USING BTREE,
	CONSTRAINT `shop_id_storages` FOREIGN KEY (`shop_id`) REFERENCES `shops_creator_players_shops` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;