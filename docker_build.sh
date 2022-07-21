#!/usr/bin/env sh
set -e
echo "Building the docker"
docker build -t wasi-sdk-builder:latest .
echo "Building the package in docker"
# docker run --mount type=bind,src=$PWD,target=/workspace -e NINJA_FLAGS=-v --workdir /workspace wasi-sdk-builder:latest make package
docker run -v $(pwd -P):/opt/wasi-sdk -e NINJA_FLAGS=-v wasi-sdk-builder:latest /bin/bash -c "cd /opt/wasi-sdk; make package"
