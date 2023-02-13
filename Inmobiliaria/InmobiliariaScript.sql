-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inmobiliaria` DEFAULT CHARACTER SET utf8 ;
USE `inmobiliaria` ;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`propietario` (
  `Cedula` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefono_propietario` (
  `cedula_Propietario` VARCHAR(15) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedula_Propietario`, `Telefono`),
  CONSTRAINT `Cedula_propietario`
    FOREIGN KEY (`cedula_Propietario`)
    REFERENCES `inmobiliaria`.`propietario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`asesor` (
  `cedula_asesor` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Salario` VARCHAR(10) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `Correo` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cedula_asesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmobiliaria` (
  `Nombre_Inmbiliaria` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(60) NOT NULL,
  `Pagina_web` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Nombre_Inmbiliaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`compra` (
  `idCompra` VARCHAR(15) NOT NULL,
  `Precio_venta` VARCHAR(15) NOT NULL,
  `cedula_Asesor` VARCHAR(15) NOT NULL,
  `nombre_Inmobiliaria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `cedula_Asesor_idx` (`cedula_Asesor` ASC) VISIBLE,
  INDEX `nombre_inmobiliaria_idx` (`nombre_Inmobiliaria` ASC) VISIBLE,
  CONSTRAINT `cedula_Asesor`
    FOREIGN KEY (`cedula_Asesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_inmobiliaria`
    FOREIGN KEY (`nombre_Inmobiliaria`)
    REFERENCES `inmobiliaria`.`inmobiliaria` (`Nombre_Inmbiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmueble` (
  `identInmueble` VARCHAR(20) NOT NULL,
  `Area` VARCHAR(20) NOT NULL,
  `Piso` VARCHAR(10) NOT NULL,
  `Estrato` VARCHAR(10) NOT NULL,
  `Departamento` VARCHAR(30) NOT NULL,
  `Ciudad` VARCHAR(30) NOT NULL,
  `Barrio` VARCHAR(60) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(50) NOT NULL,
  `Precio_Propietario` VARCHAR(20) NOT NULL,
  `Cedula_Propietario` VARCHAR(15) NOT NULL,
  `id_compra_` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`identInmueble`),
  INDEX `Cedula_idx` (`Cedula_Propietario` ASC) VISIBLE,
  INDEX `id_compra__idx` (`id_compra_` ASC) VISIBLE,
  CONSTRAINT `Cedula_propietario`
    FOREIGN KEY (`Cedula_Propietario`)
    REFERENCES `inmobiliaria`.`propietario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_compra_`
    FOREIGN KEY (`id_compra_`)
    REFERENCES `inmobiliaria`.`compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`fotos` (
  `id_Inmueble` VARCHAR(15) NOT NULL,
  `Fotos` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_Inmueble`, `Fotos`),
  CONSTRAINT `id_Inmueble`
    FOREIGN KEY (`id_Inmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`identInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`visitas` (
  `id_Visitas` VARCHAR(15) NOT NULL,
  `Dia` VARCHAR(5) NOT NULL,
  `Mes` VARCHAR(5) NOT NULL,
  `Año` VARCHAR(6) NOT NULL,
  `id_Inmueble` VARCHAR(20) NOT NULL,
  `cedula_Asesor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_Visitas`),
  INDEX `cedula_asesor_idx` (`cedula_Asesor` ASC) VISIBLE,
  INDEX `idInmueble_idx` (`id_Inmueble` ASC) VISIBLE,
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`id_Inmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`identInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_asesor`
    FOREIGN KEY (`cedula_Asesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente` (
  `Ced_cliente` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(60) NOT NULL,
  `Ingresos` VARCHAR(15) NOT NULL,
  `Direccion` VARCHAR(60) NOT NULL,
  `Habilitado` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Ced_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefono_cliente` (
  `cedula_cliente` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedula_cliente`, `telefono`),
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `inmobiliaria`.`cliente` (`Ced_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`visita_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`visita_cliente` (
  `id_visita` VARCHAR(15) NOT NULL,
  `ced_cliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_visita`, `ced_cliente`),
  INDEX `ced_cliente_idx` (`ced_cliente` ASC) VISIBLE,
  CONSTRAINT `ced_cliente`
    FOREIGN KEY (`ced_cliente`)
    REFERENCES `inmobiliaria`.`cliente` (`Ced_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_visita`
    FOREIGN KEY (`id_visita`)
    REFERENCES `inmobiliaria`.`visitas` (`id_Visitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`alquiler` (
  `id_alquiler` VARCHAR(15) NOT NULL,
  `Precio_alquiler` VARCHAR(10) NOT NULL,
  `Duracion` VARCHAR(25) NOT NULL,
  `Cedula_asesor` VARCHAR(15) NOT NULL,
  `nombre_Inmobiliaria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_alquiler`),
  INDEX `nombre_inmobilliaria_idx` (`nombre_Inmobiliaria` ASC) VISIBLE,
  INDEX `cedulaAsesor_idx` (`Cedula_asesor` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor`
    FOREIGN KEY (`Cedula_asesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_inmobilliaria`
    FOREIGN KEY (`nombre_Inmobiliaria`)
    REFERENCES `inmobiliaria`.`inmobiliaria` (`Nombre_Inmbiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`alquiler_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`alquiler_cliente` (
  `id_alquiler` VARCHAR(15) NOT NULL,
  `Cedula_cliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_alquiler`, `Cedula_cliente`),
  INDEX `cedulaCliente_idx` (`Cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `id_alquiler`
    FOREIGN KEY (`id_alquiler`)
    REFERENCES `inmobiliaria`.`alquiler` (`id_alquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaCliente`
    FOREIGN KEY (`Cedula_cliente`)
    REFERENCES `inmobiliaria`.`cliente` (`Ced_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`alquiler_lnmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`alquiler_lnmueble` (
  `id_alquiler` VARCHAR(15) NOT NULL,
  `id_inmueble` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_alquiler`, `id_inmueble`),
  INDEX `idAlquiler_idx` (`id_alquiler` ASC) VISIBLE,
  INDEX `idInmueble_idx` (`id_inmueble` ASC) VISIBLE,
  CONSTRAINT `idAlquiler`
    FOREIGN KEY (`id_alquiler`)
    REFERENCES `inmobiliaria`.`alquiler` (`id_alquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`id_inmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`identInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente_compra` (
  `ced_cliente` VARCHAR(15) NOT NULL,
  `id_compra` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ced_cliente`, `id_compra`),
  INDEX `id_compra_idx` (`id_compra` ASC) VISIBLE,
  CONSTRAINT `id_compra`
    FOREIGN KEY (`id_compra`)
    REFERENCES `inmobiliaria`.`compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`ced_cliente`)
    REFERENCES `inmobiliaria`.`cliente` (`Ced_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefono_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefono_inmobiliaria` (
  `Nombre_inmobiliaria` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Nombre_inmobiliaria`, `Telefono`),
  CONSTRAINT `nombre_inmobiliaria`
    FOREIGN KEY (`Nombre_inmobiliaria`)
    REFERENCES `inmobiliaria`.`inmobiliaria` (`Nombre_Inmbiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
