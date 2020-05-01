#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" = "true"  ] || [ "$TRAVIS_BRANCH" != "master"  ]; then
  docker buildx build --progress plain --build-arg SW_VERSION=$SW_VERSION --platform=linux/arm/v7 .
  exit $?
fi
echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin &> /dev/null
docker buildx build --progress plain --build-arg SW_VERSION=$SW_VERSION --platform=linux/arm/v7 -t $TRAVIS_REPO_SLUG:$SW_VERSION --push .
