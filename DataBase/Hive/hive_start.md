# 启动Hive

## Hive命令行启动

在Linux中直接输入以下三个命令任意一个即可进入Hive的交互模式

```shell
$HIVE_HOME/bin/hive
hive
hive --service cli
```

如果不想显示Hive的调试信息，可以用静默模式登录Hive `hive -S`

如果不想进入Hive的交互模式，可以输入`hive -e`，例子如下：

```shell
hive -e 'show tables';
```

## Hive交互模式常用命令

1. 清屏 `Ctrl+L`或者`!clear;`

2. 查看数据仓库中的表 `show tables;`

3. 查看数据仓库中的内置函数`show functions;`

4. 查看表结构 `desc table_name;`

5. 查看保存在HDFS上的文件 `dfs -ls dir_name`

6. 执行Linux命令 `! linux_command`

7. 执行HQL语句 `select * from table;`

8. 执行SQL脚本 `source sql_file.sql`

> Hive把SQL语句解析成MapReduce作业，然后提交到Hadoop上执行。

## Hive-Web界面方式

```shell
hive --service hwi &
```