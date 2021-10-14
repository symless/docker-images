FROM ubuntu:21.04

ARG DEBIAN_FRONTEND=noninteractive
ENV VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg

# Setup pakcages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    # Synergy requirements
    cmake libxtst-dev libglib2.0-dev libgdk-pixbuf2.0-dev libnotify-dev \
    # Install common build dependencies
    at curl unzip tar libxt-dev gperf libxaw7-dev cifs-utils build-essential \
    g++ gfortran zip libx11-dev libxkbcommon-x11-dev libxi-dev libgl1-mesa-dev \
    libglu1-mesa-dev mesa-common-dev libxinerama-dev flex libxcursor-dev yasm \
    libnuma1 libnuma-dev python3-six python3-six python3-yaml libbison-dev \
    autoconf libudev-dev libncurses5-dev libtool libxrandr-dev xutils-dev \
    dh-autoreconf libgles2-mesa-dev ruby-full pkg-config git \
    # Additionally required by qt5-base
    libxext-dev libxfixes-dev libxrender-dev libxcb1-dev libx11-xcb-dev \
    libxcb-glx0-dev \
    # Additionally required by qt5-base for qt5-x11extras
    libxkbcommon-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev \
    libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-shape0-dev \
    libxcb-randr0-dev libxcb-render-util0-dev libxcb-xinerama0-dev \
    libxcb-xkb-dev libxcb-xinput-dev '^libxcb.*-dev' \
    && rm -rf /var/lib/apt/lists

# Setup vcpkg
RUN git clone --depth=1 https://github.com/Microsoft/vcpkg $VCPKG_INSTALLATION_ROOT \
    && $VCPKG_INSTALLATION_ROOT/bootstrap-vcpkg.sh \
    && $VCPKG_INSTALLATION_ROOT/vcpkg integrate install \
    && chmod 0777 -R $VCPKG_INSTALLATION_ROOT \
    && ln -sf $VCPKG_INSTALLATION_ROOT/vcpkg /usr/local/bin

# Setup vcpkg packages
RUN vcpkg install --clean-after-build openssl qt5-base
