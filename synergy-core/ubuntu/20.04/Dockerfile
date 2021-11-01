FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
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
    zip \
    libnotify-dev \
    libglib2.0-dev \
    libgdk-pixbuf2.0-dev \
    libxkbfile-dev \
    && rm -rf /var/lib/apt/lists