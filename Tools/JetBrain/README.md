# JetBrains家族

## Linux平台安装

1. 下载tar.gz包

2. `tar -zxvf` 解压

3. 把解压后的包拷贝到`/usr/local/pycharm`或者`/usr/local/idea`

4. 进入`/bin`目录用`sh`命令运行，开始初始化


## PyCharm 输入法

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
export CLASSPATH

LD_LIBRARY_PATH="$IDE_BIN_HOME:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# ---------------------------------------------------------------------
# Run the IDE.
# ---------------------------------------------------------------------
```