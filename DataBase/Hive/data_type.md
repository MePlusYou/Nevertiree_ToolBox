# 数据类型


## 基本数据类型

1. 整数类型 tinyint/smallint/int/bigint

2. 浮点数类型 float/double

3. 布尔类型 boolean

4. 字符串类型 string

```sql
create table person(
    pid int,
    pname string,
    married boolean,
    salary double);
```

## 复杂数据类型

1. 数组类型 Array

2. 集合类型 Map

3. 结构类型 Struct

```sql
create table student(
    sid int,
    sname,varchar,
    grade map<varchar,float>);
```

## 时间类型

1. Data

2. Timestamp