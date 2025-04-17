### 'l_뷰' 폴더 >>> 'view_practice' 파일 ###

### 뷰 연습 문제 ###
create database school;
use school;

-- students 테이블 생성 --
# student_id: 정수, 기본키
# name: 문자열(50),
# age: 정수
# major: 문자열(50)

-- courses 테이블 생성 --
# cours_id: 정수, 기본키
# course_name: 문자열(100)
# instructor: 문자열(100)
# credit_hours: 정수

-- student_courses 테이블 --
# student_id: 정수
# course_id: 정수
# >> 위의 두 컬럼을 복합키로 설정(기본키)
# >> 각 컬럼은 students, courses 테이블에서 참조

INSERT INTO Students (StudentID, FirstName, LastName, Age, Major)
VALUES (1, 'John', 'Doe', 20, 'Computer Science'),
       (2, 'Jane', 'Smith', 22, 'Mathematics'),
       (3, 'Alice', 'Johnson', 19, 'Biology'),
       (4, 'Bob', 'Brown', 21, 'History');

INSERT INTO Courses (CourseID, CourseName, Instructor, CreditHours)
VALUES (101, 'Introduction to Programming', 'Prof. Smith', 3),
       (102, 'Calculus I', 'Prof. Johnson', 4),
       (103, 'Biology 101', 'Prof. Davis', 3),
       (104, 'World History', 'Prof. Wilson', 3);
       
INSERT INTO StudentCourse (StudentID, CourseID)
VALUES (1, 101),
       (2, 102),
       (3, 103),
       (4, 104);


