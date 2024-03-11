/* DDL(Data Definition Language)
데이터 베이스의 스키마(테이블)를 정의하거나 수정하는데 사용되는 SQL의 한 부분이다. */

-- 1. create : 테이블 생성을 위한 구문
/* 컬럼 설정 방법 
	column_name data_type(length) [not null] [default value] [auto_increment] column_constraint */
create table if not exists tb1 (
	pk int primary key,
    fk int,
    col1 varchar(255),
    check(col1 in('Y', 'N'))
) engine = innodb;

describe tb1;			-- tb1번의 테이블구조를 확인

insert into tb1 values (1, 10, 'Y');
select * from tb1;

-- auto_increment
-- insert시 primary키에 해당하는 컬럼에 자동으로 중복되지 않는 번호를 발생시켜 저장할 수 있다.
create table if not exists tb2 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in('Y', 'N'))
) engine = innodb;

insert into tb2 values(null, 10, 'Y');
insert into tb2 values(null, 20, 'Y');

-- 3. alter
-- 테이블에 추가/변경/삭제/수정하는 모든 것은 alter 명령어를 사용해 적용한다.

-- 열추가
-- alter table 테이블명 add 컬럼명 컬럼정의
-- col2 컬럼 추가 (int형, not null 제약조건 존재)

alter table tb2
add col2 int not null;		-- col2(컬럼2)는 null겂 x

describe tb2;

-- 열 삭제
-- alter table 테이블명 drop column 컬럼명

alter table tb2
drop column col2;

describe tb2;

-- 열 이름 및 데이터 형식 변경
-- alter table 테이블명 change column 기본컬럼명 바꿀컬럼명 컬럼정의
-- fk 컬럼을 change_fk 컬럼으로 변경(not null 제약조건 존재)

alter table tb2
change column fk change_fk int not null;

-- 열 제약 조건 추가 및 삭제(이후 챕터에서 다룰 내용)
-- alter table 테이블명 drop 제약조건
-- tb2 테이블의 primary key 제약조건 제거

alter table tb2
drop primary key;		-- 에러 발생
/* auto_increment가 걸려있는 컬럼은 primary key 제거가 안되므로
	auto_increment를 modify(컬럼의 정의를 바꿈) 명령어로 제거한다. */

alter table tb2
modify pk int;

describe tb2;

alter table tb2
drop primary key;

-- 다시 primary key 제약조건 추가
alter table tb2
add primary key(pk);

-- 컬럼 여러개 추가하기
alter table tb2
add col3 date not null,						-- date 자료형
add col4 tinyint not null;	-- 1292 에러발생	-- tinyint 자료형

select @@global.sql_mode;		-- MySQL 데이터베이스 서버의 전역 SQL모드 설정을 조회 (NO_ZERO_IN_DATE)
								-- root 계정에서 모든 설정 비워준 후 workbench 껐다가 킨 후 다시 dete형 컬럼 추가
describe tb2;

-- 4. drop : 테이블을 삭제하기 위한 구문
-- tb3 테이블 생성
create table if not exists tb3 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) engine = innodb;

-- tb3 테이블 삭제
drop table if exists tb3;			-- 테이블명, 테이블명 으로 2개 이상의 테이블 삭제 가능

-- 5. truncate
/* 전체 테이블의 모든 행을 삭제하고 테이블을 새로 생성한다.
   삭제할 행에 대한 로그를 남기지 않아서, 되돌릴 수 없다. */
   
create table if not exists tb4 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in('Y', 'N'))
) engine = innodb;

insert into tb4 values (null, 10, 'Y');
insert into tb4 values (null, 20, 'Y');
insert into tb4 values (null, 30, 'Y');
insert into tb4 values (null, 40, 'Y');

select * from tb4;

-- 테이블 초기화 하기
truncate table tb4;
-- truncate tb4;		-- table 키워드 생략 가능