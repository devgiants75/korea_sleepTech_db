### 'j_정규화' 폴더 >>> '명명규칙' 파일 ###

/*
	### 1. 공통 규칙 ###
	: DB명, 테이블명, 컬럼명 모두 해당
    
    1) 대소문자 구분을 하지 않지만 / '소문자 사용을 권장'
		- Linux: 대소문자를 구분
        - Windows, MacOS: 대소문자 구분 안 함
	
    2) 구분자: _언더스코어 사용 (snake case 사용)
    
		DB명: class_enrollment
        테이블명: students, classes 등
        컬럼명: student_name, created_at 등
        
	3) 약어 사용: 가능한 사용 지양
		- 가독성을 위해 줄이지 않고 전체 단어 사용 권장
        
        EX) addr(address), amt(amount)
            , qty(quantity), tel_no(phone_number), pwd(password) 등
        
	4) 언어: 영문 사용 (시스템 국제화, 유지보수 고려)
    
    5) 예약어 피하기
		EX) order, select 등
*/

/*
	### 2. 테이블 명명 규칙 ###
	
    복수형 명사 권장: users, products, orders 등
					user_reviews, order_items 등

	### 3. 컬럼 명명 규칙 ###
    
	단수형 명사 권장: user_id, product_name, created_at 등
    
    외래 키 컬럼명: 참조하는 테이블명 단수화 + id
		EX) users 테이블 PK값을 참조
			: user_id
            
            courses 테이블 PK값을 참조
			: course_id
    
	날짜 관련 컬럼: _at 접미어 사용
		EX) created_at, updated_at, deleted_at
        
	상태 컬럼: status | is_ | has_ 형식을 사용
		EX) is_deleted, has_coupon: 불리언 값으로 상태를 저장
			status 키워드: 상태를 직접 명시
*/

# DB명: bookhub_db, senior_db, body_laboratory_db 등