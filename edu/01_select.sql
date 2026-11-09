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

-- 261106
-- 오늘 해놓은게 앞에거 다 날라가서 대충 내용 기억
-- 더듬어서 써보자면,
-- AND OR 이런 논리연산자에서 우선순위가 있어서
-- (AND 가 OR 보다 우선임) 그래서 괄호를 쳐서
-- 내 의도에 맞게 우선순위를 묶어줘야함

-- IN연산자: 다수의 지정한 값과 일치하는 데이터를 조회
SELECT
	*
FROM employees
WHERE
-- `name` = '박보람'
-- OR `name` = '정유리'
	`name` IN('박보람','정유리')
; -- OR로 묶을걸 한번에 IN으로 할 수 있음

-- 사번이 10001, 10005, 10006인 사원의 모든 정보 조회
SELECT
	*
FROM employees
WHERE
	emp_id IN('10001','10005','10006')
;

-- LIKE절: 문자열의 내용을 조회
-- %: 글자수와 상관없이 조회할 경우 사용
-- 이름이 '우'로 끝나는 사원 조회
SELECT
	*
FROM employees
WHERE
	`name` LIKE '%우' -- 마지막이'우'로 끝나는것
-- `name` LIKE '우%' -- 우로 시작하는것
-- `name` LIKE '%우%' -- '우'가 포함된 사원
;

-- (_): 언더바의 개수만큼 글자수를 허용해서 조회
SELECT
	*
FROM employees
WHERE
	`name` LIKE '_우%' -- 두번쨰글자가 '우'인것만 조회
;

-- ORDER BY 절: 조회한 데이터를 정렬 1
SELECT
	*
FROM employees
ORDER BY `name` ASC -- 오름차순 정렬
-- 오름차순은 ASC 생략이 가능함.
-- ORDER BY `name` DESC -- 내림차순 정렬
;

-- ASC DESC 추가설명  2
SELECT
	*
FROM employees
ORDER BY `name` DESC, birth ASC
; -- name 순으로 내림차순 정렬 후, 같은 name 안에서는
-- birth 순으로 오름차순 정렬

-- 데이터베이스는 기본적으로 컬럼들 간에 순서가
-- 전 혀 고려되어있지 않은 구조.

-- LIMIT 키워드, OFFSET 키워드: 출력의 개수를 제한
SELECT
	*
FROM employees
LIMIT 5 OFFSET 10
-- LIMIT 10,5
; -- 11(offset다음) 부터 5(limit)개 찾기

-- 261106 오후

-- 집계함수
-- SUM(컬럼명): 조회 된 해당 컬럼의 모든 값의 합계를 반환
-- 전 사원의 급여 합계를 조회해 주세요.
SELECT
	SUM(salary) sum_sal
	-- sum_sal은? SUM(salary)의 결과값의 별칭을 지정해둔것
FROM salaries
WHERE
	end_at IS NULL
;

-- MAX(컬럼명): 가장 큰 값 조회
SELECT
	MAX(salary) max_sal
FROM salaries
WHERE
	end_at IS NULL
;

-- MIN(컬럼명): 가장 작은 값 조회
SELECT
	MIN(salary) min_sal
FROM salaries
WHERE
	end_at IS NULL
;

-- AVG(컬럼명)
SELECT
	AVG(salary) avg_sal
FROM salaries
WHERE
	end_at IS NULL
;

-- COUNT(컬럼명)
-- 현재 재직중인 사원 수를 구해주세요.
SELECT
	COUNT(`name`), -- 검색 결과 중 해당 컬럼의 값이 NULL인
	COUNT(*)
FROM employees
WHERE
	fire_at IS NULL
; -- 컬럼명 삽입시 검색 결과 중 해당 컬럼의 값이
-- NULL이 아닌 레코드의 총 수를 출력

DESC salaries; -- 필드(속성) 다 불러오기

-- DISTINCT 키워드: 검색결과에서 중복된 레코드 없이 출력
SELECT DISTINCT
	emp_id
	,`name`
FROM employees
ORDER BY `name`
;

-- GROUP BY 절
-- 그룹으로 묶어서 조회

-- 부서별 사원수??
SELECT
	-- SELECT 절에 작성하는 컬럼은
	-- GROUP BY 절에서 사용한 컬럼과
	-- 집계함수만 작성해야한다. (SQL 표준 문법)
	COUNT(*) cnt_emps, -- 모든 사원을 카운트한다.
	dept_code -- 부서별로
FROM department_emps
WHERE
	end_at IS NULL
GROUP BY dept_code
;

DESC department_emps;
DESC employees;
DESC departments;
DESC department_managers;
DESC title_emps;

-- 직급별 사원수가 10000명 이상인 직급을 조회해주세요.
SELECT
	title_code
	,COUNT(*) cnt
FROM title_emps
WHERE -- 조건 달기
	end_at IS NULL -- 재직중인 사원이란 뜻
GROUP BY title_code -- 직급별!!
	HAVING cnt >= 10000
;

-- practice 2
SELECT
	title_code
	-- ,end_at
	-- ,start_at
	,COUNT(*) cnt
FROM title_emps
WHERE -- 조건 달기
	end_at IS NULL -- 재직중인 사원이란 뜻
GROUP BY title_code -- 직급별!!
	HAVING cnt >= 10000
;

SHOW CREATE TABLE title_emps;
SELECT * FROM title_emps LIMIT 20;