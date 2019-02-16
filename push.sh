#!/bin/bash

TAG_DATE=${TAG_DATE:-$(date +'%Y.%m')}

docker login

docker tag  vlsida/openram-ubuntu:${TAG_DATE} vlsida/openram-ubuntu:latest

docker push vlsida/openram-ubuntu:latest

