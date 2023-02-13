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
  `idAlquieler` varchar(50) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `cedulaCliente` varchar(45) DEFAULT NULL,
  `idInmueble` varchar(45) DEFAULT NULL,
  `cedulaAsesor` varchar(45) DEFAULT NULL,
  `nombreInmobiliaria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAlquieler`),
  KEY `fkAlquilerAsesor1Idx` (`cedulaAsesor`),
  KEY `fkAlquilerCliente1Idx` (`cedulaCliente`),
  KEY `fkAlquilerDatosInmobiliaria1Idx` (`nombreInmobiliaria`),
  KEY `fkAlquilerInmueble1Idx` (`idInmueble`),
  CONSTRAINT `fkAlquilerAsesor1` FOREIGN KEY (`cedulaAsesor`) REFERENCES `asesor` (`cedulaAsesor`),
  CONSTRAINT `fkAlquilerCliente1` FOREIGN KEY (`cedulaCliente`) REFERENCES `cliente` (`cedulaCliente`),
  CONSTRAINT `fkAlquilerDatosInmobiliaria1` FOREIGN KEY (`nombreInmobiliaria`) REFERENCES `datosinmobiliaria` (`nombreInmobiliaria`),
  CONSTRAINT `fkAlquilerInmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES ('1','1100000','445555','00001','11111','Finca Raiz'),('2','1200000','445556','00002','11112','Maxibienes'),('3','1300000','445557','00003','11113','Alameda'),('4','1400000','445558','00004','11114','Ochoa'),('5','1500000','445559','00005','11115','Habitamos');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor`
--

