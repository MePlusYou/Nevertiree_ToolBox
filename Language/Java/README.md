# Java

## 下载与安装

[JDK下载地址](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

1.Linux

选择`Linux x64`版本的`tar.gz`格式文件

把`tar.gz`文件保存在`/usr/local/src`下，然后解压之。

```shell
sudo tar -xvf jdk-****-linux-x64.tar.gz
sudo mkdir /usr/local/java
sudo mv jdk-****-linux-x64 /usr/local/java
```

在`/etc/profile`中添加JDK的环境变量

```conf
export JAVA_HOME=/usr/local/java
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

使用命令`source /etc/profile`使上述配置生效，用命令行`java -version`验证。

## [基本内容](Introduction)

<table>
    <tr>
        <td><a href="Introduction/README.md">操作符</a></td>
        <td><a href="Introduction/README.md">控制执行流程</a></td>
        <td><a href="Introduction/README.md">初始化与清理</a></td>
        <td><a href="Introduction/README.md">访问控制权限</a></td>
        <td><a href="Introduction/README.md">复用类</a></td>
    </tr>
</table>

## [面向对象](OOP)

<table>
    <tr>
        <td><a href="OOP/README.md">多态</a></td>
        <td><a href="OOP/README.md">接口</a></td>
        <td><a href="OOP/README.md">内部类</a></td>
    </tr>
</table>

## [类型](Collections)

<table>
    <tr>
        <td><a href="Collections/README.md">字符串</a></td>
        <td><a href="Collections/README.md">枚举类型</a></td>
        <td><a href="Collections/README.md">持有对象</a></td>
        <td><a href="Collections/README.md">类型信息</a></td>
    </tr>
</table>

## [Java异常](Exception)

## [I/O](IO)

Java的文件输入输出和JDBC

## Java附属功能

正则表达式、安全性等

## [Java高级功能](Advanced)

## [小项目](Project)

> 参考书目
> 1.《Thinking in Java》
> 2.《Java Puzzle》
> 3.《Effective Java》
> 4.《Java 8 实战》
> 5.《Java程序员修炼之道》