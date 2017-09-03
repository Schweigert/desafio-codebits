CREATE SCHEMA `codebits` ;

CREATE TABLE `codebits`.`Fragments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `source` VARCHAR(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));
