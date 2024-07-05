#날짜 : 2024/07/03
#이름 : 김보경
#내용 : 4장 SQL 고급

#실습 4-1
create table `Member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` char(13) unique not null,
    `pos` varchar(10) default '사원',
    `dep` tinyint,
    `rdate` datetime not null
    );
    
create table `Department`(
	`depNo` tinyint primary key,
    `name` varchar(10) not null,
    `tel` varchar(12) not null
    );
    
create table `Sales`(
	`seq` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int
    );

#실습 4-2
insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19 11:39:48');
insert into `Member` values ('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
insert into `Member` values ('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
insert into `Member` values ('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values ('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
insert into `Member` values ('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values ('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
insert into `Member` values ('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48');
insert into `Member` values ('a111', '박지원', '010-1234-1011', '사원', 105, '2020-11-19 11:39:48');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

insert into `Department` values (101, '영업1부', '051-512-1001');
insert into `Department` values (102, '영업2부', '051-512-1002');
insert into `Department` values (103, '영업3부', '051-512-1003');
insert into `Department` values (104, '영업4부', '051-512-1004');
insert into `Department` values (105, '영업5부', '051-512-1005');
insert into `Department` values (106, '영업지원부', '051-512-1006');
insert into `Department` values (107, '인사부', '051-512-1007');

#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' and dep=101;
select * from `Member` where `pos`='차장' or dep=101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추'; # <> 와 != 같은 의미 (같지 않다.)
select * from `Member` where `pos`='사원' or `pos`='대리';
select * from `Member` where `pos` IN('사원', '대리'); #위의 OR 문장과 같은 것임
select * from `Member` where `dep` IN(101, 102, 103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';

select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` >= 50000 and `sale` < 100000 and `month`=1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale`not between 50000 and 100000;

select * from `sales` where `year` in(2020);
select * from `sales` where `month` in(1, 2);


#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;

select * from `Member` order by `name`; #뒤에 기본적으로 ASC가 생략되어 있음
select * from `Member` order by `name` DESC;
select * from `Member` order by `name` ASC;

select * from `Sales` where `sale` > 50000 order by `sale` DESC;
select * from `Sales` where `sale` > 50000 order by `year`, `month`, `sale` DESC;


#실습 4-5
select * from Sales limit 3;
select * from Sales limit 0, 3; # 0은 index, 3은 size
select * from Sales limit 1, 2;
select * from Sales limit 5, 3;
select * from Sales order by `sale` DESC limit 3, 5;
select * from Sales where `sale` < 50000 order by `sale` DESC limit 3;
select * from Sales where `sale` > 50000
					order by `year` DESC, `month`, `sale` DESC
                    limit 5;


#실습 4-6
select sum(sale) as `합계` from `Sales`;
select avg(sale) as `평균` from `Sales`;
select max(sale) as `최대값` from `Sales`;
select min(sale) as `최소값` from `Sales`;

select ceiling(1.2);
select ceiling(1.8);

select floor(1.2);
select floor(1.8);

select round(1.2);
select round(1.8);
select rand();
select ceiling(rand() * 10);
select count(sale) as `갯수` from `Sales`;
select count(*) as `갯수` from `Sales`; # *의미 : all

select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6, 5);
select concat('Hello', 'World') as `결과`; #concat : 연결
select concat(`uid`, `name`, `hp`) from `member` where `uid`='a108';

select curdate();
select curtime();
select now();
insert into `Member` values ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());



#실습 4-7. 2018년 1월 매출의 총합을 구하시오.
select sum(sale) as `2018년 1월 매출 총합`
from `Sales` where `year` in(2018) and `month`=1 ;

#실습 4-8. 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select
	sum(`sale`) as `총합`,
    avg(`sale`) as `평균`
    from `Sales`
where
	sale > 50000 and
	`year`= 2019 and
    `month`=2;


select avg(sale) from `Sales` where sale > 50000 and `year` in(2019) and `month`=2;


#실습 4-9. 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오.
select
	MIN(sale) as `최저매출`,
    MAX(sale) as `최고매출`
from `Sales`
where `year`=2020;


select * from `Sales` where `year`=2020 order by `sale` ASC limit 0, 1;
select * from `Sales` where `year`=2020 order by `sale` DESC limit 0, 1;


#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;

select `uid`, count(*) as `건수` from `Sales` group by `uid`;
select `uid`, sum(sale) as `합계` from `Sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `Sales` group by `uid`;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
group by `uid`, `year`;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
group by `uid`, `year`
order by `year` ASC, `합계` DESC;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` DESC;


#실습 4-11
select `uid`, sum(`sale`) as `합계`
from `Sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` DESC;


#실습 4-12
create table `Sales2` like `Sales`; # 테이블 복사
insert into `Sales2` select * from `Sales`;

set sql_safe_updates=0; # 조건 없이 update 모드 해제
update `Sales2` set `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
select * from `Sales` where `sale` >= 100000
union
select * from `Sales2` where `sale` >= 100000;

select `uid`, `year`, `sale` from Sales
union
select `uid`, `year`, `sale` from Sales2;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `Sales2`
group by `uid`, `year`
order by `year` ASC, `합계` DESC;

#실습 4-13 inner 생략 가능
select * from `Sales` inner join `Member` on `Sales`.`uid` = `Member`.`uid`;
select * from `Member` inner join `Department` on `Member`.dep = `Department`.depNo;

select * from `Sales` as a
join `Member` as b
on a.uid = b.uid;
select * from `Member` as a join `Department` as b on a.dep = b.depNo;

select * from `Sales` as a, `Member` as b where a.uid = b.uid;
select * from `Member` as a, `department` as b where a.dep = b.depNo;

select
	a. `seq`,
	a. `uid`,
    a. `sale`,
    b. `name`,
    b. `pos`
from `Sales` as a
join `Member` as b
using (`uid`);

select
	a. `seq`,
    a. `uid`,
    `sale`,
    `name`,
    `pos`
from `Sales` as a
join `Member` as b
using(uid);

select
	a.`seq`,
    a.`uid`,
    `sale`,
    `name`,
    `pos`
from `Sales` as a
join `Member` as b on a.`uid` = b.`uid`
where `sale` >= 100000;
#
select
	a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(`sale`) as `합계` from `Sales` as a
	join `Member` as b on a.uid = b.uid
    group by a.`uid`, a.`year` having `합계` >=100000
    order by a. `year` ASC, `합계` DESC;
    # ------------------------------------------------
select * from `Sales` AS a
join `Member` AS b on a.uid = b.uid
join `Department` AS c ON b.dep = c.depNo;

select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a
join `Member` AS b ON a.uid = b.uid
join `Department` AS c ON b.dep = c.depNo;

select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` fROM `Sales` AS a
join `Member` AS b on a.uid = b.uid
join `Department` AS c ON b.dep = c.depNo
where `sale` > 100000
order by `sale` DESC;

#실습 4-14
select * from `Sales` AS a left join `Member` AS b ON a.uid = b.uid;
select * from `Sales` AS a right join `Member` AS b ON a.uid = b.uid;
select a.seq, a.uid, `sale`, `name`, `pos` from Sales AS a
left join member AS b using(uid);

select a.seq, a.uid, `sale`, `name`, `pos` FROM Sales AS a
right join Member AS b using(uid);

#실습 4-15. 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select
	`uid`,
	a.`name` as `직원명`,
    `pos`,
    b.`name` as `부서명`
from `Member` AS a
join `Department` AS b
ON a.dep = b.depNo;

#실습 4-16. '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select
	a.`uid`,
    `name`,
	SUM(`sale`) as `2019년도 매출합`
from `Sales` AS a
join `Member` AS b
on a.uid = b.uid
where
	`year`=2019 and
	`name`='김유신';

#실습 4-17. 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬
select 
	b.`name` AS `직원명`,
	c.`name` AS `부서명`,
	b.`pos`  AS `직급`,
	a.`year` AS `년도`,    
	SUM(`sale`) as `매출합`
from `Sales`      a
join `Member`     b on a.uid = b.uid
join `Department` c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `매출합` >= 100000
order by `매출합` DESC;