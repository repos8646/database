CREATE DATABASE `farm`;
USE `farm`;
CREATE USER 'farm'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `farm`.* TO 'farm'@'%';
FLUSH PRIVILEGES;
CREATE TABLE `user` (
	`uid`				VARCHAR(20) PRIMARY KEY,
	`pass`			VARCHAR(100),
	`name`			VARCHAR(20),
	`nick`			VARCHAR(20) UNIQUE,
	`email`			VARCHAR(50) UNIQUE,
	`hp`				CHAR(13) UNIQUE,
	`role`			VARCHAR(20) DEFAULT '1',
	`zip`				CHAR(5),jboardjboardfarmfarm
	`addr1`			VARCHAR(255),
	`addr2`			VARCHAR(255),
	`regip`			VARCHAR(100),
	`regDate`		datetime,
	`leaveDate`		datetime
);

CREATE TABLE `terms` (
	`terms`		TEXT,
	`privacy`	TEXT
);

CREATE TABLE `product`(
	`proname` 			    VARCHAR(255) PRIMARY KEY NOT NULL,
	`product_id`		    INT AUTO_INCREMENT unique,	
	`category`				 VARCHAR(255) NOT NULL,
	`price`					 INT NOT NULL,
	`points` 				 INT DEFAULT 0,
   `discount` 		 		 VARCHAR(5) NOT NULL,
   `delivery_cost`		 VARCHAR(10) NOT null,
   `stock` 			 		 INT NOT NULL DEFAULT 0,
   `pro_img_list` 		 VARCHAR(255),
   `pro_img_inf` 			 VARCHAR(255),
   `pro_img_desc` 		 VARCHAR(255),
   `etc`						 TEXT
);

SELECT * FROM `user` WHERE `role` != '99';

select * from terms;

SELECT COUNT(*) FROM `user`;

delete from `user` where `uid`='a108';

SELECT * FROM `user` WHERE `name`='이순신' AND `hp`='010-1111-1111';