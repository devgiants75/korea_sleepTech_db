### d_dml 폴더 >> e_삭제명령어 ###

# delete VS drop VS truncate #

# 공통점
# : 삭제를 담당하는 키워드

# 차이점 
# 1) delete (DML)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 적은 용량의 데이터 | 조건이 필요한 데이터(where)

# 2) drop (DDL)
# : 테이블 자체를 삭제 (틀 + 데이터)

# 3) truncate (DDL)
# : 테이블의 틀은 남기면서 데이터를 삭제 - 대용량의 데이터

-- 대용량 테이블 생성
use `company`;
create table `big1` (select * from `world`.`city`, `sakila`.`actor`);
create table `big2` (select * from `world`.`city`, `sakila`.`actor`);
create table `big3` (select * from `world`.`city`, `sakila`.`actor`);

-- 삭제 명령어 비교
# delete from `big1`;
# : truncate 보다 느림! (테이블 형식은 남지만, 조건없이 삭제를 권장하지 않음)

drop table `big2`; -- 0.015 초 (가장 빠름)
# select * from `big2`;

truncate table `big3`; -- 0.047 초
select * from `big3`;