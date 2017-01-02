# 返回List<Example>

在`ExampleMapper.xml`中添加

```xml
  <select id="queryAll" parameterType="String" resultMap="BaseResultMap">
    select * from example where name regexp #{name,jdbcType=CHAR};
  </select>
```

然后在``ExampleMapper.java``中使用与该`id`同名的方法

```java
    List<Example> queryAll(String name);
```