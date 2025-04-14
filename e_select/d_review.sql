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
	
/*
	=== select 작성 순서 ===
    select 컬럼명 지정
    from 테이블명
    where 조건식
    
    group by 그룹화 할 컬럼명
    having 그룹 조건식
    
    order by 결과를 특정 컬럼 순으로 정렬
    limit 컬럼 수 제한
*/

# korea_db >>> members 테이블 사용

# 1) 이름(name)으로 알파벳 순 정렬
select * from `members` order by name; -- 오름차순 asc은 생략 가능 (desc는 반드시 명시!)

# 2) 3번째 레코드부터 2개의 행 조회 
select * from `members`;
select * from `members` limit 2 offset 2; -- 첫 행의 시작번호가 0(index 번호와 동일)
select * from `members` limit 2, 2; -- 'offset 시작번호'는 생략 후 콤마 사용 가능

# 3) 포인트(points)가 가장 높은 상위 3명의 회원 조회
select * from `members` order by points desc limit 3;

# 4) 서로 다른 등급 목록 조회 
# : 중복되는 등급을 생략
select distinct grade from `members`;

# 5) 지역별(area_code) 최대 포인트 조회 
select area_code, max(points) as max_points
from `members`
group by area_code;

# 6) 성별(gender)에 따른 평균 포인트 조회
-- 집계 함수: avg(), sum(), max(), min(), count()
select gender, avg(points) avg_points -- as 키워드 생략 가능 
from `members`
group by gender;

# 7) 평균 포인트가 250 이상인 등급만 조회
select grade, avg(points) avg_points
from `members`
group by grade
having avg(points) >= 250;

# 8) 등급별 최소 포인트가 100이상인 그룹 조회
select grade, min(points) min_points
from `members`
group by grade
having min(points) >= 100;