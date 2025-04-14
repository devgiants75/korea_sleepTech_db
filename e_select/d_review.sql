### c_select 폴더 >>> d_review 파일 ###

# korea_db 데이터베이스의 members, purchases 테이블을 기반으로
# , select ~ from ~ where 구문 전체 흐름 복습

use `korea_db`;

/*
	가장 많이 구매한 회원(member_id 기준)의
	이름(name), 등급(grade), 총 구매 금액(total amount)을 출력
*/

select
	name, grade,
    (
    -- where 조건에서 조회된 회원의 총 구매금액을 서브쿼리로 계산
    select sum(amount)
	from purchases
	where member_id = `members`.member_id
    ) as total_amount
from
	`members`
where
	member_id = (
		select member_id
        from purchases
        group by member_id
        order by sum(amount) desc -- 총합이 가장 큰 레코드부터 조회
        limit 1 -- purchases 테이블에서 가장 구매 금액이 높은 회원의 member_id 조회
    );
    
-- select 
-- 	sum(amount)
-- from
-- 	purchases
-- where
-- 	member_id = `members`.member_id;
	








