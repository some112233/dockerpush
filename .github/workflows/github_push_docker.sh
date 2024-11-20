#!/bin/bash

# 设置目标仓库为 Docker Hub
pull_registry="docker.io" # Docker Hub 的域名
push_registry="crpi-lssazn1jp8ho54qv.cn-guangzhou.personal.cr.aliyuncs.com/docker-imges-c" # 您的阿里云容器镜像服务地址

# 定义要拉取和推送的镜像列表
images=("gitlab/gitlab-ce:latest")

# 遍历镜像列表
for image in "${images[@]}"
do
    # 从 Docker Hub 拉取镜像
    docker pull "${pull_registry}/${image}"
    # 为镜像打标签，准备推送到阿里云仓库
    docker tag "${pull_registry}/${image}" "${push_registry}/${image%:*}"
    # 推送镜像到阿里云仓库
    docker push "${ALIYUN_REGISTRY}/docker-imges-c/gitlab/gitlab-ce:latest"
done
