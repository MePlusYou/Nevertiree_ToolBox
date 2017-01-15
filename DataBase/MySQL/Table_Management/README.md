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

3.使用临时表

```sql
-- 在创建临时表之前采取安全措施
drop temporary table if exists tbl_name;
-- 普通的建立临时表
create temporary table tbl_name
(
    );
-- 克隆表
create temporary table new_table like original_table;
-- 根据查询结果建立表
create temporary table new_table select * from original_table;
```

在数据库链接断开以后，临时表会被自动删除。临时表可以与原表名字相同，但是临时表之间必须有唯一名字。

如果临时表和原表有相同名字，则在临时表的生命周期内，同名普通表会被MySQL屏蔽。这时可以对临时表做任意操作，不用担心原表被修改。

4.查询和修改MySQL引擎

查询MySQL引擎

```sql
-- 查询特定的表的引擎
select engine from information_schema.tables
where table_schema = 'database_name' and table_name = 'table_name';
-- 查询全部某数据库下的全部引擎
use database_name;
show table status;
```

修改MySQL引擎

```sql
alter table table_name engine = InnoDB;
```
