# Installs git 2.20

FROM debian:stretch

RUN sed -i 's/ stretch / buster /g' /etc/apt/sources.list
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y && apt-get install -y \
    software-properties-common \
    cmake \
    qtbase5-dev \
    build-essential \
    libx11-dev \
    libxtst-dev \
    libgl1-mesa-dev \
    libssl-dev \
    libavahi-compat-libdnssd-dev \
    debhelper \
    devscripts \
    qttools5-dev \
    qttools5-dev-tools \
    qt5-default \
    libnotify-dev \
    libglib2.0-dev \
    libgdk-pixbuf2.0-dev \
    libc6/buster \
    libc6-dev/buster \
    libc-dev-bin/buster \
    zip \
    && rm -rf /var/lib/apt/lists

RUN apt-get install -y git