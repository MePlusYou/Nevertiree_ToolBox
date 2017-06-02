# #!/usr/bin/env python
# # -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib import axes
import numpy as np
from dataconnect import *
from scipy import exp


def get_user_change(item,uid):
    session = mysql_connect()
    result = session.query(getattr(Userchange, item)).filter(Userchange.uid == uid).order_by(Userchange.sid).all()

    if result:
        result = np.matrix(result)
        # 数据清洗
        x_list = np.nan_to_num(result[:, 0]).tolist()
        # 得到x和y的列
        x = []
        for i in range(len(x_list)):
            x.append(x_list[i][0])

    # for i in range(len(x)):
    #     x[i] = 1/(1+(1/(x[i]+1))*exp(-(x[i])))-1/2

    while len(x) % 7 != 0:
        x.append(0)
    length = len(x)
    x = np.array(np.fabs(x)).reshape((int(length / 7)),7)
    x = np.transpose(x)

    return x


def show_hot_pot(data, max_value,num,item):
    # 设定一个图像，背景为白色。
    fig = plt.figure(facecolor='w')

    # 注意位置坐标，数字表示的是坐标的比例
    ax1 = fig.add_subplot(2, 1, 1, position=[0.1, 0.15, 0.9, 0.8])

    # 注意标记旋转的角度
    # ax1.set_xticklabels(['','A','B','C','D','E','F','G'], range(8), rotation=-45 )
    # ax1.set_yticklabels(['','Sun','Mon','Tue','Wed','Thur','Fri','Sat'], range(8), rotation=-45 )

    # 可以有多种选择，这里我最终选择的是spectral，那个1000是热度标尺被分隔成多少块，数字越多，颜色区分越细致。
    cmap = cm.get_cmap('Greys', 1000)

    # 那个vmin和vmax是数据矩阵中的最大和最小值。这个范围要与数据的范围相协调。
    # 那个aspect参数，对确定图形在整个图中的位置和大小有关系。上面的add_subplot中的position参数的数值要想有作用，这里的这个参数一定要选auto。
    if max_value < 5:
        max_value = 5
    map = ax1.imshow(data, interpolation="nearest", cmap=cmap, aspect='auto', vmin=0, vmax=max_value)

    # shrink是标尺缩小的比例
    cb = plt.colorbar(mappable=map, cax=None, ax=None, shrink=0.5)
    cb.set_label('(%)')

    s = '第%d号用户%s属性的活跃热度' % (num,item)
    # 将要显示的中文编码为unicode字符
    s_unicode = s.decode('UTF-8')
    ax1.set_title(s_unicode)
    #显示中文标签
    plt.rcParams['font.sans-serif']=['SimHei']
    #显示正负号
    plt.rcParams['axes.unicode_minus']=False
    plt.show()


def show(num,item):

    result = get_user_change(item,num)
    show_hot_pot(result,np.mean(result),num,item)

show(50000,"ask")
show(50000,"answer")
show(50000,"followee")
show(50000,"post")
show(50000,"logs")