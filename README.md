# 简介

在`ubuntu:20.04`的基础上，安装桌面环境，支持SSH和VNC远程连接

我用来**学习练手**的，参考这个[**项目**](https://github.com/gotoeasy/docker-ubuntu-desktop)，第一次写dockerfile，哈哈哈<br>

感谢 [gotoeasy](https://github.com/gotoeasy/docker-ubuntu-desktop) 大佬

[![Docker Pulls](https://img.shields.io/docker/pulls/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/ericju/ubuntu-desktop)
[![GitHub release](https://img.shields.io/github/release/gotoeasy/docker-ubuntu-desktop.svg)](https://github.com/Eric-is-good/docker-ubuntu-desktop)

![](https://github.com/Eric-is-good/docker-ubuntu-desktop/blob/main/pics/1.png)



## **容器启动命令**

```shell
# 以后台方式运行容器，指定SSH和VNC端口，默认密码为123456
docker run -d -p 22:22 -p 5900:5900 ericju/ubuntu-desktop:1.1

# 可以指定密码(必须6位以上)及分辨率
docker run -d -p 5900:5900 -e PASSWD=abcd1234 -e SIZE=1024x768 ericju/ubuntu-desktop:1.1

# 用docker-compose方式启动，参考配置docker-compose.yml
docker-compose up
```


然后就可以使用ssh，xftp 和 VNC可视化桌面了。

其中，VNC 连接地址为 ip:5900



获取 [VNC viewer](https://www.realvnc.com/en/connect/download/viewer/)
