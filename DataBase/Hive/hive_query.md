# Hive查询

## Fetch Task

不通过MapReduce就进行简单查询

1. 直接在Hive的交互界面输入以下命令，使本次全部使用fetch task
```shell
set hive.fetch.task.conversion=more;
```

2. 在Linux命令行中使用
```shellmv
hive --hiveconf hive.fetch.task.conversion=more
```

3. 修改配置文件

添加配置，永久的更改Fetch Task

```xml
<property>
    <name>hive.fetch.task.conversion</name>
    <value>more</value>
</property>
```
