-- GORUPING
-- GROUP BY 절은 특정 열의 값에 따라 그룹화하는데 사용된다.
-- HAVING은 GROUP BY절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용된다.
select
	category_code
from
	tbl_menu
group by category_code;

select
	category_code,
    count(*)				-- count : SQL에서 행의수를 세는 함수(* : 는 모든행의 수)
from
	tbl_menu
group by category_code;

select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by category_code;

select
	category_code,
    avg(menu_price)
from
	tbl_menu
group by category_code;

select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code;
    
select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code
having				-- where절은 그룹화 전에 개별 행에 대한 조건 지정
					-- having절은 그룹화 후의 집계 결과에 대한 조건 지정
	category_code >= 5 and category_code <= 8;
    
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code
with rollup;

select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
	menu_price,
	category_code
with rollup;