CREATE DATABASE  IF NOT EXISTS `inmobiliariabd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inmobiliariabd`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inmobiliariabd
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
  `idAlquiler` varchar(20) NOT NULL,
  `cedulaAsesor_alquiler` varchar(15) NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  KEY `cedulaAsesor_alquiler_idx` (`cedulaAsesor_alquiler`),
  CONSTRAINT `cedulaAsesor_alquiler` FOREIGN KEY (`cedulaAsesor_alquiler`) REFERENCES `asesor` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES ('00001','1001523547'),('00002','1077452113'),('00003','1122653120'),('00004','1896425'),('00005','3041117');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler_cliente`
--

DROP TABLE IF EXISTS `alquiler_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler_cliente` (
  `idAlquiler_cliente` varchar(20) NOT NULL,
  `cedulaCliente_alquiler` varchar(15) NOT NULL,
  PRIMARY KEY (`idAlquiler_cliente`,`cedulaCliente_alquiler`),
  KEY `cedulaCliente_alquiler_idx` (`cedulaCliente_alquiler`),
  CONSTRAINT `cedulaCliente_alquiler` FOREIGN KEY (`cedulaCliente_alquiler`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `idAlquiler_cliente` FOREIGN KEY (`idAlquiler_cliente`) REFERENCES `alquiler` (`idAlquiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_cliente`
--

LOCK TABLES `alquiler_cliente` WRITE;
/*!40000 ALTER TABLE `alquiler_cliente` DISABLE KEYS */;
INSERT INTO `alquiler_cliente` VALUES ('00001','1080567410'),('00002','1094928323'),('00003','1256317488'),('00004','712485'),('00005','763895');
/*!40000 ALTER TABLE `alquiler_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler_dinmobiliaria`
--

DROP TABLE IF EXISTS `alquiler_dinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler_dinmobiliaria` (
  `nombreInmobiliaria_alquiler` varchar(45) NOT NULL,
  `idAlquiler_inmobiliaria` varchar(20) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria_alquiler`,`idAlquiler_inmobiliaria`),
  KEY `idAlquiler_inmobiliaria_idx` (`idAlquiler_inmobiliaria`),
  CONSTRAINT `idAlquiler_inmobiliaria` FOREIGN KEY (`idAlquiler_inmobiliaria`) REFERENCES `alquiler` (`idAlquiler`),
  CONSTRAINT `nombreInmobiliaria_alquiler` FOREIGN KEY (`nombreInmobiliaria_alquiler`) REFERENCES `datosinmobiliaria` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_dinmobiliaria`
--

LOCK TABLES `alquiler_dinmobiliaria` WRITE;
/*!40000 ALTER TABLE `alquiler_dinmobiliaria` DISABLE KEYS */;
INSERT INTO `alquiler_dinmobiliaria` VALUES ('Inmobiliaria Raul Mejia','00001'),('Inmobiliaria Raul Mejia','00002'),('Inmobiliaria Raul Mejia','00003'),('Inmobiliaria Raul Mejia','00004'),('Inmobiliaria Raul Mejia','00005');
/*!40000 ALTER TABLE `alquiler_dinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor`
--

DROP TABLE IF EXISTS `asesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesor` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `salario` float NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor`
--

