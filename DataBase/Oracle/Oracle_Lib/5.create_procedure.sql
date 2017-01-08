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
create or replace procedure ADD_NEW_COPY_WLX303
	(
		MOVIE_NAME IN varchar2,
		STATUS IN varchar2
	)
	as
	begin
		insert into TITLE_COPY_WLX303(TITLE_ID,STATUS)
		values((select TITLE_ID from TITLE_WLX303 where TITLE_NAME = MOVIE_NAME),STATUS);
		commit;
	end;

-------------------------
-- ADD_NEW_RESERVATION --
-------------------------

-- 本procedure方便添加RESERVATION。用户只用输入电影名称和自己的ID即可，ADD_NEW_RESERVATION会自动加入日期并且查询电影ID

-- 示例
execute ADD_NEW_RESERVATION('The GodFather',102);

-- 实现
create or replace procedure ADD_NEW_RESERVATION_WLX303
	(
		MOVIE_NAME IN varchar2,
		USER_ID IN number
	)
	as
	begin
		insert into RESERVATION_WLX303(RES_DATE,MEMBER_ID,TITLE_ID)
		values(sysdate,USER_ID,
			(select TITLE_ID from TITLE_WLX303 where TITLE_NAME = MOVIE_NAME));
		commit;
	end;

--------------------
-- ADD_NEW_RENTAL --
--------------------

-- 本procedure方便添加新的RENTAL。用户只用输入电影名称和自己的ID即可，ADD_NEW_RESERVATION会自动加入日期并且查询电影ID

-- 实现
create or replace procedure ADD_NEW_RENTAL_WLX303
	(
		USER_ID IN number
		MOVIE_NAME IN varchar2
	)
	as
	begin
		insert into RENTAL_WLX303(MEMBER_ID,COPY_ID,TITLE_ID)
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

-- 5.通过调用上述存储过程，至少补录十条以上的租赁信息进入系统
-- 至少有一个member的姓名与你的姓名相同
-- 至少有一个影视剧或电影的Title名称中包含有你的姓名。
-- 对含有你姓名的Insert语句及其执行结果需要抓屏到实验报告中


-- 将select * from member；
-- select * from title；
-- select * from rental三个SQL语句的执行结果抓屏到实验报告中。


create or replace procedure INSERTALL_WLX303
(
	input_last_name IN VARCHAR2  ,
	input_title IN VARCHAR2,
	input_copy_id IN number,
	input_status in VARCHAR2,
	input_date in date
)
AS
	v_member_id number := 0;
	v_member_count number := 0;
	v_title_count number:=0;
	v_title_id number:=0;
	v_title_copy_count number:=0;
	v_copy_id number:=0;

BEGIN
	--根据用户输入的last name查询用户信息数量
	select count(*) into v_member_count
	from MEMBER_WLX303
	where last_name = input_last_name;

	--如果用户存在则取出用户ID
	if v_member_count > 0 then
	    select member_id into v_member_id
	    from MEMBER_WLX303
	    where last_name = input_last_name;
	--否则插入新用户
	else
	    insert into
	    MEMBER_WLX303 (last_name)
	    values (input_last_name)
	    returning member_id into v_member_id;
	end if;

	-- 根据输入的Title查询影片信息
	select count(*) into v_title_count
	from TITLE_WLX303
	where title_name = input_title;

	-- 如果影片存在则去除影片ID
	if v_title_count >0 then
	    select title_id into v_title_id
	    from TITLE_WLX303
	    where title_name=input_title;
	-- 否则插入新的影片
	else
	    INSERT into
	    TITLE_WLX303(title_name,DESCRIPTION)
	    values(input_title,'Default Value')
	    returning title_id into v_title_id;
	end if;

	-- 根据影片的COPY_ID和TITLE_ID查询该影片是否存在
	select count(*) into v_title_copy_count
	from TITLE_COPY_WLX303
	where TITLE_ID = v_title_id and COPY_ID =input_copy_id;

	-- 如果不存在则新建一个拷贝（可以看做是购买一个新的COPY）
	if v_title_copy_count =0 then
	    INSERT into
	    TITLE_COPY_WLX303(TITLE_ID,COPY_ID,STATUS)
	    values(v_title_id,input_copy_id,input_status)
	    returning copy_id into v_copy_id;
	  else
	    v_copy_id := input_copy_id;
	end if;

	-- 把新的信息插入RENTAL中
	INSERT into RENTAL_WLX303
	(member_id,title_id,copy_id,book_date)
	values(v_member_id,v_title_id,v_copy_id,input_date);

	-- 结束
	commit;
END INSERTALL_WLX303;

execute insertall_wlx303('聂','老师','让子弹飞',1,upper('AVAILABLE'),sysdate-15);
execute insertall_wlx303('常','梦飞','汉尼拔',2,upper('AVAILABLE'),sysdate-1);
execute insertall_wlx303('贺','思博','钢铁侠',1,upper('AVAILABLE'),sysdate-10);
execute insertall_wlx303('王','凌霄','钢的琴',3,upper('AVAILABLE'),sysdate-5);
execute insertall_wlx303('廖','诗宇','喜宴',2,upper('AVAILABLE'),sysdate-4);
execute insertall_wlx303('张','学明','湄公河行动',1,upper('AVAILABLE'),sysdate-20);
execute insertall_wlx303('常','梦飞','蜘蛛侠',3,upper('AVAILABLE'),sysdate-5);
execute insertall_wlx303('贺','思博','绿箭侠',5,upper('AVAILABLE'),sysdate-8);
execute insertall_wlx303('王','凌霄','高山下的花环',2,upper('AVAILABLE'),sysdate-19);
execute insertall_wlx303('廖','诗宇','泰坦尼克号',1,upper('AVAILABLE'),sysdate-8);
execute insertall_wlx303('张','学明','暴走漫画',3,upper('AVAILABLE'),sysdate-7);
