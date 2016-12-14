# Exception

## Exception Class

### 内部异常

内部异常就是发生在程序外部，且无法恢复的错误。比如你打开了一个文件读取系统配置信息，但是那个文件却因为磁道异常而无法读取。这种错误无法恢复，程序可以在显示错误后退出。

所有的内部异常都是通过Error类以及Error类的子类进行定义。

### RuntimeException类

运行时才能发现的异常指在代码运行阶段才能发现的错误。该类型错误通常因为逻辑顺序错误和系统bug造成的，也是不能恢复的。比如某个对象为null，用户在不知情的情况下向该对象发送了消息，也就是向一个不存在的对象发送消息，必然要出错。

再比如只能放置5个元素的数组，编码者由于失误要存放6个元素，这样的错误也只能在运行阶段才能被虚拟机发现。运行时才能发现的异常都是通过RuntimeException类以及RuntimeException
类的子类进行定义。

### 需要监测的异常

好程序应该能在错误发生的时候监测到该错误，并能从错误中恢复的异常。

比如程序需要用户输入文件名称用于读取某些信息，用户可能输入正确的文件，也可能是不存在的文件。那么对于不存在的文件，代码就需要通过监测这个错误做出应对，告知用户该文件不存在，并重新让用户输入文件名称。

## Exception Handle

try-catch-finally

```java
 try {
	do_something_wrong
 }catch(java.io.IOException e1){
	e.printStackTrace();
	System.out.println("Error!!!");
 }catch(NullPointerException e){
	System.out.println();
 } finally {
	do_something_finally
}
```