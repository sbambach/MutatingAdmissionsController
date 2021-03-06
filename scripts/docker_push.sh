#!/bin/bash
set -e

echo "Starting docker_push script"

DOCKER_REPO=$DOCKER_FOLDER/imagenamemutatingcontroller

docker tag mutatingcontroller $DOCKER_REPO:$TRAVIS_BUILD_NUMBER
docker tag mutatingcontroller $DOCKER_REPO:latest

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $DOCKER_REPO:$TRAVIS_BUILD_NUMBER
docker push $DOCKER_REPO:latest