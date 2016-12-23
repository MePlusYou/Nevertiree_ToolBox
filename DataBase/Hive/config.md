[csdn1](http://blog.csdn.net/luyee2010/article/details/8466146)

[csdn2](http://blog.csdn.net/wind520/article/details/38638031)

一，安装MySQL 


首先用root登陆给Hive用户赋予权限

```shell
MySQL -u root -p111111

```

```sql
GRANT ALL PRIVILEGES ON hive.* TO hive@localhost IDENTIFIED BY "hive";
```

2，安装hive；

$ tar zxvf hive-0.8.1.tar.gz

在/etc/profile中添加;

```shell
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
export PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin
```

生效（.与/etc/profile之间用空格哦）

```shell
source /etc/profile
.  /etc/profile
```

三，拷贝mysql-connector-Java-5.1.13.jar到hive的lib目录下

download mysql-connector-java

```
cd /usr/local/hive/lib

sudo wget http://central.maven.org/maven2/mysql/mysql-connector-java/6.0.5/mysql-connector-java-6.0.5.jar
```


四，修改配置hive-site.xml

```shell
cd /usr/local/hive/conf
vim hive-site.xml
```

[hive-site.xml](hive-site.xml)

启动hive，可以用起来了吧；、



hive> create table hive1(id int ,name string)ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
OK
Time taken: 10.865 seconds
hive> show tables;
OK
hive1
Time taken: 0.586 seconds
hive> desc hive1;
OK
id    int    
name    string    
Time taken: 0.317 seconds
hive> show tables;
OK
hive1
Time taken: 0.182 seconds
hive> 



好了推出hive，在起启动hive


创建表：

hive> create table hivetest(id int,name string);        
OK
Time taken: 0.25 seconds
hive> show tables;
OK
hivetest
Time taken: 0.139 seconds
hive> 

进入mysql:


mysql> SELECT *FROM TBLS\G;
*************************** 1. row ***************************
            TBL_ID: 1
       CREATE_TIME: 1357308618
             DB_ID: 1
  LAST_ACCESS_TIME: 0
             OWNER: sina
         RETENTION: 0
             SD_ID: 1
          TBL_NAME: hivetest
          TBL_TYPE: MANAGED_TABLE
VIEW_EXPANDED_TEXT: NULL
VIEW_ORIGINAL_TEXT: NULL
*************************** 2. row ***************************
            TBL_ID: 6
       CREATE_TIME: 1357309812
             DB_ID: 1
  LAST_ACCESS_TIME: 0
             OWNER: sina
         RETENTION: 0
             SD_ID: 6
          TBL_NAME: zjz
          TBL_TYPE: MANAGED_TABLE
VIEW_EXPANDED_TEXT: NULL
VIEW_ORIGINAL_TEXT: NULL
*************************** 3. row ***************************
            TBL_ID: 7
       CREATE_TIME: 1357311283
             DB_ID: 1
  LAST_ACCESS_TIME: 0
             OWNER: sina
         RETENTION: 0
             SD_ID: 7
          TBL_NAME: mytest
          TBL_TYPE: EXTERNAL_TABLE
VIEW_EXPANDED_TEXT: NULL
VIEW_ORIGINAL_TEXT: NULL
3 rows in set (0.00 sec)

ERROR: 
No query specified

在此之前建立了几个表：

hive> CREATE EXTERNAL TABLE MYTEST(num INT, name STRING)  
    > ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'    //分隔符 ‘\t’
    > ;
OK
Time taken: 0.142 seconds
hive> load data local inpath  '/tmp/hive.txt' overwrite into table MYTEST;  
Copying data from file:/tmp/hive.txt
Copying file: file:/tmp/hive.txt
Loading data to table default.mytest
Deleted hdfs://localhost:9000/user/hive/warehouse/mytest
OK
Time taken: 0.402 seconds
hive> SELECT * FROM MYTEST;
OK
NULL    NULL
22    world
33    hive
Time taken: 0.089 seconds
hive> 

再来看看hive.txt

sina@ubuntu:~/hive/conf$ cat /tmp/hive.txt 
11,hello
22    world
33    hive
sina@ubuntu:~/hive/conf$ 