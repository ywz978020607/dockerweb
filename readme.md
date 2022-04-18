# dockerweb
## 创建初衷
兼容win/mac/linux的web开发常用软件的docker编排环境(mysql+redis+nginx+ubuntu)，在ubuntu下自定义安装其他内联应用，如web后端框架django/flask/nodejs/spring等，方便web开发调试基本环境搭建及部署、迁移。不需要特殊化安装各个软件，充分考虑不同平台的差异性，在win平台也可以预先安装docker-for-windows后使用本项目，便于打包迁移。

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

## 效果
```
~$docker-compose up -d
[+] Running 5/5
 - Network dockerweb_default    Created                                                                                                  0.7s 
 - Container dockerweb-mysql-1  Started                                                                                                  4.5s
 - Container dockerweb-redis-1  Started                                                                                                  4.5s 
 - Container dockerweb-myweb-1  Started                                                                                                  6.0s
 - Container nginx_web          Started    

~$docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS         PORTS                               NAMES
4b36ef66d571   nginx:latest          "/docker-entrypoint.…"   10 seconds ago   Up 2 seconds   0.0.0.0:80->80/tcp                  nginx_web   
95f68af2cf33   myweb:latest          "bash"                   10 seconds ago   Up 3 seconds   0.0.0.0:8000->8000/tcp              dockerweb-myweb-1
db4d03596139   mysql:8.0.28-oracle   "docker-entrypoint.s…"   10 seconds ago   Up 5 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   dockerweb-mysql-1
214be9ba33f4   redis:7.0-rc3         "docker-entrypoint.s…"   10 seconds ago   Up 5 seconds   0.0.0.0:6379->6379/tcp              dockerweb-redis-1


~$docker exec -it 95f bash #进入myweb-ubuntu内，进行操作，如果有环境变动，记得commit提交至镜像
```


