# Hive数据导入

## 使用load语句导入

语法如下
```sql
load data [local] inpath 'filepath' [overwrite]
into table tablename [partition (partcol1=val1 ...)]
```

如果文件存储在操作系统上，则要使用local关键字。

如果从txt文件中导入数据时，要注意txt的分隔符和原表的数据分隔符是否对应。

## 使用Sqoop导入数据

Sqoop将关系型数据库中的数据导入到Hive中。Sqoop是Apache专门用于数据导入导出的框架。

用以下语句测试Sqoop连接成功
```shell
sqoop list-databases \
--connect jdbc:mysql://127.0.0.1:3306/ \
--username root -P
```

```shell
# 列出mysql数据库中的所有数据库
sqoop list-databases \
--connect jdbc:mysql://localhost:3306?useSSL=false \
--username root --password 0512
```

```shell
# 连接mysql并列出数据库中的表
sqoop list-tables \
--connect jdbc:mysql://localhost:3306/zhihu?useSSL=false
--username root --password 0512
```

```shell
# 将MySQL的zhihu.users表结构复制到Hive的zhihu库中，表名为users
sqoop create-hive-table \
--connect jdbc:mysql://localhost:3306/zhihu?useSSL=false \
--table users \
--username root --password 0512 \
--hive-table zhihu.users
```
注：该命令可以多次执行不报错

将mysql表的数据导入到hive中

```shell
# 追加数据
sqoop import \
--connect jdbc:mysql://localhost:3306/zhihu?useSSL=false \
--username root --password 0512 \
--table users \
--hive-import \
--hive-table zhihu.users
```

```shell
# 覆盖数据
sqoop import \
--connect jdbc:mysql://localhost:3306/zhihu?useSSL=false \
--username root --password 0512 \
--table users \
--hive-import \
--hive-overwrite \
--hive-table zhihu.users
```

注：如果MySQL中的表没有主键，则需要加--autoreset-to-one-mapper参数

```shell
#将hive表的数据导入到mysql中
sqoop export \
--connect jdbc:mysql://localhost:3306/zhihu?useSSL=false \
--username root --password 0512 \
--table t2 \
--export-dir /user/hive/warehouse/test.db/mysql_t1
```


把数据导入到HDFS中，并且指定导入的列和进程数量
```shell
./sqoop import
--connect jdbc:mysql:localhost:3306:database_name
--username myname --password mypassword
--table tablename
-- columns 'id,name,salary'
-m 1
--target-dir '/sqoop/test';
```

使用Sqoop导入MySQL数据到Hive中

```shell
./sqoop import
--hive-import
--connect jdbc:mysql:localhost:3306:database_name
--username myname --password mypassword
--table tablename
--columns 'id,name,salary'
-m 1
--target-dir '/sqoop/test';
```

使用Sqoop导入MySQL数据到Hive中，并指定表名

```shell
./sqoop import
--hive-import
--connect jdbc:mysql:localhost:3306:database_name
--username myname --password mypassword
--table tablename
--columns 'id,name,salary'
--hive-table table_name
-m 1
--target-dir '/sqoop/test';
```

使用Sqoop导入MySQL数据到Hive中，并使用where条件

```shell
./sqoop import
--hive-import
--connect jdbc:mysql:localhost:3306:database_name
--username myname --password mypassword
--table tablename
--columns 'id,name,salary'
--hive-table table_name
--where 'id=10'
-m 1
--target-dir '/sqoop/test';
```

使用Sqoop导入MySQL数据到Hive中，并使用查询语句

```shell
./sqoop import
--hive-import
--connect jdbc:mysql:localhost:3306:database_name
--username myname --password mypassword
--query 'select * from table id>10 and $CONDITIONS'
--target-dir '/sqoop/test';
--hive-table table_name
```
