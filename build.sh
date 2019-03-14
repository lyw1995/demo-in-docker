#!/bin/bash

#当前时间
current_time=` date +"%Y%m%d%H%M%S"`

# 删除上一次的 可执行文件
rm demo-linux-amd64-* >& /dev/null

# 编译linux可执行文件, 进行制作镜像
export GOOS=linux
go build -ldflags="-s -w" -o demo-linux-amd64-${current_time}
export GOOS=darwin

# Dockerfile生成
echo "FROM iron/base" > Dockerfile
echo "MAINTAINER Track \"24245@163.com\"" >> Dockerfile
echo "LABEL build_time=\"$current_time\"" >> Dockerfile
echo "EXPOSE 8080" >> Dockerfile
echo "ADD  demo-linux-amd64-$current_time /" >> Dockerfile
echo "ENTRYPOINT [\"./demo-linux-amd64-$current_time\"]" >> Dockerfile

# build image , 之前的用脚本删除之类的..
docker build -t demo:latest .

# docker-compose 重新拉起
docker-compose up -d