--------------------
-- FIND_MEMBER_ID --
--------------------

-- 方便用户用名字查询ID


------------------
-- ADD_NEW_COPY --
------------------

-- 本procedure方便了直接在TITLE_COPY表中插入数据。用户只用输入电影名称和电影状态即可，ADD_NEW_COPY函数会自动补全COPY_ID并且查找合适的TITLE_ID

-- 示例
execute ADD_NEW_COPY('The GodFather','DESTROYED');

-- 实现
create or replace procedure ADD_NEW_COPY
	(
		MOVIE_NAME IN varchar2,
		STATUS IN varchar2
	)
	as
	begin
		insert into TITLE_COPY(TITLE_ID,STATUS)
		values((select TITLE_ID from TITLE where TITLE_NAME = MOVIE_NAME),STATUS);
		commit;
	end;

-------------------------
-- ADD_NEW_RESERVATION --
-------------------------

-- 本procedure方便添加RESERVATION。用户只用输入电影名称和自己的ID即可，ADD_NEW_RESERVATION会自动加入日期并且查询电影ID

-- 示例
execute ADD_NEW_RESERVATION('The GodFather',102);

-- 实现
create or replace procedure ADD_NEW_RESERVATION
	(
		MOVIE_NAME IN varchar2,
		USER_ID IN number
	)
	as
	begin
		insert into RESERVATION(RES_DATE,MEMBER_ID,TITLE_ID)
		values(sysdate,USER_ID,
			(select TITLE_ID from TITLE where TITLE_NAME = MOVIE_NAME));
		commit;
	end;

--------------------
-- ADD_NEW_RENTAL --
--------------------

-- 本procedure方便添加新的RENTAL。用户只用输入电影名称和自己的ID即可，ADD_NEW_RESERVATION会自动加入日期并且查询电影ID

-- 实现
create or replace procedure ADD_NEW_RENTAL
	(
		USER_ID IN number
		MOVIE_NAME IN varchar2
	)
	as
	begin
		insert into RENTAL(MEMBER_ID,COPY_ID,TITLE_ID)
		values()

		commit;
	end;

-- 4.写一个存储过程，命名为insertall_姓名首字母_学号后三位,



-- 功能
-- 1.在member表插入一条记录
-- 2.在title表插入一条记录（如果存在同名影视记录则不插入）
-- 3.在title_copy表插入一条记录
-- 4.在rental表插入一条记录

-- 并成功提交，以实现补录一条以前手工租赁信息；

create or replace PROCEDURE INSTALL_WLX_303
(MEMBER_ID IN OUT NUMBER,
TITLE_ID IN OUT NUMBER,
COPY_ID IN OUT NUMBER,
)

as

begin

end;

-- execute stored procedure
execute INSTALL_WLX_303('');

-- 5.通过调用上述存储过程，至少补录十条以上的租赁信息进入系统
-- 至少有一个member的姓名与你的姓名相同
-- 至少有一个影视剧或电影的Title名称中包含有你的姓名。
-- 对含有你姓名的Insert语句及其执行结果需要抓屏到实验报告中


-- 将select * from member；
-- select * from title；
-- select * from rental三个SQL语句的执行结果抓屏到实验报告中。


