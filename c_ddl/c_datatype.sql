### c_ddl 폴더 >> c_datatype 파일 생성

# --- DataType --- #

### SQL의 데이터 형식 ###
# 정수형, 문자형, 실수형, 논리형, 날짜형

/*
	1. 정수형
    : 숫자 데이터를 저장하는 데 사용
    - 데이터 타입에 따라 메모리 사용 공간이 다름
    
    a) tinyint (1byte: 8bit)
    : -128 ~ 127
    EX) 나이, 성별코드, 성적 등
    
    b) smallint (2byte: 16bit)
    : -32,768 ~ 32,767
    EX) 사원 번호, 우편 번호 등
    
    c) int (4byte: 32bit)
    : 약 -21억 ~ 약 21억
    : 일반적인 용도로 가장 많이 사용되는 정수형 타입
    EX) 주문 번호, 고객 ID 등
    
    d) bigint (8byte: 64bit)
    : 약 -900경 ~ 약 900경
    EX) 금융권, 천문학에서 주로 사용 / 각 테이블의 식별값
*/
create database if not exists `example`;
use `example`; 
# DB명, 테이블명, 컬럼명은 ``(백틱)으로 구분

create table `integer`(
	# 컬럼명 데이터타입 제약사항,
	t_col tinyint,
    s_col smallint,
    i_col int,
    b_col bigint
);

# insert 키워드: 데이터 '삽입'
# insert into 테이블명 value (레코드값을 컬럼 순으로 콤마로 구분하여 나열);
insert into `integer`
value (127, 32767, 200000000, 9000000000000);

select * from `integer`;

# Out of range 오류: 해당 데이터 타입의 범위를 벗어나는 경우 발생
# Error Code: 1264. Out of range value for column 't_col' at row 1	0.000 sec
-- insert into `integer`
-- value (128, 32767, 200000000, 9000000000000);

# cf) unsigned: 부호가 없는 정수
# : 각 숫자형 데이터 타입의 시작을 0부터 시작
# - 범위는 그대로 인식 (EX. tinyint: 0 ~ 255까지)
# EX) 키, 나이, 가격 등 음수값이 없는 데이터 설정 시 사용
create table person(
	age tinyint unsigned, -- 나이 (0 ~ 255)
    height smallint unsigned -- 키 (0 ~ 65535)
);

insert into person
values (128, 32768);

/*
	2. 문자형
    : 텍스트 데이터 저장
    : char(개수), varchar(개수)

	cf) char: character 문자열
		varchar: variable character field 가변 길이 문자열
        
	a) char(개수)
    : 고정 길이 문자형, 1 ~ 255 바이트
    : 길이가 항상 일정하기 때문에 검색 속도가 빠름
    : 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    - 성별, 국가코드(KOR, CHI, USA) 등
    
    EX) char(10)의 10자리 중에서 3자리만 사용하는 경우, 7자리가 비워진 상태로 메모리 낭비
    
    b) varchar(개수)
    : 가변 길이 문자형, 1 ~ 1638 바이트
    : 길이가 일정하지 않아 검색 속도가 느림
    : 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    : 비워진 메모리는 사라져서 메모리 누수를 방지
    - 주소, 상품명 등
    
    EX) varchar(10)의 10자리 중에서 3자리만 사용하는 경우, 7자리는 사라짐
    
    cf) 문자 수와 바이트 수의 차이
    영어: 1바이트에 1개의 알파벳 - char(3): KOR
    한글: utf-8 인코딩 기준 한 글자당 약 3바이트를 사용
    
    varchar(255): 255 / 3 = 약 85 글자
    
    cf) 다량의 텍스트 데이터 형식
    
		a) text 형식: 1 ~ 약 65000 바이트
		   longtext 형식: 1 ~ 약 42억 바이트
           
	    b) blob (binary long object): 이미지, 동영상 등의 데이터
		   - 1 ~ 약 65000 바이트
		   longblob: 1 ~ 약 42억 바이트
*/

create table `character` (
	name varchar(100), -- 제품명(가변길이)
    category char(10), -- 카테고리(고정길이)
    description text, -- 제품 설명(대용량 텍스트)
    image blob
);

insert into `character`
values ('Laptop', '전자제품', '삼성 갤럭시 북4 노트북 프로', 'example.com');






