#!/bin/bash

. parameters.sh

# Checks if git is installed
REQUIRED_PKG="git"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG
fi

if [ ! -d "${VOLUME_PATH}" ]; then
    mkdir -p "${VOLUME_PATH}"

    if [ ! -d "${VOLUME_PATH}" ]; then
        echo "Could not create ${PROJECT}'s home"
        exit 1
    fi
fi

# This number is used in cmake building process
# Using the half of CPUs
NUM_THREADS=$(($(grep -c processor /proc/cpuinfo)/2))

docker build --force-rm -t $IMAGE_NAME \
    --build-arg BASE_IMAGE=$BASE_IMAGE \
    --build-arg ROS_DISTRO=$ROS_DISTRO \
    --build-arg USERNAME=$USERNAME \
    --build-arg UUID=$UUID \
    --build-arg UGID=$UGID \
    --build-arg NUM_THREADS=$NUM_THREADS \
    --build-arg OPENCV_VERSION=$OPENCV_VERSION \
    .
