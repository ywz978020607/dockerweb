#!/usr/bin/env bash
#换源
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt clean
apt-get update -y

apt-get install -y sudo ssh git gcc g++ make tmux vim net-tools --fix-missing
apt-get install -y libsm6 libxext6 libxrender-dev --fix-missing
# wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2021.11-Linux-x86_64.sh

apt-get install -y python3-pip

# pip3 install -r /tmp/requirements.txt

# -------------


# 设置环境变量
# echo '
# #MAVEN_HOME
# export MAVEN_HOME=/workshop/maven/apache-maven-3.3.9
# export MAVEN_OPTS="-Xms256m -Xmx512m"
# export PATH=${MAVEN_HOME}/bin:$PATH ' >> /root/.bashrc
# source /root/.bashrc
