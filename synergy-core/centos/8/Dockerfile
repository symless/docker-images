FROM centos:8.1.1911

RUN \
   yum -y update && \
   yum -y install dnf-plugins-core && \
   yum -y config-manager --set-enabled powertools

RUN dnf -y update && dnf install -y \
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
    rpm-build \
    rpmlint \
    python3 \
    libnotify-devel \
    glib2-devel \
    gdk-pixbuf2-devel \
    libxkbfile-devel \
    && rm -rf /var/cache/yum
