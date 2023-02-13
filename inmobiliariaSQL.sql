-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inmobiliaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inmobiliaria` DEFAULT CHARACTER SET utf8 ;
USE `Inmobiliaria` ;

-- -----------------------------------------------------
-- Table `Inmobiliaria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`cliente` (
  `cedula` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(100) NULL,
  `ingresos` DECIMAL(15,2) NULL,
  `habilitado` VARCHAR(10) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Asesor` (
  `cedula` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `salario` DECIMAL(10,2) NULL,
  `correo` VARCHAR(100) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`DatosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`DatosInmobiliaria` (
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `correo` VARCHAR(80) NULL,
  `pagina_web` VARCHAR(150) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`alquiler` (
  `idalquiler` INT NOT NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  `costo_alquiler` DECIMAL(10,2) NULL,
  `estado` ENUM('vigente', 'finalizado', 'renovado') NULL,
  `coemntarios` VARCHAR(255) NULL,
  `Asesor_cedula` VARCHAR(12) NOT NULL,
  `DatosInmobiliaria_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idalquiler`),
  INDEX `fk_alquiler_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  INDEX `fk_alquiler_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre` ASC) VISIBLE,
  CONSTRAINT `fk_alquiler_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `Inmobiliaria`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alquiler_DatosInmobiliaria1`
    FOREIGN KEY (`DatosInmobiliaria_nombre`)
    REFERENCES `Inmobiliaria`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`info_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`info_visita` (
  `idinfo_visita` INT NOT NULL,
  `fecha_visita` DATETIME NOT NULL,
  `fecha_fin` DATETIME NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  `Asesor_cedula` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idinfo_visita`),
  INDEX `fk_info_visita_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_info_visita_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `Inmobiliaria`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`compra` (
  `idcompra` INT NOT NULL,
  `precio_compra` DECIMAL(15,2) NULL,
  `Asesor_cedula` VARCHAR(12) NOT NULL,
  `DatosInmobiliaria_nombre` VARCHAR(100) NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`idcompra`),
  INDEX `fk_compra_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  INDEX `fk_compra_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre` ASC) VISIBLE,
  CONSTRAINT `fk_compra_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `Inmobiliaria`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_DatosInmobiliaria1`
    FOREIGN KEY (`DatosInmobiliaria_nombre`)
    REFERENCES `Inmobiliaria`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`propietario` (
  `cedula` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(100) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Inmueble` (
  `idinmueble` VARCHAR(15) NOT NULL,
  `disponibilidad` ENUM('SI', 'NO') NULL,
  `precioPropietario` DECIMAL(15,2) NULL,
  `direccion` VARCHAR(100) NULL,
  `descripcion` VARCHAR(255) NULL,
  `piso` VARCHAR(4) NULL,
  `area` DECIMAL(10,2) NULL,
  `precio_alquiler` DECIMAL(15,2) NULL,
  `estado` ENUM('nuevo', 'segunda', 'remodelado') NULL,
  `departamento` VARCHAR(45) NULL,
  `cuidad` VARCHAR(45) NULL,
  `comuna/barrio` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(20) NULL,
  `complemento` VARCHAR(45) NULL,
  `precio_venta` DECIMAL(15,2) NULL,
  `alquiler_idalquiler` INT NOT NULL,
  `info_visita_idinfo_visita` INT NOT NULL,
  `compra_idcompra` INT NOT NULL,
  `propietario_cedula` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idinmueble`),
  INDEX `fk_Inmueble_alquiler1_idx` (`alquiler_idalquiler` ASC) VISIBLE,
  INDEX `fk_Inmueble_info_visita1_idx` (`info_visita_idinfo_visita` ASC) VISIBLE,
  INDEX `fk_Inmueble_compra1_idx` (`compra_idcompra` ASC) VISIBLE,
  INDEX `fk_Inmueble_propietario1_idx` (`propietario_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Inmueble_alquiler1`
    FOREIGN KEY (`alquiler_idalquiler`)
    REFERENCES `Inmobiliaria`.`alquiler` (`idalquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_info_visita1`
    FOREIGN KEY (`info_visita_idinfo_visita`)
    REFERENCES `Inmobiliaria`.`info_visita` (`idinfo_visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_compra1`
    FOREIGN KEY (`compra_idcompra`)
    REFERENCES `Inmobiliaria`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_propietario1`
    FOREIGN KEY (`propietario_cedula`)
    REFERENCES `Inmobiliaria`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`TelefonoAsesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`TelefonoAsesor` (
  `cedula_asesor` VARCHAR(12) NOT NULL,
  `numero` VARCHAR(12) NOT NULL,
  INDEX `fk_TelefonoAsesor_Asesor1_idx` (`cedula_asesor` ASC) VISIBLE,
  PRIMARY KEY (`cedula_asesor`, `numero`),
  CONSTRAINT `fk_cedula_asesor`
    FOREIGN KEY (`cedula_asesor`)
    REFERENCES `Inmobiliaria`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`TelefonoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`TelefonoCliente` (
  `cliente_cedula` VARCHAR(12) NOT NULL,
  `numero` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`cliente_cedula`, `numero`),
  INDEX `fk_Telefono_cliente1_idx` (`cliente_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Telefono_cliente1`
    FOREIGN KEY (`cliente_cedula`)
    REFERENCES `Inmobiliaria`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Foto` (
  `foto` VARCHAR(100) NOT NULL,
  `inmueble_idinmueble` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`foto`),
  INDEX `fk_Foto_inmueble1_idx` (`inmueble_idinmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Foto_inmueble1`
    FOREIGN KEY (`inmueble_idinmueble`)
    REFERENCES `Inmobiliaria`.`Inmueble` (`idinmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Telefono` (
  `propietario_cedula` VARCHAR(12) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  INDEX `fk_Telefono_propietario1_idx` (`propietario_cedula` ASC) VISIBLE,
  PRIMARY KEY (`propietario_cedula`, `numero`),
  CONSTRAINT `fk_Telefono_propietario1`
    FOREIGN KEY (`propietario_cedula`)
    REFERENCES `Inmobiliaria`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Telefono` (
  `propietario_cedula` VARCHAR(12) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  INDEX `fk_Telefono_propietario1_idx` (`propietario_cedula` ASC) VISIBLE,
  PRIMARY KEY (`propietario_cedula`, `numero`),
  CONSTRAINT `fk_Telefono_propietario1`
    FOREIGN KEY (`propietario_cedula`)
    REFERENCES `Inmobiliaria`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Cliente_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Cliente_compra` (
  `cliente_cedula` VARCHAR(12) NOT NULL,
  `compra_idcompra` INT NOT NULL,
  INDEX `fk_Cliente_compra_cliente1_idx` (`cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Cliente_compra_compra1_idx` (`compra_idcompra` ASC) VISIBLE,
  PRIMARY KEY (`cliente_cedula`, `compra_idcompra`),
  CONSTRAINT `fk_Cliente_compra_cliente1`
    FOREIGN KEY (`cliente_cedula`)
    REFERENCES `Inmobiliaria`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_compra_compra1`
    FOREIGN KEY (`compra_idcompra`)
    REFERENCES `Inmobiliaria`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Cliente_alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Cliente_alquiler` (
  `cliente_cedula` VARCHAR(12) NOT NULL,
  `alquiler_idalquiler` INT NOT NULL,
  PRIMARY KEY (`cliente_cedula`, `alquiler_idalquiler`),
  INDEX `fk_Cliente_alquiler_cliente1_idx` (`cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Cliente_alquiler_alquiler1_idx` (`alquiler_idalquiler` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_alquiler_cliente1`
    FOREIGN KEY (`cliente_cedula`)
    REFERENCES `Inmobiliaria`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_alquiler_alquiler1`
    FOREIGN KEY (`alquiler_idalquiler`)
    REFERENCES `Inmobiliaria`.`alquiler` (`idalquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inmobiliaria`.`Cliente_info_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inmobiliaria`.`Cliente_info_visita` (
  `cliente_cedula` VARCHAR(12) NOT NULL,
  `info_visita_idinfo_visita` INT NOT NULL,
  INDEX `fk_Cliente_info_visita_cliente1_idx` (`cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Cliente_info_visita_info_visita1_idx` (`info_visita_idinfo_visita` ASC) VISIBLE,
  PRIMARY KEY (`cliente_cedula`, `info_visita_idinfo_visita`),
  CONSTRAINT `fk_Cliente_info_visita_cliente1`
    FOREIGN KEY (`cliente_cedula`)
    REFERENCES `Inmobiliaria`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_info_visita_info_visita1`
    FOREIGN KEY (`info_visita_idinfo_visita`)
    REFERENCES `Inmobiliaria`.`info_visita` (`idinfo_visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
