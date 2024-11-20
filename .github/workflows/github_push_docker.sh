#!/bin/bash

# 定义环境变量
ALIYUN_REGISTRY_USER="${ALIYUN_REGISTRY_USER}"
ALIYUN_REGISTRY_PASSWORD="${ALIYUN_REGISTRY_PASSWORD}"
ALIYUN_REGISTRY="${ALIYUN_REGISTRY}"

# 登录到阿里云容器镜像服务
echo "$ALIYUN_REGISTRY_PASSWORD" | docker login -u "$ALIYUN_REGISTRY_USER" "$ALIYUN_REGISTRY" --password-stdin

# 拉取 GitLab CE 镜像
docker pull gitlab/gitlab-ce:latest

# 为镜像打标签，准备推送到阿里云仓库
docker tag gitlab/gitlab-ce:latest "$ALIYUN_REGISTRY/docker-imges-c/gitlab-ce:latest"

# 推送镜像到阿里云仓库
docker push "$ALIYUN_REGISTRY/docker-imges-c/gitlab-ce:latest"
