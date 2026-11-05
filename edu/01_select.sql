-- SELECT문
-- DML 중 하나로, 저장되어 있는 데이터를
-- 조회하기 위해 사용하는 쿼리
-- SELECT절: 조회한 데이터 중 특정 컬러만 출력

SELECT
	emp_id
	,`name` -- 백틱으로 감싸면
	-- 예약어가 아니라 컬럼명이라고 인지시키는것
	-- 근데 컬럼명 지을때는 예약어는 가능한 피하자
	, gender
FROM employees -- 테이블 지정
;
-- 위 SELECT 부터 FROM 까지가 기본적인 특정 컬럼만 선택하는
-- 문법
SELECT
	emp_id
FROM employees
;

-- Asterrisk (*) : 모든 컬럼 조회
-- 애스터리스크는 예약어가 아니다. 그냥 개념이다.
SELECT
	*
FROM employees
;

-- WHERE 절 : 특정 컬럼의 값이 조건에 맞는 데이터만 조회
-- 사번이 10009인 사원의 모든 정보를 조회해주세요.
SELECT
	*
FROM employees
WHERE
	emp_id = 10009 -- SQL에서는 = 이 대입연산자가 아니라
	-- 부등호 이다. == 또는 === 과 같다고 할 수있겠다.
;

-- 사원명이 "박보람"인 사원의 정보를 조회해 주세요.
SELECT
	*
FROM employees
WHERE
	`name` = "박보람"
;

-- 생일이 2000-01-01 이후인 사원 모두 찾아주세요.
SELECT
	*
FROM employees
WHERE
	birth >= '2000-01-01 00:00:00.000'
	-- mySQL 같은 경우는 이 양식을 꼭 지켜줘야함
	-- DBMS에 따라 이 양식이 조금씩 다름
;
	
	-- 퇴사하지 않은 사원 정보 다 주세요.
SELECT	
	*
FROM employees
WHERE
	fire_at IS NULL -- 의 부정문은 IS NOT NULL
;

-- SELECT 컬럼명
-- FROM 테이블명
-- WHERE 조건;
-- 라고 한다.