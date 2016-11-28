-- 4.写一个存储过程，命名为insertall_姓名首字母_学号后三位,
-- 其功能是一次性分别在member表、title表（如果存在同名影视记录则不插入）、title_copy表和rental表插入一条记录
-- 并成功提交，以实现补录一条以前手工租赁信息；

create or replace PROCEDURE INSTALL_WLX_303
(MEMBER_ID IN OUT NUMBER,
TITLE_ID IN OUT NUMBER,
COPY_ID IN OUT NUMBER,
)

is

begin

end;

-- 5.通过调用上述存储过程，至少补录十条以上的租赁信息进入系统
-- 至少有一个member的姓名与你的姓名相同
-- 至少有一个影视剧或电影的Title名称中包含有你的姓名。
-- 对含有你姓名的Insert语句及其执行结果需要抓屏到实验报告中
-- 将select * from member；
-- select * from title；
-- select * from rental三个SQL语句的执行结果抓屏到实验报告中。