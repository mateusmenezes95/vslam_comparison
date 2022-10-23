UUID="$(id -u)"
UGID="$(id -g)"

# Change when desirable
ROS_DISTRO="melodic"
USERNAME=${ROS_DISTRO}
IMAGE_NAME="ros1_${ROS_DISTRO}"
BASE_IMAGE="ros:${ROS_DISTRO}"
OPENCV_VERSION="3.4.16"

VOLUME_PATH=${HOME}/container_volumes/${IMAGE_NAME}
