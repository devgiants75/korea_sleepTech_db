### c_ddl 폴더 >> d_datatype 파일 생성

# 날짜형, 열거형 데이터 타입

/*
	5. 날짜형
    : 날짜 및 시간을 저장할 때 사용
    
    a) date (3byte)
		: 날짜만 저장 / YYYY-MM-DD 형식
        EX) 기념일, 생일 등
    
    b) time (3byte)
		: 시간만 저장 / HH:mm:SS 형식
        EX) 수업 시간, 타이머 등

	c) datetime (8byte)
		: 날짜와 시간을 저장 / YYYY-MM-DD HH:mm:SS 형식
        EX) 주문 시간 / 가입 일자 등
*/
create database if not exists `example`;
use `example`;

create table `events` (
	event_name varchar(100),
    event_date DATE
);

insert into `events`
values ('Birthday', '2024-03-14');

select * from `events`;

/*
	6. 열거형 타입(enum)
    : 사전에 정의된 값의 집합 중 하나의 값을 저장
    - 제한된 값 목록 중 선택
*/
create table `rainbow` (
	color enum('red', 'orange', 'yellow', 'purple'),
    description varchar(100)
);

insert into `rainbow` 
values
	('red', '빨강'),
	('orange', '주황'),
	('yellow', '노랑'),
	('purple', '보라');

# Error Code: 1265. Data truncated for column 'color' at row 1	0.000 sec

insert into `rainbow` 
values
	('green', '초록');