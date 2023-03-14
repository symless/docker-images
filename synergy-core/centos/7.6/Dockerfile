FROM centos:7.6.1810

# Setup extra repositories
# ulimit is here to speed up yum https://stackoverflow.com/a/73196257
RUN ulimit -n 2048 \
 && yum -y install centos-release-scl epel-release \
 # Setup endpointdev.com packages
 && yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm \
 && yum -y update \
 # Install Synergy core build dependencies
 && yum -y install \
    avahi-compat-libdns_sd \
    avahi-compat-libdns_sd-devel \
    cmake3 \
    devtoolset-9 \
    gdk-pixbuf2-devel \
    git \
    glib2-devel \
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
 && ln -s $(which cmake3) /usr/bin/cmake

ENV PATH=/opt/rh/devtoolset-9/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=/opt/rh/devtoolset-9/root/usr/lib64:/opt/rh/devtoolset-9/root/usr/lib:/opt/rh/devtoolset-9/root/usr/lib64/dyninst:/opt/rh/devtoolset-9/root/usr/lib/dyninst:/opt/rh/devtoolset-9/root/usr/lib64:/opt/rh/devtoolset-9/root/usr/lib
