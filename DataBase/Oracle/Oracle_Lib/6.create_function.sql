-- 6.假定Title名称中包含你姓名的影视剧的每次租金为10元
--  但是如果是姓名与你相同的会员租赁此片则免费），

-- 其它影视剧对所有会员租赁都是每次5元。
update TITLE set PRICE = 5;
-- 请编写一个函数（函数名为rentalsum_姓名首字母_学号后三位）
-- 计算一下总共收到的租赁费金额。

create or replace FUNCTION RENTALSUM_WLX303

	RETURN NUMBER AS

	v_member_id NUMBER :=0;
	v_title_id number :=0;
	v_count1 number :=0;
	v_count2 number :=0;
	v_sum number :=0;

BEGIN
	-- 根据用户last name寻找用户ID
    select member_id into v_member_id
    from MEMBER_WLX303
    where LAST_NAME = '凌霄';
    -- 根据用户last name寻找相关电影
    select title_id into v_title_id
    from TITLE_WLX303
    where TITLE_NAME like '%凌霄%';
    -- 计算非我本人借阅不含我名字的电影的数量
    select COUNT(*) into v_count1
    from RENTAL_WLX303
    where title_id != v_title_id and member_id != v_member_id;
    -- 计算非我本人借阅含我名字的电影的数量
    select count(*) into v_count2
    from RENTAL_WLX303
    where title_id = v_title_id and member_id != v_member_id;
    -- 计算总价格
    v_sum := v_count1*5 + v_count2*10;
    return v_sum;

END RENTALSUM_WLX303;

