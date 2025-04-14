### 'g_프로그래밍' 폴더 >>> 'd_프로시저_예제' 파일 ###

# 1. market_db
use market_db;

## 총 구매액 ##
# 1500 이상 - 최우수고객
# 1000 ~ 1499 - 우수고객
# 1 ~ 999 - 일반 고객
# 0 이하 (구매한 적 X) - 일반 회원

select * from buy;

select 
	M.mem_id, M.mem_name, sum(B.price * B.amount) "총 구매액",
    case
		when (sum(B.price * B.amount) >= 1500) then '최우수 고객'
		when (sum(B.price * B.amount) >= 1000) then '우수 고객'
		when (sum(B.price * B.amount) >= 1) then '일반 고객'
        
        else '일반 회원' -- 내부 조인을 사용하여 구매 내역이 없는 데이터는 출력 X
	end '회원 등급' -- case 문을 '회원 등급' 열(컬럼)으로 생성
from 
	`member` M
		left outer join `buy` B -- 외부 조인 시 구매 내역이 없더라도 출력 O
        on B.mem_id = M.mem_id
group by M.mem_id
order by sum(B.price * B.amount) desc;

# 2. baseball_league
use baseball_league;

# 1) 변수 사용
# : 팀 ID를 변수에 저장, 저장된 팀 ID를 사용하여 선수 조회
set @team_id = 1; -- 변수는 실행해야 임시 공간에 저장

select * from players
where
	team_id = @team_id;

# 2. 스토어드 프로시저
drop procedure if exists CheckPosition;

delimiter $$

# 프로시저에 매개변수 사용
# : 프로시저명(in 매개변수명 데이터타입)

create procedure CheckPosition(in p_player_id int)
begin
	# 프로시저 내의 지역 변수
	declare v_player_position varchar(100);

	select
		# 매개변수의 값에 해당하는 선수 포지션을 조회
        # A into B(A를 B에 넣다)
		position into v_player_position
		from 
			players
		where
			player_id = p_player_id; # 매개변수의 id와 일치하는 선수 id의 데이터 조회

		if v_player_position = '타자' then
			select '해당 선수는 타자입니다.';
		else
			select '해당 선수는 타자가 아닙니다.';
            
		end if;
end $$

delimiter ;

call CheckPosition(101);
call CheckPosition(105);

call CheckPosition(103);

select * from players;