# 输入多个参数

在唯一参数时，xml可以写成

```xml
  <select id="queryAll" parameterType="String" resultMap="BaseResultMap">
    select * from example where name regexp #{name,jdbcType=CHAR};
  </select>
```

如果要输入多参数那么就不能使用`parameterType`，例如在下面这个SQL中

```xml
  <select id="queryAll" resultMap="BaseResultMap">
    select * from example WHERE name = #{0} and id = #{1};
  </select>
```

全部的参数要按顺序输入

```java

List<Example> queryAll(String name,String id);

```
