# 批量操作

## 1.查找批量信息

有时我们可能会用List<Example>返回很多值，这时需要在xml中配置。

如果需要用正则表达式匹配关键字，则在`ExampleMapper.xml`中添加，输入一个Regex值就可以了。如果有多个值，`parameterType`可以不写。

```xml
  <select id="queryRegex" parameterType="String" resultMap="BaseResultMap">
    select * from tablename where name regexp #{name,jdbcType=CHAR};
  </select>
```

如果我们需要输入一串关键字，然后查询相同数目的返回值，则要写为：

```xml
    <!--输入ID的List，批量查询-->
    <select id="queryBatch" parameterType="java.util.List" resultMap="BaseResultMap">
        SELECT * FROM tablename
        <where>
            no IN
            <foreach item="no" collection="list" separator="," open="(" close=")" index="">
                #{no,jdbcType=CHAR}
            </foreach>
        </where>
    </select>
```

然后在``ExampleMapper.java``中使用与该`id`同名的方法

```java
    List<Example> queryRegex(String name);
    List<Example> queryBatch(List<String> no);
```