#날짜 : 2024/07/11
#이름 : 김보경
#내용 : SQL 연습문제4

#실습 4-1
create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on Theater.*TO 'theater'@'%';
flush privileges;

USE `theater`;

#실습 4-2
create table `Movies`(
	`movie_id` int primary key auto_increment,
    `title` varchar(30) not null,
    `genre` varchar(10) not null,
    `release_date` date not null
);

create table `Customers`(
	`customer_id` int primary key auto_increment,
    `name` varchar(20) not null,
    `email` varchar(50) not null,
    `phone` char(13) not null
);

create table `Bookings`(
	`booking_id` int primary key,
    `customer_id` int not null,
    `movie_id` int not null,
    `num_tickets` int not null,
    `booking_date` datetime not null
);

#실습 4-3
insert into `Movies` values (1, '쇼생크의 탈출', '드라마', '1994-10-14');
insert into `Movies` values (2, '타이타닉', '로맨스', '1997-03-24');
insert into `Movies` values (3, '탑건', '액션', '1987-07-16');
insert into `Movies` values (4, '쥬라기공원', '액션', '1994-02-11');
insert into `Movies` values (5, '글래디에이터', '액션', '2000-05-03');
insert into `Movies` values (6, '시네마천국', '드라마', '1995-04-12');
insert into `Movies` values (7, '미션임파서블', '액션', '1995-11-11');
insert into `Movies` values (8, '노트북', '로맨스', '2003-08-23');
insert into `Movies` values (9, '인터스텔라', 'SF', '2011-05-26');
insert into `Movies` values (10, '아바타', 'SF', '2010-02-10');

insert into `Customers` values (1, '김유신', 'kys@example.com', '010-1234-1001');
insert into `Customers` values (2, '김춘추', 'kcc@example.com', '010-1234-1002');
insert into `Customers` values (3, '장보고', 'jbg@example.com', '010-1234-1003');
insert into `Customers` values (4, '강감찬', 'kgc@example.com', '010-1234-1004');
insert into `Customers` values (5, '이순신', 'lss@example.com', '010-1234-1005');

insert into `Bookings` values (101, 1, 1, 2, '2023-01-10 00:00:00');
insert into `Bookings` values (102, 2, 2, 3, '2023-01-11 00:00:00');
insert into `Bookings` values (103, 3, 2, 2, '2023-01-13 00:00:00');
insert into `Bookings` values (104, 4, 3, 1, '2023-01-17 00:00:00');
insert into `Bookings` values (105, 5, 5, 2, '2023-01-21 00:00:00');
insert into `Bookings` values (106, 3, 8, 2, '2023-01-21 00:00:00');
insert into `Bookings` values (107, 1, 10, 4, '2023-01-21 00:00:00');
insert into `Bookings` values (108, 2, 9, 1, '2023-01-22 00:00:00');
insert into `Bookings` values (109, 5, 7, 2, '2023-01-23 00:00:00');
insert into `Bookings` values (110, 3, 4, 2, '2023-01-23 00:00:00');
insert into `Bookings` values (111, 1, 6, 1, '2023-01-24 00:00:00');
insert into `Bookings` values (112, 3, 5, 3, '2023-01-25 00:00:00');

#실습 4-4
select title from Movies;

#실습 4-5
select * from Movies where genre='로맨스';

#실습 4-6
select
	title,
    release_date
from Movies where `release_date` > '2010-01-01';

#실습 4-7
select
	booking_id, booking_date
from Bookings where num_tickets>=3;

#실습 4-8
select * from Bookings where booking_date < '2023-01-20';

#실습 4-9
select * from Movies where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10
select * from Bookings
order by booking_date DESC
limit 3;

#실습 4-11
select title, release_date from Movies
order by release_date ASC
limit 1;

#실습 4-12
select
	concat(title, ' - ', release_date) AS movie_info
from Movies
where genre = '액션' and title like '%공원%'
order by release_date ASC
limit 1;

#실습 4-13
# ON Booking.movie_id = Movies.movie_id 도 가능
select booking_date, title
from Bookings
join Movies
using (movie_id)
where customer_id = 2;

#실습 4-14
select
	`name`,
    `phone`,
    `booking_date`,
    `title`
