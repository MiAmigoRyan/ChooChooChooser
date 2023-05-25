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
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL DEFAULT 'USER',
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
  `created_by_user_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_train_rail_gauge_idx` (`rail_gauge_id` ASC),
  INDEX `fk_train_user1_idx` (`created_by_user_id` ASC),
  CONSTRAINT `fk_train_rail_gauge`
    FOREIGN KEY (`rail_gauge_id`)
    REFERENCES `rail_gauge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_user1`
    FOREIGN KEY (`created_by_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `photo` VARCHAR(2000) NULL,
  `features` TEXT NULL,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
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
  `rating` SMALLINT(1) NOT NULL,
  `content` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `train_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
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
  `comment` TEXT NULL,
  `comment_date` DATETIME NULL,
  `train_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reply_comment_id` INT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
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


-- -----------------------------------------------------
-- Table `train_engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `train_engine` ;

CREATE TABLE IF NOT EXISTS `train_engine` (
  `train_id` INT NOT NULL,
  `engine_id` INT NOT NULL,
  PRIMARY KEY (`train_id`, `engine_id`),
  INDEX `fk_train_has_engine_engine1_idx` (`engine_id` ASC),
  INDEX `fk_train_has_engine_train1_idx` (`train_id` ASC),
  CONSTRAINT `fk_train_has_engine_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_has_engine_engine1`
    FOREIGN KEY (`engine_id`)
    REFERENCES `engine` (`id`)
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `description`, `profile_photo`, `enabled`, `role`) VALUES (2, 'rider1', 'rider1', 'Road', 'Runner', '. . . beep beep . . .', 'https://i.pinimg.com/originals/dd/cd/20/ddcd201da806b6583d1304b08eb69135.jpg', 1, 'USER');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `description`, `profile_photo`, `enabled`, `role`) VALUES (3, 'rider2', 'rider2', 'Wile E', 'Coyote', 'If there\'s an explosion, I\'m probably a part of it.', 'https://cdn.mos.cms.futurecdn.net/8Pg8feG8WfjNwNgbXbUfaT-1200-80.jpg', 1, 'USER');

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
-- Data for table `train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `created_by_user_id`, `enabled`) VALUES (1, 'Georgetown Loop Railroad', 'History of Georgetown Completed in 1884, this spectacular stretch of three-foot narrow gauge railroad was considered an engineering marvel for its time. The Georgetown Loop Railroad® was one of Colorado’s first visitor attractions with seven trains a day running out of Denver at the height of its popularity, the Georgetown Loop became Colorado’s scenic “must-see.” Guidebooks, pamphlets, and postcards help send the images of the steep canyons and mountain peaks finally accessible by train across the nation.', 0, 'https://www.georgetownlooprr.com/wp-content/uploads/2019/08/Shane-111-High-Bridge-East-Side.jpg', 'https://www.georgetownlooprr.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `created_by_user_id`, `enabled`) VALUES (2, 'Leadville Railroad', 'Hop aboard the Leadville Colorado and Southern Railroad for the most relaxing and scenic Rocky Mountain experience. This two-and-a-half-hour train ride takes passengers up 1,000 feet from Leadville and through the untamed wilderness of the San Isabel National Forest for breathtaking views of Fremont Pass, Mt. Elbert, Mt. Massive, and the Arkansas River Valley.', 0, 'https://www.colorado.com/sites/default/files/styles/slideshow_slide_medium/public/listing_images/profile/4128/crop.jpg.webp?itok=BMfIRcF-', 'https://www.leadville-train.com/', NULL, NULL, 2, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `created_by_user_id`, `enabled`) VALUES (3, 'Durango & Silverton Railroad', 'The Durango & Silverton Narrow Gauge Railroad winds through spectacular & breathtaking canyons in the remote wilderness of the two-million acre San Juan National Forest for an unforgettable year-round adventure. Experience the adventure of traveling by a coal-fired, steam-powered locomotive on the same tracks miners, cowboys and settlers of the Old West took over a century ago. Relive history with the sights and sounds of yesteryear for a truly spectacular journey on board the Durango & Silverton Narrow Gauge Railroad.', 1, 'https://i.ytimg.com/vi/Kiz87PDpXgE/maxresdefault.jpg', 'https://www.durangotrain.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `created_by_user_id`, `enabled`) VALUES (4, 'Cumbres and Toltec Scenic Railroad', 'The Cumbres & Toltec Scenic Railroad is a National Historic Landmark.  At 64-miles in length, it is the longest, the highest and most authentic steam railroad in North America, traveling through some of the most spectacular scenery in the Rocky Mountain West.', 0, 'https://www.colorado.com/sites/default/files/listing_images/profile/8075/img_9827.jpg', 'https://cumbrestoltec.com/', NULL, NULL, 1, 1, 1);
INSERT INTO `train` (`id`, `name`, `description`, `year_round`, `photo`, `website`, `create_date`, `last_update`, `rail_gauge_id`, `created_by_user_id`, `enabled`) VALUES (5, 'Great Smoky Mountains Railroad', 'The Great Smoky Mountains Railroad historic train depot sits in the heart of Bryson City, North Carolina and is a favorite regional attraction for family fun. A round-trip on the train is an ideal way to see extraordinary places that you can’t get to by car. Get a front-row view of Fontana Lake, the historic Fontana Trestle, the Great Smoky Mountains National Park, the Nantahala National Forest, the Nantahala and Tuckasegee Rivers, historical structures, and stunning foliage.', 1, 'https://www.gsmr.com/wp-content/themes/yootheme/cache/38/Photo-Oct-16-10-09-46-AM-scaled-3831eb0a.webp', 'https://www.gsmr.com/', NULL, NULL, 2, 1, 1);

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
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (1, 'Georgetown Devil\'s Gate Station', 'https://www.georgetownlooprr.com/wp-content/uploads/2020/04/devilsgateair-0008-06-08-19.jpg', NULL, '646 Loop Drive', 'Georgetown', 'Colorado', '80444');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (2, 'Silver Plume Station', 'https://www.georgetownlooprr.com/wp-content/uploads/2020/05/silverplume-0001.jpg', NULL, '825 Railroad Avenue', 'Silver Plume', 'Colorado', '80476');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (3, 'Leadville Station', 'https://www.colorado.com/sites/default/files/styles/slideshow_slide_medium/public/listing_images/profile/4128/dsc_0006.jpg.webp?itok=MunRumG9', NULL, '326 E 7th Street', 'Leadville', 'Colorado', '80461');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (4, 'Durango Station', 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/silverton-durango-train-depot-linda-unger.jpg', NULL, '479 Main Avenue', 'Durango', 'Colorado', '81301');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (5, 'Antonito Station', 'https://www.uncovercolorado.com/wp-content/uploads/2018/01/antonito-train-station-flags-cumbres-toltec-railroad-1280x800.jpg', NULL, '5234 US Hwy 285', 'Antonito', 'Colorado', '81120');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (6, 'Chama Station', 'https://cumbrestoltec.com/wp-content/uploads/2018/02/ChamaStation.jpg', NULL, '500 Terrace Avenue', 'Chama', 'New Mexico', '87520');
INSERT INTO `station` (`id`, `name`, `photo`, `features`, `street`, `city`, `state`, `zip_code`) VALUES (7, 'Bryson City Depot', 'https://www.greatsmokies.com/wp-content/uploads/2018/06/GSMR-square-installed.jpg', NULL, '45 Mitchell Street', 'Bryson City', 'North Carolina', '28713');

COMMIT;


-- -----------------------------------------------------
-- Data for table `route`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (1, 'Georgetown Loop', 'https://www.georgetownlooprr.com/wp-content/uploads/2019/09/Current-Rail-Map.jpeg', 1, 1, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (2, 'Georgetown to Silver Plume', 'https://i0.wp.com/unusualplaces.org/wp-content/uploads/2018/12/georgetownlooprailroad.jpeg', 1, 2, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (3, 'Silver Plume to Georgetown', 'https://photobyjohnbo.files.wordpress.com/2017/09/journey-14.jpg', 2, 1, 1, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (4, 'Leadville Loop', 'http://coloradoscenicrails.com/wp-content/uploads/2017/05/leadville-wide.gif', 3, 3, 2, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (5, 'Scenic Round Trip Silverton Train', 'https://www.legendsofamerica.com/wp-content/uploads/2018/09/DurangoSilvertonmap.jpg', 4, 4, 3, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (6, 'Cascade Canyon Express', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/98/0a18916604a9e0debaba451ed1ad0783-98a5e3e5.webp', 4, 4, 3, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (7, 'Cascade Canyon Winter Train', 'https://www.durangotrain.com/wp-content/themes/yootheme/cache/6e/anthdamatomusic-Instagram-921-ig-17926105948281747-6ee31603.webp', 4, 4, 3, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (8, 'Antonito to Chama', 'https://cumbrestoltec.com/wp-content/uploads/2017/03/CTSRR-LineMap_redline_condensed.jpg', 5, 6, 4, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (9, 'Chama to Antonito', 'https://cumbrestoltec.com/wp-content/uploads/2017/03/InteractiveMap.jpg', 6, 5, 4, 1);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (10, 'Nantahala Gorge Excursion', 'https://hawkinsrails.net/preservation/gsm/tuckasegee/route_dillsboro.jpg', 7, 7, 5, 2);
INSERT INTO `route` (`id`, `description`, `photo`, `start_station_id`, `end_station_id`, `train_id`, `region_id`) VALUES (11, 'Tuckasegee River Excursion', 'https://www.american-rails.com/images/GMSR223Fall.jpg', 7, 7, 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_ride`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (1, 'Risking it all at Devil\'s Gate', '2019-10-24', 3, 'awesome!', NULL, NULL, 1, 1, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (2, 'Breathtaking views at Devils Tail Stop', '2020-06-15', 3, 'Why does everything have a devil?', NULL, NULL, 1, 2, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (3, 'Beep Beep', '2023-05-20', 2, 'beep beep', NULL, NULL, 2, 1, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (4, 'Kaboom!', '2022-06-17', 3, 'Uh oh...', NULL, NULL, 3, 5, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (5, 'Beep beep beep', '2021-08-13', 2, 'More beep beep..', NULL, NULL, 2, 3, 1);
INSERT INTO `train_ride` (`id`, `title`, `ride_date`, `rating`, `content`, `create_date`, `last_update`, `user_id`, `train_id`, `enabled`) VALUES (6, 'At it again!', '2020-09-07', 2, 'Acme help me!', NULL, NULL, 3, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_train`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 3);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 4);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (1, 5);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (3, 3);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (3, 2);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (2, 5);
INSERT INTO `wishlist_train` (`user_id`, `train_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ride_photo`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (1, 'https://www.georgetownlooprr.com/wp-content/uploads/2020/04/meet111-40-0001.jpg', 1);
INSERT INTO `ride_photo` (`id`, `photo`, `train_ride_id`) VALUES (2, 'https://www.georgetownlooprr.com/wp-content/uploads/2022/01/111-High-Bridge-6.22.19-For-Website-2048x1287.jpg', 1);
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
INSERT INTO `train_has_amenities` (`train_id`, `amenities_id`) VALUES (2, 1);
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (1, 'This train was GREAT!', '2019-10-24', 1, 1, NULL, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (2, 'Another wonderful train ride!', '2020-06-15', 3, 1, NULL, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (3, 'Beep beep!', '2019-11-10', 1, 2, 1, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (4, 'I\'ll get that darn bird!!!', '2023-05-12', 2, 3, NULL, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (5, 'Where\'s my dynamite?!', '2021-09-04', 4, 3, NULL, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (6, 'Beep beep!', '2023-05-13', 5, 2, NULL, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (7, 'Uh-oh...', '2020-06-18', 3, 3, 2, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (8, 'Rootenest tootenest train ride ever!', '2022-07-14', 5, 1, 5, 1);
INSERT INTO `train_comment` (`id`, `comment`, `comment_date`, `train_id`, `user_id`, `reply_comment_id`, `enabled`) VALUES (9, 'Beep beep!', '2022-10-09', 4, 2, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `train_engine`
-- -----------------------------------------------------
START TRANSACTION;
USE `trainsdb`;
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (1, 1);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (1, 2);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (2, 2);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (3, 1);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (3, 2);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (4, 1);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (4, 2);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (5, 1);
INSERT INTO `train_engine` (`train_id`, `engine_id`) VALUES (5, 2);

COMMIT;

