# 生成摘要

1.count优化

查询美国一共有几个州

```sql
-- 最简单的做法
select count(*) from states;
```

在MyISAM引擎中使用无where的查询非常快，但是对于InnoDB来说，上述语句会进行完整的表扫描。

```sql
-- 避免完整扫描整个表
select table_rows from information_schema.tables where table_schema = 'database_name' and table_name = 'table_name';
```

2.计算唯一值的存在数量

`distinct`常常和`order by`配合产生有价值的数据。

```sql
-- 唯一值得个数
select count(distinct row_name) from table_name;
-- 唯一值
select distinct row_name from table_name;
```
