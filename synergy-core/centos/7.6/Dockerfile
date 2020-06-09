FROM centos:7.6.1810

RUN yum install -y http://repo.okay.com.mx/centos/7/x86_64/release/okay-release-1-1.noarch.rpm

RUN yum -y update && yum install -y \
    avahi-compat-libdns_sd-devel \
    avahi-compat-libdns_sd \
    cmake3 \
    git \
    make \
    make \
    libXtst-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    libcurl-devel \
    openssl-devel \
    gcc-c++ \
    c++ \
    rpm-build \
    rpmlint \
    && rm -rf /var/cache/yum
