### 'g_프로그래밍' 폴더 >>> 'c_스토어드프로시저' 파일 ###

# 1. 스토어드 프로시저(Stored Procedure) #
# : MySQL에서 프로그래밍 기능이 필요로 할 때 사용되는 DB 개체

# cf) 데이터베이스 개체
# : 데이터베이스에서 표현하려고 하는 유형
# - 테이블, 뷰, 스토어드 프로시저, 함수 등

# 2. 스토어드 프로시저의 구조 #

-- 구분 문자: delimiter
# : 스토어드 프로시저의 코드 부분을 일반 SQL문 종료와 구분하기 위해 스토어드 프로시저 구분문자를 변경

-- 구분 문자 변경 형태 (권장)
#	cf) 기본 구분 문자: ;
delimiter $$ -- 해당 코드 이후의 구분문자는 $$ 

delimiter ; -- 해당 코드 이후의 구분 문자는 ;

# 3. 스토어드 프로시저 기본 형태
/*
	delimiter $$
    
    create procedure `스토어드 프로시저 절차명`
    begin
		SQL 프로그래밍 코딩
        : 각 문법의 구분 문자는 ; ($$가 나오기 전까지는 스토어드 프로시저 종료가 아님!)

	end $$

	delimiter ;
    
    == 스토어드 프로시저 실행 ==
    call `스토어드 프로시저 절차명`();
*/

### SQL 프로그래밍 종류 ###
# 1. if문
/*
	if 조건식 then
		SQL 문장;
	(else SQL문장);
	end if;
*/

delimiter $$

create procedure if1()
begin
	if 100 = 100 then
		select '100은 100과 같습니다.';
	end if;
end $$

delimiter ;

call if1();

# if-else문
delimiter $$

drop procedure if exists if2; # DB 개체의 경우 기본 DDL 명령어 사용 가능

create procedure if2()
begin
	# 프로시저 내의 변수 선언 (declare)
    declare myNum int;
    set myNum = 200;
    if myNum = 100 then
		select '100입니다.';
	else
		select '100이 아닙니다.';
	end if;
end $$

delimiter ;
call if2();

# case 문
# : 여러 조건 중에서 선택해야 하는 경우
/*
	case
	when 조건1 then
		sql 문장1;
	when 조건2 then
		sql 문장2;
	...
    
    else
		모든 조건에 일치하지 않을 경우 문장;
        
	end case;	
*/
# case문을 활용한 학점 계산기
drop procedure if exists caseProc;

delimiter ^^

create procedure caseProc()
begin
	declare point int; -- 점수
    declare credit char(1); -- 학점 EX) 'A', 'B' ...
    
    set point = 88;
    
    case
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		when point >= 60 then
			set credit = 'D';
		else
			set credit = 'F';
	end case;
    select concat('취득 점수: ', point), concat('학점: ', credit);
end ^^
delimiter ;

call caseProc();

# while문 #
# : 조건이 참인 동안 SQL문장을 계속 반복
# cf) 스토어드 프로시저에서는 for 문 지원 X

/*
	while 조건식 do
		sql문장
	end while;
*/
# 1에서 100까지 더하는 while문
drop procedure if exists whileProc;
delimiter $$

create procedure whileProc()
begin
	declare i int;
    declare result int;
    set i = 1;
    set result = 0;
    
    while (i <= 100) do
		set result = result + i;
        set i = i + 1;
        
	end while;
    
	select '1부터 100까지의 합', result;
end $$
delimiter ;
call whileProc();