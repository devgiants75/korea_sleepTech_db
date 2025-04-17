### 'l_뷰' 폴더 >>> 'view_practice' 파일 ###

### 뷰 연습 문제 ###
create database if not exists school;
use school;

-- students 테이블 생성 --
# student_id: 정수, 기본키
# first_name: 문자열(50),
# last_name: 문자열(50),
# age: 정수
# major: 문자열(50)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    major VARCHAR(50)
);

-- courses 테이블 생성 --
# cours_id: 정수, 기본키
# course_name: 문자열(100)
# instructor: 문자열(100)
# credit_hours: 정수
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100),
    credit_hours INT
);

-- student_courses 테이블 --
# student_id: 정수
# course_id: 정수
# >> 위의 두 컬럼을 복합키로 설정(기본키)
# >> 각 컬럼은 students, courses 테이블에서 참조
create table student_courses (
    student_id int,
    course_id int,
    primary key (student_id, course_id),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

INSERT INTO students (student_id, first_name, last_name, age, major)
VALUES (1, 'John', 'Doe', 20, 'Computer Science'),
       (2, 'Jane', 'Smith', 22, 'Mathematics'),
       (3, 'Alice', 'Johnson', 19, 'Biology'),
       (4, 'Bob', 'Brown', 21, 'History');

INSERT INTO courses (course_id, course_name, instructor, credit_hours)
VALUES (101, 'Introduction to Programming', 'Prof. Smith', 3),
       (102, 'Calculus I', 'Prof. Johnson', 4),
       (103, 'Biology 101', 'Prof. Davis', 3),
       (104, 'World History', 'Prof. Wilson', 3);
       
INSERT INTO student_courses (student_id, course_id)
VALUES (1, 101),
       (2, 102),
       (3, 103),
       (4, 104);


