# !/usr/bin/env python
# -*- coding: utf-8 -*-1

from BaseInfo import *
import numpy as np
import matplotlib.pyplot as plt

# 数据统计表

# 每次维修花费
single_count = []

# 总花费
total_count = []

# 当前时间
current_time = 0

# 3个原件的初始使用时间
widget_life = [1400, 1500, 1100]
widget_status = [0, 0, 0]

while current_time < 20000*60:
# 3个原件的目前使用状态：0代表完好，1代表需要维修

    ########
    # 修复  #
    ########
    num = sum(widget_status)
    if num != 0:
        num = 3
        # 获得明细=元件成本+维修人员延迟成本+机器维修停机成本+维修人员工资
        widget_cost, delay_cost, shutdown_cost, salary_cost = get_detail_cost(num,price,loss,repairman_salary)
        # 计算损失=元件成本+维修人员延迟成本+机器维修停机成本+维修人员工资
        single_detail = [widget_cost, delay_cost, shutdown_cost, salary_cost]
        cost = sum(single_detail)

        # 更新时间和状态
        for i in range(len(widget_status)):
                widget_life[i] = 0
                widget_status[i] = 0

    ########
    # 运行 #
    ########

    # 计算元件未来损坏时间
    damage_time = predict_damage(widget_life)
    # 增加寿命
    for i in range(len(widget_life)):
        widget_life[i] += min(damage_time)
    # 改变元件状态
    widget_status = predict_status(damage_time)
    # 计算下一个关系节点
    current_time += min(damage_time)

    ##############
    # 数据统计模块 #
    ##############

    # 总花费
    total_cost += cost
    # 总元件成本
    total_widget_cost += widget_cost
    # 总维修人员延迟成本
    total_delay_cost += delay_cost
    # 总机器维修停机成本
    total_shutdown_cost += shutdown_cost
    # 总维修人员工资
    total_salary_cost += salary_cost

    single_count.append((current_time, widget_cost, delay_cost, shutdown_cost, salary_cost, cost))
    total_count.append((current_time, total_widget_cost, total_delay_cost, total_shutdown_cost, total_salary_cost, total_cost))


single_count = np.array(single_count)
total_count = np.array(total_count)


def show_single():
    fig, ax = plt.subplots()

    plt.xlabel('machine running time (hour)')
    plt.ylabel('machine running cost (dollar)')

    # """set min and max value for axes"""
    # ax.set_ylim([0, 2000])
    # ax.set_xlim([0, 20000])

    plt.plot(single_count[:,0].tolist(),single_count[:,1],".-",label="widget cost")
    plt.plot(single_count[:,0].tolist(),single_count[:,2],"x-",label="delay cost")
    plt.plot(single_count[:,0].tolist(),single_count[:,3],"+-",label="shutdown cost")
    plt.plot(single_count[:,0].tolist(),single_count[:,4],"*-",label="salary cost")
    plt.plot(single_count[:,0].tolist(),single_count[:,5],"^-",label="total cost")

    plt.grid(True)

    plt.legend(bbox_to_anchor=(1.0, 1), loc=1, borderaxespad=0.)

    plt.show()


def show_total():
    fig, ax = plt.subplots()

    plt.xlabel('machine running time (hour)')
    plt.ylabel('machine running cost (dollar)')

    # """set min and max value for axes"""
    # ax.set_ylim([0, 40000])
    # ax.set_xlim([0, 20000])

    plt.plot(total_count[:, 0].tolist(), total_count[:, 1], ".-", label="widget cost")
    plt.plot(total_count[:, 0].tolist(), total_count[:, 2], "x-", label="delay cost")
    plt.plot(total_count[:, 0].tolist(), total_count[:, 3], "+-", label="shutdown cost")
    plt.plot(total_count[:, 0].tolist(), total_count[:, 4], "*-", label="salary cost")
    plt.plot(total_count[:, 0].tolist(), total_count[:, 5], "^-", label="total cost")

    plt.grid(True)

    plt.legend(bbox_to_anchor=(1.0, 1), loc=1, borderaxespad=0.)

    plt.show()


print single_count

print total_count

show_single()

show_total()
