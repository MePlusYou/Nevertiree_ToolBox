## Git First Using

1.创建密钥

检查本机的ssh密钥,如果提示：No such file or directory 说明你是第一次使用git。
```shell
cd ~/. ssh 
```

如果不是第一次使用,清理原有ssh密钥。

```shell
mkdir key_backup
cp id_rsa* key_backup
rm id_rsa*
```
生成新的密钥：

```shell
ssh-keygen –t rsa –C “myself@email.com” 
```
 
注意: 此处的邮箱地址，你可以输入自己的邮箱地址。在回车中会提示你输入一个密码，这个密码会在你提交项目时使用，如果为空的话提交项目时则不用输入。这个设置是防止别人往你的项目里提交内容。

输入一下代码，查看刚才生成的密钥。

```shell
cat ~/.ssh/id_rsa.pub
```

2.进入github

在Account Settings SSH Public keys add another public keys

把你本地生成的密钥复制到里面（key文本框中）

3.设置用户信息

在github中找刚刚生成的Fingerprint。

```shell 
git config --global user.name "nevertiree"//给自己起个用户名
git config --global user.email "nevertiree@126.com"//填写自己的邮箱
git config --global github.user nevertiree      //github 上的用户名
git config --global github.token e97279836f0d415a3954c1193dba522f


##Git强制提交覆盖

```shell
git reflog expire --expire=now --all
git gc --prune=now
git push --all --force
git push --all --tags --force
```

[Git清除历史纪录](https://segmentfault.com/q/1010000004996998)