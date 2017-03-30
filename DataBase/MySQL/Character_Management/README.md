# 字符串处理

二进制字符串类型有：`BINARY` `VARBINARY` `BLOB`，非二进制字符串类型有：`CHAR` `VARCHAR` `TEXT`，其中非二进制类型有`CHARACTER SET`和`COLLATE`属性。

制定数据库的字符串类型
`
CREATE DATABASE `tpcms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
`

1.查看字符串属性

查看系统中全部的字符集，默认字符集是`latin1`

```sql
show character set;
```

查看系统中全部的COLLATION，COLLATION决定了排序方式，每个字符集有自己的COLLATION类型。

```sql
-- 查找和latin相关的COLLATION
show collation like 'latin1%';
-- 查找和utf8相关的COLLATION
show collation like 'utf8%';
```

名称以ci cs和bin结尾的Collation分别是大小写不敏感、大小写敏感和二进制。

检查当前字符集和COLLATE

```sql
set names 'latin1' collate 'latin7_bin';
select charset('abc'),collation('abc');
-- user()会返回一个Unicode字符串
select user(),charset(user()),collation(user());
```

2.改变当前的字符集或者COLLATION

```sql
-- 使用CONVERT()函数改变字符串的字符集
set @s1 = 'my string';
set @s2 = convert(@s1 using utf8);
select charset(@s1),charset(@s2);
-- 使用COLLATE操作符改变字符串的COLLATION
set @s3 = 'my string';
set @s4 = @s3 collate latin1_spanish_ci;
select collation(@s3),collation(@s4);
```

如果需要同时改变字符串的字符集和COLLATION，需要首先用Convert函数改变字符集，再对结果更改COLLATION。

可以有多种方法把数据变成二进制，以下两种方式的结果相同。

```sql
SET @s1 = 'my String';
SET @s2 = BINARY @s1;
SET @s3 = convert(@s1 using binary);
```

服务器默认的字符集为`latin1`的`latin1_swedish_ci`，可以在`my.ini`中修改配置文件

```ini
[mysql]
default-character-set=utf8
```

或者在用外部语言链接MySQL时配置，以Java为例

```
jdbc:mysql://127.0.0.1/databaseName?characterEncoding=UTF-8
```

3.挑选不同的collation配合`order by`改变排序顺序

使用大小写不敏感的排序
```sql
select c from t order by c collate latin1_swedish_ci;
```
使用大小写敏感的排序
```sql
select c from t order by c collate latin1_general_cs;
```
使用二进制排序法
```sql
select c from t order by c collate latin1_bin;
```
在区分大小写的模式下比较大小写不区分的字符串
```sql
select
min(str_col collate latin1_general_cs) as min,
max(str_col collate latin1_general_cs) as man
from tbl;
```
在不区分大小写的模式下比较大小写区分的字符串
```sql
select
min(str_col collate latin1_swedish_ci) as min,
max(str_col collate latin1_swedish_ci) as max
from tbl;
```

4.用length()和char_length()判断字符串中是否包含多字节字符

```sql
-- ucs2
SET @a = convert('abc' USING ucs2);
select length(@a),char_length(@a);
-- utf8
SET @b = convert('abc' USING utf8);
select length(@b),char_length(@b);
```

5.选择字符串的数据类型

<table>
    <th>二进制数据类型</th><th>非二进制数据类型</th><th>最大长度</th>
    <tr><td>BINARY</td><td>CHAR</td><td>255</td></tr>
    <tr><td>VARBINARY</td><td>VARCHAR</td><td>65535</td></tr>
    <tr><td>TINYBLOB</td><td>TINYTEXT</td><td>255</td></tr>
    <tr><td>BLOB</td><td>TEXT</td><td>65535</td></tr>
    <tr><td>MEDIUMBLOB</td><td>MEDIUMTEXT</td><td>16777215</td></tr>
    <tr><td>LONGBLOB</td><td>LONGTEXT</td><td>4294967295</td></tr>
</table>

MySQL用固定长度来存储BINARY和CHAR数组，而用可变的长度存储VARBINARY VARCHAR BLOB和TEXT。

例如`CHAR(10)`中写入`abc   `后，系统会用`0x00`字节填充后部，在检索时，尾部填充的字节会被去除，得到的值是`abc`。

但是用`VARCHAR`写入`abc   `后再读取，abc后的空格会被保留。

建表的时候可以指定`CHARSET`和`COLLATE`

```sql
create table table_name(
    utf8data varchar(100) character set utf8 collate utf8_danish_ci,
    sjisdata varchar(100) character set sjis collate sjis_japanese_ci
    );
```

6.更改字符串大小写

使用`upper()`和`lower()`函数。如果这两个函数失效，很可能是操作对象是二进制数据。需要先将其转换成非二进制。

```sql
select b,
upper(convert(b using latin1)) as upper,
lower(convert(b using latin1)) as lower,
from t;
```

常用案例：把字符串的第一个字符改成大写，其他部分保持不变

```sql
concat(upper(left(str,1)),mid(str,2))
```

包装成MySQL函数

```sql
-- 编写函数
    create function initial_cap (s varchar(255))
    returns varchar(255) deterministic
    return concat(upper(left(s,1)),mid(s,2));
-- 调用函数
select initial_cap('abc');
```

7.用SQL模式匹配

SQL模式通常使用`LIKE`和`NOT LIKE`来匹配字符串和模式串，而不使用`= !=`。通常使用`_`匹配任意一个字符，使用`%`匹配任意一个字符串。

```sql
-- 匹配以son结尾的名字
select name from metal where name like 'son%';
-- 匹配以Mike开头的名字
select name from metal where name like '%Mike';
-- 匹配含有jack的名字
select name from metal where name like '%jack%';
-- 匹配从第四个字开始是son的名字
select name from metal where name like '____son%'
```

8.用正则表达式匹配

正则表达式通过关键字`regexp`和`not regexp`匹配

```sql
-- 匹配以son结尾的名字
select name from metal where name regexp 'son$';
-- 匹配以Mike开头的名字
select name from metal where name regexp '^Mike';
-- 匹配含有jack的名字
select name from metal where name regexp 'jack';
-- 匹配从第四个字开始是son的名字
select name from metal where name regexp '^...son%'
```
