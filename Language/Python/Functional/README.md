```python
# 读入两个numpy array，分别为N和M行
a, b = map(lambda x: np.array([raw_input().strip().split() for i in xrange(int(x))], int), [N, M])
```