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

根据字段把原始表分成不同的分区以提高效率。

创建以性别为区分条件的表，在HDFS中该表会被存储在不同的文件夹中。
```sql
create table partition_table(
    sid int,
    sname string)
    partitioned by (gender string)
    row format delimited fields terminated by ',';
```

从另一个表中插入男生的信息
```sql
insert into table partition_table
partition(gender = 'M')
select * from original_table where gender = 'M';
```

可以用`explain`查看SQL语句的执行计划

## 外部表 External Table

外部表只有一个过程，加载数据和创建表同时完成，并不会移动到数据仓库目录中。

外部表只是与外部建立一个链接，当删除一个外部表时，仅仅删除该链接。

```sql
create external table external_table(
    sid int,
    sname string,
    age int)
    row format delimited fields terminated by ','
    -- 数据在HDFS的/input文件夹
    location '/input';
```

## 桶表 Bucket Table

桶表对数据进行hash取值，然后放到不同文件中存储。

```sql
create table bucket_table(
    sid int,
    sname,string
    age int)
    clustered by(sname) into 5 buckedts;
```
