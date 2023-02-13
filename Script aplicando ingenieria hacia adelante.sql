-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `cedula` VARCHAR(14) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ingresos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefonoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefonoCliente` (
  `telefono` VARCHAR(12) NOT NULL,
  `cedulaCliente` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cedulaCliente`),
  CONSTRAINT `cedulaCliente`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ascesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ascesor` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` DOUBLE NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`propietario` (
  `id` INT NOT NULL,
  `cedula` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmueble` (
  `id` INT NOT NULL,
  `idPropietario` INT NOT NULL,
  `precioPropietario` DOUBLE NOT NULL,
  `precioAlquiler` DOUBLE NOT NULL,
  `precioVenta` DOUBLE NOT NULL,
  `estado` VARCHAR(12) NULL,
  `estrato` VARCHAR(1) NULL,
  `area` DOUBLE NULL,
  `piso` DOUBLE NULL,
  PRIMARY KEY (`id`, `idPropietario`),
  INDEX `idPropietario_idx` (`idPropietario` ASC) VISIBLE,
  CONSTRAINT `idPropietario`
    FOREIGN KEY (`idPropietario`)
    REFERENCES `mydb`.`propietario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fotoInmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fotoInmueble` (
  `foto` VARCHAR(45) NOT NULL,
  `idInmueble` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `mydb`.`inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`direccionInmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`direccionInmueble` (
  `departamento` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `comuna` VARCHAR(45) NOT NULL,
  `barrio` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `idInmueble` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `mydb`.`inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefonoPropietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefonoPropietario` (
  `telefono` VARCHAR(12) NOT NULL,
  `idPropietario` INT NOT NULL,
  PRIMARY KEY (`idPropietario`),
  INDEX `idPropietario_idx` (`idPropietario` ASC) VISIBLE,
  CONSTRAINT `idPropietario`
    FOREIGN KEY (`idPropietario`)
    REFERENCES `mydb`.`propietario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmobiliaria` (
  `NIT` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `paginaWeb` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idInmueble` INT NOT NULL,
  `idInmobiliaria` INT NOT NULL,
  `idAscesor` INT NOT NULL,
  `idCliente` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`, `idInmueble`, `idInmobiliaria`, `idAscesor`, `idCliente`),
  INDEX `idInmueble_idx` (`idInmueble` ASC) VISIBLE,
  INDEX `idInmobiliaria_idx` (`idInmobiliaria` ASC) VISIBLE,
  INDEX `idAscesor_idx` (`idAscesor` ASC) VISIBLE,
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `mydb`.`inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idInmobiliaria`
    FOREIGN KEY (`idInmobiliaria`)
    REFERENCES `mydb`.`inmobiliaria` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAscesor`
    FOREIGN KEY (`idAscesor`)
    REFERENCES `mydb`.`ascesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alquiler` (
  `id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `idInmueble` INT NOT NULL,
  `idInmobiliaria` INT NOT NULL,
  `idAscesor` INT NOT NULL,
  `idCliente` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`, `idInmueble`, `idInmobiliaria`, `idAscesor`, `idCliente`),
  INDEX `idInmueble_idx` (`idInmueble` ASC) VISIBLE,
  INDEX `idAscesor_idx` (`idAscesor` ASC) VISIBLE,
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idInmobiliaria_idx` (`idInmobiliaria` ASC) VISIBLE,
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `mydb`.`inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idInmobiliaria`
    FOREIGN KEY (`idInmobiliaria`)
    REFERENCES `mydb`.`inmobiliaria` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAscesor`
    FOREIGN KEY (`idAscesor`)
    REFERENCES `mydb`.`ascesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`infovisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`infovisitas` (
  `id` INT NOT NULL,
  `fecha` DATE NULL,
  `IdAscesor` INT NOT NULL,
  `IdInmueble` INT NOT NULL,
  `idCliente` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`, `IdAscesor`, `IdInmueble`, `idCliente`),
  INDEX `idAscesor_idx` (`IdAscesor` ASC) VISIBLE,
  INDEX `IdInmueble_idx` (`IdInmueble` ASC) VISIBLE,
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `idAscesor`
    FOREIGN KEY (`IdAscesor`)
    REFERENCES `mydb`.`ascesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdInmueble`
    FOREIGN KEY (`IdInmueble`)
    REFERENCES `mydb`.`inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
