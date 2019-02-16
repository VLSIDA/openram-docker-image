#!/bin/bash

TAG_DATE=${TAG_DATE:-$(date +'%Y.%m')}

# --squash is an experimental feature and is not avaiable on some docker installs,
# so remove it if it isn't supported. May result in larger image.
docker build -t vlsida/openram-ubuntu:${TAG_DATE} -f openram-ubuntu/Dockerfile ./openram-ubuntu | tee -i openram-ubuntu.log
#docker build --squash -t vlsida/openram-ubuntu:${TAG_DATE} -f openram-ubuntu/Dockerfile ./openram-ubuntu | tee -i openram-ubuntu.log

docker tag  vlsida/openram-ubuntu:${TAG_DATE} vlsida/openram-ubuntu:latest

