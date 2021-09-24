-- MySQL Script generated by MySQL Workbench
-- Fri Sep 24 13:35:26 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itunes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itunes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itunes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `itunes` ;

-- -----------------------------------------------------
-- Table `itunes`.`author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`author` ;

CREATE TABLE IF NOT EXISTS `itunes`.`author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`musical_label`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`musical_label` ;

CREATE TABLE IF NOT EXISTS `itunes`.`musical_label` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`album` ;

CREATE TABLE IF NOT EXISTS `itunes`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `author_id` INT NOT NULL,
  `musical_label_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `author_id` (`author_id` ASC) VISIBLE,
  INDEX `musical_label_id` (`musical_label_id` ASC) VISIBLE,
  CONSTRAINT `album_ibfk_1`
    FOREIGN KEY (`author_id`)
    REFERENCES `itunes`.`author` (`id`),
  CONSTRAINT `album_ibfk_2`
    FOREIGN KEY (`musical_label_id`)
    REFERENCES `itunes`.`musical_label` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`genre` ;

CREATE TABLE IF NOT EXISTS `itunes`.`genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`user` ;

CREATE TABLE IF NOT EXISTS `itunes`.`user` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL,
  `email` VARCHAR(99) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`song` ;

CREATE TABLE IF NOT EXISTS `itunes`.`song` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `author_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  `price` INT NULL DEFAULT '1',
  `downloads` INT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `author_id` (`author_id` ASC) VISIBLE,
  INDEX `genre_id` (`genre_id` ASC) VISIBLE,
  INDEX `album_id` (`album_id` ASC) VISIBLE,
  CONSTRAINT `song_ibfk_1`
    FOREIGN KEY (`author_id`)
    REFERENCES `itunes`.`author` (`id`),
  CONSTRAINT `song_ibfk_2`
    FOREIGN KEY (`genre_id`)
    REFERENCES `itunes`.`genre` (`id`),
  CONSTRAINT `song_ibfk_3`
    FOREIGN KEY (`album_id`)
    REFERENCES `itunes`.`album` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`saved_song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itunes`.`saved_song` ;

CREATE TABLE IF NOT EXISTS `itunes`.`saved_song` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uid` INT NOT NULL,
  `sid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `uid` (`uid` ASC) VISIBLE,
  INDEX `sid` (`sid` ASC) VISIBLE,
  CONSTRAINT `saved_song_ibfk_1`
    FOREIGN KEY (`uid`)
    REFERENCES `itunes`.`user` (`uid`),
  CONSTRAINT `saved_song_ibfk_2`
    FOREIGN KEY (`sid`)
    REFERENCES `itunes`.`song` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
