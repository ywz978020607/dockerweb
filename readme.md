# dockerweb
## 创建初衷
兼容win/mac/linux的多种docker编排环境，方便web前后端开发基本环境搭建及部署、迁移。不需要特殊化安装各个软件，考虑不同平台的差异性，在win平台也可以预先安装docker-for-windows后使用本项目。

## 使用说明
本目录下创建datadir文件夹以及datadir/mysql、datadir/redis空文件夹，分别对应自动挂载mysql和redis，实现宿主机直接持久化  
为了方便git管理，已将这两个文件夹通过.gitignore忽略，配置前创建好空文件夹即可  

```
docker-compose build

docker-compose up
docker-compose up -d
# 其他见env.sh

#打包等命令参考
docker commit [container_name] [image_name]
docker save -o [file_name] [image_name]
docker load -i [file_name]
```


