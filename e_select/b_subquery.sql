### e_select 폴더 >>> b_subquery 파일 ###

# === 서브 쿼리(subquery) ===
# : 메인 쿼리 내부에서 실행되는 하위 쿼리
# - 중첩 쿼리
# - 메인 쿼리에 필요한 데이터를 동적으로 제공하는 역할

# = 특징 = #
# : select, from , where 절 등 다양한 곳에서 사용 가능
# : 하나의 값(단일 행) 또는 여러 값(다중 행)을 반환 가능

# cf) 2023년 이후에 가입한 회원의 이름과 지역 코드를 조회
select * from `members`;

-- 일반 조건 검색
select 
	name, area_code
from
	`members`
where 
	year(join_date) >= 2023;
    
-- 서브쿼리 사용 조회
# Bronze 등급이 아닌 회원의 이름과 등급을 조회

# 1) 서브 쿼리: 'bronze' 등급만 선택
# 2) 메인 쿼리: 그 외의 등급만 출력
-- select name, grade
-- from `members`
-- where
-- 	grade not in (
-- 		select grade
--         from `members`
--         where
-- 			grade = 'bronze'
--     );
    
select name, grade
from `members`
where
	grade != 'bronze';
    
# 서브쿼리 사용 예제 #
select 
	grade, points
from 
	`members`
where
	points is not null;
        
select grade, avg(points) as avg_points
from (
	select grade, points
    from `members`
    where
		points is not null
) as member_points # 서브 쿼리의 별칭 (반드시 지정!)
group by grade; # 등급별로 데이터를 묶어주는 기능 (묶은 값들의 평균을 avg()에서 계산)
    
# 서브쿼리 사용 예제 #
# 회원 중 가장 많은 포인트를 보유한 사람의 이름과 포인트를 조회
select max(points) from `members`; -- 600

select name, points
from `members`
where
	points = (select max(points) from `members`); 

# 서브 쿼리: 집계, 조건 비교, 연관 데이터 추출 등에서 사용