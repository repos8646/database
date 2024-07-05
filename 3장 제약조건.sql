#날짜 : 2024/07/02
#이름 : 김보경
#내용 : 3장 제약조건

#실습3-1
create table `User2`(
	`uid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
    `addr` varchar(50)
    );
    
#실습3-2
insert into `user2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `user2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `user2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `user2` values ('A105', '강감찬', '1979-08-16', '서울시 관악구');
insert into `user2` values ('A106', '이순신', '1981-05-23', '부산시 진구');

#실습3-3
create table `user3`(
	`uid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
    `hp` char(13) unique,
    `addr` varchar(50)
    );

#실습3-4
insert into `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `user3` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
insert into `user3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `user3` values ('A105', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `user3` values ('A106', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
insert into `user3` values ('A107', '정약용', '1981-05-23', null, '부산시 진구');

#실습3-5
create table `Parent`(
	`pid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
    `addr` varchar(100)
    );
    
create table `Child`(
	`cid` varchar(10) primary key,
    `name` varchar(10),
    `hp` char(13) unique,
    `parent` varchar(10),
    foreign key (`parent`) references `parent` (`pid`)
    );

#실습3-6
insert into `parent` values ('p101', '김유신', '1968-05-09', '경남 김해시');
insert into `parent` values ('p102', '김춘추', '1972-11-23', '경남 경주시');
insert into `parent` values ('p103', '장보고', '1978-03-01', '전남 완도시');
insert into `parent` values ('p104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `parent` values ('p105', '이순신', '1981-05-23', '부산시 진구');

insert into `child` values ('c101', '김철수', '010-1234-1001', 'p101');
insert into `child` values ('c102', '김영희', '010-1234-1002', 'p101');
insert into `child` values ('c103', '강철수', '010-1234-1003', 'p104');
insert into `child` values ('c104', '이철수', '010-1234-1004', 'p105');
#insert into `child` values ('c105', '최철수', '010-1234-1005', 'p107'); parent와 연결되지 않아서 생성되지 않음

#실습3-7
create table `user4`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `gender` char(1), #DEFAULT NULL이 생략되어 있음
    `age` int default 1,
    `hp` char(13) unique,
    `addr` varchar(20)
    );

#실습3-8
insert into `user4` values ('a101', '김유신', 'M', '25', '010-1234-1111', '경남 김해시');
insert into `user4` values ('a102', '김춘추', 'M', '23', '010-1234-2222', '경남 경주시');
insert into `user4` values ('a103', '장보고', 'M', '35', '010-1234-3333', '전남 완도시');
insert into `user4` values ('a104', '강감찬', 'M', '42', '010-1234-4444', '서울시 관악구');
insert into `user4` (`uid`, `name`, `gender`, `hp`, `addr`) values ('a105', '이순신', 'M', '010-1234-5555', '부산시 진구');
insert into `user4` values ('a106', '신사임당', 'F', '32', null, '강릉시');
insert into `user4` values ('a107', '허난설헌', 'F', '27', null, '경기도 광주시');

#실습3-9
create table `user5`(
	`seq`	int primary key auto_increment,
    `name`	varchar(10) not null,
    `gender` char(1) check (`gender` in ('M', 'F')),
    `age`	int default 1 check (`age` > 0 and `age` < 100),
    `addr`	varchar(20)
    );

#실습3-10
insert into `user5` values (1, '김유신', 'M', 25, '경남 김해시');
insert into `user5` values (2, '김춘추', 'M', 23, '경남 경주시');
insert into `user5` values (3, '장보고', 'M', 35, '전남 완도시');
insert into `user5` values (4, '강감찬', 'M', 42, '서울시 관악구');
insert into `user5` values (5, '이순신', 'M', 51, '부산시');
insert into `user5` values (6, '신사임당', 'F', 61, '강릉시');

