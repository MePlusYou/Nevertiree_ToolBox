# Spark基础

##1.安装Spark

1.Java 6+

2.Python 2.7

3.Pre-built for Hadoop 2.4 and later

4.[spark-1.2.0.bin-hadoop2.4.tgz](http://spark.apache.org/downloads.html)

```shell

cd /usr/local/src
tar -xf spark-1.2.0-bin-hadoop2.4.tgz

```

##2.基本操作

打开Python shell `bin/pyspark`

打开Scala shell  `bin/spark-shell`

运行外部文件 `bin/spark-submit example.py`

退出shell `Ctrl-D`

在文件中结束Spark进层 `sc.stop()`


##3.入门使用

1.因为读入的字符串可能没有被正确解析，所以在文件的头部要[设置读入的字符串格式](setCharacter.py)

2.在Shell中，Spark已经自动创建好了**SparkConf对象**，但是在运行外部文件时，我们要[手动创建SparkConf对象](InitSparkConf)

3.Spark的核心数据抽象是RDD，用户可以用两种方法[创建RDD](CreateRDD)：读取外部数据集合和分发程序中的对象集合。

4.RDD的转化操作生成新的RDD，行动操作生成返回外部系统的结果。[简单RDD操作](Function)。

5.[PairRDD](CreatePair)可以由RDD通过map方式生成，也可以从数据中生成。

6.PairRDD也属于RDD，所以RDD有的操作PairRDD也有。如果说每门语言都有一个Hello World话，那么每个分布式系统的第一课都要是Word Count。现在我们终于可以完成一个简单[词频统计Python](PairFunction/counter.py)了。
