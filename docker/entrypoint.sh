#!/bin/bash
set -e

ROS_DISTRO="noetic"
NUM_THREADS=$(($(grep -c processor /proc/cpuinfo)/2))

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
fi

if [ ! -d "${HOME}/openvslam" ]; then
  git clone https://github.com/fabianschenk/openvslam-1.git openvslam &&\
  cd openvslam && \
  mkdir -p build && \
  cd build && \
  cmake \
    -DBUILD_WITH_MARCH_NATIVE=ON \
    -DUSE_PANGOLIN_VIEWER=ON \
    -DUSE_SOCKET_PUBLISHER=OFF \
    -DUSE_STACK_TRACE_LOGGER=ON \
    -DBOW_FRAMEWORK=DBoW2 \
    -DBUILD_TESTS=OFF \
    .. && \
  make -j${NUM_THREADS} && \
  cd ../ros && \
  git clone --branch ${ROS_DISTRO} --depth 1 https://github.com/ros-perception/vision_opencv.git && \
  cp -rf vision_opencv/cv_bridge src/ && \
  rm -rf vision_opencv && \
  . /opt/ros/${ROS_DISTRO}/setup.sh && \
  catkin_make \
    -DBUILD_WITH_MARCH_NATIVE=ON \
    -DUSE_PANGOLIN_VIEWER=ON \
    -DUSE_SOCKET_PUBLISHER=OFF \
    -DUSE_STACK_TRACE_LOGGER=ON \
    -DBOW_FRAMEWORK=DBoW2 && \
  cd ../ && mkdir -p vocabulary && cd vocabulary && \
  wget https://github.com/m-pilia/openvslam-example/blob/master/third_party/vocab/orb_vocab.dbow2
  cd ${HOME}
fi

CATKIN_WS_DIR="catkin_ws"

function cleanup()
{
  # Last command exited with non zero code
  LAST_COMMAND_EXIT_CODE=$?
  echo -e "\033[0;31mCatkin workspace creation failed with exit code ${LAST_COMMAND_EXIT_CODE}!\033[0m"
  if [[ ${LAST_COMMAND_EXIT_CODE} -ne 0 &&  -d "${HOME}/${CATKIN_WS_DIR}" ]]; then
    echo "Removing ${HOME}/${CATKIN_WS_DIR} folder..."
    rm -rf ${HOME}/${CATKIN_WS_DIR}
    echo "Folder ${HOME}/${CATKIN_WS_DIR} removed successfully"
  fi
}

trap cleanup EXIT

if [ ! -d "${HOME}/${CATKIN_WS_DIR}" ]; then
  source /opt/ros/${ROS_DISTRO}/setup.bash
  mkdir -p ${HOME}/${CATKIN_WS_DIR}/src
  cd ${CATKIN_WS_DIR}/src
  git clone https://github.com/thien94/orb_slam3_ros.git
  cd ../
  sudo apt-get update
  rosdep update
  rosdep install --from-paths src --ignore-src -r -y
  catkin config --extend /opt/ros/${ROS_DISTRO}
  catkin build --jobs ${NUM_THREADS}
  source devel/setup.bash
fi

export LD_LIBRARY_PATH="${HOME}/ORB_SLAM3/lib"

exec "$@"
