FROM centos:8.1.1911

ENV VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg

RUN yum -y update \
    && yum -y install dnf-plugins-core \
    && yum -y config-manager --set-enabled powertools \
    && yum -y install \
    epel-release git make python3 gcc-toolset-10-toolchain \
    # synergy requirements
    cmake glib2-devel gdk-pixbuf2-devel libnotify-devel libXtst-devel libxkbfile-devel \
    # vcpkg requirements
    curl zip unzip tar \
    # openssl requirements
    perl \
    # qt5-base requirements
    harfbuzz-devel at-spi2-atk-devel dbus-devel mesa-libGL-devel bison gperf \
    xcb-util xcb-util-devel xcb-util-*-devel libXrender-devel \
    libxkbcommon-devel libxkbcommon-x11-devel libXcursor-devel \
    libXcomposite-devel mesa-libGL-devel mesa-libGLU-devel \
    && rm -rf /var/cache/yum

ENV PATH=/opt/rh/gcc-toolset-10/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=/opt/rh/gcc-toolset-10/root/usr/lib64:/opt/rh/gcc-toolset-10/root/usr/lib:/opt/rh/gcc-toolset-10/root/usr/lib64/dyninst:/opt/rh/gcc-toolset-10/root/usr/lib/dyninst

# Setup vcpkg
RUN git clone --depth=1 https://github.com/Microsoft/vcpkg $VCPKG_INSTALLATION_ROOT \
    && $VCPKG_INSTALLATION_ROOT/bootstrap-vcpkg.sh \
    && $VCPKG_INSTALLATION_ROOT/vcpkg integrate install \
    && chmod 0777 -R $VCPKG_INSTALLATION_ROOT \
    && ln -sf $VCPKG_INSTALLATION_ROOT/vcpkg /usr/local/bin

# Setup vcpkg packages
RUN vcpkg install --clean-after-build openssl qt5-base
