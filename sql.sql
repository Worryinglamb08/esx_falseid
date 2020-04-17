CREATE TABLE IF NOT EXISTS `falszywa_licencja` (
  `identifier` varchar(555) DEFAULT NULL,
  `type` varchar(555) DEFAULT NULL
)


CREATE TABLE IF NOT EXISTS `falszywy_dowod` (
  `identifier` varchar(555) NOT NULL,
  `dateofbirth` varchar(555) DEFAULT NULL,
  `sex` varchar(555) DEFAULT NULL,
  `height` varchar(555) DEFAULT NULL,
  `firstname` varchar(555) DEFAULT NULL,
  `lastname` varchar(555) DEFAULT NULL
) 

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('falszywydowod', 'Fałszywy Dowód Osobisty💳', 10, 0, 1);