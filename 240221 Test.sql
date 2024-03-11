SELECT * FROM menudb.employee;

/* 1.
   재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호, 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
   참고)퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 ‘N’ */
select
	emp_no,
    emp_name,
    phone,
    hire_date,
    ent_yn
from
	employee
where
	ent_yn = 'N' and
    phone like '%2'
order by
	hire_date desc
    limit 3;
    
    /* 2.
       재직 중인 ‘대리’들의 직원명, 직급명, 급여, 사원번호, 이메일, 전화번호, 입사일을 출력하세요.
	   단, 급여를 기준으로 내림차순 출력하세요.*/
    
select
	emp_name,
    job_name,
    salary,
    emp_id,
    email,
    phone,
    hire_date
from
	employee a
join
	job b on a.job_code = b.JOB_CODE
where
	JOB_NAME = '대리' and
    ent_yn = 'N'
order by
	a.salary desc;

/* 3.
   재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고, 
   마지막에는 전체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
   단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’, ‘급여평균’으로 출력되도록 하세요. */

select
	a.DEPT_TITLE as '부서명',
	count(b.EMP_ID) as '인원',
	sum(b.salary) as '급여합계',
	avg(b.salary) as '급여평균'
from
	department a
left join
	employee b on a.dept_id = b.dept_code
where
	b.ent_yn = 'N'
group by 
	a.dept_title
with rollup;

    


 /* 4. 
	전체 직원의 직원명, 주민등록번호, 전화번호, 부서명, 직급명을 출력하세요.
	단, 입사일을 기준으로 오름차순 정렬되도록 출력하세요.*/
select
	a.emp_name,
    a.emp_no,
    a.phone,
    b.dept_title,
    c.job_name
from
	employee a
join
	department b on a.dept_code = b.dept_id
join
	job c on a.job_code = c.job_code
order by
	a.hire_date asc;
    
/* 5. <1단계> 
	전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.
	참고. 연결된 관리자가 있다는 것은 관리자사번이 NULL이 아님을 의미함 */
    
select
	count(*)
from
	employee
where
	manager_id is not null;
    
/* <2단계> 
	1단계에서 조회한 내용에는 문제가 조금 있습니다. 관리자사번이 존재하여 연결된 관리자가 있기는 하나, 
	해당 관리자가 직원 목록에 존재하지 않는 직원이 있습니다.
	따라서 1단계를 디벨롭하여 직원 목록에 관리자사번이 존재하는 직원의 인원을 출력하세요. */
    
select
	count(*)
from
	employee a
where
	exists ( select
				1
			 from
				employee b
			 where
				a.manager_id = b.emp_id) and
a.manager_id is not null;
					

/* <3단계>
	모든 직원의 직원명과 관리자의 직원명을 출력하세요.
	참고. ‘모든 직원’이므로 관리자가 존재하지 않는 직원도 출력되어야 합니다. */

select
	a.emp_name,
    b.emp_name
from
	employee a
left join
	employee b on a.manager_id = b.emp_id
order by
	a.emp_name;
    
/* <4단계> 관리자가 존재하는 직원의 직원명, 부서명, 관리자의 직원명, 관리자의 부서명을 출력하세요. */

select
	a.emp_name,
    c.dept_title,
    b.emp_name,
    d.dept_title
from
	employee a
left join
	employee b on a.manager_id = b.emp_id
left join
	department c on a.dept_code = c.dept_id
left join
	department d on b.dept_code = d.dept_id
where
	b.emp_name is not null
order by
	a.emp_name;

	 

    

    
    
    
    
    