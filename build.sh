#!/usr/bin/env bash

set -e

if [ ${1} ]
then
    DOCKER_USER=${1}
else
    DOCKER_USER=${USER}
fi

# Debian 9 (stretch)
docker build --force-rm --tag \
       "${DOCKER_USER}/ansible:debian-9" \
       debian/9
# EOF
