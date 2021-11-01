FROM fedora:28

RUN yum -y update && yum install -y \
    avahi-compat-libdns_sd-devel \
    avahi-compat-libdns_sd \
    cmake3 \
    git \
    gpg \
    make \
    libXtst-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    libcurl-devel \
    openssl-devel \
    rpm-build \
    rpmlint \
    libnotify-devel \
    glib2-devel \
    gdk-pixbuf2-devel \
    libxkbfile-devel \
    && rm -rf /var/cache/yum
