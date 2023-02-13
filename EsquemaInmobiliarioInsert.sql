CREATE DATABASE  IF NOT EXISTS `inmobiliaria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inmobiliaria`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: inmobiliaria
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler` (
  `idalquiler` int NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `costo_alquiler` decimal(10,2) DEFAULT NULL,
  `estado` enum('vigente','finalizado','renovado') DEFAULT NULL,
  `coemntarios` varchar(255) DEFAULT NULL,
  `Asesor_cedula` varchar(12) NOT NULL,
  `DatosInmobiliaria_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idalquiler`),
  KEY `fk_alquiler_Asesor1_idx` (`Asesor_cedula`),
  KEY `fk_alquiler_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre`),
  CONSTRAINT `fk_alquiler_Asesor1` FOREIGN KEY (`Asesor_cedula`) REFERENCES `asesor` (`cedula`),
  CONSTRAINT `fk_alquiler_DatosInmobiliaria1` FOREIGN KEY (`DatosInmobiliaria_nombre`) REFERENCES `datosinmobiliaria` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (1,'2023-02-10 12:30:15','2023-02-10 12:30:15',50000.00,'vigente','MUY BUEN ESTADO','1010101010','Inmo1'),(2,'2020-01-01 00:00:00','2020-01-01 23:59:59',1000000.00,'finalizado','PERFECTO ESTADO','2020202020','Inmo1'),(3,'2021-03-01 10:30:00','2021-03-01 12:15:00',1542500.00,'vigente','NUEVO','3030303030','Inmo1'),(4,'2022-05-15 08:00:00','2022-05-15 17:00:00',500000.00,'finalizado','PARA REMODELAR','4040404040','Inmo1'),(5,'2022-12-31 00:00:00','2022-12-31 23:59:59',600000.00,'vigente','SOLO EL LOTE','5050505050','Inmo1'),(6,'2023-02-10 09:00:00','2023-02-10 17:30:00',800000.00,'vigente','NUEVO','1010101010','Inmo1');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor`
--

