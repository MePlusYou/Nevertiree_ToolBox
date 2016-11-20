# Shell入门到出家

## 新建shell

新建一个文件，扩展名为sh（sh代表shell）输入一些代码，第一行一般是这样：

```shell
#!/bin/bash
#!/usr/bin/php
```

“#!”是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行。

## 运行shell脚本

shell可以作为可执行程序：

```shell
chmod +x test.sh
./test.sh
```

注意，一定要写成./test.sh，而不是test.sh，运行其它二进制的程序也一样，直接写test.sh，linux系统会去PATH里寻找有没有叫test.sh的，而只有/bin, /sbin, /usr/bin，/usr/sbin等在PATH里，你的当前目录通常不在PATH里，所以写成test.sh是会找不到命令的，要用./test.sh告诉系统说，就在当前目录找。

shell也可以作为解释器的参数：

```shell
/bin/sh test.sh
```

这种方式运行的脚本，不需要在第一行指定解释器信息，写了也没用。

## 变量

### 定义变量

```shell
your_name="Alice"
```

注意，变量名和等号之间不能有空格。

### 使用变量

定义变量时，变量名不加美元符号（$）。而使用一个定义过的变量，要在变量名前面加美元符号。

```shell
your_name="Alice"
echo $your_name
echo ${your_name}
```

变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界。如果不给skill变量加花括号，写成echo "I am good at $skillScript"，解释器就会把$skillScript当成一个变量（其值为空），代码执行结果就不是我们期望的样子了。


```shell
for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill}Script"
done
```

## 注释

以“#”开头的行就是注释，会被解释器忽略。sh里没有多行注释，只能每一行加一个#号。

如果在开发过程中，遇到大段的代码需要临时注释起来，过一会儿又取消注释，怎么办呢？每一行加个#符号太费力了，可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。

## 字符串

字符串可以用单引号，也可以用双引号，也可以不用引号。

>单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的。

>单引号字串中不能出现单引号（对单引号使用转义符后也不行）。

>双引号里可以有变量。

>双引号里可以出现转义字符。

### 拼接字符串

```shell
your_name="Alice"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
```

### 获取字符串长度

```shell
string="abcd"
echo ${#string} #输出：4
```

### 提取子字符串

```shell
string = "To be or not to be ,that is a problem."
echo = ${string:1:4}
```

## 流程控制

### if/else

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

### for


```shell
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done
```

或者写成一行

```shell
for var in item1 item2 ;do command1;command2;done;
```

或者写成C语言风格

```shell
for (( EXP1; EXP2; EXP3 ))
do
    command1
    command2
    command3
done
```

### while

标准语法

```shell
while condition
do
    command
done
```

无限循环

```shell
while :
do
    command
done
```

### until

```shell
until condition
do
    command
done
```

### case

case的语法和C family语言差别很大，它需要一个esac（就是case反过来）作为结束标记，每个case分支用右圆括号，用两个分号表示break

```shell
case "${opt}" in
    "Install-Puppet-Server" )
        install_master $1
        exit
    ;;

    "Install-Puppet-Client" )
        install_client $1
        exit
    ;;

    "Config-Puppet-Server" )
        config_puppet_master
        exit
    ;;

    "Config-Puppet-Client" )
        config_puppet_client
        exit
    ;;

    "Exit" )
        exit
    ;;

    * ) echo "Bad option, please choose again"
esac
```

### source

可以用source引入其他文件

```shell
source ./function.sh
. ./function.sh
```

在bash里，source和.是等效的，他们都是读入function.sh的内容并执行其内容（类似PHP里的include），为了更好的可移植性，推荐使用第二种写法。


