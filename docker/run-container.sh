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

if [ ! -d "${PROJECT_PATH}/.ssh" ]; then
    if [ ! -d "${HOME}/.ssh" ]; then
        printf "Please, setup ssh keys before running the container\n"
        exit 1
    fi
    cp -R "${HOME}/.ssh" "${PROJECT_PATH}/"
fi

if [ ! -f "${PROJECT_PATH}/.gitconfig" ]; then
    if [ ! -f "${HOME}/.gitconfig" ]; then
        printf "Please, setup git before running the container\n\n"
        printf "Use: \n"
        printf "git config --global user.name \"John Doe\"\n"
        printf "git config --global user.email johndoe@example.com\n"

        exit 1
    fi
    cp "${HOME}/.gitconfig" "${PROJECT_PATH}/"
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
