#!/bin/bash

. parameters.sh

docker build --force-rm -t $IMAGE_NAME \
    --build-arg USERNAME=$USERNAME \
    --build-arg UUID=$UUID \
    --build-arg UGID=$UGID \
    .
