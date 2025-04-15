### 'j_정규화' 폴더 >>> '제2정규화' 파일 ###

### 제2정규화 (2NF: Second normal form) ###
# : 정규화의 두 번째 단계
# - 1NF(제1정규화)를 만족하면서 '모든 비기본 속성(일반 컬럼)'이 기본키에 완전히 종속되는 상태
# - 완전 함수적 종속 상태

# cf) 기본키(PK): 각 행을 고유하게 식별하는 컬럼
# cf) 비기본 속성: 기본키가 아닌 나머지 컬럼들

# cf) 완전 함수적 종속
#     : 속성이 기본키 전체에 종속되어 있으며 기본키 일부분만으로는 결정할 수 없는 경우
#     - 비기본 속성이 '기본키 전체'에 의존하는 것
#     EX) 기본키가 (A, B)일 때, C가 A나 B 하나만으로 결정되지 않고, A와 B 모두 알아야 C가 정해진다면 완전 종속

# cf) 부분 함수적 종속
# 	  : 비기본 속성이 기본키의 일부에만 의존하는 것
#     EX) 기본키가 (A, B)일 때, D는 A 만으로 결정된다면 >> 부분 종속 >> 2NF에 위반

### 2NF(제2정규화) 과정 ###
# 1. 1NF를 만족: 컬럼에 중복 데이터 없이, 원자값으로 구성
# 2. 기본키가 복합키일 때, 모든 비기본 속성이 기본키 전체에 의존!해야 함

-- 부서 테이블
create table departments (
	department_id varchar(50) primary key, -- 기본키
    location varchar(50), -- 부서 위치 
    supervisor_id varchar(50) -- 부서장 ID
);

-- 직원 테이블
create table employees (
	employee_id varchar(10) primary key, -- 기본 키
    department_id varchar(50), -- 직원이 속한 부서
    
    foreign key (department_id) references departments(department_id)
);

# 데이터 삽입 #
insert into departments
values
	('HR', 'seoul', 's1'),
	('SALES', 'busan', 's2'); -- location과 supervisor_id 속성이 기본 키에 완전 종속
    
insert into employees
values
	('e1', 'SALES'),
	('e2', 'HR'),
	('e3', 'SALES'),
	('e4', 'HR');
    
# 1) 1NF 상태: 각 컬럼에 원자값만 존재
# 2) 기본키 employee_id
# 3) 직원의 기본키를 제외하고는 기본 키에 완전 종속

# >> 두 테이블 모두 2NF를 만족

### 제2정규형을 위반한 테이블 ###
create table wrong_2nf (
	employee_id varchar(10), -- 직원 고유 식별자
    department varchar(50), -- 부서명
    location varchar(50), -- 부서 위치 (문제 발생!, 2NF 위반: department 만으로 결정!)
    
    primary key (employee_id, deparment) -- 복합키
);

# >> 부분 종속이 발생하면 테이블을 분리하여 해결하는 것이 2NF를 지키는 방법
#    : 테이블을 나누어 각각의 비기본 속성이 완전 종속이 되도록 설계