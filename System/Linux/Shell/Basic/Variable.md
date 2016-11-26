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
