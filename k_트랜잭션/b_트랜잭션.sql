### 'k_트랜잭션' 폴더 >>> 'b_트랜잭션' 파일 ###

use `트랜잭션`;

create table users (
	id int auto_increment primary key,
    username varchar(50) not null,
    password varchar(255) not null
);

create table user_setting (
	id int auto_increment primary key,
    user_id int,
    dark_mode boolean,
    foreign key (user_id) references users(id) on delete cascade
);

# cf) on delete cascade
# : 외래 키 제약 조건
# - 부모 테이블의 행이 삭제될 때(사용자가 삭제: 탈퇴)
# - , 참조하는 자식 테이블의 행도 자동으로 삭제되도록 설정하는 옵션
# >> 참조 무결성 유지!

create table logs (
	id int auto_increment primary key,
    message text,
    created_at timestamp default current_timestamp
);

select * from users;
select * from user_setting;
select * from logs;

start transaction;

-- 1단계: 사용자 등록
insert into users (username, password) values ('lsa', '1234');
savepoint step1; # 저장 위치명 지정

-- 2단계: 설정 추가 
insert into user_setting (user_id, dark_mode)
values
	(last_insert_id(), true);
    
    # cf) last_insert_id(): 마지막으로 자동 증가된 ID값을 반환
    #                      >> users 테이블의 id값을 반환!
savepoint step2;

-- 3단계: 로그 저장
insert into logs (message) values ('회원가입 시도');

rollback to savepoint step1;
# >> 에러 발생했다고 가정! (2단계가 문제 > 1단계는 유지 / 2단계만 취소)

commit; -- 이후 다른 작업 이어가기 가능 (전체 종료 시 커밋)

select * from users; -- rollback to save step1;
select * from user_setting;
select * from logs;