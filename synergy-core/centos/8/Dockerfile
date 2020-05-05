FROM centos:8.1.1911

RUN dnf -y update && dnf --enablerepo=PowerTools install -y \
    avahi-compat-libdns_sd-devel \
    cmake \
    git \
    make \
    libXtst-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    libcurl-devel \
    openssl-devel \
    gcc-c++ \
    gcc \
    && rm -rf /var/cache/yum
