-- 6.假定Title名称中包含你姓名的影视剧的每次租金为10元
--  但是如果是姓名与你相同的会员租赁此片则免费），

-- 其它影视剧对所有会员租赁都是每次5元。
update TITLE set PRICE = 5;
-- 请编写一个函数（函数名为rentalsum_姓名首字母_学号后三位）
-- 计算一下总共收到的租赁费金额。

create or replace function RENTALSUM_WLX_303
	(current_name_in IN varchar2)
	return number
is
	rental_sum number;
	


begin

return 
