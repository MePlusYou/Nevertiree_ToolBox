# Hive Install

最终目的是下载并配置Hive，让Hive在Hadoop的本地模式下运行，并且将元数据存储在MySQL中。

## 1. Download & install Hive

[清华大学维护的Apache镜像](https://mirrors.tuna.tsinghua.edu.cn/apache/)

```shell
su
cd /usr/local/src
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-2.1.1/apache-hive-x.y.z-bin.tar.gz
tar -zxvf hive-x.y.z.tar.gz
mv hive-x.y.z.tar.gz ../hive
```

在/etc/profile中添加PATH和HIVE_HOME

```shell
sudo vim /etc/profile
```

在打打开的`/etc/profile`最底部写入一下语句，如果只在terminal中输入则在关闭terminal后会失效。

```shell
export HADOOP_HOME=/usr/local/hadoop
export HIVE_HOME=/usr/local/hive
export PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin
```

运行以下命令之一使`/etc/profile`生效

```shell
source /etc/profile
.  /etc/profile
```

上述命令也可以写成

```shell
sudo echo "export HIVE_HOME=/usr/local/hive" > /etc/profile.d/hive.sh
sudo echo "PATH=$PATH:$HIVE_HOME/bin" >> /etc/profile.d/hive.sh
. /etc/profile
```

## 2.MySQL Configuration

用root登陆，创建hive数据库并且赋予权限给Hive用户

```sql
CREATE DATABASE hive;
GRANT ALL PRIVILEGES ON hive.* TO hive_user@localhost IDENTIFIED BY "hive_password";
```

拷贝mysql-connector-Java-5.1.13.jar到hive的lib目录下，可以从[maven的官方仓库下载](http://central.maven.org/maven2/mysql/mysql-connector-java)

```shell
sudo tar -zxvf mysql-connector-java-5.1.13.jar
sudo cp mysql-connector-java-5.1.13/mysql-connector-java-5.1.13-bin.jar $HIVE_HOME/lib
```

```shell
cd /usr/local/hive/lib
sudo wget http://central.maven.org/maven2/mysql/mysql-connector-java/x.y.z/mysql-connector-java-x.y.z.jar
```

注意下载的格式，如果是tar.gz包或者zip包则要先解压再导入lib目录

```shell
sudo tar -zvf mysql-connector-java.tar.gz
```

## 3.Hive Configuration

修改配置hive-site.xml，让Hive把元数据存储在MySQL中

```shell
cd /usr/local/hive/conf
vim hive-site.xml
```

配置文件的内容在这里[hive-site.xml](hive-site.xml)。