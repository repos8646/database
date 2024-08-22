#날짜 : 2024/08/19
#이름 : 김보경
#내용: JSP 게시판 프로젝트 실습하기

# 데이터베이스 생성
CREATE DATABASE `jboard`;
USE `jboard`;

# 사용자 생성
CREATE USER 'jboard'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `jboard`.* TO 'jboard'@'%';
FLUSH PRIVILEGES;

# 테이블 생성
CREATE TABLE `user` (
	`uid`			VARCHAR(20) PRIMARY KEY,
	`pass` 		VARCHAR(100),
	`name` 		VARCHAR(20),
	`nick` 		VARCHAR(20) unique,
	`email` 		VARCHAR(50) unique,
	`hp`			CHAR(13) unique,
	`role`		VARCHAR(20) DEFAULT 'USER',
	`zip`			CHAR(5),
	`addr1`		VARCHAR(255),
	`addr2`		VARCHAR(255),
	`regip`		VARCHAR(100),
	`regDate`	datetime,
	`leaveDate`	datetime
);

CREATE TABLE `terms` (
	`terms`		TEXT,
	`privacy`	TEXT
);

CREATE TABLE `article` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(100) NOT NULL,
	`content`	TEXT NOT NULL,
	`comment`	INT DEFAULT 0,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`rdate`		DATETIME,
	FOREIGN KEY(`writer`) REFERENCES `user`(`uid`)
);

CREATE TABLE `comment` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT NOT NULL,
	`content` 	TEXT,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(20) NOT NULL,
	`rdate`		DATETIME,
	FOREIGN KEY(`writer`) REFERENCES `user`(`uid`),
	FOREIGN KEY(`parent`) REFERENCES `article`(`no`)	
);

CREATE TABLE `file` (
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`ano`			INT NOT NULL,
	`oName`		VARCHAR(100) NOT NULL,
	`sName`		VARCHAR(100) NOT NULL,
	`download`	INT DEFAULT 0,
	`rdate`		DATETIME,
	FOREIGN KEY(`ano`) REFERENCES `article`(`no`)
);

SELECT COUNT(*) FROM `user` WHERE `uid`='abc123';

SELECT SHA2('1234', 256);

select * from `user` where `uid`='abc101' and `pass`=SHA2('zxcv123!', 256);

SELECT MAX(`no`) FROM `article`;

SELECT * FROM `article` AS a 
left JOIN `file` AS b ON a.`no`=b.ano 
WHERE `no`=8; 

SELECT a.*, b.nick FROM `article` AS a
JOIN `user` AS b
ON a.writer = b.uid
ORDER BY `no` DESC
LIMIT 10;

INSERT INTO `article` (`title`, `content`, `writer`, `regip`, `rdate`) SELECT `title`, `content`, `writer`, `regip`, `rdate` FROM `article`;

SELECT COUNT(*) FROM `article`;

DELETE FROM `article` WHERE `no` > 100;

SELECT * FROM `article` AS a
left JOIN `file` AS b ON a.`no`=b.ano
WHERE `no`='1';

update file set `download` = `download` + 1 where `fno`=2;
