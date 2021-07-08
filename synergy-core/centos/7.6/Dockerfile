FROM centos:7.6.1810

RUN yum install -y \
    http://repo.okay.com.mx/centos/7/x86_64/release/okay-release-1-1.noarch.rpm \
    centos-release-scl

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
    devtoolset-9 \
    rpm-build \
    rpmlint \
    libnotify-devel \
    glib2-devel \
    gdk-pixbuf2-devel \
    && rm -rf /var/cache/yum

ENV PATH=/opt/rh/devtoolset-9/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=/opt/rh/devtoolset-9/root/usr/lib64:/opt/rh/devtoolset-9/root/usr/lib:/opt/rh/devtoolset-9/root/usr/lib64/dyninst:/opt/rh/devtoolset-9/root/usr/lib/dyninst:/opt/rh/devtoolset-9/root/usr/lib64:/opt/rh/devtoolset-9/root/usr/lib