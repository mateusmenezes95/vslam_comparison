#!/bin/bash

. parameters.sh

xhost +local:

if [ ! "$(docker ps -q -f name=${IMAGE_NAME}_container)" ]; then
    docker run -it --rm \
        --env="SSH_AUTH_SOCK=$SSH_AUTH_SOCK" \
        --env="TERM" \
        --env="DISPLAY=$DISPLAY" \
        --gpus="all"\
        --name="${IMAGE_NAME}_container" \
        --net host \
        --privileged \
        --runtime="nvidia" \
        --user="${USERNAME}" \
        --volume="$(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK)" \
        --volume="${VOLUME_PATH}:/home/${USERNAME}:rw" \
        --volume="/etc/localtime:/etc/localtime:ro" \
        --volume="/tmp/.X11-unix/:/tmp/.X11-unix:ro" \
        --workdir="/home/${USERNAME}" \
        "${IMAGE_NAME}:latest"
else
    docker exec -ti ${IMAGE_NAME}_container /bin/bash
fi
