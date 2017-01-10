#input

## 输入

```python
s = raw_input()
```

从控制台读入并转换成相应数据格式
```
s = int(raw_input())

s = map(raw_input(),int)
```

从控制台赋值多个数

```python
a,b = [int(x) for x in raw_input().strip().split()]
```

从控制台读入数组`1 2 3 4 5 6`

```python
s = raw_input().split(" ")
```