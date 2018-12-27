# demo-in-docker
macosx 编译linux可执行文件,
使用iron/base 基础镜像,体积仅4.7MB
使用dockerfile制作镜像, 加上可执行文件7M左右, 仅12M左右
docker-compose拉起服务, 
直接 bash  build.sh

# use demo当前目录下
- ```bash build.sh```

 - ```http://localhost:8080/``` 访问测试http服务器
