select * from menudb.tbl_menu;

/* 2024-02-20 
1. */
select
	category_code,
    category_name
from
	tbl_category
where
	ref_category_code is not null
order by
	category_name desc;

/*
2. */    
select
	menu_name,
    menu_price
from
	tbl_menu
where
	menu_name like '%밥%' and menu_price between 20000 and 30000 ;

/*
3. */    
select
	menu_code,
	menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_name like '%김치%' or menu_price < 10000
order by
	menu_price asc,
    menu_name desc;

/*
4. */    
select
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code not in (10, 9, 8) and menu_price = 13000 and orderable_status <> 'N';
    