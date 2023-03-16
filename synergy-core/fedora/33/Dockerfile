FROM fedora:33

# Update base packages
RUN dnf -y update \
    # Install Synergy core build dependencies
 && dnf -y install \
    avahi-compat-libdns_sd \
    avahi-compat-libdns_sd-devel \
    cmake3 \
    gdk-pixbuf2-devel \
    git \
    glib2-devel \
    gpg \
    libcurl-devel \
    libnotify-devel \
    libxkbfile-devel \
    libXtst-devel \
    make \
    openssl-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qttools-devel \
    rpm-build \
    rpmlint \
 && rm -rf /var/cache/yum \
 && git config --system --add safe.directory '*'
