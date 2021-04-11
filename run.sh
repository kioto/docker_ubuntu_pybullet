#!/bin/sh

docker run -it -d --name ubuntu_pybullet-1 -p 8889:8888 \
       --net host \
       -v $PWD/work:/home/devuser/share ubuntu_pybullet
