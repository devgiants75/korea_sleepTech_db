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