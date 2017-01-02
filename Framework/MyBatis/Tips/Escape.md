# XML转义问题

如下配置文件不能用

```xml
  <select id="queryByRank" resultMap="BaseResultMap">
    select * from example WHERE score < (SELECT score FROM example ORDER BY score DESC limit #{0},1 ) order by score desc limit 0,#{1};
  </select>
```

因为`<`在xml文件中是敏感的，所以用转义字符把>和<替换掉就好

```xml
  <select id="queryByRank" resultMap="BaseResultMap">
    select * from example WHERE score &lt; (SELECT score FROM example ORDER BY score DESC limit #{0},1 ) order by score desc limit 0,#{1};
  </select>
```

XML转义字符表如下

<table>
    <tr><th>转义字符</th><th>原符号</th></tr>
    <tr><td>&lt;  </td><<td></td></tr>
    <tr><td>&gt;  </td>><td></td></tr>
    <tr><td>&amp; </td>&<td></td></tr>
    <tr><td>&apos;</td>’<td></td></tr>
    <tr><td>&quot;</td>"<td></td></tr>
</table>

