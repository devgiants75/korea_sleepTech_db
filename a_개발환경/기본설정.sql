-- MySQL Workbench 환경 사용 설정

-- 1. 주석
-- 1) 단축키: ctrl + /

-- 2) 한 줄 주석: 하이픈 2개 OR 샾 1개

# 안녕하세요
-- 반갑습니다 

-- 3) 여러 줄 주석: /* */

/* 
줄 수에 관계없이 
주석 처리 가능 
*/

-- 이 쿼리는 모든 데이터베이스를 보여줍니다.
SHOW DATABASES;

/*
	이 쿼리는
    모든 데이터베이스를 보여주는
    명령어입니다.
*/
SHOW DATABASES;

-- 2. 글자 크기 변경
-- : ctrl + 마우스 휠 위/아래

-- : Edit > Preferences > Fonts & Colors 
--   Font명 글자크기값

-- 3. 명령어 대소문자 세팅
-- : 대소문자 구분 X
-- : 일관성 있는 작성을 권장!
-- >> '명령어는 대문자', 테이블이나 컬럼명은 소문자로 작성

-- : Edit > Format > UPCASE(대문자) / lowercase(소문자) keywords
show databases;

-- 4. sql 단축키
# 파일 저장: ctrl + s
# 한 줄 복사: ctrl + d
# 한 줄 삭제: ctrl + l
# 새로운 SQL 탭 생성: ctrl + t
# SQL 정렬: ctrl + b

# 실행 단축키*
# 마우스 커서가 위치하는 쿼리문 실행: ctrl + enter
# 마우스 드래그한 영역만을 실행: ctrl + shift + enter

-- 5. 다크 모드 설정
-- : Edit > References > Fonts & Colors > Color Shemas (Window 8)

-- https://github.com/mleandrojr/mysql-workbench-dark-theme/blob/master/code_editor.xml
-- 위 리포지토리에 zip 파일 다운
-- C:\Program Files\MySQL\MySQL Workbench 8.0\data 해당 위치의 'code_editor.xml' 파일과 교체

-- cf) 기존 'code_editor.xml' 파일 백업!
