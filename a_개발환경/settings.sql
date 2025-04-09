-- 첫 번째 SQL 파일 입니다.

-- === 데이터 베이스 ===

-- 데이터
-- : 우리 일상생활에서 표현할 수 있는 모든 단위

-- 데이터 베이스
-- : 데이터의 '체계적인' 집합
-- : 데이터를 쉽게 저장, 검색, 수정, 관리

-- DBMS
-- DataBase Manage System (데이터베이스 관리 시스템)
-- : 데이터 베이스를 관리하고 운영하는 소프트웨어
-- : 대용량의 데이터를 관리하거나 여러 사용자와 공유하는 데이터 베이스

-- DBMS 종류
-- : MySQL, 오라클, SQL Server, MariaDB 등

-- 관계형 데이터베이스 관리 시스템(RDBMS)
-- : 가장 많이 사용하는 시스템
-- : 데이터를 테이블 형태로 저장, 테이블 간의 관계를 기반으로 데이터를 조직화
-- - MySQL: 실무 사용도 높고, 학습 곡선이 낮음

-- 비관계형 데이터베이스 관리 시스템
-- : 유연한 데이터 모델을 제공, 정형적X, 대량의 분산된 데이터 처리에 용이
-- : Mongo DB, Redis

-- ! DBMS에서 사용되는 SQL 언어
-- : SQL(Structured Query Language)
-- : 데이터베이스 관리 시스템에서 데이터를 관리하기 위해 사용되는 표준 프로그래밍 언어

-- SQL 언어의 종류
-- : DBMS 회사에 따른 언어 종류가 상이

-- // PL/SQL, T-SQL, 'SQL'
-- // : 데이터베이스 구축, 관리에 초점이 맞춰진 언어

-- //! MySQL 설치
-- // : 오라클 사에서 제공하는 데이터베이스 관리 소프트웨어
-- // : 무료에디션 / 상용에디션(유료)

-- //? 1. 컴퓨터 환경 확인
-- // Window > 시작 > 시스템 정보
-- // : 시스템 종류 - 64비트 운영 체제
-- // : Window 사양 - 10이상

-- //? 2. MySQL 설치
-- // 웹 브라우저 > MySQL 검색 > 웹 사이트 접속

-- // Community: 무료 버전

-- // 상단 메뉴바 > Downloads > MySQL Community Downloads > MySQL Installer for Windows

-- // MSI Installer > 용량이 큰 버전으로 설치 > No thanks, just start my download.

-- //? MySQL 삭제
-- // 시작 > 프로그램 추가/제거 > mysql 검색 시 나오는 모든 프로그램을 제거

-- // 파일 탐색기 > 로컬디스크 C: > 사용자(Users) > ITPS > AppData > Roaming > MySQL 삭제

-- // 로컬디스크 C: > ProgramData > MySQL 삭제

-- // 로컬디스크 C: > Program Files > MySQL 삭제

-- //? MySQL 설치 파일 실행
-- // 파일 탐색기 > '다운로드' > mysql-installer-community-8.0.35.0.msi 더블 클릭

-- //? MySQL Installer 창

-- // 1. Choosing a Setup Type: 설치 유형을 선택

-- // Custom 유형: 원하는 필요한 설치 파일만 골라서 설치 > Next

-- // Select Products
-- // : 설치할 제품 선택
-- // Available Products: > MySQL Servers > MySQL Server > MySQL Server 8.0 > MySQL Server 8.0.35 - X64 > Products To Be Installed 환경으로 이동

-- // [Applications] – [MySQL Workbench] – [MySQL Workbench 8.0] – [MySQL Workbench 8.0.34 – X64]

-- // [Documentation] – [Samples and Examples] – [Samples and Examples 8.0] – [Samples and Examples 8.0.21 – X86]

-- // > Next > 선택한 항목 확인 후 > Execute(실행)

-- // 설치 완료 시 각 항목 앞에 초록색 체크 표시 확인 (기본 설치 완료)

