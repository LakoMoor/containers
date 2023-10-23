#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

if [ "${DISTRO}" == "oracle7" ]; then
  DISTRO=centos
elif [ "${DISTRO}" == "oracle8" ]; then
  DISTRO=oracle
fi

COMMIT_ID="1631ff2c5f79ff6892c1d357343c47cb6f7c7a29"
BRANCH="develop"
COMMIT_ID_SHORT=$(echo "${COMMIT_ID}" | cut -c1-6)

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')

mkdir -p $STARTUPDIR/webcam
wget -qO- https://kasmweb-build-artifacts.s3.amazonaws.com/kasm_webcam_server/${COMMIT_ID}/kasm_webcam_server_${ARCH}_${BRANCH}.${COMMIT_ID_SHORT}.tar.gz | tar -xvz -C $STARTUPDIR/webcam/

echo "${BRANCH}:${COMMIT_ID}" > $STARTUPDIR/webcam/kasm_webcam_server.version