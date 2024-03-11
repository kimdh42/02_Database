-- LIMIT
-- SELECT 문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다.

/*
select
	select_list
from
	table_name
limit [offset], row_count;
offset : 시작할 행의 번호(인덱스 체계)
row_count : offset 이후 행부터 반환 받을 행의 갯수
*/

select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc;		-- 메뉴 코드와 메뉴 네임 메뉴 가격을 전체 조회후 메뉴가격으로 내림차순 정렬
    
select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc
limit 1, 4;				-- 첫번째 숫자는 인덱스 행 번호 두번쨰 숫자는 인덱스 행갯수

select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc,
    menu_name asc
limit 5;				-- 상위 다섯줄의 행만 조회