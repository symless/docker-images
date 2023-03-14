FROM debian:sid

# Update base packages
RUN export DEBIAN_FRONTEND=noninteractive \
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
    libgdk-pixbuf2.0-dev \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libnotify-dev \
    libssl-dev \
    libx11-dev \
    libxkbfile-dev \
    libxtst-dev \
    qtbase5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    zip \
 && rm -rf /var/lib/apt/lists
