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

exec "$@"
