#!/bin/bash
set -e

if [ ! -f "${HOME}/.bashrc" ]; then
    touch ${HOME}/.bashrc
    wget \
    https://gist.githubusercontent.com/mateusmenezes95/2dbf4d25675aff388f5e4444db320632/raw/pretty_terminal.sh \
    -O - >> ~/.bashrc
    echo $'\n' >> ~/.bashrc
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
fi

exec "$@"
