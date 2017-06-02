# JetBrains家族

## Linux平台安装

1. 下载tar.gz包

2. `tar -zxvf` 解压

3. 把解压后的包拷贝到`/usr/local/pycharm`或者`/usr/local/idea`

4. 进入`/bin`目录用`sh`命令运行，开始初始化


## JetBrain 输入法

JetBrain旗下的产品包括PyCharm或者IDEA Intellij在Linux系统中有时不可以输入中文，这时要进入产品的`bin`目录修改启动的文件。

现在以`pycharm.sh`和`idea.sh`为例，在文件汇总加入以下几行——


```
CLASSPATH="$IDE_HOME/lib/bootstrap.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/extensions.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/util.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/jdom.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/log4j.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/trove4j.jar"
CLASSPATH="$CLASSPATH:$IDE_HOME/lib/jna.jar"
if [ -n "$PYCHARM_CLASSPATH" ]; then
  CLASSPATH="$CLASSPATH:$PYCHARM_CLASSPATH"
fi

# 加入以下几行
export CLASSPATH
LD_LIBRARY_PATH="$IDE_BIN_HOME:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
# 加入以上几行

# ---------------------------------------------------------------------
# Run the IDE.
# ---------------------------------------------------------------------
```