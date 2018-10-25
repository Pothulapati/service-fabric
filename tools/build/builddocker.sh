#!/bin/bash
set -ex

CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT=$CDIR/../../
DOCKERIMAGE_VERSION=`cat $REPO_ROOT/tools/build/DOCKERIMAGE_VERSION`
REGISTRY=microsoft
IMAGE_NAME=service-fabric-build-ubuntu


BUILD_IMAGE_PATH=$REPO_ROOT/tools/build/Dockerfile

docker build -t $REGISTRY/$IMAGE_NAME:latest -f $BUILD_IMAGE_PATH $REPO_ROOT
docker tag $REGISTRY/$IMAGE_NAME:latest $REGISTRY/$IMAGE_NAME:$DOCKERIMAGE_VERSION

# Release the official images to the registry.  Credentials required
if [ "$1" == "release" ]; then
    docker push $REGISTRY/$IMAGE_NAME:latest
    docker push $REGISTRY/$IMAGE_NAME:$DOCKERIMAGE_VERSION
fi
