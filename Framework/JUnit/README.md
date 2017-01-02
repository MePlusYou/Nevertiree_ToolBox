# JUnit

本笔记使用 `Spring+Gradle+JUnit`的套路

## 构建安装

在`build.gradle`中加入`testCompile`

```gradle
dependencies {
    // https://mvnrepository.com/artifact/junit/junit
    testCompile group: 'junit', name: 'junit', version: '4.11'
}
```

## 使用JUnit

在使用`IntelliJ IDEA`作为开发环境时，选中某类的类名再按下`Alt + Enter`就会自动生成对应位置的测试类。

```java
    @Test
    public void exampleTest() throws Exception {
        // 重点就是这个相等断言
        assertEquals("excepted",exampleClass.example());
    }
```