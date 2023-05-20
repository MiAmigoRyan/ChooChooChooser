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
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `description` TEXT(500) NULL,
  `profile_photo` VARCHAR(2000) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
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
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `engine` ;

CREATE TABLE IF NOT EXISTS `engine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `photo` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train` ;

CREATE TABLE IF NOT EXISTS `train` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NOT NULL,
  `description` TEXT NULL,
  `year_round` TINYINT NULL,
  `photo` LONGTEXT NULL,
  `website` VARCHAR(2000) NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `rail_gauge_id` INT NOT NULL,
  `engine_id` INT NOT NULL,
  `created_by_user_id` INT NOT NULL,
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
  `name` VARCHAR(45) NOT NULL,
  `amenities` VARCHAR(45) NULL,
  `photo` VARCHAR(2000) NULL,
  `notable_features` TEXT NULL,
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
  `photo` VARCHAR(2000) NULL,
  `start_station_id` INT NOT NULL,
  `end_station_id` INT NOT NULL,
  `train_id` INT NOT NULL,
  `region_id` INT NOT NULL,
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
  `ride_date` DATE NULL,
  `rating` SMALLINT(1) NULL,
  `content` TEXT NULL,
  `photo` LONGTEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `train_id` INT NOT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `description`, `profile_photo`, `enabled`, `role`) VALUES (1, 'admin', 'admin', 'Yosemite', 'Sam', 'World renowned gunslinger | Don\'t mess with his trains.', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/2d/Yosemite_Sam.svg/360px-Yosemite_Sam.svg.png', 1, 'ADMIN');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `description`, `profile_photo`, `enabled`, `role`) VALUES (2, 'trainowner', 'trainowner', 'Train', 'Owner', NULL, NULL, 1, 'Owner');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rail_gauge`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `rail_gauge` (`id`, `type`, `description`) VALUES (1, 'Narrow Gauge', 'a railway with a track gauge narrower than standard 1,435 mm (4 ft 8+1⁄2 in). Most narrow-gauge railways are between 600 mm (1 ft 11+5⁄8 in) and 1,067 mm (3 ft 6 in).');
INSERT INTO `rail_gauge` (`id`, `type`, `description`) VALUES (2, 'Standard Gauge', 'A standard-gauge railway is a railway with a track gauge of 1,435 mm (4 ft 8+1⁄2 in).  It is the most widely used track gauge around the world, with about 55% of the lines in the world using it.');
INSERT INTO `rail_gauge` (`id`, `type`, `description`) VALUES (3, 'Cog Railway', 'A steep grade railway with a toothed rack rail, usually between the running rails. The trains are fitted with one or more cog wheels or pinions that mesh with this rack rail. This allows the trains to operate on steep grades above 10%, which is the maximum for friction-based rail. Most rack railways are mountain railways, although a few are transit railways or tramways built to overcome a steep gradient in an urban environment.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `engine`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `engine` (`id`, `type`, `description`, `photo`) VALUES (1, 'Steam Locomotive', 'A locomotive that provides the force to move itself and other vehicles by means of the expansion of steam.[1]: 80  It is fuelled by burning combustible material (usually coal, oil or, rarely, wood) to heat water in the locomotive\'s boiler to the point where it becomes gaseous and its volume increases 1,700 times.', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/10/3-Locomotive-Portrait-Hall-Tunnel-10.5.19.jpg-Pumped-Reduced-1200x800.jpg');
INSERT INTO `engine` (`id`, `type`, `description`, `photo`) VALUES (2, 'Diesel Locomotive', 'A type of railway locomotive in which the prime mover is a diesel engine. Several types of diesel locomotives have been developed, differing mainly in the means by which mechanical power is conveyed to the driving wheels.', 'https://www.georgetownlooprr.com/wp-content/uploads/2020/08/130easthighbridge07-31-20-0002.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (1, 'Georgetown Loop Railroad', 'History of Georgetown Completed in 1884, this spectacular stretch of three-foot narrow gauge railroad was considered an engineering marvel for its time. The Georgetown Loop Railroad® was one of Colorado’s first visitor attractions with seven trains a day running out of Denver at the height of its popularity, the Georgetown Loop became Colorado’s scenic “must-see.” Guidebooks, pamphlets, and postcards help send the images of the steep canyons and mountain peaks finally accessible by train across the nation.', 0, 'https://www.georgetownlooprr.com/wp-content/uploads/2019/08/Shane-111-High-Bridge-East-Side.jpg', 'https://www.georgetownlooprr.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (2, 'Georgetown Loop Railroad', 'History of Georgetown Completed in 1884, this spectacular stretch of three-foot narrow gauge railroad was considered an engineering marvel for its time. The Georgetown Loop Railroad® was one of Colorado’s first visitor attractions with seven trains a day running out of Denver at the height of its popularity, the Georgetown Loop became Colorado’s scenic “must-see.” Guidebooks, pamphlets, and postcards help send the images of the steep canyons and mountain peaks finally accessible by train across the nation.', 0, 'https://www.georgetownlooprr.com/wp-content/uploads/2019/08/Shane-111-High-Bridge-East-Side.jpg', 'https://www.georgetownlooprr.com/', NULL, NULL, 1, 2, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (3, 'Leadville Railroad', 'Hop aboard the Leadville Colorado and Southern Railroad for the most relaxing and scenic Rocky Mountain experience. This two-and-a-half-hour train ride takes passengers up 1,000 feet from Leadville and through the untamed wilderness of the San Isabel National Forest for breathtaking views of Fremont Pass, Mt. Elbert, Mt. Massive, and the Arkansas River Valley.', 0, 'https://www.colorado.com/sites/default/files/styles/slideshow_slide_medium/public/listing_images/profile/4128/crop.jpg.webp?itok=BMfIRcF-', 'https://www.leadville-train.com/', NULL, NULL, 2, 2, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (4, 'Durango & Silverton Railroad', 'The Durango & Silverton Narrow Gauge Railroad winds through spectacular & breathtaking canyons in the remote wilderness of the two-million acre San Juan National Forest for an unforgettable year-round adventure. Experience the adventure of traveling by a coal-fired, steam-powered locomotive on the same tracks miners, cowboys and settlers of the Old West took over a century ago. Relive history with the sights and sounds of yesteryear for a truly spectacular journey on board the Durango & Silverton Narrow Gauge Railroad.', 1, 'data:image/jpeg;base64,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', 'https://www.durangotrain.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (5, 'Durango & Silverton Railroad', 'The Durango & Silverton Narrow Gauge Railroad winds through spectacular & breathtaking canyons in the remote wilderness of the two-million acre San Juan National Forest for an unforgettable year-round adventure. Experience the adventure of traveling by a coal-fired, steam-powered locomotive on the same tracks miners, cowboys and settlers of the Old West took over a century ago. Relive history with the sights and sounds of yesteryear for a truly spectacular journey on board the Durango & Silverton Narrow Gauge Railroad.', 1, 'data:image/jpeg;base64,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', 'https://www.durangotrain.com/', NULL, NULL, 1, 2, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (6, 'Cumbres and Toltec Scenic Railroad\nCumbres and Toltec Scenic Railroad\nCumbres and Toltec Scenic Railroad', 'The Cumbres & Toltec Scenic Railroad is a National Historic Landmark.  At 64-miles in length, it is the longest, the highest and most authentic steam railroad in North America, traveling through some of the most spectacular scenery in the Rocky Mountain West.', 0, 'https://cumbrestoltec.com/wp-content/uploads/2018/01/Antonito3.jpg', 'https://cumbrestoltec.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (7, 'Cumbres and Toltec Scenic Railroad\nCumbres and Toltec Scenic Railroad\nCumbres and Toltec Scenic Railroad', 'The Cumbres & Toltec Scenic Railroad is a National Historic Landmark.  At 64-miles in length, it is the longest, the highest and most authentic steam railroad in North America, traveling through some of the most spectacular scenery in the Rocky Mountain West.', 0, 'https://cumbrestoltec.com/wp-content/uploads/2018/01/Antonito3.jpg', 'https://cumbrestoltec.com/', NULL, NULL, 1, 2, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (8, 'Great Smoky Mountains Railroad', 'The Great Smoky Mountains Railroad historic train depot sits in the heart of Bryson City, North Carolina and is a favorite regional attraction for family fun. A round-trip on the train is an ideal way to see extraordinary places that you can’t get to by car. Get a front-row view of Fontana Lake, the historic Fontana Trestle, the Great Smoky Mountains National Park, the Nantahala National Forest, the Nantahala and Tuckasegee Rivers, historical structures, and stunning foliage.', 1, 'https://www.gsmr.com/wp-content/themes/yootheme/cache/38/Photo-Oct-16-10-09-46-AM-scaled-3831eb0a.webp', 'https://www.gsmr.com/', NULL, NULL, 2, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `engine_id`, `created_by_user_id`) VALUES (9, 'Great Smoky Mountains Railroad', 'The Great Smoky Mountains Railroad historic train depot sits in the heart of Bryson City, North Carolina and is a favorite regional attraction for family fun. A round-trip on the train is an ideal way to see extraordinary places that you can’t get to by car. Get a front-row view of Fontana Lake, the historic Fontana Trestle, the Great Smoky Mountains National Park, the Nantahala National Forest, the Nantahala and Tuckasegee Rivers, historical structures, and stunning foliage.', 1, 'https://www.gsmr.com/wp-content/themes/yootheme/cache/38/Photo-Oct-16-10-09-46-AM-scaled-3831eb0a.webp', 'https://www.gsmr.com/', NULL, NULL, 2, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (1, 'Dining Car', 'A railroad passenger car that serves meals in the manner of a full-service, sit-down restaurant.');
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (2, 'Whistle Stops', 'A stop or station at which buses or trains, respectively, stop only on request; that is, only if there are passengers or freight to be picked up or dropped off. In this way, stops with low passenger counts can be incorporated into a route without introducing unnecessary delay. Vehicles may also save fuel by continuing through a station when there is no need to stop.');
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (3, 'Orator', 'A narrator that tells a story about the history of the train and railway.');
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (4, 'Open-Air Gondola', 'A passenger car tha allows the rider a full experience of the ride. ');
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (5, 'Parlor Car', 'A parlor car is a type of passenger coach that provides superior comforts and amenities compared to a standard coach.');
INSERT INTO `amenity` (`id`, `type`, `description`) VALUES (6, 'Caboose', 'A crewed North American railroad car coupled at the end of a freight train. Cabooses provide shelter for crew at the end of a train, who were formerly required in switching and shunting, keeping a lookout for load shifting, damage to equipment and cargo, and overheating axles.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `region`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `region` (`id`, `name`) VALUES (1, 'Rocky Mountains');
INSERT INTO `region` (`id`, `name`) VALUES (2, 'Appalachian Mountains');
INSERT INTO `region` (`id`, `name`) VALUES (3, 'Pacific Coast');
INSERT INTO `region` (`id`, `name`) VALUES (4, 'Atlantic Coast');
INSERT INTO `region` (`id`, `name`) VALUES (5, 'Central Plains');
INSERT INTO `region` (`id`, `name`) VALUES (6, 'Alaska');

COMMIT;


-- -----------------------------------------------------
-- Data for table `station`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (1, 'Georgetown Devil\'s Gate Station', NULL, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/04/devilsgateair-0008-06-08-19.jpg', NULL, 'Georgetown', 'Colorado', '646 Loop Drive', '80444');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (2, 'Silver Plume Station', NULL, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/05/silverplume-0001.jpg', NULL, 'Silver Plume', 'Colorado', '825 Railroad Avenue', '80476');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (3, 'Leadville Station', NULL, 'https://www.colorado.com/sites/default/files/styles/slideshow_slide_medium/public/listing_images/profile/4128/dsc_0006.jpg.webp?itok=MunRumG9', NULL, 'Leadville', 'Colorado', '326 E 7th Street', '80461');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (4, 'Durango Station', NULL, 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/silverton-durango-train-depot-linda-unger.jpg', NULL, 'Durango', 'Colorado', '479 Main Avenue', '81301');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (5, 'Antonito Station', NULL, 'https://www.uncovercolorado.com/wp-content/uploads/2018/01/antonito-train-station-flags-cumbres-toltec-railroad-1280x800.jpg', NULL, 'Antonito', 'Colorado', '5234 US Hwy 285', '81120');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (6, 'Chama Station', NULL, 'https://cumbrestoltec.com/wp-content/uploads/2018/02/ChamaStation.jpg', NULL, 'Chama', 'New Mexico', '500 Terrace Avenue', '87520');
INSERT INTO `station` (`id`, `name`, `amenities`, `photo`, `notable_features`, `city`, `state`, `street`, `zip_code`) VALUES (7, 'Bryson City Depot', NULL, 'https://www.greatsmokies.com/wp-content/uploads/2018/06/GSMR-square-installed.jpg', NULL, 'Bryson City', 'North Carolina', '45 Mitchell Street', '28713');

COMMIT;


-- -----------------------------------------------------
-- Data for table `route`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (1, 'Georgetown Loop', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 1, 1, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (2, 'Georgetown to Silver Plume', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 1, 2, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (3, 'Silver Plume to Georgetown', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 2, 1, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (4, 'Georgetown Loop', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 1, 1, 2, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (5, 'Georgetown to Silver Plume', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 1, 2, 2, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (6, 'Silver Plume to Georgetown', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 2, 1, 2, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (7, 'Leadville Loop', 'https://www.google.com/maps/d/thumbnail?mid=15ff4vGIAHVQn8yKDcV7dGF31uls&hl=en_US', 3, 3, 3, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (8, 'Scenic Round Trip Silverton Train', 'https://www.legendsofamerica.com/wp-content/uploads/2018/09/DurangoSilvertonmap.jpg', 4, 4, 4, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (9, 'Cascade Canyon Express', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/98/0a18916604a9e0debaba451ed1ad0783-98a5e3e5.webp', 4, 4, 4, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (10, 'Cascade Canyon Winter Train', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/6e/anthdamatomusic-Instagram-921-ig-17926105948281747-6ee31603.webp', 4, 4, 4, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (11, 'Scenic Round Trip Silverton Train', 'https://www.legendsofamerica.com/wp-content/uploads/2018/09/DurangoSilvertonmap.jpg', 4, 4, 5, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (12, 'Cascade Canyon Express', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/98/0a18916604a9e0debaba451ed1ad0783-98a5e3e5.webp', 4, 4, 5, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (13, 'Cascade Canyon Winter Train', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/6e/anthdamatomusic-Instagram-921-ig-17926105948281747-6ee31603.webp', 4, 4, 5, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (14, 'Antonito to Chama', 'https://cumbrestoltec.com/images/imap/imap_bg.png', 5, 6, 6, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (15, 'Chama to Antonito', 'https://cumbrestoltec.com/images/imap/imap_bg.png', 6, 5, 6, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (16, 'Antonito to Chama', 'https://cumbrestoltec.com/images/imap/imap_bg.png', 5, 6, 7, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (17, 'Chama to Antonito', 'https://cumbrestoltec.com/images/imap/imap_bg.png', 6, 5, 7, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (18, 'Nantahala Gorge Excursion', 'https://hawkinsrails.net/preservation/gsm/tuckasegee/route_dillsboro.jpg', 7, 7, 8, 2);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (19, 'Tuckasegee River Excursion', 'https://hawkinsrails.net/preservation/gsm/tuckasegee/route_dillsboro.jpg', 7, 7, 8, 2);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (20, 'Nantahala Gorge Excursion', 'https://hawkinsrails.net/preservation/gsm/tuckasegee/route_dillsboro.jpg', 7, 7, 9, 2);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (21, 'Tuckasegee River Excursion', 'https://hawkinsrails.net/preservation/gsm/tuckasegee/route_dillsboro.jpg', 7, 7, 9, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `photo`, `create_date`, `last_update`, `user_id`, `train_id`) VALUES (1, 'Risking it all at Devil\'s Gate', '2019-10-24', 5, NULL, 'https://www.georgetownlooprr.com/wp-content/uploads/2022/01/111-High-Bridge-6.22.19-For-Website-2048x1287.jpg', NULL, NULL, 1, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `photo`, `create_date`, `last_update`, `user_id`, `train_id`) VALUES (2, 'Breathtaking views at Devils Tail Stop', '2020-06-15', 5, NULL, 'data:image/jpeg;base64,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', NULL, NULL, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 4);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 6);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (1, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/04/meet111-40-0001.jpg', 1);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (2, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/05/lebanon0003.jpg', 1);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (3, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/11/1934pg0003-11-04-20-2.jpg', 1);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (4, 'https://www.leadvilletwinlakes.com/wp-content/uploads/2017/05/FallTrain1-1000.jpg', 2);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (5, 'https://img-aws.ehowcdn.com/700x/www.onlyinyourstate.com/wp-content/uploads/2018/03/photo0jpg-158.jpg', 2);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNNNcz_lPImUxTs3NCEzlg4vcVoz0dYK_M2A&usqp=CAU', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_has_amenities`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (1, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (1, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (1, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (1, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (2, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (2, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (2, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (2, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (3, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (3, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (3, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (3, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (3, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (4, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (4, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (4, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (4, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (4, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (5, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (5, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (5, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (5, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (5, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (6, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (6, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (6, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (6, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (6, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (7, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (7, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (7, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (7, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (7, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (8, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (8, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (8, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (8, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (8, 6);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (9, 1);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (9, 3);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (9, 4);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (9, 5);
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (9, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_comment` (`id`, `content`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`) VALUES (1, 'This train was GREAT!', '2019-10-24', 1, 1, NULL);
INSERT INTO `train_comment` (`id`, `content`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`) VALUES (2, 'Another wonderful train ride!', '2020-06-15', 3, 1, NULL);
INSERT INTO `train_comment` (`id`, `content`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`) VALUES (3, 'Thank you for riding!', '2019-11-10', 1, 2, 1);

COMMIT;

