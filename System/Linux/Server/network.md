# 网络管理

1.解决端口占用

`
sudo lsof -ntP -i:8080|sudo xargs kill -9
`