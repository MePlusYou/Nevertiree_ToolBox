# 查询优化

1.查询MySQL版本和当前数据库

```sql
select version(),database();
```

2.合并多列构建复合值

通过组合多列的列植来产生一个复杂的查询结果。

```sql
-- 组合srucser和srchost两列的值生成邮件地址
select concat(srcuser,'@',srchost) as sender from mail;
```

> 在where子句中不能使用别名，但是在order中可以使用别名。

3.查询结果唯一化

```sql
-- 显示全部内容
select srcuser from mail;
-- 显示唯一内容
select distinct srcuser from mail;
```

4.与NULL值比较

```sql
select * from taxpayer where id is null;
select * from taxpayer where id is not null;
select NULL <=> NULL;
```

5.If函数

```sql
-- if(condition,true,false)
select name,if(id is null,'Unknown',id) as 'id' from taxpayer;
-- 与以下语句等价，但以下语句销量更高
select name,ifnull('Unknown',id) as 'id' from taxpayer;
```

6.从查询结果取出部分行

从查询头尾取出部分行:

```sql
-- 取头一个
select * from profile order by birth limit 1;
-- 取尾一个
select * from profile order by birth desc limit 1;
```

从查询中途取出部分行:

```sql
-- 一般写法，在查询大数据的时候需要先遍历之前的全部数据，效率低下
select * from profile order by birth desc limit 10000,10;
-- 用子查询优化如下
select * from profile where birth >
    (select birth from profile order by birth desc limit 10000,1)
order by birth desc limit 10;
```

7.取得行数

```sql
-- 取得上一个查询语句的结果数量
select found_rows();
```