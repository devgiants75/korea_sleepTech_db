### c_select 폴더 >>> e_review 파일 ###

use baseball_league;
select * from `players`;
select * from `teams`;

# 1. 1990년 이후에 태어난 선수 목록 가져오기
select * from `players`
where
	year(birth_date) >= 1990;

# 2. 외야수인 선수 중 1995년 이전에 태어난 선수 목록 가져오기
select * from `players`
where
	position = "외야수" and year(birth_date) < 1995;

# 3. 선수들을 생년월일 순으로 정렬해서 가져오기
select * from `players`
order by
	birth_date;

# 4. 팀별로 창단 연도 순으로 팀 목록 가져오기
select * from `teams`
order by
	founded_year;

# 5. 중복을 제거한 팀 이름 목록 가져오기
select distinct name
from 	
	`teams`;

# 6. 중복을 제거한 포지션 목록 가져오기
select distinct position
from
	`players`;

# 7. 각 포지션별 선수 수가 2명 이상인 포지션 가져오기
select position, count(*) player_count
from
	`players`
group by
	position
having
	player_count >= 2;