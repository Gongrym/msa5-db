-- 전부 재직중임

-- 1. 사원의 사원번호, 이름, 직급코드를 출력해 주세요.
SELECT
	emp.emp_id
	, emp.`name`
	, temp.title_code
FROM employees emp
	JOIN title_emps temp
		ON emp.emp_id = temp.emp_id
		AND emp.fire_at IS NULL
;		

-- 2. 사원의 사원번호, 성별, 현재 연봉을 출력해 주세요.
SELECT
	emp.emp_id
	, emp.gender
	, sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
		AND emp.fire_at IS NULL
;

-- 3. 10010 사원의 이름과 과거부터 현재까지 연봉 이력을 출력해 주세요.
SELECT
	emp.`name`
	, sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
	WHERE emp.emp_id = 10010
	ORDER BY sal.start_at ASC
;

-- 4. 사원의 사원번호, 이름, 소속부서명을 출력해 주세요.
SELECT DISTINCT
	emp.emp_id
	, emp.`name`
	, dep.dept_name
FROM employees emp
	JOIN department_emps demp
		ON emp.emp_id = demp.emp_id
	JOIN departments dep
		ON demp.dept_code = dep.dept_code
WHERE emp.fire_at IS NULL
	AND demp.end_at IS NULL
;

-- 5. 현재 연봉의 상위 10위까지 사원의 사번, 이름, 연봉을 출력해 주세요.
SELECT
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
WHERE emp.fire_at IS NULL
	AND sal.end_at IS NULL
	ORDER BY salary DESC LIMIT 10
;

-- 6. 현재 각 부서의 부서장의 부서명, 이름, 입사일을 출력해 주세요.
SELECT
	dep.dept_name
	, emp.`name`
	, emp.hire_at
FROM employees emp
	JOIN department_managers depm
		ON depm.emp_id = emp.emp_id
	JOIN departments dep
		ON dep.dept_code = depm.dept_code
 WHERE depm.end_at IS NULL
;

-- 7. 현재 직급이 "부장"인 사원들의 역대 연봉 평균을 출력해 주세요.
SELECT

FROM employees emp
	JOIN department_

-- 7-1. (보너스)현재 각 부장별 이름, 연봉평균


-- 8. 부서장직을 역임했던 모든 사원의 이름과 입사일, 사번, 부서번호를 출력해 주세요.


-- 9. 현재 각 직급별 평균연봉 중 60,000,000이상인 직급의 직급명, 평균연봉(정수)를을 평균연봉 내림차순으로 출력해 주세요.


-- 10. 성별이 여자인 사원들의 직급별 사원수를 출력해 주세요.
SELECT
	tle.title
	, COUNT(tle.title)
FROM employees emp
	JOIN title_emps temp
		ON emp.emp_id = temp.emp_id
	JOIN titles tle
		ON tle.title_code = temp.title_code	
 WHERE emp.gender = 'F'
	AND emp.fire_at IS NULL
 GROUP BY tle.title
;

-- ------------------------------
-- 전체 평균 급여보다 높은 급여를 받은 기록을 조회



-- 가장 높은 급여를 받은 이력이있는 사원의 사번과 급여를 조회