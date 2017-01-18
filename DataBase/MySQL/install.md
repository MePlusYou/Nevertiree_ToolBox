# 下载MySQL

## Windows

1. 下载并解压ZIP包

MySQL的下载地址在[Download](http://dev.mysql.com/downloads/mysql/)

下载之后再目标地点解压之。

2. 配置`my.ini`文档

```ini
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8
[mysqld]
#设置3306端口
port = 3306
# 设置mysql的安装目录
basedir=E:\mysql\mysql-5.6.17-winx64
# 设置mysql数据库的数据的存放目录
datadir=E:\mysql\mysql-5.6.17-winx64\data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
```

3. MySQL初始化

> 如果你想转去E盘根目录的话，直接打E:回车，而不是cd E:回车。

```shell
cd E:\mysql\mysql-5.6.17-winx64\bin
mysqld install
mysqld --initialize --user=mysql --console
```

系统自动生成密码，例如`ppPu)E!Br1_a`，第一次登录时输入改密码

```shell
mysql -uroot -p
```

进入系统后立刻修改密码

```sql
set password=password('123456');
```

退出MySQL`quit`，再用新的密码重新登录。