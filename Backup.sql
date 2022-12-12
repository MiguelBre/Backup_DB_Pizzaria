-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_administrador`
--

LOCK TABLES `tbl_administrador` WRITE;
/*!40000 ALTER TABLE `tbl_administrador` DISABLE KEYS */;
INSERT INTO `tbl_administrador` VALUES (1,'Miguel','Bressan','114b2c863b2d755d852626bfc8c1e07a','25d55ad283aa400af464c76d713c07ad');
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
-- Table structure for table `tbl_ingrediente`
--

DROP TABLE IF EXISTS `tbl_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ingrediente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente`
--

LOCK TABLES `tbl_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente` DISABLE KEYS */;
INSERT INTO `tbl_ingrediente` VALUES (1,'Mussarela'),(2,'Calabresa'),(3,'Catupiry'),(4,'Presunto'),(5,'Pepperoni'),(6,'Cebola'),(7,'Milho'),(8,'Frango'),(9,'Atum'),(10,'Ovo Cozido'),(11,'Palmito'),(12,'Ervilha'),(13,'Cheddar'),(14,'Gorgonzola'),(15,'Bacon'),(16,'Tomate'),(17,'Parmesão'),(18,'Provolone'),(19,'Orégano'),(20,'Azeitona verde'),(21,'Manjericão'),(22,'Carne seca'),(23,'Champignon'),(24,'Shitake'),(25,'Shimeji'),(26,'Brigadeiro'),(27,'Goiabada'),(28,'Abacaxi'),(29,'Chocolate'),(30,'Chocolate branco'),(31,'Morango'),(32,'Banana'),(33,'Açúcar'),(34,'Granulado'),(35,'Azeitona Preta');
/*!40000 ALTER TABLE `tbl_ingrediente` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mensagem`
--

LOCK TABLES `tbl_mensagem` WRITE;
/*!40000 ALTER TABLE `tbl_mensagem` DISABLE KEYS */;
INSERT INTO `tbl_mensagem` VALUES (1,'Césio Miranda','cesiomiranda@email.com','11920391124',NULL,1,'bla bla bla qualquer coisa e fds');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `tbl_pizza_ingrediente`
--

DROP TABLE IF EXISTS `tbl_pizza_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza_ingrediente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `id_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_ingredient_ingrediente_pizza` (`id_ingrediente`),
  KEY `FK_pizza_ingrediente_pizza` (`id_pizza`),
  CONSTRAINT `FK_ingredient_ingrediente_pizza` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id`),
  CONSTRAINT `FK_pizza_ingrediente_pizza` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza_ingrediente`
--

LOCK TABLES `tbl_pizza_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_pizza_ingrediente` DISABLE KEYS */;
INSERT INTO `tbl_pizza_ingrediente` VALUES (17,1,7),(18,35,7),(19,2,8),(20,6,8),(21,20,8),(22,1,9),(23,2,9),(24,20,9);
/*!40000 ALTER TABLE `tbl_pizza_ingrediente` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
INSERT INTO `tbl_produto` VALUES (1,'Pizza Mussarela','A massa circular é coberta com molho de tomate, queijo mussarela e um pouco de orégano e duas ou três azeitonas',NULL),(2,'Pizza Calabresa','Uma massa coberta com molho de tomate e recheio de calabresa e cebola',NULL),(3,'Pizza Toscana','Massa de pizza coberta com molho de tomate e recheio de calabresa em rodelas e queijo mussarela',NULL),(4,'Coca-cola','Bebida gaseificada',NULL),(5,'Guaraná Antártica','Bebida gaseificada com sabor de guaraná',NULL),(6,'Pizza Pepperoni','A massa circular é coberta com molho de tomate, queijo mussarela e um pouco de orégano e duas ou três azeitonas',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_pizza`
--

LOCK TABLES `tbl_tipo_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_pizza` DISABLE KEYS */;
INSERT INTO `tbl_tipo_pizza` VALUES (1,'Salgada'),(2,'Doce'),(3,'TipoDeidara');
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

-- Dump completed on 2022-12-12  8:24:32
