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

测试连接成功
```
sqoop list-databases --connect jdbc:mysql://127.0.0.1:3306/ --username root -P
```

使用Sqoop导
入MySQL数据到HDFS中

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


