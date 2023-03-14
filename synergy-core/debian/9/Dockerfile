FROM debian:9

# Update sources to buster 
RUN export DEBIAN_FRONTEND=noninteractive \
 && sed -i 's/ stretch / buster /g' /etc/apt/sources.list \
    # Update base packages
 && apt-get update \
 && apt-get upgrade -y \
    # Install Synergy core build dependencies
 && apt-get install -y \
    build-essential \
    cmake \
    debhelper \
    devscripts \
    git \
    libavahi-compat-libdnssd-dev \
    libc-dev-bin/buster \
    libc6-dev/buster \
    libc6/buster \
    libgdk-pixbuf2.0-dev \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libnotify-dev \
    libssl-dev \
    libx11-dev \
    libxkbfile-dev \
    libxtst-dev \
    qt5-default \
    qtbase5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    software-properties-common \
    zip \
 && rm -rf /var/lib/apt/lists
