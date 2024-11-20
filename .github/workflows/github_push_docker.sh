#!/bin/bash

# 定义环境变量
ALIYUN_REGISTRY_USER="${ALIYUN_REGISTRY_USER}"
ALIYUN_REGISTRY_PASSWORD="${ALIYUN_REGISTRY_PASSWORD}"
ALIYUN_REGISTRY="${ALIYUN_REGISTRY}"
IMAGES="gitlab/gitlab-ce:latest"

# 登录到阿里云容器镜像服务
docker login -u $ALIYUN_REGISTRY_USER -p $ALIYUN_REGISTRY_PASSWORD $ALIYUN_REGISTRY

# 拉取 GitLab CE 镜像
docker pull $IMAGES


# 为镜像打标签，准备推送到阿里云仓库
docker tag $IMAGES "$ALIYUN_REGISTRY/docker-imges-c/gitlab-ce:v1"

# 推送镜像到阿里云仓库
docker push "$ALIYUN_REGISTRY/docker-imges-c/gitlab-ce:v1"
