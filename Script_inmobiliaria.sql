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
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `CorreoElectronico` VARCHAR(45) NOT NULL,
  `Ingresos` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `Telefono` VARCHAR(45) NOT NULL,
  `Cedula_FK` INT NOT NULL,
  PRIMARY KEY (`Telefono`, `Cedula_FK`),
  INDEX `Cedula_FK_idx` (`Cedula_FK` ASC) VISIBLE,
  CONSTRAINT `Cedula_FK`
    FOREIGN KEY (`Cedula_FK`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asesor` (
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Salario` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble` (
  `id_Inmueble` VARCHAR(45) NOT NULL,
  `disponibilidad_Inmueble` VARCHAR(45) NOT NULL,
  `Estado_inmueble` VARCHAR(45) NOT NULL,
  `Precio_alquiler` VARCHAR(45) NOT NULL,
  `Precio_venta` VARCHAR(45) NOT NULL,
  `Precio_propietario` VARCHAR(45) NOT NULL,
  `numero_pisos` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `estrato` VARCHAR(2) NOT NULL,
  `Departamento_inmueble` VARCHAR(45) NOT NULL,
  `Comuna` VARCHAR(45) NOT NULL,
  `Codigo_postal` VARCHAR(45) NOT NULL,
  `Complemento_inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Inmueble`),
  UNIQUE INDEX `estrato_UNIQUE` (`estrato` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Solicitud_Visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Solicitud_Visita` (
  `id_Visita` VARCHAR(45) NOT NULL,
  `Fecha_Visita` VARCHAR(45) NOT NULL,
  `Asesor_Cedula` INT NOT NULL,
  `Inmueble_id_Inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Visita`, `Asesor_Cedula`, `Inmueble_id_Inmueble`),
  INDEX `fk_Solicitud_Visita_Asesor1_idx` (`Asesor_Cedula` ASC) VISIBLE,
  INDEX `fk_Solicitud_Visita_Inmueble1_idx` (`Inmueble_id_Inmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Solicitud_Visita_Asesor1`
    FOREIGN KEY (`Asesor_Cedula`)
    REFERENCES `mydb`.`Asesor` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Visita_Inmueble1`
    FOREIGN KEY (`Inmueble_id_Inmueble`)
    REFERENCES `mydb`.`Inmueble` (`id_Inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Solicitud_Visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Solicitud_Visita` (
  `Cliente_Cedula` INT NOT NULL,
  `Solicitud_Visita_id_Visita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_Cedula`, `Solicitud_Visita_id_Visita`),
  INDEX `fk_Cliente_has_Solicitud_Visita_Solicitud_Visita1_idx` (`Solicitud_Visita_id_Visita` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Solicitud_Visita_Cliente1_idx` (`Cliente_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Solicitud_Visita_Cliente1`
    FOREIGN KEY (`Cliente_Cedula`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Solicitud_Visita_Solicitud_Visita1`
    FOREIGN KEY (`Solicitud_Visita_id_Visita`)
    REFERENCES `mydb`.`Solicitud_Visita` (`id_Visita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Datos_Inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Datos_Inmobiliaria` (
  `Nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `paginaWeb` VARCHAR(350) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `id_Alquiler` VARCHAR(45) NOT NULL,
  `FechaPagoMensual` VARCHAR(45) NOT NULL,
  `Precio_alquiler` VARCHAR(45) NOT NULL,
  `Asesor_Cedula` INT NOT NULL,
  `Datos_Inmobiliaria_Nombre` VARCHAR(45) NOT NULL,
  `Inmueble_id_Inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Alquiler`, `Asesor_Cedula`, `Datos_Inmobiliaria_Nombre`, `Inmueble_id_Inmueble`),
  INDEX `fk_Alquiler_Asesor1_idx` (`Asesor_Cedula` ASC) VISIBLE,
  INDEX `fk_Alquiler_Datos_Inmobiliaria1_idx` (`Datos_Inmobiliaria_Nombre` ASC) VISIBLE,
  INDEX `fk_Alquiler_Inmueble1_idx` (`Inmueble_id_Inmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Alquiler_Asesor1`
    FOREIGN KEY (`Asesor_Cedula`)
    REFERENCES `mydb`.`Asesor` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Datos_Inmobiliaria1`
    FOREIGN KEY (`Datos_Inmobiliaria_Nombre`)
    REFERENCES `mydb`.`Datos_Inmobiliaria` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Inmueble1`
    FOREIGN KEY (`Inmueble_id_Inmueble`)
    REFERENCES `mydb`.`Inmueble` (`id_Inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Alquiler` (
  `Cliente_Cedula` INT NOT NULL,
  `Alquiler_id_Alquiler` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_Cedula`, `Alquiler_id_Alquiler`),
  INDEX `fk_Cliente_has_Alquiler_Alquiler1_idx` (`Alquiler_id_Alquiler` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Alquiler_Cliente1_idx` (`Cliente_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Alquiler_Cliente1`
    FOREIGN KEY (`Cliente_Cedula`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Alquiler_Alquiler1`
    FOREIGN KEY (`Alquiler_id_Alquiler`)
    REFERENCES `mydb`.`Alquiler` (`id_Alquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCompra` VARCHAR(45) NOT NULL,
  `Fecha_compra` VARCHAR(45) NOT NULL,
  `Valor_Compra` VARCHAR(45) NOT NULL,
  `Asesor_Cedula` INT NOT NULL,
  `Datos_Inmobiliaria_Nombre` VARCHAR(45) NOT NULL,
  `Inmueble_id_Inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompra`, `Asesor_Cedula`, `Datos_Inmobiliaria_Nombre`, `Inmueble_id_Inmueble`),
  INDEX `fk_Compra_Asesor1_idx` (`Asesor_Cedula` ASC) VISIBLE,
  INDEX `fk_Compra_Datos_Inmobiliaria1_idx` (`Datos_Inmobiliaria_Nombre` ASC) VISIBLE,
  INDEX `fk_Compra_Inmueble1_idx` (`Inmueble_id_Inmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Asesor1`
    FOREIGN KEY (`Asesor_Cedula`)
    REFERENCES `mydb`.`Asesor` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Datos_Inmobiliaria1`
    FOREIGN KEY (`Datos_Inmobiliaria_Nombre`)
    REFERENCES `mydb`.`Datos_Inmobiliaria` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Inmueble1`
    FOREIGN KEY (`Inmueble_id_Inmueble`)
    REFERENCES `mydb`.`Inmueble` (`id_Inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Compra` (
  `Cliente_Cedula` INT NOT NULL,
  `Compra_idCompra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_Cedula`, `Compra_idCompra`),
  INDEX `fk_Cliente_has_Compra_Compra1_idx` (`Compra_idCompra` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Compra_Cliente1_idx` (`Cliente_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Compra_Cliente1`
    FOREIGN KEY (`Cliente_Cedula`)
    REFERENCES `mydb`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Compra_Compra1`
    FOREIGN KEY (`Compra_idCompra`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietario` (
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fotos_Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fotos_Inmueble` (
  `Id_Inmueble_FK` VARCHAR(45) NOT NULL,
  `Fotos_Inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Inmueble_FK`, `Fotos_Inmueble`),
  CONSTRAINT `Id_Inmueble_FK`
    FOREIGN KEY (`Id_Inmueble_FK`)
    REFERENCES `mydb`.`Inmueble` (`id_Inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble_has_Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble_has_Propietario` (
  `Inmueble_id_Inmueble` VARCHAR(45) NOT NULL,
  `Propietario_Cedula` INT NOT NULL,
  PRIMARY KEY (`Inmueble_id_Inmueble`, `Propietario_Cedula`),
  INDEX `fk_Inmueble_has_Propietario_Propietario1_idx` (`Propietario_Cedula` ASC) VISIBLE,
  INDEX `fk_Inmueble_has_Propietario_Inmueble1_idx` (`Inmueble_id_Inmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Inmueble_has_Propietario_Inmueble1`
    FOREIGN KEY (`Inmueble_id_Inmueble`)
    REFERENCES `mydb`.`Inmueble` (`id_Inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_has_Propietario_Propietario1`
    FOREIGN KEY (`Propietario_Cedula`)
    REFERENCES `mydb`.`Propietario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_Inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_Inmobiliaria` (
  `Nombre_FK` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre_FK`, `Telefono`),
  CONSTRAINT `Nombre_FK`
    FOREIGN KEY (`Nombre_FK`)
    REFERENCES `mydb`.`Datos_Inmobiliaria` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO Cliente (Cedula, Nombre, CorreoElectronico, Ingresos, Direccion, Habilitado)
VALUES 
(1, 'Juan Pérez', 'juanperez@email.com', '$1000', 'Calle 1 #2-3', 'Sí'),
(2, 'María Rodríguez', 'mariarodriguez@email.com', '$1500', 'Calle 4 #5-6', 'Sí'),
(3, 'Pedro García', 'pedrogarcia@email.com', '$2000', 'Calle 7 #8-9', 'Sí'),
(4, 'Ana López', 'analopez@email.com', '$2500', 'Calle 10 #11-12', 'Sí'),
(5, 'José Martínez', 'josemartinez@email.com', '$3000', 'Calle 13 #14-15', 'Sí'),
(6, 'Luz Díaz', 'luzdiaz@email.com', '$3500', 'Calle 16 #17-18', 'Sí');
SELECT *
FROM Cliente;

INSERT INTO Telefono (Telefono, Cedula_FK)
VALUES 
("123456789", 1001),
("987654321", 1002),
("135791113", 1003),
("246802468", 1004),
("369258147", 1005),
("258741369", 1006);
SELECT *
FROM Telefono;

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (123456789, 'Juan Perez', '50000', '555-555-5555', 'juanperez@email.com');

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (987654321, 'Maria Rodriguez', '60000', '555-555-5556', 'mariarodriguez@email.com');

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (111222333, 'Carlos Gonzalez', '55000', '555-555-5557', 'carlosgonzalez@email.com');

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (444221111, 'Ana Martinez', '58000', '555-555-5558', 'anamartinez@email.com');

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (555332211, 'Luis Lopez', '52000', '555-555-5559', 'luislopez@email.com');

INSERT INTO Asesor (Cedula, Nombre, Salario, Telefono, Correo)
VALUES (666111000, 'Sofia Garcia', '56000', '555-555-5560', 'sofiagarcia@email.com');
SELECT *
FROM Asesor;


INSERT INTO Inmueble (id_Inmueble, disponibilidad_Inmueble, Estado_inmueble, Precio_alquiler, Precio_venta, Precio_propietario, numero_pisos, area, estrato, Departamento_inmueble, Comuna, Codigo_postal, Complemento_inmueble)
VALUES ('INMM001', 'Disponible', 'Nuevo', '1000', '2000000', '2500000', '3', '100', '01', 'Antioquia', 'Medellin', '00000', 'Apto 101');

INSERT INTO Inmueble (id_Inmueble, disponibilidad_Inmueble, Estado_inmueble, Precio_alquiler, Precio_venta, Precio_propietario, numero_pisos, area, estrato, Departamento_inmueble, Comuna, Codigo_postal, Complemento_inmueble)
VALUES ('INM002', 'No Disponible', 'Usado', '900', '1800000', '2200000', '2', '90', '5', 'Bogota', 'Chapinero', '11111', 'Apto 102');

INSERT INTO Inmueble (id_Inmueble, disponibilidad_Inmueble, Estado_inmueble, Precio_alquiler, Precio_venta, Precio_propietario, numero_pisos, area, estrato, Departamento_inmueble, Comuna, Codigo_postal, Complemento_inmueble)
VALUES ('INM003', 'Disponible', 'Semi-Nuevo', '1100', '1900000', '2300000', '4', '120', '2', 'Valle del Cauca', 'Cali', '22222', 'Apto 103');

INSERT INTO Inmueble (id_Inmueble, disponibilidad_Inmueble, Estado_inmueble, Precio_alquiler, Precio_venta, Precio_propietario, numero_pisos, area, estrato, Departamento_inmueble, Comuna, Codigo_postal, Complemento_inmueble)
VALUES ('INM004', 'No Disponible', 'Antiguo', '800', '1600000', '2000000', '1', '80', '4', 'Santander', 'Bucaramanga', '33333', 'Apto 104');

INSERT INTO Inmueble (id_Inmueble, disponibilidad_Inmueble, Estado_inmueble, Precio_alquiler, Precio_venta, Precio_propietario, numero_pisos, area, estrato, Departamento_inmueble, Comuna, Codigo_postal, Complemento_inmueble)
VALUES ('INM005', 'Disponible', 'Nuevo', '1200', '20023', '20090', '5','80','1', 'antioquia','13','051040','apto 105');
SELECT *
FROM Inmueble;

INSERT INTO Solicitud_Visita (id_Visita, Fecha_Visita, Asesor_Cedula, Inmueble_id_Inmueble)
VALUES 
("V001", "2023-02-13", 123456, "INM0001"),
("V002", "2023-02-14", 123457, "INM0002"),
("V003", "2023-02-15", 123458, "INM0003"),
("V004", "2023-02-16", 123459, "INM0004"),
("V005", "2023-02-17", 123460, "INM0005"),
("V006", "2023-02-18", 123461, "INM0006");
SELECT *
FROM Solicitud_Visita;

INSERT INTO Cliente_has_Solicitud_Visita (Cliente_Cedula, Solicitud_Visita_id_Visita)
VALUES (123456789, 'V1'), (234567890, 'V2'), (345678901, 'V3'), (456789012, 'V4'), (567890123, 'V5'), (678901234, 'V6');
SELECT *
FROM Cliente_has_Solicitud_Visita;

INSERT INTO Datos_Inmobiliaria (Nombre, direccion, Correo, paginaWeb)
VALUES 
('Inmobiliaria 1', 'Calle 1', 'inmobiliaria1@example.com', 'www.inmobiliaria1.com'), 
('Inmobiliaria 2', 'Calle 2', 'inmobiliaria2@example.com', 'www.inmobiliaria2.com'), 
('Inmobiliaria 3', 'Calle 3', 'inmobiliaria3@example.com', 'www.inmobiliaria3.com'), 
('Inmobiliaria 4', 'Calle 4', 'inmobiliaria4@example.com', 'www.inmobiliaria4.com'), 
('Inmobiliaria 5', 'Calle 5', 'inmobiliaria5@example.com', 'www.inmobiliaria5.com'), 
('Inmobiliaria 6', 'Calle 6', 'inmobiliaria6@example.com', 'www.inmobiliaria6.com');
SELECT *
FROM Datos_Inmobiliaria;

INSERT INTO Alquiler (id_Alquiler, FechaPagoMensual, Precio_alquiler, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) 
VALUES 
("A001", "01/01/2023", "1000", 1001, "Inmo01", "I001"),
("A002", "01/02/2023", "1100", 1002, "Inmo02", "I002"),
("A003", "01/03/2023", "1200", 1003, "Inmo03", "I003"),
("A004", "01/04/2023", "1300", 1004, "Inmo04", "I004"),
("A005", "01/05/2023", "1400", 1005, "Inmo05", "I005"),
("A006", "01/06/2023", "1500", 1006, "Inmo06", "I006");
SELECT *
FROM Alquiler;


INSERT INTO Cliente_has_Alquiler(Cliente_Cedula, Alquiler_id_Alquiler)
VALUES (1, 'A0001'),
       (2, 'A0002'),
       (3, 'A0003'),
       (4, 'A0004'),
       (5, 'A0005'),
       (6, 'A0006');
SELECT *
FROM Cliente_has_Alquiler;

INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C001', '2022-01-01', '$1,000,000', 123456789, 'Inmo 1', 'IMB001');
INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C002', '2022-02-01', '$2,000,000', 987654321, 'Inmo 2', 'IMB002');
INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C003', '2022-03-01', '$3,000,000', 111111111, 'Inmo 1', 'IMB003');
INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C004', '2022-04-01', '$4,000,000', 222222222, 'Inmo 2', 'IMB004');
INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C005', '2022-05-01', '$5,000,000', 333333333, 'Inmo 1', 'IMB005');
INSERT INTO Compra (idCompra, Fecha_compra, Valor_Compra, Asesor_Cedula, Datos_Inmobiliaria_Nombre, Inmueble_id_Inmueble) VALUES ('C006', '2022-06-01', '$6,000,000', 444444444, 'Inmo 2', 'IMB006');
SELECT *
FROM Compra;

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10001, 'Juan Perez', 'juan.perez@gmail.com');

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10002, 'María Rodriguez', 'maria.rodriguez@gmail.com');

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10003, 'Pedro Martínez', 'pedro.martinez@gmail.com');

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10004, 'Isabel Gómez', 'isabel.gomez@gmail.com');

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10005, 'Carlos Sánchez', 'carlos.sanchez@gmail.com');

INSERT INTO Propietario (Cedula, Nombre, Correo_Electronico)
VALUES (10006, 'Ana Díaz', 'ana.diaz@gmail.com');
SELECT *
FROM Propietario;

INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB001', 'Foto1_IMB001.jpg');
INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB001', 'Foto2_IMB001.jpg');
INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB002', 'Foto1_IMB002.jpg');
INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB002', 'Foto2_IMB002.jpg');
INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB003', 'Foto1_IMB003.jpg');
INSERT INTO Fotos_Inmueble (Id_Inmueble_FK, Fotos_Inmueble) VALUES ('IMB003', 'Foto2_IMB003.jpg');
SELECT *
FROM Fotos_Inmueble;

INSERT INTO Inmueble_has_Propietario (Inmueble_id_Inmueble, Propietario_Cedula)
VALUES ('1', 1001),
('2', 1002),
('3', 1003),
('4', 1004),
('5', 1005),
('6', 1006);
SELECT *
FROM Inmueble_has_Propietario;

INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre1', '123456');
INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre2', '234567');
INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre3', '345678');
INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre4', '456789');
INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre5', '567890');
INSERT INTO Telefono_Inmobiliaria (Nombre_FK, Telefono) VALUES ('Nombre6', '678901');
SELECT *
FROM Telefono_Inmobiliaria;

