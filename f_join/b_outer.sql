### f_join 폴더 >>> b_outer 파일 ###

/*
	=== 외부 조인 (Outer Join) ===
    : 두 테이블을 조인할 때, 한 쪽 테이블에만 있는 데이터도 결과에 포함시키는 조인 방식
	- 조건 조건인 on식에 일치하지 않는 레코드(행)도 결과에 포함
    
    == 외부 조인 종류 ==
    : (left) outer join, right outer join, full outer join
    
    # 기본 형태 #
    select 열 목록
    from 기준 테이블(첫 번째 테이블)
		(left | right | full) outer join 조인될 테이블 -- 기본: left
		on 조인될 조건
	[where ~~~];
*/

# 1. left outer join 예제
# : 왼쪽 테이블의 모든 레코드!와 오른쪽 테이블의 매칭되는 레코드만 포함
select
	M.member_id, M.name, P.product_code, M.area_code
from
	`members` M -- 기준 테이블의 레코드는 모두 출력
		left outer join `purchases` P
        on M.member_id = P.member_id;
# : 왼쪽 테이블의 내용은 모두 출력! (기준이 된 테이블이 모두 출력)

# 2. right outer join
# : 오른쪽 테이블의 내용은 모두 출력! (join 된 테이블이 모두 출력)
select
	M.member_id, M.name, P.product_code, M.area_code
from	
	`purchases` P
		right outer join `members` M -- 오른쪽에 있는 회원 테이블을 기준으로 외부 조인
        on M.member_id = P.member_id;
        
# 외부 조인 예제 #
select
	M.member_id, P.product_code, M.name, M.contact
from
	`members` M
		left outer join `purchases` P
        on M.member_id = P.member_id
where
	P.product_code is null; # 구매 기록이 없는 회원만 출력! (조인이 되었지만 매칭된 값이 없음을 의미)
	
# cf) MySQL은 FULL OUTER JOIN을 지원하지 않음!
# : UNION 으로 대체 가능

# cf) 외부 조인 사용 시 유의사항
# 1. 기준 테이블 위치: LEFT JOIN인 경우 왼쪽 테이블이 기준! (from 뒤의 테이블)
# 2. IS NULL 조건: 외부 조인 후 일치하지 않은 데이터를 찾을 때 사용
# 3. FULL OUTER JOIN: MySQL에서 지원하지 X