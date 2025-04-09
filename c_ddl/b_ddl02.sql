### c_ddl 폴더 >> b_ddl02 파일 생성

# --- 데이베이스 ---
# 1. 생성(create)
create database if not exists database_name;
create database if not exists example;

# cf) if not exists 옵션
# : 데이터베이스의 유무를 확인하고 오류를 방지하는 SQL문
#   , 존재하지 않을 때만 새로 생성

# 2. 데이터베이스 선택(use)
# : 데이터베이스 선택 시 이후 모든 SQL 명령어가 선택된 DB 내에서 실행
# - GUI로 Navigator의 스키마명 더블 클릭과 동일

# cf) GUI(Graphical User Interface): 사용자가 컴퓨터와 상호작용 할 수 있도록 하는 시각적 인터페이스

USE database_name;
USE example;

# 3. 삭제(drop)
# : 데이터베이스 삭제, 해당 작업은 실행 후 되돌릴 수 X
drop database database_name;

# 4. 데이터베이스 목록 조회
# : 해당 SQL 서버에 존재하는 모든 데이터베이스(스키마) 목록을 확인
SHOW DATABASES;

# --- 테이블 ---
# 1. 테이블 생성 (create table)
use example;

create table students ( 
	# 테이블 생성시 DB명이 필수 X
    # USE 명령어를 통해 DB 지정이 되어 있는 경우 생략 가능
    # >> 오류 방지를 위해 작성을 권장
	student_id int primary key,
	name varchar(100) not null,
    age int not null,
    major varchar(100)
);

# 2. 테이블 구조 조회 (describe, desc)
# : 정의된 컬럼, 데이터 타입, 키 정보(제약 조건) 등을 조회
# : describe 테이블명;
# : desc 테이블명;

# cf) desc(descending): 내림차순

describe students;
desc students;

# cf) 테이블의 구조
# Field: 각 컬럼의 이름
# Type: 각 컬럼의 데이터 타입
# Null: Null(데이터 생략, 비워짐) 허용 여부
# Key: 각 컬럼의 제약 사항
# Default: 기본값 지정
# Extra: 제약 사항-추가옵션

# --- 테이블 수정 ---
# alter table
# : 이미 존재하는 테이블의 구조를 변경하는 데 사용
# - 컬럼 또는 제약 조건을 추가, 수정, 삭제

# 1) 컬럼 
### 컬럼 추가(add) ###
# alter table 테이블명 add column 컬럼명 데이터타입 기타사항;
alter table `students` add column email varchar(255);

desc students;

### 컬럼 수정(modify) ###
# alter table 테이블명 modify column 컬럼명 새로운컬럼_데이터타입;
alter table `students`
modify column email varchar(100);

desc students;

### 컬럼 삭제(drop) ###
# alter table 테이블명 drop column 컬럼명;
alter table `students`
drop email;

desc students;

# cf) 테이블 수정 시 column 키워드 생략 가능 (add, modify, drop 만 작성 가능)

# --- 테이블 데이터 삭제(초기화) ---
# truncate
# : 테이블의 모든 데이터를 삭제하고 초기 상태로 되돌림
# - DB, 테이블의 구조는 삭제되지 X

truncate table students;

select * from `students`; # 테이블 조회

# cf) drop: 전체 구조물을 삭제

# --- if exists / if not exists ---
# : 선택적 키워드, 테이블이 존재하거나 존재하지 않을 때만 실행
# - 오류 방지 키워드

drop table if exists `example`;
drop table students;