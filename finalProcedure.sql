-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: online_shopping
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `user_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `color_id` (`color_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `variants` (`id`),
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (3,5,3,4,'2017-11-16','2017-11-16 04:04:30');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!50001 DROP VIEW IF EXISTS `order_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_detail` (
  `id` tinyint NOT NULL,
  `final_cost` tinyint NOT NULL,
  `checkout_amount` tinyint NOT NULL,
  `payment_type` tinyint NOT NULL,
  `payment_status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `user_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `color_id` (`color_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `variants` (`id`),
  CONSTRAINT `order_history_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_history_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (2,2,1,2,2,'2017-11-17','2017-11-17 05:05:52'),(2,6,3,2,1,'2017-11-17','2017-11-17 05:05:52');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `final_cost` float NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-11-17','2017-11-17','placed',4600,1,'2017-11-17','2017-11-17 05:01:57'),(2,'2017-11-17','2017-11-17','placed',3700,2,'2017-11-17','2017-11-17 05:04:08');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(20) NOT NULL,
  `discount_coupon` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_status` varchar(10) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checkout_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'COD',10,'2017-11-17','paid','2017-11-17','2017-11-17 05:01:57',4140),(2,2,2,'COD',10,'2017-11-17','paid','2017-11-17','2017-11-17 05:04:08',3330);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `created` date NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'shoe','2017-10-15','2017-11-13 14:17:03'),(2,'jeans','2017-10-21','2017-11-13 14:17:22'),(3,'shirt','2017-10-23','2017-11-13 14:17:44');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `created` date NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'buyer','abc@gmail.com','abc','kamal','7767984668','pashan','1994-11-13','2017-11-13 14:28:34'),(2,'buyer','ab@gmail.com','abc','kamal','7767984668','pashan','1994-10-23','2017-11-13 14:29:02'),(3,'buyer','adfb@gmail.com','abc','kamal','7767984668','pashan','1994-10-13','2017-11-13 14:29:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_name` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `created` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,'black',8,1100,'2017-02-11','2017-11-17 05:01:57'),(2,1,'blue',8,1000,'2017-02-11','2017-11-17 05:04:08'),(3,2,'black',8,1200,'2017-02-11','2017-11-17 05:01:57'),(4,2,'blue',10,1100,'2017-02-11','2017-11-13 14:36:01'),(5,3,'black',12,1900,'2017-02-11','2017-11-13 14:36:30'),(6,3,'black',19,1700,'2017-02-11','2017-11-17 05:04:08');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'online_shopping'
--
/*!50003 DROP PROCEDURE IF EXISTS `cost_setter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cost_setter`()
BEGIN

DECLARE total_sum  INTEGER;
DECLARE order_count INTEGER;
DECLARE itr INTEGER;
DECLARE discount INTEGER;
DECLARE pay INTEGER; 
DECLARE discount_amout INTEGER;

set order_count = (select count(*) from orders);
set itr=1;

while(itr <= order_count) do

select sum(carts.product_quantity * variants.price) into total_sum from carts,variants where carts.color_id = variants.id and carts.user_id = itr;

update orders set final_cost = total_sum where id = itr;

 


set discount = (select discount_coupon from payment where id=itr);

set discount_amout = ((discount/100)*total_sum);


select total_sum,discount_amout ;
set pay=(total_sum - discount_amout);
select pay,itr;
update payment set checkout_amount = pay where order_id =  itr   ;


set itr=itr+1; 
END WHILE ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Order1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Order1`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE orderId  INTEGER;

DECLARE curs1 CURSOR FOR SELECT id FROM orders;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN curs1;
read_loop: LOOP
FETCH curs1 INTO orderId;

IF done THEN
LEAVE read_loop;
END IF;

SELECT price FROM info where id=orderID ; 

END LOOP;
CLOSE curs1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Orderp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Orderp`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE orderId  INTEGER;

DECLARE curs1 CURSOR FOR SELECT id FROM orders;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN curs1;
read_loop: LOOP
FETCH curs1 INTO orderId;

IF done THEN
LEAVE read_loop;
END IF;
select * from orders;

END LOOP;
CLOSE curs1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p`(IN ids int, IN paymentType varchar(20),IN userId int)
BEGIN  

DECLARE total_sum  INTEGER;
DECLARE pay  INTEGER;
DECLARE discount_amount  INTEGER;
DECLARE discount  INTEGER;

DECLARE userIds INTEGER;
DECLARE colorIds INTEGER;
DECLARE productIds INTEGER;
DECLARE quant INTEGER;
DECLARE quant_check INTEGER;
DECLARE roll_back INTEGER DEFAULT 0;

DECLARE done INTEGER default 0;
DECLARE shift CURSOR FOR SELECT user_id,color_id,product_id,product_quantity FROM carts where user_id=userId;


DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET roll_back = 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;



start transaction;


select sum(carts.product_quantity * variants.price) into total_sum from carts,variants where carts.color_id = variants.id and carts.user_id = userId;



set discount = 10;

set discount_amount = ((discount/100)*total_sum);



set pay = (total_sum - discount_amount);

select discount_amount,pay,total_sum;
select discount_amount,pay,total_sum;



insert into orders
(id,order_date,shipping_date,order_status,final_cost,user_id,created)
values
(ids,curDate(),curDate(),"placed",total_sum,userId,curDate());

select discount_amount,pay;

insert into payment(id,payment_type,discount_coupon,user_id,payment_date,checkout_amount,order_id,payment_status,created) values
(ids,paymentType,discount,userId,curDate(),pay,ids,"paid",curDate());


select discount_amount;
OPEN shift;
read_loop: LOOP
FETCH shift INTO userIds,colorIds, productIds,quant   ;

IF done THEN
     LEAVE read_loop;
END IF;

select userIds,colorIds, productIds,quant;

INSERT INTO order_history(user_id,color_id,product_id,product_quantity,created) VALUES (userIds,colorIds,productIds,quant,curDate());


select stock into quant_check from variants where id=colorIds;

set quant_check = (quant_check - quant);

select  quant , quant_check; 

if quant_check < 0 then

set roll_back =1;

end if;

update variants set  stock = quant_check where id = colorIds;

END LOOP;
CLOSE shift;
delete from carts where user_id=userId;





if roll_back then
    select roll_back;
    rollback;
   
else
    select roll_back;
    commit;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `payment_cal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `payment_cal`(IN ids int, IN paymentType varchar(20), IN discountCoupon int,IN userId int)
BEGIN  

DECLARE total_sum  INTEGER;
DECLARE pay  INTEGER;
DECLARE discount_amount  INTEGER;
DECLARE discount  INTEGER;

DECLARE userIds INTEGER;
DECLARE colorIds INTEGER;
DECLARE productIds INTEGER;
DECLARE quant INTEGER;
DECLARE number INTEGER;
DECLARE itr INTEGER;

DECLARE roll_back INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET roll_back = 1;

start transaction;


select sum(carts.product_quantity * variants.price) into total_sum from carts,variants where carts.color_id = variants.id and carts.user_id = userId;





set discount = 10;

set discount_amount = ((discount/100)*total_sum);



set pay = (total_sum - discount_amount);

select discount_amount,pay,total_sum;

insert into payment(id,payment_type,discount_coupon,user_id,payment_date,checkout_amount,order_id,payment_status,created) values
(ids,paymentType,discountCoupon,userId,curDate(),pay,ids,"paid",curDate());


insert into orders
(id,order_date,shipping_date,order_status,final_cost,user_id,created)
values
(ids,curDate(),curDate(),"placed",total_sum,userId,curDate());





if roll_back then
    select roll_back;
    rollback;
   
else
    select roll_back;
    commit;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `payment_call1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `payment_call1`(IN ids int, IN paymentType varchar(20), IN discountCoupon int,IN userId int)
BEGIN  

DECLARE total_sum  INTEGER;
DECLARE pay  INTEGER;
DECLARE discount_amount  INTEGER;
DECLARE discount  INTEGER;

DECLARE roll_back INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET roll_back = 1;

start transaction;


select sum(carts.product_quantity * variants.price) into total_sum from carts,variants where carts.color_id = variants.id and carts.user_id = userId;





set discount = 10;

set discount_amount = ((discount/100)*total_sum);



set pay = (total_sum - discount_amount);

select discount_amount,pay;

insert into payment(id,payment_type,discount_coupon,user_id,payment_date,checkout_amount,order_id,payment_status,created) values
(ids,paymentType,discountCoupon,userId,curDate(),pay,ids,"paid",curDate());



if roll_back then
    select roll_back;
    rollback;
   
else
    select roll_back;
    commit;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedureTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureTest`()
BEGIN
  SELECT * from users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedureTest1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureTest1`(OUT total INT)
BEGIN
  SELECT user_id into total from users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedureTest2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureTest2`()
BEGIN
 insert into payment (id,discount_coupon,created) values (1,10,'2017-11-14');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedureTest3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureTest3`(in id int,in coupon decimal(3,2),in order_date date)
BEGIN
 insert into payment (id,discount_coupon,created) values (1,10,'2017-11-14');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedureTest4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureTest4`(in id int,in coupon decimal(3,2),in order_date date)
BEGIN
 insert into payment (id,discount_coupon,created) values (id,coupon,order_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `order_detail`
--

/*!50001 DROP TABLE IF EXISTS `order_detail`*/;
/*!50001 DROP VIEW IF EXISTS `order_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_detail` AS select `orders`.`id` AS `id`,`orders`.`final_cost` AS `final_cost`,`payment`.`checkout_amount` AS `checkout_amount`,`payment`.`payment_type` AS `payment_type`,`payment`.`payment_status` AS `payment_status` from (`payment` left join `orders` on((`orders`.`id` = `payment`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 11:07:18
