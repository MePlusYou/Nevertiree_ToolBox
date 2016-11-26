-- *******************************************
-- * SQL查询语句复习，用示例用户Scott/tiger登录 *
-- *******************************************

-- 01 列出至少有一个雇员的所有部门
select Unique D.DNAME
from DEPT D, EMP E
where D.DEPTNO = E.DEPTNO;


-- 02 列出薪金比"SMITH"多的所有雇员
select a.ENAME
from EMP a ,EMP b
where a.SAL > b.SAL
and b.ENAME = 'SMITH' ;


-- 03 列出所有雇员的姓名及其直接上级的姓名
select a.ENAME,b.ENAME
from EMP a , EMP b
where a.MGR = b.EMPNO ;


-- 04 列出入职日期早于其直接上级的所有雇员
select a.ENAME
from EMP a,EMP b
where a.MGR = b.EMPNO
and a.HIREDATE < b.HIREDATE;


-- 05 列出部门名称和这些部门的雇员,同时列出那些没有雇员的部门
select a.DNAME, b.ENAME
from DEPT a left outer join EMP b
on b.DEPTNO = a.DEPTNO;


-- 06 列出所有“CLERK”（办事员）的姓名及其部门名称
select a.ENAME , b.DNAME
from EMP a ,DEPT b
where a.JOB = 'CLERK'
and a.DEPTNO = b.DEPTNO;


-- 07 列出各种工作类别的最低薪金，显示最低薪金大于1500的记录
select a.JOB,min(a.SAL)
from EMP a
where a.SAL > 1500
group by a.JOB;


-- 08 列出从事“SALES”（销售）工作的雇员的姓名，假定不知道销售部的部门编号
select ENAME
from EMP a
where a.DEPTNO not in (1,2,3,10,20,40);


-- 09 列出薪金高于公司平均水平的所有雇员
select ENAME
from EMP a
where a.SAL > (select avg(SAL) from EMP);


-- 10 列出与“SCOTT”从事相同工作的所有雇员
select a.ENAME
from EMP a,EMP b
where b.ENAME = 'SCOTT'
and a.JOB = b.JOB
and a.ENAME is not 'SCOTT'


--11 列出某些雇员的姓名和薪金，条件是他们的薪金等于部门30中任何一个雇员的薪金
select a.ENAME,a.SAL
from EMP a
where a.SAL > any(select b.SAL from EMP b where b.DEPTNO = 30);


--12 列出某些雇员的姓名和薪金，条件是他们的薪金高于部门30中所有雇员的薪金
select a.ENAME,a.SAL
from EMP a
where a.SAL > all(select b.SAL from EMP b where b.DEPTNO = 30);


--13 列出每个部门的信息以及该部门中雇员的数量
select b.DNAME,count(a.EMPNO)
from EMP a left outer join DEPT b
on a.DEPTNO = b.DEPTNO
group by b.DNAME;


--14 列出所有雇员的雇员名称、部门名称和薪金
select a.ENAME,b.DNAME,a.SAL
from EMP a,DEPT b
where a.DEPTNO = b.DEPTNO;


--15 列出从事同一种工作但属于不同部门的雇员的不同组合
select a.ENAME,b.ENAME
from EMP a,EMP b
where a.DEPTNO != b.DEPTNO
and a.EMPNO != b.EMPNO
and a.JOB = b.JOB


--16 列出分配有雇员数量的所有部门的详细信息，即使是分配有0个雇员
-- select
-- from

--17 列出各种类别工作的最低工资
select a.JOB,min(a.SAL)
from EMP a
group by a.JOB;


--18 列出各个部门的MANAGER（经理）的最低薪金
select b.DNAME,min(a.SAL)
from EMP a,DEPT b
where a.JOB = 'MANAGER'
and a.DEPTNO = b.DEPTNO
group by a.DEPTNO,b.DNAME;


--19、列出按年薪排序的所有雇员的年薪
select a.ENAME,a.SAL
from EMP a
order by a.SAL desc

--20、列出薪金水平处于第四位的雇员
-- select ENAME,SAL
-- from (select a.ENAME,a.SAL
-- from EMP a
-- where ROWNUM < 5
-- order by a.SAL desc
-- )
-- where ROWNUM < 2
-- order by SAL desc ;

-- *******************************************
-- * DDL DML DCL 实验*
-- *******************************************

-- create user
create user WLX303 IDENTIFIED by WLX303
TEMPORARY TABLESPACE TEMP
DEFAULT TABLESPACE USERS;

-- grant
grant connect, resource ,create view,create procedure to WLX303;

