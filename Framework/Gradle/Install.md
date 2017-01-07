# Gradle Download & Install

## Windows

1. 切换到 `控制面板-系统和安全-系统-高级系统设置-高级-环境变量`

2. `系统变量`中新建`GRADLE_HOME`，值为`E:\Program Files (x86)\gradle-3.2.1-all\gradle-3.2.1`

3. 在`系统变量`的`PATH`中添加`%GRADLE_HOME%\bin`

4. 在cmd中输入`gradle -v`测试可用性

> 注 如果没有成功，可用在`用户变量`中再添加一次`PATH`
