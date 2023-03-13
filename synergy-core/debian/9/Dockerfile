FROM debian:9

# Update sources to buster 
RUN export DEBIAN_FRONTEND=noninteractive && \
    sed -i 's/ stretch / buster /g' /etc/apt/sources.list && \
    # Update base packages
    apt-get update && \
    apt-get upgrade -y && \
    # Install Synergy core build dependencies
    apt-get install -y \
    software-properties-common \
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
    libnotify-dev \
    libglib2.0-dev \
    libgdk-pixbuf2.0-dev \
    libxkbfile-dev \
    libc6/buster \
    libc6-dev/buster \
    libc-dev-bin/buster \
    zip \
    && rm -rf /var/lib/apt/lists
