# 简介

在`ubuntu:20.04`的基础上，安装桌面环境，支持SSH和VNC远程连接

我用来**学习练手**的，参考这个[**项目**](https://github.com/gotoeasy/docker-ubuntu-desktop)，第一次写dockerfile，哈哈哈<br>

感谢 [gotoeasy](https://github.com/gotoeasy/docker-ubuntu-desktop) 大佬

[![Docker Pulls](https://img.shields.io/docker/pulls/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/ericju/ubuntu-desktop)
[![GitHub release](https://img.shields.io/github/release/gotoeasy/docker-ubuntu-desktop.svg)](https://github.com/Eric-is-good/docker-ubuntu-desktop)

![](https://github.com/Eric-is-good/docker-ubuntu-desktop/blob/main/pics/1.jpg)



## **容器启动命令**

```shell
# 以后台方式运行容器，指定SSH和VNC端口，默认用户root，密码为123456
docker run -itd --privileged -p 22:22 -p 5901:5901 ericju/ubuntu-desktop:0.9

# 可以指定密码(必须6位以上)及分辨率（分辨率中间是字母x，不是乘号）
# vnc 和 ssh 密码为同一个
docker run -itd --privileged -p 22:22 -p 5901:5901 -e PASSWD=abcd1234 -e SIZE=1024x768 ericju/ubuntu-desktop:0.9

# 完整命令（暴露所有端口）
docker run -itd --privileged -p 22:22 -p 5900:5900 -p 5901:5901 -p 6000:6000 -p 6001:6001 -p 6002:6002 -p 6003:6003 -p 6004:6004 -p 6005:6005 -p 6006:6006 -p 6007:6007 -p 6008:6008 -p 6009:6009 -e PASSWD=abcd1234 -e SIZE=1024x768 ericju/ubuntu-desktop:0.9
```



## 容器使用前必须初始化

进入容器（docker attach [id]），运行 

```shell
./startup.sh
```

![](https://github.com/Eric-is-good/docker-ubuntu-desktop/blob/main/pics/0.jpg)

然后就可以使用ssh，xftp 和 VNC可视化桌面了。

其中，VNC 连接地址为 ip:5901



获取 [VNC viewer](https://www.realvnc.com/en/connect/download/viewer/)