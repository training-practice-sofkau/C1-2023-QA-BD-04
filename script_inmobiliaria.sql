-- MySQL Script generated by MySQL Workbench
-- Sun Feb 12 01:40:57 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_inmobiliaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_inmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_inmobiliaria` DEFAULT CHARACTER SET utf8 ;
USE `db_inmobiliaria` ;

-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_datos_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_datos_inmobiliaria` (
  `nombre_inmobiliaria` VARCHAR(50) NOT NULL,
  `direccion_inmobiliaria` VARCHAR(45) NULL,
  `correo_inmobiliaria` VARCHAR(45) NULL,
  `pagina_web_inmobiliaria` VARCHAR(45) NULL,
  PRIMARY KEY (`nombre_inmobiliaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_telefono_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_telefono_inmobiliaria` (
  `nombre_inmobiliaria` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre_inmobiliaria`, `telefono`),
  CONSTRAINT `fk_tb_telefono_inmobiliaria_tb_datos_inmobiliaria`
    FOREIGN KEY (`nombre_inmobiliaria`)
    REFERENCES `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_asesor` (
  `cedula_asesor` VARCHAR(50) NOT NULL,
  `nombre_asesor` VARCHAR(45) NULL,
  `salario_asesor` VARCHAR(45) NULL,
  `telefono_asesor` VARCHAR(45) NULL,
  `correo_asesor` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula_asesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_propietario` (
  `cedula` VARCHAR(50) NOT NULL,
  `nombre_propietario` VARCHAR(45) NULL,
  `correo_propietario` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_inmueble` (
  `id_inmueble` VARCHAR(50) NOT NULL,
  `piso_inmueble` VARCHAR(45) NULL,
  `area_inmueble` VARCHAR(45) NULL,
  `estrato_inmueble` VARCHAR(45) NULL,
  `departamento_direccion` VARCHAR(45) NULL,
  `ciudad_direccion` VARCHAR(45) NULL,
  `barrio_direccion` VARCHAR(45) NULL,
  `codigo_postal_direccion` VARCHAR(45) NULL,
  `complemento_direccion` VARCHAR(45) NULL,
  `precio_venta_inmueble` VARCHAR(45) NULL,
  `precio_alquiler_inmueble` VARCHAR(45) NULL,
  `estado_inmueble` VARCHAR(45) NULL,
  `disponibilidad_inmueble` VARCHAR(45) NULL,
  `precio_propietario_inmueble` VARCHAR(45) NULL,
  `cedula_propietario` VARCHAR(45) NULL,
  PRIMARY KEY (`id_inmueble`),
  INDEX `fk_tb_inmueble_tb_propietario1_idx` (`cedula_propietario` ASC) VISIBLE,
  CONSTRAINT `fk_tb_inmueble_tb_propietario1`
    FOREIGN KEY (`cedula_propietario`)
    REFERENCES `db_inmobiliaria`.`tb_propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_foto_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_foto_inmueble` (
  `id_inmueble` VARCHAR(50) NOT NULL,
  `foto_inmueble` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_inmueble`, `foto_inmueble`),
  CONSTRAINT `fk_tb_foto_inmueble_tb_inmueble1`
    FOREIGN KEY (`id_inmueble`)
    REFERENCES `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_telefono_propietario` (
  `id_propietario` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_propietario`, `telefono`),
  CONSTRAINT `fk_tb_telefono_propietario_tb_propietario1`
    FOREIGN KEY (`id_propietario`)
    REFERENCES `db_inmobiliaria`.`tb_propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_cliente` (
  `cedula_cliente` VARCHAR(45) NOT NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  `ingresos_cliente` VARCHAR(45) NULL,
  `habilitado` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `correo_electronico_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_telefono_cliente` (
  `telefono_cliente` VARCHAR(50) NOT NULL,
  `cedula_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefono_cliente`, `cedula_cliente`),
  INDEX `fk_tb_telefono_cliente_tb_cliente1_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tb_telefono_cliente_tb_cliente1`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_compra` (
  `id_compra` VARCHAR(50) NOT NULL,
  `valor` VARCHAR(45) NULL,
  `cedula_cliente` VARCHAR(45) NULL,
  `id_inmueble` VARCHAR(45) NULL,
  `cedula_asesor` VARCHAR(45) NULL,
  `nombre_inmobiliaria` VARCHAR(50) NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_tb_compra_tb_asesor1_idx` (`cedula_asesor` ASC) VISIBLE,
  INDEX `fk_tb_compra_tb_cliente1_idx` (`cedula_cliente` ASC) VISIBLE,
  INDEX `fk_tb_compra_tb_inmueble1_idx` (`id_inmueble` ASC) VISIBLE,
  INDEX `fk_tb_compra_tb_datos_inmobiliaria1_idx` (`nombre_inmobiliaria` ASC) VISIBLE,
  CONSTRAINT `fk_tb_compra_tb_asesor1`
    FOREIGN KEY (`cedula_asesor`)
    REFERENCES `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_compra_tb_cliente1`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_compra_tb_inmueble1`
    FOREIGN KEY (`id_inmueble`)
    REFERENCES `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_compra_tb_datos_inmobiliaria1`
    FOREIGN KEY (`nombre_inmobiliaria`)
    REFERENCES `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_alquiler` (
  `id_alquieler` VARCHAR(50) NOT NULL,
  `valor` VARCHAR(45) NULL,
  `cedula_cliente` VARCHAR(45) NULL,
  `id_inmueble` VARCHAR(45) NULL,
  `cedula_asesor` VARCHAR(45) NULL,
  `nombre_inmobiliaria` VARCHAR(50) NULL,
  PRIMARY KEY (`id_alquieler`),
  INDEX `fk_tb_alquiler_tb_asesor1_idx` (`cedula_asesor` ASC) VISIBLE,
  INDEX `fk_tb_alquiler_tb_cliente1_idx` (`cedula_cliente` ASC) VISIBLE,
  INDEX `fk_tb_alquiler_tb_datos_inmobiliaria1_idx` (`nombre_inmobiliaria` ASC) VISIBLE,
  INDEX `fk_tb_alquiler_tb_inmueble1_idx` (`id_inmueble` ASC) VISIBLE,
  CONSTRAINT `fk_tb_alquiler_tb_asesor1`
    FOREIGN KEY (`cedula_asesor`)
    REFERENCES `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alquiler_tb_cliente1`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alquiler_tb_datos_inmobiliaria1`
    FOREIGN KEY (`nombre_inmobiliaria`)
    REFERENCES `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alquiler_tb_inmueble1`
    FOREIGN KEY (`id_inmueble`)
    REFERENCES `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_inmobiliaria`.`tb_info_visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inmobiliaria`.`tb_info_visitas` (
  `id_info_visitas` VARCHAR(50) NOT NULL,
  `fecha_visita` VARCHAR(45) NULL,
  `cedula_cliente` VARCHAR(45) NULL,
  `motivo_visita` VARCHAR(45) NULL,
  `id_inmueble` VARCHAR(45) NULL,
  `cedula_asesor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_info_visitas`),
  INDEX `fk_tb_info_visitas_tb_asesor1_idx` (`cedula_asesor` ASC) VISIBLE,
  INDEX `fk_tb_info_visitas_tb_inmueble1_idx` (`id_inmueble` ASC) VISIBLE,
  INDEX `fk_tb_info_visitas_tb_cliente1_idx` (`cedula_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tb_info_visitas_tb_asesor1`
    FOREIGN KEY (`cedula_asesor`)
    REFERENCES `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_info_visitas_tb_inmueble1`
    FOREIGN KEY (`id_inmueble`)
    REFERENCES `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_info_visitas_tb_cliente1`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_datos_inmobiliaria`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('Arrendamientos veracruz', 'Cr 12 #33 12, antioquia', 'veracruz@gmail.com', 'veracruzarrendamientos.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('Santafe', 'Cr 49 #33-12, Medellin', 'santafe@gmail.com', 'santafearrendamientos.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('Lucho', 'Cr 10 #12-22 sur', 'lucho@gmail.com', 'luchoarrendamientos.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('richofercho', 'Cra 20 12 12', 'richofercho@gmail.com', 'luchofercho.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('arrendamientos suarez', 'Robledo', 'suaresa@gmail.com', 'suarez.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('Sofkainmuebles', 'Poblado', 'sofkai@gmail.com', 'sofkainmuebles.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('c-latengo arrendamientos', 'Sur 20', 'clatengo@gmail.com', 'clatengo@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('hospi max', 'Cra 80 #30-22', 'hospimax@gmail.com', 'hm@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('billiejoel arrendamientos', '33 # 11a - 20', 'billiea@gmail.com', 'ba@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_datos_inmobiliaria` (`nombre_inmobiliaria`, `direccion_inmobiliaria`, `correo_inmobiliaria`, `pagina_web_inmobiliaria`) VALUES ('sims cuadras', 'Cll 10 20 30', 'simsq@gmail.com', 'sims3q@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_telefono_inmobiliaria`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Arrendamientos veracruz', '12123131231');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Santafe', '123123123213123');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Lucho', '1231231231231344');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('c-latengo arrendamientos', '4444444444444');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('hospi max', '231213213');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('billiejoel arrendamientos', '8888888888');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('billiejoel arrendamientos', '9999999990');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Lucho', '1212313123123');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Arrendamientos veracruz', '1123132132333999');
INSERT INTO `db_inmobiliaria`.`tb_telefono_inmobiliaria` (`nombre_inmobiliaria`, `telefono`) VALUES ('Santafe', '333333333333333');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_asesor`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111111', 'San juan', '1000000', '12938721983721', 'asesor1@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111112', 'San martin', '1000000', '129382183u2130', 'asesor2@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111113', 'San pedro', '1000000', '12321321321123', 'asesor3@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111114', 'San marcos', '1000000', '494949494', 'asesor4@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111115', 'Joan de arc', '1000000', '49447847474', 'asesor5@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111116', 'Gonzalo', '1000000', '1231234213123', 'asesor6@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111117', 'Grey', '1000000', '1231232142144', 'asesor7@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111118', 'Blue', '1000000', '4398494587547895', 'asesor8@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111119', 'Dos tres', '1000000', '12309218039218', 'asesor9@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_asesor` (`cedula_asesor`, `nombre_asesor`, `salario_asesor`, `telefono_asesor`, `correo_asesor`) VALUES ('11111111120', 'Phill heat', '1000000', '12309190238', 'asesor10@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_propietario`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111111', 'Alberto', 'alberto@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111112', 'Rodrigo', 'rodrigo@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111113', 'Susan', 'susan20@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111114', 'Margarita', 'margarita@gmai.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111115', 'Juan', 'juan@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111116', 'Pedro', 'pedro@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111117', 'Steven', 'steven@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111118', 'Johan', 'johan@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111119', 'Carlos', 'carlos@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_propietario` (`cedula`, `nombre_propietario`, `correo_propietario`) VALUES ('111111120', 'San martin', 'san_martin@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_inmueble`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('19e701e4-aa98', '2', '100', '2', 'Antioquia', 'Medellin', 'Robledo', '4404040', 'Sur', '110000000', '1000000', 'N', 'si', '1000000', '111111111');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('19e701e4-aa91', '1', '80', '4', 'Antioquia', 'Medellin', 'Poblado', '19818181', 'AA', '220000000', '1200000', 'N', 'si', '1000000', '111111112');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('19e701e4-aa92', '2', '100', '6', 'Antioquia', 'Medellin', 'San javier', '18181810', 'Int 20', '140000000', '2500000', 'N', 'si', '1000000', '111111113');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('19e701e4-aa94', '3', '90', '7', 'Antioquia', 'Medellin', 'Laureles', '00010101', 'Int 20', '200000000', '1850000', 'N', 'si', '1000000', '111111114');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('2e76129e-aa98', '1', '110', '1', 'Antioquia', 'Medellin', 'Centro', '28387340', 'BB', '340000000', '950000', 'N', 'si', '1000000', '111111115');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('2e76129e-aa12', '1', '200', '3', 'Antioquia', 'Medellin', 'Prado', '27282823', 'Int 330', '120000000', '1050000', 'N', 'si', '1000000', '111111116');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('2e76129e-aa13', '1', '400', '4', 'Antioquia', 'Medellin', 'Parque berrio', '1818377', 'Int 110', '450000000', '930000', 'N', 'si', '1000000', '111111117');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('2e76129e-ae23', '1', '200', '3', 'Antioquia', 'Medellin', 'Robledo', '10101010', 'Segundo piso', '150000000', '2600000', 'N', 'si', '1000000', '111111118');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('2e76129e-aa10', '1', '60', '3', 'Antioquia', 'Medellin', 'Poblado', '10173733', 'Sur', '200000000', '1850000', 'N', 'si', '1000000', '111111111');
INSERT INTO `db_inmobiliaria`.`tb_inmueble` (`id_inmueble`, `piso_inmueble`, `area_inmueble`, `estrato_inmueble`, `departamento_direccion`, `ciudad_direccion`, `barrio_direccion`, `codigo_postal_direccion`, `complemento_direccion`, `precio_venta_inmueble`, `precio_alquiler_inmueble`, `estado_inmueble`, `disponibilidad_inmueble`, `precio_propietario_inmueble`, `cedula_propietario`) VALUES ('45949504-aa98', '2', '30', '2', 'Antioquia', 'Medellin', 'Santa lucia', '19010100', 'Norte', '90000000', '3000000', 'N', 'si', '1000000', '111111111');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_telefono_propietario`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111111', '8382838282');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111112', '48494493838');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111113', '282838383838');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111114', '3737373737373');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111111', '3635435435');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111115', '46644646646');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111116', '89999999999');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111117', '4646464646');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111118', '101919118383');
INSERT INTO `db_inmobiliaria`.`tb_telefono_propietario` (`id_propietario`, `telefono`) VALUES ('111111119', '811818181818');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222210', 'Joan da art', '2000000', 'si', 'Cra 88 # 33-20', 'jda@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222211', 'Mona crespa', '4000000', 'si', 'Cll 12 ', 'mc@yahoo.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222212', 'Giorgie', '1000000', 'si', 'Cll 11', 'giorgie@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222213', 'Luffy', '1200000', 'si', 'call 12', 'thepking@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222214', 'Pasquino', '1230000', 'si', 'Cra 38392', 'pasqui@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222215', 'Minuto', '2000000', 'si', 'Cra 7668', 'segundo@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222216', 'Transito', '1800000', 'si', 'Robledo', 'dineros@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222217', 'Saturnino', '2000000', 'si', 'Laureles', 'espacio@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222218', 'Dani', '900000', 'si', 'Floresa', 'Dani@gmail.com');
INSERT INTO `db_inmobiliaria`.`tb_cliente` (`cedula_cliente`, `nombre_cliente`, `ingresos_cliente`, `habilitado`, `direccion`, `correo_electronico_cliente`) VALUES ('22222222219', 'Afro', '870000', 'si', 'Estadio', 'mipana@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_telefono_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222210', '12312323213');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222211', '12321312123');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222212', '8484848484');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222213', '115151515151');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222214', '9898989898');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222215', '88998876666');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222216', '181818273782378');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222217', '123123123123111');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222218', '1111111111111');
INSERT INTO `db_inmobiliaria`.`tb_telefono_cliente` (`telefono_cliente`, `cedula_cliente`) VALUES ('22222222219', '22222222222');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_compra`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_compra` (`id_compra`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('1', '1100000', '22222222210', '19e701e4-aa98', '11111111111', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_compra` (`id_compra`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('2', '1200000', '22222222211', '19e701e4-aa91', '11111111112', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_compra` (`id_compra`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('3', '1250000', '22222222212', '19e701e4-aa92', '11111111112', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_compra` (`id_compra`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('4', '1400000', '22222222213', '19e701e4-aa94', '11111111112', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_compra` (`id_compra`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('5', '1600000', '22222222214', '2e76129e-aa98', '11111111111', 'Arrendamientos veracruz');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_alquiler`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_alquiler` (`id_alquieler`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('1', '1000000', '22222222215', '2e76129e-aa12', '11111111116', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_alquiler` (`id_alquieler`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('2', '2000000', '22222222216', '2e76129e-aa13', '11111111118', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_alquiler` (`id_alquieler`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('3', '2500000', '22222222217', '2e76129e-ae23', '11111111112', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_alquiler` (`id_alquieler`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('4', '1800000', '22222222218', '2e76129e-aa10', '11111111118', 'Arrendamientos veracruz');
INSERT INTO `db_inmobiliaria`.`tb_alquiler` (`id_alquieler`, `valor`, `cedula_cliente`, `id_inmueble`, `cedula_asesor`, `nombre_inmobiliaria`) VALUES ('5', '1200000', '22222222219', '45949504-aa98', '11111111111', 'Arrendamientos veracruz');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_inmobiliaria`.`tb_info_visitas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_inmobiliaria`;
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('1', '2023-03-01', '22222222210', 'Conocer casa', '19e701e4-aa98', '11111111111');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('2', '2023-03-02', '22222222211', 'Conocer casa', '19e701e4-aa91', '11111111112');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('3', '2023-03-03', '22222222212', 'Conocer casa', '19e701e4-aa92', '11111111113');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('4', '2023-03-04', '22222222213', 'Conocer casa', '19e701e4-aa94', '11111111112');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('5', '2023-03-01', '22222222214', 'Conocer casa', '2e76129e-aa98', '11111111111');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('6', '2023-03-01', '22222222210', 'Conocer casa', '2e76129e-aa12', '11111111111');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('7', '2023-03-02', '22222222212', 'Conocer casa', '2e76129e-aa13', '11111111112');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('8', '2023-03-04', '22222222214', 'Conocer casa', '2e76129e-ae23', '11111111112');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('9', '2023-03-02', '22222222211', 'Conocer casa', '2e76129e-aa10', '11111111118');
INSERT INTO `db_inmobiliaria`.`tb_info_visitas` (`id_info_visitas`, `fecha_visita`, `cedula_cliente`, `motivo_visita`, `id_inmueble`, `cedula_asesor`) VALUES ('10', '2023-03-01', '22222222218', 'Conocer casa', '45949504-aa98', '11111111111');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
