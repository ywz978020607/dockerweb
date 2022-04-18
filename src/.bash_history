apt-get install tmux
sh /tmp/build.sh 
apt-get update
sh /tmp/build.sh 
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt clean
apt-get update -y
vim /tmp/build.sh 
apt install vim
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt clean
apt-get update -y
apt-get install vim
apt-get upgrade
apt-get install vim
apt-get install vim --fix-missing
vim
vim /tmp/build.sh 
sh /tmp/build.sh 
tmux a
ls