DROP TABLE IF EXISTS `asesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesor` (
  `cedula` varchar(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor`
--

LOCK TABLES `asesor` WRITE;
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` VALUES ('1010101010','Luis Garcia',5000.00,'luis@example.com'),('1020','yeison',600000.00,'shc'),('2020202020','Miguel Hernandez',6000.00,'miguel@example.com'),('3030303030','Karla Rodriguez',7000.00,'karla@example.com'),('4040404040','Luz Maria',800.00,'luz@example.com'),('5050505050','Manuel Perez',9000.00,'manuel@example.com');
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `ingresos` decimal(15,2) DEFAULT NULL,
  `habilitado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('0123456789','Pedro Martinez','pedro@example.com',60000.00,'no'),('1098765432','María Rodriguez','maria@example.com',40000.00,'si'),('1234567890','Juan Perez','juan@example.com',50000.00,'si'),('6789012345','Jorge Martinez','jorge@example.com',45000.00,'no'),('9876543210','Sofía Gomez','sofia@example.com',55000.00,'si');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_alquiler`
--

DROP TABLE IF EXISTS `cliente_alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_alquiler` (
  `cliente_cedula` varchar(12) NOT NULL,
  `alquiler_idalquiler` int NOT NULL,
  PRIMARY KEY (`cliente_cedula`,`alquiler_idalquiler`),
  KEY `fk_Cliente_alquiler_cliente1_idx` (`cliente_cedula`),
  KEY `fk_Cliente_alquiler_alquiler1_idx` (`alquiler_idalquiler`),
  CONSTRAINT `fk_Cliente_alquiler_alquiler1` FOREIGN KEY (`alquiler_idalquiler`) REFERENCES `alquiler` (`idalquiler`),
  CONSTRAINT `fk_Cliente_alquiler_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_alquiler`
--

LOCK TABLES `cliente_alquiler` WRITE;
/*!40000 ALTER TABLE `cliente_alquiler` DISABLE KEYS */;
INSERT INTO `cliente_alquiler` VALUES ('0123456789',1),('1098765432',2),('1234567890',3),('6789012345',4),('9876543210',5);
/*!40000 ALTER TABLE `cliente_alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_compra`
--

DROP TABLE IF EXISTS `cliente_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_compra` (
  `cliente_cedula` varchar(12) NOT NULL,
  `compra_idcompra` int NOT NULL,
  PRIMARY KEY (`cliente_cedula`,`compra_idcompra`),
  KEY `fk_Cliente_compra_cliente1_idx` (`cliente_cedula`),
  KEY `fk_Cliente_compra_compra1_idx` (`compra_idcompra`),
  CONSTRAINT `fk_Cliente_compra_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_Cliente_compra_compra1` FOREIGN KEY (`compra_idcompra`) REFERENCES `compra` (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_compra`
--

LOCK TABLES `cliente_compra` WRITE;
/*!40000 ALTER TABLE `cliente_compra` DISABLE KEYS */;
INSERT INTO `cliente_compra` VALUES ('0123456789',1),('1098765432',2),('1234567890',3),('6789012345',4),('9876543210',5);
/*!40000 ALTER TABLE `cliente_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_info_visita`
--

DROP TABLE IF EXISTS `cliente_info_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_info_visita` (
  `cliente_cedula` varchar(12) NOT NULL,
  `info_visita_idinfo_visita` int NOT NULL,
  PRIMARY KEY (`cliente_cedula`,`info_visita_idinfo_visita`),
  KEY `fk_Cliente_info_visita_cliente1_idx` (`cliente_cedula`),
  KEY `fk_Cliente_info_visita_info_visita1_idx` (`info_visita_idinfo_visita`),
  CONSTRAINT `fk_Cliente_info_visita_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_Cliente_info_visita_info_visita1` FOREIGN KEY (`info_visita_idinfo_visita`) REFERENCES `info_visita` (`idinfo_visita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_info_visita`
--

LOCK TABLES `cliente_info_visita` WRITE;
/*!40000 ALTER TABLE `cliente_info_visita` DISABLE KEYS */;
INSERT INTO `cliente_info_visita` VALUES ('0123456789',1),('1098765432',2),('1234567890',3),('6789012345',4),('9876543210',5);
/*!40000 ALTER TABLE `cliente_info_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idcompra` int NOT NULL,
  `precio_compra` decimal(15,2) DEFAULT NULL,
  `Asesor_cedula` varchar(12) NOT NULL,
  `DatosInmobiliaria_nombre` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `fk_compra_Asesor1_idx` (`Asesor_cedula`),
  KEY `fk_compra_DatosInmobiliaria1_idx` (`DatosInmobiliaria_nombre`),
  CONSTRAINT `fk_compra_Asesor1` FOREIGN KEY (`Asesor_cedula`) REFERENCES `asesor` (`cedula`),
  CONSTRAINT `fk_compra_DatosInmobiliaria1` FOREIGN KEY (`DatosInmobiliaria_nombre`) REFERENCES `datosinmobiliaria` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,200000.00,'1010101010','Inmo1','2023-01-01','se compra la casa grande'),(2,50000.00,'1020','Inmo1','2023-01-01','se compra la casa grande'),(3,500000.00,'2020202020','Inmo1','2023-01-01','se compra la casa grande'),(4,100000.00,'3030303030','Inmo1','2023-01-01','se compra la casa grande'),(5,350000.00,'4040404040','Inmo1','2023-01-01','se compra la casa grande');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosinmobiliaria`
--

DROP TABLE IF EXISTS `datosinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosinmobiliaria` (
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `pagina_web` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosinmobiliaria`
--

LOCK TABLES `datosinmobiliaria` WRITE;
/*!40000 ALTER TABLE `datosinmobiliaria` DISABLE KEYS */;
INSERT INTO `datosinmobiliaria` VALUES ('Inmo1','Dirección 1','inmo1@example.com','www.inmo1.com'),('Inmo2','Dirección 2','inmo2@example.com','www.inmo2.com'),('Inmo3','Dirección 3','inmo3@example.com','www.inmo3.com'),('Inmo4','Dirección 4','inmo4@example.com','www.inmo4.com'),('Inmo5','Dirección 5','inmo5@example.com','www.inmo5.com');
/*!40000 ALTER TABLE `datosinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto` (
  `foto` varchar(100) NOT NULL,
  `inmueble_idinmueble` varchar(15) NOT NULL,
  PRIMARY KEY (`foto`),
  KEY `fk_Foto_inmueble1_idx` (`inmueble_idinmueble`),
  CONSTRAINT `fk_Foto_inmueble1` FOREIGN KEY (`inmueble_idinmueble`) REFERENCES `inmueble` (`idinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto`
--

LOCK TABLES `foto` WRITE;
/*!40000 ALTER TABLE `foto` DISABLE KEYS */;
INSERT INTO `foto` VALUES ('ssdvsdvsdcv','1'),('dsdcsdcasdc','2'),('scfsdcvsdcsdc','2'),('sdsdcvsdcsd','3'),('sdvfsdvsdvd','4');
/*!40000 ALTER TABLE `foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_visita`
--

DROP TABLE IF EXISTS `info_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_visita` (
  `idinfo_visita` int NOT NULL,
  `fecha_visita` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `Asesor_cedula` varchar(12) NOT NULL,
  PRIMARY KEY (`idinfo_visita`),
  KEY `fk_info_visita_Asesor1_idx` (`Asesor_cedula`),
  CONSTRAINT `fk_info_visita_Asesor1` FOREIGN KEY (`Asesor_cedula`) REFERENCES `asesor` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_visita`
--

LOCK TABLES `info_visita` WRITE;
/*!40000 ALTER TABLE `info_visita` DISABLE KEYS */;
INSERT INTO `info_visita` VALUES (1,'2023-02-10 12:30:15','2023-02-10 12:30:15','visita de alquiler o compra','1010101010'),(2,'2020-01-01 00:00:00','2020-01-01 23:59:59','viista para ompra asegurda','2020202020'),(3,'2021-03-01 10:30:00','2021-03-01 12:15:00','Reunión de clientes potenciales','4040404040'),(4,'2022-05-15 08:00:00','2022-05-15 17:00:00','Reunión de clientes potenciales','2020202020'),(5,'2022-12-31 00:00:00','2022-12-31 23:59:59','Reunión de clientes potenciales','3030303030');
/*!40000 ALTER TABLE `info_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble` (
  `idinmueble` varchar(15) NOT NULL,
  `disponibilidad` enum('SI','NO') DEFAULT NULL,
  `precioPropietario` decimal(15,2) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `precio_alquiler` decimal(15,2) DEFAULT NULL,
  `estado` enum('nuevo','segunda','remodelado') DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `cuidad` varchar(45) DEFAULT NULL,
  `comuna/barrio` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `precio_venta` decimal(15,2) DEFAULT NULL,
  `alquiler_idalquiler` int NOT NULL,
  `info_visita_idinfo_visita` int NOT NULL,
  `compra_idcompra` int NOT NULL,
  `propietario_cedula` varchar(12) NOT NULL,
  PRIMARY KEY (`idinmueble`),
  KEY `fk_Inmueble_alquiler1_idx` (`alquiler_idalquiler`),
  KEY `fk_Inmueble_info_visita1_idx` (`info_visita_idinfo_visita`),
  KEY `fk_Inmueble_compra1_idx` (`compra_idcompra`),
  KEY `fk_Inmueble_propietario1_idx` (`propietario_cedula`),
  CONSTRAINT `fk_Inmueble_alquiler1` FOREIGN KEY (`alquiler_idalquiler`) REFERENCES `alquiler` (`idalquiler`),
  CONSTRAINT `fk_Inmueble_compra1` FOREIGN KEY (`compra_idcompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `fk_Inmueble_info_visita1` FOREIGN KEY (`info_visita_idinfo_visita`) REFERENCES `info_visita` (`idinfo_visita`),
  CONSTRAINT `fk_Inmueble_propietario1` FOREIGN KEY (`propietario_cedula`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` VALUES ('1','SI',100000.00,'CALLE 23','CASA GRANDE','1',50.00,20000.00,'nuevo','NORTE DE SANTANDER','CUCUTA','COMUNA 6','540010','COMPLE1',1200000.00,1,1,1,'123-456-789'),('2','SI',20000.00,'Avenida de los Sueños, 456','Casa de campo encantadora con vistas al campo','2',48.00,1000000.00,'nuevo','antioquia','medellin','13','541000','complemento 1',500000.00,1,1,1,'456-789-012'),('3','NO',50000.00,'Plaza de los Deseos, 789','Espectacular loft con techos altos y vistas panorámicas.','3',90.00,800000.00,'nuevo','cundinamarca','bogota','1','541000','complemento 1',80000.00,1,1,1,'456-789-012'),('4','SI',7000.00,'Paseo de la Ilusión, 321','Casa unifamiliar con jardín y piscina en una zona residencial tranquila','2',100.00,700000.00,'nuevo','norte de santander','cucuta','5','541000','complemento 1',700000.00,1,1,1,'456-789-012'),('A01','SI',100000.00,'Calle de las Estrellas, 123','Hermoso apartamento de 1 habitación en pleno corazón de la ciudad. Ideal para parejas o solteros.','1',50.00,600000.00,'nuevo','no aplica','medellin','6','541000','complemento 1',20000000.00,1,1,1,'123-456-789');
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `cedula` varchar(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES ('123-456-789','Juan Pérez',' juanperez@email.com'),('234-567-890','Maria García','mariagarcia@email.com'),('345-678-901',' Carlos Sánchez','carlossanchez@email.com'),('456-789-012','Ana Rodriguez','anarodriguez@email.com'),('567-890-123','Luis Martinez','luismartinez@email.com');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `propietario_cedula` varchar(12) NOT NULL,
  `numero` varchar(45) NOT NULL,
  PRIMARY KEY (`propietario_cedula`,`numero`),
  KEY `fk_Telefono_propietario1_idx` (`propietario_cedula`),
  CONSTRAINT `fk_Telefono_propietario1` FOREIGN KEY (`propietario_cedula`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('123-456-789','147252752'),('234-567-890','2578414724'),('345-678-901','87147141'),('456-789-012','31315414'),('567-890-123','3169154');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonoasesor`
--

DROP TABLE IF EXISTS `telefonoasesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonoasesor` (
  `cedula_asesor` varchar(12) NOT NULL,
  `numero` varchar(12) NOT NULL,
  PRIMARY KEY (`cedula_asesor`,`numero`),
  KEY `fk_TelefonoAsesor_Asesor1_idx` (`cedula_asesor`),
  CONSTRAINT `fk_cedula_asesor` FOREIGN KEY (`cedula_asesor`) REFERENCES `asesor` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonoasesor`
--

LOCK TABLES `telefonoasesor` WRITE;
/*!40000 ALTER TABLE `telefonoasesor` DISABLE KEYS */;
INSERT INTO `telefonoasesor` VALUES ('1010101010','3138514587'),('1020','165151'),('2020202020','32015485'),('3030303030','31057841'),('4040404040','31087984');
/*!40000 ALTER TABLE `telefonoasesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonocliente`
--

DROP TABLE IF EXISTS `telefonocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonocliente` (
  `cliente_cedula` varchar(12) NOT NULL,
  `numero` varchar(12) NOT NULL,
  PRIMARY KEY (`cliente_cedula`,`numero`),
  KEY `fk_Telefono_cliente1_idx` (`cliente_cedula`),
  CONSTRAINT `fk_Telefono_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonocliente`
--

LOCK TABLES `telefonocliente` WRITE;
/*!40000 ALTER TABLE `telefonocliente` DISABLE KEYS */;
INSERT INTO `telefonocliente` VALUES ('0123456789','35145545'),('1098765432','1581451'),('1234567890','6126961'),('6789012345','6169144'),('9876543210','3251481');
/*!40000 ALTER TABLE `telefonocliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 19:11:15
