### 'm_인덱스' 폴더 >>> 'index02' 파일 ###

### 인덱스 사용 정리 ###
# : 검색 속도 향상 도구
# - 책의 목차처럼 빠르게 데이터를 찾게 해줌
# - 조건문(where), 정렬(order by), 조인(join) 등에서 유용

/*
	create [unique] index 인덱스_명
		on 테이블명 (열이름 [asc | desc]);
        
	cf) [] 괄호 키워드 생략 가능
    
    1) unique: 중복을 허용하지 않는 고유 인덱스 생성 (생략 시 중복 허용)
    2) asc | desc: 오름차순 | 내림차순 (생략 시 오름차순)
*/
use 인덱스;

# 단순 인덱스 생성
create index idx_member_addr
	on members (address);

# 고유 인덱스 생성
create unique index idx_member_name
	on members (mem_name);

# cf) create index로 생성된 인덱스는 drop index로 제거!
#     >> 기본키(PK), 고유키(Unique)로 자동 생성된 인덱스는 drop index로 제거 X
#		 : alter table 문으로 기본키나 고유키를 제거 > 자동 인덱스 제거

show index from members;

drop index idx_member_addr on members;

### 인덱스 확인 ###
show index from members;

show table status like 'members';
# : 인덱스 적용 상태 확인
# 1) Data_length(클러스터형 인덱스 크기): 16384 Byte (16KB)
# 2) Index_length(보조 인덱스 크기): 0

### 생성된 인덱스를 실제 적용 시키는 방법 ###
analyze table members; # create index 이후 반드시 실행하여 인덱스 성능 최적화
show table status like 'members';
# Index_length(보조 인덱스 크기): 32768 (32KB)