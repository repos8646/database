#날짜 : 2024/07/08
#이름 : 김보경
#내용 : SQL 연습문제1 실습하기

#실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.* to 'shop'@'%';
flush privileges;

USE shop;

#실습 1-2
create table `Customer`(
	`custId` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` char(13) default null,
    `addr` varchar(100) default null,
    `rdate` date not null
);

create table `Product`(
	`prodNo` int primary key,
    `prodName` varchar(10) not null,
    `stock` int default 0,
    `price` int default null,
    `company` varchar(20) not null
);

create table `Order`(
	`orderNo` int primary key auto_increment,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int default 1,
    `orderDate` datetime not null
);

#실습 1-3

insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` (`custId`, `name`, `rdate`) values ('c105', '이성계', '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` (`custId`, `name`, `rdate`) values ('c107', '허준', '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, 1800, '농심');
INSERT INTO `Product` (`prodNo`, `prodName`, `stock`, `company`) VALUES (5, '죠리퐁',   2200, '크라운');

#insert into `Product` (`ProdNo`, `prodName`, `stock`, `campany`) values (5, '죠리퐁', 2200, '크라운');
insert into `Product` values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', 6, 1, '2022-07-05 14:21:03');

#실습 1-4
select * from `Customer`;

#실습 1-5
select `custId`, `name`, `hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct `company` from `Product`;

#실습 1-9
select `prodName`, `price` from `Product`;

#실습 1-10 ###
select
	`prodName`,
	`price` + 500 as `조정단가`
from `Product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId`='c102' AND `orderCount`>=2;

#실습 1-14
select * from `Product` where `price` <= 2000 AND `price` >= 1000;

#실습 1-15
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습 1-16
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습 1-17 ###
select * from `Customer` where `hp` is null;

#실습 1-18 ###
select * from `Customer` where `addr` is not null;

#실습 1-19
select * from `Customer` order by `rdate` DESC;

#실습 1-20 #수량같으면 제품번호를 기준으로 오름차순 정렬 을 못품
select * from `Order` where `orderCount` >= 3
order by `orderCount` DESC, `orderProduct` asc;


#실습 1-21
select avg(`price`) from `Product`;

#실습 1-22
select sum(`stock`) AS `재고량 합계` from `Product` where `company`='농심';

#실습 1-23
select count(*) AS `고객수` from `Customer`;

#실습 1-24
select count(distinct `company`) AS `제조업체 수` from `Product`;

#실습 1-25 ###
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select
	`orderProduct` AS `주문 상품번호`,
	SUM(`orderCount`) AS `총 주문수량`
from `Order`
group by `orderProduct`;

#실습 1-26 ###
select
	`company` AS `제조업체`,
	count(*) AS `제품수`,
    MAX(`price`) AS `최고가`
from `Product`
group by `company`;

#실습 1-27 ###
select
	`company` AS `제조업체`,
	count(*) AS `제품수`,
	MAX(`price`) AS `최고가`
from `Product`
group by `company`
having `제품수` >=2 ;

#실습 1-28 ###
select
	`orderProduct`,
	`orderId`,
    sum(`orderCount`) AS `총 주문수량`
from `Order`
group by `orderId`, `orderProduct`
order by `orderProduct` ASC;

#실습 1-29
select
	a.orderId,
	b.prodName
from `Order` AS a
Join `Product` AS b
ON a.orderProduct = b.prodNo
WHERE `orderid` = 'c102';

#실습 1-30 ##
select `orderid`, `name`, `prodName`, `orderDate` from `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `product` AS c
ON a.orderProduct = c.prodNo
WHERE substr(`orderDate`, 1, 10) = '2022-07-03';