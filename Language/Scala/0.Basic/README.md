# Scala基础语法

现在的程序都运行在Scala REPL中，如想在外部加载一个Scala文件，可以先编写.scala文件，然后在Scala REPL中用:load <file>调用。或者输入:paste -raw 按回车键，在下一行粘贴.scala文件中的内容。

## 1.值赋值

```scala

val <name>:<type>=<literal>

val x:Int = 5

```

如果简写成`val <name> = <literal>`，Scala编译器会自动推断值的类型（类型推导）。

## 2.变量赋值

```scala
var <name>:<type>=<literal>
```

同上，变量赋值也可以写成`var <name> = <literal>`。

## 3.类型

Scala不允许较高等级的类型自动转换到较低等级的类型。可以选择用toType手动完成转换。

```scala

val l : Long = 20

val i : Int = l.toInt

```

## 4.String

Scala的String要用""包括，特殊字符要转义。但是用"""String""""三重包括的不需要。

String的==可以比相等性而不是引用相等性。

String可以用$和s前缀内插:

```scala

val approx = 335/113f

println(s"pi,using 335/113 ,is about $approx")

```

大括号内插表示法

```scala

val item = "apple"

s"How do you like them ${item}s?"

s"Fish n chips n vineger,${"pepper"*3}salt"

```

f表示法

```scala

val item = "apple"

f"I wrote a new $item%.3s today"

f"Enjoying this $item ${335/113.0}%.5f times today"

```

## 5.Regex


