### c_select 폴더 >>> z_practice_answer 파일 ###

use korea_db; -- members테이블, purchases테이블

-- 1. 모든 회원의 이름, 연락처, 회원등급을 조회하시오.
select 
	name, contact, grade 
from 
	`members`;

-- 2. 'SEOUL'에 거주하는 회원의 이름과 회원등급을 조회하시오.
select
	name, grade, area_code
from
	`members`
where
	area_code='seoul';

-- 3. 회원등급이 'Gold' 이상인 회원의 이름과 가입일을 조회하시오.
select name, join_date, grade from members
where
	grade in('Gold', 'Platinum', 'Diamond');
    
select name, join_date, grade from members
where
	grade not in('Gold', 'Platinum', 'Diamond'); -- not in: 포함되지 않은 경우

-- 4. 2023년도에 가입한 회원의 이름과 가입일을 조회하시오.
select name, join_date from members
where
	year(join_date) = 2023; -- 2023-01-01 이상 2023-12-31 이하

-- 5. 100포인트 이상을 가진 회원의 이름과 포인트를 조회하시오.
select name, points from members
where
	points >= 100;

-- 6. 'Male' 성별의 회원 중에서 'Gold' 등급 이상의 회원을 조회하시오.
select name, grade from members
where
	gender='Male' and grade in ('gold', 'platinum', 'diamond');

-- 7. 최근에 구매한 회원과 구매일을 조회하시오. (가장 최근 구매일 기준 상위 3명)
-- group by, 집계함수, order by, limit
select 
	member_id, max(purchase_date) as last_purchase_date
from 
	purchases
group by member_id -- 회원별로 구매 데이터를 묶어 
order by last_purchase_date desc -- 그 데이터들 중 제일 최근 데이터만을 뽑아
limit 3; -- 상위 3명만을 반환

-- 8. 회원별로 구매한 총 금액(amount의 합)을 조회하시오.
-- group by, 집계함수
select 
	member_id, sum(amount) as total_spent
from
	purchases
group by 
	member_id;