### 'h_트리거' 폴더 >>> 'trigger02' 파일

### 트리거 예제 ###

use `market_db`;

# singer 테이블: member 테이블에서 데이터를 추출
create table if not exists singer (
	select mem_id, mem_name, mem_number, addr
    from
		`member`
);

select * from singer;

# 백업 테이블: 변동 사항을 기록할 테이블
create table `backup_singer` (
	mem_id char(8) not null,
	mem_name varchar(10) not null,
	mem_number int not null,
	addr char(2) not null,

	modType char(2), -- 변경된 타입 ('수정' | '삭제')
    modDate date, -- 변경된 날짜
    modUser varchar(30) -- 변경한 사용자
);

-- 변경(update)이 발생했을 때 작동하는 트리거
drop trigger if exists singer_updateTrg;

delimiter $$
create trigger singer_updateTrg -- 트리거명
	after update -- 변경 후에 작동하도록 지정
    on singer -- 트리거를 부착할 테이블
    for each row
begin
	insert into backup_singer
    values
		(
			OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr
            , '수정',  curdate(), current_user()
        );
end $$

delimiter ;

# OLD 테이블
# : update나 delete가 수행될 때
# - 변경되기 전의 데이터가 잠깐 저장되는 임시 테이블

# curdate(): 현재 날짜 
select curdate();

# current_user(): 현재 작업 중인 사용자
select current_user();

select * from singer;

update singer
set addr = '미국'
where
	mem_id = 'BLK';

update singer
set mem_number = 10
where
	mem_id = 'BLK';
    
select * from backup_singer;

## 삭제 시 발생되는 트리거 ##
drop trigger if exists singer_deleteTrg;

delimiter $$
create trigger singer_deleteTrg
	after delete
    on singer
    for each row
begin	
	insert into backup_singer
    values
		(
			OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr
            , '삭제',  curdate(), current_user()
        );
end $$
delimiter ;

delete from singer
where 
	mem_number >= 7;
    
select * from backup_singer;