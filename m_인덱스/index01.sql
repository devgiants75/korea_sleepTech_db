### 'm_인덱스' 폴더 >>> 'index01' 파일 ###

### 인덱스 ###
# : select 문으로 데이터 조회 시
#   , 원하는 데이터를 더 빠르게 찾아주는 도구
# - 데이터 검색 속도를 향상시켜 전체 시스템 성능을 높임

# EX) 책에서 원하는 단어를 찾을 때 사용하는 '찾아보기(색인)'

-- 1. 인덱스 종류 --
# 1) 클러스터형 인덱스
# : 기본키(PK) 설정 시 자동 생성
# - 테이블 당 단 하나만 생성 가능!
# - 자동 정렬 기능을 포함 O: 지정한 열(기본키 설정 열)을 기준으로 자동 정렬
# EX) 영어사전, 국어사전: 내용이 미리 정렬
use baseball_league;
select * from players; # player_id(pk값)을 기준으로 자동 정렬

# 2) 보조 인덱스
# : 고유키(unique key) 설정 시 자동 생성
# - 테이블 당 여러 개 생성 가능!
# - 자동 정렬 기능을 포함 X
# EX) 일반 서적: 색인(찾아보기) 등의 페이지 번호를 보고 해당 위치로 이동해야 내용 확인 가능

### 인덱스 사용 예시 ###
use market_db;
select * from member;

# 1. 자동으로 생성되는 인덱스
# : 테이블의 열(컬럼) 단위에 생성
# - 하나의 열에는 하나의 인덱스를 생성 가능

# market_db의 member 테이블을 인덱스로 정리!
# 1) 회원 아이디(mem_id, PK) 컬럼에 자동으로 '클러스터형 인덱스'가 생성

create table table1 (
	col1 int primary key,
    col2 int,
    col3 int
);

# 인덱스 정보 확인: show index form 테이블명;
# 1) Key_name: Primary (기본 키 설정으로 자동 생성된 인덱스)
#	>> Primary 키 설정으로 인덱스가 자동 부여됨
# 2) Coloumn_name: col1
#	>> col1에 인덱스가 부여되어 있음
# 3) Non_unique: 0
#   >> 0: False (중복 가능 여부) - 중복이 허용되지 않는 인덱스
#   >> 1: True - 중복 가능한 인덱스
show index from table1;

create table table2 (
	col1 int primary key,
    col2 int unique,
    col3 int unique
);
show index from table2;
# Key_name: 열 이름 지정 시 - 보조 인덱스
	# cf) PK - 클러스터형 인덱스
# Non_unique: 고유키도 중복 허용 X

### 인덱스 활용 ###
drop database 인덱스;
create database 인덱스;
use 인덱스;

drop table if exists members, purchases;

create table members (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    address char(2)
);

insert into members
values
	('IVE', '아이브', 5, '서울'),
	('BLK', '블랙핑크', 4, '경남'),
	('LSF', '르세라핌', 5, '경기'),
	('ASF', '에스파', 4, '부산');

select * from members; -- 클러스터형 인덱스가 없는 경우(PK값이 없는 경우): 데이터 삽입 순서대로 출력

show index from members; -- 인덱스 설정 X

-- 기본키 설정 (클러스터형 인덱스 생성)
alter table members
add constraint primary key (mem_id);

select * from members; -- PK값을 기준으로 출력 (클러스터형 인덱스)

show index from members;

insert into members 
values
	('SES', '에스이에스', 4, '대전');
# : 인덱스 저장 후(PK 설정 후) 추가 데이터 입력 시
# >> 정렬 기준에 따라 자동 정렬
select * from members;

-- 정렬 되지 않는 보조 인덱스 --
# : 고유 키 지정 시 생성 / 테이블 당 여러 개 가능 / 정렬 X
drop table if exists members;

create table members (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    address char(2)
);

insert into members
values
	('IVE', '아이브', 5, '서울'),
	('BLK', '블랙핑크', 4, '경남'),
	('LSF', '르세라핌', 5, '경기'),
	('ASF', '에스파', 4, '부산');

select * from members;
show index from members;

alter table members
	add constraint unique(mem_id);

select * from members;
insert into members
values
	('H2H', '하츠투하츠', 7, '광주'); -- 데이터 삽입 순서대로 출력

select * from members;

### 보조 인덱스의 경우 정렬되지 않지만 성능적인 향상이 이루어짐 ###