from bookings B
join Customers c on b.customer_id = c.customer_id
join movies m on b.movie_id = m.movie_id;

#실습 4-15
select
	m.genre,
	avg(B.num_tickets) AS avg_tickets
from bookings B
join movies m on b.movie_id = m.movie_id
group by genre;

#실습 4-16
#일반적으로 PK 컬럼의 group by C.customer_id; 이 일반적임 -> 에러 나올 수 있음
#에러 나오면 아래 코드 입력
#SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select
	C.name,
    AVG(B.num_tickets) AS avg_tickets
from Bookings B
join Customers C ON B.customer_id = C.customer_id
group by name;

#실습 4-17
select
	C.name,
    SUM(B.num_tickets) AS `전체 예매 티켓 수`
from bookings B
join Customers C ON B.customer_id = C.customer_id
group by c.customer_id
order by `전체 예매 티켓 수` DESC;

#실습 4-18
select
	`booking_id`,
    `movie_id`,
    `name`,
    `booking_date`
from Bookings B
join Customers C ON B.customer_id = C.customer_id
order by B.booking_date ASC
limit 1;

#실습 4-19
select
	genre, title, release_date
from Movies
where (genre, release_date) IN(
	select genre, MAX(release_date)
    from Movies
    group by genre
);

#실습 4-20
select * from Movies
where movie_id IN (
	select movie_id from Bookings
    where customer_id = (select customer_id from Customers where `name`='김유신')
);

#실습 4-21
select name, email FROM Customers
where customer_id = (
	select customer_id
    from Bookings
    group by customer_id
    order by sum(num_tickets) DESC
    limit 1
);

#실습 4-22
select * from bookings
where num_tickets > (select avg(num_tickets) from Bookings);

#실습 4-23
select
	M.title, SUM(B.num_tickets) AS total_tickets
from Bookings B
join Movies M on B.movie_id = M.movie_id
group by M.title;

#실습 4-24
select
	c.name,
    SUM(b.num_tickets) AS total_tickets,
    AVG(b.num_tickets) AS avg_tickets
from Bookings b
join Customers c ON b.customer_id = c.customer_id
group by c.name;

#실습 4-25
#group by `c.name`도 가능
select
	c.customer_id,
    c.name,
    c.email,
    SUM(b.num_tickets) AS `예매 티켓수`
from Bookings b
join Customers c ON b.customer_id = c.customer_id
group by `customer_id`
order by `예매 티켓수` DESC;

#실습 4-26
select
	`name`,
    `title`,
    `num_tickets`,
    `booking_date`
from bookings b
join Customers c ON b.customer_id = c.customer_id
join movies m ON b.movie_id = m.movie_id
order by num_tickets DESC;

#실습 4-27 문제에 limit 1; 삭제
select
	M.title,
    M.genre,
    SUM(B.num_tickets) AS `예매 티켓 수`,
    AVG(B.num_tickets) AS `평균 티켓 수`
from bookings B
join Movies M ON B.movie_id = M.movie_id
where M.genre = '액션'
group by title
order by `평균 티켓 수` DESC;

#실습 4-28
select
	B.customer_id,
    C.name,
    SUM(`num_tickets`) AS `ticket_total`
from bookings B
join Customers C on B.customer_id = C.customer_id
group by customer_id
order by ticket_total DESC;

#실습 4-29 ###
select
	B.booking_id,
    B.customer_id,
    B.movie_id,
    MaxTickets.max_tickets
from Bookings B
join(
	select Movie_id, MAX(num_tickets) AS max_tickets
    from Bookings
    group by movie_id
) AS MaxTickets
on B.movie_id = MaxTickets.Movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습 4-30
#안되면 아래 코드 실행해보기
#SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT
	B.booking_id,
	B.customer_id,
	C.name,
	M.title,
	M.genre,	
	SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
HAVING `예매 티켓 수` = (
    SELECT MAX(total_tickets)
    FROM (
        SELECT SUM(B2.num_tickets) AS total_tickets
        FROM Bookings B2
        JOIN Movies M2 ON B2.movie_id = M2.movie_id
        WHERE M2.genre = M.genre
        GROUP BY M2.title
    ) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;