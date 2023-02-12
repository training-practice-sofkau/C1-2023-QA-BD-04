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
-- Table `mydb`.`DatosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DatosInmobiliaria` (
  `NombreInmobiliaria` VARCHAR(25) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(60) NOT NULL,
  `PaginaWeb` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`NombreInmobiliaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asesor` (
  `CedulaAsesor` VARCHAR(15) NOT NULL,
  `NombreAsesor` VARCHAR(60) NOT NULL,
  `SalarioAsesor` INT NOT NULL,
  `TelefonoAsesor` VARCHAR(15) NOT NULL,
  `CorreoAsesor` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CedulaAsesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble` (
  `idInmueble` INT NOT NULL,
  `PrecioPropietario` INT NOT NULL,
  `PrecioVenta` INT NOT NULL,
  `PrecioAlquiler` INT NOT NULL,
  `Estado` VARCHAR(15) NOT NULL,
  `Disponibilidad` VARCHAR(45) NOT NULL,
  `Piso` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Barrio/Comuna` VARCHAR(45) NOT NULL,
  `CodigoPostal` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  `Estrato` INT NOT NULL,
  PRIMARY KEY (`idInmueble`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietario` (
  `CedulaPropietario` VARCHAR(20) NOT NULL,
  `NombrePropietario` VARCHAR(60) NOT NULL,
  `CorreoPropietario` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CedulaPropietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCompra` INT NOT NULL,
  `FechaCompra` VARCHAR(45) NOT NULL,
  `ObservacionesCompra` VARCHAR(120) NOT NULL,
  `Cedula_Asesor_Compra` VARCHAR(15) NOT NULL,
  `Nombre_inmobiliaria_Compra` VARCHAR(25) NOT NULL,
  `ID_Inmueble_Compra` INT NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `Cedula_Asesor_Compra_idx` (`Cedula_Asesor_Compra` ASC) VISIBLE,
  INDEX `Nombre_inmobiliaria_Compra_idx` (`Nombre_inmobiliaria_Compra` ASC) VISIBLE,
  INDEX `ID_Inmueble_Compra_idx` (`ID_Inmueble_Compra` ASC) VISIBLE,
  CONSTRAINT `Cedula_Asesor_Compra`
    FOREIGN KEY (`Cedula_Asesor_Compra`)
    REFERENCES `mydb`.`Asesor` (`CedulaAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nombre_inmobiliaria_Compra`
    FOREIGN KEY (`Nombre_inmobiliaria_Compra`)
    REFERENCES `mydb`.`DatosInmobiliaria` (`NombreInmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Inmueble_Compra`
    FOREIGN KEY (`ID_Inmueble_Compra`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `idAlquiler` INT NOT NULL,
  `FechaAlquiler` VARCHAR(45) NOT NULL,
  `ObservacionesAlquiler` VARCHAR(120) NOT NULL,
  `Cedula_Asesor_alquiler` VARCHAR(15) NOT NULL,
  `Nombre_inmobiliaria_Alquiler` VARCHAR(25) NOT NULL,
  `ID_Inmueble_Alquiler` INT NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `Cedula_Asesor_alquiler_idx` (`Cedula_Asesor_alquiler` ASC) VISIBLE,
  INDEX `Nombre_inmobiliaria_Alquiler_idx` (`Nombre_inmobiliaria_Alquiler` ASC) VISIBLE,
  INDEX `ID_Inmueble_Alquiler_idx` (`ID_Inmueble_Alquiler` ASC) VISIBLE,
  CONSTRAINT `Cedula_Asesor_alquiler`
    FOREIGN KEY (`Cedula_Asesor_alquiler`)
    REFERENCES `mydb`.`Asesor` (`CedulaAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nombre_inmobiliaria_Alquiler`
    FOREIGN KEY (`Nombre_inmobiliaria_Alquiler`)
    REFERENCES `mydb`.`DatosInmobiliaria` (`NombreInmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Inmueble_Alquiler`
    FOREIGN KEY (`ID_Inmueble_Alquiler`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InfoVisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InfoVisitas` (
  `idInfoVisitas` INT NOT NULL,
  `FechaVisitas` VARCHAR(45) NOT NULL,
  `ObservacionesVisita` VARCHAR(120) NOT NULL,
  `Cedula_Asesor_Visita` VARCHAR(15) NOT NULL,
  `ID_Inmueble_visita` INT NOT NULL,
  PRIMARY KEY (`idInfoVisitas`),
  INDEX `Cedula_Asesor_Visita_idx` (`Cedula_Asesor_Visita` ASC) VISIBLE,
  INDEX `ID_Inmueble_visita_idx` (`ID_Inmueble_visita` ASC) VISIBLE,
  CONSTRAINT `Cedula_Asesor_Visita`
    FOREIGN KEY (`Cedula_Asesor_Visita`)
    REFERENCES `mydb`.`Asesor` (`CedulaAsesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Inmueble_visita`
    FOREIGN KEY (`ID_Inmueble_visita`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `CedulaCliente` VARCHAR(20) NOT NULL,
  `NombreCliente` VARCHAR(45) NOT NULL,
  `CorreoCliente` VARCHAR(45) NOT NULL,
  `IngresosCliente` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CedulaCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes_Compra` (
  `cedula_cliente_compra` VARCHAR(20) NOT NULL,
  `idCompra_Cliente` INT NOT NULL,
  PRIMARY KEY (`cedula_cliente_compra`, `idCompra_Cliente`),
  INDEX `idCompra_Cliente_idx` (`idCompra_Cliente` ASC) VISIBLE,
  CONSTRAINT `cedula_cliente_compra`
    FOREIGN KEY (`cedula_cliente_compra`)
    REFERENCES `mydb`.`Clientes` (`CedulaCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCompra_Cliente`
    FOREIGN KEY (`idCompra_Cliente`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes_Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes_Alquiler` (
  `cedula_cliente_alquiler` VARCHAR(20) NOT NULL,
  `idAlquiler_cliente` INT NOT NULL,
  PRIMARY KEY (`idAlquiler_cliente`, `cedula_cliente_alquiler`),
  INDEX `cedula_cliente_alquiler_idx` (`cedula_cliente_alquiler` ASC) VISIBLE,
  CONSTRAINT `cedula_cliente_alquiler`
    FOREIGN KEY (`cedula_cliente_alquiler`)
    REFERENCES `mydb`.`Clientes` (`CedulaCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAlquiler_cliente`
    FOREIGN KEY (`idAlquiler_cliente`)
    REFERENCES `mydb`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes_InfoVisita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes_InfoVisita` (
  `cedula_cliente_visita` VARCHAR(20) NOT NULL,
  `IDvisita_cliente` INT NOT NULL,
  PRIMARY KEY (`cedula_cliente_visita`, `IDvisita_cliente`),
  INDEX `IDvisita_cliente_idx` (`IDvisita_cliente` ASC) VISIBLE,
  CONSTRAINT `cedula_cliente_visita`
    FOREIGN KEY (`cedula_cliente_visita`)
    REFERENCES `mydb`.`Clientes` (`CedulaCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDvisita_cliente`
    FOREIGN KEY (`IDvisita_cliente`)
    REFERENCES `mydb`.`InfoVisitas` (`idInfoVisitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble_propietario` (
  `id_Inmueble_propietario` INT NOT NULL,
  `cedula_propieario_inmueble` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_Inmueble_propietario`, `cedula_propieario_inmueble`),
  INDEX `cedula_propieario_inmueble_idx` (`cedula_propieario_inmueble` ASC) VISIBLE,
  CONSTRAINT `id_Inmueble_propietario`
    FOREIGN KEY (`id_Inmueble_propietario`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_propieario_inmueble`
    FOREIGN KEY (`cedula_propieario_inmueble`)
    REFERENCES `mydb`.`Propietario` (`CedulaPropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_telefono` (
  `Cedula_cliente_telefono` VARCHAR(20) NOT NULL,
  `Telefono_Cliente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cedula_cliente_telefono`, `Telefono_Cliente`),
  CONSTRAINT `Cedula_cliente_telefono`
    FOREIGN KEY (`Cedula_cliente_telefono`)
    REFERENCES `mydb`.`Clientes` (`CedulaCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmobiliaria_Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmobiliaria_Telefono` (
  `idInmobiliaria_Telefono` VARCHAR(25) NOT NULL,
  `Inmobiliaria_Telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idInmobiliaria_Telefono`, `Inmobiliaria_Telefono`),
  CONSTRAINT `idInmobiliaria_Telefono`
    FOREIGN KEY (`idInmobiliaria_Telefono`)
    REFERENCES `mydb`.`DatosInmobiliaria` (`NombreInmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FotosInmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FotosInmueble` (
  `id_Fotos_Inmueble` INT NOT NULL,
  `Fotos_Inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Fotos_Inmueble`, `Fotos_Inmueble`),
  CONSTRAINT `id_Fotos_Inmueble`
    FOREIGN KEY (`id_Fotos_Inmueble`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_Propietario` (
  `cedulaPropietario-Telefono` VARCHAR(20) NOT NULL,
  `Telefono_Propietariocol` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cedulaPropietario-Telefono`, `Telefono_Propietariocol`),
  CONSTRAINT `cedulaPropietario-Telefono`
    FOREIGN KEY (`cedulaPropietario-Telefono`)
    REFERENCES `mydb`.`Propietario` (`CedulaPropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
