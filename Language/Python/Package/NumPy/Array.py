import numpy

# numpy.array()
# 从控制台得到数据并切分成浮点numpy数组，输出倒叙排列。
print numpy.array(raw_input().split(),float)[::-1]
# 从控制台输入N行数据组成numpy array
print numpy.array([raw_input().split(" ") for _ in range(n)],int)

# numpy.reshape()
# 从控制台输入123456789然后输出3*3矩阵
print numpy.reshape(numpy.array((raw_input().split(" ")),int),(3,3))

# numpy.transpose()
print array.transpose()

# numpy.flatten()
print array.flatten()

# numpy.concatenate
# 在axis方向拼接两个numpy array
print np.concatenate((a, b), axis = 0)

# numpy.ones & numpy.zeros
#Default type is float
print numpy.zeros((1,2))
#Output : [[ 0.  0.]]
print numpy.zeros((1,2), dtype = numpy.int)
#Output : [[0 0]]

#Default type is float
print numpy.ones((1,2))
#Output : [[ 1.  1.]]
print numpy.ones((1,2), dtype = numpy.int)
#Output : [[1 1]]

# numpy.identity
print numpy.identity(3)

# numpy.eye
# 返回对角阵
# A positive k is for the upper diagonal
# a negative k is for the lower
# a 0 k (default) is for the main diagonal

# 8 X 7 Dimensional array with first upper diagonal 1.
print numpy.eye(8, 7, k = 1)

#Output
# [[ 0.  1.  0.  0.  0.  0.  0.]
#  [ 0.  0.  1.  0.  0.  0.  0.]
#  [ 0.  0.  0.  1.  0.  0.  0.]
#  [ 0.  0.  0.  0.  1.  0.  0.]
#  [ 0.  0.  0.  0.  0.  1.  0.]
#  [ 0.  0.  0.  0.  0.  0.  1.]
#  [ 0.  0.  0.  0.  0.  0.  0.]
#  [ 0.  0.  0.  0.  0.  0.  0.]]
