#!/bin/bash

pull_registry="gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd" # 目标仓库
push_registry="你的云/你的仓库" # 例子：swr.cn-south-1.myhuaweicloud.com/myrepo
image1="controller:v0.56.0@sha256:fc5669e1bbabbf24b0ee4591ff20793643d778942e91ae52b3f7cca26d81a99b"
image2="nop:v0.56.0@sha256:4e627be53f78f30f73084ea0695d97397930d6f12d4cfab28d97b1aa57842881"
images=($image1 $image2)

for i in "${!images[@]}"
do
    image=`echo ${images[$i]} | awk -F'@' '{print $1}'`
    docker pull ${pull_registry}/${image}
    docker tag ${pull_registry}/${image}  ${push_registry}/${image}
    docker images;
    docker push ${push_registry}/${image}
done
