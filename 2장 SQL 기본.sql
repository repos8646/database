#날짜 : 2024/07/01
#이름 : 김보경
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

create table `User1`(
	`uid` varchar(10),
    `name` varchar(10),
    `hp` char(13),
    `age` int
);

drop table `User1`;

#실습 2-2. 데이터 입력
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', '45');
INSERT INTO `User1` SET
						`uid`='A105',
                        `name`='이순신',
                        `hp`='010-1234-5555';
                        
#실습 2-3. 데이터 조회
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name`='김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >= 30;
select `uid`, `name`, `age` from `User1`;

#실습 2-4. 데이터 수정
set sql_safe_updates=0;
update `User1` set `hp`='010-1234-4444' where `uid`='A104';
update `User1` set `age`=51 where `uid`='A105';
update `User1` set `hp`='010-1234-1001', `age`=27 where `uid`='A101';

#실습 2-5. 데이터 삭제
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' and `age`=25;
delete from `User1` where `age` >= 30;

#실습 2-6. 테이블 컬럼 수정
alter table `User1` add `gender` tinyint;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1);
alter table `User1` modify `age` tinyint;
alter table `User1` drop `gender`;

#실습 2-7. 테이블 복사
create table `User1Copy` like `User1`;
insert into `User1Copy` select * from `User1`;

#실습 2-8. 아래와 같이 테이블을 생성 후 데이터를 입력하시오.
create table `Tb1User`(
	`user_id` varchar(10),
    `user_name` varchar(10),
    `user_hp` char(13),
    `user_age` int,
    `user_addr` varchar(10)
    );

insert into `Tb1User` values ('p101', '김유신', '010-1234-1001', '25', '경남 김해시');
insert into `Tb1User` values ('p102', '김춘추', '010-1234-1002', '23', '경남 경주시');
insert into `Tb1User` (`user_id`, `user_name`, `user_age`, `user_addr`) values ('p103', '장보고', '31', '전남 완도군');
insert into `Tb1User` set `user_id`='p104', `user_name`='강감찬', `user_addr`='서울시 중구';
insert into `Tb1User` set `user_id`='p105', `user_name`='이순신', `user_hp`='010-1234-1005', `user_age`=50;

create table `Tb1Product`(
	`prod_no` int,
    `prod_name` varchar(10),
    `prod_price` varchar(10),
    `prod_stock` int,
    `prod_company` varchar(10),
    `prod_date` char(10)
    );
    
insert into `Tb1Product` values ('1001', '냉장고', '800,000', '25', 'LG전자', '2022-01-06');
insert into `Tb1Product` values ('1002', '노트북', '1,200,000', '120', '삼성전자', '2022-01-07');
insert into `Tb1Product` values ('1003', '모니터', '350,000', '35', 'LG전자', '2023-01-13');
insert into `Tb1Product` values ('1004', '세탁기', '1,000,000', '80', '삼성전자', '2021-01-01');
insert into `Tb1Product` values ('1005', '컴퓨터', '1,500,000', '20', '삼성전자', '2023-10-01');
insert into `Tb1Product` set `prod_no`='1006', `prod_name`='휴대폰', `prod_price`='950,000', `prod_stock`='102';

#실습 2-9. 아래 SQL을 실행하시오.
select * from `Tb1User`;
select `user_name` from `Tb1User`;
select `user_name`, `user_hp` from `Tb1User`;
select * from `Tb1User` where `user_id`='p102';
select * from `Tb1User` where `user_id`='p104' or `user_id`='p105';
select * from `Tb1User` where `user_addr`='부산시 금정구';
select * from `Tb1User` where `user_age` > 30;
select * from `Tb1User` where `user_hp` is null;
update `Tb1User` set `user_age`=42 where `user_id`='p104';
update `Tb1User` set `user_addr`='부산시 진구' where `user_id`='p105';
delete from `Tb1User` where `user_id`='p103';

select * from `Tb1Product`;
select `prod_name` from `Tb1Product`;
select `prod_name`, `prod_company`, `prod_price` from `Tb1Product`;
select * from `Tb1Product` where `prod_company`='LG전자';
select * from `Tb1Product` where `prod_company`='삼성전자';
update `Tb1Product` set
						`prod_company`='삼성전자',
                        `prod_date`='2024-01-01'
                        where
                        `prod_no`=1006;