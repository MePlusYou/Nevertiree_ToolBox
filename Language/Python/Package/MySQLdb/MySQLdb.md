# MySQLdb

## Windows下安装

> using `pip install` and `wheel`

1.install wheel

```
pip install wheel
```

2. download MySQLdb wheel

[Download Site](http://www.lfd.uci.edu/~gohlke/pythonlibs/)

下载MySQL_python-1.2.5-cp27-none-win32.whl安装包，在下载之前先要确定你安装的Python是32位的还是64位的，如果是32位的就下载32位的，如果是64位的就下载64位的。

3. pip install

执行以下命令
```
pip install MySQL_python-1.2.5-cp27-none-win32.whl
```

如果是安装64位的，需要把这个文件名改为`MySQL_python-1.2.5-cp27-none-any.whl`。

## Linux下安装



## test connection

```python

# -*- coding: UTF-8 -*-
# 建议 127.0.0.1，在某些环境下localhost不能用
import MySQLdb
conn = MySQLdb.connect(host="127.0.0.1", port=3306, user="username", passwd="passwd", db="databaseName")
cur = conn.cursor()
print cur

```
