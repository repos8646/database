#날짜 : 2024/07/12
#이름 : 김보경
#내용 : SQL 연습문제5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* TO 'bookstore'@'%';
flush privileges;

#실습 5-2
USE `bookstore`;

create table `Customer`(
	`custId` int primary key AUTO_INCREMENT not null,
    `name` varchar(10) not null,
    `address` varchar(20) default NULL,
    `phone` char(13) default null
);

create table `Book`(
	`bookId` int primary key not null,
    `bookName` varchar(20) not null,
    `publisher` varchar(20) not null,
    `price` int default null
);

create table `Order`(
	`orderId` int primary key AUTO_INCREMENT not null,
    `custId` int not null,
    `bookId` int not null,
    `salePrice` int not null,
    `orderDate` date not null
);

#실습 5-3
insert into `Customer` (`name`, `address`, `phone`) values ('박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`name`, `address`) values ('박세리', '대한민국 대전');

insert into `Book` values (1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values (2, '축구아는 여자', '나무수', 13000);
insert into `Book` values (3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values (4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values (5, '피겨 교본', '굿스포츠', 8000);
insert into `Book` values (6, '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values (7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values (8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values (9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values (10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (1, 1, 6000, '2014-07-01');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (1, 3, 21000, '2014-07-03');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (2, 5, 8000, '2014-07-03');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (3, 6, 6000, '2014-07-04');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (4, 7, 20000, '2014-07-05');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (1, 2, 12000, '2014-07-07');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (4, 8, 13000, '2014-07-07');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (3, 10, 12000, '2014-07-08');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (2, 10, 7000, '2014-07-09');
insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values (3, 8, 13000, '2014-07-10');

#실습 5-4
select `custid`, `name`, `address` from `customer`;

#실습 5-5
select `bookname`, `price` from `Book`;

#실습 5-6
select `price`, `bookname` from `Book`;

#실습 5-7
select * from `Book`;

#실습 5-8
select `publisher` from `book`;

#실습 5-9
select distinct `publisher` from `book`;
select `publisher` from `book` group by `publisher`;

#실습 5-10
select * from `book` where `price` >= 20000;

#실습 5-11
select * from `book` where `price` < 20000;

#실습 5-12
select * from `book` where `price` >= 10000 and `price` <= 20000;

#실습 5-13
select * from `book` where `price` >= 15000 and `price` <= 30000;

#실습 5-14 ###
select * from `book` where `bookid` IN(2, 3, 5);
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;

#실습 5-15
select * from `Book` where MOD(`bookid`, 2) = 0;
select * from `book` where `bookid` % 2 = 0;

#실습 5-16
select * from `Customer` where `name` like '박%';

#실습 5-17
select * from `Customer` where `address` like '%대한민국%';

#실습 5-18
select * from `Customer` where `phone` is not null;

#실습 5-19
select * from `book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');

#실습 5-20
select `publisher` from `Book` where `bookname` = '축구의 역사';

#실습 5-21
select `publisher` from `Book` where `bookname` like '%축구%';

#실습 5-22 ###
select * from `book` where `bookname` like '_구%';

#실습 5-23
select * from `Book` where `price` >= 20000 and `bookname` like '%축구%';
SELECT * FROM `Book` WHERE `bookName` LIKE '%축구%' AND `price` >= 20000;

#실습 5-24
select * from `Book` order by `bookname`;

#실습 5-25
select * from `book` order by `price` ASC, `bookname` ASC;

#실습 5-26
select * from `book` order by `price` DESC, `publisher` ASC;

#실습 5-27
select * from `book` order by `price` DESC limit 3;

#실습 5-28
select * from `book` order by `price` ASC limit 3;

#실습 5-29
select SUM(`saleprice`) as `총판매액` from `Order`;

#실습 5-30
select
	SUM(`saleprice`) as `총판매액`,
    AVG(`saleprice`) as `평균값`,
    MIN(`saleprice`) as `최저가`,
    MAX(`saleprice`) as `최고가`
from `Order`;

#실습 5-31 
select count(*) as `판매건수` from `Order`;

#실습 5-32 ###
select 
	`bookid`,
    replace(`bookname`, '야구', '농구') AS `bookname`,
    `publisher`,
    `price`
from `book`;

#실습 5-33 ###
select
	`custid`,
    count(*) AS `수량`
from `Order`
where `saleprice` >= 8000
group by `custid`
having `수량` >= 2;

#실습 5-34
select * from `customer` AS a
join `Order` AS b ON a.custId = b.custId;

SELECT * FROM `Customer` JOIN `Order` USING(`custId`);

SELECT * FROM `Customer` a, `Order` b 
	WHERE a.custId = b.custId;

#실습 5-35
select * from `customer` AS a
join `Order` AS b ON a.custId = b.custId
order by a.`custID` ASC;

#실습 5-36
select
	`name`,
    `saleprice`
from `customer` AS a
join `Order` AS b ON a.custId = b.custId;

#실습 5-37
select
	`name`,
    sum(`saleprice`)
from `customer` AS a
join `Order` AS b ON a.custId = b.custId
group by `name`
order by `name`;

#실습 5-38
select
	`name`,
    `bookname`
from `customer` AS a
join `Order` AS b ON a.custId = b.custId
join `Book` AS c on b.bookId = c.bookId;

#실습 5-39
select
	`name`,
    `bookname`
from `customer` AS a
join `Order` AS b ON a.custId = b.custId
join `Book` AS c on b.bookId = c.bookId
where `saleprice` = 20000;

#실습 5-40 ###
select
	`name`,
    `saleprice`
from `customer` AS a
left join `Order` AS b ON a.custId = b.custId;

#실습 5-41
select
	SUM(`saleprice`) AS `총매출`
from `customer` AS a
join `Order` AS b ON a.custId = b.custId
where `name` = '김연아';

SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');

#실습 5-42
select `bookname` from `book` order by `price` desc limit 1;
select `bookname` from `book` where `price`=(select MAX(`price`) from `book`);

#실습 5-43 ###
# b.custid 대신 `orderId`도 가능
select
	`name`
from `customer` AS a
left join `Order` AS b ON a.custId = b.custId
where b.custid is NULL;

#실습 5-44
insert into `Book` (`bookid`, `bookname`, `publisher`) values (11, '스포츠의학', '한술의학서적');

#실습 5-45
update `customer` set `address` = '대한민국 부산' where  `custid`= 5;

#실습 5-46
delete from `customer` where `custid` = 5;