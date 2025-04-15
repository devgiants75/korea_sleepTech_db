### 'j_정규화' 폴더 >>> 'a_정규화' 파일 ###

### 정규화 ###

### 1. 정규화 개념 ###
# : '중복된 데이터를 제거', 데이터 '무결성을 유지'하기 위해 데이터를 구조화하는 과정
# - 비효율적으로 설계된 테이블을 더 나은 형태로 나누는 것

# cf) 데이터 중복
#     : 동일한 정보가 여러 테이블이나 같은 테이블의 여러 행에 중복해서 저장되는 현상
/*
	student_id / student_name / course_id / course_name / professor_name
    1            윤영서           101         챗봇        이승아
    1            윤영서           102         챗GPT       김준일
    2            전창현           102         챗GPT       김준일

	>> 학생 정보가 '여러 레코드'에 중복
*/

# cf) 이상 현상
#     : 비정규화된 테이블에서 발생하는 데이터 무결성 문제
#     >> 삽입 이상, 갱신 이상, 삭제 이상
/*
	1) 삽입 이상: 일부 정보만으로는 데이터 추가 불가
		EX) 수강생 없이 강의만 등록 불가
	2) 수정 이상: 중복된 데이터를 모두 수정해야 함
		EX) 같은 교수 이름을 여러 번 수정
	3) 삭제 이상: 데이터 삭제 시, 다른 중요한 정보도 함께 삭제
		EX) 학생을 삭제하면 강의 정보도 사라짐
*/
create database `normalization`; # 정규화: normalization
use `normalization`;

drop table `student_course`;

create table if not exists `student_course` (
	student_id int not null,
    student_name varchar(50) not null,
    course_id int not null,
    course_name varchar(50) not null,
    professor_name varchar(50) not null,
    # 복합 키: 두 개 이상의 컬럼을 PK키로 지정하는 제약 조건
    # - 지정된 여러 개의 컬럼이 결합되어 유일한 식별자로 존재
    #   >> 해당 각각의 컬럼이 컬럼 내에서는 중복 가능하지만, 둘을 합친 값은 테이블 내에서 고유
    primary key (student_id, course_id)
);

insert into `student_course`
values
	(1, '문창배', 101, '챗봇', '이승아'),
	(1, '문창배', 102, '챗GPT', '김준일'),
	(2, '진우태', 102, '챗GPT', '김준일'),
	(3, '조민지', 104, '디지털트윈', '안근수');

### 이상 현상 예시 ###
# 1) 삽입 이상
#    : 반드시 학생이 있어야 강의 정보 삽입이 가능! (오류)
-- insert into `student_course` (course_id, course_name, professor_name)
-- values
-- 	(105, '코리아IT', '조승범');

select * from `student_course`;

# 2) 수정 이상
#    : 오류 없이 수정 가능하지만, 각 행에서 조건을 찾아 일일이 변경해야하는 메모리 부담이 존재
update `student_course`
set professor_name = '김준이'
where
	course_id = 102;

select * from `student_course`;

# 3) 삭제 이상
delete from `student_course`
where	
	student_id = 3;
    
select * from `student_course`;

### 정규화 예시 ###
# 학생, 과목, 학생-과목 테이블
# 학생과 과목 간의 관계 (N:M, 다대다)
create table student (
	student_id int primary key,
    student_name varchar(50)
);

create table course (
	course_id int primary key,
    course_name varchar(50),
    professor_name varchar(50)
);

create table student_course_connect ( # 학생/과목 관계 테이블
	student_id int,
    course_id int,
    primary key (student_id, course_id), -- 복합 키 설정
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

insert into student
values
	(1, '양현석'),
	(2, '성재원'),
	(3, '최서윤');

insert into course
values
	(101, '챗봇', '이승아'),
	(102, '챗GPT', '김준일'),
	(103, '코리아IT', '조승범');

insert into student_course_connect
values
	(1, 101),
	(1, 102),
	(2, 101),
	(3, 103); # 복합키 설정으로, 두 개의 컬럼을 합친 내용이 다른 레코드와 중복 X

select * from student;
select * from course;
select * from student_course_connect;

-- 수강생 없이 새로운 과목만 등록
insert into course
values
	(104, '디지털트윈', '안근수');
    
-- 강사 이름 갱신(수정)
update course
set professor_name = '김준삼'
where
	professor_name = '김준일';

-- 수강 정보 삭제 시 학생과 과목 정보에 영향을 미치지 않음
delete from student_course_connect
where
	student_id = 3;
    
select * from student;
select * from course;
select * from student_course_connect;