LOCK TABLES `asesor` WRITE;
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` VALUES ('1001523547','Saida Raya',1160000,'3124123548','asesor3@inmueblesraulmejia.com'),('1077452113','Felisa Porras',1160000,'3217770512','asesor2@inmueblesraulmejia.com'),('1122653120','Aya Barros',1160000,'3137962485','asesor1@inmueblesraulmejia.com'),('1896425','Adrian Reina',1160000,'3207568996','asesor4@inmueblesraulmejia.com'),('3041117','Paz Godoy',1160000,'3124111102','asesor5@inmueblesraulmejia.com');
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `habilitado` varchar(45) NOT NULL,
  `ingresos` float NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1080567410','Bernardino Viera','viera123@outlook.com','Maria Cristina etapa 1 bl 11 apto 304','Si',2500000),('1094928323','Juan Andres Escribano','juan11andrea@gmail.com','Las Colinas casa F # 14','Si',1160000),('1256317488','Gustavo Molina','molinagustavo@gmail.com','Alfonso Lopez casa h # 22','Si',1800000),('712485','Edgar Tomas','edgartomas@gmail.com','San Juan de Loma bl 12 apto 701','Si',4500000),('763895','Delfina Pino','delfinapino1960@hotmail.com','La Castellana casa e # 2','Si',5700000);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCompra` varchar(20) NOT NULL,
  `cedulaAsesor_compra` varchar(15) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `cedulaAsesor_compra_idx` (`cedulaAsesor_compra`),
  CONSTRAINT `cedulaAsesor_compra` FOREIGN KEY (`cedulaAsesor_compra`) REFERENCES `asesor` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('00001','1001523547'),('00002','1077452113'),('00003','1122653120'),('00004','1896425'),('00005','3041117');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_cliente`
--

DROP TABLE IF EXISTS `compra_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_cliente` (
  `idCompra_cliente` varchar(20) NOT NULL,
  `cedulaCliente_compra` varchar(15) NOT NULL,
  PRIMARY KEY (`idCompra_cliente`,`cedulaCliente_compra`),
  KEY `cedulaCliente_compra_idx` (`cedulaCliente_compra`),
  CONSTRAINT `cedulaCliente_compra` FOREIGN KEY (`cedulaCliente_compra`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `idCompra_cliente` FOREIGN KEY (`idCompra_cliente`) REFERENCES `compra` (`idCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_cliente`
--

LOCK TABLES `compra_cliente` WRITE;
/*!40000 ALTER TABLE `compra_cliente` DISABLE KEYS */;
INSERT INTO `compra_cliente` VALUES ('00001','1080567410'),('00002','1094928323'),('00003','1256317488'),('00004','712485'),('00005','763895');
/*!40000 ALTER TABLE `compra_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_dinmobiliaria`
--

DROP TABLE IF EXISTS `compra_dinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_dinmobiliaria` (
  `nombreInmobiliaria_compra` varchar(45) NOT NULL,
  `idCompra_inmobiliaria` varchar(20) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria_compra`,`idCompra_inmobiliaria`),
  KEY `idCompra_inmobiliaria_idx` (`idCompra_inmobiliaria`),
  CONSTRAINT `idCompra_inmobiliaria` FOREIGN KEY (`idCompra_inmobiliaria`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `nombreInmobiliaria_compra` FOREIGN KEY (`nombreInmobiliaria_compra`) REFERENCES `datosinmobiliaria` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_dinmobiliaria`
--

LOCK TABLES `compra_dinmobiliaria` WRITE;
/*!40000 ALTER TABLE `compra_dinmobiliaria` DISABLE KEYS */;
INSERT INTO `compra_dinmobiliaria` VALUES ('Inmobiliaria Raul Mejia','00001'),('Inmobiliaria Raul Mejia','00002'),('Inmobiliaria Raul Mejia','00003'),('Inmobiliaria Raul Mejia','00004'),('Inmobiliaria Raul Mejia','00005');
/*!40000 ALTER TABLE `compra_dinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosinmobiliaria`
--

DROP TABLE IF EXISTS `datosinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosinmobiliaria` (
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `paginaWeb` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosinmobiliaria`
--

LOCK TABLES `datosinmobiliaria` WRITE;
/*!40000 ALTER TABLE `datosinmobiliaria` DISABLE KEYS */;
INSERT INTO `datosinmobiliaria` VALUES ('Inmobiliaria Raul Mejia','Cra 14 # 22-23','inmobiliariaraulmejia@raulmejia.com','www.inmobiliariaraulmejia.com');
/*!40000 ALTER TABLE `datosinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `idInmueble_fotos` varchar(45) NOT NULL,
  `fotos` varchar(50) NOT NULL,
  PRIMARY KEY (`idInmueble_fotos`),
  CONSTRAINT `idInmuebleFotos` FOREIGN KEY (`idInmueble_fotos`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES ('0000001','sala, comedor, cocina, baño(s), habitaciones'),('0000002','sala, comedor, cocina, baño(s), habitaciones'),('0000003','sala, comedor, cocina, baño(s), habitaciones'),('0000004','sala, comedor, cocina, baño(s), habitaciones'),('0000005','sala, comedor, cocina, baño(s), habitaciones');
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infovisitas`
--

DROP TABLE IF EXISTS `infovisitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infovisitas` (
  `numeroVisita` int NOT NULL,
  `cedulaAsesor_visita` varchar(15) NOT NULL,
  PRIMARY KEY (`numeroVisita`),
  KEY `cedulaAsesor_visita_idx` (`cedulaAsesor_visita`),
  CONSTRAINT `cedulaAsesor_visita` FOREIGN KEY (`cedulaAsesor_visita`) REFERENCES `asesor` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infovisitas`
--

LOCK TABLES `infovisitas` WRITE;
/*!40000 ALTER TABLE `infovisitas` DISABLE KEYS */;
INSERT INTO `infovisitas` VALUES (1,'1001523547'),(2,'1077452113'),(3,'1122653120'),(4,'1896425'),(5,'3041117');
/*!40000 ALTER TABLE `infovisitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infovisitas_cliente`
--

DROP TABLE IF EXISTS `infovisitas_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infovisitas_cliente` (
  `numeroVisita_cliente` int NOT NULL,
  `cedulaCliente_visita` varchar(15) NOT NULL,
  PRIMARY KEY (`numeroVisita_cliente`,`cedulaCliente_visita`),
  KEY `cedulaCliente_visita_idx` (`cedulaCliente_visita`),
  CONSTRAINT `cedulaCliente_visita` FOREIGN KEY (`cedulaCliente_visita`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `numeroVisita_cliente` FOREIGN KEY (`numeroVisita_cliente`) REFERENCES `infovisitas` (`numeroVisita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infovisitas_cliente`
--

LOCK TABLES `infovisitas_cliente` WRITE;
/*!40000 ALTER TABLE `infovisitas_cliente` DISABLE KEYS */;
INSERT INTO `infovisitas_cliente` VALUES (1,'1080567410'),(2,'1094928323'),(3,'1256317488'),(4,'712485'),(5,'763895');
/*!40000 ALTER TABLE `infovisitas_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble` (
  `idInmueble` varchar(45) NOT NULL,
  `precioPropietario` float NOT NULL,
  `precioVenta` float NOT NULL,
  `precioAlquiler` float NOT NULL,
  `estado` varchar(45) NOT NULL,
  `disponibilidad` varchar(20) NOT NULL,
  `piso` int NOT NULL,
  `area` varchar(45) NOT NULL,
  `estrato` varchar(45) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `comunaBarrio` varchar(45) NOT NULL,
  `codigoPostal` varchar(10) NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `cedulaPropietario` varchar(15) NOT NULL,
  `idCompra_inmueble` varchar(20) NOT NULL,
  `idAlquiler_inmueble` varchar(20) NOT NULL,
  `numeroVisita_inmueble` int NOT NULL,
  PRIMARY KEY (`idInmueble`),
  KEY `cedulaPropietario_idx` (`cedulaPropietario`),
  KEY `idCompra_inmueble_idx` (`idCompra_inmueble`),
  KEY `idAlquiler_inmueble_idx` (`idAlquiler_inmueble`),
  KEY `numeroVisita_inmueble_idx` (`numeroVisita_inmueble`),
  CONSTRAINT `cedulaPropietario` FOREIGN KEY (`cedulaPropietario`) REFERENCES `propietario` (`cedula`),
  CONSTRAINT `idAlquiler_inmueble` FOREIGN KEY (`idAlquiler_inmueble`) REFERENCES `alquiler` (`idAlquiler`),
  CONSTRAINT `idCompra_inmueble` FOREIGN KEY (`idCompra_inmueble`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `numeroVisita_inmueble` FOREIGN KEY (`numeroVisita_inmueble`) REFERENCES `infovisitas` (`numeroVisita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` VALUES ('0000001',120000000,125000000,600000,'usado','inmediata',1,'60m2','3','Quindio','Armenia','Casa Blanca','630002','calle 30 - 12','739548','00001','00001',1),('0000002',350000000,355000000,850000,'nuevo','inmediata',2,'80m2','5','Quindio','Armenia','Iberica','630002','carrera 19 -25','781112','00002','00002',2),('0000003',98000000,103000000,560000,'usado','inmediata',5,'40m2','2','Quindio','Armenia','Isabela','630002','calle 30 - 30','1092635487','00003','00003',3),('0000004',550000000,560000000,1200000,'nuevo','inmediata',6,'102m2','6','Quindio','Armenia','Los Profesionales','630002','carrera 19 -19','3189245','00004','00004',4),('0000005',1000000000,1100000000,4500000,'usado','inmediata',1,'1000m2','6','Quindio','Pueblo Tapao','Prodesa','633008','vda. Las palmas','1896450','00005','00005',5);
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES ('1092635487','Laureano Espino','laureanoespino@outlook.com'),('1896450','Leonardo Fernández','leofer@hotmail.com'),('3189245','Carla Diez','carladiez@gmail.com'),('739548','Veronica Alamo','veronicaalamo@gmail.com'),('781112','Tatiana Sousa','tatianasousa@gmail.com');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_cliente`
--

DROP TABLE IF EXISTS `telefono_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_cliente` (
  `cedulaCliente_telefono` varchar(15) NOT NULL,
  `Telefono_cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`cedulaCliente_telefono`),
  CONSTRAINT `cedulaClienteTelefono` FOREIGN KEY (`cedulaCliente_telefono`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_cliente`
--

LOCK TABLES `telefono_cliente` WRITE;
/*!40000 ALTER TABLE `telefono_cliente` DISABLE KEYS */;
INSERT INTO `telefono_cliente` VALUES ('1080567410','3107965848'),('1094928323','3205142386'),('1256317488','3115221011'),('712485','3001459647'),('763895','3002200335');
/*!40000 ALTER TABLE `telefono_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_propietario`
--

DROP TABLE IF EXISTS `telefono_propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_propietario` (
  `cedulaPropietario_Telefono` varchar(15) NOT NULL,
  `Telefono_propietario` varchar(45) NOT NULL,
  PRIMARY KEY (`cedulaPropietario_Telefono`),
  CONSTRAINT `cedulaPropietario_telefono` FOREIGN KEY (`cedulaPropietario_Telefono`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_propietario`
--

LOCK TABLES `telefono_propietario` WRITE;
/*!40000 ALTER TABLE `telefono_propietario` DISABLE KEYS */;
INSERT INTO `telefono_propietario` VALUES ('1092635487','3103810521'),('1896450','3102400596'),('3189245','3114444569'),('739548','3124896547'),('781112','3141002153');
/*!40000 ALTER TABLE `telefono_propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonoinmobiliaria`
--

DROP TABLE IF EXISTS `telefonoinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonoinmobiliaria` (
  `nombreDInmobiliaria` varchar(45) NOT NULL,
  `telefono_inmobiliaria` varchar(45) NOT NULL,
  PRIMARY KEY (`nombreDInmobiliaria`),
  CONSTRAINT `nombreDInmobiliaria` FOREIGN KEY (`nombreDInmobiliaria`) REFERENCES `datosinmobiliaria` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonoinmobiliaria`
--

LOCK TABLES `telefonoinmobiliaria` WRITE;
/*!40000 ALTER TABLE `telefonoinmobiliaria` DISABLE KEYS */;
INSERT INTO `telefonoinmobiliaria` VALUES ('Inmobiliaria Raul Mejia','3219564712');
/*!40000 ALTER TABLE `telefonoinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 19:35:16
