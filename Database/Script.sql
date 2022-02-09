-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `date_of_publish` DATE NOT NULL,
  `number` INT NOT NULL,
  `cost_of_borrow` FLOAT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `author_id`),
  INDEX `fk_Book_Author_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Author`
    FOREIGN KEY (`author_id`)
    REFERENCES `library`.`Author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Type` (
  `type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`type_id`, `book_id`),
  CONSTRAINT `fk_Type_Book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`User` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `balance` FLOAT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`Borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`Borrow` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `date_of_borrow` DATE NOT NULL,
  `date_of_predicted_return` DATE NOT NULL,
  `date_of_return` VARCHAR(45) NULL,
  `book_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`borrow_id`, `book_id`, `user_id`),
  INDEX `fk_Borrow_Book1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_Borrow_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Borrow_Book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Borrow_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `library`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
