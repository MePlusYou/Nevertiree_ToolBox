# Shadowsocks

##安装

Linux不同的发行版执行的命令如下：

Debian / Ubuntu:
```shell
apt-get install python-pip
pip install shadowsocks
```

CentOS:
```shell
yum install python-setuptools && easy_install pip
pip install shadowsocks
```

## 配置

```shell
sudo vim /etc/shadowsocks.json
```

这里的json文件是自己创建的，不是系统自带

配置文件的内容大致如下：

```json
{
    "server":"服务器的ip",
    "server_port":19175,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"密码",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open":false
}
```

## 启动Shadowsocks客户端

用`sslocal -help`查看帮助，用以下命令启动代理

```shell
sslocal -c /etc/shadowsocks.json
```

## 编写后台运行脚本

在`/home`下新建`shadow.sh`写上启动ss客户端需要的命令

```bash
#！/bin/bash
#shadow.sh
sslocal -c /etc/shadowsocks.json
```

终端执行命令,如果成功的话会有信息输出的。

```shell
sh /home/shadow.sh
```

这个时候关了终端还是会掉的，设置程序在后台运行

```shell
nohup sh /home/shadow.sh &。
```

## 加入Ubuntu开机运行

在`/etc`下用root权限编辑一个叫rc.local的文件

```shell
vim /etc/rc.local
```

在文件中输入以下命令并保存
```shell
nohup bash /home/shadow.sh>/home/d.txt &
```

这个时候你可以reboot重启了，
测试下看看能不能后台自动运行，
重启你可以先去看下我们要他输出d.txt，
你竟然发现是 /home/shadow.sh line 3 :sslocal: command not found,

需要添加路径，sslocal和ssserver这两个命令存在 /usr/local/bin下面的，

直接把这两个文件移动到/bin下，就可以了。