# Sqoop

Sqoop是Apache项目中用于导入导出大量数据的框架。

Hadoop：2.7.2
MySQL：5.7.15
sqoop：1.99.5

[Apache Sqoop Docs](http://sqoop.apache.org/docs/)

## 下载地址

[清华大学Sqoop镜像](https://mirrors.tuna.tsinghua.edu.cn/apache/sqoop/)

## 安装教程

[厦门大学数据库实验室](http://dblab.xmu.edu.cn/blog/install-sqoop1/)

## Sqoop-MySQL测试语句

```
sqoop list-databases --connect jdbc:mysql://127.0.0.1:3306/ --username root -P
```