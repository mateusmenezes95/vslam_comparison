#!/bin/bash

. parameters.sh

PROJECT_PATH=${HOME}/container_volumes/${IMAGE_NAME}

if [ ! -d "${PROJECT_PATH}" ]; then
    mkdir -p "${PROJECT_PATH}"

    if [ ! -d "${PROJECT_PATH}" ]; then
        echo "Could not create ${PROJECT}'s home"
        exit 1
    fi
fi

if [ ! "$(docker ps -q -f name=${IMAGE_NAME}_container)" ]; then
    docker run -it --rm \
        --env="SSH_AUTH_SOCK=$SSH_AUTH_SOCK" \
        --env="TERM" \
        --gpus="all"\
        --name="${IMAGE_NAME}_container" \
        --net host \
        --privileged \
        --runtime="nvidia" \
        --user="${USERNAME}" \
        --volume="$(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK)" \
        --volume="${PROJECT_PATH}:/home/${USERNAME}:rw" \
        --volume="/etc/localtime:/etc/localtime:ro" \
        --workdir="/home/${USERNAME}" \
        "${IMAGE_NAME}:latest"
else
    docker exec -ti ${IMAGE_NAME}_container /bin/bash
fi
