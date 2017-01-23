## Linux & Windows 敏感

Linux下mysql安装完后是默认：区分表名的大小写，不区分列名的大小写，MySQL在Windows下都不区分大小写。

用root帐号登录后，在/etc/mysql/conf.d/mysql.cnf中的[mysqld]后添加添加lower_case_table_names=1。其中0：区分大小写，1：不区分大小写

重启MYSQL服务

```
service mysql restart
```

用以下命令检查

```sql
 show variables like '%case%';
```

MySQL在Linux下数据库名、表名、列名、别名大小写规则是这样的：
1、数据库名与表名是严格区分大小写的；
2、表的别名是严格区分大小写的；
3、列名与列的别名在所有的情况下均是忽略大小写的；
4、变量名也是严格区分大小写的；

本次修改会影响到Hive的依赖