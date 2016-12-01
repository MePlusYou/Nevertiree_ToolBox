-- 3.通过编写有关触发器
-- 至少实现一个表（比如member）的ID通过此触发器和有关序列实现自增长，

------------------------
-- MEMBER_ID_INCREMENT--
------------------------
-- 在实际项目中改名成 MEMBER_ID_TRIGGER_WLX303
create or replace trigger MEMBER_ID_INCREMENT
before insert
on MEMBER
for each row
begin
	select MEMBER_ID_SEQ.Nextval into :new.MEMBER_ID from dual;
end;

-- test MEMBER_ID trigger
insert into MEMBER(FIRST_NAME,LAST_NAME,ADDRESS,CITY,PHONE,JOIN_DATE)
values('Lance','Wang','35 TsingHua East Road','Beijing','010-6233-6110',TO_DATE('2016-11-28','yyyy-mm-dd'));

select * from MEMBER order by MEMBER_ID;
select * from MEMBER where FIRST_NAME = 'Lance';


------------------------
-- TITLE_ID_INCREMENT---
------------------------
-- 在实际项目中改名成 TITLE_ID_TRIGGER_WLX303
create or replace trigger TITLE_ID_INCREMENT
before insert
on TITLE
for each row
begin
	select TITLE_ID_SEQ.Nextval into :new.TITLE_ID from dual;
end;

-- test TITLE_ID trigger
insert into TITLE(TITLE,DESCRIPTION,RATING,CATEGORY,RELEASE_DATE,PRICE)
values('Se7en','Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi.','R','DRAMA',TO_DATE('1995-09-22','yyyy-mm-dd'),33);

select * from TITLE order by TITLE_ID;
select * from TITLE where TITLE = 'Se7en';


-----------------------
-- COPY_ID_INCREMENT---
-----------------------
create or replace trigger COPY_ID_INCREMENT
	before insert
	on TITLE_COPY
	for each row
	begin
		select COPY_ID_SEQ.Nextval into :new.COPY_ID from dual;
	end;
