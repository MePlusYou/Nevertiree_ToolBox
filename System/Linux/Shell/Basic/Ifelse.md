sh里的if [ $foo -eq 0 ]，这个方括号跟Java/PHP里if后面的圆括号大不相同，它是一个可执行程序,正因为方括号在这里是一个可执行程序，方括号后面必须加空格，不能写成if [$foo -eq 0]。

```shell
if condition
then
    command1 
    command2
    ...
    commandN 
fi
```

写成一行（适用于终端命令提示符）: 

```
if `ps -ef | grep ssh`;  then echo hello; fi
```

```shell
if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi
```

```shell
if condition1
then
    command1
elif condition2
    command2
else
    commandN
fi
```
