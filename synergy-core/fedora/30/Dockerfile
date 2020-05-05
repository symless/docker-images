FROM fedora:30

RUN yum -y update && yum install -y \
    avahi-compat-libdns_sd-devel \
    avahi-compat-libdns_sd \
    cmake3 \
    git \
    make \
    libXtst-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    libcurl-devel \
    openssl-devel \
    && rm -rf /var/cache/yum
