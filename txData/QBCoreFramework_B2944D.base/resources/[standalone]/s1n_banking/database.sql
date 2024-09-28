CREATE TABLE IF NOT EXISTS `s1n_bank_accounts`
(
    `id`      INT(11)  NOT NULL AUTO_INCREMENT,
    `owner`   LONGTEXT NULL     DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `iban`    LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `name`    LONGTEXT NULL     DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `type`    LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `balance` INT(11)  NOT NULL DEFAULT '0',
    `members` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `credit`  LONGTEXT NULL     DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (`id`) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `s1n_bank_statements`
(
    `id`     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `iban`   LONGTEXT        NOT NULL COLLATE 'utf8mb4_general_ci',
    `action` LONGTEXT        NOT NULL COLLATE 'utf8mb4_general_ci',
    `label`  LONGTEXT        NOT NULL COLLATE 'utf8mb4_general_ci',
    `amount` INT(11)         NOT NULL DEFAULT '0',
    `date`   LONGTEXT        NOT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (`id`) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
;

alter table s1n_bank_statements
    modify amount bigint default 0 not null;

