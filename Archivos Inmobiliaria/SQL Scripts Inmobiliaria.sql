-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema InmobiliariaBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema InmobiliariaBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `InmobiliariaBD` DEFAULT CHARACTER SET utf8 ;
USE `InmobiliariaBD` ;

-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Propietario` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Asesor` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Compra` (
  `idCompra` VARCHAR(20) NOT NULL,
  `cedulaAsesor_compra` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `cedulaAsesor_compra_idx` (`cedulaAsesor_compra` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor_compra`
    FOREIGN KEY (`cedulaAsesor_compra`)
    REFERENCES `InmobiliariaBD`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Alquiler` (
  `idAlquiler` VARCHAR(20) NOT NULL,
  `cedulaAsesor_alquiler` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `cedulaAsesor_alquiler_idx` (`cedulaAsesor_alquiler` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor_alquiler`
    FOREIGN KEY (`cedulaAsesor_alquiler`)
    REFERENCES `InmobiliariaBD`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`InfoVisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`InfoVisitas` (
  `numeroVisita` INT NOT NULL,
  `cedulaAsesor_visita` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`numeroVisita`),
  INDEX `cedulaAsesor_visita_idx` (`cedulaAsesor_visita` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor_visita`
    FOREIGN KEY (`cedulaAsesor_visita`)
    REFERENCES `InmobiliariaBD`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Inmueble` (
  `idInmueble` VARCHAR(45) NOT NULL,
  `precioPropietario` FLOAT NOT NULL,
  `precioVenta` FLOAT NOT NULL,
  `precioAlquiler` FLOAT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `disponibilidad` VARCHAR(20) NOT NULL,
  `piso` INT NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `estrato` VARCHAR(45) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `comunaBarrio` VARCHAR(45) NOT NULL,
  `codigoPostal` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `cedulaPropietario` VARCHAR(15) NOT NULL,
  `idCompra_inmueble` VARCHAR(20) NOT NULL,
  `idAlquiler_inmueble` VARCHAR(20) NOT NULL,
  `numeroVisita_inmueble` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
  INDEX `cedulaPropietario_idx` (`cedulaPropietario` ASC) VISIBLE,
  INDEX `idCompra_inmueble_idx` (`idCompra_inmueble` ASC) VISIBLE,
  INDEX `idAlquiler_inmueble_idx` (`idAlquiler_inmueble` ASC) VISIBLE,
  INDEX `numeroVisita_inmueble_idx` (`numeroVisita_inmueble` ASC) VISIBLE,
  CONSTRAINT `cedulaPropietario`
    FOREIGN KEY (`cedulaPropietario`)
    REFERENCES `InmobiliariaBD`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCompra_inmueble`
    FOREIGN KEY (`idCompra_inmueble`)
    REFERENCES `InmobiliariaBD`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAlquiler_inmueble`
    FOREIGN KEY (`idAlquiler_inmueble`)
    REFERENCES `InmobiliariaBD`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numeroVisita_inmueble`
    FOREIGN KEY (`numeroVisita_inmueble`)
    REFERENCES `InmobiliariaBD`.`InfoVisitas` (`numeroVisita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`DatosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`DatosInmobiliaria` (
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `correo` VARCHAR(80) NOT NULL,
  `paginaWeb` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Cliente` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  `ingresos` FLOAT NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Fotos` (
  `idInmueble_fotos` VARCHAR(45) NOT NULL,
  `fotos` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idInmueble_fotos`),
  CONSTRAINT `idInmuebleFotos`
    FOREIGN KEY (`idInmueble_fotos`)
    REFERENCES `InmobiliariaBD`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Telefono_propietario` (
  `cedulaPropietario_Telefono` VARCHAR(15) NOT NULL,
  `Telefono_propietario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedulaPropietario_Telefono`),
  CONSTRAINT `cedulaPropietario_telefono`
    FOREIGN KEY (`cedulaPropietario_Telefono`)
    REFERENCES `InmobiliariaBD`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Compra_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Compra_Cliente` (
  `idCompra_cliente` VARCHAR(20) NOT NULL,
  `cedulaCliente_compra` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCompra_cliente`, `cedulaCliente_compra`),
  INDEX `cedulaCliente_compra_idx` (`cedulaCliente_compra` ASC) VISIBLE,
  CONSTRAINT `idCompra_cliente`
    FOREIGN KEY (`idCompra_cliente`)
    REFERENCES `InmobiliariaBD`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente_compra`
    FOREIGN KEY (`cedulaCliente_compra`)
    REFERENCES `InmobiliariaBD`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Alquiler_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Alquiler_Cliente` (
  `idAlquiler_cliente` VARCHAR(20) NOT NULL,
  `cedulaCliente_alquiler` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAlquiler_cliente`, `cedulaCliente_alquiler`),
  INDEX `cedulaCliente_alquiler_idx` (`cedulaCliente_alquiler` ASC) VISIBLE,
  CONSTRAINT `idAlquiler_cliente`
    FOREIGN KEY (`idAlquiler_cliente`)
    REFERENCES `InmobiliariaBD`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente_alquiler`
    FOREIGN KEY (`cedulaCliente_alquiler`)
    REFERENCES `InmobiliariaBD`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`InfoVisitas_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`InfoVisitas_Cliente` (
  `numeroVisita_cliente` INT NOT NULL,
  `cedulaCliente_visita` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`numeroVisita_cliente`, `cedulaCliente_visita`),
  INDEX `cedulaCliente_visita_idx` (`cedulaCliente_visita` ASC) VISIBLE,
  CONSTRAINT `numeroVisita_cliente`
    FOREIGN KEY (`numeroVisita_cliente`)
    REFERENCES `InmobiliariaBD`.`InfoVisitas` (`numeroVisita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente_visita`
    FOREIGN KEY (`cedulaCliente_visita`)
    REFERENCES `InmobiliariaBD`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Telefono_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Telefono_Cliente` (
  `cedulaCliente_telefono` VARCHAR(15) NOT NULL,
  `Telefono_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedulaCliente_telefono`),
  CONSTRAINT `cedulaClienteTelefono`
    FOREIGN KEY (`cedulaCliente_telefono`)
    REFERENCES `InmobiliariaBD`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Compra_DInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Compra_DInmobiliaria` (
  `nombreInmobiliaria_compra` VARCHAR(45) NOT NULL,
  `idCompra_inmobiliaria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria_compra`, `idCompra_inmobiliaria`),
  INDEX `idCompra_inmobiliaria_idx` (`idCompra_inmobiliaria` ASC) VISIBLE,
  CONSTRAINT `nombreInmobiliaria_compra`
    FOREIGN KEY (`nombreInmobiliaria_compra`)
    REFERENCES `InmobiliariaBD`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCompra_inmobiliaria`
    FOREIGN KEY (`idCompra_inmobiliaria`)
    REFERENCES `InmobiliariaBD`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`Alquiler_DInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`Alquiler_DInmobiliaria` (
  `nombreInmobiliaria_alquiler` VARCHAR(45) NOT NULL,
  `idAlquiler_inmobiliaria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria_alquiler`, `idAlquiler_inmobiliaria`),
  INDEX `idAlquiler_inmobiliaria_idx` (`idAlquiler_inmobiliaria` ASC) VISIBLE,
  CONSTRAINT `nombreInmobiliaria_alquiler`
    FOREIGN KEY (`nombreInmobiliaria_alquiler`)
    REFERENCES `InmobiliariaBD`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAlquiler_inmobiliaria`
    FOREIGN KEY (`idAlquiler_inmobiliaria`)
    REFERENCES `InmobiliariaBD`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InmobiliariaBD`.`TelefonoInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InmobiliariaBD`.`TelefonoInmobiliaria` (
  `nombreDInmobiliaria` VARCHAR(45) NOT NULL,
  `telefono_inmobiliaria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombreDInmobiliaria`),
  CONSTRAINT `nombreDInmobiliaria`
    FOREIGN KEY (`nombreDInmobiliaria`)
    REFERENCES `InmobiliariaBD`.`DatosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
