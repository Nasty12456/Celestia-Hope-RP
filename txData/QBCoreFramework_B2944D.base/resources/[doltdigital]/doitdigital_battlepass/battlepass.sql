CREATE TABLE IF NOT EXISTS `battlepass` (
  `identifier` varchar(46) NOT NULL,
  `level` int(11) DEFAULT 1,
  `xp` int(11) DEFAULT 0,
  `cr_level` int(11) DEFAULT 1,
  `cr_xp` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;