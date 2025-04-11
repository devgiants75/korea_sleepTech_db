### e_select 폴더 >>> c_select 파일 ###

# select A from B where C;

/*
1. order by
	: 데이터 정렬
    - 결과의 값이나 개수에 영향 X
    - 기본값 asc(ascending, 오름차순), desc(descending, 내림차순)
    
    cf) 오름차순: 알파벳(a), 자음(ㄱ), 날짜(오래된 순, 과거), 숫자(작은 데이터)
*/
select * from `members`; # 데이터 삽입 순서대로 정렬 (auto_increment PK값에 따라 정렬)

select * from `members`
order by 
	join_date; 

select * from `members`
order by 
	name desc; 

-- 정렬된 데이터를 기반으로 추가 정렬(콤마로 정렬 상태를 나열)
select * from `members`
order by 
	grade desc, points desc; 

/*
2. limit: 출력하는 개수를 제한 (반환되는 행의 수를 제한)

	limit 행수 (offset 시작행)
    
    cf) 첫 번째 행이 기본값 0
*/
select * from `members`
limit 5;

select * from `members`
limit 5 offset 2; -- 시작번호 2는 3번째 데이터 부터 (index 번호 체계와 동일)

select * from `members`
order by 
	grade desc
limit 5;

/*
3. distinct
	: 중복된 결과를 제거
    - 조회된 결과에서 중복된 데이터갖 존재하면 1개만 남기고 생략
    
    - 조회할 열 이름 앞에 distinct 키워드만 작성
*/
select distinct area_code from `members`;
select distinct grade from `members`;

/*
4. group by
	: 그룹으로 묶어주는 역할
    - 여러 행을 그룹화하여 집계함수를 적용해 주로 사용
	
    cf) 집계 함수: 그룹화 된 데이터에 대한 계산
    - max(), min(), avg(), sum()
    - count(): 행의 수
    - count(distinct): 행의 개수 (중복은 1개만 인정)
*/
# 등급별 회원 수 계산
# : 집계함수는 그룹화 된 영역 내에서 각각 계산
select grade, count(*) as member_count
from 
	`members`
group by 
	grade;

# 지역별 평균 포인트 계산
select area_code, avg(points) as member_point
from	
	`members`
group by
	area_code;

/*
	5. having
    : group by 함께 사용, 그룹화 된!!!!! 결과에 대한 조건을 지정
    - where 조건과 사용 식은 유사하지만, 그룹화 된!!!!! 데이터에 대해 조건을 지정
*/
select grade, count(*) member_count
from
	`members`
group by
	`grade`
having count(*) >= 2;

select area_code, avg(points) avg_points
from
	`members`
group by
	`area_code`
having
	avg(points) > 200;