DROP TABLE IF EXISTS `asesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesor` (
  `cedulaAsesor` varchar(50) NOT NULL,
  `nombreAsesor` varchar(45) DEFAULT NULL,
  `salarioAsesor` varchar(45) DEFAULT NULL,
  `telefonoAsesor` varchar(45) DEFAULT NULL,
  `correoAsesor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedulaAsesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor`
--

LOCK TABLES `asesor` WRITE;
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` VALUES ('11111','james','1500000','12345','james@gmail.com'),('11112','arley','1500000','12346','arley@gmail.com'),('11113','wilmer','1500000','12347','wilmer@gmail.com'),('11114','andres','1500000','12348','andres@gmail.com'),('11115','santiago','1500000','12349','santiago@gmail.com');
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedulaCliente` varchar(45) NOT NULL,
  `nombreCliente` varchar(45) DEFAULT NULL,
  `ingresosCliente` varchar(45) DEFAULT NULL,
  `habilitado` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo_electronicoCliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedulaCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('445555','apolo','800000','si','cra 50','apolo@gmail.com'),('445556','kyara','800000','si','cra 60 ','kyara@gmail.com'),('445557','madona','800000','si','cra 70','madona@gmail.com'),('445558','cain','800000','si','cra 80','cain@gmail.com'),('445559','cersei','800000','si','cra 90','cersei@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_compra`
--

DROP TABLE IF EXISTS `cliente_has_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_compra` (
  `cliente_cedulaCliente` varchar(45) NOT NULL,
  `compra_idCompra` varchar(50) NOT NULL,
  PRIMARY KEY (`cliente_cedulaCliente`,`compra_idCompra`),
  KEY `fk_cliente_has_compra_compra1_idx` (`compra_idCompra`),
  KEY `fk_cliente_has_compra_cliente1_idx` (`cliente_cedulaCliente`),
  CONSTRAINT `fk_cliente_has_compra_cliente1` FOREIGN KEY (`cliente_cedulaCliente`) REFERENCES `cliente` (`cedulaCliente`),
  CONSTRAINT `fk_cliente_has_compra_compra1` FOREIGN KEY (`compra_idCompra`) REFERENCES `compra` (`idCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_compra`
--

LOCK TABLES `cliente_has_compra` WRITE;
/*!40000 ALTER TABLE `cliente_has_compra` DISABLE KEYS */;
INSERT INTO `cliente_has_compra` VALUES ('445555','1'),('445556','2'),('445557','3'),('445558','4'),('445559','5');
/*!40000 ALTER TABLE `cliente_has_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCompra` varchar(50) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `cedulaCliente` varchar(45) DEFAULT NULL,
  `idInmueble` varchar(45) DEFAULT NULL,
  `cedulaAsesor` varchar(45) DEFAULT NULL,
  `nombreInmobiliaria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fkCompraAsesor1Idx` (`cedulaAsesor`),
  KEY `fkCompraCliente1Idx` (`cedulaCliente`),
  KEY `fkCompraInmueble1Idx` (`idInmueble`),
  KEY `fkCompraDatosInmobiliaria1Idx` (`nombreInmobiliaria`),
  CONSTRAINT `fkCompraAsesor1` FOREIGN KEY (`cedulaAsesor`) REFERENCES `asesor` (`cedulaAsesor`),
  CONSTRAINT `fkCompraCliente1` FOREIGN KEY (`cedulaCliente`) REFERENCES `cliente` (`cedulaCliente`),
  CONSTRAINT `fkCompraDatosInmobiliaria1` FOREIGN KEY (`nombreInmobiliaria`) REFERENCES `datosinmobiliaria` (`nombreInmobiliaria`),
  CONSTRAINT `fkCompraInmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('1','1100000','445555','00001','11111','Finca Raiz'),('2','1200000','445556','00002','11112','Maxibienes'),('3','1300000','445557','00003','11113','Alameda'),('4','1400000','445558','00004','11114','Ochoa'),('5','1500000','445559','00005','11115','Habitamos');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosinmobiliaria`
--

DROP TABLE IF EXISTS `datosinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosinmobiliaria` (
  `nombreInmobiliaria` varchar(50) NOT NULL,
  `direccionInmobiliaria` varchar(45) DEFAULT NULL,
  `correoInmobiliaria` varchar(45) DEFAULT NULL,
  `pagina_webInmobiliaria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nombreInmobiliaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosinmobiliaria`
--

LOCK TABLES `datosinmobiliaria` WRITE;
/*!40000 ALTER TABLE `datosinmobiliaria` DISABLE KEYS */;
INSERT INTO `datosinmobiliaria` VALUES ('Alameda','Calle 22 Bogotá','alameda@gmail.com','alameda.com'),('Finca Raiz','Calle 100 Cali','fincaraiz@gmail.com','fincaraiz.com'),('Habitamos','calle 35 Bucaramanga','habitamos@gmail.com','habitamos.com'),('Maxibienes','calle 34 Medellin','maxivienes@gmail.com','maxibienes.com'),('Ochoa','Calle 50 Barranquilla','ochoa@gmail.com','ochoa.com');
/*!40000 ALTER TABLE `datosinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotoinmueble`
--

DROP TABLE IF EXISTS `fotoinmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotoinmueble` (
  `idInmueble` varchar(50) NOT NULL,
  `fotoInmueble` varchar(45) NOT NULL,
  PRIMARY KEY (`idInmueble`,`fotoInmueble`),
  CONSTRAINT `fk_fotoInmuebleInmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotoinmueble`
--

LOCK TABLES `fotoinmueble` WRITE;
/*!40000 ALTER TABLE `fotoinmueble` DISABLE KEYS */;
INSERT INTO `fotoinmueble` VALUES ('00001','1'),('00002','2'),('00003','3'),('00004','4'),('00005','5');
/*!40000 ALTER TABLE `fotoinmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infovisitas`
--

DROP TABLE IF EXISTS `infovisitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infovisitas` (
  `idInfoVisitas` varchar(50) NOT NULL,
  `fechaVisita` varchar(45) DEFAULT NULL,
  `cedulaCliente` varchar(45) DEFAULT NULL,
  `motivoVisita` varchar(45) DEFAULT NULL,
  `idInmueble` varchar(45) DEFAULT NULL,
  `cedulaAsesor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInfoVisitas`),
  KEY `fkInfoVisitasAsesor1Idx` (`cedulaAsesor`),
  KEY `fkInfoVisitasInmueble1Idx` (`idInmueble`),
  KEY `fkInfoVisitasCliente1Idx` (`cedulaCliente`),
  CONSTRAINT `fkInfoVisitasAsesor1` FOREIGN KEY (`cedulaAsesor`) REFERENCES `asesor` (`cedulaAsesor`),
  CONSTRAINT `fkInfoVisitasCliente1` FOREIGN KEY (`cedulaCliente`) REFERENCES `cliente` (`cedulaCliente`),
  CONSTRAINT `fkInfoVisitasInmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infovisitas`
--

LOCK TABLES `infovisitas` WRITE;
/*!40000 ALTER TABLE `infovisitas` DISABLE KEYS */;
INSERT INTO `infovisitas` VALUES ('1','2023/02/01','445555','posible compra o alquiler','00001','11111'),('2','2023/02/02','445556','posible compra o alquiler','00002','11112'),('3','2023/02/03','445557','posible compra o alquiler','00003','11113'),('4','2023/02/04','445558','posible compra o alquiler','00004','11114'),('5','2023/02/05','445559','posible compra o alquiler','00005','11115');
/*!40000 ALTER TABLE `infovisitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble` (
  `idInmueble` varchar(50) NOT NULL,
  `pisoInmueble` varchar(45) DEFAULT NULL,
  `areaInmueble` varchar(45) DEFAULT NULL,
  `estratoInmueble` varchar(45) DEFAULT NULL,
  `departamentoDireccion` varchar(45) DEFAULT NULL,
  `ciudadDireccion` varchar(45) DEFAULT NULL,
  `barrioDireccion` varchar(45) DEFAULT NULL,
  `codigoPostalDireccion` varchar(45) DEFAULT NULL,
  `complementoDireccion` varchar(45) DEFAULT NULL,
  `precioVentaInmueble` varchar(45) DEFAULT NULL,
  `precioAlquilerInmueble` varchar(45) DEFAULT NULL,
  `estadoInmueble` varchar(45) DEFAULT NULL,
  `disponibilidadInmueble` varchar(45) DEFAULT NULL,
  `precioPropietarioInmueble` varchar(45) DEFAULT NULL,
  `cedulaPropietario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInmueble`),
  KEY `fkInmueblePropietario1Idx` (`cedulaPropietario`),
  CONSTRAINT `fkInmueblePropietario1` FOREIGN KEY (`cedulaPropietario`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` VALUES ('00001','1','40','1','Antioquia','Medellin','comuna 5','00030','calle 10','30000000','2000000','bien','si','1500000','22221'),('00002','2','50','1','Antioquia','Medellin','comuna 6','00031','calle 20','30000000','2000000','bien','si','1500000','22222'),('00003','3','60','2','Antioquia','Medellin','comuna 7','00032','calle 30','30000000','2000000','bien','si','1500000','22223'),('00004','4','70','3','Antioquia','Medellin','comuna 8','00033','calle 40','30000000','200000','bien','si','1500000','22224'),('00005','5','80','4','Antioquia','Medellin','comuna 9','00034','calle 50','30000000','2000000','bien','si','1500000','22225');
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble_has_infovisitas`
--

DROP TABLE IF EXISTS `inmueble_has_infovisitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble_has_infovisitas` (
  `inmueble_idInmueble` varchar(50) NOT NULL,
  `infovisitas_idInfoVisitas` varchar(50) NOT NULL,
  PRIMARY KEY (`inmueble_idInmueble`,`infovisitas_idInfoVisitas`),
  KEY `fk_inmueble_has_infovisitas_infovisitas1_idx` (`infovisitas_idInfoVisitas`),
  KEY `fk_inmueble_has_infovisitas_inmueble1_idx` (`inmueble_idInmueble`),
  CONSTRAINT `fk_inmueble_has_infovisitas_infovisitas1` FOREIGN KEY (`infovisitas_idInfoVisitas`) REFERENCES `infovisitas` (`idInfoVisitas`),
  CONSTRAINT `fk_inmueble_has_infovisitas_inmueble1` FOREIGN KEY (`inmueble_idInmueble`) REFERENCES `inmueble` (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble_has_infovisitas`
--

LOCK TABLES `inmueble_has_infovisitas` WRITE;
/*!40000 ALTER TABLE `inmueble_has_infovisitas` DISABLE KEYS */;
INSERT INTO `inmueble_has_infovisitas` VALUES ('00001','1'),('00002','2'),('00003','3'),('00004','4'),('00005','5');
/*!40000 ALTER TABLE `inmueble_has_infovisitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `cedula` varchar(50) NOT NULL,
  `nombrePropietario` varchar(45) DEFAULT NULL,
  `correoPropietario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES ('22221','eliza','eliza@gmail.com'),('22222','julieta','julieta@gmail.com'),('22223','aracely','aracely@gmail.com'),('22224','luz','luz@gmai.com'),('22225','ana','ana@gmail.com');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonocliente`
--

DROP TABLE IF EXISTS `telefonocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonocliente` (
  `telefonoCliente` varchar(50) NOT NULL,
  `cedulaCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`telefonoCliente`,`cedulaCliente`),
  KEY `fkTelefonoClienteCliente1Idx` (`cedulaCliente`),
  CONSTRAINT `fkTelefonoClienteCliente1` FOREIGN KEY (`cedulaCliente`) REFERENCES `cliente` (`cedulaCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonocliente`
--

LOCK TABLES `telefonocliente` WRITE;
/*!40000 ALTER TABLE `telefonocliente` DISABLE KEYS */;
INSERT INTO `telefonocliente` VALUES ('998875','445555'),('998876','445556'),('998877','445557'),('998878','445558'),('998879','445558');
/*!40000 ALTER TABLE `telefonocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonoinmobiliaria`
--

DROP TABLE IF EXISTS `telefonoinmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonoinmobiliaria` (
  `nombreInmobiliaria` varchar(50) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`nombreInmobiliaria`,`telefono`),
  CONSTRAINT `fkTelefonoInmobiliariaDatosInmobiliaria` FOREIGN KEY (`nombreInmobiliaria`) REFERENCES `datosinmobiliaria` (`nombreInmobiliaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonoinmobiliaria`
--

LOCK TABLES `telefonoinmobiliaria` WRITE;
/*!40000 ALTER TABLE `telefonoinmobiliaria` DISABLE KEYS */;
INSERT INTO `telefonoinmobiliaria` VALUES ('Alameda','112235'),('Finca Raiz','112233'),('Habitamos','112237'),('Maxibienes','112234'),('Ochoa','112236');
/*!40000 ALTER TABLE `telefonoinmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonopropietario`
--

DROP TABLE IF EXISTS `telefonopropietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonopropietario` (
  `idPropietario` varchar(50) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idPropietario`,`telefono`),
  CONSTRAINT `fkTelefonoPropietarioPropietario1` FOREIGN KEY (`idPropietario`) REFERENCES `propietario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonopropietario`
--

LOCK TABLES `telefonopropietario` WRITE;
/*!40000 ALTER TABLE `telefonopropietario` DISABLE KEYS */;
INSERT INTO `telefonopropietario` VALUES ('22221','778895'),('22222','778896'),('22223','778897'),('22224','778898'),('22225','778899');
/*!40000 ALTER TABLE `telefonopropietario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 20:53:24
