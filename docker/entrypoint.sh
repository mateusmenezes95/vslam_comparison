#!/bin/bash
set -e

ROS_DISTRO="melodic"

if [ ! -f "${HOME}/.bashrc" ]; then
    touch ${HOME}/.bashrc
    wget \
    https://gist.githubusercontent.com/mateusmenezes95/2dbf4d25675aff388f5e4444db320632/raw/pretty_terminal.sh \
    -O - >> ~/.bashrc
    echo $'\n' >> ~/.bashrc
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
fi

if [ ! -d "${HOME}/ORB_SLAM3" ]; then
    git clone https://github.com/mateusmenezes95/ORB_SLAM3.git ORB_SLAM3 &&\
    cd ORB_SLAM3 && \
    chmod +x build.sh && \
    bash ./build.sh

    # TODO: Enable ROS installation of ORBSLAM3
    # RUN apt-get update && \
    #   apt-get install -q -y --no-install-recommends \
    #   ros-${ROS_DISTRO}-tf \
    #   ros-${ROS_DISTRO}-cv-bridge && \
    #   apt-get -y autoremove && \
    #   apt-get clean autoclean && \
    #   rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

    # RUN cd /opt/ORB_SLAM3 && \
    #   sh /opt/ros/${ROS_DISTRO}/setup.sh && \
    #   ./build_ros.sh
fi

export LD_LIBRARY_PATH="${HOME}/ORB_SLAM3/lib"

exec "$@"
