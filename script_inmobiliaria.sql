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
  `nombre` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(65) NOT NULL,
  `ingresos` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_cliente` (
  `cedula_telefono_cliente` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_telefono_cliente`, `telefono`),
  CONSTRAINT `cedula_telefono_cliente`
    FOREIGN KEY (`cedula_telefono_cliente`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datosInmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datosInmobiliaria` (
  `nombre` VARCHAR(80) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(80) NOT NULL,
  `paginaWeb` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asesor` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(55) NOT NULL,
  `salario` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmueble` (
  `id_inmueble` VARCHAR(15) NOT NULL,
  `disponibilidad_inmueble` VARCHAR(45) NOT NULL,
  `estado_inmueble` VARCHAR(22) NOT NULL,
  `precio_alquiler` VARCHAR(25) NOT NULL,
  `precio_venta` VARCHAR(25) NOT NULL,
  `precio_propietario` VARCHAR(25) NOT NULL,
  `numero_pisos` VARCHAR(3) NOT NULL,
  `area` VARCHAR(12) NOT NULL,
  `estrato` VARCHAR(1) NOT NULL,
  `departamento_inmueble` VARCHAR(80) NOT NULL,
  `ciudad_inmueble` VARCHAR(80) NOT NULL,
  `comuna/barrio_inmueble` VARCHAR(55) NOT NULL,
  `codigoPostal_inmueble` VARCHAR(10) NOT NULL,
  `complemento_inmueble` VARCHAR(50) NOT NULL,
  `inmueblecol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_inmueble`))
ENGINE = InnoDB;

ALTER TABLE inmueble
CHANGE `comuna/barrio_inmueble` comunabarrio_inmueble VARCHAR(55) NOT NULL;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `id_compra` INT NOT NULL,
  `valor_compra` VARCHAR(45) NOT NULL,
  `fecha_compra` VARCHAR(75) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cedula` VARCHAR(45) NOT NULL,
  `id_inmueble_compra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `nombre_idx` (`nombre` ASC) VISIBLE,
  INDEX `cedula_idx` (`cedula` ASC) VISIBLE,
  INDEX `id_inmueble_idx` (`id_inmueble_compra` ASC) VISIBLE,
  CONSTRAINT `nombre`
    FOREIGN KEY (`nombre`)
    REFERENCES `mydb`.`datosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula`
    FOREIGN KEY (`cedula`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_inmueble`
    FOREIGN KEY (`id_inmueble_compra`)
    REFERENCES `mydb`.`inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alquiler` (
  `id_alquiler` INT NOT NULL,
  `precio_alquiler` VARCHAR(12) NOT NULL,
  `fechaPagoMensual` VARCHAR(70) NOT NULL,
  `cedula_alquiler` VARCHAR(45) NOT NULL,
  `nombre_alquiler` VARCHAR(45) NOT NULL,
  `id_inmueble_alquiler` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_alquiler`),
  INDEX `cedula_alquiler_idx` (`cedula_alquiler` ASC) VISIBLE,
  INDEX `nombre_alquiler_idx` (`nombre_alquiler` ASC) VISIBLE,
  INDEX `id_inmueble_alquiler_idx` (`id_inmueble_alquiler` ASC) VISIBLE,
  CONSTRAINT `cedula_alquiler`
    FOREIGN KEY (`cedula_alquiler`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_alquiler`
    FOREIGN KEY (`nombre_alquiler`)
    REFERENCES `mydb`.`datosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_inmueble_alquiler`
    FOREIGN KEY (`id_inmueble_alquiler`)
    REFERENCES `mydb`.`inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`solicitud_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`solicitud_visita` (
  `id_visita` INT NOT NULL,
  `fecha_visita` VARCHAR(70) NOT NULL,
  `cedula_sol_visita` VARCHAR(45) NOT NULL,
  `id_inmueble_sol_visita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_visita`),
  INDEX `cedula_sol_visita_idx` (`cedula_sol_visita` ASC) VISIBLE,
  INDEX `id_inmueble_sol_visita_idx` (`id_inmueble_sol_visita` ASC) VISIBLE,
  CONSTRAINT `cedula_sol_visita`
    FOREIGN KEY (`cedula_sol_visita`)
    REFERENCES `mydb`.`asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_inmueble_sol_visita`
    FOREIGN KEY (`id_inmueble_sol_visita`)
    REFERENCES `mydb`.`inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fotos` (
  `id_inmueble_fotos` VARCHAR(15) NOT NULL,
  `fotos` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_inmueble_fotos`, `fotos`),
  CONSTRAINT `id_inmueble_fotos`
    FOREIGN KEY (`id_inmueble_fotos`)
    REFERENCES `mydb`.`inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`propietario` (
  `cedula` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(70) NOT NULL,
  `correoElectronico` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_propietario` (
  `cedula_telefono_propietario` VARCHAR(15) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_telefono_propietario`, `numero`),
  CONSTRAINT `cedula_telefono_propietario`
    FOREIGN KEY (`cedula_telefono_propietario`)
    REFERENCES `mydb`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_inmobiliaria` (
  `nombre_telefono_inmob` VARCHAR(80) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre_telefono_inmob`, `telefono`),
  CONSTRAINT `nombre_telefono_inmob`
    FOREIGN KEY (`nombre_telefono_inmob`)
    REFERENCES `mydb`.`datosInmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_has_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_has_compra` (
  `cedula_cliente_compra` VARCHAR(15) NOT NULL,
  `id_compra_cliente` INT NOT NULL,
  PRIMARY KEY (`cedula_cliente_compra`, `id_compra_cliente`),
  INDEX `fk_cliente_has_compra_compra1_idx` (`id_compra_cliente` ASC) VISIBLE,
  INDEX `fk_cliente_has_compra_cliente1_idx` (`cedula_cliente_compra` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_compra_cliente1`
    FOREIGN KEY (`cedula_cliente_compra`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_compra_compra1`
    FOREIGN KEY (`id_compra_cliente`)
    REFERENCES `mydb`.`compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_has_alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_has_alquiler` (
  `cedula_cliente_alquiler` VARCHAR(15) NOT NULL,
  `id_alquiler_cliente` INT NOT NULL,
  PRIMARY KEY (`cedula_cliente_alquiler`, `id_alquiler_cliente`),
  INDEX `fk_cliente_has_alquiler_alquiler1_idx` (`id_alquiler_cliente` ASC) VISIBLE,
  INDEX `fk_cliente_has_alquiler_cliente1_idx` (`cedula_cliente_alquiler` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_alquiler_cliente1`
    FOREIGN KEY (`cedula_cliente_alquiler`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_alquiler_alquiler1`
    FOREIGN KEY (`id_alquiler_cliente`)
    REFERENCES `mydb`.`alquiler` (`id_alquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_has_solicitud_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_has_solicitud_visita` (
  `cliente_cedula` VARCHAR(15) NOT NULL,
  `solicitud_visita_id_visita` INT NOT NULL,
  PRIMARY KEY (`cliente_cedula`, `solicitud_visita_id_visita`),
  INDEX `fk_cliente_has_solicitud_visita_solicitud_visita1_idx` (`solicitud_visita_id_visita` ASC) VISIBLE,
  INDEX `fk_cliente_has_solicitud_visita_cliente1_idx` (`cliente_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_solicitud_visita_cliente1`
    FOREIGN KEY (`cliente_cedula`)
    REFERENCES `mydb`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_solicitud_visita_solicitud_visita1`
    FOREIGN KEY (`solicitud_visita_id_visita`)
    REFERENCES `mydb`.`solicitud_visita` (`id_visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inmueble_has_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inmueble_has_propietario` (
  `id_inmueble_propietario` VARCHAR(15) NOT NULL,
  `cedula_prop_inmueble` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_inmueble_propietario`, `cedula_prop_inmueble`),
  INDEX `fk_inmueble_has_propietario_propietario1_idx` (`cedula_prop_inmueble` ASC) VISIBLE,
  INDEX `fk_inmueble_has_propietario_inmueble1_idx` (`id_inmueble_propietario` ASC) VISIBLE,
  CONSTRAINT `fk_inmueble_has_propietario_inmueble1`
    FOREIGN KEY (`id_inmueble_propietario`)
    REFERENCES `mydb`.`inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_has_propietario_propietario1`
    FOREIGN KEY (`cedula_prop_inmueble`)
    REFERENCES `mydb`.`propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO cliente (cedula, nombre, correoElectronico, ingresos, direccion, habilitado)
VALUES ('123456789', 'Juan Pérez', 'juanperez@gmail.com', '5000000', 'Calle 123 #456', 'Sí'),
('987654321', 'María Rodríguez', 'mariarodriguez@gmail.com', '6000000', 'Calle 789 #101112', 'Sí'),
('123987456', 'Pedro Martínez', 'pedromartinez@gmail.com', '4500000', 'Calle 567 #91011', 'No'),
('654321987', 'Ana López', 'analopez@gmail.com', '5500000', 'Calle 999 #121314', 'Sí'),
('456789123', 'Carlos García', 'carlosgarcia@gmail.com', '7000000', 'Calle 876 #151617', 'No'),
('789123456', 'Sofía Díaz', 'sofiadiaz@gmail.com', '4000000', 'Calle 654 #181910', 'Sí');
SELECT *
from cliente;

INSERT INTO telefono_cliente (cedula_telefono_cliente, telefono)
VALUES ('123456789', '555-555-1219'),
('987654321', '555-555-1213'),
('123987456', '555-555-1214'),
('654321987', '555-555-1215'),
('456789123', '555-555-1216'),
('789123456', '555-555-1217');
SELECT *
FROM telefono_cliente;

INSERT INTO datosInmobiliaria (nombre, direccion, correo, paginaWeb)
VALUES ('Inmobiliaria ABC', 'Calle 123 #456', 'contacto@inmobiliariaabc.com', 'https://www.inmobiliariaabc.com'),
('Inmobiliaria XYZ', 'Calle 789 #101112', 'info@inmobiliariaxyz.com', 'https://www.inmobiliariaxyz.com'),
('Inmobiliaria 123', 'Calle 567 #91011', 'ventas@inmobiliaria123.com', 'https://www.inmobiliaria123.com'),
('Inmobiliaria 456', 'Calle 999 #121314', 'asesores@inmobiliaria456.com', 'https://www.inmobiliaria456.com'),
('Inmobiliaria 789', 'Calle 876 #151617', 'administracion@inmobiliaria789.com', 'https://www.inmobiliaria789.com'),
('Inmobiliaria 012', 'Calle 654 #181910', 'contactanos@inmobiliaria012.com', 'https://www.inmobiliaria012.com');
SELECT *
FROM datosInmobiliaria;

INSERT INTO asesor (cedula, nombre, salario, telefono, correo)
VALUES ('11', 'juanito', '5000000', '1234567890', 'juan@inmobiliariaabc.com'),
('22', 'mari ', '6000000', '0987654321', 'mariz@inmobiliariaxyz.com'),
('33', 'pedrito', '4500000', '1239874560', 'pedro@inmobiliaria123.com'),
('44', 'Aana', '5500000', '0654321987', 'ana@inmobiliaria456.com'),
('55', 'Carlos ', '7000000', '0456789123', 'carlos@inmobiliaria789.com'),
('66', 'Sofía Meneses', '4000000', '0789123456', 'sofia@inmobiliaria012.com');
SELECT *
FROM asesor;

INSERT INTO inmueble (id_inmueble, disponibilidad_inmueble, estado_inmueble, precio_alquiler, precio_venta, precio_propietario, numero_pisos, area, estrato, departamento_inmueble, ciudad_inmueble, comunabarrio_inmueble, codigoPostal_inmueble, complemento_inmueble, inmueblecol)VALUES
  ('1', 'Disponible', 'Nuevo', '$1000', '$100000', '$120000', '3', '120m2', '6', 'Antioquia', 'Medellin', 'El Poblado', '05000', 'Casa 1', 'Inmueble 1'),
  ('2', 'Ocupado', 'Usado', '$800', '$90000', '$100000', '2', '100m2', '5', 'Valle del Cauca', 'Cali', 'San Fernando', '07000', 'Casa 2', 'Inmueble 2'),
  ('3', 'Disponible', 'Nuevo', '$1200', '$110000', '$130000', '4', '130m2', '7', 'Bogota', 'Bogota', 'Chapinero', '08000', 'Casa 3', 'Inmueble 3'),
  ('4', 'Ocupado', 'Usado', '$900', '$80000', '$90000', '2', '90m2', '4', 'Santander', 'Bucaramanga', 'Cabecera', '05000', 'Casa 4', 'Inmueble 4'),
  ('5', 'Disponible', 'Nuevo', '$1100', '$100000', '$120000', '3', '110m2', '6', 'Atlantico', 'Barranquilla', 'Los cerezos', '06000', 'Casa 5', 'Inmueble 5');
SELECT *
FROM inmueble;

INSERT INTO compra (id_compra, valor_compra, fecha_compra, nombre, cedula, id_inmueble_compra)VALUES
  (1, '$100000', '2022-01-01', 'Inmobiliaria ABC', '11', '1'),
  (2, '$90000', '2022-02-01', 'Inmobiliaria XYZ', '22', '2'),
  (3, '$110000', '2022-03-01', 'Inmobiliaria 123', '33', '3'),
  (4, '$80000', '2022-04-01', 'Inmobiliaria 456', '44', '4'),
  (5, '$100000', '2022-05-01', 'Inmobiliaria 012', '55', '5');
  SELECT*
  FROM compra;
  
  INSERT INTO alquiler (id_alquiler, precio_alquiler, fechaPagoMensual, cedula_alquiler, nombre_alquiler, id_inmueble_alquiler)
VALUES
(1, '500', '2022-01-01', '11', 'Inmobiliaria ABC', '1'),
(2, '400', '2022-02-01', '22', 'Inmobiliaria XYZ', '2'),
(3, '450', '2022-03-01', '33', 'Inmobiliaria 123', '3'),
(4, '600', '2022-04-01', '44', 'Inmobiliaria 456', '4'),
(5, '550', '2022-05-01', '55', 'Inmobiliaria 012', '5');

SELECT *
FROM alquiler;

INSERT INTO solicitud_visita (id_visita, fecha_visita, cedula_sol_visita, id_inmueble_sol_visita)
VALUES
(1, '2022-06-01', '11', '1'),
(2, '2022-07-01', '22', '2'),
(3, '2022-08-01', '33', '3'),
(4, '2022-09-01', '44', '4'),
(5, '2022-10-01', '55', '5');

SELECT *
FROM solicitud_visita;

INSERT INTO `fotos` (`id_inmueble_fotos`, `fotos`)
VALUES 
('1', 'foto1'), 
('1', 'foto2'), 
('2', 'foto3'), 
('2', 'foto4'), 
('3', 'foto5');
SELECT *
FROM fotos;
INSERT INTO mydb.cliente_has_compra (cedula_cliente_compra, id_compra_cliente) VALUES
('987654321', 1),
('123987456', 2),
('456789123', 4),
('654321987',5),
('789123456',3);
SELECT *
FROM cliente_has_compra;

INSERT INTO cliente_has_alquiler (cedula_cliente_alquiler, id_alquiler_cliente)
VALUES ('987654328', 1), ('123987456', 2), ('456789123', 3),('654321987',5),
('789123456',4);
SELECT*
FROM cliente_has_alquiler;

INSERT INTO propietario (`cedula`, `nombre`, `correoElectronico`)
VALUES 
('aa', 'Juan', 'juan@gmail.com'), 
('bb', 'Pedro', 'pedro@gmail.com'), 
('cc', 'Ana', 'ana@gmail.com'), 
('dd', 'Maria', 'maria@gmail.com'), 
('ee', 'Lucas', 'lucas@gmail.com');
SELECT *
FROM propietario;

INSERT INTO telefono_propietario (cedula_telefono_propietario, numero) VALUES
('aa', '555-555-1234'),
('bb', '555-555-2345'),
('cc', '555-555-3456'),
('dd', '555-555-4567'),
('ee', '555-555-5678');
SELECT *
FROM telefono_propietario;

INSERT INTO mydb.telefono_inmobiliaria (nombre_telefono_inmob, telefono) VALUES
('Inmobiliaria ABC', '555-595'),
('Inmobiliaria XYZ', '555-553'),
('Inmobiliaria 123', '555-554'),
('Inmobiliaria 456', '555-565'),
('Inmobiliaria 012', '555-575');
SELECT *
FROM telefono_inmobiliaria;

INSERT INTO inmueble_has_propietario (id_inmueble_propietario, cedula_prop_inmueble)
VALUES ('1', 'aa'), ('2', 'bb'), ('3', 'cc'), 
('4', 'dd'), ('5', 'ee');
SELECT*
FROM inmueble_has_propietario;

