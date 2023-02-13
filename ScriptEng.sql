-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inmobiliaria` DEFAULT CHARACTER SET utf8mb3 ;
USE `inmobiliaria` ;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`asesor` (
  `cedulaAsesor` VARCHAR(50) NOT NULL,
  `nombreAsesor` VARCHAR(45) NULL DEFAULT NULL,
  `salarioAsesor` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoAsesor` VARCHAR(45) NULL DEFAULT NULL,
  `correoAsesor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cedulaAsesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente` (
  `cedulaCliente` VARCHAR(45) NOT NULL,
  `nombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  `ingresosCliente` VARCHAR(45) NULL DEFAULT NULL,
  `habilitado` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `correo_electronicoCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cedulaCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`datosinmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`datosinmobiliaria` (
  `nombreInmobiliaria` VARCHAR(50) NOT NULL,
  `direccionInmobiliaria` VARCHAR(45) NULL DEFAULT NULL,
  `correoInmobiliaria` VARCHAR(45) NULL DEFAULT NULL,
  `pagina_webInmobiliaria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`nombreInmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`propietario` (
  `cedula` VARCHAR(50) NOT NULL,
  `nombrePropietario` VARCHAR(45) NULL DEFAULT NULL,
  `correoPropietario` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`compra` (
  `idCompra` VARCHAR(50) NOT NULL,
  `valor` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaAsesor` VARCHAR(45) NULL DEFAULT NULL,
  `nombreInmobiliaria` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `fkCompraAsesor1Idx` (`cedulaAsesor` ASC) VISIBLE,
  INDEX `fkCompraDatosInmobiliaria1Idx` (`nombreInmobiliaria` ASC) VISIBLE,
  CONSTRAINT `fkCompraAsesor1`
    FOREIGN KEY (`cedulaAsesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedulaAsesor`),
  CONSTRAINT `fkCompraDatosInmobiliaria1`
    FOREIGN KEY (`nombreInmobiliaria`)
    REFERENCES `inmobiliaria`.`datosinmobiliaria` (`nombreInmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmueble` (
  `idInmueble` VARCHAR(50) NOT NULL,
  `pisoInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `areaInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `estratoInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `departamentoDireccion` VARCHAR(45) NULL DEFAULT NULL,
  `ciudadDireccion` VARCHAR(45) NULL DEFAULT NULL,
  `barrioDireccion` VARCHAR(45) NULL DEFAULT NULL,
  `codigoPostalDireccion` VARCHAR(45) NULL DEFAULT NULL,
  `complementoDireccion` VARCHAR(45) NULL DEFAULT NULL,
  `precioVentaInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `precioAlquilerInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `estadoInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `disponibilidadInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `precioPropietarioInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaPropietario` VARCHAR(45) NULL DEFAULT NULL,
  `compra_idCompra` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idInmueble`),
  INDEX `fkInmueblePropietario1Idx` (`cedulaPropietario` ASC) VISIBLE,
  INDEX `fk_inmueble_compra1_idx` (`compra_idCompra` ASC) VISIBLE,
  CONSTRAINT `fkInmueblePropietario1`
    FOREIGN KEY (`cedulaPropietario`)
    REFERENCES `inmobiliaria`.`propietario` (`cedula`),
  CONSTRAINT `fk_inmueble_compra1`
    FOREIGN KEY (`compra_idCompra`)
    REFERENCES `inmobiliaria`.`compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`alquiler` (
  `idAlquieler` VARCHAR(50) NOT NULL,
  `valor` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaCliente` VARCHAR(45) NULL DEFAULT NULL,
  `idInmueble` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaAsesor` VARCHAR(45) NULL DEFAULT NULL,
  `nombreInmobiliaria` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idAlquieler`),
  INDEX `fkAlquilerAsesor1Idx` (`cedulaAsesor` ASC) VISIBLE,
  INDEX `fkAlquilerCliente1Idx` (`cedulaCliente` ASC) VISIBLE,
  INDEX `fkAlquilerDatosInmobiliaria1Idx` (`nombreInmobiliaria` ASC) VISIBLE,
  INDEX `fkAlquilerInmueble1Idx` (`idInmueble` ASC) VISIBLE,
  CONSTRAINT `fkAlquilerAsesor1`
    FOREIGN KEY (`cedulaAsesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedulaAsesor`),
  CONSTRAINT `fkAlquilerCliente1`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `inmobiliaria`.`cliente` (`cedulaCliente`),
  CONSTRAINT `fkAlquilerDatosInmobiliaria1`
    FOREIGN KEY (`nombreInmobiliaria`)
    REFERENCES `inmobiliaria`.`datosinmobiliaria` (`nombreInmobiliaria`),
  CONSTRAINT `fkAlquilerInmueble1`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`idInmueble`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`fotoinmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`fotoinmueble` (
  `idInmueble` VARCHAR(50) NOT NULL,
  `fotoInmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInmueble`, `fotoInmueble`),
  CONSTRAINT `fk_fotoInmuebleInmueble1`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`idInmueble`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`infovisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`infovisitas` (
  `idInfoVisitas` VARCHAR(50) NOT NULL,
  `fechaVisita` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaCliente` VARCHAR(45) NULL DEFAULT NULL,
  `motivoVisita` VARCHAR(45) NULL DEFAULT NULL,
  `cedulaAsesor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idInfoVisitas`),
  INDEX `fkInfoVisitasAsesor1Idx` (`cedulaAsesor` ASC) VISIBLE,
  INDEX `fkInfoVisitasCliente1Idx` (`cedulaCliente` ASC) VISIBLE,
  CONSTRAINT `fkInfoVisitasAsesor1`
    FOREIGN KEY (`cedulaAsesor`)
    REFERENCES `inmobiliaria`.`asesor` (`cedulaAsesor`),
  CONSTRAINT `fkInfoVisitasCliente1`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `inmobiliaria`.`cliente` (`cedulaCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefonocliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefonocliente` (
  `telefonoCliente` VARCHAR(50) NOT NULL,
  `cedulaCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefonoCliente`, `cedulaCliente`),
  INDEX `fkTelefonoClienteCliente1Idx` (`cedulaCliente` ASC) VISIBLE,
  CONSTRAINT `fkTelefonoClienteCliente1`
    FOREIGN KEY (`cedulaCliente`)
    REFERENCES `inmobiliaria`.`cliente` (`cedulaCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefonoinmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefonoinmobiliaria` (
  `nombreInmobiliaria` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria`, `telefono`),
  CONSTRAINT `fkTelefonoInmobiliariaDatosInmobiliaria`
    FOREIGN KEY (`nombreInmobiliaria`)
    REFERENCES `inmobiliaria`.`datosinmobiliaria` (`nombreInmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefonopropietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefonopropietario` (
  `idPropietario` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPropietario`, `telefono`),
  CONSTRAINT `fkTelefonoPropietarioPropietario1`
    FOREIGN KEY (`idPropietario`)
    REFERENCES `inmobiliaria`.`propietario` (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmueble_has_infovisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmueble_has_infovisitas` (
  `inmueble_idInmueble` VARCHAR(50) NOT NULL,
  `infovisitas_idInfoVisitas` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`inmueble_idInmueble`, `infovisitas_idInfoVisitas`),
  INDEX `fk_inmueble_has_infovisitas_infovisitas1_idx` (`infovisitas_idInfoVisitas` ASC) VISIBLE,
  INDEX `fk_inmueble_has_infovisitas_inmueble1_idx` (`inmueble_idInmueble` ASC) VISIBLE,
  CONSTRAINT `fk_inmueble_has_infovisitas_inmueble1`
    FOREIGN KEY (`inmueble_idInmueble`)
    REFERENCES `inmobiliaria`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_has_infovisitas_infovisitas1`
    FOREIGN KEY (`infovisitas_idInfoVisitas`)
    REFERENCES `inmobiliaria`.`infovisitas` (`idInfoVisitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente_has_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente_has_compra` (
  `cliente_cedulaCliente` VARCHAR(45) NOT NULL,
  `compra_idCompra` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cliente_cedulaCliente`, `compra_idCompra`),
  INDEX `fk_cliente_has_compra_compra1_idx` (`compra_idCompra` ASC) VISIBLE,
  INDEX `fk_cliente_has_compra_cliente1_idx` (`cliente_cedulaCliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_compra_cliente1`
    FOREIGN KEY (`cliente_cedulaCliente`)
    REFERENCES `inmobiliaria`.`cliente` (`cedulaCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_compra_compra1`
    FOREIGN KEY (`compra_idCompra`)
    REFERENCES `inmobiliaria`.`compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