-- switch user and check new user
conn WLX303/WLX303;

-- alter pwd
alter USER WLX303 IDENTIFIED BY WLX303

select * from user_users;

-- create member table
create table MEMBER_WLX303 (
  MEMBER_ID  NUMBER(10) PRIMARY KEY,
  LAST_NAME VARCHAR2(25) NOT NULL UNIQUE,
  FIRST_NAME VARCHAR2(25) NOT NULL UNIQUE,
  ADDRESS VARCHAR2(100) NOT NULL,
  CITY VARCHAR2(30) NOT NULL,
  PHONE VARCHAR2(15) NOT NULL,
  JOIN_DATE DATE DEFAULT (SYSDATE) NOT NULL
)

-- create title table
CREATE TABLE TITLE_WLX303 (
  TITLE_ID NUMBER(10) PRIMARY KEY,
  TITLE VARCHAR2(60) NOT NULL UNIQUE,
  DESCRIPTION VARCHAR2(400) NOT NULL,
  RATING VARCHAR2(4) CHECK (RATING IN ('G','PG','R','NC17','NR')),
  CATEGORY VARCHAR2(20) CHECK (CATEGORY IN ('DRAME','COMEDY','ACTION','CHILD','SCIFI','DOCUMENTARY')),
  RELEASE_DATE DATE NOT NULL
)

-- create title_copy
create table TITLE_COPY_WLX303 (
  COPY_ID NUMBER(10) NOT NULL UNIQUE,
  TITLE_ID NUMBER(10) NOT NULL UNIQUE,
  STATUS VARCHAR2(15) NOT NULL CHECK (STATUS IN ('AVAILABLE','DESTROYED','RENTED','RESERVED')),
  CONSTRAINT title_copy_pk PRIMARY KEY (COPY_ID,TITLE_ID),
  CONSTRAINT title_copy_fk FOREIGN KEY (TITLE_ID) REFERENCES TITLE_WLX303(TITLE_ID)
)

-- create rental
CREATE TABLE RENTAL_WLX303 (
  BOOK_DATE DATE,
  MEMBER_ID NUMBER(10),
  COPY_ID NUMBER(10),
  ACT_RET_DATE DATE DEFAULT (SYSDATE),
  EXP_RET_DATE DATE DEFAULT (SYSDATE)+2,
  TITLE_ID NUMBER(10),
  CONSTRAINT rental_pk PRIMARY KEY (BOOK_DATE,MEMBER_ID,COPY_ID,TITLE_ID),
  CONSTRAINT rental_member_fk FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER_WLX303(MEMBER_ID),
  CONSTRAINT rental_copy_fk FOREIGN KEY (COPY_ID) REFERENCES TITLE_COPY_WLX303(COPY_ID),
  CONSTRAINT rental_title_fk FOREIGN KEY (TITLE_ID) REFERENCES TITLE_COPY_WLX303(TITLE_ID)
)

-- create reservation
CREATE TABLE RESERVATION(
  RES_DATE DATE,
  MEMBER_ID NUMBER(10),
  TITLE_ID NUMBER(10),
  CONSTRAINT reservation_pk PRIMARY KEY (RES_DATE,MEMBER_ID,TITLE_ID),
  CONSTRAINT reservation_member_pk FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER_WLX303(MEMBER_ID),
  CONSTRAINT reservation_title_pk FOREIGN KEY (TITLE_ID) REFERENCES TITLE_WLX303(TITLE_ID)
)

-- drop table
DROP TABLE TABLE_NAME PURGE;

-- 检查数据字典验证表和约束已被完全创建
select * from dictionary;
select table_name from user_tables;
select object_name from user_objects;

-- 创建序列来唯一地标识在 MEMBER 表和 TITLE 表中的每一个行。

-- a. MEMBER 表的成员号：从 101 开始；不允许序列值缓存。序列名为 MEMBER_ID_SEQ。
CREATE SEQUENCE MEMBER_ID_SEQ_WLX303
START WITH 101
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

-- b. TITLE 表的标题号：从92开始；不缓存。序列名为：TITLE_ID_SEQ。
CREATE SEQUENCE TITLE_ID_SEQ_WLX303
START WITH 92
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

-- c. 验证在数据字典中已经存在的序列。
select * from user_objects where object_type = 'SEQUENCE';

-- 添加数据到表中

--a. 添加电影的标题到 TITLE 表中。写一个脚本输入电影信息。

--用序列来唯一地标识每一个标题。以 yyyy-mm-dd 格式输入发行日期

--验证你的添加。
