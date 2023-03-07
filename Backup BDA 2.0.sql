-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: pracBDA
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `tablaunica`
--

DROP TABLE IF EXISTS `tablaunica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablaunica` (
  `usuario` varchar(15) DEFAULT NULL,
  `clienteID` int DEFAULT NULL,
  `calle_cliente` varchar(20) DEFAULT NULL,
  `zona_cliente` int DEFAULT NULL,
  `localID` int DEFAULT NULL,
  `nombre_local` varchar(25) DEFAULT NULL,
  `calle_local` varchar(20) DEFAULT NULL,
  `zona_local` int DEFAULT NULL,
  `producto` varchar(20) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `medida` varchar(10) NOT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `nombre_oferta` varchar(20) DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `pedidoID` int NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `entrega` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pedidoID`,`producto`,`medida`),
  UNIQUE KEY `PMLF` (`producto`,`medida`,`localID`,`fecha_hora`),
  UNIQUE KEY `PMEF` (`producto`,`medida`,`clienteID`,`fecha_hora`),
  UNIQUE KEY `PMUF` (`producto`,`medida`,`usuario`,`fecha_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-07 17:23:38
