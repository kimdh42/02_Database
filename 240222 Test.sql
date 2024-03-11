/* Q1.
	부서별 직원 급여의 총합 중 가장 큰 액수를 출력하세요. */

SELECT
	-- a.dept_title,
    sum(b.salary)
from
	employee b
join
	department a on b.dept_code = a.dept_id
group by
	a.dept_title
order by
	sum(b.salary) desc
LIMIT 1;
    
/* Q2.
	서브쿼리를 이용하여 영업부인 직원들의 사원번호, 직원명, 부서코드, 급여를 출력하세요.
	참고. 영업부인 직원은 부서명에 ‘영업’이 포함된 직원임 */
    
SELECT
	emp_id as '사원번호',
	emp_name as '직원명',
	dept_code as '부서코드',
	salary as '급여'
FROM
	employee
where
	dept_code in ( select
						dept_id
				   from
						department
				   where
						dept_title like '%영업%'
);

/* Q3.
	서브쿼리와 JOIN을 이용하여 영업부인 직원들의 사원번호, 직원명, 부서명, 급여를 출력하세요 */
    
SELECT
	emp_id as '사원번호',
	emp_name as '직원명',
	dept_title as '부서명',
	salary as '급여'
FROM
	employee a
JOIN
	department b on a.DEPT_CODE = b.DEPT_ID
where
	b.dept_title
like '%영업%';

/* Q4 - 1.
	JOIN을 이용하여 부서의 부서코드, 부서명, 해당 부서가 위치한 지역명, 국가명을 추출하는 쿼리를 작성하세요. */
SELECT
	DEPT_CODE,
    DEPT_TITLE,
    LOCAL_NAME,
    NATIONAL_NAME
FROM
	department a
JOIN
	location b on a.location_id = b.LOCAL_CODE
JOIN
	nation c on b.NATIONAL_CODE = c.NATIONAL_CODE;
