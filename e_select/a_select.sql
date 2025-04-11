### e_select 폴더 >>> a_select 파일 ###

/*
	=== select: 선택하다(조회하다) ===
    
    cf) DB는 '어떻게'보다 '무엇을'가지고 오는지가 중요!
		>> select는 '무엇을' 선택할 것인지 결정하는 키워드

	# select 문의 기본 구조 ('작성 순서') #
		1. select 컬럼명(열 목록): 원하는 컬럼(열)을 지정
        2. from 테이블명: 어떤 테이블에서 데이터를 가져올 지 결정
        3. where 조건식: 특정 조건에 맞는 데이터만 선택(필터링)
        4. group by 그룹화 할 컬럼명: 특정 열을 기준으로 그룹화
        5. having 그룹 조건: 그룹화된 데이터에 대한 조건을 지정
        6. order by 정렬 컬럼명: 결과를 특정 컬럼의 순서로 정렬
        7. limit 컬럼 수 제한: 반환할 행(레코드)의 수를 제한
        
	# DB 내부의 처리 순서 (select문 실행 순서) #
		from > join(추가 테이블 데이터 가져오기) 
		> where > group by > having > select > order by > limit
*/

use `korea_db`;

## 1. 기본 조회 ##
# : select 컬럼명 from 데이터베이스명.테이블명;

select `name` from `korea_db`.`members`;
# : 정렬을 하지 않고 조회 시 데이터 입력 순서대로 출력

# cf) 전체 컬럼 조회(전체 테이블 조회)
# 컬럼명 작성에 *를 사용하여 조회
select * from `korea_db`.`members`; -- 회원 테이블
select * from `korea_db`.`purchases`; -- 구매 목록 테이블

# cf) 두 개 이상의 컬럼을 조회 (,) 콤마로 구분하여 나열
select 
	`member_id`, `name`, `contact`
from 
	`members`;

# cf) alias 별칭 부여 조회




