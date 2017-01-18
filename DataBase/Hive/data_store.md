# Hive数据存储

Hive的数据存储在HDFS的文件夹中，而且表没有专门的数据存储格式。

## 内部表 Table

每个Table在Hive中都有一个相应的HDFS目录存储数据，全部数据保存在该目录中。

建立最简单的表
```sql
create table test1(
    tid int,
    tname string,
    age int);
```

指定数据存放的位置
```sql
create table test2(
    tid int,
    tname string,
    age int)
    location '/mytable/hive/test2';
```

设置数据文件的分割符
```sql
create table test_table(
    tid int,
    tname string,
    gender,boolean
    )
    row format delimited fields terminated by ',';
```

直接拷贝表
```sql
create table test4
as
select * from sample_data;
```

增加列
```sql
alter table test add columns(new_row int);
```

## 分区表 Partition

## 外部表

## 桶表