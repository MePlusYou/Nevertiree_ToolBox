SSH是Secure Shell Protocol的简称

1.Linux中SSHD的D代表Daemon守护进程

2.SSH的主要架构在22号port上

3.在本地客户端上用SSH远程登录服务器，最基本的语法是ssh user@example.com。如果没有指定用户名，SSH会默认用本地的用户名登录远程的用户名。如果远程没有和本地同名的user，登录就会失败。

4.ssh -f 命令可以让远程服务器做一件事，然后客户端立即登出。可以用于完成等待时间很长的任务，或者关闭远程服务器之类的事情。

5.ssh -o strictHostKeyChecking=no 可以自动在本地的~/.ssh/known_hosts中加上远程服务器的public_key记录，不需要输入yes。这个方法在写脚本的时候很好用。

6.在每次登录的时候，客户端用服务器发来的pub_key和~/.ssh/known_hosts中存在的的pub_key比较。验证成功以后登录。如果没有存在相应key就会询问是否添加。

7.
