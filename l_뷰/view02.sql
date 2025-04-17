### 'l_뷰' 폴더 >>> 'view02' 파일 ###

### 뷰의 실제 생성, 수정, 삭제

use market_db;

create view v_view_test01 
as
	select B.mem_id "Member Id", M.mem_name as 'Member Name' # 별칭(alias)는 작은/큰 따옴표 가능
		, B.prod_name 'Product Name'
        , concat(M.phone1, M.phone2) as 'Office Phone'
	from 	
		buy B
			inner join member M
            on B.mem_id = M.mem_id;

# cf) 조회 시 컬럼(열) 이름에 공백이 있을 경우
#		, 백틱(`)으로 지정
select distinct `Member Id`, `Member Name` from v_view_test01;

### 뷰의 수정(구조) ###
alter view v_view_test01 
as
	select B.mem_id '회원 아이디', M.mem_name as '회원 이름'
		, B.prod_name '제품 이름', concat(M.phone1, M.phone2) as '연락처'
	from
		buy B
			join member M 
            on B.mem_id = M.mem_id;

select * from v_view_test01;

### 뷰 삭제(구조) ###
drop view v_view_test01;

# select * from v_view_test01;











