-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trainsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trainsdb` ;

-- -----------------------------------------------------
-- Schema trainsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trainsdb` DEFAULT CHARACTER SET utf8 ;
USE `trainsdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `description` TEXT(500) NULL,
  `profile_photo` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rail_gauge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rail_gauge` ;

CREATE TABLE IF NOT EXISTS `rail_gauge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `engine` ;

CREATE TABLE IF NOT EXISTS `engine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `photo` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train` ;

CREATE TABLE IF NOT EXISTS `train` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `photo` LONGTEXT NULL,
  `rail_gauge_id` INT NOT NULL,
  `engine_id` INT NOT NULL,
  `year_round` TINYINT NULL,
  `created_by_user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `description` TEXT NULL,
  `website` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_train_rail_gauge_idx` (`rail_gauge_id` ASC),
  INDEX `fk_train_engine1_idx` (`engine_id` ASC),
  INDEX `fk_train_user1_idx` (`created_by_user_id` ASC),
  CONSTRAINT `fk_train_rail_gauge`
    FOREIGN KEY (`rail_gauge_id`)
    REFERENCES `rail_gauge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_engine1`
    FOREIGN KEY (`engine_id`)
    REFERENCES `engine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_user1`
    FOREIGN KEY (`created_by_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity` ;

CREATE TABLE IF NOT EXISTS `amenity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `region` ;

CREATE TABLE IF NOT EXISTS `region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station` ;

CREATE TABLE IF NOT EXISTS `station` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amenities` VARCHAR(45) NULL,
  `photo` VARCHAR(2000) NULL,
  `notable_features` TEXT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `street` VARCHAR(100) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `route` ;

CREATE TABLE IF NOT EXISTS `route` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `region_id` INT NOT NULL,
  `start_station_id` INT NOT NULL,
  `end_station_id` INT NOT NULL,
  `photo` VARCHAR(2000) NULL,
  `train_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_route_region1_idx` (`region_id` ASC),
  INDEX `fk_route_station1_idx` (`start_station_id` ASC),
  INDEX `fk_route_station2_idx` (`end_station_id` ASC),
  INDEX `fk_route_train1_idx` (`train_id` ASC),
  CONSTRAINT `fk_route_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_route_station1`
    FOREIGN KEY (`start_station_id`)
    REFERENCES `station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_route_station2`
    FOREIGN KEY (`end_station_id`)
    REFERENCES `station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_route_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `train_ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train_ride` ;

CREATE TABLE IF NOT EXISTS `train_ride` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `content` TEXT NULL,
  `create_date` DATETIME NULL,
  `rating` SMALLINT(1) NULL,
  `photo` LONGTEXT NULL,
  `user_id` INT NOT NULL,
  `train_id` INT NOT NULL,
  `last_update` DATETIME NULL,
  `ride_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_user1_idx` (`user_id` ASC),
  INDEX `fk_review_train1_idx` (`train_id` ASC),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist_train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist_train` ;

CREATE TABLE IF NOT EXISTS `wishlist_train` (
  `user_id` INT NOT NULL,
  `train_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `train_id`),
  INDEX `fk_user_has_train_train1_idx` (`train_id` ASC),
  INDEX `fk_user_has_train_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_train_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_train_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride_photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride_photo` ;

CREATE TABLE IF NOT EXISTS `ride_photo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo` VARCHAR(2000) NULL,
  `train_ride_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ride_photo_train_ride1_idx` (`train_ride_id` ASC),
  CONSTRAINT `fk_ride_photo_train_ride1`
    FOREIGN KEY (`train_ride_id`)
    REFERENCES `train_ride` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `train_has_amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train_has_amenities` ;

CREATE TABLE IF NOT EXISTS `train_has_amenities` (
  `train_id` INT NOT NULL,
  `amenities_id` INT NOT NULL,
  PRIMARY KEY (`train_id`, `amenities_id`),
  INDEX `fk_train_has_amenities_amenities1_idx` (`amenities_id` ASC),
  INDEX `fk_train_has_amenities_train1_idx` (`train_id` ASC),
  CONSTRAINT `fk_train_has_amenities_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_has_amenities_amenities1`
    FOREIGN KEY (`amenities_id`)
    REFERENCES `amenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `train_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train_comment` ;

CREATE TABLE IF NOT EXISTS `train_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `comment_date` DATETIME NULL,
  `train_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reply_comment_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_train_comment_train1_idx` (`train_id` ASC),
  INDEX `fk_train_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_train_comment_train_comment1_idx` (`reply_comment_id` ASC),
  CONSTRAINT `fk_train_comment_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_comment_train_comment1`
    FOREIGN KEY (`reply_comment_id`)
    REFERENCES `train_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS traintracker@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'traintracker'@'localhost' IDENTIFIED BY 'traintracker';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'traintracker'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `description`, `profile_photo`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rail_gauge`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `rail_gauge` (`id`, `type`, `description`) VALUES (1, 'Narrow Gauge', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `engine`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `engine` (`id`, `type`, `description`, `photo`) VALUES (1, 'Steam Locomotive', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train` (`id`, `name`, `photo`, `rail_gauge_id`, `engine_id`, `year_round`, `created_by_user_id`, `create_date`, `last_update`, `description`, `website`) VALUES (1, 'Georgetown Loop Railroad', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/08/Shane-111-High-Bridge-East-Side.jpg', 1, 1, 0, 1, NULL, NULL, NULL, 'https://www.georgetownlooprr.com/');

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (1, 'Dining Car', NULL);
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (2, 'Whistle Stops', NULL);
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (3, 'Narrator', NULL);
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (4, 'Open-Air', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `region`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `region` (`id`, `name`) VALUES (1, 'Rocky Mountains');

COMMIT;


-- -----------------------------------------------------
-- Data for table `station`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `station` (`id`, `amenities`, `photo`, `notable_features`, `name`, `city`, `state`, `street`, `zip_code`) VALUES (1, NULL, NULL, NULL, 'Georgetown Devil\'s Gate Station', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `route`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `route` (`id`, `description`, `region_id`, `start_station_id`, `end_station_id`, `photo`, `train_id`) VALUES (1, NULL, 1, 1, 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_ride` (`id`, `title`, `content`, `create_date`, `rating`, `photo`, `user_id`, `train_id`, `last_update`, `ride_date`) VALUES (1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_comment` (`id`, `content`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`) VALUES (1, NULL, NULL, 1, 1, NULL);

COMMIT;

