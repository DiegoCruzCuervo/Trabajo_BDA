-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: practica1bda_tablaunica
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
  PRIMARY KEY (`pedidoID`,`producto`,`medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablaunica`
--

LOCK TABLES `tablaunica` WRITE;
/*!40000 ALTER TABLE `tablaunica` DISABLE KEYS */;
INSERT INTO `tablaunica` VALUES ('pepe22',11,'Sol',3,1,'La Primera','Luna',3,'C','Comida','Mediana',12.00,'2 x 1 domicilio',50,101,'2023-02-11 20:45:00',2,12.00,18.00,'Domicilio'),('pepe22',11,'Sol',3,1,'La Primera','Luna',3,'Cola','Bebida','50',3.00,NULL,NULL,101,'2023-02-11 20:45:00',2,6.00,18.00,'Domicilio'),('maria1',3,NULL,NULL,2,'Otra','Italia',2,'Pizza Margarita','Comida','Familiar',18.00,NULL,NULL,125,'2023-02-11 20:45:00',1,18.00,18.00,'Local'),('zampa',25,'Sol',3,1,'La Primera','Luna',3,'Cola','Bebida','33',2.50,NULL,NULL,135,'2023-02-11 20:45:00',2,5.00,17.00,'Domicilio'),('zampa',25,'Sol',3,1,'La Primera','Luna',3,'Pizza Cuatro quesos','Comida','Mediana',12.00,'2 x 1 domicilio',50,135,'2023-02-11 20:45:00',2,12.00,17.00,'Domicilio'),('marta23',7,'Arco',1,2,'Otra','Italia',2,'Pizza Margarita','Comida','Mediana',12.00,NULL,NULL,170,'2023-02-12 21:45:00',1,12.00,12.00,'Domicilio'),('laura',30,'Trebol',1,3,'Una Más','Luz',1,'Pizza Carbonara ','Comida','Familiar',18.00,NULL,NULL,171,'2023-02-12 21:45:00',1,18.00,37.25,'Local'),('laura',30,'Trebol',1,3,'Una Más','Luz',1,'Pizza Vegana','Comida','Mediana',13.00,'Oferta Domingo',25,171,'2023-02-12 21:45:00',2,19.25,37.25,'Local'),('zampa',25,'Sol',3,2,'Otra','Italia',2,'Pizza Cuatro quesos','Comida','Mediana',12.00,'2 x 1 domicilio',50,208,'2023-02-14 20:45:00',2,12.00,12.00,'Local'),('maria1',3,NULL,NULL,3,'Una Más','Luz',1,'Pizza Margarita','Comida','Familiar',18.00,NULL,NULL,222,'2023-02-14 21:45:00',1,18.00,18.00,'Local');
/*!40000 ALTER TABLE `tablaunica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 12:47:36
