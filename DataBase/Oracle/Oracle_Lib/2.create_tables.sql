---------------------
--------------------
--- create table ---
--------------------
--------------------

-------------------------
-- create MEMBER table --
-------------------------
create table MEMBER (
	-- MEMBER_ID
	MEMBER_ID  NUMBER(10),
	constraint member_pk primary key MEMBER_ID,
	-- LAST_NAME
	LAST_NAME VARCHAR2(25),
	constraint last_name_not_null not null LAST_NAME,
	constraint last_name_unique unique LAST_NAME,
	-- FIRST_NAME
	FIRST_NAME VARCHAR2(25),
	constraint first_name_not_null not null LAST_NAME,
	constraint first_name_unique unique LAST_NAME,
	-- ADDRESS
	ADDRESS VARCHAR2(100),
	constraint address_not_null not null ADDRESS,
	-- CITY
	CITY VARCHAR2(30) ,
	constraint city_not_null not null CITY,
	-- PHONE
	PHONE VARCHAR2(15) ,
	constraint phone_not_null not null PHONE,
	-- JOIN_DATE
	JOIN_DATE DATE default (SYSDATE) not null,
	constraint join_date_not_null not null JOIN_DATE,
	constraint join_date_default default(SYSDATE) for JOIN_DATE,
);
-- check whether current table is created successfully.
describe MEMBER;
select table_name from user_tables where table_name = 'MEMBER';


------------------------
-- create TITLE table --
------------------------
create table TITLE(
	-- TITLE_ID
	TITLE_ID NUMBER(10),
	constraint title_pk primary key TITLE_ID,
	-- TITLE
	TITLE_NAME VARCHAR2(60) not null,
	constraint title_unique unique TITLE,
	-- DESCRIPTION
	DESCRIPTION VARCHAR2(400) not null,
	-- RATING
	RATING VARCHAR2(4),
	constraint rating_range CHECK (RATING IN ('G','PG','R','NC17','NR')),
	-- CATEGORY
	CATEGORY VARCHAR2(20),
	constraint category_range CHECK (CATEGORY IN ('DRAMA','COMEDY','ACTION','CHILD','SCIFI','DOCUMENTARY')),
	-- RELEASE_DATE
	RELEASE_DATE DATE not null,
);

alter table TITLE rename column TITLE to TITLE_NAME;

-- 添加PRICE列,该列应该有8位数字长度和两位小数。验证你的修改。
alter table TITLE add PRICE NUMBER(8,2);

-- 确认在以后所有 titles 表中的记录都包含价格值，验证该约束。
alter table TITLE modify PRICE constraint price_not_null not null;

select object_name from user_objects where object_name = 'PRICE_NOT_NULL';


-- check whether current table is created successfully.
describe TITLE;
select table_name from user_tables where table_name = 'TITLE';

-----------------------------
-- create TITLE_COPY table --
-----------------------------
create table TITLE_COPY (
	-- COPY_ID
	COPY_ID NUMBER(10) not null,
	constraint title_copy_pk primary key (COPY_ID,TITLE_ID),
	-- TITLE_ID
	TITLE_ID NUMBER(10) constraint title_copy_fk references TITLE(TITLE_ID)
	-- STATUS
	STATUS VARCHAR2(15) not null,
	constraint status_not_null check (STATUS IN ('AVAILABLE','DESTROYED','RENTED','RESERVED'))
);
-- check whether current table is created successfully.
describe TITLE_COPY_WLX303;
select table_name from user_tables where table_name = 'TITLE_COPY';

-------------------------
-- create RENTAL table --
-------------------------
CREATE TABLE RENTAL (
	BOOK_DATE DATE,
	MEMBER_ID NUMBER(10) constraint rental_member_fk references MEMBER(MEMBER_ID),
	COPY_ID NUMBER(10),
	ACT_RET_DATE DATE DEFAULT (SYSDATE),
	EXP_RET_DATE DATE DEFAULT (SYSDATE)+2,
	TITLE_ID NUMBER(10),
	constraint rental_pk primary key (BOOK_DATE,MEMBER_ID,COPY_ID,TITLE_ID),
	constraint rental_copy_fk foreign key (COPY_ID,TITLE_ID) references TITLE_COPY(COPY_ID,TITLE_ID)
);
-- check whether current table is created successfully.
DESCRIBE RENTAL;
select table_name from user_tables where table_name = 'RENTAL';


------------------------------
-- create RESERVATION table --
------------------------------
CREATE TABLE RESERVATION(
	RES_DATE DATE,
	MEMBER_ID NUMBER(10) constraint reservation_member_pk references MEMBER(MEMBER_ID),
	TITLE_ID NUMBER(10) constraint reservation_title_pk references TITLE(TITLE_ID),
	constraint reservation_pk primary key (RES_DATE,MEMBER_ID,TITLE_ID),
);

-- check whether current table is created successfully.
DESCRIBE RESERVATION;
select table_name from user_tables where table_name = 'RESERVATION';


-- check dictionary
select * from dictionary;
select table_name from user_tables;
select object_name from user_objects;

-- 5. 创建一个名为 TITLE_AVAIL 的视图，显示电影标题和每个拷贝的可用性，以及，如果已租出它的预期归还日期。从视图中查询所有行，用标题排序。注：结果可能不同。

DROP VIEW TITLE_AVAIL;
CREATE VIEW TITLE_AVAIL AS
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
CREATE VIEW RENTAL_RECORD AS
SELECT M.FIRST_NAME ,M.LAST_NAME,T.TITLE,R.BOOK_DATE
FROM TITLE T,RENTAL R,MEMBER M
WHERE T.TITLE_ID = R.TITLE_ID
AND M.MEMBER_ID = R.MEMBER_ID;

select * from RENTAL_RECORD;