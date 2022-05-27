#! /bin/bash

rm -rf /__w
mkdir -p /__w/synergy-core
cd /__w/synergy-core || exit
git clone --recurse-submodules https://github.com/symless/synergy-core.git

cd ./synergy-core || exit
WORKSPACE=$(pwd)
export WORKSPACE
GIT_COMMIT=$(git rev-parse HEAD)
export GIT_COMMIT
export DEB_BUILD_OPTIONS='parallel=1'
export SYNERGY_NO_TESTS=1
SYNERGY_REVISION=$(git rev-parse --short=8 HEAD)
export SYNERGY_REVISION

python3 CI/build_version.py
mkdir -p build
cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$(pwd)/rpm/BUILDROOT/usr" ..
. ./version
export SYNERGY_VERSION_STAGE=dev
export SYNERGY_VERSION="$SYNERGY_VERSION_MAJOR.$SYNERGY_VERSION_MINOR.$SYNERGY_VERSION_PATCH"
export SYNERGY_RPM_VERSION="${SYNERGY_VERSION}-${SYNERGY_VERSION_STAGE}.${SYNERGY_REVISION}"
export PACKAGE_NAME=synergy

make
make install/strip
cd rpm || exit
rpmbuild -bb --define "_topdir $(pwd)" --buildroot "$(pwd)/BUILDROOT" synergy.spec
rpmlint --verbose RPMS/*.rpm
cd RPMS || exit
filename=$(ls -- *.rpm)
{
  md5sum "${filename}"
  sha1sum "${filename}"
  sha256sum "${filename}"
} >> "${filename}.checksum.txt"
