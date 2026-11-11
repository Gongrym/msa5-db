-- JOIN 문 : 복수의 테이블을 묶어서 하나의 결과 집합으로 출력

-- 1. INNER JOIN : 복수의 테이블이 공통적으로 만족하는 레코드를 출력
-- ex 1) 전 사원의 사번, 이름 , 현재 급여를 출력 (테이블 2개 연결)
SELECT
	emp.emp_id
	, emp.`name`
	, sal.salary
FROM employees emp
	INNER JOIN salaries sal -- inner 생략 가능
		ON emp.emp_id = sal.emp_id
		AND sal.end_at IS NULL
;

-- ex 2) 재직 중인 사원의 사번, 이름, 생일, 부서명 출력 (테이블 3개 연결)
SELECT
	emp.emp_id
	, emp.`name`
	, emp.birth
	, dep.dept_name
FROM employees emp
	JOIN department_emps depe
		ON emp.emp_id = depe.emp_id
			AND emp.fire_at IS null
	JOIN departments dep
		ON depe.dept_code = dep.dept_code
			AND depe.end_at IS NULL
;
		
-- join 할 때 PK 여부는 상관이 없음
-- FK는 데이터베이스의 제약조건,  없어도 사용할 수 있음, 실수를 줄이기 위해 사용

SELECT
	emp.emp_id
	,emp.`name`
	,depm.dept_code
FROM employees emp
	LEFT JOIN department_managers depm
		ON emp.emp_id = depm.emp_id
			AND emp.fire_at IS NULL
ORDER BY depm.dept_code DESC
;
-- ----------
SELECT
	emp.emp_id
	,emp.`name`
	,depm.dept_code
	,dep.dept_name
FROM employees emp
	LEFT JOIN (department_managers depm
		JOIN departments dep
			ON dep.dept_code = depm.dept_code
				AND depm.end_at IS NULL
	)
		ON emp.emp_id = depm.emp_id
			AND emp.fire_at IS NULL		
ORDER BY depm.dept_code IS NULL, depm.dept_code
; -- !/ 이 코드 혼자서 다 해석할 수 있게 다시 공부할것

-- UNION
-- 두개 이상의 쿼리의 결과를 합쳐서 출력
-- UNION (중복 레코드를 제거)
-- UNION ALL (중복 레코드를 제거 안함)
SELECT * FROM employees WHERE emp_id IN (1,3)
UNION
SELECT * FROM employees WHERE emp_id IN (1,5)
; -- 이러면 1,3,5 번만 나옴

SELECT * FROM employees WHERE emp_id IN (1,3)
UNION ALL
SELECT * FROM employees WHERE emp_id IN (1,5)
; -- 반면 이러면 1,1,3,5 번 나옴

-- SELF JOIN
-- 같은 테이블끼리 JOIN
-- 현재 슈퍼바이저인 사원 정보 출력
SELECT DISTINCT
	emp.emp_id
	, emp.`name`
	, sup.emp_id
	, sup.`name`
FROM employees emp
	JOIN employees sup
		ON emp.sup_id = sup.emp_id
			AND emp.sup_id IS NOT NULL
;