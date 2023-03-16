FROM centos:8.1.1911

# Change repos to point at vault.centos.org
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
 && dnf -y update \
 && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* \
 && dnf -y update \
    # Setup dnf plugins and powertools
 && dnf -y install https://packages.endpointdev.com/rhel/8/main/x86_64/endpoint-repo.noarch.rpm \
 && dnf -y install dnf-plugins-core \
 && dnf -y config-manager --set-enabled powertools \
 && dnf -y update \
    # Install Synergy core build dependencies
 && dnf install -y \
    avahi-compat-libdns_sd-devel \
    cmake \
    gcc \
    gcc-c++ \
    gdk-pixbuf2-devel \
    git \
    glib2-devel \
    libcurl-devel \
    libnotify-devel \
    libxkbfile-devel \
    libXtst-devel \
    make \
    openssl-devel \
    python3 \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    rpm-build \
    rpmlint \
 && rm -rf /var/cache/yum \
 && git config --global --add safe.directory '*'
