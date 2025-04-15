### 'h_트리거' 폴더 >>> 'trigger01' 파일

### 트리거(trigger) ###
# : '방아쇠', 자동 실행
# : DB에서 특정 이벤트(Insert, Update, Delete)가 발생할 때 자동으로 실행되는 SQL 코드 블록

# 트리거 사용 목적
-- 사용자가 실수로 중요한 작업을 빼먹지 않도록 하기 위함 (일정 작업 자동화)
-- 수동으로 처리하는 일련 동작을 자동으로 처리하여 데이터의 오류를 방지 (데이터 무결성)

# EX) 트리거 사용 예시
-- 특정 레코드(행)가 삭제 >> 삭제된 데이터에 대한 로그 기록
-- 데이터 삽입 시 >> 자동으로 관련 값 계산을 추가
-- 회원 정보 수정 시 >> 수정 시간 자동 갱신

# 트리거 동작 방식
-- 이벤트가 발생할 때만 자동 실행, call문으로 직접 실행 불가!
-- cf) DML 이벤트를 감지(insert, update, delete)

# 트리거 종류
-- Before 트리거: 해당 작업이 수행되기 전에 실행
-- After 트리거*: 해당 작업이 수행된 후에 실행

-- >> 모든 트리거는 행(row, 레코드) 단위로 실행: for each row

### 트리거(trigger) 실무 사용법 ###
# 특정 테이블에서 insert, update, delete가 발생했을 때 자동 '로그 기록'
# : 재고 수량 자동 조정, 포인트 자동 적립 등 '자동화된 비즈니스 로직 처리'

# cf) 주의점!
# : 남용 시 디버깅이 어렵고 성능 저하 가능성 있음 >>> 꼭! 필요한 곳에서만 사용

### 트리거 기본 문법 ###
# : 스토어드 프로시저와 유사 (cf. call 문으로 직접 실행 X)

create database if not exists `trigger`;
use `trigger`;

/*
delimiter $$

create trigger 트리거이름
	트리거시점(종류: after, before) 이벤트종류(insert, update, delete) 
    on 테이블이름
    for each row
begin
	-- 트리거 실행 코드
end $$

delimiter ;
*/

-- 트리거 연습용 테이블
create table if not exists `trigger_table` (
	id int,
    txt varchar(10)
);

insert into `trigger_table`
values
	(1, '레드벨벳'),
    (2, '에스파'),
    (3, '하츠투하츠');

select * from `trigger_table`;

-- 트리거 생성
drop trigger if exists myTrigger;

delimiter $$

create trigger myTrigger
	# 트리거종류 이벤트종류
    after delete -- delete문이 발생된 이후에 작동
    
    on trigger_table # on 조건으로 트리거를 부착할 테이블 지정
    for each row # 각 행마다 적용시킴 (모든 트리거에 작성)

# 실제 트리거에서 작동할 부분
begin
	set @msg = '가수 그룹이 삭제됨';
end $$ # 트리거 종료의 구문 문자: $$

delimiter ;

-- 트리거 사용 테스트
set @msg = ''; -- 변수 초기화

-- 1) 삽입 테스트
insert into `trigger_table` 
values
	(4, '아이브');

select @msg;

-- 2) 수정 테스트
update `trigger_table` set txt='르세라핌' where id=3;

select @msg;

select * from `trigger_table`;

-- 3) 삭제 테스트
delete from `trigger_table` where id = 4;

select @msg;

### 트리거 VS 트랜잭션 ###
# 1) 트리거
# : 이벤트 발생 시 '자동 실행'되는 SQL 코드
# - 실행 조건: insert, update, delete 이벤트 발생 시
# - 사용 목적: 자동화 된 응답 처리

# 2) 트랜잭션
# : 여러 SQL문을 하나의 작업 단위로 '처리'
# - 실행 조건: Begin ~ Commit 또는 Collback으로 직접 제어
# - 사용 목적: 원자성(Atomicity), 일관성(Consistency) 보장

# cf) 원자성: 모두 성공 또는 모두 실패 (하나라도 실패 시 모두 롤백)