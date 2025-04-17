### 'l_뷰' 폴더 >>> 'view01' 파일 ###

### 뷰(View) ###
# : 데이터베이스 개체 중 하나
# - 하나 이상의 테이블을 기반으로 생성된 '가상의 테이블'
# - 실제 데이터를 저장하지 않고, select 문의 결과를 저장한 것처럼 사용하는 객체

### view(뷰) VS table(테이블) ###

# 1) view
# - 데이터를 저장하지 않음
# - 특정 데이터만 보기 용도
# - 갱신방식: 기본 테이블이 변경되면 자동 반영
# : create view ... as select

# 2) table
# - 데이터를 직접 저장
# - 데이터 저장 및 조작
# - 갱신방식: 직접 데이터를 추가/삭제 (dml)
# : create table

### 뷰의 종류 ###
# 1) 단순 뷰: 하나의 테이블과 연관된 뷰
# 2) 복합 뷰: 2개 이상의 테이블과 연관된 뷰

use market_db;
select mem_id, mem_name, addr from member;

/*
	1) 뷰 생성 방법
    create view 뷰_이름
    as
		select문;

	2) 뷰 접근 방법
    : select문 사용 (전체 접근 | 테이블 조회처럼 조건식 사용도 가능)
    
    select 열이름 나열 from 뷰이름
    [where 조건];
*/
create view v_member # 뷰 이름은 'v_' 로 시작을 권장
as
	select mem_id, mem_name, addr from member;

select * from v_member;

select * from v_member
where
	addr in ('서울', '경기');

### 뷰의 작동 방식 ###
# 1. 사용자는 뷰를 테이블처럼 접근
# 2. 해당 뷰가 관계된 테이블을 찾아 데이터를 가져옴
#    : DBMS는 뷰에 정의된 select문을 실행하여 원본 데이터에서 데이터를 조회
# 3. 결과를 뷰의 형식대로 정제하여 사용자에게 반환

#### 뷰 사용 목적 ###
# 1. 보안
# : 민감한 데이터를 직접 공개하지 않고, 필요한 정보만 선별하여 제공 가능
# >> 주민등록번호, 연락처, 이메일 등을 제외한 고객 정보 제공

create view v_member_secure
as
	select mem_name, addr from member;
    
select * from v_member_secure;

# cf) DB 개체들은 생성과 삭제 시 DDL 문법 사용
# : drop view 뷰_이름;

# 2. 복잡한 SQL을 단순하게 작업
# : 물건을 구매한 회원에 대한 정보 출력
create view v_member_buy
as
	select
		B.mem_id, M.mem_name, B.prod_name, M.addr
        , concat(M.phone1, M.phone2) '연락처'
	from
		buy B
			join member M
            on B.mem_id = M.mem_id;

select * from v_member_buy
where
	mem_name = '블랙핑크';