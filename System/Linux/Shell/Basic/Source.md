## Source

可以用source引入其他文件

```shell
source ./function.sh
. ./function.sh
```

在bash里，source和.是等效的，他们都是读入function.sh的内容并执行其内容（类似PHP里的include），为了更好的可移植性，推荐使用第二种写法。
