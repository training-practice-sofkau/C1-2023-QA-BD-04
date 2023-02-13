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
-- Table `mydb`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asesor` (
  `Cedula` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Salario` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `ID_compra` VARCHAR(45) NOT NULL,
  `Cedula_asesors` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_compra`, `Cedula_asesors`),
  INDEX `Cedula_asesors_idx` (`Cedula_asesors` ASC) VISIBLE,
  CONSTRAINT `Cedula_asesors`
    FOREIGN KEY (`Cedula_asesors`)
    REFERENCES `mydb`.`Asesor` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DatosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DatosInmobiliaria` (
  `Nombre` VARCHAR(30) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Pagina_web` VARCHAR(45) NOT NULL,
  `ID_comprain` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre`, `ID_comprain`),
  INDEX `ID_comprain_idx` (`ID_comprain` ASC) VISIBLE,
  CONSTRAINT `ID_comprain`
    FOREIGN KEY (`ID_comprain`)
    REFERENCES `mydb`.`Compra` (`ID_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietario` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Correo_electronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Info_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Info_visita` (
  `Numero_visita` VARCHAR(45) NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_visita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble` (
  `ID_inmueble` VARCHAR(45) NOT NULL,
  `Precio_propietario` VARCHAR(45) NOT NULL,
  `Precio_venta` VARCHAR(45) NOT NULL,
  `Precio_alquiler` VARCHAR(45) NOT NULL,
  `Estado_(N/O)` VARCHAR(45) NOT NULL,
  `Disponibilidad` VARCHAR(45) NOT NULL,
  `Atributo` VARCHAR(45) NOT NULL,
  `Piso` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Estrato` VARCHAR(45) NOT NULL,
  `Apartamento` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Comuna/barrio` VARCHAR(45) NOT NULL,
  `Codigo_postal` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  `Cedula_propietario` VARCHAR(45) NOT NULL,
  `Numerovisita_visita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_inmueble`, `Cedula_propietario`, `Numerovisita_visita`),
  INDEX `Cedula_propietario_idx` (`Cedula_propietario` ASC) VISIBLE,
  INDEX `Numerovisita_visita_idx` (`Numerovisita_visita` ASC) VISIBLE,
  CONSTRAINT `Cedula_propietario`
    FOREIGN KEY (`Cedula_propietario`)
    REFERENCES `mydb`.`Propietario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numerovisita_visita`
    FOREIGN KEY (`Numerovisita_visita`)
    REFERENCES `mydb`.`Info_visita` (`Numero_visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `ID_Alquiler` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Alquiler`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Correo_electronico` VARCHAR(45) NULL,
  `Ingresos` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Habilitado` VARCHAR(45) NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_datosinmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_datosinmobiliaria` (
  `Nombre_datosInmobiliaria` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre_datosInmobiliaria`),
  CONSTRAINT `Nombre_datosInmobiliaria`
    FOREIGN KEY (`Nombre_datosInmobiliaria`)
    REFERENCES `mydb`.`DatosInmobiliaria` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fotos_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fotos_inmueble` (
  `ID_inmueble_inmueble` VARCHAR(45) NOT NULL,
  `Fotosdelinmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_inmueble_inmueble`),
  CONSTRAINT `ID_inmueble_inmueble`
    FOREIGN KEY (`ID_inmueble_inmueble`)
    REFERENCES `mydb`.`Inmueble` (`ID_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_cliente` (
  `Cedula_cliente` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula_cliente`),
  CONSTRAINT `Cedula_cliente`
    FOREIGN KEY (`Cedula_cliente`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_asesor` (
  `Cedula_asesor` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula_asesor`),
  CONSTRAINT `Cedula_asesor00`
    FOREIGN KEY (`Cedula_asesor`)
    REFERENCES `mydb`.`Asesor` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_compra` (
  `Cedula_cliente_c` VARCHAR(45) NOT NULL,
  `ID_compra_compra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula_cliente_c`, `ID_compra_compra`),
  INDEX `ID_compra_compra_idx` (`ID_compra_compra` ASC) VISIBLE,
  CONSTRAINT `Cedula_cliente_c`
    FOREIGN KEY (`Cedula_cliente_c`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_compra_compra`
    FOREIGN KEY (`ID_compra_compra`)
    REFERENCES `mydb`.`Compra` (`ID_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_alquiler` (
  `Cedula_cliente` VARCHAR(45) NOT NULL,
  `ID_alquiler_alquiler` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula_cliente`, `ID_alquiler_alquiler`),
  INDEX `ID_alquiler_alquiler_idx` (`ID_alquiler_alquiler` ASC) VISIBLE,
  CONSTRAINT `Cedula_cliente0`
    FOREIGN KEY (`Cedula_cliente`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_alquiler_alquiler`
    FOREIGN KEY (`ID_alquiler_alquiler`)
    REFERENCES `mydb`.`Alquiler` (`ID_Alquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_infovisita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_infovisita` (
  `Cedula_cliente` VARCHAR(45) NOT NULL,
  `Numero_visita_visita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula_cliente`, `Numero_visita_visita`),
  INDEX `Numero_visita_visita_idx` (`Numero_visita_visita` ASC) VISIBLE,
  CONSTRAINT `Cedula_cliente1`
    FOREIGN KEY (`Cedula_cliente`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numero_visita_visita`
    FOREIGN KEY (`Numero_visita_visita`)
    REFERENCES `mydb`.`Info_visita` (`Numero_visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
