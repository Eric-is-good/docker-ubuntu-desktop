# 基础镜像
FROM ubuntu:20.04

# 我第一个dockerfile，代码到处抄的，哈哈哈

# 维护者信息
MAINTAINER eric <eric123456123456@163.com>

# 环境变量
ENV DEBIAN_FRONTEND=noninteractive \
    SIZE=1200x800 \
    PASSWD=123456 

USER root
WORKDIR /root

# 设定密码
RUN echo "root:$PASSWD" | chpasswd

# 安装 换源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup && \
    # sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    # sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get -y update && \
    # tools
    apt-get install -y vim nano git subversion wget curl net-tools locales bzip2 unzip iputils-ping traceroute firefox firefox-locale-zh-hans ttf-wqy-microhei gedit ibus-pinyin && \
    locale-gen en_US.UTF-8 
    # ssh
RUN apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh 
    # TigerVNC
RUN apt-get install -y tightvncserver && \
    mkdir -p /root/.vnc && \
    echo $PASSWD | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd 
    # xfce
RUN apt-get install -y xfce4 xfce4-terminal && \
    apt-get purge -y pm-utils xscreensaver* && \
    # xrdp
    apt-get install -y xrdp && \
    echo "xfce4-session" > ~/.xsession && \
    # 谷歌浏览器
    # wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    # apt-get install -y -f ./google-chrome-stable_current_amd64.deb && \
    # sed -e '/chrome/ s/^#*/#/' -i /opt/google/chrome/google-chrome && \
    # echo 'exec -a "$0" "$HERE/chrome" "$@" --user-data-dir="$HOME/.config/chrome" --no-sandbox --disable-dev-shm-usage' >> /opt/google/chrome/google-chrome && \
    # rm -f google-chrome-stable_current_amd64.deb && \
    # mysql客户端
    # apt-get install -y mysql-workbench && \
    # clean
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 配置xfce图形界面
ADD ./xfce/ /root/

# 创建脚本文件
RUN echo "#!/bin/bash\n" > /root/startup.sh && \
    # 修改密码
    echo "apt-get -y update" > /root/startup.sh && \
    echo 'echo "root:$PASSWD" | chpasswd' >> /root/startup.sh && \
    echo 'echo $PASSWD | vncpasswd -f > /root/.vnc/passwd' >> /root/startup.sh && \
    # SSH
    echo "/usr/sbin/sshd -D & source /root/.bashrc" >> /root/startup.sh && \
    # VNC
    echo 'USER=root vncserver -geometry $SIZE :1' >> /root/startup.sh && \
    # 可执行脚本
    cp /root/startup.sh /etc/init.d/ && \
    chmod +x /etc/init.d/startup.sh && \
    chmod +x /root/startup.sh

# 导出特定端口
EXPOSE 22 5900 3389 6001 6002 6003 6004 6005 6006 6007 6008 6009


