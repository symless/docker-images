FROM fedora:34

ENV VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg

RUN dnf -y update \
    && dnf -y install @development-tools git \
    # synergy requirements
    cmake glib2-devel gdk-pixbuf2-devel libnotify-devel libxkbfile-devel \
    # openssl requirements
    perl \
    # qt5-base requirements
    harfbuzz-devel double-conversion-devel at-spi2-atk-devel dbus-devel \
    mesa-libGL-devel bison gperf \
    xcb-util xcb-util-devel xcb-util-*-devel libXrender-devel \
    libxkbcommon-devel libxkbcommon-x11-devel libXcursor-devel \
    libXcomposite-devel mesa-libGL-devel mesa-libGLU-devel \
    && rm -rf /var/cache/dnf

# Setup vcpkg
RUN git clone --depth=1 https://github.com/Microsoft/vcpkg $VCPKG_INSTALLATION_ROOT \
    && $VCPKG_INSTALLATION_ROOT/bootstrap-vcpkg.sh \
    && $VCPKG_INSTALLATION_ROOT/vcpkg integrate install \
    && chmod 0777 -R $VCPKG_INSTALLATION_ROOT \
    && ln -sf $VCPKG_INSTALLATION_ROOT/vcpkg /usr/local/bin

# Setup vcpkg packages
RUN vcpkg install --clean-after-build openssl qt5-base
