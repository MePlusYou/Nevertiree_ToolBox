##需求背景

目前主流的博客系统、CMS都会有一个TAG标签系统，不仅可以让内容链接的结构化增强，而且可以让文章根据Tag来区分。相比传统老式的Keyword模式，这种Tag模式可以单独的设计一个Map的映射表来增加系统的负载和查询的效率。

数据库设计方案1
此方案分为2个表：
1.Tag表
2.文章表

Tag表表结构：

tagid # tag标签的ID
tagname #tag内容
num #当前Tag的引用个数

文章表结构：

ID #文章ID
title #文章标题
tags #tags列表，多个以,分割
tagid #tags的ID 多个以,分割
...

此种方式Tag标签主要内容保存在 文章表 中，对于Tag表的压力较小，只是添加的时候更新一下Tag的引用数量，但是查询的时候效率不足，不是好办法

数据库设计方案2

第二种方案使用2个Tag表，其中一个保存Tag信息，另一个保存映射信息：

Tag表：

tagid # tag标签的ID
tagname #tag内容
num #当前Tag的引用个数

Tagmap表

tagid
aid

文章表

ID #文章ID
title #文章标题
tags #tags列表，多个以,分割
...
这种形式，每次发布内容和修改内容的时候 都去更新一下Tag表和 Tagmap表。
查询的时候需要从Tagmap表中查找响应的文章ID，然后使用文章ID去查询具体的文章信息，因为每次查询都是使用索引，所以效率较高。

数据库设计方案3

前两种方案都是使用纯粹的Mysql来设计的，第三种方案将使用Nosql的魅力来设计。
基本结构同方案2，只是在Tag表和Tagmap表中使用mongo/redis这样的nosql数据库服务器，这样可以发挥nosql数据库强大的线性查询能力。


