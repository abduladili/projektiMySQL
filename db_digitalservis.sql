-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_digitalservis
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Employees_fk1_idx` (`salesRepEmployeId`),
  CONSTRAINT `Employees_fk1` FOREIGN KEY (`salesRepEmployeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Primal Digital','Sherif','Ajrulovski','071123456','Skupi pn','Skopje','NM','North Macedonia',1001),(2,'Rasim','Rasim','Rasimi','072123456','blagoja toska','Tetove','NM','North Macedonia',1002),(3,'Shpendi','Shpend','Shpendi','070321654','blagoja parovic','Tetove','NM','North Macedonia',1003),(4,'Vesna','Vesna','Ilievska','072321654','rruga2','Shkup','NM','North Macedonia',1003),(5,'Kujtim','Kujtim','Ibrahimi','071654987','f.Zajas','Kercove','NM','North Macedonia',1004),(6,'Xhiti','Exhevit','Mehmedi','076325468','f.Drugove','Kercove','NM','North Macedonia',1004),(7,'Emin','Emin','Emini','0756548211','Radishan pn','Shkup','NK','North Macedonia',1002),(8,'Lulzim','Lulzim','Adili','075356458','Kasarna pn','Gostivar','NK','North Macedonia',1002),(9,'Ylber','Ylber','Veliu','071354321','Kumanove','Kumanovo','NK','North Macedonia',1000);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jobTitle` varchar(50) NOT NULL,
  `officeId` int NOT NULL,
  `reportsTo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `office_fk1_idx` (`reportsTo`),
  KEY `office_fk1_idx1` (`officeId`),
  CONSTRAINT `office_fk1` FOREIGN KEY (`officeId`) REFERENCES `offices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_fk1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1000,'Abdul','Adili','abduladili@ds.mk','Director',1,1000),(1001,'Sevim','Adili','sevimadili@ds.mk','Manager',1,1000),(1002,'Nasir','Memedi','nasirmemedi@ds.mk','Sales',2,1001),(1003,'Ersan','Memedi','ersanmemedi@ds.mk','Sales',3,1001),(1004,'Shpresim','Adili','shpresimadili@ds','Sales',4,1001);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL DEFAULT 'North Macedonia',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'Headquarters','Manapo 3-3-2','Skopje','071331155','North Macedonia'),(2,'SHOP1','Lazo Moskov 2-2/5','Skopje','071331155','North Macedonia'),(3,'SHOP2','Arhiepiskop Dositei','Skopje','071331155','North Macedonia'),(4,'SHOP3','Osloboduvanje 4-2','Kicevo','071331155','North Macedonia');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `quantityOrdered` int NOT NULL,
  `priceEach` decimal(10,0) NOT NULL,
  KEY `order_fk1_idx` (`orderId`),
  KEY `product_fk2_idx` (`productId`),
  CONSTRAINT `order_fk1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_fk2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1003,1,200),(1,1004,1,500),(2,1006,10,12),(3,1001,1,1680),(4,1009,2,120),(5,1002,2,500),(6,1003,2,200),(7,1010,250,5),(8,1000,1,1900),(9,1013,50,6);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL,
  `orderDate` date NOT NULL,
  `requierdDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `comments` text,
  `customerId` int NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customer_fk1_idx` (`customerId`),
  KEY `customer_fk2_idx` (`customerId`),
  CONSTRAINT `customer_fk2` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-11-01','2022-11-03','2022-11-07','Complited',NULL,6),(2,'2022-11-02','2022-11-04','2022-11-15','Complited',NULL,7),(3,'2022-11-03','2022-11-07','2022-11-09','Complited',NULL,5),(4,'2022-11-04','2022-11-07','2022-11-09','Complited',NULL,4),(5,'2022-11-07','2022-11-09','2022-11-15','Complited',NULL,5),(6,'2022-11-08','2022-11-09','2022-11-12','Complited',NULL,2),(7,'2022-11-09','2022-11-09','2022-11-12','Complited',NULL,1),(8,'2022-11-10','2022-11-12','2022-11-15','Complited',NULL,9),(9,'2022-11-11','2022-11-14','2022-11-15','Complited',NULL,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL,
  `customerId` int NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `customer_fk1` FOREIGN KEY (`id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,6,'CHK001','2022-11-07',700.00),(2,7,'CHK002','2022-11-07',120.00),(3,5,'CHK003','2022-11-15',1680.00),(4,4,'CHK004','2022-11-09',240.00),(5,5,'CHK005','2022-11-15',1000.00),(6,2,'CHK006','2022-11-12',400.00),(7,1,'CHK007','2022-11-12',1250.00),(8,9,'CHK008','2022-11-15',1900.00),(9,3,'CHK009','2022-11-15',300.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDescription` text NOT NULL,
  `qtyInStock` smallint NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) DEFAULT 'no-image.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1000,'Notebooks','Apple','Macbook pro 14\" ','M1 chip',5,1900.00,'no-image.jpg'),(1001,'Notebooks','Dell','Dell G5 intel i7','Intel i7 16gb ram, 1 Tb hdd 512 ssd, 720p webcam 15.6\"',10,1680.00,'no-image.jpg'),(1002,'Notebooks','HP','HP Probook 455 g8','Ryzen 3, 8gb ram, 256ssd, 720p webcam 15.6\"',10,500.00,'no-image.jpg'),(1003,'Monitor','Dell','Dell Monitor P2222H','Full HD 22\", IPS Wled, 16:9, HDMI, VGA, Usb 3.2 Gen1 HUB, USB 3.2 gen 1 upstream, 4x usb 3.2 gen 1 downstream ',5,200.00,'no-image.jpg'),(1004,'Desktop','Dell','Dell Optiplex 3080','Dell Optiplex 3080 SFF, Intel core i3-10105 (6mb 4.4GHz) Ram:8gb ddr4, Disk: 256GB SSD M2.2280NVME, DVD-RW, Keyboard + Mouse',5,500.00,'no-image.jpg'),(1005,'Toner','WIN','Win 2612a',' Toner Cartridge for HP LaserJet 1010\\1012\\1015\\1020\\3015\\3020\\3030\\M1005MFP\\M1319MFP - 3000 pages',100,10.00,'no-image.jpg'),(1006,'Toner','Matrix','Matrix 2612a',' Toner Cartridge for HP LaserJet 1010\\1012\\1015\\1020\\3015\\3020\\3030\\M1005MFP\\M1319MFP - 3000 pages',200,12.00,'no-image.jpg'),(1007,'Toner','WIN','Win 35A, 36A 285a','HP Laserjet P1505/P1505n/M1120/M1120 MFP/M1522/1522F/M1522N/M1522nf/M1550/HP LaserJet 1102/P1102W/Pro M1130/M1212NF 1500 pages',250,12.00,'no-image.jpg'),(1008,'Toner','Matrix','Win 35A, 36A 285a','HP Laserjet P1505/P1505n/M1120/M1120 MFP/M1522/1522F/M1522N/M1522nf/M1550/HP LaserJet 1102/P1102W/Pro M1130/M1212NF - 1500 pages',300,12.00,'no-image.jpg'),(1009,'Toner','Canon','Canon 057H','Original TonerCanon  imageCLASS LBP236dw - Wireless, Mobile Ready Laser Printer -- imageCLASS MF445dw - All in One, Wireless, Mobile Ready Laser Printer -- imageCLASS LBP226dw - 10.000 pages',10,120.00,'no-image.jpg'),(1010,'Office','Fabriano','Fabriano Copy 3 A4','Fabriano Copypaper 3 A4 80gr 500sheets ',6000,5.00,'no-image.jpg'),(1011,'Office','Fabriano','Fabriano Copy 2 A4','Fabriano Copypaper 2 A4 80gr 500sheets ',1000,5.50,'no-image.jpg'),(1012,'Office','Fedrigoni','Fedrigoni C A4','Fedrigoni Copypaper C A4 80gr 500sheets ',2000,5.00,'no-image.jpg'),(1013,'Office','DoubleA','DoubleA A4','Double A A4 80gr 500sheets premium',1000,6.00,'no-image.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 18:21:23
