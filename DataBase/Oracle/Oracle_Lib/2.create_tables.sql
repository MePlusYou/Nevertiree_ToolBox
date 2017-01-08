---------------------
--------------------
--- create table ---
--------------------
--------------------

-------------------------
-- create MEMBER table --
-------------------------
create table MEMBER_WLX303 (
	-- MEMBER_ID
	MEMBER_ID  NUMBER(10) primary key ,
	-- LAST_NAME
	LAST_NAME VARCHAR2(25) not null unique,
	-- FIRST_NAME
	FIRST_NAME VARCHAR2(25) not null unique,
	-- ADDRESS
	ADDRESS VARCHAR2(100) not null,
	-- CITY
	CITY VARCHAR2(30) not null,
	-- PHONE
	PHONE VARCHAR2(15) not null ,
	-- JOIN_DATE
	JOIN_DATE DATE default (SYSDATE) not null
	);
-- check whether current table is created successfully.
describe MEMBER_WLX303;
select table_name from user_tables where table_name = 'MEMBER_WLX303';


------------------------
-- create TITLE table --
------------------------
create table TITLE_WLX303(
	-- TITLE_ID
	TITLE_ID NUMBER(10) primary key,
	-- TITLE
	TITLE_NAME VARCHAR2(60) not null unique,
	-- DESCRIPTION
	DESCRIPTION VARCHAR2(400) not null,
	-- RATING
	RATING VARCHAR2(4),
	constraint rating_range CHECK (RATING IN ('G','PG','R','NC17','NR')),
	-- CATEGORY
	CATEGORY VARCHAR2(20),
	constraint category_range CHECK (CATEGORY IN ('DRAMA','COMEDY','ACTION','CHILD','SCIFI','DOCUMENTARY')),
	-- RELEASE_DATE
	RELEASE_DATE DATE not null
);

alter table TITLE_WLX303 rename column TITLE to TITLE_NAME;

-- 添加PRICE列,该列应该有8位数字长度和两位小数。验证你的修改。
alter table TITLE_WLX303 add PRICE NUMBER(8,2);

-- 确认在以后所有 titles 表中的记录都包含价格值，验证该约束。
alter table TITLE_WLX303 modify PRICE constraint price_not_null not null;

select object_name from user_objects where object_name = 'PRICE_NOT_NULL';


-- check whether current table is created successfully.
describe TITLE_WLX303;
select table_name from user_tables where table_name = 'TITLE_WLX303';

-----------------------------
-- create TITLE_COPY table --
-----------------------------
create table TITLE_COPY_WLX303 (
	-- COPY_ID
	COPY_ID NUMBER(10) not null,
	constraint title_copy_pk primary key (COPY_ID,TITLE_ID),
	-- TITLE_ID
	TITLE_ID NUMBER(10) constraint title_copy_fk references TITLE_WLX303(TITLE_ID)
	-- STATUS
	STATUS VARCHAR2(15) not null,
	constraint status_not_null check (STATUS IN ('AVAILABLE','DESTROYED','RENTED','RESERVED'))
);
-- check whether current table is created successfully.
describe TITLE_COPY_WLX303;
select table_name from user_tables where table_name = 'TITLE_COPY_WLX303';

-------------------------
-- create RENTAL table --
-------------------------
CREATE TABLE RENTAL_WLX303 (
	BOOK_DATE DATE,
	MEMBER_ID NUMBER(10) constraint rental_member_fk references MEMBER_WLX303(MEMBER_ID),
	COPY_ID NUMBER(10),
	ACT_RET_DATE DATE DEFAULT (SYSDATE),
	EXP_RET_DATE DATE DEFAULT (SYSDATE)+2,
	TITLE_ID NUMBER(10),
	constraint rental_pk primary key (BOOK_DATE,MEMBER_ID,COPY_ID,TITLE_ID),
	constraint rental_copy_fk foreign key (COPY_ID,TITLE_ID) references TITLE_COPY_WLX303(COPY_ID,TITLE_ID)
);
-- check whether current table is created successfully.
DESCRIBE RENTAL_WLX303;
select table_name from user_tables where table_name = 'RENTAL_WLX303';


------------------------------
-- create RESERVATION table --
------------------------------
CREATE TABLE RESERVATION_WLX303(
	RES_DATE DATE,
	MEMBER_ID NUMBER(10) constraint reservation_member_pk references MEMBER_WLX303(MEMBER_ID),
	TITLE_ID NUMBER(10) constraint reservation_title_pk references TITLE_WLX303(TITLE_ID),
	constraint reservation_pk primary key (RES_DATE,MEMBER_ID,TITLE_ID),
);

-- check whether current table is created successfully.
DESCRIBE RESERVATION_WLX303;
select table_name from user_tables where table_name = 'RESERVATION_WLX303';


-- check dictionary
select * from dictionary;
select table_name from user_tables;
select object_name from user_objects;

-- 5. 创建一个名为 TITLE_AVAIL 的视图，显示电影标题和每个拷贝的可用性，以及，如果已租出它的预期归还日期。从视图中查询所有行，用标题排序。注：结果可能不同。

DROP VIEW TITLE_AVAIL_WLX303;
CREATE VIEW TITLE_AVAIL_WLX303 AS
SELECT T.TITLE_NAME,C.COPY_ID,C.STATUS,R.EXP_RET_DATE
FROM TITLE T,TITLE_COPY C,RENTAL R
WHERE T.TITLE_ID = C.TITLE_ID
AND C.COPY_ID = R.COPY_ID(+)
AND C.TITLE_ID = R.TITLE_ID(+);
-- (+)表示外连接，并且总是放在非主表的一方。

-- 验证view可用性
SELECT * FROM TITLE_AVAIL ORDER BY TITLE,COPY_ID;


-- 包含每一个客户租视频的历史。报表包括名字、租用的视频、租用的日期，在一个报告期中所有客户租用的总数。

-- create a new view called RENTAL_RECORD
CREATE VIEW RENTAL_RECORD_WLX303 AS
SELECT M.FIRST_NAME ,M.LAST_NAME,T.TITLE,R.BOOK_DATE
FROM TITLE T,RENTAL R,MEMBER M
WHERE T.TITLE_ID = R.TITLE_ID
AND M.MEMBER_ID = R.MEMBER_ID;

select * from RENTAL_RECORD;