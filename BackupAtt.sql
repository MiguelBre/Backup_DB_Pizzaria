-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_pizzaria_corleonne
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('ec9b3654-aee5-4cd0-a228-43d8c9894a92','6a7b084f5b319ca994d8a478b6cf8980b8eb054264fbdf579861d57cf5f76691','2022-12-12 17:10:51.321','20221212171051_migration_teste',NULL,NULL,'2022-12-12 17:10:51.304',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_administrador`
--

DROP TABLE IF EXISTS `tbl_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_administrador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `senha` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_administrador`
--

LOCK TABLES `tbl_administrador` WRITE;
/*!40000 ALTER TABLE `tbl_administrador` DISABLE KEYS */;
INSERT INTO `tbl_administrador` VALUES (2,'Leonardo','Guidorizzi','a6be022f54d2dbb6564169e8ead232a4','81dc9bdb52d04dc20036dbd8313ed055'),(5,'Teste','Admin','6dd206930b51c48354ed82412bd39192','cfeaad6fd55f393b56abc57e60c94ac9'),(6,'Miguel','Bressan','114b2c863b2d755d852626bfc8c1e07a','4297f44b13955235245b2497399d7a93'),(7,'Bla','Bla Bla','3052964980b947903205a4af5c4c9165','df5ea29924d39c3be8785734f13169c6');
/*!40000 ALTER TABLE `tbl_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bebida`
--

DROP TABLE IF EXISTS `tbl_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagem` varchar(300) DEFAULT NULL,
  `id_produto` int NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_produto_bebida` (`id_produto`),
  KEY `FK_tipo_bebida` (`id_tipo`),
  CONSTRAINT `FK_produto_bebida` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id`),
  CONSTRAINT `FK_tipo_bebida` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_bebida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bebida`
--

LOCK TABLES `tbl_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_bebida` DISABLE KEYS */;
INSERT INTO `tbl_bebida` VALUES (7,'https://trimais.vteximg.com.br/arquivos/ids/1019586-310-310/foto_original.jpg?v=637480432555170000',4,2),(8,'https://static.clubeextra.com.br/img/uploads/1/415/19804415.jpg',5,2);
/*!40000 ALTER TABLE `tbl_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bebida_x_tamanho`
--

DROP TABLE IF EXISTS `tbl_bebida_x_tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bebida_x_tamanho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tamanho` int NOT NULL,
  `id_bebida` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tamanho` (`id_tamanho`),
  KEY `FK_bebida` (`id_bebida`),
  CONSTRAINT `FK_bebida` FOREIGN KEY (`id_bebida`) REFERENCES `tbl_bebida` (`id`),
  CONSTRAINT `FK_tamanho` FOREIGN KEY (`id_tamanho`) REFERENCES `tbl_tamanho_bebida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bebida_x_tamanho`
--

LOCK TABLES `tbl_bebida_x_tamanho` WRITE;
/*!40000 ALTER TABLE `tbl_bebida_x_tamanho` DISABLE KEYS */;
INSERT INTO `tbl_bebida_x_tamanho` VALUES (13,22,7),(14,23,7),(15,27,7),(16,22,8),(17,23,8),(18,27,8);
/*!40000 ALTER TABLE `tbl_bebida_x_tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mensagem`
--

DROP TABLE IF EXISTS `tbl_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mensagem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `email` varchar(256) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `id_tipo` int NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tipo_mensagem` (`id_tipo`),
  CONSTRAINT `FK_tipo_mensagem` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_mensagem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mensagem`
--

LOCK TABLES `tbl_mensagem` WRITE;
/*!40000 ALTER TABLE `tbl_mensagem` DISABLE KEYS */;
INSERT INTO `tbl_mensagem` VALUES (2,'Josiel Silva','josielsilva@email.com','11920391124','undefined',2,'bla bla bla qualquer coisa e fds!');
/*!40000 ALTER TABLE `tbl_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza`
--

DROP TABLE IF EXISTS `tbl_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `favorito` int DEFAULT NULL,
  `imagem` varchar(300) DEFAULT NULL,
  `id_produto` int NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_produto_pizza` (`id_produto`),
  KEY `FK_tipo_pizza_pizza` (`id_tipo`),
  CONSTRAINT `FK_produto_pizza` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id`),
  CONSTRAINT `FK_tipo_pizza_pizza` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza`
--

LOCK TABLES `tbl_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_pizza` DISABLE KEYS */;
INSERT INTO `tbl_pizza` VALUES (7,NULL,'https://img77.uenicdn.com/image/upload/v1538467832/service_images/shutterstock_633097292.jpg',1,1),(8,NULL,'https://pizzariadesucesso.com/wp-content/uploads/2018/06/pizza-calabresa-choppodromo.jpg',2,1),(9,NULL,'https://img.freepik.com/fotos-premium/pizza-de-calabresa-em-prato-de-madeira-isolada_239245-2380.jpg?w=2000',3,1);
/*!40000 ALTER TABLE `tbl_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza_x_tamanho`
--

DROP TABLE IF EXISTS `tbl_pizza_x_tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza_x_tamanho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pizza` int NOT NULL,
  `id_tamanho` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tamanho_pizza` (`id_tamanho`),
  KEY `FK_pizza` (`id_pizza`),
  CONSTRAINT `FK_pizza` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`),
  CONSTRAINT `FK_tamanho_pizza` FOREIGN KEY (`id_tamanho`) REFERENCES `tbl_tamanho_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza_x_tamanho`
--

LOCK TABLES `tbl_pizza_x_tamanho` WRITE;
/*!40000 ALTER TABLE `tbl_pizza_x_tamanho` DISABLE KEYS */;
INSERT INTO `tbl_pizza_x_tamanho` VALUES (7,7,5),(8,7,6),(9,8,5),(10,8,6),(11,9,5),(12,9,6);
/*!40000 ALTER TABLE `tbl_pizza_x_tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` text,
  `desconto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
INSERT INTO `tbl_produto` VALUES (1,'Pizza Mussarela','A massa circular é coberta com molho de tomate, queijo mussarela e um pouco de orégano e duas ou três azeitonas',NULL),(2,'Pizza Calabresa','Uma massa coberta com molho de tomate e recheio de calabresa e cebola',NULL),(3,'Pizza Toscana','Massa de pizza coberta com molho de tomate e recheio de calabresa em rodelas e queijo mussarela',NULL),(4,'Coca-Cola','Bebida gaseificada sabor cola',NULL),(5,'Guaraná Antártica','Bebida gaseificada com sabor de guaraná',NULL),(6,'Pizza Pepperoni','Massa de pizza coberta com uma camada de molho de tomate, com recheio de queijo mussarela e rodelas de pepperoni',NULL);
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tamanho_bebida`
--

DROP TABLE IF EXISTS `tbl_tamanho_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tamanho_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamanho` varchar(20) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tamanho_bebida`
--

LOCK TABLES `tbl_tamanho_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_tamanho_bebida` DISABLE KEYS */;
INSERT INTO `tbl_tamanho_bebida` VALUES (22,'1.5L',8.99),(23,'1L',7.29),(24,'700mL',6.49),(25,'500mL',5.79),(26,'300mL',4.99),(27,'350mL',5.20);
/*!40000 ALTER TABLE `tbl_tamanho_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tamanho_pizza`
--

DROP TABLE IF EXISTS `tbl_tamanho_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tamanho_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamanho` varchar(20) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tamanho_pizza`
--

LOCK TABLES `tbl_tamanho_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_tamanho_pizza` DISABLE KEYS */;
INSERT INTO `tbl_tamanho_pizza` VALUES (5,'Grande',39.99),(6,'Broto',22.99);
/*!40000 ALTER TABLE `tbl_tamanho_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_bebida`
--

DROP TABLE IF EXISTS `tbl_tipo_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_bebida`
--

LOCK TABLES `tbl_tipo_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_bebida` DISABLE KEYS */;
INSERT INTO `tbl_tipo_bebida` VALUES (1,'Suco'),(2,'Refrigerante'),(3,'Alcoólica');
/*!40000 ALTER TABLE `tbl_tipo_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_mensagem`
--

DROP TABLE IF EXISTS `tbl_tipo_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_mensagem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_mensagem`
--

LOCK TABLES `tbl_tipo_mensagem` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_mensagem` DISABLE KEYS */;
INSERT INTO `tbl_tipo_mensagem` VALUES (1,'Sugestão'),(2,'Crítica');
/*!40000 ALTER TABLE `tbl_tipo_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_pizza`
--

DROP TABLE IF EXISTS `tbl_tipo_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_pizza`
--

LOCK TABLES `tbl_tipo_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_pizza` DISABLE KEYS */;
INSERT INTO `tbl_tipo_pizza` VALUES (1,'Salgada'),(2,'Doce');
/*!40000 ALTER TABLE `tbl_tipo_pizza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13  5:31:20
