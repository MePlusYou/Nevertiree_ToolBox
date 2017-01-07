# Scrapy

Scrapy是著名的Python爬虫框架，安装Scrapy需要依赖许多包。

1.下载依赖包

使用`pip install scrapy`会自动安装依赖包。

2.手动安装`lxml包`

`lxml包`无法通过pip安装，到[这里](http://www.lfd.uci.edu/~gohlke/pythonlibs/)下载文件

`lxml-3.5.0-cp27-none-win32.whl`

然后在存放该下载文件的目录下执行命令

> Python2.7下载`cp27`，Python3.4下载`cp34`

```
pip install lxml-3.5.0-cp27-none-win32.whl
```

5.最后统筹安装

```
pip install scrapy
```

如果遇到如下错误提示：

> Microsoft Visual C++ 9.0 is required Unable to find vcvarsall.bat

则到(https://www.microsoft.com/en-us/download/details.aspx?id=44266)下载并安装vc++插件