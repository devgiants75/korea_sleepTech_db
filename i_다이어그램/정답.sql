### 'i_다이어그램' 폴더 >>> '정답' 파일 ###

CREATE DATABASE school_db;
USE school_db;

###
# 테이블 간 관계
###
# 1. 교수-강의(1:N, 일대다)
# : 한 명의 교수는 여러 강의를 담당
# : 강의 테이블에 담당교수ID 존재 - FK 참조값
# - ERD 선: 점선(비식별 관계)
#   >> 교수ID가 FK로만 사용 (PK X)

# 2. 학생 - 수강내역 - 강의 관계 (N:M, 다대다)
# : 학생은 여러 강의를 수강할 수 있고
# : 한 강의는 여러 학생이 수강할 수 있음
# >> 다대다(N:M)관계는 RDB에서 직접적인 표현이 불가! 
#    : 중간 테이블로 해결
# - 다대다(N:M)관계는 두 개의 1:N 관계로 분해
		# 학생 - 수강 내역 (1:N)
		# 강의 - 수강 내역 (1:N)

-- Students 테이블 생성
CREATE TABLE Students (
    학생ID INT PRIMARY KEY,
    이름 VARCHAR(100),
    전공 VARCHAR(100),
    입학년도 INT
);

-- Professors 테이블 생성
CREATE TABLE Professors (
    교수ID INT PRIMARY KEY,
    이름 VARCHAR(100),
    학과 VARCHAR(100),
    사무실위치 VARCHAR(100)
);

-- Courses 테이블 생성
CREATE TABLE Courses (
    강의ID INT PRIMARY KEY,
    강의명 VARCHAR(100),
    담당교수ID INT,
    학점수 INT,
    FOREIGN KEY (담당교수ID) REFERENCES Professors(교수ID)
);

-- Enrollments 테이블 생성
CREATE TABLE Enrollments (
    수강ID INT PRIMARY KEY,
    학생ID INT,
    강의ID INT,
    수강년도 INT,
    학기 INT,
    FOREIGN KEY (학생ID) REFERENCES Students(학생ID),
    FOREIGN KEY (강의ID) REFERENCES Courses(강의ID)
);

-- Students
INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);

/*
	1. 전공이 컴퓨터 과학인 학생들의 이름과 입학년도를 조회하는 SQL 명령문을 작성
	2. 담당 교수 ID가 2인 강의의 강의명과 학점 수를 조회하는 SQL 명령문을 작성
	3. 2023년도 1학기에 수강하는 학생들의 목록을 조회하는 SQL 명령문을 작성 (학생 ID와 이름을 포함)
*/ 
SELECT 이름, 입학년도
FROM Students
WHERE 전공 = 'Computer Science';

SELECT 강의명, 학점수
FROM Courses
WHERE 담당교수ID = 2;

SELECT s.학생ID, s.이름
FROM Students s
JOIN Enrollments e ON s.학생ID = e.학생ID
WHERE e.수강년도 = 2023 AND e.학기 = 1;