ALTER TABLE
    `users`
ADD
    IF NOT EXISTS `inside` VARCHAR(50) NULL DEFAULT '';

INSERT INTO
    `addon_inventory` (name, label, shared)
VALUES
    ('propery', 'Property', 0);

INSERT INTO
    `datastore` (name, label, shared)
VALUES
    ('propery', 'Property', 0);