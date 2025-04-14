### f_join 폴더 >>> c_etc 파일 ###

/*
	=== 상호 조인(Cross Join) ===
    : 두 테이블의 모든 조합을 반환하는 조인
    - A CROSS JOIN B는 A의 각 행과 B의 각 행을 모두 조합
		>> 결과 행 수: A의 행 수 X B의 행 수
        
	cf) on절이 필요 X
		, where 절로 필터링하지 않을 경우 모든 조합이 출력되어 결과량이 많을 수 잇음
*/
use korea_db;

# 모든 회원과 모든 구매 정보 조합
select M.name, P.product_code, P.amount
from members M
	cross join purchases P;
-- 회원 10명 * 구매 8건 = 80개의 행 반환

# 필터 조건과 함께 cross join 사용
select M.name, P.product_code, P.amount
from members M
	cross join purchases P
where M.member_id = P.member_id; -- 내부조인(inner join)과 같은 결과

/*
	=== 자체 조인(Self Join) ===
    : 자기 자신을 기준으로 한 조인
    - 실제 테이블은 자기 자신! 하나이지만, 테이블을 두 번 사용하는 것 처럼 별칭(alias)를 부여하여 조인
*/

# 같은 지역에 사는 회원끼리 묶기
select
	A.name as 회원1, B.name as 회원2, A.area_code
from
	`members` A
		join `members` B
        on A.area_code = B.area_code
where
	-- 중복 제거
    A.member_id < B.member_id;

select
	A.name as 회원1, B.name as 회원2, A.grade
from
	`members` A
		join `members` B
        on A.grade = B.grade
where
	A.member_id < B.member_id;