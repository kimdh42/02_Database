/* TRANSACTION 
	데이터 베이스에서 한번에 수행되는 작업의 단위이다.
    시작, 진행, 종료 단계를 가지며 만약 중가에 오류가 발생하면 롤백(시작 이전의 단계로 되돌리는 작업) 을 
    수행하고 데이터 베이스에 제대로 반영하기 위해서는 커밋(이후 롤백이 되지 않음)을 진행한다. 
    MySQL은 기본적으로 자동 커밋 설정이 되어있어(롤백이 안됨) 롤백을 하기 위해서는
    자동 커밋 설정을 해제해 주어야 한다.
    */

-- autocommit 활성화
set autocommit = 1;			-- autocommit 활성화
set autocommit = on;		-- autocommit 활성화

-- autocommit 비활성화
set autocommit = 0;			-- autocommit 비활성화
set autocommit = off;		-- autocommit 비활성화

start transaction;

select * from tbl_menu;
insert into tbl_menu values (null, '바나나해장국', 8500, 4, 'Y');
update tbl_menu set menu_name = '수정된 메뉴' where menu_code = 5;
delete from tbl_menu where menu_code = 7;

commit;

rollback;		-- commit 이후에는 rollback을 해도 rollback 적용되지 않음