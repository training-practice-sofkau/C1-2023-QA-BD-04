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
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `correoElectrónico` VARCHAR(100) NOT NULL,
  `ingresos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(250) NOT NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_cliente` (
  `cedulaTelefono` VARCHAR(15) NOT NULL,
  `Telefono` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`cedulaTelefono`, `Telefono`),
  CONSTRAINT `cedulaTelefono`
    FOREIGN KEY (`cedulaTelefono`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asesor` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `salario` VARCHAR(8) NOT NULL,
  `telefono` VARCHAR(13) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `idcompra` VARCHAR(15) NOT NULL,
  `cedulaAsesor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idcompra`),
  INDEX `cedulaAsesor_idx` (`cedulaAsesor` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor`
    FOREIGN KEY (`cedulaAsesor`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_compra` (
  `cedulaCliente_compra` VARCHAR(15) NOT NULL,
  `idcompraCliente_compra` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedulaCliente_compra`, `idcompraCliente_compra`),
  INDEX `idcompraCliente_idx` (`idcompraCliente_compra` ASC) VISIBLE,
  CONSTRAINT `cedulaCliente_compra`
    FOREIGN KEY (`cedulaCliente_compra`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcompraCliente`
    FOREIGN KEY (`idcompraCliente_compra`)
    REFERENCES `mydb`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alquiler` (
  `idalquiler` VARCHAR(15) NOT NULL,
  `cedulaAsesor_alquiler` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idalquiler`),
  INDEX `cedulaAsesor_alquiler_idx` (`cedulaAsesor_alquiler` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor_alquiler`
    FOREIGN KEY (`cedulaAsesor_alquiler`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_alquiler` (
  `cedulaCliente_alquiler` VARCHAR(15) NOT NULL,
  `idAlquilerCliente_alquiler` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedulaCliente_alquiler`, `idAlquilerCliente_alquiler`),
  INDEX `idAlquilerCliente_alquiler_idx` (`idAlquilerCliente_alquiler` ASC) VISIBLE,
  CONSTRAINT `cedulaCliente_alquiler`
    FOREIGN KEY (`cedulaCliente_alquiler`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAlquilerCliente_alquiler`
    FOREIGN KEY (`idAlquilerCliente_alquiler`)
    REFERENCES `mydb`.`alquiler` (`idalquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`infoVisita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`infoVisita` (
  `idVisita` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idVisita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_visita` (
  `cedulaCliente_visita` VARCHAR(15) NOT NULL,
  `idVisitaCliente_visita` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`cedulaCliente_visita`, `idVisitaCliente_visita`),
  INDEX `idVisitaCliente_visita_idx` (`idVisitaCliente_visita` ASC) VISIBLE,
  CONSTRAINT `cedulaCliente_visita`
    FOREIGN KEY (`cedulaCliente_visita`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVisitaCliente_visita`
    FOREIGN KEY (`idVisitaCliente_visita`)
    REFERENCES `mydb`.`infoVisita` (`idVisita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asesor-visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asesor-visita` (
  `cedulaAsesor_visita` VARCHAR(15) NOT NULL,
  `idVisitaAsesor_visita` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`cedulaAsesor_visita`, `idVisitaAsesor_visita`),
  INDEX `idVisitaAsesor_visita_idx` (`idVisitaAsesor_visita` ASC) VISIBLE,
  CONSTRAINT `cedulaAsesor_visita`
    FOREIGN KEY (`cedulaAsesor_visita`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVisitaAsesor_visita`
    FOREIGN KEY (`idVisitaAsesor_visita`)
    REFERENCES `mydb`.`infoVisita` (`idVisita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmueble` (
  `idInmueble` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(4) NOT NULL,
  `piso` VARCHAR(2) NOT NULL,
  `departamento` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(100) NOT NULL,
  `comuna/barrio` VARCHAR(80) NOT NULL,
  `codigoPostal` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(150) NOT NULL,
  `estrato` VARCHAR(1) NOT NULL,
  `precioPropietario` VARCHAR(10) NOT NULL,
  `precioVenta` VARCHAR(10) NOT NULL,
  `precioAlquiler` VARCHAR(8) NOT NULL,
  `estado (N/O)` VARCHAR(10) NOT NULL,
  `disponibilidad` VARCHAR(14) NOT NULL,
  `idCompra_Inmueble` VARCHAR(15) NULL,
  `idAlquiler_inmueble` VARCHAR(15) NULL,
  PRIMARY KEY (`idInmueble`),
  INDEX `idCompra_inmueble_idx` (`idCompra_Inmueble` ASC) VISIBLE,
  INDEX `idAlquiler_inmueble_idx` (`idAlquiler_inmueble` ASC) VISIBLE,
  CONSTRAINT `idCompra_inmueble`
    FOREIGN KEY (`idCompra_Inmueble`)
    REFERENCES `mydb`.`compra` (`idcompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAlquiler_inmueble`
    FOREIGN KEY (`idAlquiler_inmueble`)
    REFERENCES `mydb`.`alquiler` (`idalquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_inmueble` (
  `idinmueble_telefono` INT NOT NULL,
  `telefono` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idinmueble_telefono`, `telefono`),
  CONSTRAINT `idinmueble_telefono`
    FOREIGN KEY (`idinmueble_telefono`)
    REFERENCES `mydb`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmueble_infoVisita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmueble_infoVisita` (
  `idVisitaInmueble_infoVisita` VARCHAR(9) NOT NULL,
  `idInmuebleInmueble_infoVisitacol` INT NOT NULL,
  PRIMARY KEY (`idVisitaInmueble_infoVisita`, `idInmuebleInmueble_infoVisitacol`),
  INDEX `idInmuebleInmueble_visita_idx` (`idInmuebleInmueble_infoVisitacol` ASC) VISIBLE,
  CONSTRAINT `idVisitaInmueble_visita`
    FOREIGN KEY (`idVisitaInmueble_infoVisita`)
    REFERENCES `mydb`.`infoVisita` (`idVisita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idInmuebleInmueble_visita`
    FOREIGN KEY (`idInmuebleInmueble_infoVisitacol`)
    REFERENCES `mydb`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`propietario` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `correoElectronico` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_propietario` (
  `cedulaPropietario` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`cedulaPropietario`, `telefono`),
  CONSTRAINT `cedulaPropietario`
    FOREIGN KEY (`cedulaPropietario`)
    REFERENCES `mydb`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`propietario_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`propietario_inmueble` (
  `idInmueble_propietario` INT NOT NULL,
  `cedulaPropietario_inmueble` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idInmueble_propietario`, `cedulaPropietario_inmueble`),
  INDEX `cedulaPropietario_inmueble_idx` (`cedulaPropietario_inmueble` ASC) VISIBLE,
  CONSTRAINT `idInmueble_propietario`
    FOREIGN KEY (`idInmueble_propietario`)
    REFERENCES `mydb`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaPropietario_inmueble`
    FOREIGN KEY (`cedulaPropietario_inmueble`)
    REFERENCES `mydb`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
