# Vim

ubuntu如何把默认编辑器设定为vim

1.直接在终端输入：

```shell
echo export EDITOR=/usr/bin/vim >> ~/.bashrc
```

2.使用系统管理工具update-alternatives

在终端输入：

```shell
update-alternatives --config editor
```
选择vim.basic

3.完全删除nano

如果系统中只剩下nano和vim两个编辑器，完全删除nano，那么系统会默认选择vim为默认编辑器

```shell
sudo apt-get remove nano
```

4.修改完成

```shell
crontab -e
```