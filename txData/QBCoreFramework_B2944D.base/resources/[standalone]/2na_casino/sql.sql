CREATE TABLE IF NOT EXISTS `2na_casino` (
  `identifier` varchar(50) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
