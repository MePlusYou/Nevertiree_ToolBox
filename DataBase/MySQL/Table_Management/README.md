# 表管理

1.表管理

新建一张有相同表结构的表

```sql
-- 新建的表不含外键、DATA DIRECTORY和INDEX DIRETORY
create table new_table like original_table;
-- 同时拷贝数据则用以下语句
insert into new_table select * from original_table;
```

2.将查询结果保存到表中

在实际的开发中，可以保存查询结果到表中进行调试，这大量节约了时间。

```sql
-- 将查询插入存在的表
insert into dst_table(id,name) select id,name from src_table;
-- 将查询插入不存在的表，需要先创建再插入
create table dst_table select * from src_table;
-- 创建一个空的目的表
create table dst_table select * from src_table where 0;
-- 只复制部分列进入新表
create table dst_table select a,b,c from src_table;
-- 在创建时指明索引
create table dst_table (primary key (id),index(state,city)) select * from src_table;
```
