### d_dml 폴더 >> c_제약조건 파일 ###

drop database if exists `example`;
create database `example`;

use `example`;
/*
	4. Check 제약 조건
    : 입력되는 데이터를 점검하는 기능
    - 테이블의 열에 대해 특정 조건을 설정, 조건을 만족하지 않는 경우 입력을 막음
*/

create table employees (
	id int primary key,
    name varchar(100),
    age int(100)
    # check 제약 조건 사용 방법
    # check (조건 작성 - 조건식은 다양한 연산자 사용)
    check (age >= 20)
);

insert into `employees`
values
	(1, '진우태', 20);
    
insert into `employees`
values
	(2, '조민지', 19); # 데이터 삽입 불가
    
insert into `employees`
values
	(3, null, 23);

select * from `employees`;

/*
	5. not null 제약 조건
    : 특정 열에 null 값을 허용하지 X
    : 비워질 수 없음!
*/

create table `contacts` (
	contact_id int primary key, -- PK값은 not null 지정하지 않아도 자동 not null!
	name varchar(100) not null,
    phone varchar(100) not null
);

-- insert into `contacts`
-- values
-- 	(0, '양현석', '1234'),
--     # Error Code: 1048. Column 'phone' cannot be null
-- 	(2, '양현석', null),
-- 	(3, '성재원', '1234');

/*
	6. default 제약 조건
    : 테이블의 열에 값이 명시적으로 제공되지 않는 경우 사용되는 기본값
    - 선택적 필드에 대해 데이터 입력을 단순화 - 데이터 무결성 유지
*/

create table `cart` (
	cart_id int primary key,
    product_name varchar(100),
    -- default 제약조건 
    -- 컬럼명 데이터타입 default 기본값(데이터타입을 지켜야 함!)
    quantity int default 1
);

insert into `cart`
values
	(1, '노트북', 3),
	(2, '스마트폰', null), # null 값 입력 시 null 값이 지정 (기본값 설정 X)
	(3, '태블릿', 2);
    
select * from `cart`;

insert into `cart` (cart_id, product_name)
values
	(4, '이어폰');

select * from `cart`;

# cf) 제약 조건 사용 시 여러 개 동시 지정 가능
# EX) not null + check
create table `multiple` (
	multiple_col int not null check(multiple_col > 10)
);

insert into `multiple`
values
	(11);
    
drop database if exists `example`;