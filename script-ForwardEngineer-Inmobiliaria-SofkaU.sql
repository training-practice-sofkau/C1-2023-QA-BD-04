-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inmobiliariaSofkaU
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inmobiliariaSofkaU
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inmobiliariaSofkaU` DEFAULT CHARACTER SET utf8 ;
USE `inmobiliariaSofkaU` ;

-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Propietario` (
  `cedula` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Inmueble` (
  `id` VARCHAR(15) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `disponibilidad` TINYINT NOT NULL,
  `estado (N/O)` VARCHAR(5) NOT NULL,
  `precioAlquiler` INT NOT NULL,
  `precioVenta` INT NOT NULL,
  `area` VARCHAR(4) NOT NULL,
  `piso` VARCHAR(10) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `comuna/barrio` VARCHAR(45) NOT NULL,
  `codigoPostal` VARCHAR(5) NULL,
  `complemento` VARCHAR(15) NOT NULL,
  `estrato` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Asesor` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` INT NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`DatosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`DatosInmobiliaria` (
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `paginaWeb` VARCHAR(45) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`telefono_propietario` (
  `telefono` VARCHAR(15) NOT NULL,
  `Propietario_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`telefono`, `Propietario_cedula`),
  INDEX `fk_telefono_propietario_Propietario1_idx` (`Propietario_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_telefono_propietario_Propietario1`
    FOREIGN KEY (`Propietario_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`telefono_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`telefono_inmobiliaria` (
  `telefono` VARCHAR(15) NOT NULL,
  `DatosInmobiliaria_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefono`, `DatosInmobiliaria_nombre`),
  INDEX `fk_telefono_inmobiliaria_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre` ASC) VISIBLE,
  CONSTRAINT `fk_telefono_inmobiliaria_DatosInmobiliaria1`
    FOREIGN KEY (`DatosInmobiliaria_nombre`)
    REFERENCES `inmobiliariaSofkaU`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Compra` (
  `id` VARCHAR(15) NOT NULL,
  `fecha` VARCHAR(15) NOT NULL,
  `precioVenta` INT NOT NULL,
  `nombreNotaria` VARCHAR(45) NOT NULL,
  `Asesor_cedula` VARCHAR(15) NOT NULL,
  `DatosInmobiliaria_nombre` VARCHAR(45) NOT NULL,
  `Inmueble_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `Inmueble_id`),
  INDEX `fk_Compra_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  INDEX `fk_Compra_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre` ASC) VISIBLE,
  INDEX `fk_Compra_Inmueble1_idx` (`Inmueble_id` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_DatosInmobiliaria1`
    FOREIGN KEY (`DatosInmobiliaria_nombre`)
    REFERENCES `inmobiliariaSofkaU`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Inmueble1`
    FOREIGN KEY (`Inmueble_id`)
    REFERENCES `inmobiliariaSofkaU`.`Inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Alquiler` (
  `id` VARCHAR(15) NOT NULL,
  `fecha_inicial` VARCHAR(15) NOT NULL,
  `fecha_final` VARCHAR(15) NOT NULL,
  `Asesor_cedula` VARCHAR(15) NOT NULL,
  `DatosInmobiliaria_nombre` VARCHAR(45) NOT NULL,
  `Inmueble_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `Inmueble_id`),
  INDEX `fk_Alquiler_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  INDEX `fk_Alquiler_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre` ASC) VISIBLE,
  INDEX `fk_Alquiler_Inmueble1_idx` (`Inmueble_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alquiler_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_DatosInmobiliaria1`
    FOREIGN KEY (`DatosInmobiliaria_nombre`)
    REFERENCES `inmobiliariaSofkaU`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Inmueble1`
    FOREIGN KEY (`Inmueble_id`)
    REFERENCES `inmobiliariaSofkaU`.`Inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Visita` (
  `id` INT NOT NULL,
  `fecha` VARCHAR(15) NOT NULL,
  `Asesor_cedula` VARCHAR(15) NOT NULL,
  `Inmueble_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `Inmueble_id`),
  INDEX `fk_Visita_Asesor1_idx` (`Asesor_cedula` ASC) VISIBLE,
  INDEX `fk_Visita_Inmueble1_idx` (`Inmueble_id` ASC) VISIBLE,
  CONSTRAINT `fk_Visita_Asesor1`
    FOREIGN KEY (`Asesor_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visita_Inmueble1`
    FOREIGN KEY (`Inmueble_id`)
    REFERENCES `inmobiliariaSofkaU`.`Inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Cliente` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correElectronico` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ingresoMensual` VARCHAR(8) NULL,
  `habilitado` TINYINT NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`telefono_cliente` (
  `telefono` VARCHAR(15) NOT NULL,
  `Cliente_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`telefono`, `Cliente_cedula`),
  INDEX `fk_telefono_cliente_Cliente1_idx` (`Cliente_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_telefono_cliente_Cliente1`
    FOREIGN KEY (`Cliente_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Inmueble_Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Inmueble_Propietario` (
  `Inmueble_id` VARCHAR(15) NOT NULL,
  `Propietario_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Inmueble_id`, `Propietario_cedula`),
  INDEX `fk_Inmueble_has_Propietario_Propietario1_idx` (`Propietario_cedula` ASC) VISIBLE,
  INDEX `fk_Inmueble_has_Propietario_Inmueble_idx` (`Inmueble_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inmueble_has_Propietario_Inmueble`
    FOREIGN KEY (`Inmueble_id`)
    REFERENCES `inmobiliariaSofkaU`.`Inmueble` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_has_Propietario_Propietario1`
    FOREIGN KEY (`Propietario_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Compra_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Compra_Cliente` (
  `Compra_id` VARCHAR(15) NOT NULL,
  `Cliente_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Compra_id`, `Cliente_cedula`),
  INDEX `fk_Compra_has_Cliente_Cliente1_idx` (`Cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Compra_has_Cliente_Compra1_idx` (`Compra_id` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_has_Cliente_Compra1`
    FOREIGN KEY (`Compra_id`)
    REFERENCES `inmobiliariaSofkaU`.`Compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Alquiler_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Alquiler_Cliente` (
  `Alquiler_id` VARCHAR(15) NOT NULL,
  `Cliente_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Alquiler_id`, `Cliente_cedula`),
  INDEX `fk_Alquiler_has_Cliente_Cliente1_idx` (`Cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Alquiler_has_Cliente_Alquiler1_idx` (`Alquiler_id` ASC) VISIBLE,
  CONSTRAINT `fk_Alquiler_has_Cliente_Alquiler1`
    FOREIGN KEY (`Alquiler_id`)
    REFERENCES `inmobiliariaSofkaU`.`Alquiler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliariaSofkaU`.`Visita_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariaSofkaU`.`Visita_Cliente` (
  `Visita_id` INT NOT NULL,
  `Cliente_cedula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Visita_id`, `Cliente_cedula`),
  INDEX `fk_Visita_has_Cliente_Cliente1_idx` (`Cliente_cedula` ASC) VISIBLE,
  INDEX `fk_Visita_has_Cliente_Visita1_idx` (`Visita_id` ASC) VISIBLE,
  CONSTRAINT `fk_Visita_has_Cliente_Visita1`
    FOREIGN KEY (`Visita_id`)
    REFERENCES `inmobiliariaSofkaU`.`Visita` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visita_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_cedula`)
    REFERENCES `inmobiliariaSofkaU`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
