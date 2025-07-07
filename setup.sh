#!/bin/sh

apk update
apk add --no-cache git docker docker-cli containerd

service docker start

rc-update add docker boot

mkdir -p /root/home/reporter
cd /root/home/reporter

if [ ! -d "alpine-infra-reporter" ]; then
  git clone https://github.com/rideg1337/alpine-infra-reporter.git
fi

cd alpine-infra-reporter

DOCKER_BUILDKIT=0 docker build -t reporter .

docker run -d -p 5055:5055 reporter

