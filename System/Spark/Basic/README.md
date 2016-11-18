# Spark

## 安装Spark

1.Java 6+
2.Python 2.7
3.Pre-built for Hadoop 2.4 and later

下载[spark-1.2.0.bin-hadoop2.4.tgz](http://spark.apache.org/downloads.html)

```shell

cd /usr/local/src
tar -xf spark-1.2.0-bin-hadoop2.4.tgz

```

## 基本操作

Python的Spark的shell `bin/pyspark`

Scala的Spark的shell  `bin/spark-shell`

运行py文件 `bin/spark-submit example.py`

退出shell Ctrl-D

## 入门使用

1.[设置读入的字符串](setCharacter.py)

2.[创建SparkConf对象](InitSparkConf.scala)

> 如果在shell中，sc已经自动创建