-- //? 추가 환경 설정
-- // Next > Product Configuration > Next

-- // Type and Networking > Confing Type (Development Computer)

-- // : TCP/IP 체크
-- // : Port 3306 확인
-- // : [Open Windows Firewall ports for networkaccess] 체크 > Next

-- // > [Authentication Method] 기본 Use Strong 버전 사용 > Next 

-- // MySQL 관리자(Root)의 비밀번호 설정
-- // MySQL Root Password: root

-- // MySQL User Accounts: Root 외의 사용자 추가 설정 가능(수업 시 설정 X)

-- // MySQL 윈도우즈 서비스 이름을 MySQL로 변경 > Next > Next > Execute

-- //? Samples and Examples 8.0.21 설정

-- // Next > Password 입력란에 앞서 설정한 비밀번호를 입력 > Check 버튼 클릭 > Next > Execute > 설치 완료된 항목 앞에 초록색 체크 표시 확인

-- // Installation Complete > Start MySQL Workbench after Setup 체크 해제 > Finish 버튼 클릭

-- //? MySQL 정상 작동 확인하기
-- // 시작 > mysql 검색 > [MySQL Workbench 8.0 CE] > 오른쪽 마우스 클릭 > 자세히 > 작업 표시줄에 고정

-- // 작업 표시줄의 MySQL Workbench 아이콘 클릭

-- // MySQL Connections > Local instance MySQL > Connect to MySQL Server 창 > 비워진 Password 창에 MySQL 설치 시 지정한 비밀번호 입력 > OK 클릭

-- // MySQL 작업 환경설정
-- // 초기 화면의 SQL Additions 패널 숨김 (툴바 우측에 위치한 3개의 네모 모양 아이콘 중에 제일 오른쪽 아이콘 클릭)

-- // 마우스 커서가 활성화 되어있는 영역 - SQL 쿼리 창
-- // : SQL 코드 입력
-- // 예시 코드) show databases

-- // 우측 상단의 툴바 > 번개 모양 아이콘 (Execute the selected portion of the script or everything) 클릭
-- // : 아래쪽 Result Grid 창에서 SQL 결과 확인

-- // 쿼리 창 왼쪽 상단의 파일명 옆의 닫기 버튼: 해당 창을 닫기

-- // 왼쪽 상단의 메뉴 목록 > File > Exit: 프로그램 완전히 종료

-- //! MySQL 환경 변수 설정

-- // 환경 변수: 프로세스가 컴퓨터에서 동작하는 방식에 영향을 미치는 동적인 값들의 모임
-- // - 프로그램 실행 환경에 필요한 변수

-- //? Window
-- // 시작 버튼 클릭 > 시스템 환경 변수 편집 > 고급 > 환경 변수(N)... 클릭 > 시스템 변수 - Path 선택 후 편집 클릭

-- // 파일 탐색기 > 로컬디스크 C: > Program Files > MySQL > MySQL Server 8.0 > bin -(해당 경로 복사)

-- // 환경 변수 편집 > 우측 상단 '새로 만들기' > 복사한 경로 삽입 > 확인 버튼 클릭 하여 창 종료

-- // 시작 버튼 - cmd(명령 프롬프트)
-- // : 추가된 환경 변수 확인
-- // : mysql 버전 확인 명령어(환경 변수 추가 후 확인 가능)
-- // mysql -V

-- //? MacOs에서 MySQL 환경 변수 설정
-- // Spotlight 검색 사용 또는 '응용 프로그램 > 유틸리티' 터미널 실행

-- // 터미널에서 본인 로그인 비밀번호 입력

-- // Bash: nano ~/.bash_profile 파일 실행
-- // Zsh: nano ~/.zshrc 파일 실행

-- // 열린 파일 환경에 
-- // :export PATH=/usr/local/mysql/bin:$PATH

-- // 파일 정장 후 변경사항 적용
-- // source ~/.bash_profile
-- // source ~/.zshrc 

-- // 추가된 환경 변수 확인
-- // mysql -V
-- // echo $PATH