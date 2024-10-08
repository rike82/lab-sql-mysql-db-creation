-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_center
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_center
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_center` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_center` ;

-- -----------------------------------------------------
-- Table `car_center`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_center`.`stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `postal_code` INT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_center`.`cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  `stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `vin_UNIQUE` (`vin` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cars_stores1_idx` (`stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_cars_stores1`
    FOREIGN KEY (`stores_id`)
    REFERENCES `car_center`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_center`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cust_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_center`.`salesperson` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `salespersoncol` VARCHAR(45) NULL,
  `stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE,
  INDEX `fk_salesperson_stores_idx` (`stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_salesperson_stores`
    FOREIGN KEY (`stores_id`)
    REFERENCES `car_center`.`stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_center`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_center`.`invoices` (
  `number` INT NULL,
  `date` DATE NULL,
  `invoicescol` VARCHAR(45) NULL,
  `salesperson_id` INT NOT NULL,
  `customers_id` INT NOT NULL,
  `cars_id` INT NOT NULL,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_id` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `car_center`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `car_center`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_id`)
    REFERENCES `car_center`.`cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
