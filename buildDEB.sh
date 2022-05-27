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

echo "Version Info"
python3 CI/build_version.py
mkdir -p version-info
cd version-info || exit
cmake ..
cd ..
. ./version-info/version
rm -rf version-info
echo "Version Info DONE"

SYNERGY_REVISION=$(git rev-parse --short=8 HEAD)
export SYNERGY_REVISION
export SYNERGY_VERSION_STAGE=dev
export SYNERGY_VERSION="$SYNERGY_VERSION_MAJOR.$SYNERGY_VERSION_MINOR.$SYNERGY_VERSION_PATCH"
export SYNERGY_DEB_VERSION="${SYNERGY_VERSION}.${SYNERGY_VERSION_STAGE}.${SYNERGY_REVISION}"
export PACKAGE_NAME=synergy

echo "Build deb"
echo "$SYNERGY_DEB_VERSION"
sed -i "s/ synergy/ ${PACKAGE_NAME}/g" ./debian/control
python3 CI/deb_changelog.py synergy "$SYNERGY_DEB_VERSION"
debuild --preserve-envvar SYNERGY_* --preserve-envvar GIT_COMMIT -us -uc -rfakeroot
mkdir -p package

cd .. || exit
filename=$(ls "${PACKAGE_NAME}"_*"${SYNERGY_REVISION}"*.deb)
filename_new="${PACKAGE_NAME}_${SYNERGY_VERSION}-${SYNERGY_VERSION_STAGE}.${SYNERGY_REVISION}${filename##*"${SYNERGY_REVISION}"}"
mv "${filename}" "${WORKSPACE}/package/${filename_new}"
cd "${WORKSPACE}/package" || exit
{
  md5sum "${filename_new}"
  sha1sum "${filename_new}"
  sha256sum "${filename_new}"
} >> "${filename_new}.checksum.txt"
