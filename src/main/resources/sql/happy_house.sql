use happyhouse;

drop table bookmark;
drop table dongcode;
drop table guguncode;
drop table housedeal;
drop table sidocode;
drop table user;
drop table houseinfo;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema happyhouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema happyhouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `happyhouse` DEFAULT CHARACTER SET utf8 ;
USE `happyhouse` ;

-- -----------------------------------------------------
-- Table `happyhouse`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`user` (
  `id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `number` VARCHAR(14) NOT NULL,
  `accessToken` VARCHAR(512) NULL,
  `refreshToken` VARCHAR(512) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `happyhouse`.`bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`bookmark` (
  `no` VARCHAR(20) NOT NULL,
  `dongCode` VARCHAR(45) NOT NULL,
  `sidoName` VARCHAR(30) NOT NULL,
  `gugunName` VARCHAR(30) NOT NULL,
  `dongName` VARCHAR(30) NOT NULL,
  `id` VARCHAR(20) NOT NULL,
  `aptCode` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_bookmark_user1_idx` (`id` ASC) VISIBLE,
  INDEX `fk_bookmark_houseinfo1_idx` (`aptCode` ASC) VISIBLE,
  CONSTRAINT `fk_bookmark_user1`
    FOREIGN KEY (`id`)
    REFERENCES `happyhouse`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookmark_houseinfo1`
    FOREIGN KEY (`aptCode`)
    REFERENCES `happyhouse`.`houseinfo` (`aptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

drop table bookmark;

-- -----------------------------------------------------
-- Table `happyhouse`.`dongcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`dongcode` (
  `dongCode` VARCHAR(10) NOT NULL,
  `dongName` VARCHAR(10) NOT NULL,
  `gugunCode` VARCHAR(10) NOT NULL,
  `sidoCode` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`dongCode`, `dongName`),
  INDEX `fk_dongcode_guguncode1_idx` (`gugunCode` ASC) VISIBLE,
  INDEX `fk_dongcode_sidocode1_idx` (`sidoCode` ASC) VISIBLE,
  CONSTRAINT `fk_dongcode_guguncode1`
    FOREIGN KEY (`gugunCode`)
    REFERENCES `happyhouse`.`guguncode` (`gugunCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dongcode_sidocode1`
    FOREIGN KEY (`sidoCode`)
    REFERENCES `happyhouse`.`sidocode` (`sidoCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

set foreign_key_checks = 0;
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dongcode.csv' 
ignore into table dongcode character set utf8mb4
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 rows;
set foreign_key_checks = 1;
-- -----------------------------------------------------
-- Table `happyhouse`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`sector` (
  `sectorId` INT NOT NULL AUTO_INCREMENT,
  `sanghoName` VARCHAR(20) NOT NULL,
  `jijeomName` VARCHAR(20) NOT NULL,
  `largeCategory` VARCHAR(20) NOT NULL,
  `mediumCategory` VARCHAR(20) NOT NULL,
  `smallCategory` VARCHAR(20) NOT NULL,
  `sidoName` VARCHAR(10) NOT NULL,
  `gugunName` VARCHAR(30) NOT NULL,
  `dongName` VARCHAR(10) NOT NULL,
  `buildingName` VARCHAR(20) NULL,
  `address` VARCHAR(45) NOT NULL,
  `addressNumber` VARCHAR(10) NOT NULL,
  `dong` VARCHAR(10) NULL,
  `floor` INT NULL,
  `lon` DECIMAL(18,10) NULL,
  `lat` DECIMAL(18,10) NULL,
  PRIMARY KEY (`sectorId`))
ENGINE = InnoDB;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sector.csv' 
ignore into table sector character set utf8mb4
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 rows;


-- -----------------------------------------------------
-- Table `happyhouse`.`dust`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`dust` (
  `time` VARCHAR(12) NULL,
  `dustId` INT NOT NULL AUTO_INCREMENT,
  `sidoName` VARCHAR(10) NOT NULL,
  `gugunName` VARCHAR(30) NOT NULL,
  `fine` INT NULL,
  `micro` INT NULL,
  `rating` VARCHAR(10) NULL,
  PRIMARY KEY (`dustId`))
ENGINE = InnoDB;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dust.csv' 
ignore into table dust character set utf8mb4
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 rows;

-- -----------------------------------------------------
-- Table `happyhouse`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`hospital` (
  `hospitalId` INT NOT NULL AUTO_INCREMENT,
  `sidoName` VARCHAR(10) NOT NULL,
  `gugunName` VARCHAR(30) NOT NULL,
  `hospitalName` VARCHAR(30) NOT NULL,
  `hospitalAddress` VARCHAR(45) NOT NULL,
  `hospitalNumber` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`hospitalId`))
ENGINE = InnoDB;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hospital.csv' 
ignore into table hospital character set utf8mb4
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 rows;


-- -----------------------------------------------------
-- Table `happyhouse`.`clinic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`clinic` (
  `clinicId` INT NOT NULL AUTO_INCREMENT,
  `sidoName` VARCHAR(10) NOT NULL,
  `gugunName` VARCHAR(30) NOT NULL,
  `clinicName` VARCHAR(30) NOT NULL,
  `sampleEnable` VARCHAR(1) NOT NULL,
  `ratEnable` VARCHAR(1) NOT NULL,
  `clinicAddress` VARCHAR(45) NOT NULL,
  `weekTime` VARCHAR(20) NOT NULL,
  `saturdayTime` VARCHAR(20) NOT NULL,
  `sundayTime` VARCHAR(20) NOT NULL,
  `holidayTime` VARCHAR(20) NOT NULL,
  `clinicNumber` VARCHAR(14) NOT NULL,
  `controlName` VARCHAR(30) NOT NULL,
  `controlNumber` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`clinicId`))
ENGINE = InnoDB;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\clinic.csv' 
ignore into table clinic character set utf8mb4
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 rows;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;