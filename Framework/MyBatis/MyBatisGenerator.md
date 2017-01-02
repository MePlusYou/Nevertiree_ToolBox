# MyBatisGenerator

具体使用需要一个`mybatis-generator-core`的jar包和一个`generatorConfig.xml`配置文件。

## Generator包的下载使用

下载地址在[Maven仓库](http://mvnrepository.com/artifact/org.mybatis.generator/mybatis-generator-core)

可以把该包放在任何位置，但是要在配置文件中更改引用的相对位置。本例中jar包在`libs/mybatis-generator-core-x.y.z.jar`

## 配置文件generatorConfig.xml

配置文件也可以放在任何地方，但是便于使用就放在了`/src/main/resources/config/generatorConfig.xml`，配置文件的内容在[这里](generatorConfig.xml)。

*配置文件的核心在最底部的table标签*，当然`javaModelGenerator` `sqlMapGenerator` `javaClientGenerator`的生成位置也需要手动配置。

## 运行MyBatisGenerator

我选择在项目的根目录下运行命令行，根据上述位置调整相对路径如下

```shell
java -jar libs/mybatis-generator-core-1.3.5.jar -configfile src/main/resources/config/generatorConfig.xml
```

如果在Windows中自然要改成如下目录

```shell
java -jar libs\\mybatis-generator-core-1.3.5.jar -configfile src\\main\\resources\\config\\generatorConfig.xml
```
