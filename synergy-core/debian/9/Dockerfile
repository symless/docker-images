FROM debian:stretch

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade && apt-get install -y \
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
    qt5-default \
    && rm -rf /var/lib/apt/lists
