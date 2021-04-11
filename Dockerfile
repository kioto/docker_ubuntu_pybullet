FROM ubuntu:20.04
MAINTAINER developer


ENV PYTHON_PKG python3.8
ENV USER devuser
ENV HOME /home/${USER}
ENV SHELL /bin/bash

# update packages
RUN set -x && \
	apt update && \
	apt upgrade -y

# install command
RUN set -x && \
	apt install -y wget sudo git vim x11-apps iputils-ping net-tools && \
	apt install -y mesa-utils && \
	apt install -y ${PYTHON_PKG} python3-pip

# symbolic link python
RUN set -x && \
	ln -s /usr/bin/python3.8 /usr/bin/python && \
	ln -s /usr/bin/pip3 /usr/bin/pip

# add user
RUN set -x && \
	useradd --create-home --user-group --shell /bin/bash -m ${USER} && \
	gpasswd -a ${USER} sudo && \
	echo "${USER}:password" | chpasswd

# ここから作業ユーザで実行
USER ${USER}
WORKDIR ${HOME}

RUN set -x && \
	pip install pybullet

# make share directory
RUN set -x && \
	mkdir -p /home/${USER}/share
