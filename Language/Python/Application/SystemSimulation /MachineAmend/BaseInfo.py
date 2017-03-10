# !/usr/bin/env python
# -*- coding: utf-8 -*-1

# 机器由3个元件组成，其中一个元件损坏就导致整机不能运行
import random
import numpy as np

# 元件损坏的概率和使用时间有关，使用时间-损坏概率关系如下图
damage_pro =np.array([(1000*60, 0.10),
                      (1100*60, 0.23),
                      (1200*60, 0.48),
                      (1300*60, 0.61),
                      (1400*60, 0.70),
                      (1500*60, 0.82),
                      (1600*60, 0.84),
                      (1700*60, 0.90),
                      (1800*60, 0.95),
                      (1900*60, 1.00)
])


# 维修人员到达的延迟时间-概率关系如下表
delay_pro = np.array([(05, 0.6),
                      (10, 0.9),
                      (15, 10),
                      ])

# 更换新元件的数量-时间关系如下表
replace_time = np.array([(1, 20),
                         (2, 30),
                         (3, 40)])

# 维修人员现场每分钟工资
repairman_salary = 30

# 机器停止每分钟损失
loss = 10

# 新元件价格
price = 32

# 总花费
total_cost = 0
# 总元件成本
total_widget_cost = 0
# 总维修人员延迟成本
total_delay_cost = 0
# 总机器维修停机成本
total_shutdown_cost = 0
# 总维修人员工资
total_salary_cost = 0

# 花费
cost = 0
# 元件成本
widget_cost = 0
# 维修人员延迟成本
delay_cost = 0
# 机器维修停机成本
shutdown_cost = 0
# 维修人员工资
salary_cost = 0


# 计算某元件距离损坏的时长
def predict_damage(current_life):
    damage_time_list = []
    # 对全部元件做模拟
    for n in range(len(current_life)):
        # 随机生成损坏概率
        pro = random.uniform(0, 1)
        for i in range(10):
            if pro < damage_pro[i][1]:
                # 添加(损坏寿命与当前寿命之差)至队列
                damage_time = max(int(damage_pro[i][0]-current_life[n]), 0)
                damage_time_list.append(damage_time)
                break

    return damage_time_list


# 未来元件状态变化 0->1
def predict_status(damage_time_list):
    # 把最先报废的元件标记上1
    widget_status_list = [0, 0, 0]
    first_damage = (min(damage_time_list))
    for n in range(len(damage_time_list)):
        # 把马上报废的元件标记上1
        if damage_time_list[n] == first_damage:
            widget_status_list[n] = 1

    return widget_status_list


# 计算元件成本
def get_widget_cost(widget_num, widget_price):
    return widget_num * widget_price


# 预计工人迟到造成的费用
def get_delay_cost(machine_loss):
    # 随机生成迟到概率
    pro = random.uniform(0, 1)
    for i in range(3):
        if pro < delay_pro[i][1]:
            # 返回工人迟到时间*机器的每分钟耽误损失
            return delay_pro[i][0] * machine_loss


# 计算机器维修停机成本
def get_shutdown_cost(widget_num, machine_loss):
    repair_time = 0
    for i in range(widget_num):
        if widget_num == i+1:
            repair_time = replace_time[i][1]
            break
    return repair_time * machine_loss


# 计算工人的维修工资
def get_salary_cost(widget_num,staff_salary):

    repair_time = 0
    for i in range(3):
        if widget_num == i+1:
            repair_time = replace_time[i][1]
            break

    # 计算工人的维修工资
    return repair_time * staff_salary


# 成本汇总输出
def get_detail_cost(num,widget_price,machine_loss,staff_salary):
    widget = get_widget_cost(num, widget_price)
    delay = get_delay_cost(machine_loss)
    shutdown = get_shutdown_cost(num, machine_loss)
    salary = get_salary_cost(num, staff_salary)

    return widget, delay, shutdown, salary
