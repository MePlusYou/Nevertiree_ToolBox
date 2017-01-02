# MyBatis使用

本项目的套路是`Gradle+Spring+SpringMVC+MyBatis+MySQL`

## MyBatisGenerator

如果本项目需要范围MySQL的example表，则使用[MyBatisGenerator](MyBatisGenerator.md)可以自动生成三个文件：`example.java` `exampleMapper.java`和`exampleMapper.xml`

## MyBatis构建

构建用Gradle完成，在dependencies中加入以下内容

```gradle
dependencies {
    // MyBatis的jar包 https://mvnrepository.com/artifact/org.mybatis/mybatis
    compile group: 'org.mybatis', name: 'mybatis', version: '3.4.1'

    // MySQL驱动的jar包 https://mvnrepository.com/artifact/mysql/mysql-connector-java
    compile group: 'mysql', name: 'mysql-connector-java', version: '6.0.5'

    // MyBatis和Spring配合的jar包 https://mvnrepository.com/artifact/org.mybatis/mybatis-spring
    compile group: 'org.mybatis', name: 'mybatis-spring', version: '1.3.0'
 }
```

具体的版本号见还要根据上述网址调整。

## MyBatis配置

由example表自动生成三个文件：`exampleMapper.java` `example.java`和`exampleMapper.xml`默认分别放在`com.groupId.business.dao` `com/groupId/domain/*.java``com/groupId/domain/*.xml`。

当然也可以可以手动修改位置。

按照上述内容， 在`/src/main/resources/config/appContext-common.xml`中配置MyBatis

```xml
    <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
        <property name="url" value="jdbc:mysql://localhost:3306/example"></property>
        <property name="username" value="username"></property>
        <property name="password" value="password"></property>
    </bean>

    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource" />
    </bean>

    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource" />
        <property name="typeAliasesPackage" value="com.groupId.domain" />
        <property name="mapperLocations" value="classpath*:com/groupId/domain/*.xml" />
    </bean>

    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com.groupId.business.dao" />
    </bean>
```

详见[`appContext-common.xml`](appContext-common.xml)

## MyBatis使用小技巧

可以简答理解`Example.java`成一个VO类，`ExampleMapper.xml` `ExampleMapper.java`配合进行数据读取。

1. [返回List<Object>](Tips/ListReturn.md)

2. [输入多个参数](Tips/MultiParameter.md)

3. [转义问题](Tip/Escape.md)