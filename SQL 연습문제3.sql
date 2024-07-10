#날짜 : 2024/07/10
#이름 : 김보경
#내용 : SQL 연습문제3

#실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on College.*TO 'college'@'%';
flush privileges;

USE `College`;

#실습 3-2
create table `Student` (
	`stdNo` varchar(8) primary key,
    `stdName` varchar(20) not null,
    `stdHp` varchar(13) not null,
    `stdYear` int not null,
    `stdAddress` varchar(100) default null
);

create table `Lecture` (
	`lecNo` int primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10) default null
);

create table `Register` (
	`regStdNo` varchar(8),
    `regLecNo` int not null,
    `regMidScore` int default null,
    `regFinalScore` int default null,
    `regTotalScore` int default null,
    `regGrade` varchar(1) default null
);

#실습 3-3
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`) values ('20201016', '김유신', '010-1234-1001', 3);
insert into `Student` values ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` values ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` values ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` values ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` values ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values (159, '인지행동심리학', 3, 40, '본304');
insert into `Lecture` values (167, '운영체제론', 3, 25, '본B05');
insert into `Lecture` values (234, '중급 영문법', 3, 20, '본201');
insert into `Lecture` values (239, '세법개론', 3, 40, '본204');
insert into `Lecture` values (248, '빅데이터 개론', 3, 20, '본B01');
insert into `Lecture` values (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
insert into `Lecture` values (349, '사회복지 마케팅', 2, 50, '본301');


#실습 3-4
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201126', 234);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016', 248);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016', 253);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201126', 239);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20210216', 349);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20210326', 349);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20201016', 167);
insert into `Register` (`regStdNo`, `regLecNo`) values ('20220416', 349);

#실습 3-5
select * from `Lecture`;

#실습 3-6
select * from `Student`;

#실습 3-7
select * from `Register`;

#실습 3-8
select * from `Lecture` where `lecCredit` = 2;

#실습 3-9
SET SQL_SAFE_UPDATES = 0;
#Edit > preferences > SQL Editor 가장 아래에 Safe upsates 체크 해제 후 다시 로그인 후 실행

update `Register` set `regMidScore` = 36, `regFinalScore` = 42 where `regStdNo`='20201126' AND `regLecNo`=234;
update `Register` set `regMidScore` = 24, `regFinalScore` = 62 where `regStdNo`='20201016' AND `regLecNo`=248;
update `Register` set `regMidScore` = 28, `regFinalScore` = 40 where `regStdNo`='20201016' AND `regLecNo`=253;
update `Register` set `regMidScore` = 37, `regFinalScore` = 57 where `regStdNo`='20201126' AND `regLecNo`=239;
update `Register` set `regMidScore` = 28, `regFinalScore` = 68 where `regStdNo`='20210216' AND `regLecNo`=349;
update `Register` set `regMidScore` = 16, `regFinalScore` = 65 where `regStdNo`='20210326' AND `regLecNo`=349;
update `Register` set `regMidScore` = 18, `regFinalScore` = 38 where `regStdNo`='20201016' AND `regLecNo`=167;
update `Register` set `regMidScore` = 25, `regFinalScore` = 58 where `regStdNo`='20220416' AND `regLecNo`=349;
select * from `Register`;


#실습 3-10
update `Register` set
	`regTotalScore`=`regMidScore` + `regFinalScore`,
    `regGrade` = if(`regTotalScore` >= 90, 'A',
					if(`regTotalScore` >= 80, 'B',
					if(`regTotalScore` >= 70, 'C',
					if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `Register`;

#실습 3-11
select * from `Register` order by `regTotalScore` DESC;

#실습 3-12
select * from `Register` where `regLecNo`='349' order by `regTotalScore` DESC;

#실습 3-13
select * from `Lecture` where `lecTime` >= 30;

#실습 3-14
select `lecName`, `lecClass` from `Lecture`;

#실습 3-15
select `stdNo`, `stdName` from `Student`;

#실습 3-16
select * from `Student` where `StdAddress` is null;

#실습 3-17
select * from `Student` where `stdAddress` like '부산%';

#실습 3-18 ###
select * from `Student` AS a
left join `Register` AS b
on a.stdNo = b.regStdNo;

#실습 3-19
select
	`stdNo`,
    `stdName`,
    `regLecNo`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` AS a
join `Register` AS b
on a.stdNo = b.regStdNo;

#실습 3-20
select `stdName`, `stdNo`, `regLecNo`
from `Student` AS a
join `Register` AS b
on a.stdNo = b.regStdNo
where `regLecNo` = 349;

#실습 3-21
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select
	`stdNo`,
    `stdName`,
    count(`stdNo`) AS `수강신청 건수`,
    sum(`regTotalScore`) AS `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) AS `평균`
from `Student` AS a
join `Register` AS b
on a.stdNo = b.regStdNo
group by `StdNo`;

#실습 3-22
select * from `Register` AS a
join `Lecture` AS b
on a.regLecNo = b.lecNo;

#실습 3-23
select
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Register` AS a
join `Lecture` AS b
on a.regLecNo = b.lecNo;

#실습 3-24
#where `lecname`='사회복지 마케팅'도 가능
select
	count(*) AS `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) AS `사회복지 마케팅 평균`
from `Register` AS a join `Lecture` AS b
on a.regLecNo = b.lecNo
where `lecNo` = 349;
    
#실습 3-25
select
	`regStdNo`,
    `lecName`
from `Register` AS a join `Lecture` AS b on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습 3-26
select * from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo;

#실습 3-27
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
order by `regTotalScore` DESC;

#실습 3-28
select
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
where `regGrade` = 'F';

#실습 3-29
#!= or <> 가능
select
	`stdNo`,
    `stdName`,
	sum(`lecCredit`) AS `이수학점`
from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
where `regGrade` != 'F'
group by `stdNo`;

#실습 3-30
select
	`stdNo`,
    `stdName`,
	group_concat(`lecName`) AS `신청과목`,
    group_concat(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
group by `stdNo`;