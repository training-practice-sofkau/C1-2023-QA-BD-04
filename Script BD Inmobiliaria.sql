-- -----------------------------------------------------
-- Table `inmobiliaria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`cliente` (
  `cedula` VARCHAR(14) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ingresos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefonoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefonoCliente` (
  `telefono` VARCHAR(12) NOT NULL,
  `cedulaCliente` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cedulaCliente`),
    FOREIGN KEY (`cedulaCliente`) REFERENCES `inmobiliaria`.`cliente` (`cedula`)
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`asesor` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` DOUBLE NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `inmobiliaria`.`propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`propietario` (
  `id` INT NOT NULL,
  `cedula` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmueble` (
  `id` INT NOT NULL,
  `idPropietario` INT NOT NULL,
  `precioPropietario` DOUBLE NOT NULL,
  `precioAlquiler` DOUBLE NOT NULL,
  `precioVenta` DOUBLE NOT NULL,
  `estado` VARCHAR(12) NULL,
  `estrato` VARCHAR(1) NULL,
  `area` DOUBLE NULL,
  `piso` DOUBLE NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`idPropietario`) REFERENCES `inmobiliaria`.`propietario` (`id`)
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`fotoInmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`fotoInmueble` (
  `foto` VARCHAR(45) NOT NULL,
  `idInmueble` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
    FOREIGN KEY (`idInmueble`) REFERENCES `inmobiliaria`.`inmueble` (`id`)
    )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `inmobiliaria`.`direccionInmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`direccionInmueble` (
  `departamento` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `comuna` VARCHAR(45) NOT NULL,
  `barrio` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `idInmueble` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
    FOREIGN KEY (`idInmueble`) REFERENCES `inmobiliaria`.`inmueble` (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `inmobiliaria`.`telefonoPropietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`telefonoPropietario` (
  `telefono` VARCHAR(12) NOT NULL,
  `idPropietario` INT NOT NULL,
  PRIMARY KEY (`idPropietario`),
    FOREIGN KEY (`idPropietario`)
    REFERENCES `inmobiliaria`.`propietario` (`id`)
    )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `inmobiliaria`.`inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`inmobiliaria` (
  `NIT` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `paginaWeb` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`compra` (
  `id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idInmueble` INT NOT NULL,
  `idInmobiliaria` INT NOT NULL,
  `idAsesor` INT NOT NULL,
  `idCliente` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`idInmueble`) REFERENCES `inmobiliaria`.`inmueble` (`id`),
    FOREIGN KEY (`idInmobiliaria`) REFERENCES `inmobiliaria`.`inmobiliaria` (`NIT`),    
    FOREIGN KEY (`idAsesor`) REFERENCES `inmobiliaria`.`asesor` (`cedula`),
    FOREIGN KEY (`idCliente`) REFERENCES `inmobiliaria`.`cliente` (`cedula`),
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`alquiler` (
  `id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `idInmueble` INT NOT NULL,
  `idInmobiliaria` INT NOT NULL,
  `idAsesor` INT NOT NULL,
  `idCliente` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`idInmueble`) REFERENCES `inmobiliaria`.`inmueble` (`id`),
    FOREIGN KEY (`idInmobiliaria`) REFERENCES `inmobiliaria`.`inmobiliaria` (`NIT`),
    FOREIGN KEY (`idAsesor`)  REFERENCES `inmobiliaria`.`asesor` (`cedula`),
    FOREIGN KEY (`idCliente`) REFERENCES `inmobiliaria`.`cliente` (`cedula`),
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `inmobiliaria`.`infovisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliaria`.`infovisitas` (
  `id` INT NOT NULL,
  `fecha` DATE NULL,
  `IdAsesor` INT NOT NULL,
  `IdInmueble` INT NOT NULL,
  `idCliente` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`IdAsesor`) REFERENCES `inmobiliaria`.`asesor` (`cedula`),
    FOREIGN KEY (`IdInmueble`) REFERENCES `inmobiliaria`.`inmueble` (`id`),
    FOREIGN KEY (`idCliente`) REFERENCES `inmobiliaria`.`cliente` (`cedula`),
    )
ENGINE = InnoDB;
