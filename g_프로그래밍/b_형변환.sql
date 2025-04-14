### 'g_프로그래밍' 폴더 >>> 'b_형변환' 파일 ###
# : 한 데이터 타입을 다른 데이터 타입으로 바꾸는 것
use market_db;

### 1) 명시적 형 변환
# cast(값 as 데이터형식)
# convert(값, 데이터형식)
# >> 두 문법은 형식만 다르고 기능은 동일
select * from buy;

select
	avg(price) as '평균 가격'
from
	buy; # 142.9167

# cf) 형 변환 시 정수형 데이터타입 - signed, unsigned만 사용 가능(tinyint, smallint 등은 사용 불가!)
# signed: 부호가 있는 정수 (양수/음수 모두 표현 가능)
# unsigned: 부호가 없는 정수

select 
	cast(avg(price) as unsigned) '정수 평균 가격'
from
	buy; # 143
    
-- 날짜 형 변환 (포맷을 맞추기 위함)
# date 타입: YYYY-MM-DD
select cast('2022$12$12' as Date);
select cast('2022*12*12' as Date);
select cast('2022!12!12' as Date); -- MySQL은 문자 형식을 자동 분석하여 YYYY-MM-DD 형식으로 변환

select cast('12/12/2022' as Date); -- 형식이 너무 벗어나는 경우 오류 발생 (변환 X)

# cast(값 as 데이터타입): SQL 표준
# convert(값, 데이터타입): MySQL 고유 문법

### 2) 묵시적 형 변환
# : 자동으로 데이터 형식을 변환하는 것
select '100' + '200';

# cf) 문자열을 이어서 작성
# : concat('a', 'b') 함수를 사용
#   >> ab로 나열
select concat('100', '200'); 


-- 다음 중 평균 가격을 정수형으로 반환하려면 어떤 SQL문이 올바른가요?
-- a. select avg(price) as int from buy;
-- b. select cast(price as int) from buy;
-- c. select cast(avg(price) as signed) from buy;
-- d. select price as signed from buy;

# 정답: c