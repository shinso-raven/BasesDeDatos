-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: seguimiento_a_casos
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
-- Table structure for table `abogado`
--

DROP TABLE IF EXISTS `abogado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abogado` (
  `idAbogado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `idEspecialidadAbogado` int NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `tarifaHora` decimal(12,4) NOT NULL,
  PRIMARY KEY (`idAbogado`),
  UNIQUE KEY `idAbogado_UNIQUE` (`idAbogado`),
  KEY `FK_abogadoespecialidad_idx` (`idEspecialidadAbogado`),
  CONSTRAINT `FK_abogadoespecialidad` FOREIGN KEY (`idEspecialidadAbogado`) REFERENCES `especialidad abogado` (`idEspecialidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abogado`
--

LOCK TABLES `abogado` WRITE;
/*!40000 ALTER TABLE `abogado` DISABLE KEYS */;
/*!40000 ALTER TABLE `abogado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abogadoscaso`
--

DROP TABLE IF EXISTS `abogadoscaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abogadoscaso` (
  `idCaso` int NOT NULL,
  `idAbogado` int NOT NULL,
  `HorasCaso` int NOT NULL,
  PRIMARY KEY (`idAbogado`,`idCaso`),
  KEY `FK_abogadoscasoabogado_idx` (`idAbogado`),
  KEY `FK_abogadoscasocaso` (`idCaso`),
  CONSTRAINT `FK_abogadoscasoabogado` FOREIGN KEY (`idAbogado`) REFERENCES `abogado` (`idAbogado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_abogadoscasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abogadoscaso`
--

LOCK TABLES `abogadoscaso` WRITE;
/*!40000 ALTER TABLE `abogadoscaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `abogadoscaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agravantescaso`
--

DROP TABLE IF EXISTS `agravantescaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agravantescaso` (
  `idAgravante` int NOT NULL AUTO_INCREMENT,
  `idCaso` int NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Sentencia` int NOT NULL,
  PRIMARY KEY (`idAgravante`),
  UNIQUE KEY `idAgravante_UNIQUE` (`idAgravante`),
  KEY `FK_agravantescasocaso_idx` (`idCaso`),
  CONSTRAINT `FK_agravantescasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agravantescaso`
--

LOCK TABLES `agravantescaso` WRITE;
/*!40000 ALTER TABLE `agravantescaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `agravantescaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso`
--

DROP TABLE IF EXISTS `caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caso` (
  `IdCaso` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `FechaApertura` date NOT NULL,
  `idTribunal` int NOT NULL,
  `DecisionFinal` varchar(200) NOT NULL,
  `IdCategoria` int NOT NULL,
  PRIMARY KEY (`IdCaso`),
  UNIQUE KEY `IdCaso_UNIQUE` (`IdCaso`),
  KEY `FK_casocategoria_idx` (`IdCategoria`),
  KEY `FK_casotribunal_idx` (`idTribunal`),
  CONSTRAINT `FK_casocategoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_casotribunal` FOREIGN KEY (`idTribunal`) REFERENCES `tribunal` (`idTribunal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `idTipoJudicial` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCategoria`),
  UNIQUE KEY `IdCategoria_UNIQUE` (`IdCategoria`),
  KEY `FK_categoriatipojudicial_idx` (`idTipoJudicial`),
  CONSTRAINT `FK_categoriatipojudicial` FOREIGN KEY (`idTipoJudicial`) REFERENCES `tipojudicial` (`idTipoJudicial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `causascaso`
--

DROP TABLE IF EXISTS `causascaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `causascaso` (
  `idCausa` int NOT NULL AUTO_INCREMENT,
  `idCaso` int NOT NULL,
  `ResumenCausa` varchar(200) NOT NULL,
  `FechaAsistencia` date NOT NULL,
  PRIMARY KEY (`idCausa`),
  UNIQUE KEY `idCausa_UNIQUE` (`idCausa`),
  KEY `FK_causascasocaso_idx` (`idCaso`),
  CONSTRAINT `FK_causascasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causascaso`
--

LOCK TABLES `causascaso` WRITE;
/*!40000 ALTER TABLE `causascaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `causascaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientescaso`
--

DROP TABLE IF EXISTS `clientescaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientescaso` (
  `idCaso` int NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`idCaso`,`idCliente`),
  KEY `FK_clientescasocliente_idx` (`idCliente`),
  CONSTRAINT `FK_clientescasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_clientescasocliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientescaso`
--

LOCK TABLES `clientescaso` WRITE;
/*!40000 ALTER TABLE `clientescaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientescaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoscaso`
--

DROP TABLE IF EXISTS `documentoscaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentoscaso` (
  `idDocumento` int NOT NULL AUTO_INCREMENT,
  `idCaso` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idTipoDoc` int NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idDocumento`),
  UNIQUE KEY `idDocumento_UNIQUE` (`idDocumento`),
  KEY `FK_documentoscasocaso_idx` (`idCaso`),
  KEY `FK_documentoscasotipodoc_idx` (`idTipoDoc`),
  CONSTRAINT `FK_documentoscasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_documentoscasotipodoc` FOREIGN KEY (`idTipoDoc`) REFERENCES `tipodocumento` (`idTipoDoc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoscaso`
--

LOCK TABLES `documentoscaso` WRITE;
/*!40000 ALTER TABLE `documentoscaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentoscaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad abogado`
--

DROP TABLE IF EXISTS `especialidad abogado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad abogado` (
  `idEspecialidad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idEspecialidad`),
  UNIQUE KEY `idEspecialidad_UNIQUE` (`idEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad abogado`
--

LOCK TABLES `especialidad abogado` WRITE;
/*!40000 ALTER TABLE `especialidad abogado` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad abogado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad fiscal`
--

DROP TABLE IF EXISTS `especialidad fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad fiscal` (
  `idEspecialidadFiscal` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idEspecialidadFiscal`),
  UNIQUE KEY `idEspecialidadFiscal_UNIQUE` (`idEspecialidadFiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad fiscal`
--

LOCK TABLES `especialidad fiscal` WRITE;
/*!40000 ALTER TABLE `especialidad fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscal`
--

DROP TABLE IF EXISTS `fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiscal` (
  `idFiscal` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `idEspecialidadFiscal` int NOT NULL,
  PRIMARY KEY (`idFiscal`),
  UNIQUE KEY `idFiscal_UNIQUE` (`idFiscal`),
  KEY `FK_fiscalespecialidadfiscal_idx` (`idEspecialidadFiscal`),
  CONSTRAINT `FK_fiscalespecialidadfiscal` FOREIGN KEY (`idEspecialidadFiscal`) REFERENCES `especialidad fiscal` (`idEspecialidadFiscal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscalescaso`
--

DROP TABLE IF EXISTS `fiscalescaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiscalescaso` (
  `idCaso` int NOT NULL,
  `idFiscal` int NOT NULL,
  PRIMARY KEY (`idCaso`,`idFiscal`),
  KEY `FK_fiscalescasofiscal_idx` (`idFiscal`),
  CONSTRAINT `FK_fiscalescasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fiscalescasofiscal` FOREIGN KEY (`idFiscal`) REFERENCES `fiscal` (`idFiscal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscalescaso`
--

LOCK TABLES `fiscalescaso` WRITE;
/*!40000 ALTER TABLE `fiscalescaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalescaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juecescaso`
--

DROP TABLE IF EXISTS `juecescaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juecescaso` (
  `idCaso` int NOT NULL,
  `idJuez` int NOT NULL,
  PRIMARY KEY (`idCaso`,`idJuez`),
  KEY `FK_juecescasojuez_idx` (`idJuez`),
  CONSTRAINT `FK_juecescasocaso` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`IdCaso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_juecescasojuez` FOREIGN KEY (`idJuez`) REFERENCES `juez` (`idJuez`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juecescaso`
--

LOCK TABLES `juecescaso` WRITE;
/*!40000 ALTER TABLE `juecescaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `juecescaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juez`
--

DROP TABLE IF EXISTS `juez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juez` (
  `idJuez` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `DIreccion` varchar(150) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idJuez`),
  UNIQUE KEY `idJuez_UNIQUE` (`idJuez`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocumento` (
  `idTipoDoc` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`idTipoDoc`),
  UNIQUE KEY `idTipoDoc_UNIQUE` (`idTipoDoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipojudicial`
--

DROP TABLE IF EXISTS `tipojudicial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipojudicial` (
  `idTipoJudicial` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoJudicial`),
  UNIQUE KEY `idTipoJudicial_UNIQUE` (`idTipoJudicial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipojudicial`
--

LOCK TABLES `tipojudicial` WRITE;
/*!40000 ALTER TABLE `tipojudicial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipojudicial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tribunal`
--

DROP TABLE IF EXISTS `tribunal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tribunal` (
  `idTribunal` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `UbicacionTribunal` varchar(150) NOT NULL,
  PRIMARY KEY (`idTribunal`),
  UNIQUE KEY `idTribunal_UNIQUE` (`idTribunal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tribunal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-26 20:04:14
