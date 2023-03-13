FROM ubuntu:16.04

# Update base packages
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get upgrade -y \
    # Setup git repository
 && apt-get install software-properties-common -y \
 && apt-add-repository ppa:git-core/ppa \
 && apt-get update \
    # Install Synergy core build dependencies
 && apt-get install -y \
    git \
    curl \
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
    libnotify-dev \
    libglib2.0-dev \
    libgdk-pixbuf2.0-dev \
    libxkbfile-dev \
    zip \
    && rm -rf /var/lib/apt/lists \
    # Install cmake 3.17.2
 && curl -sL -o /tmp/cmake-install.sh \
    https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2-Linux-x86_64.sh \
 && chmod u+x /tmp/cmake-install.sh \
 && /tmp/cmake-install.sh --skip-license --prefix=/usr \
 && rm /tmp/cmake-install.sh
