# 面向对象编程

## 类与对象的实现

class identifier

class field

class method

```java
public class Radio{
	private boolean isTurnOn;

	private double frequence;
	private final double MAX_FREQUENCE = 100.0;
	private final double MIN_FREQUENCE = 0.0;

	private int volume;
	private final int MAX_VOLUME = 100;
	private final int MIN_VOLUME = 0;

	public Radio(){
	}

	public void changeVolume(int offset){
		if(!isTurnOn) return;
		volume += offset;

		volume = (volume>MAX_VOLUME)?MAX_VOLUME:volume;
		volume = (volume<MIN_VOLUME)?MIN_VOLUME:volume;

	}

	public void changeFrequence(double offset){
		if(!isTurnOn) return;
		frequence += offset;

		frequence = (frequence>MAX_FREQUENCE)?MAX_FREQUENCE:frequence;
		frequence = (frequence<MIN_FREQUENCE)?MIN_FREQUENCE:frequence;

	}

}
```

## 值传递与地址传递

String的赋值表象上看是地址传递。

对于基本类型变量，如果希望知道两个基本类型变量存储的值是否相等，可以直接用==进行判断。

对于对象类型，如果希望知道2个对象类型变量是否指向了相同的内存块，也可以使用==判断。

两个对象都是null时，对他们俩进行==比较时返回FALSE，因为他们没有构建，并没有指向相同的内存块。

## package/import

package define must be in front of class define

## private/public/protected

getter/setter

## override

for example

```java

java.util.Random r = new java.util.Random();
int x = r.nextInt();
int y = r.nextInt(100);

```

Constructor, which is a special kind of method ,can be override.

```java
public class Student{
	private int id;
	private String name;

	public Student(int id){
		this.id = id;
	}

	public Student(String name){
		this.name = name;
	}

	public Student(int id,String name){
		this.id = id;
		this.name = name;
	}
}
```

## this/super

## extends

定义一个类但是没有通过extends指定super class时，默认的super class是java.lang.Object

```java
package child;
import parent.Student;
public class Bachelor extends Student{
	private String major;

	public String getMajor(){
		return major;
	}

	public void setMajor(String major){
		this.major = major;
	}
}
```

instanceof的作用是测试左边的对象是否是它右边的对象的示例。

```java
	if(s instanceof Doctor){
		Doctor d = (Doctor)s;
		int years = d.setSpendYears;
	}
```

## interface/abstract class

## object class

## String manipulate

拼接String时会造成大量无用字符串冗余在字符串池

```java
public static String getSql(int id, String name){
	StringBuilder result = new StringBuilder(Hello);
	result.append(id);
	result.append(name);
	return result.toString();
}

```