#날짜 : 2024/07/01
#이름 : 김보경
#내용 : 1장 데이터베이스 개요와 MySQL 설치

#실습 1-1. MySQL 접속, 데이터베이스 생성 및 삭제
CREATE DATABASE `StudyDB`;
show databases;

drop database `StudyDB`;

#실습1-2. 일반 관리자 생성 및 권한 부여
create user 'repos8646'@'%' identified by '1234';

grant all privileges on studyDB.*To'repos8646'@'%';

flush privileges;

#실습1-3. 사용자 비밀번호 수정 및 삭제
#alter user 'repos8646'@'%' identified by '1234'; #바꿀 비밀번호

#drop user 'repos8646'@'%';

#flush privileges;