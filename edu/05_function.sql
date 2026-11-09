-- 내장 함수 (Function)
-- mySQL 이 제공하는 함수가 어떤게 있는지 살펴보자

-- 데이터타입 변환 함수
-- CONVERT
SELECT 
	CAST(1234 AS CHAR(6)) -- 1234를 최대 6글자의 CHAR 형태로 변환
	, CONVERT(1234, CHAR(6)) -- 위랑 동작 같음
	
;
SELECT
	CONVERT(emp_id, CHAR(30))
FROM employees
;

-- 제어 흐름 함수
-- IF(수식, 참일 경우의 값, 거짓일 경우의 값)
SELECT
	`name`
	, gender
	, IF(gender = 'M', '남자', '여자') ko_gender -- 뒤에 ko_gender는 별칭임
	-- M이면 ko_gender에 남자, F면 ko_gender에 여자 넣는거임
FROM employees
;

-- INFULL(수식1, 수식2)
-- 수식1이 null이면 수식2를 반환, 아니면 수식 1을 반환
SELECT
	IFNULL(fire_at, '재직중')
	, fire_at
FROM employees
;

-- CASE ~ WHEN ~ ELSE ~ END
SELECT
	CASE gender
		WHEN 'M' THEN '남자'
		WHEN 'F' THEN '여자'
		ELSE '기타'
	END ko_gender
FROM employees
; -- 뭐 스위치문이랑 비슷하지? 대충 그렇게 이해하면됨

-- 내가 지금 뭘 배우고 있는거지?
-- 그냥 문법 이렇게 하나하나 배우는게 너무 미칠거같다.
-- 이건 그냥 나중에 AI한테 일괄적으로 물어서 그때그때 쓰면되잖아?
-- 그렇게 하도록 하자. 그냥 지금은 다른 공부를 하자.
-- 함수 배우는 중이다. 이 파일은.