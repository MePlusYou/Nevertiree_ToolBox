# Basic Function

# 条件if

## 三元运算符

```python
# 判断奇数
def isOdd(n):
    return True if (n&1)!=0 else False
```

## 多重条件

```python
if (n>=2) and (n<=5) and not isOdd(n):
    print "Not Weird"
```

# 数学运算

## 除法

```python
# 整除
int_division = a // b
# 浮点除法（默认）
float_division = a / b
```

## 幂次

```python
# 平方
i**2
```

## 余数

```python
def is_leap(year):
    # Write your logic here
    if (year % 4 != 0):
        return False

    if (year % 400 == 0):
        return True

    if (year % 100 == 0):
        return False

    return True
```

