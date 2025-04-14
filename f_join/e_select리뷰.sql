### f_join 폴더 >>> e_select리뷰 파일 ###

# korea_db 스키마의 members, purchases를 기반으로
# , select ~ from ~ where ~ group by ~ having ~ order by ~ limit 구문의 전체 흐름과 처리 순서
# +) join

/*
	지역(area_code)별로 -- group by
    여성 회원들의  -- where
    총 구매 금액(purchases.amount 합계) 을 구하되, - sum() 집계함수 
	총액이 30,000원 이상인 지역만 추출하고, - having (+ join을 사용한 purchases 테이블 접근)
	총액 기준으로 내림차순 정렬해서 -- order by
    상위 3개 지역 조회 -- limit
*/
use korea_db;
select
	M.area_code "지역", sum(P.amount) "총 구매금액", count(distinct M.member_id) "회원 수"
from
	`members` M
		join `purchases` P on M.member_id = P.member_id
where
	M.gender = "Female"
group by
	M.area_code
having
	sum(P.amount) >= 30000
order by
	"총 구매금액" desc
limit 3;

# 1) from + join
select * from `members` M
		join `purchases` P on M.member_id = P.member_id;

# 2) from + join + where
select * from `members` M
		join `purchases` P on M.member_id = P.member_id
where M.gender = "Female";

# 3) 남은 데이터에서 group by (지역을 기준으로 묶기)
select 
	M.area_code as 지역,
    sum(P.amount) as 총구매금액,
    count(distinct M.member_id) as 회원수
from `members` M
		join `purchases` P on M.member_id = P.member_id
where M.gender = "Female"
group by M.area_code;

# 4) 남은 데이터에서 having (그룹화된 데이터에 조건)
select 
	M.area_code as 지역,
    sum(P.amount) as 총구매금액,
    count(distinct M.member_id) as 회원수
from `members` M
		join `purchases` P on M.member_id = P.member_id
where M.gender = "Female"
group by M.area_code
having sum(P.amount) >= 30000;

# +) order by, limit