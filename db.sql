-- MySQL Script generated by MySQL Workbench
-- Sat Apr 30 20:57:12 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema webfit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema webfit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webfit` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `webfit` ;

-- -----------------------------------------------------
-- Table `webfit`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webfit`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `password` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webfit`.`workouts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webfit`.`workouts` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `users_id` INT NOT NULL COMMENT '',
  `date` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_workouts_users_idx` (`users_id` ASC)  COMMENT '',
  CONSTRAINT `fk_workouts_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `webfit`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webfit`.`exercises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webfit`.`exercises` (
  `id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webfit`.`workouts_has_exercises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webfit`.`workouts_has_exercises` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `workouts_id` INT NOT NULL COMMENT '',
  `exercises_id` INT NOT NULL COMMENT '',
  `day` INT NULL COMMENT '',
  `num_sets` VARCHAR(45) NULL COMMENT '',
  `num_reps` VARCHAR(45) NULL COMMENT '',
  INDEX `fk_workouts_has_exercises_exercises1_idx` (`exercises_id` ASC)  COMMENT '',
  INDEX `fk_workouts_has_exercises_workouts1_idx` (`workouts_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_workouts_has_exercises_workouts1`
    FOREIGN KEY (`workouts_id`)
    REFERENCES `webfit`.`workouts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workouts_has_exercises_exercises1`
    FOREIGN KEY (`exercises_id`)
    REFERENCES `webfit`.`exercises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;