## Problem 1

haskell自带last函数找到list的最后一个元素，现在实现这个last函数为myLast：

```haskell
Prelude> myLast [1,2,3,4]
4
Prelude> myLast ['x','y','z']
'z'
```

## Solution 1

1.递归取最后的元素

```haskell
myLast :: [a] -> a
myLast [] = error "No end for empty lists!"
myLast [_:xs] = myLast xs
```


2.先翻转再取第一个

```haskell
myLast :: [a] -> a
myLast [] = error "No end for empty lists!"
myLast [x] = take 1 $ reverse x
```

2.直接取最后一个

``