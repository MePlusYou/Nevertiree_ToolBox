修复数据表操
MYSQL数据表出现问题，提示：
Error: Table './db_name/table_name' is marked as crashed and last (automatic?) repair failed
修复数据表操作：
1、service mysqld stop;
2、cd /var/lib/mysql/db_name/
3、myisamchk -r tablename.MYI (修复单张数据表)
myisamchk -r *.MYI (修复所有数据表)
注意：操作第三步前一定要把mysql服务停掉。